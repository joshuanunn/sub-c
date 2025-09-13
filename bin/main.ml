open Subc

let () =
  if Array.length Sys.argv <> 3 then exit 1;

  let source_path = Sys.argv.(1) in
  (* let phase = int_of_string Sys.argv.(2) in *)
  List.iter print_endline (Io.read_lines source_path)
