    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $96, %rsp
    movl        $11, -4(%rbp)
    movl        $12, -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lmain.or.tr.1
    movl        $0, -12(%rbp)
    jmp         .Lmain.or.en.2
.Lmain.or.tr.1:
    movl        $1, -12(%rbp)
.Lmain.or.en.2:
    movl        -4(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -12(%rbp), %r10d
    andl        %r10d, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lmain.or.tr.5
    jmp         .Lmain.or.tr.5
    movl        $0, -20(%rbp)
    jmp         .Lmain.or.en.6
.Lmain.or.tr.5:
    movl        $1, -20(%rbp)
.Lmain.or.en.6:
    movl        -8(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    movl        -20(%rbp), %r10d
    xorl        %r10d, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        $14, -28(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lmain.or.tr.9
    cmpl        $0, -8(%rbp)
    jne         .Lmain.or.tr.9
    movl        $0, -32(%rbp)
    jmp         .Lmain.or.en.10
.Lmain.or.tr.9:
    movl        $1, -32(%rbp)
.Lmain.or.en.10:
    movl        -28(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    movl        -32(%rbp), %r10d
    orl         %r10d, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        $16, -40(%rbp)
    cmpl        $0, -28(%rbp)
    jne         .Lmain.or.tr.13
    cmpl        $0, -40(%rbp)
    jne         .Lmain.or.tr.13
    movl        $0, -44(%rbp)
    jmp         .Lmain.or.en.14
.Lmain.or.tr.13:
    movl        $1, -44(%rbp)
.Lmain.or.en.14:
    movl        -40(%rbp), %r10d
    movl        %r10d, -48(%rbp)
    movl        -44(%rbp), %ecx
    sarl        %cl, -48(%rbp)
    movl        -48(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    movl        $18, -52(%rbp)
    cmpl        $0, -28(%rbp)
    jne         .Lmain.or.tr.17
    cmpl        $0, -40(%rbp)
    jne         .Lmain.or.tr.17
    movl        $0, -56(%rbp)
    jmp         .Lmain.or.en.18
.Lmain.or.tr.17:
    movl        $1, -56(%rbp)
.Lmain.or.en.18:
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
    je          .Lmain.and.fl.23
    cmpl        $13, -8(%rbp)
    movl        $0, -68(%rbp)
    sete        -68(%rbp)
    cmpl        $0, -68(%rbp)
    je          .Lmain.and.fl.23
    movl        $1, -72(%rbp)
    jmp         .Lmain.and.en.24
.Lmain.and.fl.23:
    movl        $0, -72(%rbp)
.Lmain.and.en.24:
    cmpl        $0, -72(%rbp)
    je          .Lmain.and.fl.27
    cmpl        $15, -28(%rbp)
    movl        $0, -76(%rbp)
    sete        -76(%rbp)
    cmpl        $0, -76(%rbp)
    je          .Lmain.and.fl.27
    movl        $1, -80(%rbp)
    jmp         .Lmain.and.en.28
.Lmain.and.fl.27:
    movl        $0, -80(%rbp)
.Lmain.and.en.28:
    cmpl        $0, -80(%rbp)
    je          .Lmain.and.fl.31
    cmpl        $8, -40(%rbp)
    movl        $0, -84(%rbp)
    sete        -84(%rbp)
    cmpl        $0, -84(%rbp)
    je          .Lmain.and.fl.31
    movl        $1, -88(%rbp)
    jmp         .Lmain.and.en.32
.Lmain.and.fl.31:
    movl        $0, -88(%rbp)
.Lmain.and.en.32:
    cmpl        $0, -88(%rbp)
    je          .Lmain.and.fl.35
    cmpl        $36, -52(%rbp)
    movl        $0, -92(%rbp)
    sete        -92(%rbp)
    cmpl        $0, -92(%rbp)
    je          .Lmain.and.fl.35
    movl        $1, -96(%rbp)
    jmp         .Lmain.and.en.36
.Lmain.and.fl.35:
    movl        $0, -96(%rbp)
.Lmain.and.en.36:
    movl        -96(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
