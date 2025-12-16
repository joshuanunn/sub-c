    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $96, %rsp
    movl        $11, -4(%rbp)
    movl        $12, -8(%rbp)
    movl        $0, %r11d
    cmpl        $0, %r11d
    jne         .Lor.tr.1
    cmpl        $0, -8(%rbp)
    jne         .Lor.tr.1
    movl        $0, -12(%rbp)
    jmp         .Lor.en.2
.Lor.tr.1:
    movl        $1, -12(%rbp)
.Lor.en.2:
    movl        -4(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -12(%rbp), %r10d
    andl        %r10d, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lor.tr.5
    movl        $1, %r11d
    cmpl        $0, %r11d
    jne         .Lor.tr.5
    movl        $0, -20(%rbp)
    jmp         .Lor.en.6
.Lor.tr.5:
    movl        $1, -20(%rbp)
.Lor.en.6:
    movl        -8(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    movl        -20(%rbp), %r10d
    xorl        %r10d, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        $14, -28(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lor.tr.9
    cmpl        $0, -8(%rbp)
    jne         .Lor.tr.9
    movl        $0, -32(%rbp)
    jmp         .Lor.en.10
.Lor.tr.9:
    movl        $1, -32(%rbp)
.Lor.en.10:
    movl        -28(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    movl        -32(%rbp), %r10d
    orl         %r10d, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        $16, -40(%rbp)
    cmpl        $0, -28(%rbp)
    jne         .Lor.tr.13
    cmpl        $0, -40(%rbp)
    jne         .Lor.tr.13
    movl        $0, -44(%rbp)
    jmp         .Lor.en.14
.Lor.tr.13:
    movl        $1, -44(%rbp)
.Lor.en.14:
    movl        -40(%rbp), %r10d
    movl        %r10d, -48(%rbp)
    movl        -44(%rbp), %ecx
    sarl        %cl, -48(%rbp)
    movl        -48(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    movl        $18, -52(%rbp)
    cmpl        $0, -28(%rbp)
    jne         .Lor.tr.17
    cmpl        $0, -40(%rbp)
    jne         .Lor.tr.17
    movl        $0, -56(%rbp)
    jmp         .Lor.en.18
.Lor.tr.17:
    movl        $1, -56(%rbp)
.Lor.en.18:
    movl        -52(%rbp), %r10d
    movl        %r10d, -60(%rbp)
    movl        -56(%rbp), %ecx
    shll        %cl, -60(%rbp)
    movl        -60(%rbp), %r10d
    movl        %r10d, -52(%rbp)
    cmpl        $1, -4(%rbp)
    movl        $0, -64(%rbp)
    sete        -64(%rbp)
    cmpl        $0, -64(%rbp)
    je          .Land.fl.23
    cmpl        $13, -8(%rbp)
    movl        $0, -68(%rbp)
    sete        -68(%rbp)
    cmpl        $0, -68(%rbp)
    je          .Land.fl.23
    movl        $1, -72(%rbp)
    jmp         .Land.en.24
.Land.fl.23:
    movl        $0, -72(%rbp)
.Land.en.24:
    cmpl        $0, -72(%rbp)
    je          .Land.fl.27
    cmpl        $15, -28(%rbp)
    movl        $0, -76(%rbp)
    sete        -76(%rbp)
    cmpl        $0, -76(%rbp)
    je          .Land.fl.27
    movl        $1, -80(%rbp)
    jmp         .Land.en.28
.Land.fl.27:
    movl        $0, -80(%rbp)
.Land.en.28:
    cmpl        $0, -80(%rbp)
    je          .Land.fl.31
    cmpl        $8, -40(%rbp)
    movl        $0, -84(%rbp)
    sete        -84(%rbp)
    cmpl        $0, -84(%rbp)
    je          .Land.fl.31
    movl        $1, -88(%rbp)
    jmp         .Land.en.32
.Land.fl.31:
    movl        $0, -88(%rbp)
.Land.en.32:
    cmpl        $0, -88(%rbp)
    je          .Land.fl.35
    cmpl        $36, -52(%rbp)
    movl        $0, -92(%rbp)
    sete        -92(%rbp)
    cmpl        $0, -92(%rbp)
    je          .Land.fl.35
    movl        $1, -96(%rbp)
    jmp         .Land.en.36
.Land.fl.35:
    movl        $0, -96(%rbp)
.Land.en.36:
    movl        -96(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
