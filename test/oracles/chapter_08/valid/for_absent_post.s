    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $2147483647, -8(%rbp)
    negl        -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lstart.for.1:
    movl        -4(%rbp), %eax
    cdq         
    movl        $5, %r10d
    idivl       %r10d
    movl        %edx, -12(%rbp)
    cmpl        $0, -12(%rbp)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lbreak.for.1
    movl        -4(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    addl        $1, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lcontinue.for.1:
    jmp         .Lstart.for.1
.Lbreak.for.1:
    movl        -4(%rbp), %eax
    cdq         
    movl        $5, %r10d
    idivl       %r10d
    movl        %edx, -24(%rbp)
    cmpl        $0, -24(%rbp)
    jne         .Lor_true.7
    cmpl        $0, -4(%rbp)
    movl        $0, -28(%rbp)
    setg        -28(%rbp)
    cmpl        $0, -28(%rbp)
    jne         .Lor_true.7
    movl        $0, -32(%rbp)
    jmp         .Lor_end.8
.Lor_true.7:
    movl        $1, -32(%rbp)
.Lor_end.8:
    movl        -32(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
