open Ir
open Asm

let compile_value (o : Ir.value) : Asm.operand =
  match o with Constant n -> Imm n | Var i -> Pseudo i

let compile_unary_operator (uop : Ir.unary_operator) : Asm.unary_operator =
  match uop with BwNot -> Not | Negate -> Neg

let compile_binary_operator (bop : Ir.binary_operator) : Asm.binary_operator =
  match bop with
  | Add -> Add
  | Subtract -> Sub
  | Multiply -> Mult
  | Divide -> failwith "Cannot directly compile IR Divide to ASM Binary"
  | Remainder -> failwith "Cannot directly compile IR Remainder to ASM Binary"

let compile_instruction (s : Ir.instruction) : Asm.instruction list =
  match s with
  | Return v ->
      let ret = compile_value v in
      let mov = Mov { src = ret; dst = Reg AX } in
      [ mov; Ret ]
  | Unary { op; src; dst } ->
      let uop = compile_unary_operator op in
      let uin = Unary { uop; dst = compile_value dst } in
      let mov = Mov { src = compile_value src; dst = compile_value dst } in
      [ mov; uin ]
  | Binary { op = Divide; src1; src2; dst } ->
      let mov1 = Mov { src = compile_value src1; dst = Reg AX } in
      let idiv = Idiv (compile_value src2) in
      let mov2 = Mov { src = Reg AX; dst = compile_value dst } in
      [ mov1; Cdq; idiv; mov2 ]
  | Binary { op = Remainder; src1; src2; dst } ->
      let mov1 = Mov { src = compile_value src1; dst = Reg AX } in
      let idiv = Idiv (compile_value src2) in
      let mov2 = Mov { src = Reg DX; dst = compile_value dst } in
      [ mov1; Cdq; idiv; mov2 ]
  | Binary { op; src1; src2; dst } ->
      let bop = compile_binary_operator op in
      let bin =
        Binary { bop; src2 = compile_value src2; dst = compile_value dst }
      in
      let mov = Mov { src = compile_value src1; dst = compile_value dst } in
      [ mov; bin ]

let compile_func (f : Ir.func) : Asm.func =
  match f with
  | Function fn ->
      let instructions =
        List.map (fun instr -> compile_instruction instr) fn.body
        |> List.flatten
      in
      Function { name = fn.name; instructions }

let compile_prog (Program f : Ir.prog) : Asm.prog =
  let compiled_f = compile_func f in
  Program compiled_f
