let is_mem_operand = function Asm.Stack _ | Asm.Data _ -> true | _ -> false

let binary_mem_mem_fix (op : Asm.binary_operator) (src : Asm.operand)
    (dst : Asm.operand) : Asm.instruction list =
  [ Mov (src, Reg R10); Binary { op; src = Reg R10; dst } ]

let setcc_low_byte_fix (cc : Asm.cond_code) (hi : Asm.reg) (lo : Asm.reg) :
    Asm.instruction list =
  [
    (* zero out hi register *)
    Binary { op = BwXor; src = Reg hi; dst = Reg hi };
    (* set on low byte *)
    SetCC (cc, Reg lo);
  ]

(** [fixup_instruction i] rewrites the instruction [i] if it is invalid in
    x86-64, such as a move from one stack location to another. In such cases, it
    inserts an intermediate move through a temporary register (e.g., R10). All
    other instructions are returned unchanged. *)
let fixup_instruction (i : Asm.instruction) : Asm.instruction list =
  match i with
  (* mov cannot use memory addresses as both source and destination *)
  | Mov (src, dst) when is_mem_operand src && is_mem_operand dst ->
      [ Mov (src, Reg R10); Mov (Reg R10, dst) ]
  (* cmp cannot use memory addresses as both source and destination *)
  | Cmp (src, dst) when is_mem_operand src && is_mem_operand dst ->
      [ Mov (src, Reg R10); Cmp (Reg R10, dst) ]
  (* mul cannot have memory address or constant as destination *)
  | Binary { op = Mult; src; dst } -> (
      match dst with
      | Stack _ | Data _ | Imm _ ->
          [
            Mov (dst, Reg R11);
            Binary { op = Mult; src; dst = Reg R11 };
            Mov (Reg R11, dst);
          ]
      | _ -> [ i ])
  (* other binary ops that cannot use memory addresses as both src and dest *)
  | Binary { op; src; dst } when is_mem_operand src && is_mem_operand dst ->
      binary_mem_mem_fix op src dst
  (* binary ops that cannot operate on constant values *)
  | Binary { op = Add; src; dst = Imm d } ->
      [ Mov (Imm d, Reg R11); Binary { op = Add; src; dst = Reg R11 } ]
  | Binary { op = Sub; src; dst = Imm d } ->
      [ Mov (Imm d, Reg R11); Binary { op = Sub; src; dst = Reg R11 } ]
  (* div cannot operate on constant values *)
  | Idiv (Imm c) -> [ Mov (Imm c, Reg R10); Idiv (Reg R10) ]
  (* cmp cannot operate on constant values *)
  | Cmp (s, Imm d) -> [ Mov (Imm d, Reg R11); Cmp (s, Reg R11) ]
  | _ -> [ i ]

(** [fixup_func f] rewrites any invalid instructions in the function [f] by
    applying [fixup_instruction] to each instruction. It also prepends a stack
    allocation instruction based on the function frame, if necessary. This may
    expand a single instruction into multiple valid ones. *)
let fixup_func (f : Asm.top_level) : Asm.top_level =
  match f with
  | Function fn ->
      let fixed_func_instrs =
        fn.instructions
        |> List.concat_map (fun instr -> fixup_instruction instr)
      in
      (* Align function stack size to nearest 16 bytes *)
      let stack_size = -fn.frame.offset in
      let aligned_size = (stack_size + 15) / 16 * 16 in
      let stack_alloc_instrs =
        if fn.frame.offset <> 0 then [ Asm.AllocateStack aligned_size ] else []
      in
      Function
        {
          name = fn.name;
          global = fn.global;
          instructions = stack_alloc_instrs @ fixed_func_instrs;
          frame = fn.frame;
        }
  | StaticVariable v -> StaticVariable v

(** [fixup_prog p] rewrites the assembly program [p] by fixing up any invalid
    instructions in each function and prepending stack allocation based on the
    funtion frame. *)
let fixup_prog (Asm.Program p) : Asm.prog =
  let fixed_funcs = List.map fixup_func p in
  Program fixed_funcs
