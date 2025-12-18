(** [predeclare_labels block se] traverses a block of statements and predeclares
    all labels in the environment [se]. This ensures forward GOTO statements can
    be resolved before statement resolution. *)
let rec predeclare_labels (block : Ast.block) (se : Env.senv) : unit =
  let (Ast.Block items) = block in
  List.iter
    (fun item ->
      match item with
      | Ast.D _ -> () (* Declarations don't contain labels *)
      | Ast.S stmt -> predeclare_stmt_labels stmt se)
    items

(** [predeclare_stmt_labels stmt se] traverses a statement [stmt] to predeclare
    any labels it defines, recursively handling nested statements. *)
and predeclare_stmt_labels (stmt : Ast.stmt) (se : Env.senv) : unit =
  match stmt with
  | Label (id, inner) ->
      ignore (Env.declare_lab se id);
      predeclare_stmt_labels inner se (* Recurse into inner statement *)
  | Compound block -> predeclare_labels block se
  | If { then_smt; else_smt; _ } -> (
      predeclare_stmt_labels then_smt se;
      match else_smt with Some s -> predeclare_stmt_labels s se | None -> ())
  | While { body; _ }
  | DoWhile { body; _ }
  | For { body; _ }
  | Switch { body; _ }
  | Case { body; _ }
  | Default { body; _ } ->
      predeclare_stmt_labels body se
  | Break _ | Continue _ | Goto _ | Return _ | Expression _ | Null -> ()

(** [resolve_expr e se] resolves variable and function identifiers in expression
    [e] using environment [se], returning a new AST expression with identifiers
    replaced by their unique scoped names. *)
let rec resolve_expr (e : Ast.expr) (se : Env.senv) : Ast.expr =
  match e with
  | LiteralInt i -> LiteralInt i
  | Var v -> Var (Env.resolve_var se v)
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
  | FunctionCall { name; args } ->
      let name' = Env.resolve_fun se name in
      let args' = List.map (fun e -> resolve_expr e se) args in
      FunctionCall { name = name'; args = args' }
  | Comma (left, right) ->
      let left' = resolve_expr left se in
      let right' = resolve_expr right se in
      Comma (left', right')

(** [resolve_opt_expr e_opt se] resolves an optional expression [e_opt] using
    environment [se], returning [Some resolved_expr] or [None] if input is
    [None]. *)
let resolve_opt_expr (e : Ast.expr option) (se : Env.senv) : Ast.expr option =
  match e with Some exp -> Some (resolve_expr exp se) | None -> None

(** [resolve_for_init i se] resolves a for-loop initialiser [i] in environment
    [se]. Handles both variable declarations and expression initialisers,
    returning a new [Ast.for_init] with declared variables resolved. *)
let resolve_for_init (i : Ast.for_init) (se : Env.senv) : Ast.for_init =
  match i with
  | InclDecl { name; init = None; storage } ->
      let var = Env.declare_var se name in
      InclDecl { name = var; init = None; storage }
  | InclDecl { name; init = Some expr; storage } ->
      let var = Env.declare_var se name in
      let init = Some (resolve_expr expr se) in
      InclDecl { name = var; init; storage }
  | InitExp e -> InitExp (resolve_opt_expr e se)

(** [resolve_stmt s se] resolves all expressions, variables, and labels in
    statement [s] using environment [se]. Handles scoping rules for compound
    statements and for-loops, and replaces identifiers with their unique scoped
    names. *)
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
      Env.push_ident_scope se;
      let result = Ast.Compound (resolve_block b se) in
      Env.pop_ident_scope se;
      result
  | Break id -> Break id
  | Continue id -> Continue id
  | While { cond; body; id } ->
      While { cond = resolve_expr cond se; body = resolve_stmt body se; id }
  | DoWhile { body; cond; id } ->
      DoWhile { body = resolve_stmt body se; cond = resolve_expr cond se; id }
  | For { init; cond; post; body; id } ->
      (* For-loop introduces a new scope *)
      Env.push_ident_scope se;
      let init = resolve_for_init init se in
      let cond = resolve_opt_expr cond se in
      let post = resolve_opt_expr post se in
      let body = resolve_stmt body se in
      let result = Ast.For { init; cond; post; body; id } in
      Env.pop_ident_scope se;
      result
  | Switch { cond; body; id } ->
      let cond' = resolve_expr cond se in
      (* TODO: add typecheck as cond' should resolve to an integer. *)
      let body' = resolve_stmt body se in
      Switch { cond = cond'; body = body'; id }
  | Case { value; body; id } -> (
      let value' = resolve_expr value se in
      let body' = resolve_stmt body se in
      match value' with
      (* TODO: add support for other integer types once implemented *)
      | LiteralInt _ -> Case { value = value'; body = body'; id }
      | _ -> failwith "case label must be a constant integer expression")
  | Default { body; id } -> Default { body = resolve_stmt body se; id }
  (* goto labels can now be resolved following label predeclaration pass *)
  | Goto id ->
      let resolved_id = Env.resolve_lab se id in
      Goto resolved_id
  (* labels can now be updated following label predeclaration pass *)
  | Label (id, s) ->
      let resolved_id = Env.resolve_lab se id in
      Label (resolved_id, resolve_stmt s se)
  | Null -> Null

(** [resolve_decl d se] resolves a declaration [d] using environment [se].

    For variable declarations, this pass:
    - determines whether the declaration has linkage (e.g. via [extern]),
    - decides whether to keep the original name or generate a unique one,
    - detects conflicting declarations in the same scope,
    - resolves initialiser expressions only for non-extern block-scope
      variables.

    For function declarations, it:
    - declares the function name in the current scope,
    - rejects illegal block-scope static function declarations. *)
and resolve_decl (d : Ast.decl) (se : Env.senv) : Ast.decl =
  match d with
  | FunDecl { storage = Some Static; _ } ->
      failwith "block-scope static function declarations are not allowed"
  | FunDecl { body = Some _; _ } ->
      failwith "local function definitions are not allowed"
  | FunDecl { name; params; body = None; storage } ->
      let name' = Env.declare_fun se name in
      (* Push new scope for function parameter declaration *)
      Env.push_ident_scope se;
      let params' = List.map (fun e -> Env.declare_var se e) params in
      Env.pop_ident_scope se;
      FunDecl { name = name'; params = params'; body = None; storage }
  | VarDecl { name; init; storage } ->
      let has_linkage = storage = Some Extern in

      (* check var not defined with and without linkage in the same scope *)
      (match Env.find_in_current_scope se name with
      | Some prev ->
          if not (prev.has_linkage && has_linkage) then
            failwith ("conflicting declarations of " ^ Env.ident_name name)
      | None -> ());

      let name' =
        if has_linkage then
          (* extern: retain original name *)
          Env.declare_var_fscope se name
        else
          (* static or automatic: rename *)
          Env.declare_var se name
      in

      (* resolve initialiser expressions for non-extern variables *)
      let init' =
        if has_linkage then init
        else Option.map (fun e -> resolve_expr e se) init
      in

      VarDecl { name = name'; init = init'; storage }

(** [resolve_func f se] resolves all identifiers, variables, and labels in
    function [f] using environment [se]. Predeclares all labels before resolving
    statements to support forward GOTOs. *)
and resolve_func (f : Ast.fun_decl) (se : Env.senv) : Ast.fun_decl =
  Env.push_label_scope se;

  (* Push new scope for function parameter declaration *)
  Env.push_ident_scope se;
  let params' = List.map (fun p -> Env.declare_var se p) f.params in

  (* Predeclare labels to support forward gotos *)
  Option.iter (fun b -> predeclare_labels b se) f.body;

  (* Resolve statements, declarations, variables, and gotos *)
  let body' = Option.map (fun b -> resolve_block b se) f.body in

  Env.pop_ident_scope se;
  Env.pop_label_scope se;
  { name = f.name; params = params'; body = body'; storage = f.storage }

(** [resolve_block b se] resolves all statements and declarations in block [b]
    using environment [se], returning a new resolved block. *)
and resolve_block (b : Ast.block) (se : Env.senv) : Ast.block =
  let (Block item_list) = b in
  let resolved_items =
    List.map
      (fun item ->
        match item with
        | Ast.D d -> Ast.D (resolve_decl d se)
        | Ast.S s -> Ast.S (resolve_stmt s se))
      item_list
  in
  Block resolved_items

(** [resolve_prog p se] resolves a top-level program [p] with environment [se].
    Predeclares all top-level functions and variables before resolving function
    bodies. *)
and resolve_prog (Program p : Ast.prog) (se : Env.senv) : Ast.prog =
  (* PASS 1: Pre-declare names of all top-level functions and variables *)
  List.iter
    (function
      | Ast.FunDecl f -> ignore (Env.declare_fun se f.name)
      | Ast.VarDecl v -> ignore (Env.declare_var_fscope se v.name))
    p;

  (* PASS 2: Resolve function bodies now names are known. Top-level variable
     initialisers must be constant, so no need to resolve variables further *)
  let resolved_funcs =
    List.map
      (function
        | Ast.FunDecl f -> Ast.FunDecl (resolve_func f se)
        | Ast.VarDecl v -> Ast.VarDecl v)
      p
  in
  Program resolved_funcs
