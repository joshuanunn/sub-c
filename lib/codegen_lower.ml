(** Resolve a pseudo operand to either a data-section reference (for static
    storage) or a stack slot (for automatic storage), leaving other operands
    unchanged. *)
let lower_operand (o : Asm.operand) (te : Env.tenv) (le : Env.lenv) :
    Asm.operand =
  match o with
  (* Pseudo v -> Stack (Env.get_value_offset le v) *)
  | Pseudo v ->
      if Env.is_static_name te v then Asm.Data v
      else Asm.Stack (Env.get_value_offset le v)
  | _ -> o

(** Lowers any pseudo-registers in the instruction [i], replacing them with
    stack operands or data-section references. *)
let lower_instruction (i : Asm.instruction) (te : Env.tenv) (le : Env.lenv) :
    Asm.instruction =
  match i with
  | Mov (src, dst) -> Mov (lower_operand src te le, lower_operand dst te le)
  | Unary { op; dst } -> Unary { op; dst = lower_operand dst te le }
  | Binary { op; src; dst } ->
      Binary
        { op; src = lower_operand src te le; dst = lower_operand dst te le }
  | Cmp (op1, op2) -> Cmp (lower_operand op1 te le, lower_operand op2 te le)
  | Shl (src, dst) -> Shl (lower_operand src te le, lower_operand dst te le)
  | Sar (src, dst) -> Sar (lower_operand src te le, lower_operand dst te le)
  | SetCC (cc, op) -> SetCC (cc, lower_operand op te le)
  | Idiv dst -> Idiv (lower_operand dst te le)
  | Push src -> Push (lower_operand src te le)
  | _ -> i

(** Lowers all pseudo operands in the function [f], where all variables have
    been resolved to stack locations or data-section references. *)
let lower_func (f : Asm.top_level) (te : Env.tenv) : Asm.top_level =
  match f with
  | Function fn ->
      let lowered_instructions =
        fn.instructions
        |> List.map (fun instr -> lower_instruction instr te fn.frame)
      in
      Function
        {
          name = fn.name;
          global = fn.global;
          instructions = lowered_instructions;
          frame = fn.frame;
        }
  | StaticVariable v -> StaticVariable v

(** Lowers all pseudo operands in the program [p], with pseudo registers
    replaced with stack-based addressing or data-section references. *)
let lower_prog (Asm.Program p) (te : Env.tenv) : Asm.prog =
  let lowered_funcs = List.map (fun func -> lower_func func te) p in
  Program lowered_funcs
