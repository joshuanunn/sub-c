open Subc

let%expect_test
    "parse, IR generation, code generation and emission for simple program" =
  let input = "int main(void) { return 2; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  let ir = Irgen.compile_prog ast in
  let asm = Codegen.compile_prog ir in
  print_endline (Emit.emit_prog asm);
  [%expect
    {|
    	.globl	main
    main:
    	movl	$2, %eax
    	ret
    	.section	.note.GNU-stack,"",@progbits
    |}]
