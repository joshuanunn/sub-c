open Ast
open Env

let rec resolve_stmt (scope : ident) (s : stmt) (e : senv) : stmt =
  match s with
  | Return expr -> Return expr
  | Expression expr -> Expression expr
  | If { cond_exp; then_smt; else_smt = None } ->
      If { cond_exp; then_smt = resolve_stmt scope then_smt e; else_smt = None }
  | If { cond_exp; then_smt; else_smt = Some stmt } ->
      If
        {
          cond_exp;
          then_smt = resolve_stmt scope then_smt e;
          else_smt = Some (resolve_stmt scope stmt e);
        }
  | Compound b -> Compound (resolve_block scope b e)
  (* goto labels can now be resolved after analysis pass *)
  | Goto id -> Goto (resolve_scoped_label scope id e)
  (* do not redeclare label, but do need to resolve enclosing statements *)
  | Label (id, s) -> Label (id, resolve_stmt scope s e)
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
        match item with D d -> D d | S s -> S (resolve_stmt scope s e))
      item_list
  in
  Block resolved_items

let resolve_prog (Program f : Ast.prog) (e : Env.senv) : Ast.prog =
  Program (resolve_func f e)
