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
  | Conditional { cond_exp; then_exp; else_exp } ->
      Conditional
        {
          cond_exp = resolve_expr scope cond_exp e;
          then_exp = resolve_expr scope then_exp e;
          else_exp = resolve_expr scope else_exp e;
        }

let resolve_decl (scope : ident) (d : decl) (e : senv) : decl =
  match d with
  | Declaration (id, None) ->
      let var = declare_var scope id e in
      Declaration (var, None)
  | Declaration (id, Some expr) ->
      let var = declare_var scope id e in
      let init = Some (resolve_expr scope expr e) in
      Declaration (var, init)

let rec resolve_stmt (scope : ident) (s : stmt) (e : senv) : stmt =
  match s with
  | Return expr -> Return (resolve_expr scope expr e)
  | Expression expr -> Expression (resolve_expr scope expr e)
  | If { cond_exp; then_smt; else_smt = None } ->
      If
        {
          cond_exp = resolve_expr scope cond_exp e;
          then_smt = resolve_stmt scope then_smt e;
          else_smt = None;
        }
  | If { cond_exp; then_smt; else_smt = Some stmt } ->
      If
        {
          cond_exp = resolve_expr scope cond_exp e;
          then_smt = resolve_stmt scope then_smt e;
          else_smt = Some (resolve_stmt scope stmt e);
        }
  | Compound b -> Compound (resolve_block scope b e)
  (* goto label resolution cannot be completed until after analysis pass *)
  | Goto id -> Goto id
  | Label (id, s) ->
      Label (declare_scoped_label scope id e, resolve_stmt scope s e)
  | Null -> Null

and resolve_func (f : Ast.func) (e : senv) : Ast.func =
  match f with
  | Function fn ->
      let body = resolve_block fn.name fn.body e in
      Function { name = fn.name; body; return_type = fn.return_type }

and resolve_block (scope : ident) (items : block) (e : senv) : block =
  let (Block item_list) = items in
  let resolved_items =
    List.map
      (fun item ->
        match item with
        | D d -> D (resolve_decl scope d e)
        | S s -> S (resolve_stmt scope s e))
      item_list
  in
  Block resolved_items

let resolve_prog (Program f : Ast.prog) (e : Env.senv) : Ast.prog =
  Program (resolve_func f e)
