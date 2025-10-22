open Ast

type lenv = {
  mutable counter : int;
  mutable offset : int;
  stack_offsets : (string, int) Hashtbl.t;
}

let make_lenv () : lenv =
  { counter = 0; offset = 0; stack_offsets = Hashtbl.create 16 }

let declare_value name (le : lenv) : string =
  let eid = name ^ "." ^ string_of_int le.counter in
  let new_offset = le.offset - 4 in
  Hashtbl.add le.stack_offsets eid new_offset;
  le.counter <- le.counter + 1;
  le.offset <- new_offset;
  eid

let insert_value (Identifier name) (le : lenv) : unit =
  let new_offset = le.offset - 4 in
  Hashtbl.add le.stack_offsets name new_offset;
  le.offset <- new_offset;
  ()

let declare_label name (le : lenv) : string =
  let eid = name ^ "." ^ string_of_int le.counter in
  le.counter <- le.counter + 1;
  eid

let get_value_offset name (le : lenv) : int = Hashtbl.find le.stack_offsets name

type senv = {
  mutable counter : int;
  scoped_var : (string, string) Hashtbl.t;
  scoped_lab : (string, string) Hashtbl.t;
}

let make_senv () : senv =
  {
    counter = 0;
    scoped_var = Hashtbl.create 16;
    scoped_lab = Hashtbl.create 16;
  }

let declare_var (Identifier scope) (Identifier var_name) (se : senv) : Ast.ident
    =
  let scoped_name = scope ^ "." ^ var_name in
  let entry = Hashtbl.find_opt se.scoped_var scoped_name in
  match entry with
  | Some _ ->
      failwith
        ("variable " ^ var_name ^ " has already been declared in " ^ scope)
  | None ->
      let unique_name = scoped_name ^ "." ^ string_of_int se.counter in
      se.counter <- se.counter + 1;
      Hashtbl.add se.scoped_var scoped_name unique_name;
      Identifier unique_name

let resolve_var (Identifier scope) (Identifier var_name) (se : senv) : Ast.ident
    =
  let scoped_name = scope ^ "." ^ var_name in
  let entry = Hashtbl.find_opt se.scoped_var scoped_name in
  match entry with
  | Some unique_name -> Identifier unique_name
  | None -> failwith ("variable " ^ var_name ^ " is not defined in " ^ scope)

let declare_scoped_label (Identifier scope) (Identifier lab_name) (se : senv) :
    Ast.ident =
  let scoped_name = scope ^ "." ^ lab_name in
  let entry = Hashtbl.find_opt se.scoped_lab scoped_name in
  match entry with
  | Some _ ->
      failwith ("label " ^ lab_name ^ " has already been declared in " ^ scope)
  | None ->
      let unique_name = scoped_name ^ "." ^ string_of_int se.counter in
      se.counter <- se.counter + 1;
      Hashtbl.add se.scoped_lab scoped_name unique_name;
      Identifier unique_name

let resolve_scoped_label (Identifier scope) (Identifier lab_name) (se : senv) :
    Ast.ident =
  let scoped_name = scope ^ "." ^ lab_name in
  let entry = Hashtbl.find_opt se.scoped_lab scoped_name in
  match entry with
  | Some unique_name -> Identifier unique_name
  | None -> failwith ("label " ^ lab_name ^ " is not defined in " ^ scope)
