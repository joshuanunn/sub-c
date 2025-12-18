(** Type check a file-scope variable declaration.

    Enforces C rules for external and internal linkage, constant initialisers,
    tentative definitions, and conflicting redeclarations. Updates the type
    environment with storage and initialisation information. *)
let rec type_fscope_var_decl (v : Ast.var_decl) (te : Env.tenv) : unit =
  let storage = v.storage in
  let init = v.init in
  let init_val =
    match init with
    | Some (Ast.LiteralInt i) -> Env.Initial i
    | None -> (
        match storage with
        | Some Extern -> Env.NoInitialiser
        | _ -> Env.Tentative)
    | Some _ -> failwith "non-constant initialiser!"
  in

  let global = storage <> Some Static in

  match Env.find te v.name with
  | None ->
      Env.add te v.name
        {
          c_type = Type.Int;
          attrs = Env.StaticAttr { init = init_val; global };
        }
  | Some { c_type; attrs = Env.StaticAttr old } ->
      if c_type <> Type.Int then failwith "function redeclared as variable";

      (* linkage reconciliation *)
      let global =
        if storage = Some Extern then old.global
        else if old.global <> global then
          failwith "conflicting variable linkage"
        else global
      in

      (* initialiser reconciliation *)
      let init =
        match (old.init, init_val) with
        | Env.Initial _, Env.Initial _ ->
            failwith "conflicting file scope variable definitions"
        | Env.Initial _, _ -> old.init
        | _, Env.Initial _ -> init_val
        | Env.Tentative, Env.Tentative -> Env.Tentative
        | Env.NoInitialiser, Env.Tentative | Env.Tentative, Env.NoInitialiser ->
            Env.Tentative
        | Env.NoInitialiser, Env.NoInitialiser -> Env.NoInitialiser
      in

      Env.replace te v.name
        { c_type = Type.Int; attrs = Env.StaticAttr { init; global } }
  | Some _ -> failwith "identifier redeclared with incompatible kind"

(** Type check a block-scope variable declaration.

    Handles [extern], [static], and automatic variables, enforcing initialiser
    rules and updating the type environment accordingly. *)
and type_local_var_decl (v : Ast.var_decl) (te : Env.tenv) : unit =
  match v.storage with
  (* extern local variable *)
  | Some Extern ->
      if v.init <> None then
        failwith "initialiser on local extern variable declaration";

      begin match Env.find te v.name with
      | Some { c_type = Type.FunType _; _ } ->
          failwith "function redeclared as variable"
      | Some _ -> () (* already declared — do nothing *)
      | None ->
          Env.add te v.name
            {
              c_type = Type.Int;
              attrs = Env.StaticAttr { init = Env.NoInitialiser; global = true };
            }
      end
  (* static local variable *)
  | Some Static ->
      let init =
        match v.init with
        | None -> Env.Initial 0
        | Some (Ast.LiteralInt i) -> Env.Initial i
        | Some _ -> failwith "non-constant initialiser on local static variable"
      in
      Env.add te v.name
        { c_type = Type.Int; attrs = Env.StaticAttr { init; global = false } }
  (* automatic local variable *)
  | None ->
      Env.add te v.name { c_type = Type.Int; attrs = Env.LocalAttr };
      (* typecheck initialiser AFTER declaration *)
      Option.iter (fun e -> type_expr e te) v.init

(** Type check a function parameter declaration.

    Adds the parameter as a local variable to the current type environment and
    rejects duplicate parameter names. *)
and type_param_decl (id : Ast.ident) (te : Env.tenv) : unit =
  match Env.find te id with
  | Some _ -> failwith "duplicate parameter name"
  | None -> Env.add te id { c_type = Type.Int; attrs = Env.LocalAttr }

(** Type check a [for] loop initialiser.

    Validates either a variable declaration (without storage-class specifiers)
    or an optional initialisation expression. *)
and type_for_init (i : Ast.for_init) (te : Env.tenv) : unit =
  match i with
  | InclDecl decl ->
      if decl.storage <> None then
        failwith "storage-class specifiers cannot be used in for-loop headers";
      type_local_var_decl decl te
  | InitExp e -> type_opt_expr e te

(** Type check a function declaration or definition.

    Validates consistency with any previous declarations and records function
    type, linkage, and definition status in the type environment. *)
