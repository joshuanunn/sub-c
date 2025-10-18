    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $124, %rsp
    movl        $250, -4(%rbp)
    movl        $200, -8(%rbp)
    movl        $100, -12(%rbp)
    movl        $75, -16(%rbp)
    movl        $25, -24(%rbp)
    negl        -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        $0, -28(%rbp)
    movl        $0, -32(%rbp)
    movl        $7, -36(%rbp)
    negl        -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        -20(%rbp), %eax
    cdq         
    idivl       -28(%rbp)
    movl        %edx, -40(%rbp)
    movl        -40(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -16(%rbp), %eax
    cdq         
    idivl       -20(%rbp)
    movl        %eax, -44(%rbp)
    movl        -44(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -48(%rbp)
    movl        -48(%rbp), %r11d
    imull       -16(%rbp), %r11d
    movl        %r11d, -48(%rbp)
    movl        -48(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -52(%rbp)
    movl        -12(%rbp), %r10d
    subl        %r10d, -52(%rbp)
    movl        -52(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -56(%rbp)
    movl        -8(%rbp), %r10d
    addl        %r10d, -56(%rbp)
    movl        -56(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    cmpl        $2250, -4(%rbp)
    movl        $0, -60(%rbp)
    sete        -60(%rbp)
    cmpl        $0, -60(%rbp)
    je          .Land_false.17
    cmpl        $2000, -8(%rbp)
    movl        $0, -64(%rbp)
    sete        -64(%rbp)
    cmpl        $0, -64(%rbp)
    je          .Land_false.17
    movl        $1, -68(%rbp)
    jmp         .Land_end.18
.Land_false.17:
    movl        $0, -68(%rbp)
.Land_end.18:
    cmpl        $0, -68(%rbp)
    je          .Land_false.22
    movl        $1800, -72(%rbp)
    negl        -72(%rbp)
    movl        -72(%rbp), %r10d
    cmpl        %r10d, -12(%rbp)
    movl        $0, -76(%rbp)
    sete        -76(%rbp)
    cmpl        $0, -76(%rbp)
    je          .Land_false.22
    movl        $1, -80(%rbp)
    jmp         .Land_end.23
.Land_false.22:
    movl        $0, -80(%rbp)
.Land_end.23:
    cmpl        $0, -80(%rbp)
    je          .Land_false.27
    movl        $18, -84(%rbp)
    negl        -84(%rbp)
    movl        -84(%rbp), %r10d
    cmpl        %r10d, -16(%rbp)
    movl        $0, -88(%rbp)
    sete        -88(%rbp)
    cmpl        $0, -88(%rbp)
    je          .Land_false.27
    movl        $1, -92(%rbp)
    jmp         .Land_end.28
.Land_false.27:
    movl        $0, -92(%rbp)
.Land_end.28:
    cmpl        $0, -92(%rbp)
    je          .Land_false.32
    movl        $4, -96(%rbp)
    negl        -96(%rbp)
    movl        -96(%rbp), %r10d
    cmpl        %r10d, -20(%rbp)
    movl        $0, -100(%rbp)
    sete        -100(%rbp)
    cmpl        $0, -100(%rbp)
    je          .Land_false.32
    movl        $1, -104(%rbp)
    jmp         .Land_end.33
.Land_false.32:
    movl        $0, -104(%rbp)
.Land_end.33:
    cmpl        $0, -104(%rbp)
    je          .Land_false.37
    movl        $7, -108(%rbp)
    negl        -108(%rbp)
    movl        -108(%rbp), %r10d
    cmpl        %r10d, -28(%rbp)
    movl        $0, -112(%rbp)
    sete        -112(%rbp)
    cmpl        $0, -112(%rbp)
    je          .Land_false.37
    movl        $1, -116(%rbp)
    jmp         .Land_end.38
.Land_false.37:
    movl        $0, -116(%rbp)
.Land_end.38:
    cmpl        $0, -116(%rbp)
    je          .Land_false.41
    cmpl        $2250, -32(%rbp)
    movl        $0, -120(%rbp)
    sete        -120(%rbp)
    cmpl        $0, -120(%rbp)
    je          .Land_false.41
    movl        $1, -124(%rbp)
    jmp         .Land_end.42
.Land_false.41:
    movl        $0, -124(%rbp)
.Land_end.42:
    movl        -124(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
