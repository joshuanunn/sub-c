open Ast
open Env
open Ir

let convert_unop (u : Ast.unop) : Ir.unary_operator =
  match u with Complement -> Ir.Complement | Negate -> Ir.Negate

let rec convert_expr (v : Ast.expr) (e : Env.senv) :
    Ir.value * Ir.instruction list =
  match v with
  | LiteralInt n -> (Constant n, [])
  | Unary { unary_operator : unop; exp : expr } ->
      let op = convert_unop unary_operator in
      let src, src_instructions = convert_expr exp e in
      let dst = Var (alloc_senv_value e "tmp") in
      let instruction = Unary { op; src; dst } in
      (dst, src_instructions @ [ instruction ])

let convert_stmt (s : Ast.stmt) (e : Env.senv) : Ir.instruction list =
  match s with
  | Return v ->
      let value, instructions = convert_expr v e in
      instructions @ [ Return value ]

let convert_func (f : Ast.func) (e : Env.senv) : Ir.func =
  match f with
  | Function fn ->
      let body = convert_stmt fn.body e in
      Function { name = fn.name; body }

let convert_prog (Program f : Ast.prog) : Ir.prog * Env.senv =
  (* Initialise a new environment *)
  let e = Env.make_senv () in
  let compiled_f = convert_func f e in
  (Program compiled_f, e)
