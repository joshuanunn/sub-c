	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$4, %rsp
	movl	$0, %r11d
	cmpl	$0, %r11d
	jne  	.Lor_true.0
	movl	$0, %r11d
	cmpl	$0, %r11d
	jne  	.Lor_true.0
	movl	$0, -4(%rbp)
	jmp  	.Lor_end.1
.Lor_true.0:
	movl	$1, -4(%rbp)
.Lor_end.1:
	movl	-4(%rbp), %eax
	movq	%rbp, %rsp
	popq	%rbp
	ret
	.section	.note.GNU-stack,"",@progbits
