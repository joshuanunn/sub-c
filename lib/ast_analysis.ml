open Ast
open Env

let rec resolve_expr (e : Ast.expr) (se : Env.senv) : Ast.expr =
  match e with
  | LiteralInt i -> LiteralInt i
  | Var v -> Var (resolve_var v se)
  | Unary { op; exp } -> Unary { op; exp = resolve_expr exp se }
  | Binary { op; left; right } ->
      Binary { op; left = resolve_expr left se; right = resolve_expr right se }
  | Assignment (lvalue, rvalue) -> (
      match lvalue with
      | Var _ -> Assignment (resolve_expr lvalue se, resolve_expr rvalue se)
      | _ -> failwith "lvalues in assignments must be variables")
  | Conditional { cond_exp; then_exp; else_exp } ->
      Conditional
        {
          cond_exp = resolve_expr cond_exp se;
          then_exp = resolve_expr then_exp se;
          else_exp = resolve_expr else_exp se;
        }

let resolve_decl (d : Ast.decl) (se : Env.senv) : Ast.decl =
  match d with
  | Declaration (id, None) ->
      let var = declare_var id se in
      Declaration (var, None)
  | Declaration (id, Some expr) ->
      let var = declare_var id se in
      let init = Some (resolve_expr expr se) in
      Declaration (var, init)

let rec resolve_stmt (s : Ast.stmt) (se : Env.senv) : Ast.stmt =
  match s with
  | Return expr -> Return (resolve_expr expr se)
  | Expression expr -> Expression (resolve_expr expr se)
  | If { cond_exp; then_smt; else_smt = None } ->
      If
        {
          cond_exp = resolve_expr cond_exp se;
          then_smt = resolve_stmt then_smt se;
          else_smt = None;
        }
  | If { cond_exp; then_smt; else_smt = Some stmt } ->
      If
        {
          cond_exp = resolve_expr cond_exp se;
          then_smt = resolve_stmt then_smt se;
          else_smt = Some (resolve_stmt stmt se);
        }
  | Compound b ->
      (* Push new scope before compound statement entry and pop after exit *)
      push_var_scope se;
      let result = Compound (resolve_block b se) in
      pop_var_scope se;
      result
  (* goto label resolution cannot be completed until after analysis pass *)
  | Goto id -> Goto id
  | Label (id, s) -> Label (id, resolve_stmt s se)
  | Null -> Null

and resolve_func (f : Ast.func) (se : Env.senv) : Ast.func =
  match f with
  | Function fn ->
      push_lab_scope se;

      (* --- Phase 1: predeclare all labels in the function --- *)
      let rec predeclare_labels block =
        let (Block items) = block in
        List.iter
          (function
            | S (Label (id, _)) -> ignore (declare_lab id se)
            | S (If { then_smt; else_smt = Some e; _ }) ->
                predeclare_labels (Block [ S then_smt; S e ])
            | S (If { then_smt; else_smt = None; _ }) ->
                predeclare_labels (Block [ S then_smt ])
            | S (Compound inner) -> predeclare_labels inner
            | _ -> ())
          items
      in
      predeclare_labels fn.body;

      (* --- Phase 2: resolve variables, labels, gotos --- *)
      let body = resolve_block fn.body se in

      pop_lab_scope se;
      Function { name = fn.name; body; return_type = fn.return_type }

and resolve_block (b : Ast.block) (se : Env.senv) : Ast.block =
  let (Block item_list) = b in
  let resolved_items =
    List.map
      (fun item ->
        match item with
        | D d -> D (resolve_decl d se)
        | S s -> S (resolve_stmt s se))
      item_list
  in
  Block resolved_items

let resolve_prog (Program p : Ast.prog) (se : Env.senv) : Ast.prog =
  Program (resolve_func p se)
