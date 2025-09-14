open Subc

let () =
  if Array.length Sys.argv <> 3 then (
    prerr_endline "Usage: .subc <file.c> <phase>";
    exit 1);

  let source_path = Sys.argv.(1) in
  (* let phase = int_of_string Sys.argv.(2) in *)
  let chan = open_in source_path in
  let lexbuf = Lexing.from_channel chan in

  let rec loop () =
    try
      let tok = Lexer.read lexbuf in
      print_endline (Token.string_of_token tok);
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
