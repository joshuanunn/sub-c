open Ast
open Ir

let compile_expr (e : Ast.expr) : Ir.value =
  match e with LiteralInt n -> Constant n

let compile_stmt (s : Ast.stmt) : Ir.instruction list =
  match s with
  | Return e ->
      let ret = compile_expr e in
      [ Return ret ]

let compile_func (f : Ast.func) : Ir.func =
  match f with
  | Function fn ->
      let body = compile_stmt fn.body in
      Function { name = fn.name; body }

let compile_prog (p : Ast.prog) : Ir.prog =
  match p with
  | Program f ->
      let compiled_f = compile_func f in
      Program compiled_f
