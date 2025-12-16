(** Extract the string name from an [Ast.Identifier]. Raises if the AST node is
    not an identifier. *)
let get_identifier_name = function
  | Ast.Identifier name -> name
  | _ -> failwith "expected Identifier"

(** Extract the string name from a resolved AST identifier. *)
let ident_name (id : Ast.ident) : string = get_identifier_name id

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
let declare_value (le : lenv) (name : string) : string =
  let eid = name ^ "." ^ string_of_int le.counter in
  let new_offset = le.offset - 4 in
  Hashtbl.add le.stack_offsets eid new_offset;
  le.counter <- le.counter + 1;
  le.offset <- new_offset;
  eid

(** Insert a user-declared variable into the stack offset table. *)
let insert_value (le : lenv) (id : Ast.ident) : unit =
  let name = get_identifier_name id in
  let new_offset = le.offset - 4 in
  Hashtbl.add le.stack_offsets name new_offset;
  le.offset <- new_offset;
  ()

(** Declare a unique label name for control-flow constructs *)
let declare_label (le : lenv) (name : string) : string =
  let eid = name ^ "." ^ string_of_int le.counter in
  le.counter <- le.counter + 1;
  eid

(** Look up the stack offset for a given variable name. Raises if not found. *)
let get_value_offset (le : lenv) (name : string) : int =
  Hashtbl.find le.stack_offsets name

(** ------------------------------------------------------------------------
    Symbol environment (senv)
    ------------------------------------------------------------------------
    Handles semantic scoping of identifiers and labels at the AST level. Each
    entry in [ident_stack] and [label_stack] represents one lexical scope. New
    blocks or functions push a new scope; leaving them pops it. *)

type ident_entry = {
  unique : string;
  has_linkage : bool; (* extern or static(file-scope) *)
}

type senv = {
  mutable counter : int;  (** Unique counter for generating names *)
  mutable ident_stack : (string, ident_entry) Hashtbl.t list;
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

(** Look up an identifier in the current (innermost) scope only. *)
let find_in_current_scope (se : senv) (id : Ast.ident) =
  match se.ident_stack with
  | scope :: _ -> Hashtbl.find_opt scope (ident_name id)
  | [] -> None

(** Declare a new variable in the current scope. Generates a unique name (e.g.
    "x.3"). Raises if the variable already exists in the same scope. *)
let declare_var (se : senv) (id : Ast.ident) : Ast.ident =
  let name = get_identifier_name id in
  let has_linkage = false in
  match se.ident_stack with
  | [] -> failwith "declare var: no active scope"
  | top_scope :: _ ->
      if Hashtbl.mem top_scope name then
        failwith ("variable " ^ name ^ " already declared in current scope");
      let unique = name ^ "." ^ string_of_int se.counter in
      se.counter <- se.counter + 1;
      Hashtbl.add top_scope name { unique; has_linkage };
      Identifier unique

(** Declare a new file scope variable. These always have linkage (true). *)
let declare_var_fscope (se : senv) (id : Ast.ident) : Ast.ident =
  let name = get_identifier_name id in
  let has_linkage = true in
  let entry = { unique = name; has_linkage } in
  match se.ident_stack with
  | [] -> failwith "declare_var_fscope: no scope"
  | top_scope :: _ ->
      (match Hashtbl.find_opt top_scope name with
      | Some prev when not prev.has_linkage ->
          failwith ("conflicting file-scope declaration of " ^ name)
      | _ -> ());
      Hashtbl.replace top_scope name entry;
      Ast.Identifier name

(** Declare a new function in the current scope. Functions have linkage (true).
    Raises if a function with the same name already exists in the current scope
    and does not have linkage. *)
let declare_fun (se : senv) (id : Ast.ident) : Ast.ident =
  let name = get_identifier_name id in
  let has_linkage = true in
  match se.ident_stack with
  | [] -> failwith "declare fun: no active scope"
  | top_scope :: _ -> (
      match Hashtbl.find_opt top_scope name with
      | Some { has_linkage = false; _ } ->
          failwith ("function " ^ name ^ " already declared in current scope")
      | Some _ | None ->
          Hashtbl.add top_scope name { unique = name; has_linkage };
          Identifier name)

(** Resolve a variable by searching from innermost to outermost scope. Raises if
    the variable is not found. *)
let resolve_var (se : senv) (id : Ast.ident) : Ast.ident =
  let name = get_identifier_name id in
  let rec find = function
    | [] -> failwith ("variable " ^ name ^ " is not defined")
    | scope :: rest -> (
        match Hashtbl.find_opt scope name with
        | Some { unique; _ } -> Ast.Identifier unique
        | None -> find rest)
  in
  find se.ident_stack

(** Resolve a function by searching from innermost to outermost scope. Raises if
    the function is not found. *)
let resolve_fun (se : senv) (id : Ast.ident) : Ast.ident =
  let name = get_identifier_name id in
  let rec find = function
    | [] -> failwith ("function " ^ name ^ " is not defined")
    | scope :: rest -> (
        match Hashtbl.find_opt scope name with
        | Some { unique; _ } -> Ast.Identifier unique
        | None -> find rest)
  in
  find se.ident_stack

(** Declare a label in the current scope. Labels must be unique within the same
    scope. *)
let declare_lab (se : senv) (id : Ast.ident) : Ast.ident =
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
let resolve_lab (se : senv) (id : Ast.ident) : Ast.ident =
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
    Records type and storage information for resolved identifiers.

    This environment is populated during the type-checking pass, after name
    resolution has ensured that all identifiers are uniquely scoped. It is used
    to validate variable and function usage and to enforce C’s rules around
    linkage, storage duration, and definitions. *)

