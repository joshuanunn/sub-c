    .globl      main
    .text       
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
    je          .Lmain.and.fl.10
    cmpl        $21800, -8(%rbp)
    movl        $0, -76(%rbp)
    sete        -76(%rbp)
    cmpl        $0, -76(%rbp)
    je          .Lmain.and.fl.10
    movl        $1, -80(%rbp)
    jmp         .Lmain.and.en.11
.Lmain.and.fl.10:
    movl        $0, -80(%rbp)
.Lmain.and.en.11:
    cmpl        $0, -80(%rbp)
    je          .Lmain.and.fl.14
    cmpl        $109, -12(%rbp)
    movl        $0, -84(%rbp)
    sete        -84(%rbp)
    cmpl        $0, -84(%rbp)
    je          .Lmain.and.fl.14
    movl        $1, -88(%rbp)
    jmp         .Lmain.and.en.15
.Lmain.and.fl.14:
    movl        $0, -88(%rbp)
.Lmain.and.en.15:
    cmpl        $0, -88(%rbp)
    je          .Lmain.and.fl.18
    cmpl        $41, -16(%rbp)
    movl        $0, -92(%rbp)
    sete        -92(%rbp)
    cmpl        $0, -92(%rbp)
    je          .Lmain.and.fl.18
    movl        $1, -96(%rbp)
    jmp         .Lmain.and.en.19
.Lmain.and.fl.18:
    movl        $0, -96(%rbp)
.Lmain.and.en.19:
    cmpl        $0, -96(%rbp)
    je          .Lmain.and.fl.22
    cmpl        $41, -20(%rbp)
    movl        $0, -100(%rbp)
    sete        -100(%rbp)
    cmpl        $0, -100(%rbp)
    je          .Lmain.and.fl.22
    movl        $1, -104(%rbp)
    jmp         .Lmain.and.en.23
.Lmain.and.fl.22:
    movl        $0, -104(%rbp)
.Lmain.and.en.23:
    cmpl        $0, -104(%rbp)
    je          .Lmain.and.fl.26
    cmpl        $27, -24(%rbp)
    movl        $0, -108(%rbp)
    sete        -108(%rbp)
    cmpl        $0, -108(%rbp)
    je          .Lmain.and.fl.26
    movl        $1, -112(%rbp)
    jmp         .Lmain.and.en.27
.Lmain.and.fl.26:
    movl        $0, -112(%rbp)
.Lmain.and.en.27:
    cmpl        $0, -112(%rbp)
    je          .Lmain.and.fl.30
    cmpl        $2, -28(%rbp)
    movl        $0, -116(%rbp)
    sete        -116(%rbp)
    cmpl        $0, -116(%rbp)
    je          .Lmain.and.fl.30
    movl        $1, -120(%rbp)
    jmp         .Lmain.and.en.31
.Lmain.and.fl.30:
    movl        $0, -120(%rbp)
.Lmain.and.en.31:
    cmpl        $0, -120(%rbp)
    je          .Lmain.and.fl.34
    cmpl        $2, -32(%rbp)
    movl        $0, -124(%rbp)
    sete        -124(%rbp)
    cmpl        $0, -124(%rbp)
    je          .Lmain.and.fl.34
    movl        $1, -128(%rbp)
    jmp         .Lmain.and.en.35
.Lmain.and.fl.34:
    movl        $0, -128(%rbp)
.Lmain.and.en.35:
    cmpl        $0, -128(%rbp)
    je          .Lmain.and.fl.38
    cmpl        $1, -36(%rbp)
    movl        $0, -132(%rbp)
    sete        -132(%rbp)
    cmpl        $0, -132(%rbp)
    je          .Lmain.and.fl.38
    movl        $1, -136(%rbp)
    jmp         .Lmain.and.en.39
.Lmain.and.fl.38:
    movl        $0, -136(%rbp)
.Lmain.and.en.39:
    cmpl        $0, -136(%rbp)
    je          .Lmain.and.fl.42
    cmpl        $40, -40(%rbp)
    movl        $0, -140(%rbp)
    sete        -140(%rbp)
    cmpl        $0, -140(%rbp)
    je          .Lmain.and.fl.42
    movl        $1, -144(%rbp)
    jmp         .Lmain.and.en.43
.Lmain.and.fl.42:
    movl        $0, -144(%rbp)
.Lmain.and.en.43:
    movl        -144(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
