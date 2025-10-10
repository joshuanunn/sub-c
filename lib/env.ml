type senv = {
  table : (string, int) Hashtbl.t;
  mutable offset : int;
  mutable label_id : int;
}

let make_senv () = { table = Hashtbl.create 16; offset = 0; label_id = 0 }

let alloc_senv_value senv name : string =
  let num = Hashtbl.length senv.table in
  let eid = name ^ "." ^ string_of_int num in
  let new_offset = senv.offset - 4 in
  Hashtbl.add senv.table eid new_offset;
  senv.offset <- new_offset;
  eid

let get_senv_offset senv name : int = Hashtbl.find senv.table name

let alloc_senv_label senv name : string =
  let num = senv.label_id in
  let eid = name ^ "." ^ string_of_int num in
  senv.label_id <- num + 1;
  eid
