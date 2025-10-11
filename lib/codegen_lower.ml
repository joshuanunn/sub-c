open Asm
open Env

(** [lower_operand o e] replaces a pseudo operand with a concrete stack operand,
    using the variable-to-offset mapping in the environment [e]. All other
    operands are returned unchanged. *)
let lower_operand (o : Asm.operand) (e : Env.senv) : Asm.operand =
  match o with Pseudo v -> Stack (get_senv_offset e v) | _ -> o

(** [lower_instruction i e] lowers any pseudo-registers in the instruction [i]
    by replacing them with stack operands, using the environment [e]. *)
let lower_instruction (i : Asm.instruction) (e : Env.senv) : Asm.instruction =
  match i with
  | Mov (src, dst) -> Mov (lower_operand src e, lower_operand dst e)
  | Unary { op; dst } -> Unary { op; dst = lower_operand dst e }
  | Binary { op; src; dst } ->
      Binary { op; src = lower_operand src e; dst = lower_operand dst e }
  | Cmp (op1, op2) -> Cmp (lower_operand op1 e, lower_operand op2 e)
  | Shl (src, dst) -> Shl (lower_operand src e, lower_operand dst e)
  | Sar (src, dst) -> Sar (lower_operand src e, lower_operand dst e)
  | SetCC (cc, op) -> SetCC (cc, lower_operand op e)
  | Idiv dst -> Idiv (lower_operand dst e)
  | _ -> i

(** [lower_func f e] lowers all pseudo operands in the function [f], producing a
    new function where all variables have been resolved to stack locations via
    the environment [e]. *)
let lower_func (f : Asm.func) (e : Env.senv) : Asm.func =
  match f with
  | Function fn ->
      let lowered_instructions =
        fn.instructions |> List.map (fun instr -> lower_instruction instr e)
      in
      Function { name = fn.name; instructions = lowered_instructions }

(** [lower_prog p e] lowers all pseudo operands in the program [p], returning a
    new program where pseudo registers have been replaced with stack-based
    addressing using the environment [e]. *)
let lower_prog (Program p) (e : Env.senv) : Asm.prog = Program (lower_func p e)
