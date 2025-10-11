open Subc

let%expect_test "code generation for simple program" =
  let input = "int main(void) { return 2; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  let ir, _ = Irgen.convert_prog ast in
  let asm = Codegen.compile_prog ir in
  print_endline (Asm.show_prog asm);
  [%expect
    {|
    (Asm.Program
       Asm.Function {name = "main";
         instructions =
         [Asm.Mov {src = (Asm.Imm 2); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
    |}]

let%expect_test "code generation for program with single unary operator" =
  let input = "int main(void) { return ~2; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  let ir, _ = Irgen.convert_prog ast in
  let asm = Codegen.compile_prog ir in
  print_endline (Asm.show_prog asm);
  [%expect
    {|
    (Asm.Program
       Asm.Function {name = "main";
         instructions =
         [Asm.Mov {src = (Asm.Imm 2); dst = (Asm.Pseudo "tmp.0")};
           Asm.Unary {uop = Asm.BwNot; dst = (Asm.Pseudo "tmp.0")};
           Asm.Mov {src = (Asm.Pseudo "tmp.0"); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
    |}]

let%expect_test "code generation for program with chained unary operators" =
  let input = "int main(void) { return -~-8; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  let ir, _ = Irgen.convert_prog ast in
  let asm = Codegen.compile_prog ir in
  print_endline (Asm.show_prog asm);
  [%expect
    {|
    (Asm.Program
       Asm.Function {name = "main";
         instructions =
         [Asm.Mov {src = (Asm.Imm 8); dst = (Asm.Pseudo "tmp.0")};
           Asm.Unary {uop = Asm.Neg; dst = (Asm.Pseudo "tmp.0")};
           Asm.Mov {src = (Asm.Pseudo "tmp.0"); dst = (Asm.Pseudo "tmp.1")};
           Asm.Unary {uop = Asm.BwNot; dst = (Asm.Pseudo "tmp.1")};
           Asm.Mov {src = (Asm.Pseudo "tmp.1"); dst = (Asm.Pseudo "tmp.2")};
           Asm.Unary {uop = Asm.Neg; dst = (Asm.Pseudo "tmp.2")};
           Asm.Mov {src = (Asm.Pseudo "tmp.2"); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
    |}]

let%expect_test "lowered code generation for program with single unary operator"
    =
  let input = "int main(void) { return ~2; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  let ir, env = Irgen.convert_prog ast in
  let asm = Codegen.compile_prog ir in
  let asm = Codegen_lower.lower_prog asm env in
  print_endline (Asm.show_prog asm);
  [%expect
    {|
    (Asm.Program
       Asm.Function {name = "main";
         instructions =
         [Asm.Mov {src = (Asm.Imm 2); dst = (Asm.Stack -4)};
           Asm.Unary {uop = Asm.BwNot; dst = (Asm.Stack -4)};
           Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
    |}]

let%expect_test
    "lowered code generation for program with chained unary operators" =
  let input = "int main(void) { return -~-8; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  let ir, env = Irgen.convert_prog ast in
  let asm = Codegen.compile_prog ir in
  let asm = Codegen_lower.lower_prog asm env in
  print_endline (Asm.show_prog asm);
  [%expect
    {|
    (Asm.Program
       Asm.Function {name = "main";
         instructions =
         [Asm.Mov {src = (Asm.Imm 8); dst = (Asm.Stack -4)};
           Asm.Unary {uop = Asm.Neg; dst = (Asm.Stack -4)};
           Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Stack -8)};
           Asm.Unary {uop = Asm.BwNot; dst = (Asm.Stack -8)};
           Asm.Mov {src = (Asm.Stack -8); dst = (Asm.Stack -12)};
           Asm.Unary {uop = Asm.Neg; dst = (Asm.Stack -12)};
           Asm.Mov {src = (Asm.Stack -12); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
    |}]
