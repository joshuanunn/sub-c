open Subc

let%expect_test "code emission for simple program" =
  let input = "int main(void) { return 2; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  let ir, env = Irgen.convert_prog ast in
  let asm = Codegen.compile_prog ir in
  let asm = Codegen_lower.lower_prog asm env in
  print_string (Emit.emit_prog asm);
  [%expect
    {|
    .globl	main
    main:
    pushq	%rbp
    movq	%rsp, %rbp
    movl	$2, %eax
    movq	%rbp, %rsp
    popq	%rbp
    ret
    .section	.note.GNU-stack,"",@progbits
    |}]

let%expect_test "failing code emission for simple program" =
  let input = "int main(void) { return ~2; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  let ir, _ = Irgen.convert_prog ast in
  let asm = Codegen.compile_prog ir in
  (* deliberately skip lowering of pseudo operands *)
  try print_string (Emit.emit_prog asm)
  with Failure msg ->
    Printf.printf "Caught exception: %s\n" msg;
    [%expect {| Caught exception: Pseudo operand tmp.0 has not been lowered |}]

let%expect_test "code emission for program with single unary operator" =
  let input = "int main(void) { return ~2; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  let ir, env = Irgen.convert_prog ast in
  let asm = Codegen.compile_prog ir in
  let asm = Codegen_lower.lower_prog asm env in
  let asm = Codegen_fixup.fixup_prog asm env in
  print_string (Emit.emit_prog asm);
  [%expect
    {|
    .globl	main
    main:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$4, %rsp
    movl	$2, -4(%rbp)
    notl	-4(%rbp)
    movl	-4(%rbp), %eax
    movq	%rbp, %rsp
    popq	%rbp
    ret
    .section	.note.GNU-stack,"",@progbits
    |}]

let%expect_test "code emission for program with chained unary operators" =
  let input = "int main(void) { return -~-8; }" in
  let lexbuf = Lexing.from_string input in
  let ast = Parser.prog Lexer.read lexbuf in
  let ir, env = Irgen.convert_prog ast in
  let asm = Codegen.compile_prog ir in
  let asm = Codegen_lower.lower_prog asm env in
  let asm = Codegen_fixup.fixup_prog asm env in
  print_string (Emit.emit_prog asm);
  [%expect
    {|
    .globl	main
    main:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$12, %rsp
    movl	$8, -4(%rbp)
    negl	-4(%rbp)
    movl	-4(%rbp), %r10d
    movl	%r10d, -8(%rbp)
    notl	-8(%rbp)
    movl	-8(%rbp), %r10d
    movl	%r10d, -12(%rbp)
    negl	-12(%rbp)
    movl	-12(%rbp), %eax
    movq	%rbp, %rsp
    popq	%rbp
    ret
    .section	.note.GNU-stack,"",@progbits
    |}]