(** Initial value information for objects with static storage duration. *)
type initial_value =
  | Tentative  (** Tentative definition (no initialiser seen yet) *)
  | Initial of int  (** Explicit constant initialiser *)
  | NoInitialiser  (** Declared without initialiser (e.g. extern) *)

(** Attributes associated with a typed identifier. *)
type identifier_attrs =
  | FunAttr of {
      defined : bool;  (** Whether a function body has been seen *)
      global : bool;  (** Whether the function has external linkage *)
    }
  | StaticAttr of {
      init : initial_value;  (** Static object initialiser state *)
      global : bool;  (** Whether the object has external linkage *)
    }
  | LocalAttr  (** Automatic storage duration (block-scope variable) *)

type type_entry = {
  c_type : Type.ctype;  (** The C type of the identifier *)
  attrs : identifier_attrs;  (** Storage, linkage, and definition metadata *)
}

type tenv = { mutable typed_idents : (string, type_entry) Hashtbl.t }
(** Type environment mapping resolved identifier names to type entries. *)

(** Create a new type environment with an empty global scope *)
let make_tenv () : tenv = { typed_idents = Hashtbl.create 16 }

(** Look up a typed identifier in the environment. *)
let find (te : tenv) (id : Ast.ident) : type_entry option =
  Hashtbl.find_opt te.typed_idents (ident_name id)

(** Add a new typed identifier to the environment. Assumes the identifier has
    not already been declared. *)
let add (te : tenv) (id : Ast.ident) (entry : type_entry) : unit =
  Hashtbl.add te.typed_idents (ident_name id) entry

(** Insert or update a typed identifier in the environment. *)
let replace (te : tenv) (id : Ast.ident) (entry : type_entry) : unit =
  Hashtbl.replace te.typed_idents (ident_name id) entry

(** Assert that an identifier refers to a variable of integer type. Raises if
    the identifier is undeclared or refers to a function. *)
let assert_var (te : tenv) (id : Ast.ident) : unit =
  match find te id with
  | None -> failwith "variable has not been typechecked"
  | Some { c_type = Type.Int; _ } -> ()
  | Some _ -> failwith "function name used as variable"

(** Assert that an identifier refers to a function with the given arity. Raises
    if the identifier is undeclared, refers to a variable, or is called with the
    wrong number of arguments. *)
let assert_fun (te : tenv) (id : Ast.ident) (argc : int) : unit =
  match find te id with
  | None -> failwith "function has not been typechecked"
  | Some { c_type = Type.FunType p; _ } ->
      if p.param_count <> argc then
        failwith "function called with the wrong number of arguments"
  | Some _ -> failwith "variable used as function name"

(** Determine whether a function has external linkage. Looks up the function
    [id] in the type environment and returns [true] if the function has external
    linkage (i.e. should be emitted as a global symbol), or [false] if it has
    internal linkage (declared [static]).*)
let fun_is_global (te : tenv) (id : Ast.ident) : bool =
  match find te id with
  | Some { attrs = FunAttr { global; _ }; _ } -> global
  | _ -> failwith "internal error: function not found in type environment"

(** Collect all static variables recorded in the type environment. Returns a
    list of triples [(name, init, global)] for each identifier with
    [StaticAttr]. Entries with other attributes are ignored. *)
let static_vars (te : tenv) : (string * initial_value * bool) list =
  Hashtbl.fold
    (fun name entry acc ->
      match entry.attrs with
      | StaticAttr { init; global } -> (name, init, global) :: acc
      | _ -> acc)
    te.typed_idents []

(** Return [true] if the identifier has static storage duration. *)
let is_static (te : tenv) (id : Ast.ident) : bool =
  match find te id with Some { attrs = StaticAttr _; _ } -> true | _ -> false

let is_static_name (te : tenv) (name : string) : bool =
  is_static te (Ast.Identifier name)
