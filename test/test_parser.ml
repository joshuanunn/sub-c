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
         (Ast.Return Ast.Unary {op = Ast.Complement; exp = (Ast.LiteralInt 2)})})
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
            Ast.Unary {op = Ast.Negate;
              exp =
              Ast.Unary {op = Ast.Complement;
                exp = Ast.Unary {op = Ast.Negate; exp = (Ast.LiteralInt 8)}}})})
    |}]

let%expect_test "parse program with binary expressions 1" =
  let input = "int main(void) { return 1 + 2 * 3; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  print_endline (Ast.show_prog ast);
  [%expect
    {|
    (Ast.Program
       Ast.Function {return_type = Ast.KwInt; name = "main";
         body =
         (Ast.Return
            Ast.Binary {op = Ast.Add; left = (Ast.LiteralInt 1);
              right =
              Ast.Binary {op = Ast.Multiply; left = (Ast.LiteralInt 2);
                right = (Ast.LiteralInt 3)}})})
    |}]

let%expect_test "parse program with binary expressions 2" =
  let input = "int main(void) { return 1 / 2 + 3; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  print_endline (Ast.show_prog ast);
  [%expect
    {|
    (Ast.Program
       Ast.Function {return_type = Ast.KwInt; name = "main";
         body =
         (Ast.Return
            Ast.Binary {op = Ast.Add;
              left =
              Ast.Binary {op = Ast.Divide; left = (Ast.LiteralInt 1);
                right = (Ast.LiteralInt 2)};
              right = (Ast.LiteralInt 3)})})
    |}]

let%expect_test "parse program with binary expressions 3" =
  let input = "int main(void) { return 1 / 2 * 3; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  print_endline (Ast.show_prog ast);
  [%expect
    {|
    (Ast.Program
       Ast.Function {return_type = Ast.KwInt; name = "main";
         body =
         (Ast.Return
            Ast.Binary {op = Ast.Multiply;
              left =
              Ast.Binary {op = Ast.Divide; left = (Ast.LiteralInt 1);
                right = (Ast.LiteralInt 2)};
              right = (Ast.LiteralInt 3)})})
    |}]

let%expect_test "parse program with binary expressions 4" =
  let input = "int main(void) { return 1 - 2 + 3; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  print_endline (Ast.show_prog ast);
  [%expect
    {|
    (Ast.Program
       Ast.Function {return_type = Ast.KwInt; name = "main";
         body =
         (Ast.Return
            Ast.Binary {op = Ast.Add;
              left =
              Ast.Binary {op = Ast.Subtract; left = (Ast.LiteralInt 1);
                right = (Ast.LiteralInt 2)};
              right = (Ast.LiteralInt 3)})})
    |}]

let%expect_test "parse program with binary expressions 5" =
  let input = "int main(void) { return (1 + 2) - 3; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  print_endline (Ast.show_prog ast);
  [%expect
    {|
    (Ast.Program
       Ast.Function {return_type = Ast.KwInt; name = "main";
         body =
         (Ast.Return
            Ast.Binary {op = Ast.Subtract;
              left =
              Ast.Binary {op = Ast.Add; left = (Ast.LiteralInt 1);
                right = (Ast.LiteralInt 2)};
              right = (Ast.LiteralInt 3)})})
    |}]

let%expect_test "parse program with binary expressions 6" =
  let input = "int main(void) { return 1 + (2 - 3); }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  print_endline (Ast.show_prog ast);
  [%expect
    {|
    (Ast.Program
       Ast.Function {return_type = Ast.KwInt; name = "main";
         body =
         (Ast.Return
            Ast.Binary {op = Ast.Add; left = (Ast.LiteralInt 1);
              right =
              Ast.Binary {op = Ast.Subtract; left = (Ast.LiteralInt 2);
                right = (Ast.LiteralInt 3)}})})
    |}]

let%expect_test "parse program with binary expressions 7" =
  let input = "int main(void) { return -(2 - 3); }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  print_endline (Ast.show_prog ast);
  [%expect
    {|
    (Ast.Program
       Ast.Function {return_type = Ast.KwInt; name = "main";
         body =
         (Ast.Return
            Ast.Unary {op = Ast.Negate;
              exp =
              Ast.Binary {op = Ast.Subtract; left = (Ast.LiteralInt 2);
                right = (Ast.LiteralInt 3)}})})
    |}]

let%expect_test "parse program with binary expressions 8" =
  let input = "int main(void) { return -1 + 2; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  print_endline (Ast.show_prog ast);
  [%expect
    {|
    (Ast.Program
       Ast.Function {return_type = Ast.KwInt; name = "main";
         body =
         (Ast.Return
            Ast.Binary {op = Ast.Add;
              left = Ast.Unary {op = Ast.Negate; exp = (Ast.LiteralInt 1)};
              right = (Ast.LiteralInt 2)})})
    |}]

let%expect_test "parse program with binary expressions 9" =
  let input = "int main(void) { return 1 - -2; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  print_endline (Ast.show_prog ast);
  [%expect
    {|
    (Ast.Program
       Ast.Function {return_type = Ast.KwInt; name = "main";
         body =
         (Ast.Return
            Ast.Binary {op = Ast.Subtract; left = (Ast.LiteralInt 1);
              right = Ast.Unary {op = Ast.Negate; exp = (Ast.LiteralInt 2)}})})
    |}]
