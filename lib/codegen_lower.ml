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
  | Mov (src, dst) ->
      let s = lower_operand src e in
      let d = lower_operand dst e in
      Mov (s, d)
  | Unary { op; dst } ->
      let d = lower_operand dst e in
      Unary { op; dst = d }
  | Binary { op; src; dst } ->
      let s = lower_operand src e in
      let d = lower_operand dst e in
      Binary { op; src = s; dst = d }
  | Cmp (op1, op2) ->
      let o1 = lower_operand op1 e in
      let o2 = lower_operand op2 e in
      Cmp (o1, o2)
  | Shl (src, dst) ->
      let s = lower_operand src e in
      let d = lower_operand dst e in
      Shl (s, d)
  | Sar (src, dst) ->
      let s = lower_operand src e in
      let d = lower_operand dst e in
      Sar (s, d)
  | SetCC (cc, op) ->
      let o = lower_operand op e in
      SetCC (cc, o)
  | Idiv dst ->
      let d = lower_operand dst e in
      Idiv d
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
