open Subc

let%expect_test "parse and IR generation for simple program" =
  let input = "int main(void) { return 2; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  let ir = Irgen.compile_prog ast in
  print_endline (Ir.show_prog ir);
  [%expect
    {| (Ir.Program Ir.Function {name = "main"; body = [(Ir.Return (Ir.Constant 2))]}) |}]
