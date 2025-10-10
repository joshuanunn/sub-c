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
