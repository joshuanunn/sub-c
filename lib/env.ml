open Ast

(** Extract the string name from an [Identifier], or fail. *)
let get_identifier_name = function
  | Identifier name -> name
  | _ -> failwith "expected Identifier"

(** ------------------------------------------------------------------------
    Local environment (lenv)
    ------------------------------------------------------------------------
    Tracks stack offsets for IR-level temporary values and declared variables.
    Used during IR generation and code lowering to assign concrete stack slots.
*)

type lenv = {
  mutable counter : int;
  mutable offset : int;
  stack_offsets : (string, int) Hashtbl.t;
}

(** Create a new, empty local environment *)
let make_lenv () : lenv =
  { counter = 0; offset = 0; stack_offsets = Hashtbl.create 16 }

(** Declare a new named temporary value.
    - Assigns a unique name (by appending the counter)
    - Allocates 4 bytes on the stack (offset -= 4)
    - Returns the unique identifier string. *)
let declare_value name (le : lenv) : string =
  let eid = name ^ "." ^ string_of_int le.counter in
  let new_offset = le.offset - 4 in
  Hashtbl.add le.stack_offsets eid new_offset;
  le.counter <- le.counter + 1;
  le.offset <- new_offset;
  eid

(** Insert a user-declared variable into the stack offset table. Used for
    explicit declarations (e.g. int x;). *)
let insert_value id (le : lenv) : unit =
  let name = get_identifier_name id in
  let new_offset = le.offset - 4 in
  Hashtbl.add le.stack_offsets name new_offset;
  le.offset <- new_offset;
  ()

(** Declare a unique label name for control-flow constructs *)
let declare_label name (le : lenv) : string =
  let eid = name ^ "." ^ string_of_int le.counter in
  le.counter <- le.counter + 1;
  eid

(** Look up the stack offset for a given variable name *)
let get_value_offset name (le : lenv) : int = Hashtbl.find le.stack_offsets name

(** ------------------------------------------------------------------------
    Symbol environment (senv)
    ------------------------------------------------------------------------
    Handles semantic scoping of variables and labels at the AST level. Each
    entry in [var_stack] and [lab_stack] represents one lexical scope. New
    compound statements push a new scope; leaving them pops it. *)

type senv = {
  mutable counter : int;
  mutable var_stack : (string, string) Hashtbl.t list;
  mutable lab_stack : (string, string) Hashtbl.t list;
}

(** Create a new symbol environment with a single global scope *)
let make_senv () : senv =
  {
    counter = 0;
    var_stack = [ Hashtbl.create 16 ];
    lab_stack = [ Hashtbl.create 16 ];
  }

let push_var_scope (se : senv) =
  se.var_stack <- Hashtbl.create 16 :: se.var_stack

let pop_var_scope (se : senv) =
  match se.var_stack with
  | [] -> failwith "no var scope to pop"
  | _ :: rest -> se.var_stack <- rest

let push_lab_scope (se : senv) =
  se.lab_stack <- Hashtbl.create 16 :: se.lab_stack

let pop_lab_scope (se : senv) =
  match se.lab_stack with
  | [] -> failwith "no lab scope to pop"
  | _ :: rest -> se.lab_stack <- rest

(** Declare a new variable in the current scope. Generates a unique scoped name
    (e.g. "x.3"). Raises if the variable already exists in the same scope. *)
let declare_var id (se : senv) : Ast.ident =
  let name = get_identifier_name id in
  match se.var_stack with
  | [] -> failwith "declare var: no active scope"
  | top_scope :: _ ->
      if Hashtbl.mem top_scope name then
        failwith ("variable " ^ name ^ " already declared in current scope");
      let unique = name ^ "." ^ string_of_int se.counter in
      se.counter <- se.counter + 1;
      Hashtbl.add top_scope name unique;
      Identifier unique

(** Resolve a variable identifier by searching the stack of scopes. Looks from
    innermost to outermost scope. Raises if the variable is not defined. *)
let resolve_var id (se : senv) : Ast.ident =
  let name = get_identifier_name id in
  let rec find = function
    | [] -> failwith ("variable " ^ name ^ " is not defined")
    | scope :: rest -> (
        match Hashtbl.find_opt scope name with
        | Some unique -> Identifier unique
        | None -> find rest)
  in
  find se.var_stack

(** Declare a label in the current scope. Like variables, labels must be unique
    within the same scope. *)
let declare_lab id (se : senv) : Ast.ident =
  let name = get_identifier_name id in
  match se.lab_stack with
  | [] -> failwith "declare lab: no active scope"
  | top_scope :: _ ->
      if Hashtbl.mem top_scope name then
        failwith ("label " ^ name ^ " already declared in current scope");
      let unique = name ^ "." ^ string_of_int se.counter in
      se.counter <- se.counter + 1;
      Hashtbl.add top_scope name unique;
      GotoLabel unique

(** Resolve a label name by searching outward through the label stack. *)
let resolve_lab id (se : senv) : Ast.ident =
  let name = get_identifier_name id in
  let rec find = function
    | [] -> failwith ("label " ^ name ^ " is not defined")
    | scope :: rest -> (
        match Hashtbl.find_opt scope name with
        | Some unique -> GotoLabel unique
        | None -> find rest)
  in
  find se.lab_stack
