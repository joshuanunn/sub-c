    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $76, %rsp
    movl        $1, -36(%rbp)
    movl        $2, -44(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    addl        $1, -36(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -56(%rbp)
    movl        -44(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    subl        $1, -44(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -68(%rbp)
    cmpl        $2, -36(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Land_false.9
    cmpl        $1, -44(%rbp)
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
    cmpl        $1, -56(%rbp)
    movl        $0, -60(%rbp)
    sete        -60(%rbp)
    cmpl        $0, -60(%rbp)
    je          .Land_false.13
    movl        $1, -64(%rbp)
    jmp         .Land_end.14
.Land_false.13:
    movl        $0, -64(%rbp)
.Land_end.14:
    cmpl        $0, -64(%rbp)
    je          .Land_false.17
    cmpl        $2, -68(%rbp)
    movl        $0, -72(%rbp)
    sete        -72(%rbp)
    cmpl        $0, -72(%rbp)
    je          .Land_false.17
    movl        $1, -76(%rbp)
    jmp         .Land_end.18
.Land_false.17:
    movl        $0, -76(%rbp)
.Land_end.18:
    movl        -76(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
