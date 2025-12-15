(** [lower_operand o le] replaces a pseudo operand with a concrete stack
    operand, using the variable-to-offset mapping in the function frame [le].
    All other operands are returned unchanged. *)
let lower_operand (o : Asm.operand) (le : Env.lenv) : Asm.operand =
  match o with Pseudo v -> Stack (Env.get_value_offset le v) | _ -> o

(** [lower_instruction i le] lowers any pseudo-registers in the instruction [i],
    replacing them with stack operands using the function frame [le]. *)
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
  | Push src -> Push (lower_operand src le)
  | _ -> i

(** [lower_func f] lowers all pseudo operands in the function [f], producing a
    new function where all variables have been resolved to stack locations. *)
let lower_func (f : Asm.func) : Asm.func =
  match f with
  | Function fn ->
      let lowered_instructions =
        fn.instructions
        |> List.map (fun instr -> lower_instruction instr fn.frame)
      in
      Function
        {
          name = fn.name;
          instructions = lowered_instructions;
          frame = fn.frame;
        }

(** [lower_prog p] lowers all pseudo operands in the program [p], returning a
    new program with pseudo registers replaced with stack-based addressing. *)
let lower_prog (Asm.Program p) : Asm.prog =
  let lowered_funcs = List.map lower_func p in
  Program lowered_funcs
