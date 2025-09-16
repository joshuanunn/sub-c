open Subc

let%expect_test "parse simple program" =
  let input = "int main(void) { return 2; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  print_endline (Ast.show_prog ast);
  [%expect
    {|
    (Ast.Program
       { Ast.return_type = Ast.KwInt; name = "main";
         body = (Ast.Return (Ast.LiteralInt 2)) })
  |}]
