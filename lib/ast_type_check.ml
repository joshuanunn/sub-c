(** [type_expr e te] checks the expression [e] for type correctness using the
    type environment [te], and returns a type-corrected expression in which
    identifiers have been validated.

    This includes:
    - verifying that variables are declared with correct types,
    - verifying that function calls have the right arity,
    - recursively type-checking all subexpressions. *)
let rec type_expr (e : Ast.expr) (te : Env.tenv) : Ast.expr =
  match e with
  | LiteralInt i -> LiteralInt i
  | Var v -> Var (Env.typecheck_assert_var v te)
  | Unary { op; exp } -> Unary { op; exp = type_expr exp te }
  | Binary { op; left; right } ->
      Binary { op; left = type_expr left te; right = type_expr right te }
  | Assignment (lvalue, rvalue) -> (
      match lvalue with
      | Var _ -> Assignment (type_expr lvalue te, type_expr rvalue te)
      | _ -> failwith "lvalues in assignments must be variables")
  | Conditional { cond_exp; then_exp; else_exp } ->
      Conditional
        {
          cond_exp = type_expr cond_exp te;
          then_exp = type_expr then_exp te;
          else_exp = type_expr else_exp te;
        }
  | FunctionCall { name; args } ->
      let num_args = List.length args in
      let name' = Env.typecheck_assert_fun name num_args te in
      let args' = List.map (fun e -> type_expr e te) args in
      FunctionCall { name = name'; args = args' }

(** [type_opt_expr e_opt te] type checks the optional expression [e_opt],
    returning [Some typed_expr] if present or [None] if absent. *)
let type_opt_expr (e : Ast.expr option) (te : Env.tenv) : Ast.expr option =
  match e with Some exp -> Some (type_expr exp te) | None -> None

(** [type_for_init i te] type checks a for-loop initializer [i], validating
    variable declarations and/or initial expression types. *)
let type_for_init (i : Ast.for_init) (te : Env.tenv) : Ast.for_init =
  match i with
  | InclDecl { name; init = None } ->
      let var = Env.typecheck_var_decl name te in
      InclDecl { name = var; init = None }
  | InclDecl { name; init = Some expr } ->
      let var = Env.typecheck_var_decl name te in
      let init = Some (type_expr expr te) in
      InclDecl { name = var; init }
  | InitExp e -> InitExp (type_opt_expr e te)

(** [type_stmt s te] type checks the statement [s] in environment [te],
    validating all subexpressions and substatements. *)
let rec type_stmt (s : Ast.stmt) (te : Env.tenv) : Ast.stmt =
  match s with
  | Return expr -> Return (type_expr expr te)
  | Expression expr -> Expression (type_expr expr te)
  | If { cond_exp; then_smt; else_smt = None } ->
      If
        {
          cond_exp = type_expr cond_exp te;
          then_smt = type_stmt then_smt te;
          else_smt = None;
        }
  | If { cond_exp; then_smt; else_smt = Some stmt } ->
      If
        {
          cond_exp = type_expr cond_exp te;
          then_smt = type_stmt then_smt te;
          else_smt = Some (type_stmt stmt te);
        }
  | Compound b ->
      let result = Ast.Compound (type_block b te) in
      result
  | Break id -> Break id
  | Continue id -> Continue id
  | While { cond; body; id } ->
      While { cond = type_expr cond te; body = type_stmt body te; id }
  | DoWhile { body; cond; id } ->
      DoWhile { body = type_stmt body te; cond = type_expr cond te; id }
  | For { init; cond; post; body; id } ->
      let init = type_for_init init te in
      let cond = type_opt_expr cond te in
      let post = type_opt_expr post te in
      let body = type_stmt body te in
      let result = Ast.For { init; cond; post; body; id } in
      result
  | Switch { cond; body; id } ->
      let cond' = type_expr cond te in
      (* TODO: add typecheck as cond' should type to an integer. *)
      let body' = type_stmt body te in
      Switch { cond = cond'; body = body'; id }
  | Case { value; body; id } -> (
      let value' = type_expr value te in
      let body' = type_stmt body te in
      match value' with
      (* TODO: add support for other integer types once implemented *)
      | LiteralInt _ -> Case { value = value'; body = body'; id }
      | _ -> failwith "case label must be a constant integer expression")
  | Default { body; id } -> Default { body = type_stmt body te; id }
  | Goto id -> Goto id
  | Label (id, s) -> Label (id, s)
  | Null -> Null

(** [type_decl d te] type checks a declaration [d], ensuring consistency of
    declared types and valid initializer expressions. *)
and type_decl (d : Ast.decl) (te : Env.tenv) : Ast.decl =
  match d with
  | FunDecl { name; params; body = None } ->
      let name' = Env.typecheck_fun_decl name params false te in
      let params' = List.map (fun e -> Env.typecheck_var_decl e te) params in
      FunDecl { name = name'; params = params'; body = None }
  | FunDecl { body = Some _; _ } ->
      failwith "local function definitions are not allowed"
  | VarDecl { name; init = None } ->
      let var = Env.typecheck_var_decl name te in
      VarDecl { name = var; init = None }
  | VarDecl { name; init = Some expr } ->
      let var = Env.typecheck_var_decl name te in
      let init = Some (type_expr expr te) in
      VarDecl { name = var; init }

(** [type_func f te] type checks the function [f] using environment [te].
    Validates the function signature, parameters, and (if present) function
    body. *)
and type_func (f : Ast.fun_decl) (te : Env.tenv) : Ast.fun_decl =
  let has_body = Option.is_some f.body in
  let name = Env.typecheck_fun_decl f.name f.params has_body te in

  (* Only typecheck function parameters and body if a definition (done once) *)
  if has_body then
    let params = List.map (fun p -> Env.typecheck_var_decl p te) f.params in
    let body = Option.map (fun b -> type_block b te) f.body in
    { name; params; body }
  else { name; params = f.params; body = f.body }

(** [type_block b te] type checks each item in block [b], which may include
    variable declarations or statements. *)
and type_block (b : Ast.block) (te : Env.tenv) : Ast.block =
  let (Block item_list) = b in
  let typed_items =
    List.map
      (fun item ->
        match item with
        | Ast.D d -> Ast.D (type_decl d te)
        | Ast.S s -> Ast.S (type_stmt s te))
      item_list
  in
  Block typed_items

(** [type_prog p te] type checks a top-level program [p], validating all
    functions against the type environment [te]. *)
and type_prog (Program p : Ast.prog) (te : Env.tenv) : Ast.prog =
  let typed_funcs =
    List.map
      (function
        | Ast.FunDecl f -> Ast.FunDecl (type_func f te)
        | Ast.VarDecl _ ->
            failwith "Global variable declaration not yet implemented")
      p
  in
  Program typed_funcs
