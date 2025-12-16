let assembly_path path =
  let base = Filename.remove_extension path in
  base ^ ".s"

let with_input_file path f =
  let chan = open_in path in
  let lexbuf = Lexing.from_channel chan in
  let result =
    try f lexbuf
    with e ->
      close_in chan;
      raise e
  in
  close_in chan;
  result

let run_lexer lexbuf =
  let rec loop () =
    try
      let tok = Lexer.read lexbuf in
      print_endline (Lexer_pp.show_token tok);
      if tok != Parser.EOF then loop ()
    with Lexer.Lexing_error msg ->
      let pos = lexbuf.Lexing.lex_curr_p in
      Printf.eprintf "Lexing error at line %d, column %d: %s\n"
        pos.Lexing.pos_lnum
        (pos.Lexing.pos_cnum - pos.Lexing.pos_bol)
        msg;
      exit 1
  in
  loop ()

let run_parser lexbuf =
  try
    let ast = Parser.prog Lexer.read lexbuf in
    print_endline (Ast.show_prog ast)
  with Parser.Error ->
    let pos = lexbuf.Lexing.lex_curr_p in
    Printf.eprintf "Parse error at line %d, column %d\n" pos.Lexing.pos_lnum
      (pos.Lexing.pos_cnum - pos.Lexing.pos_bol);
    exit 1

let run_validator lexbuf s_env t_env =
  try
    let ast = Parser.prog Lexer.read lexbuf in
    let ast = Ast_resolution.resolve_prog ast s_env in
    let ast = Ast_flow_label.label_prog ast in
    Ast_type_check.type_prog ast t_env;
    print_endline (Ast.show_prog ast)
  with
  | Parser.Error ->
      let pos = lexbuf.Lexing.lex_curr_p in
      Printf.eprintf "Parse error at line %d, column %d\n" pos.Lexing.pos_lnum
        (pos.Lexing.pos_cnum - pos.Lexing.pos_bol);
      exit 1
  | e ->
      prerr_endline ("Semantic analysis error: " ^ Printexc.to_string e);
      exit 1

let run_irgen lexbuf s_env t_env =
  try
    let ast = Parser.prog Lexer.read lexbuf in
    let ast = Ast_resolution.resolve_prog ast s_env in
    let ast = Ast_flow_label.label_prog ast in
    Ast_type_check.type_prog ast t_env;
    let ir = Irgen.convert_prog ast t_env in
    print_endline (Ir.show_prog ir)
  with
  | Parser.Error ->
      let pos = lexbuf.Lexing.lex_curr_p in
      Printf.eprintf "Parse error at line %d, column %d\n" pos.Lexing.pos_lnum
        (pos.Lexing.pos_cnum - pos.Lexing.pos_bol);
      exit 1
  | e ->
      prerr_endline ("IR generation error: " ^ Printexc.to_string e);
      exit 1

let run_codegen lexbuf s_env t_env =
  try
    let ast = Parser.prog Lexer.read lexbuf in
    let ast = Ast_resolution.resolve_prog ast s_env in
    let ast = Ast_flow_label.label_prog ast in
    Ast_type_check.type_prog ast t_env;
    let ir = Irgen.convert_prog ast t_env in
    let asm = Codegen.compile_prog ir in
    let asm = Codegen_lower.lower_prog asm t_env in
    let asm = Codegen_fixup.fixup_prog asm in
    print_endline (Asm.show_prog asm)
  with
  | Parser.Error ->
      let pos = lexbuf.Lexing.lex_curr_p in
      Printf.eprintf "Parse error at line %d, column %d\n" pos.Lexing.pos_lnum
        (pos.Lexing.pos_cnum - pos.Lexing.pos_bol);
      exit 1
  | e ->
      prerr_endline ("Code generation error: " ^ Printexc.to_string e);
      exit 1

let run_emit lexbuf s_env t_env =
  try
    let ast = Parser.prog Lexer.read lexbuf in
    let ast = Ast_resolution.resolve_prog ast s_env in
    let ast = Ast_flow_label.label_prog ast in
    Ast_type_check.type_prog ast t_env;
    let ir = Irgen.convert_prog ast t_env in
    let asm = Codegen.compile_prog ir in
    let asm = Codegen_lower.lower_prog asm t_env in
    let asm = Codegen_fixup.fixup_prog asm in
    print_string (Emit.emit_prog asm)
  with
  | Parser.Error ->
      let pos = lexbuf.Lexing.lex_curr_p in
      Printf.eprintf "Parse error at line %d, column %d\n" pos.Lexing.pos_lnum
        (pos.Lexing.pos_cnum - pos.Lexing.pos_bol);
      exit 1
  | e ->
      prerr_endline ("Code generation error: " ^ Printexc.to_string e);
      exit 1

let run_exe lexbuf output_path s_env t_env =
  try
    let ast = Parser.prog Lexer.read lexbuf in
    let ast = Ast_resolution.resolve_prog ast s_env in
    let ast = Ast_flow_label.label_prog ast in
    Ast_type_check.type_prog ast t_env;
    let ir = Irgen.convert_prog ast t_env in
    let asm = Codegen.compile_prog ir in
    let asm = Codegen_lower.lower_prog asm t_env in
    let asm = Codegen_fixup.fixup_prog asm in
    let asm_text = Emit.emit_prog asm in
    let oc = open_out output_path in
    Fun.protect
      ~finally:(fun () -> close_out oc)
      (fun () -> output_string oc asm_text)
  with
  | Parser.Error ->
      let pos = lexbuf.Lexing.lex_curr_p in
      Printf.eprintf "Parse error at line %d, column %d\n" pos.Lexing.pos_lnum
        (pos.Lexing.pos_cnum - pos.Lexing.pos_bol);
      exit 1
  | e ->
      prerr_endline ("Code generation error: " ^ Printexc.to_string e);
      exit 1
