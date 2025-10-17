    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $84, %rsp
    movl        $1, -40(%rbp)
    movl        $2, -48(%rbp)
    addl        $1, -40(%rbp)
    movl        -40(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    negl        -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -60(%rbp)
    movl        -48(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    subl        $1, -48(%rbp)
    cmpl        $0, -28(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -76(%rbp)
    cmpl        $2, -40(%rbp)
    movl        $0, -44(%rbp)
    sete        -44(%rbp)
    cmpl        $0, -44(%rbp)
    je          .Land_false.10
    cmpl        $1, -48(%rbp)
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
    je          .Land_false.15
    movl        $2, -64(%rbp)
    negl        -64(%rbp)
    movl        -64(%rbp), %r10d
    cmpl        %r10d, -60(%rbp)
    movl        $0, -68(%rbp)
    sete        -68(%rbp)
    cmpl        $0, -68(%rbp)
    je          .Land_false.15
    movl        $1, -72(%rbp)
    jmp         .Land_end.16
.Land_false.15:
    movl        $0, -72(%rbp)
.Land_end.16:
    cmpl        $0, -72(%rbp)
    je          .Land_false.19
    cmpl        $0, -76(%rbp)
    movl        $0, -80(%rbp)
    sete        -80(%rbp)
    cmpl        $0, -80(%rbp)
    je          .Land_false.19
    movl        $1, -84(%rbp)
    jmp         .Land_end.20
.Land_false.19:
    movl        $0, -84(%rbp)
.Land_end.20:
    movl        -84(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
