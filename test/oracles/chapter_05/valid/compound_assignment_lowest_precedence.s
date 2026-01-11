    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $80, %rsp
    movl        $10, -4(%rbp)
    movl        $12, -8(%rbp)
    movl        $1, -12(%rbp)
    movl        $10, -16(%rbp)
    movl        -12(%rbp), %r10d
    addl        %r10d, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        $0, -20(%rbp)
    movl        $12, -24(%rbp)
    movl        -24(%rbp), %r11d
    imull       -20(%rbp), %r11d
    movl        %r11d, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        $14, -28(%rbp)
    cmpl        $0, -16(%rbp)
    jne         .Lmain.or.tr.9
    cmpl        $0, -24(%rbp)
    jne         .Lmain.or.tr.9
    movl        $0, -32(%rbp)
    jmp         .Lmain.or.en.10
.Lmain.or.tr.9:
    movl        $1, -32(%rbp)
.Lmain.or.en.10:
    movl        $14, -36(%rbp)
    movl        -32(%rbp), %r10d
    subl        %r10d, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        $16, -40(%rbp)
    movl        $1, -44(%rbp)
    movl        $16, %eax
    cdq         
    idivl       -44(%rbp)
    movl        %eax, -48(%rbp)
    movl        -48(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    cmpl        $11, -16(%rbp)
    movl        $0, -52(%rbp)
    sete        -52(%rbp)
    cmpl        $0, -52(%rbp)
    je          .Lmain.and.fl.19
    cmpl        $0, -24(%rbp)
    movl        $0, -56(%rbp)
    sete        -56(%rbp)
    cmpl        $0, -56(%rbp)
    je          .Lmain.and.fl.19
    movl        $1, -60(%rbp)
    jmp         .Lmain.and.en.20
.Lmain.and.fl.19:
    movl        $0, -60(%rbp)
.Lmain.and.en.20:
    cmpl        $0, -60(%rbp)
    je          .Lmain.and.fl.23
    cmpl        $13, -36(%rbp)
    movl        $0, -64(%rbp)
    sete        -64(%rbp)
    cmpl        $0, -64(%rbp)
    je          .Lmain.and.fl.23
    movl        $1, -68(%rbp)
    jmp         .Lmain.and.en.24
.Lmain.and.fl.23:
    movl        $0, -68(%rbp)
.Lmain.and.en.24:
    cmpl        $0, -68(%rbp)
    je          .Lmain.and.fl.27
    cmpl        $16, -40(%rbp)
    movl        $0, -72(%rbp)
    sete        -72(%rbp)
    cmpl        $0, -72(%rbp)
    je          .Lmain.and.fl.27
    movl        $1, -76(%rbp)
    jmp         .Lmain.and.en.28
.Lmain.and.fl.27:
    movl        $0, -76(%rbp)
.Lmain.and.en.28:
    movl        -76(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
