open Subc

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
      print_endline (Token.show_token tok);
      if tok != Token.EOF then loop ()
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

let run_codegen lexbuf =
  try
    let ast = Parser.prog Lexer.read lexbuf in
    let asm = Codegen.compile_prog ast in
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

let () =
  if Array.length Sys.argv <> 3 then (
    prerr_endline "Usage: .subc <file.c> <phase>";
    exit 1);

  let source_path = Sys.argv.(1) in
  let phase =
    match int_of_string_opt Sys.argv.(2) with
    | Some n -> n
    | None ->
        prerr_endline "Phase must be an integer";
        exit 1
  in
  with_input_file source_path (fun lexbuf ->
      match phase with
      | 1 -> run_lexer lexbuf
      | 2 -> run_parser lexbuf
      | 3 -> run_codegen lexbuf
      | _ ->
          prerr_endline "Unknown phase. Supported: 1=lex, 2=parse, 3=codegen";
          exit 1)
