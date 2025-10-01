open Subc

let%expect_test "leading whitespace" =
  Utils.lex_and_show_string "   return" Lexer.read;
  [%expect {|
    Token.KW_RETURN
    Token.EOF
  |}]

let%expect_test "trailing whitespace" =
  Utils.lex_and_show_string "0;\t\n" Lexer.read;
  [%expect {|
    (Token.LITERAL_INT 0)
    Token.SEMICOLON
    Token.EOF
  |}]

let%expect_test "a full program" =
  Utils.lex_and_show_string "int main(void){return 0;}" Lexer.read;
  [%expect
    {|
    Token.KW_INT
    (Token.IDENTIFIER "main")
    Token.LPAREN
    Token.KW_VOID
    Token.RPAREN
    Token.LBRACE
    Token.KW_RETURN
    (Token.LITERAL_INT 0)
    Token.SEMICOLON
    Token.RBRACE
    Token.EOF
|}]

let%expect_test "invalid integer literal" =
  Utils.lex_and_show_string "(123 bar 123bar);" Lexer.read;
  [%expect
    {|
    Token.LPAREN
    (Token.LITERAL_INT 123)
    (Token.IDENTIFIER "bar")
    Invalid integer: 123bar
  |}]

let%expect_test "a full program with a single unary operator" =
  Utils.lex_and_show_string "int main(void) { return ~2; }" Lexer.read;
  [%expect
    {|
    Token.KW_INT
    (Token.IDENTIFIER "main")
    Token.LPAREN
    Token.KW_VOID
    Token.RPAREN
    Token.LBRACE
    Token.KW_RETURN
    Token.BW_NOT
    (Token.LITERAL_INT 2)
    Token.SEMICOLON
    Token.RBRACE
    Token.EOF
|}]

let%expect_test "a full program with chained unary operators" =
  Utils.lex_and_show_string "int main(void) { return -~-8; }" Lexer.read;
  [%expect
    {|
    Token.KW_INT
    (Token.IDENTIFIER "main")
    Token.LPAREN
    Token.KW_VOID
    Token.RPAREN
    Token.LBRACE
    Token.KW_RETURN
    Token.MINUS
    Token.BW_NOT
    Token.MINUS
    (Token.LITERAL_INT 8)
    Token.SEMICOLON
    Token.RBRACE
    Token.EOF
|}]
