open Asm
open Env

let binary_mem_mem_fix bop s d =
  [
    Mov { src = Stack s; dst = Reg R10 };
    Binary { bop; src2 = Reg R10; dst = Stack d };
  ]

(** [fixup_instruction i] rewrites the instruction [i] if it is invalid in
    x86-64, such as a move from one stack location to another. In such cases, it
    inserts an intermediate move through a temporary register (e.g., R10). All
    other instructions are returned unchanged. *)
let fixup_instruction (i : Asm.instruction) : Asm.instruction list =
  match i with
  (* mov cannot use memory addresses as both source and destination *)
  | Mov { src = Stack s; dst = Stack d } ->
      [
        Mov { src = Stack s; dst = Reg R10 };
        Mov { src = Reg R10; dst = Stack d };
      ]
  (* binary ops that cannot use memory addresses as both src and dest *)
  | Binary { bop = Add; src2 = Stack s; dst = Stack d } ->
      binary_mem_mem_fix Add s d
  | Binary { bop = Sub; src2 = Stack s; dst = Stack d } ->
      binary_mem_mem_fix Sub s d
  | Binary { bop = BwAnd; src2 = Stack s; dst = Stack d } ->
      binary_mem_mem_fix BwAnd s d
  | Binary { bop = BwXor; src2 = Stack s; dst = Stack d } ->
      binary_mem_mem_fix BwXor s d
  | Binary { bop = BwOr; src2 = Stack s; dst = Stack d } ->
      binary_mem_mem_fix BwOr s d
  (* mul cannot have memory address as destination, regardless of source *)
  | Binary { bop = Mult; src2 = s; dst = Stack d } ->
      [
        Mov { src = Stack d; dst = Reg R11 };
        Binary { bop = Mult; src2 = s; dst = Reg R11 };
        Mov { src = Reg R11; dst = Stack d };
      ]
  (* div cannot operate on constant values *)
  | Idiv (Imm c) -> [ Mov { src = Imm c; dst = Reg R10 }; Idiv (Reg R10) ]
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
