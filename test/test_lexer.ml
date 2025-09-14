open Subc

let%expect_test "leading whitespace" =
  Utils.lex_and_print_string "   return" Lexer.read;
  [%expect {|
    KW_RETURN
    EOF
  |}]

let%expect_test "trailing whitespace" =
  Utils.lex_and_print_string "0;\t\n" Lexer.read;
  [%expect {|
    LITERAL_INT(0)
    SEMICOLON
    EOF
  |}]

let%expect_test "a full program" =
  Utils.lex_and_print_string "int main(void){return 0;}" Lexer.read;
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
  Utils.lex_and_print_string "(123 bar 123bar);"  Lexer.read;
  [%expect {|
    LPAREN
    LITERAL_INT(123)
    IDENTIFIER(bar)
    Invalid integer: 123bar
  |}]
