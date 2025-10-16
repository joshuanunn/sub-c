    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $40, %rsp
    movl        $1, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    addl        $1, -24(%rbp)
    cmpl        $0, -12(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    cmpl        $2, -24(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Land_false.7
    cmpl        $0, -32(%rbp)
    movl        $0, -36(%rbp)
    sete        -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Land_false.7
    movl        $1, -40(%rbp)
    jmp         .Land_end.8
.Land_false.7:
    movl        $0, -40(%rbp)
.Land_end.8:
    movl        -40(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
