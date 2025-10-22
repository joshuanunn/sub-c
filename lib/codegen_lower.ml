open Asm
open Env

(** [lower_operand o le] replaces a pseudo operand with a concrete stack
    operand, using the variable-to-offset mapping in the environment [le]. All
    other operands are returned unchanged. *)
let lower_operand (o : Asm.operand) (le : Env.lenv) : Asm.operand =
  match o with Pseudo v -> Stack (get_value_offset v le) | _ -> o

(** [lower_instruction i le] lowers any pseudo-registers in the instruction [i]
    by replacing them with stack operands, using the environment [le]. *)
let lower_instruction (i : Asm.instruction) (le : Env.lenv) : Asm.instruction =
  match i with
  | Mov (src, dst) -> Mov (lower_operand src le, lower_operand dst le)
  | Unary { op; dst } -> Unary { op; dst = lower_operand dst le }
  | Binary { op; src; dst } ->
      Binary { op; src = lower_operand src le; dst = lower_operand dst le }
  | Cmp (op1, op2) -> Cmp (lower_operand op1 le, lower_operand op2 le)
  | Shl (src, dst) -> Shl (lower_operand src le, lower_operand dst le)
  | Sar (src, dst) -> Sar (lower_operand src le, lower_operand dst le)
  | SetCC (cc, op) -> SetCC (cc, lower_operand op le)
  | Idiv dst -> Idiv (lower_operand dst le)
  | _ -> i

(** [lower_func f le] lowers all pseudo operands in the function [f], producing
    a new function where all variables have been resolved to stack locations via
    the environment [le]. *)
let lower_func (f : Asm.func) (le : Env.lenv) : Asm.func =
  match f with
  | Function fn ->
      let lowered_instructions =
        fn.instructions |> List.map (fun instr -> lower_instruction instr le)
      in
      Function { name = fn.name; instructions = lowered_instructions }

(** [lower_prog p le] lowers all pseudo operands in the program [p], returning a
    new program where pseudo registers have been replaced with stack-based
    addressing using the environment [le]. *)
let lower_prog (Program p) (le : Env.lenv) : Asm.prog =
  Program (lower_func p le)
