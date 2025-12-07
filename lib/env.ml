(** Extract the string name from an [Ast.Identifier]. Raises if the AST node is
    not an identifier. *)
let get_identifier_name = function
  | Ast.Identifier name -> name
  | _ -> failwith "expected Identifier"

(** ------------------------------------------------------------------------
    Local environment (lenv)
    ------------------------------------------------------------------------
    Tracks stack offsets for IR-level temporary values and declared variables.
    Used during IR generation and code lowering to assign concrete stack slots.
*)

type lenv = {
  mutable counter : int;  (** Counter for generating unique names *)
  mutable offset : int;  (** Current top-of-stack offset *)
  stack_offsets : (string, int) Hashtbl.t;
      (** Map from variable names to stack offsets *)
}

let pp_lenv fmt (le : lenv) =
  (* Convert and sort entries by offset *)
  let entries =
    Hashtbl.fold
      (fun name offset acc -> (offset, name) :: acc)
      le.stack_offsets []
    |> List.sort (fun (o1, _) (o2, _) -> compare o2 o1)
  in
  let max_name_len =
    List.fold_left (fun m (_, name) -> max m (String.length name)) 0 entries
  in
  Format.fprintf fmt "@[<v>";
  Format.fprintf fmt "Env.lenv {@;<2 2>@[<v>";
  Format.fprintf fmt "counter = %d;@," le.counter;
  Format.fprintf fmt "offset = %d;@," le.offset;
  Format.fprintf fmt "@[<v>stack slots = {@,";
  List.iter
    (fun (offset, name) ->
      Format.fprintf fmt "  %-*s -> %d,@," max_name_len name offset)
    entries;
  Format.fprintf fmt "}}@]";
  Format.fprintf fmt "@]";
  Format.fprintf fmt "@]" (* close outer box *)

(** Pretty printer for lenv, as not fully supported by ppx_deriving show. *)
let show_lenv le = Format.asprintf "%a" pp_lenv le

(** Create a new, empty local environment *)
let make_lenv () : lenv =
  { counter = 0; offset = 0; stack_offsets = Hashtbl.create 16 }

(** Declare a new temporary value.
    - Generates a unique name by appending the counter to [name]
    - Allocates 4 bytes on the stack (decreases offset)
    - Stores the mapping in [stack_offsets]
    - Returns the unique name *)
let declare_value (name : string) (le : lenv) : string =
  let eid = name ^ "." ^ string_of_int le.counter in
  let new_offset = le.offset - 4 in
  Hashtbl.add le.stack_offsets eid new_offset;
  le.counter <- le.counter + 1;
  le.offset <- new_offset;
  eid

(** Insert a user-declared variable into the stack offset table. *)
let insert_value (id : Ast.ident) (le : lenv) : unit =
  let name = get_identifier_name id in
  let new_offset = le.offset - 4 in
  Hashtbl.add le.stack_offsets name new_offset;
  le.offset <- new_offset;
  ()

(** Declare a unique label name for control-flow constructs *)
let declare_label (name : string) (le : lenv) : string =
  let eid = name ^ "." ^ string_of_int le.counter in
  le.counter <- le.counter + 1;
  eid

(** Look up the stack offset for a given variable name. Raises if not found. *)
let get_value_offset (name : string) (le : lenv) : int =
  Hashtbl.find le.stack_offsets name

(** ------------------------------------------------------------------------
    Symbol environment (senv)
    ------------------------------------------------------------------------
    Handles semantic scoping of identifiers and labels at the AST level. Each
    entry in [ident_stack] and [label_stack] represents one lexical scope. New
    blocks or functions push a new scope; leaving them pops it. *)

type senv = {
  mutable counter : int;  (** Unique counter for generating names *)
  mutable ident_stack : (string, string * bool) Hashtbl.t list;
  mutable label_stack : (string, string) Hashtbl.t list;
}

(** Create a new symbol environment with a single global scope *)
let make_senv () : senv =
  {
    counter = 0;
    ident_stack = [ Hashtbl.create 16 ];
    label_stack = [ Hashtbl.create 16 ];
  }

(** Push a new variable/function scope onto the stack *)
let push_ident_scope (se : senv) =
  se.ident_stack <- Hashtbl.create 16 :: se.ident_stack

(** Pop the current variable/function scope *)
let pop_ident_scope (se : senv) =
  match se.ident_stack with
  | [] -> failwith "no ident scope to pop"
  | _ :: rest -> se.ident_stack <- rest

(** Push a new label scope onto the stack *)
let push_label_scope (se : senv) =
  se.label_stack <- Hashtbl.create 16 :: se.label_stack

(** Pop the current label scope *)
let pop_label_scope (se : senv) =
  match se.label_stack with
  | [] -> failwith "no label scope to pop"
  | _ :: rest -> se.label_stack <- rest

(** Declare a new variable in the current scope. Generates a unique name (e.g.
    "x.3"). Raises if the variable already exists in the same scope. *)
let declare_var (id : Ast.ident) (se : senv) : Ast.ident =
  let name = get_identifier_name id in
  let has_linkage = false in
  match se.ident_stack with
  | [] -> failwith "declare var: no active scope"
  | top_scope :: _ ->
      if Hashtbl.mem top_scope name then
        failwith ("variable " ^ name ^ " already declared in current scope");
      let unique = name ^ "." ^ string_of_int se.counter in
      se.counter <- se.counter + 1;
      Hashtbl.add top_scope name (unique, has_linkage);
      Identifier unique

