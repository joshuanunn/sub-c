open Ast
open Asm

let compile_expr (e : Ast.expr) : Asm.operand =
  match e with LiteralInt n -> Asm.Imm n

let compile_stmt (s : Ast.stmt) : Asm.instruction list =
  match s with
  | Return e ->
      let ret = compile_expr e in
      let mov = Asm.Mov { src = ret; dst = Asm.Register "eax" } in
      [ mov; Asm.Ret ]

let compile_func (f : Ast.func) : Asm.func =
  match f with
  | Function fn ->
      let body = compile_stmt fn.body in
      Function { name = fn.name; instructions = body }

let compile_prog (p : Ast.prog) : Asm.prog =
  match p with
  | Program f ->
      let compiled_f = compile_func f in
      Program compiled_f
