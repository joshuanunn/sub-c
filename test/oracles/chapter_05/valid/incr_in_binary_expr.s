    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $44, %rsp
    movl        $2, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    addl        $1, -4(%rbp)
    movl        $3, -16(%rbp)
    movl        -12(%rbp), %r10d
    addl        %r10d, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    addl        $1, -8(%rbp)
    movl        $4, -24(%rbp)
    movl        -8(%rbp), %r10d
    addl        %r10d, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    cmpl        $3, -4(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Land_false.6
    cmpl        $6, -8(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Land_false.6
    movl        $1, -36(%rbp)
    jmp         .Land_end.7
.Land_false.6:
    movl        $0, -36(%rbp)
.Land_end.7:
    cmpl        $0, -36(%rbp)
    je          .Land_false.10
    cmpl        $10, -20(%rbp)
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
