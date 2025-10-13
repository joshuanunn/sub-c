open Ast
open Env

let rec resolve_expr (scope : ident) (exp : expr) (e : senv) : expr =
  match exp with
  | LiteralInt i -> LiteralInt i
  | Var v -> Var (resolve_var scope v e)
  | Unary { op; exp } -> Unary { op; exp = resolve_expr scope exp e }
  | Binary { op; left; right } ->
      Binary
        {
          op;
          left = resolve_expr scope left e;
          right = resolve_expr scope right e;
        }
  | Assignment (lvalue, rvalue) -> (
      match lvalue with
      | Var _ ->
          Assignment (resolve_expr scope lvalue e, resolve_expr scope rvalue e)
      | _ -> failwith "lvalues in assignments must be variables")

let resolve_decl (scope : ident) (d : decl) (e : senv) : decl =
  match d with
  | Declaration (id, None) -> Declaration (declare_var scope id e, None)
  | Declaration (id, Some expr) ->
      Declaration (declare_var scope id e, Some (resolve_expr scope expr e))

let resolve_stmt (scope : ident) (s : stmt) (e : senv) : stmt =
  match s with
  | Return expr -> Return (resolve_expr scope expr e)
  | Expression expr -> Expression (resolve_expr scope expr e)
  | Null -> Null

let resolve_block (scope : ident) (items : block) (e : senv) : block =
  List.map
    (fun item ->
      match item with
      | D d -> D (resolve_decl scope d e)
      | S s -> S (resolve_stmt scope s e))
    items

let resolve_func (f : Ast.func) (e : senv) : Ast.func =
  match f with
  | Function fn ->
      let body = resolve_block fn.name fn.body e in
      Function { name = fn.name; body; return_type = fn.return_type }

let resolve_prog (Program f : Ast.prog) (e : Env.senv) : Ast.prog =
  Program (resolve_func f e)
