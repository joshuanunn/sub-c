    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $88, %rsp
    movl        $1, -44(%rbp)
    movl        $2, -52(%rbp)
    movl        -44(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -44(%rbp)
    addl        $1, -44(%rbp)
    movl        -44(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    negl        -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -64(%rbp)
    movl        -52(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -52(%rbp)
    subl        $1, -52(%rbp)
    cmpl        $0, -32(%rbp)
    movl        $0, -36(%rbp)
    sete        -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -80(%rbp)
    cmpl        $2, -44(%rbp)
    movl        $0, -48(%rbp)
    sete        -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Land_false.11
    cmpl        $1, -52(%rbp)
    movl        $0, -56(%rbp)
    sete        -56(%rbp)
    cmpl        $0, -56(%rbp)
    je          .Land_false.11
    movl        $1, -60(%rbp)
    jmp         .Land_end.12
.Land_false.11:
    movl        $0, -60(%rbp)
.Land_end.12:
    cmpl        $0, -60(%rbp)
    je          .Land_false.16
    movl        $2, -68(%rbp)
    negl        -68(%rbp)
    movl        -68(%rbp), %r10d
    cmpl        %r10d, -64(%rbp)
    movl        $0, -72(%rbp)
    sete        -72(%rbp)
    cmpl        $0, -72(%rbp)
    je          .Land_false.16
    movl        $1, -76(%rbp)
    jmp         .Land_end.17
.Land_false.16:
    movl        $0, -76(%rbp)
.Land_end.17:
    cmpl        $0, -76(%rbp)
    je          .Land_false.20
    cmpl        $0, -80(%rbp)
    movl        $0, -84(%rbp)
    sete        -84(%rbp)
    cmpl        $0, -84(%rbp)
    je          .Land_false.20
    movl        $1, -88(%rbp)
    jmp         .Land_end.21
.Land_false.20:
    movl        $0, -88(%rbp)
.Land_end.21:
    movl        -88(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
