open Ast

type senv = {
  mutable counter : int;
  table : (string, int) Hashtbl.t;
  mutable offset : int;
  scoped_var : (string, string) Hashtbl.t;
  scoped_lab : (string, string) Hashtbl.t;
}

let make_senv () =
  {
    counter = 0;
    table = Hashtbl.create 16;
    offset = 0;
    scoped_var = Hashtbl.create 16;
    scoped_lab = Hashtbl.create 16;
  }

let declare_value name senv : string =
  let eid = name ^ "." ^ string_of_int senv.counter in
  let new_offset = senv.offset - 4 in
  Hashtbl.add senv.table eid new_offset;
  senv.counter <- senv.counter + 1;
  senv.offset <- new_offset;
  eid

let insert_value (Identifier name) senv : unit =
  let new_offset = senv.offset - 4 in
  Hashtbl.add senv.table name new_offset;
  senv.offset <- new_offset;
  ()

let get_value_offset name senv : int = Hashtbl.find senv.table name

let declare_label name senv : string =
  let eid = name ^ "." ^ string_of_int senv.counter in
  senv.counter <- senv.counter + 1;
  eid

let declare_var (Identifier scope) (Identifier var_name) senv : ident =
  let scoped_name = scope ^ "." ^ var_name in
  let entry = Hashtbl.find_opt senv.scoped_var scoped_name in
  match entry with
  | Some _ ->
      failwith
        ("variable " ^ var_name ^ " has already been declared in " ^ scope)
  | None ->
      let unique_name = scoped_name ^ "." ^ string_of_int senv.counter in
      senv.counter <- senv.counter + 1;
      Hashtbl.add senv.scoped_var scoped_name unique_name;
      Identifier unique_name

let resolve_var (Identifier scope) (Identifier var_name) senv : ident =
  let scoped_name = scope ^ "." ^ var_name in
  let entry = Hashtbl.find_opt senv.scoped_var scoped_name in
  match entry with
  | Some unique_name -> Identifier unique_name
  | None -> failwith ("variable " ^ var_name ^ " is not defined in " ^ scope)

let declare_scoped_label (Identifier scope) (Identifier lab_name) senv : ident =
  let scoped_name = scope ^ "." ^ lab_name in
  let entry = Hashtbl.find_opt senv.scoped_lab scoped_name in
  match entry with
  | Some _ ->
      failwith ("label " ^ lab_name ^ " has already been declared in " ^ scope)
  | None ->
      let unique_name = scoped_name ^ "." ^ string_of_int senv.counter in
      senv.counter <- senv.counter + 1;
      Hashtbl.add senv.scoped_lab scoped_name unique_name;
      Identifier unique_name

let resolve_scoped_label (Identifier scope) (Identifier lab_name) senv : ident =
  let scoped_name = scope ^ "." ^ lab_name in
  let entry = Hashtbl.find_opt senv.scoped_lab scoped_name in
  match entry with
  | Some unique_name -> Identifier unique_name
  | None -> failwith ("label " ^ lab_name ^ " is not defined in " ^ scope)
