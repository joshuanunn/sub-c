open Subc

let lex_and_show_string input read_fun =
  let lexbuf = Lexing.from_string input in
  let rec loop () =
    try
      let tok = read_fun lexbuf in
      print_endline (Token.show_token tok);
      if tok != Token.EOF then loop ()
    with Lexer.Lexing_error msg -> Printf.printf "%s\n" msg
  in
  loop ()
