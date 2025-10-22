open Ast
open Env

let rec resolve_stmt (s : stmt) (se : senv) : stmt =
  match s with
  | Return expr -> Return expr
  | Expression expr -> Expression expr
  | If { cond_exp; then_smt; else_smt = None } ->
      If { cond_exp; then_smt = resolve_stmt then_smt se; else_smt = None }
  | If { cond_exp; then_smt; else_smt = Some stmt } ->
      If
        {
          cond_exp;
          then_smt = resolve_stmt then_smt se;
          else_smt = Some (resolve_stmt stmt se);
        }
  | Compound b ->
      (* Push new scope before compound statement entry and pop after exit *)
      push_var_scope se;
      push_lab_scope se;
      let result = Compound (resolve_block b se) in
      pop_var_scope se;
      pop_lab_scope se;
      result
  (* goto labels can now be resolved after analysis pass *)
  | Goto id -> Goto (resolve_lab id se)
  (* do not redeclare label, but do need to resolve enclosing statements *)
  | Label (id, s) -> Label (id, resolve_stmt s se)
  | Null -> Null

and resolve_func (f : Ast.func) (se : senv) : Ast.func =
  match f with
  | Function fn ->
      let body = resolve_block fn.body se in
      Function { name = fn.name; body; return_type = fn.return_type }

and resolve_block (items : block) (se : senv) : block =
  let (Block item_list) = items in
  let resolved_items =
    List.map
      (fun item -> match item with D d -> D d | S s -> S (resolve_stmt s se))
      item_list
  in
  Block resolved_items

let resolve_prog (Program p : Ast.prog) (se : Env.senv) : Ast.prog =
  Program (resolve_func p se)
