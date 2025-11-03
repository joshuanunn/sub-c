let () =
  if Array.length Sys.argv <> 3 then (
    prerr_endline "Usage: .subc <file.c> <phase>";
    exit 1);

  let source_path = Sys.argv.(1) in
  let target_path = Subc.Io.assembly_path source_path in
  let phase =
    match int_of_string_opt Sys.argv.(2) with
    | Some n -> n
    | None ->
        prerr_endline "Phase must be an integer";
        exit 1
  in
  (* Initialise new environments *)
  let s_env = Subc.Env.make_senv () in
  let l_env = Subc.Env.make_lenv () in
  Subc.Io.with_input_file source_path (fun lexbuf ->
      match phase with
      | 1 -> Subc.Io.run_lexer lexbuf
      | 2 -> Subc.Io.run_parser lexbuf
      | 3 -> Subc.Io.run_validator lexbuf s_env
      | 4 -> Subc.Io.run_irgen lexbuf s_env l_env
      | 5 -> Subc.Io.run_codegen lexbuf s_env l_env
      | 6 -> Subc.Io.run_emit lexbuf s_env l_env
      | 7 -> Subc.Io.run_exe lexbuf target_path s_env l_env
      | _ ->
          prerr_endline
            "Unknown phase. Supported: 1=lex, 2=parse, 3=validate, 4=irgen, \
             5=codegen, 6=emit, 7=exe";
          exit 1)
