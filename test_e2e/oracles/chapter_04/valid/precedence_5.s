	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$24, %rsp
	movl	$0, %r11d
	cmpl	$0, %r11d
	movl	$0, -4(%rbp)
	sete 	-4(%rbp)
	cmpl	$0, -4(%rbp)
	je   	.Land_false.0
	movl	$2, -8(%rbp)
	addl	$1, -8(%rbp)
	cmpl	$1, -8(%rbp)
	movl	$0, -12(%rbp)
	setg 	-12(%rbp)
	movl	$3, %r11d
	cmpl	-12(%rbp), %r11d
	movl	$0, -16(%rbp)
	sete 	-16(%rbp)
	cmpl	$0, -16(%rbp)
	je   	.Land_false.0
	movl	$1, -20(%rbp)
	jmp  	.Land_end.1
.Land_false.0:
	movl	$0, -20(%rbp)
.Land_end.1:
	movl	-20(%rbp), %r10d
	movl	%r10d, -24(%rbp)
	addl	$1, -24(%rbp)
	movl	-24(%rbp), %eax
	movq	%rbp, %rsp
	popq	%rbp
	ret
	.section	.note.GNU-stack,"",@progbits
