    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $56, %rsp
    movl        $10, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        $0, -12(%rbp)
.Lloop.st.1:
    movl        -12(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    addl        $1, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    cmpl        $0, -4(%rbp)
    movl        $0, -20(%rbp)
    setle       -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lif_end.2
    jmp         .Lloop.ct.1
.Lif_end.2:
    movl        -4(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    subl        $1, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    cmpl        $10, -8(%rbp)
    movl        $0, -28(%rbp)
    setge       -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lif_end.5
    jmp         .Lloop.ct.1
.Lif_end.5:
    movl        -8(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    addl        $1, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -8(%rbp)
.Lloop.ct.1:
    cmpl        $50, -12(%rbp)
    movl        $0, -36(%rbp)
    setne       -36(%rbp)
    cmpl        $0, -36(%rbp)
    jne         .Lloop.st.1
.Lloop.br.1:
    cmpl        $50, -12(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Land_false.11
    cmpl        $0, -4(%rbp)
    movl        $0, -44(%rbp)
    sete        -44(%rbp)
    cmpl        $0, -44(%rbp)
    je          .Land_false.11
    movl        $1, -48(%rbp)
    jmp         .Land_end.12
.Land_false.11:
    movl        $0, -48(%rbp)
.Land_end.12:
    cmpl        $0, -48(%rbp)
    je          .Land_false.15
    cmpl        $10, -8(%rbp)
    movl        $0, -52(%rbp)
    sete        -52(%rbp)
    cmpl        $0, -52(%rbp)
    je          .Land_false.15
    movl        $1, -56(%rbp)
    jmp         .Land_end.16
.Land_false.15:
    movl        $0, -56(%rbp)
.Land_end.16:
    movl        -56(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
