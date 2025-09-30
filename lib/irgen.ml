open Ast
open Env
open Ir

let convert_unop (u : Ast.unop) : Ir.unary_operator =
  match u with Complement -> Complement | Negate -> Negate

let convert_binop (u : Ast.binop) : Ir.binary_operator =
  match u with
  | Add -> Add
  | Subtract -> Subtract
  | Multiply -> Multiply
  | Divide -> Divide
  | Remainder -> Remainder

let rec convert_expr (v : Ast.expr) (e : Env.senv) :
    Ir.value * Ir.instruction list =
  match v with
  | LiteralInt n -> (Constant n, [])
  | Unary { op : unop; exp : expr } ->
      let op = convert_unop op in
      let src, src_instructions = convert_expr exp e in
      let dst = Var (alloc_senv_value e "tmp") in
      let instruction = Unary { op; src; dst } in
      (dst, src_instructions @ [ instruction ])
  | Binary { op : binop; left : expr; right : expr } ->
      let op = convert_binop op in
      let src1, src1_instructions = convert_expr left e in
      let src2, src2_instructions = convert_expr right e in
      let dst = Var (alloc_senv_value e "tmp") in
      let instruction = Binary { op; src1; src2; dst } in
      (dst, src1_instructions @ src2_instructions @ [ instruction ])

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
