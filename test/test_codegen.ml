open Subc

let%expect_test "parse, IR generation and code generation for simple program" =
  let input = "int main(void) { return 2; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  let ir = Irgen.compile_prog ast in
  let asm = Codegen.compile_prog ir in
  print_endline (Asm.show_prog asm);
  [%expect
    {|
    (Asm.Program
       Asm.Function {name = "main";
         instructions =
         [Asm.Mov {src = (Asm.Imm 2); dst = (Asm.Register "eax")}; Asm.Ret]})
    |}]
