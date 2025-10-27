    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $56, %rsp
    movl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        $1, -12(%rbp)
    movl        $100, -16(%rbp)
.Lloop.st.1:
    cmpl        $0, -16(%rbp)
    movl        $0, -20(%rbp)
    setg        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lloop.br.1
    movl        $1, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    movl        -12(%rbp), %r10d
    addl        %r10d, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -12(%rbp)
.Lloop.ct.1:
    movl        -16(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    subl        $1, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    cmpl        $101, -12(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Land_false.6
    cmpl        $0, -4(%rbp)
    movl        $0, -44(%rbp)
    sete        -44(%rbp)
    cmpl        $0, -44(%rbp)
    je          .Land_false.6
    movl        $1, -48(%rbp)
    jmp         .Land_end.7
.Land_false.6:
    movl        $0, -48(%rbp)
.Land_end.7:
    cmpl        $0, -48(%rbp)
    je          .Land_false.10
    cmpl        $0, -8(%rbp)
    movl        $0, -52(%rbp)
    sete        -52(%rbp)
    cmpl        $0, -52(%rbp)
    je          .Land_false.10
    movl        $1, -56(%rbp)
    jmp         .Land_end.11
.Land_false.10:
    movl        $0, -56(%rbp)
.Land_end.11:
    movl        -56(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
