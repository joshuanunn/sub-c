    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $44, %rsp
    movl        $1, -4(%rbp)
    movl        $2, -8(%rbp)
    addl        $1, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    subl        $1, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    cmpl        $2, -4(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Land_false.3
    cmpl        $1, -8(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Land_false.3
    movl        $1, -28(%rbp)
    jmp         .Land_end.4
.Land_false.3:
    movl        $0, -28(%rbp)
.Land_end.4:
    cmpl        $0, -28(%rbp)
    je          .Land_false.7
    cmpl        $2, -12(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Land_false.7
    movl        $1, -36(%rbp)
    jmp         .Land_end.8
.Land_false.7:
    movl        $0, -36(%rbp)
.Land_end.8:
    cmpl        $0, -36(%rbp)
    je          .Land_false.11
    cmpl        $1, -16(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Land_false.11
    movl        $1, -44(%rbp)
    jmp         .Land_end.12
.Land_false.11:
    movl        $0, -44(%rbp)
.Land_end.12:
    movl        -44(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
