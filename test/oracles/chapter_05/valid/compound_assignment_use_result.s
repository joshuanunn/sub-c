    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $40, %rsp
    movl        $1, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    addl        $3, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    cmpl        $4, -24(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Land_false.6
    cmpl        $4, -32(%rbp)
    movl        $0, -36(%rbp)
    sete        -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Land_false.6
    movl        $1, -40(%rbp)
    jmp         .Land_end.7
.Land_false.6:
    movl        $0, -40(%rbp)
.Land_end.7:
    movl        -40(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
