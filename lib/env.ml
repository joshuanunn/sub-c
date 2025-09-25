type senv = { table : (string, int) Hashtbl.t; mutable offset : int }

let make_senv () = { table = Hashtbl.create 16; offset = 0 }

let alloc_senv_value senv name : string =
  let num = Hashtbl.length senv.table in
  let eid = name ^ "." ^ string_of_int num in
  let new_offset = senv.offset - 4 in
  Hashtbl.add senv.table eid new_offset;
  senv.offset <- new_offset;
  eid

let get_senv_offset senv name : int = Hashtbl.find senv.table name
