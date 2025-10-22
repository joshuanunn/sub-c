    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $144, %rsp
    movl        $250, -4(%rbp)
    movl        $200, -8(%rbp)
    movl        $100, -12(%rbp)
    movl        $75, -16(%rbp)
    movl        $50, -20(%rbp)
    movl        $25, -24(%rbp)
    movl        $10, -28(%rbp)
    movl        $1, -32(%rbp)
    movl        $0, -36(%rbp)
    movl        $0, -40(%rbp)
    movl        $1, -36(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -44(%rbp)
    movl        -36(%rbp), %ecx
    shll        %cl, -44(%rbp)
    movl        -44(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -48(%rbp)
    movl        -32(%rbp), %ecx
    sarl        %cl, -48(%rbp)
    movl        -48(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -52(%rbp)
    movl        -28(%rbp), %r10d
    addl        %r10d, -52(%rbp)
    movl        -52(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -56(%rbp)
    movl        -24(%rbp), %r10d
    xorl        %r10d, -56(%rbp)
    movl        -56(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -60(%rbp)
    movl        -16(%rbp), %r10d
    orl         %r10d, -60(%rbp)
    movl        -60(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -64(%rbp)
    movl        -64(%rbp), %r11d
    imull       -12(%rbp), %r11d
    movl        %r11d, -64(%rbp)
    movl        -64(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -68(%rbp)
    movl        -8(%rbp), %r10d
    andl        %r10d, -68(%rbp)
    movl        -68(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    cmpl        $40, -4(%rbp)
    movl        $0, -72(%rbp)
    sete        -72(%rbp)
    cmpl        $0, -72(%rbp)
    je          .Land_false.10
    cmpl        $21800, -8(%rbp)
    movl        $0, -76(%rbp)
    sete        -76(%rbp)
    cmpl        $0, -76(%rbp)
    je          .Land_false.10
    movl        $1, -80(%rbp)
    jmp         .Land_end.11
.Land_false.10:
    movl        $0, -80(%rbp)
.Land_end.11:
    cmpl        $0, -80(%rbp)
    je          .Land_false.14
    cmpl        $109, -12(%rbp)
    movl        $0, -84(%rbp)
    sete        -84(%rbp)
    cmpl        $0, -84(%rbp)
    je          .Land_false.14
    movl        $1, -88(%rbp)
    jmp         .Land_end.15
.Land_false.14:
    movl        $0, -88(%rbp)
.Land_end.15:
    cmpl        $0, -88(%rbp)
    je          .Land_false.18
    cmpl        $41, -16(%rbp)
    movl        $0, -92(%rbp)
    sete        -92(%rbp)
    cmpl        $0, -92(%rbp)
    je          .Land_false.18
    movl        $1, -96(%rbp)
    jmp         .Land_end.19
.Land_false.18:
    movl        $0, -96(%rbp)
.Land_end.19:
    cmpl        $0, -96(%rbp)
    je          .Land_false.22
    cmpl        $41, -20(%rbp)
    movl        $0, -100(%rbp)
    sete        -100(%rbp)
    cmpl        $0, -100(%rbp)
    je          .Land_false.22
    movl        $1, -104(%rbp)
    jmp         .Land_end.23
.Land_false.22:
    movl        $0, -104(%rbp)
.Land_end.23:
    cmpl        $0, -104(%rbp)
    je          .Land_false.26
    cmpl        $27, -24(%rbp)
    movl        $0, -108(%rbp)
    sete        -108(%rbp)
    cmpl        $0, -108(%rbp)
    je          .Land_false.26
    movl        $1, -112(%rbp)
    jmp         .Land_end.27
.Land_false.26:
    movl        $0, -112(%rbp)
.Land_end.27:
    cmpl        $0, -112(%rbp)
    je          .Land_false.30
    cmpl        $2, -28(%rbp)
    movl        $0, -116(%rbp)
    sete        -116(%rbp)
    cmpl        $0, -116(%rbp)
    je          .Land_false.30
    movl        $1, -120(%rbp)
    jmp         .Land_end.31
.Land_false.30:
    movl        $0, -120(%rbp)
.Land_end.31:
    cmpl        $0, -120(%rbp)
    je          .Land_false.34
    cmpl        $2, -32(%rbp)
    movl        $0, -124(%rbp)
    sete        -124(%rbp)
    cmpl        $0, -124(%rbp)
    je          .Land_false.34
    movl        $1, -128(%rbp)
    jmp         .Land_end.35
.Land_false.34:
    movl        $0, -128(%rbp)
.Land_end.35:
    cmpl        $0, -128(%rbp)
    je          .Land_false.38
    cmpl        $1, -36(%rbp)
    movl        $0, -132(%rbp)
    sete        -132(%rbp)
    cmpl        $0, -132(%rbp)
    je          .Land_false.38
    movl        $1, -136(%rbp)
    jmp         .Land_end.39
.Land_false.38:
    movl        $0, -136(%rbp)
.Land_end.39:
    cmpl        $0, -136(%rbp)
    je          .Land_false.42
    cmpl        $40, -40(%rbp)
    movl        $0, -140(%rbp)
    sete        -140(%rbp)
    cmpl        $0, -140(%rbp)
    je          .Land_false.42
    movl        $1, -144(%rbp)
    jmp         .Land_end.43
.Land_false.42:
    movl        $0, -144(%rbp)
.Land_end.43:
    movl        -144(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
