open Ir
open Asm

let compile_value (o : Ir.value) : Asm.operand =
  match o with Constant n -> Imm n

let compile_instruction (s : Ir.instruction) : Asm.instruction list =
  match s with
  | Return v ->
      let ret = compile_value v in
      let mov = Mov { src = ret; dst = Register "eax" } in
      [ mov; Ret ]

let compile_func (f : Ir.func) : Asm.func =
  match f with
  | Function fn ->
      let instructions =
        List.map (fun instr -> compile_instruction instr) fn.body
        |> List.flatten
      in
      Function { name = fn.name; instructions }

let compile_prog (p : Ir.prog) : Asm.prog =
  match p with
  | Program f ->
      let compiled_f = compile_func f in
      Program compiled_f
