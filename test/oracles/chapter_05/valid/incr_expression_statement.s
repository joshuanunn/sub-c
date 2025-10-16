    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $72, %rsp
    movl        $0, -52(%rbp)
    movl        $0, -60(%rbp)
    movl        -52(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -52(%rbp)
    addl        $1, -52(%rbp)
    movl        -52(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -52(%rbp)
    addl        $1, -52(%rbp)
    movl        -52(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -52(%rbp)
    addl        $1, -52(%rbp)
    movl        -60(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    movl        -40(%rbp), %r10d
    movl        %r10d, -60(%rbp)
    subl        $1, -60(%rbp)
    movl        -60(%rbp), %r10d
    movl        %r10d, -48(%rbp)
    movl        -48(%rbp), %r10d
    movl        %r10d, -60(%rbp)
    subl        $1, -60(%rbp)
    cmpl        $3, -52(%rbp)
    movl        $0, -56(%rbp)
    sete        -56(%rbp)
    cmpl        $0, -56(%rbp)
    je          .Land_false.11
    movl        $2, -64(%rbp)
    negl        -64(%rbp)
    movl        -64(%rbp), %r10d
    cmpl        %r10d, -60(%rbp)
    movl        $0, -68(%rbp)
    sete        -68(%rbp)
    cmpl        $0, -68(%rbp)
    je          .Land_false.11
    movl        $1, -72(%rbp)
    jmp         .Land_end.12
.Land_false.11:
    movl        $0, -72(%rbp)
.Land_end.12:
    movl        -72(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
