open Ast
open Env

let rec resolve_expr (scope : Ast.ident) (e : Ast.expr) (se : Env.senv) :
    Ast.expr =
  match e with
  | LiteralInt i -> LiteralInt i
  | Var v -> Var (resolve_var scope v se)
  | Unary { op; exp } -> Unary { op; exp = resolve_expr scope exp se }
  | Binary { op; left; right } ->
      Binary
        {
          op;
          left = resolve_expr scope left se;
          right = resolve_expr scope right se;
        }
  | Assignment (lvalue, rvalue) -> (
      match lvalue with
      | Var _ ->
          Assignment (resolve_expr scope lvalue se, resolve_expr scope rvalue se)
      | _ -> failwith "lvalues in assignments must be variables")
  | Conditional { cond_exp; then_exp; else_exp } ->
      Conditional
        {
          cond_exp = resolve_expr scope cond_exp se;
          then_exp = resolve_expr scope then_exp se;
          else_exp = resolve_expr scope else_exp se;
        }

let resolve_decl (scope : Ast.ident) (d : Ast.decl) (se : Env.senv) : Ast.decl =
  match d with
  | Declaration (id, None) ->
      let var = declare_var scope id se in
      Declaration (var, None)
  | Declaration (id, Some expr) ->
      let var = declare_var scope id se in
      let init = Some (resolve_expr scope expr se) in
      Declaration (var, init)

let rec resolve_stmt (scope : Ast.ident) (s : Ast.stmt) (se : Env.senv) :
    Ast.stmt =
  match s with
  | Return expr -> Return (resolve_expr scope expr se)
  | Expression expr -> Expression (resolve_expr scope expr se)
  | If { cond_exp; then_smt; else_smt = None } ->
      If
        {
          cond_exp = resolve_expr scope cond_exp se;
          then_smt = resolve_stmt scope then_smt se;
          else_smt = None;
        }
  | If { cond_exp; then_smt; else_smt = Some stmt } ->
      If
        {
          cond_exp = resolve_expr scope cond_exp se;
          then_smt = resolve_stmt scope then_smt se;
          else_smt = Some (resolve_stmt scope stmt se);
        }
  | Compound b -> Compound (resolve_block scope b se)
  (* goto label resolution cannot be completed until after analysis pass *)
  | Goto id -> Goto id
  | Label (id, s) ->
      Label (declare_scoped_label scope id se, resolve_stmt scope s se)
  | Null -> Null

and resolve_func (f : Ast.func) (se : Env.senv) : Ast.func =
  match f with
  | Function fn ->
      let body = resolve_block fn.name fn.body se in
      Function { name = fn.name; body; return_type = fn.return_type }

and resolve_block (scope : Ast.ident) (b : Ast.block) (se : Env.senv) :
    Ast.block =
  let (Block item_list) = b in
  let resolved_items =
    List.map
      (fun item ->
        match item with
        | D d -> D (resolve_decl scope d se)
        | S s -> S (resolve_stmt scope s se))
      item_list
  in
  Block resolved_items

let resolve_prog (Program p : Ast.prog) (se : Env.senv) : Ast.prog =
  Program (resolve_func p se)
