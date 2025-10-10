open Subc

let%expect_test "IR generation for simple program" =
  (* Reset variable counters for deterministic test *)
  (* Irgen.reset_counters (); *)
  let input = "int main(void) { return 2; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  let ir, _ = Irgen.convert_prog ast in
  print_endline (Ir.show_prog ir);
  [%expect
    {| (Ir.Program Ir.Function {name = "main"; body = [(Ir.Return (Ir.Constant 2))]}) |}]

let%expect_test "IR generation using single unary operator" =
  (* Reset variable counters for deterministic test *)
  (* Irgen.reset_counters (); *)
  let input = "int main(void) { return ~2; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  let ir, _ = Irgen.convert_prog ast in
  print_endline (Ir.show_prog ir);
  [%expect
    {|
    (Ir.Program
       Ir.Function {name = "main";
         body =
         [Ir.Unary {op = Ir.BwNot; src = (Ir.Constant 2); dst = (Ir.Var "tmp.0")};
           (Ir.Return (Ir.Var "tmp.0"))]})
    |}]

let%expect_test "IR generation using chained unary operators" =
  (* Reset variable counters for deterministic test *)
  (* Irgen.reset_counters (); *)
  let input = "int main(void) { return -~-8; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  let ir, _ = Irgen.convert_prog ast in
  print_endline (Ir.show_prog ir);
  [%expect
    {|
    (Ir.Program
       Ir.Function {name = "main";
         body =
         [Ir.Unary {op = Ir.Negate; src = (Ir.Constant 8); dst = (Ir.Var "tmp.0")};
           Ir.Unary {op = Ir.BwNot; src = (Ir.Var "tmp.0");
             dst = (Ir.Var "tmp.1")};
           Ir.Unary {op = Ir.Negate; src = (Ir.Var "tmp.1");
             dst = (Ir.Var "tmp.2")};
           (Ir.Return (Ir.Var "tmp.2"))]})
    |}]

let%expect_test "IR generation test" =
  let input = "int main(void) { return 1 > 3; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  let ir, _ = Irgen.convert_prog ast in
  print_endline (Ir.show_prog ir);
  [%expect
    {|
    (Ir.Program
       Ir.Function {name = "main";
         body =
         [Ir.Binary {op = Ir.LessThan; src1 = (Ir.Constant 8);
            src2 = (Ir.Constant 9); dst = (Ir.Var "tmp.0")};
           Ir.JumpIfZero {condition = (Ir.Var "tmp.0"); target = "false_label"};
           Ir.Binary {op = Ir.GreaterThan; src1 = (Ir.Constant 1);
             src2 = (Ir.Constant 3); dst = (Ir.Var "tmp.1")};
           Ir.JumpIfZero {condition = (Ir.Var "tmp.1"); target = "false_label"};
           Ir.Copy {src = (Ir.Constant 1); dst = (Ir.Var "tmp.2")};
           Ir.Jump {target = "end"}; (Ir.Label "false_label");
           Ir.Copy {src = (Ir.Constant 0); dst = (Ir.Var "tmp.2")};
           (Ir.Label "end"); (Ir.Return (Ir.Var "tmp.2"))]})
    |}]
