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
  (* Initialise a new environment *)
  let env = Env.make_senv () in
  Io.with_input_file source_path (fun lexbuf ->
      match phase with
      | 1 -> Io.run_lexer lexbuf
      | 2 -> Io.run_parser lexbuf
      | 3 -> Io.run_validator lexbuf env
      | 4 -> Io.run_irgen lexbuf env
      | 5 -> Io.run_codegen lexbuf env
      | 6 -> Io.run_emit lexbuf env
      | 7 -> Io.run_exe lexbuf target_path env
      | _ ->
          prerr_endline
            "Unknown phase. Supported: 1=lex, 2=parse, 3=validate, 4=irgen, \
             5=codegen, 6=emit, 7=exe";
          exit 1)
