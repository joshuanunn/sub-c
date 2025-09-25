open Subc

let%expect_test "parse simple program" =
  let input = "int main(void) { return 2; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  print_endline (Ast.show_prog ast);
  [%expect
    {|
    (Ast.Program
       Ast.Function {return_type = Ast.KwInt; name = "main";
         body = (Ast.Return (Ast.LiteralInt 2))})
  |}]

let%expect_test "parse program with single unary operator" =
  let input = "int main(void) { return ~2; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  print_endline (Ast.show_prog ast);
  [%expect
    {|
    (Ast.Program
       Ast.Function {return_type = Ast.KwInt; name = "main";
         body =
         (Ast.Return
            Ast.Unary {unary_operator = Ast.Complement; exp = (Ast.LiteralInt 2)})})
    |}]

let%expect_test "parse program with chained unary operators" =
  let input = "int main(void) { return -~-8; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  print_endline (Ast.show_prog ast);
  [%expect
    {|
    (Ast.Program
       Ast.Function {return_type = Ast.KwInt; name = "main";
         body =
         (Ast.Return
            Ast.Unary {unary_operator = Ast.Negate;
              exp =
              Ast.Unary {unary_operator = Ast.Complement;
                exp =
                Ast.Unary {unary_operator = Ast.Negate; exp = (Ast.LiteralInt 8)}}})})
    |}]
