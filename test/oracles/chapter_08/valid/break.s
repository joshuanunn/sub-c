    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $44, %rsp
    movl        $10, -4(%rbp)
    movl        $20, -8(%rbp)
    movl        $20, -12(%rbp)
    negl        -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -8(%rbp)
.Lloop.st.1:
    cmpl        $0, -8(%rbp)
    movl        $0, -16(%rbp)
    setl        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lloop.br.1
    movl        -4(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    subl        $1, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    cmpl        $0, -4(%rbp)
    movl        $0, -24(%rbp)
    setle       -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lif_end.4
    jmp         .Lloop.br.1
.Lif_end.4:
.Lloop.ct.1:
    movl        -8(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    addl        $1, -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    cmpl        $0, -4(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Land_false.10
    movl        $11, -36(%rbp)
    negl        -36(%rbp)
    movl        -36(%rbp), %r10d
    cmpl        %r10d, -8(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Land_false.10
    movl        $1, -44(%rbp)
    jmp         .Land_end.11
.Land_false.10:
    movl        $0, -44(%rbp)
.Land_end.11:
    movl        -44(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