(** Declare a new function in the current scope. Functions have linkage (true).
    Raises if a function with the same name already exists in the current scope
    and does not have linkage. *)
let declare_fun (id : Ast.ident) (se : senv) : Ast.ident =
  let name = get_identifier_name id in
  let has_linkage = true in
  match se.ident_stack with
  | [] -> failwith "declare fun: no active scope"
  | top_scope :: _ -> (
      match Hashtbl.find_opt top_scope name with
      | Some (_, false) ->
          failwith ("function " ^ name ^ " already declared in current scope")
      | Some _ | None ->
          Hashtbl.add top_scope name (name, has_linkage);
          Identifier name)

(** Resolve a variable by searching from innermost to outermost scope. Raises if
    the variable is not found. *)
let resolve_var (id : Ast.ident) (se : senv) : Ast.ident =
  let name = get_identifier_name id in
  let rec find = function
    | [] -> failwith ("variable " ^ name ^ " is not defined")
    | scope :: rest -> (
        match Hashtbl.find_opt scope name with
        | Some (unique, _) -> Ast.Identifier unique
        | None -> find rest)
  in
  find se.ident_stack

(** Resolve a function by searching from innermost to outermost scope. Raises if
    the function is not found. *)
let resolve_fun (id : Ast.ident) (se : senv) : Ast.ident =
  let name = get_identifier_name id in
  let rec find = function
    | [] -> failwith ("function " ^ name ^ " is not defined")
    | scope :: rest -> (
        match Hashtbl.find_opt scope name with
        | Some (unique, _) -> Ast.Identifier unique
        | None -> find rest)
  in
  find se.ident_stack

(** Declare a label in the current scope. Labels must be unique within the same
    scope. *)
let declare_lab (id : Ast.ident) (se : senv) : Ast.ident =
  let name = get_identifier_name id in
  match se.label_stack with
  | [] -> failwith "declare lab: no active scope"
  | top_scope :: _ ->
      if Hashtbl.mem top_scope name then
        failwith ("label " ^ name ^ " already declared in current scope");
      let unique = name ^ "." ^ string_of_int se.counter in
      se.counter <- se.counter + 1;
      Hashtbl.add top_scope name unique;
      GotoLabel unique

(** Resolve a label by searching outward through the label stack. Raises if the
    label is not found. *)
let resolve_lab (id : Ast.ident) (se : senv) : Ast.ident =
  let name = get_identifier_name id in
  let rec find = function
    | [] -> failwith ("label " ^ name ^ " is not defined")
    | scope :: rest -> (
        match Hashtbl.find_opt scope name with
        | Some unique -> Ast.GotoLabel unique
        | None -> find rest)
  in
  find se.label_stack

(** ------------------------------------------------------------------------
    Type environment (tenv)
    ------------------------------------------------------------------------
    Handles type checking of identifiers at the AST level. This should be used
    after the resolution pass has resolved scoping, to ensure identifiers have
    unique names before typing. *)

type type_entry = { c_type : Type.ctype; defined : bool }
type tenv = { mutable typed_idents : (string, type_entry) Hashtbl.t }

(** Create a new type environment with a single global scope *)
let make_tenv () : tenv = { typed_idents = Hashtbl.create 16 }

(** Add a variable into type environment. *)
let typecheck_var_decl (id : Ast.ident) (te : tenv) : Ast.ident =
  let var_name = get_identifier_name id in

  (* As variables already have unique names from the AST resolution pass, then
    no need to check if they exist in the type environment. We just add them. *)
  Hashtbl.add te.typed_idents var_name { c_type = Type.Int; defined = true };
  id

(** Add a function into type environment. Raises if a function has been defined
    before or if function definition does not match a previous entry. *)
let typecheck_fun_decl (id : Ast.ident) (params : Ast.ident list)
    (is_def : bool) (te : tenv) : Ast.ident =
  let fun_name = get_identifier_name id in
  let fun_type = Type.FunType { param_count = List.length params } in

  (match Hashtbl.find_opt te.typed_idents fun_name with
  | None ->
      Hashtbl.add te.typed_idents fun_name
        { c_type = fun_type; defined = is_def }
  | Some { c_type; defined } ->
      if c_type <> fun_type then failwith "incompatible function declarations"
      else if is_def && defined then failwith "function defined more than once"
      else
        Hashtbl.add te.typed_idents fun_name
          { c_type = fun_type; defined = is_def });
  id

(** Assert a variable has been typechecked and has been used correctly. *)
let typecheck_assert_var (id : Ast.ident) (te : tenv) : Ast.ident =
  let var_name = get_identifier_name id in
  (match Hashtbl.find_opt te.typed_idents var_name with
  | None -> failwith "variable has not been typechecked"
  | Some { c_type; _ } ->
      if c_type <> Type.Int then failwith "function name used as variable");
  id

(** Assert a function has been typechecked and has been used correctly. *)
let typecheck_assert_fun (id : Ast.ident) (argc : int) (te : tenv) : Ast.ident =
  let fun_name = get_identifier_name id in
  (match Hashtbl.find_opt te.typed_idents fun_name with
  | None -> failwith "function has not been typechecked"
  | Some { c_type = Type.FunType p; _ } ->
      if p.param_count <> argc then
        failwith "function called with the wrong number of arguments"
  | Some _ -> failwith "variable used as function name");
  id
