open Subc

let () =
  if Array.length Sys.argv <> 3 then (
    prerr_endline "Usage: .subc <file.c> <phase>";
    exit 1);

  let source_path = Sys.argv.(1) in
  let target_path = Io.assembly_path source_path in
  let phase =
    match int_of_string_opt Sys.argv.(2) with
    | Some n -> n
    | None ->
        prerr_endline "Phase must be an integer";
        exit 1
  in
  Io.with_input_file source_path (fun lexbuf ->
      match phase with
      | 1 -> Io.run_lexer lexbuf
      | 2 -> Io.run_parser lexbuf
      | 3 -> Io.run_codegen lexbuf
      | 4 -> Io.run_emit lexbuf
      | 5 -> Io.run_exe lexbuf target_path
      | _ ->
          prerr_endline
            "Unknown phase. Supported: 1=lex, 2=parse, 3=codegen, 4=emit, 5=exe";
          exit 1)
