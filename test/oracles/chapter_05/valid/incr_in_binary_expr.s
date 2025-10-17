    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $64, %rsp
    movl        $2, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    addl        $1, -36(%rbp)
    movl        $3, -16(%rbp)
    movl        -12(%rbp), %r10d
    addl        %r10d, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -44(%rbp)
    addl        $1, -44(%rbp)
    movl        $4, -28(%rbp)
    movl        -44(%rbp), %r10d
    addl        %r10d, -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -56(%rbp)
    cmpl        $3, -36(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Land_false.9
    cmpl        $6, -44(%rbp)
    movl        $0, -48(%rbp)
    sete        -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Land_false.9
    movl        $1, -52(%rbp)
    jmp         .Land_end.10
.Land_false.9:
    movl        $0, -52(%rbp)
.Land_end.10:
    cmpl        $0, -52(%rbp)
    je          .Land_false.13
    cmpl        $10, -56(%rbp)
    movl        $0, -60(%rbp)
    sete        -60(%rbp)
    cmpl        $0, -60(%rbp)
    je          .Land_false.13
    movl        $1, -64(%rbp)
    jmp         .Land_end.14
.Land_false.13:
    movl        $0, -64(%rbp)
.Land_end.14:
    movl        -64(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
