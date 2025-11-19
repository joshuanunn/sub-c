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
