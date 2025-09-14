open Subc

let%expect_test "leading whitespace" =
  let input = "   return" in
  let lexbuf = Lexing.from_string input in
  let rec loop () =
    try
      let tok = Lexer.read lexbuf in
      print_endline (Token.string_of_token tok);
      if tok != Token.EOF then loop ()
    with Subc.Lexer.Lexing_error msg -> Printf.printf "%s\n" msg
  in
  loop ();
  [%expect {|
    KW_RETURN
    EOF
  |}]

let%expect_test "trailing whitespace" =
  let input = "0;\t\n" in
  let lexbuf = Lexing.from_string input in
  let rec loop () =
    try
      let tok = Lexer.read lexbuf in
      print_endline (Token.string_of_token tok);
      if tok != Token.EOF then loop ()
    with Subc.Lexer.Lexing_error msg -> Printf.printf "%s\n" msg
  in
  loop ();
  [%expect {|
    LITERAL_INT(0)
    SEMICOLON
    EOF
  |}]

let%expect_test "a full program" =
  let input = "int main(void){return 0;}" in
  let lexbuf = Lexing.from_string input in
  let rec loop () =
    try
      let tok = Lexer.read lexbuf in
      print_endline (Token.string_of_token tok);
      if tok != Token.EOF then loop ()
    with Subc.Lexer.Lexing_error msg -> Printf.printf "%s\n" msg
  in
  loop ();
  [%expect {|
    KW_INT
    IDENTIFIER(main)
    LPAREN
    KW_VOID
    RPAREN
    LBRACE
    KW_RETURN
    LITERAL_INT(0)
    SEMICOLON
    RBRACE
    EOF
  |}]

let%expect_test "invalid integer literal" =
  let input = "(123 bar 123bar);" in
  let lexbuf = Lexing.from_string input in
  let rec loop () =
    try
      let tok = Lexer.read lexbuf in
      print_endline (Token.string_of_token tok);
      if tok != Token.EOF then loop ()
    with Subc.Lexer.Lexing_error msg -> Printf.printf "%s\n" msg
  in
  loop ();
  [%expect {|
    LPAREN
    LITERAL_INT(123)
    IDENTIFIER(bar)
    Invalid integer: 123bar
  |}]
