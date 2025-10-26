open Ast
open Env

(** [predeclare_labels block se] traverses a block of statements to predeclare
    all labels in the environment [se]. This is needed so that forward gotos can
    be resolved. *)
let rec predeclare_labels (block : Ast.block) (se : Env.senv) : unit =
  let (Ast.Block items) = block in
  List.iter
    (fun item ->
      match item with
      | Ast.D _ -> () (* Declarations don't contain labels *)
      | Ast.S stmt -> predeclare_stmt_labels stmt se)
    items

(** [predeclare_stmt_labels stmt se] traverses a statement to predeclare any
    labels it defines, and recurses into inner statements. *)
and predeclare_stmt_labels (stmt : Ast.stmt) (se : Env.senv) : unit =
  match stmt with
  | Label (id, inner) ->
      ignore (declare_lab id se);
      predeclare_stmt_labels inner se (* Recurse into inner statement *)
  | Compound block -> predeclare_labels block se
  | If { then_smt; else_smt; _ } -> (
      predeclare_stmt_labels then_smt se;
      match else_smt with Some s -> predeclare_stmt_labels s se | None -> ())
  | While { body; _ } | DoWhile { body; _ } | For { body; _ } ->
      predeclare_stmt_labels body se
  | Break _ | Continue _ | Goto _ | Return _ | Expression _ | Null -> ()

(** [resolve_expr e se] resolves variables in expression [e] using the
    environment [se]. *)
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

(** [resolve_opt_expr e_opt se] resolves an optional expression, returning
    [None] if the input is [None]. *)
let resolve_opt_expr (e : Ast.expr option) (se : Env.senv) : Ast.expr option =
  match e with Some exp -> Some (resolve_expr exp se) | None -> None

(** [resolve_decl d se] resolves a declaration [d] by declaring the variable in
    [se] and resolving any initialiser expressions. *)
let resolve_decl (d : Ast.decl) (se : Env.senv) : Ast.decl =
  match d with
  | Declaration (id, None) ->
      let var = declare_var id se in
      Declaration (var, None)
  | Declaration (id, Some expr) ->
      let var = declare_var id se in
      let init = Some (resolve_expr expr se) in
      Declaration (var, init)

(** [resolve_for_init i se] resolves a for-loop initialiser, which may be either
    a declaration or an expression. *)
let resolve_for_init (i : Ast.for_init) (se : Env.senv) : Ast.for_init =
  match i with
  | InclDecl d -> InclDecl (resolve_decl d se)
  | InitExp e -> InitExp (resolve_opt_expr e se)

(** [resolve_stmt s se] resolves variables and expressions in statement [s]
    within the environment [se]. Handles scoping for compound statements and
    for-loops. *)
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
      (* Push new scope for compound statement *)
      push_var_scope se;
      let result = Compound (resolve_block b se) in
      pop_var_scope se;
      result
  | Break id -> Break id
  | Continue id -> Continue id
  | While { cond; body; id } ->
      While { cond = resolve_expr cond se; body = resolve_stmt body se; id }
  | DoWhile { body; cond; id } ->
      DoWhile { body = resolve_stmt body se; cond = resolve_expr cond se; id }
  | For { init; cond; post; body; id } ->
      (* For-loop introduces a new scope *)
      push_var_scope se;
      let init = resolve_for_init init se in
      let cond = resolve_opt_expr cond se in
      let post = resolve_opt_expr post se in
      let body = resolve_stmt body se in
      let result = For { init; cond; post; body; id } in
      pop_var_scope se;
      result
  (* goto label resolution cannot be completed until after analysis pass *)
  | Goto id -> Goto id
  | Label (id, s) -> Label (id, resolve_stmt s se)
  | Null -> Null

(** [resolve_func f se] resolves all declarations, variables, and labels in
    function [f] using environment [se]. Predeclares all labels before resolving
    statements. *)
and resolve_func (f : Ast.func) (se : Env.senv) : Ast.func =
  match f with
  | Function fn ->
      push_lab_scope se;

      (* Predeclare labels to support forward gotos *)
      predeclare_labels fn.body se;

      (* Resolve statements, declarations, variables, and gotos *)
      let body = resolve_block fn.body se in

      pop_lab_scope se;
      Function { name = fn.name; body; return_type = fn.return_type }

(** [resolve_block b se] resolves statements and declarations in block [b]. *)
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

(** [resolve_prog p se] resolves top-level program [p] with environment [se]. *)
let resolve_prog (Program p : Ast.prog) (se : Env.senv) : Ast.prog =
  Program (resolve_func p se)
