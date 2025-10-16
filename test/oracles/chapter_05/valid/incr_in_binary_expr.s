    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $68, %rsp
    movl        $2, -40(%rbp)
    movl        -40(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    addl        $1, -40(%rbp)
    movl        $3, -16(%rbp)
    movl        -12(%rbp), %r10d
    addl        %r10d, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -48(%rbp)
    movl        -48(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -48(%rbp)
    addl        $1, -48(%rbp)
    movl        $4, -32(%rbp)
    movl        -48(%rbp), %r10d
    addl        %r10d, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -60(%rbp)
    cmpl        $3, -40(%rbp)
    movl        $0, -44(%rbp)
    sete        -44(%rbp)
    cmpl        $0, -44(%rbp)
    je          .Land_false.10
    cmpl        $6, -48(%rbp)
    movl        $0, -52(%rbp)
    sete        -52(%rbp)
    cmpl        $0, -52(%rbp)
    je          .Land_false.10
    movl        $1, -56(%rbp)
    jmp         .Land_end.11
.Land_false.10:
    movl        $0, -56(%rbp)
.Land_end.11:
    cmpl        $0, -56(%rbp)
    je          .Land_false.14
    cmpl        $10, -60(%rbp)
    movl        $0, -64(%rbp)
    sete        -64(%rbp)
    cmpl        $0, -64(%rbp)
    je          .Land_false.14
    movl        $1, -68(%rbp)
    jmp         .Land_end.15
.Land_false.14:
    movl        $0, -68(%rbp)
.Land_end.15:
    movl        -68(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