and type_fun_decl (f : Ast.fun_decl) (te : Env.tenv) : unit =
  let has_body = Option.is_some f.body in
  let fun_type = Type.FunType { param_count = List.length f.params } in
  let global = f.storage <> Some Static in

  let defined, global =
    match Env.find te f.name with
    | None -> (has_body, global)
    | Some { c_type; attrs = FunAttr a } ->
        if c_type <> fun_type then failwith "incompatible function declarations";
        if a.defined && has_body then failwith "function defined more than once";
        if a.global && f.storage = Some Static then
          failwith "static function declaration follows non-static";
        (a.defined || has_body, a.global)
    | Some _ -> failwith "variable redeclared as function"
  in
  Env.replace te f.name
    { c_type = fun_type; attrs = FunAttr { defined; global } }

(** Type check an expression for correctness.

    Ensures variables and functions are used consistently with their declared
    types and recursively checks all subexpressions. *)
and type_expr (e : Ast.expr) (te : Env.tenv) : unit =
  match e with
  | LiteralInt _ -> ()
  | Var v -> Env.assert_var te v
  | Unary { exp; _ } -> type_expr exp te
  | Binary { left; right; _ } ->
      type_expr left te;
      type_expr right te
  | Assignment (lvalue, rvalue) -> (
      match lvalue with
      | Var _ ->
          type_expr lvalue te;
          type_expr rvalue te
      | _ -> failwith "lvalues in assignments must be variables")
  | Conditional { cond_exp; then_exp; else_exp } ->
      type_expr cond_exp te;
      type_expr then_exp te;
      type_expr else_exp te
  | FunctionCall { name; args } ->
      Env.assert_fun te name (List.length args);
      List.iter (fun e -> type_expr e te) args
  | Comma (left, right) ->
      type_expr left te;
      type_expr right te

(** Type check an optional expression, if present. *)
and type_opt_expr (e : Ast.expr option) (te : Env.tenv) : unit =
  match e with Some exp -> type_expr exp te | None -> ()

(** Type check a statement.

    Recursively validates all expressions and nested statements contained within
    the statement. *)
and type_stmt (s : Ast.stmt) (te : Env.tenv) : unit =
  match s with
  | Return expr -> type_expr expr te
  | Expression expr -> type_expr expr te
  | If { cond_exp; then_smt; else_smt = None } ->
      type_expr cond_exp te;
      type_stmt then_smt te
  | If { cond_exp; then_smt; else_smt = Some stmt } ->
      type_expr cond_exp te;
      type_stmt then_smt te;
      type_stmt stmt te
  | Compound b -> type_block b te
  | Break _ -> ()
  | Continue _ -> ()
  | While { cond; body; _ } ->
      type_expr cond te;
      type_stmt body te
  | DoWhile { body; cond; _ } ->
      type_stmt body te;
      type_expr cond te
  | For { init; cond; post; body; _ } ->
      type_for_init init te;
      type_opt_expr cond te;
      type_opt_expr post te;
      type_stmt body te
  | Switch { cond; body; _ } ->
      type_expr cond te;
      type_stmt body te
  | Case { value; body; _ } ->
      type_expr value te;
      type_stmt body te
  | Default { body; _ } -> type_stmt body te
  | Goto _ -> ()
  | Label _ -> ()
  | Null -> ()

(** Type check a declaration.

    Dispatches to either file-scope or block-scope variable handling, or
    validates a function declaration. *)
and type_decl ~(file_scope : bool) (d : Ast.decl) (te : Env.tenv) : unit =
  match d with
  | VarDecl v ->
      if file_scope then type_fscope_var_decl v te else type_local_var_decl v te
  | FunDecl f -> type_fun_decl f te

(** Type check a function.

    Records the function declaration and, if a definition is present, type
    checks parameters and the function body. *)
and type_func (f : Ast.fun_decl) (te : Env.tenv) : unit =
  let has_body = Option.is_some f.body in
  type_fun_decl f te;

  (* Only typecheck function parameters and body if a definition (done once) *)
  if has_body then List.iter (fun p -> type_param_decl p te) f.params;
  Option.iter (fun b -> type_block b te) f.body

(** Type check a block.

    Processes declarations and statements in sequence using the current type
    environment. *)
and type_block (b : Ast.block) (te : Env.tenv) : unit =
  let (Block item_list) = b in
  List.iter
    (fun item ->
      match item with
      | Ast.D d -> type_decl ~file_scope:false d te
      | Ast.S s -> type_stmt s te)
    item_list

(** Type check an entire program.

    Processes all top-level declarations and function definitions using a shared
    global type environment. *)
and type_prog (Program p : Ast.prog) (te : Env.tenv) : unit =
  List.iter
    (function
      | Ast.FunDecl f -> type_func f te
      | Ast.VarDecl v -> type_decl ~file_scope:true (VarDecl v) te)
    p
