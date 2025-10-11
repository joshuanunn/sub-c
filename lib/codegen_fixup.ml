open Asm
open Env

let binary_mem_mem_fix op s d =
  [ Mov (Stack s, Reg R10); Binary { op; src = Reg R10; dst = Stack d } ]

let setcc_low_byte_fix cc hi lo =
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
  | Mov (Stack s, Stack d) -> [ Mov (Stack s, Reg R10); Mov (Reg R10, Stack d) ]
  (* cmp cannot use memory addresses as both source and destination *)
  | Cmp (Stack s, Stack d) -> [ Mov (Stack s, Reg R10); Cmp (Reg R10, Stack d) ]
  (* binary ops that cannot use memory addresses as both src and dest *)
  | Binary { op = Add; src = Stack s; dst = Stack d } ->
      binary_mem_mem_fix Add s d
  | Binary { op = Sub; src = Stack s; dst = Stack d } ->
      binary_mem_mem_fix Sub s d
  | Binary { op = BwAnd; src = Stack s; dst = Stack d } ->
      binary_mem_mem_fix BwAnd s d
  | Binary { op = BwXor; src = Stack s; dst = Stack d } ->
      binary_mem_mem_fix BwXor s d
  | Binary { op = BwOr; src = Stack s; dst = Stack d } ->
      binary_mem_mem_fix BwOr s d
  (* mul cannot have memory address or constant as destination *)
  | Binary { op = Mult; src; dst } -> (
      match dst with
      | Stack _ | Imm _ ->
          [
            Mov (dst, Reg R11);
            Binary { op = Mult; src; dst = Reg R11 };
            Mov (Reg R11, dst);
          ]
      | _ -> [ i ])
  (* binary ops that cannot operate on constant values *)
  | Binary { op = Add; src; dst = Imm d } ->
      [ Mov (Imm d, Reg R11); Binary { op = Add; src; dst = Reg R11 } ]
  | Binary { op = Sub; src; dst = Imm d } ->
      [ Mov (Imm d, Reg R11); Binary { op = Sub; src; dst = Reg R11 } ]
  (* div cannot operate on constant values *)
  | Idiv (Imm c) -> [ Mov (Imm c, Reg R10); Idiv (Reg R10) ]
  (* cmp cannot operate on constant values *)
  | Cmp (s, Imm d) -> [ Mov (Imm d, Reg R11); Cmp (s, Reg R11) ]
  (* set can only operate on 8-bit named registers *)
  | SetCC (cc, Reg AX) -> setcc_low_byte_fix cc AX AL
  | SetCC (cc, Reg DX) -> setcc_low_byte_fix cc DX DL
  | SetCC (cc, Reg R10) -> setcc_low_byte_fix cc R10 R10B
  | SetCC (cc, Reg R11) -> setcc_low_byte_fix cc R11 R11B
  | _ -> [ i ]

(** [fixup_func f e] rewrites any invalid instructions in the function [f] by
    applying [fixup_instruction] to each instruction. It also prepends a stack
    allocation instruction based on the environment [e], if necessary. This may
    expand a single instruction into multiple valid ones. *)
let fixup_func (f : Asm.func) (e : Env.senv) : Asm.func =
  match f with
  | Function fn ->
      let fixed_func_instrs =
        fn.instructions
        |> List.concat_map (fun instr -> fixup_instruction instr)
      in
      let stack_alloc_instrs =
        if e.offset <> 0 then [ AllocateStack (-e.offset) ] else []
      in
      Function
        {
          name = fn.name;
          instructions = stack_alloc_instrs @ fixed_func_instrs;
        }

(** [fixup_prog p e] rewrites the assembly program [p] by fixing up any invalid
    instructions in each function and prepending stack allocation based on the
    environment [e]. This ensures the resulting program only contains valid
    x86-64 instructions. *)
let fixup_prog (Program p) (e : Env.senv) : Asm.prog = Program (fixup_func p e)
