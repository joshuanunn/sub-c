    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $76, %rsp
    movl        $10, -4(%rbp)
    movl        $12, -8(%rbp)
    movl        $0, %r11d
    cmpl        $0, %r11d
    jne         .Lor_true.1
    cmpl        $0, -8(%rbp)
    jne         .Lor_true.1
    movl        $0, -12(%rbp)
    jmp         .Lor_end.2
.Lor_true.1:
    movl        $1, -12(%rbp)
.Lor_end.2:
    movl        -4(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -12(%rbp), %r10d
    addl        %r10d, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Land_false.5
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Land_false.5
    movl        $1, -20(%rbp)
    jmp         .Land_end.6
.Land_false.5:
    movl        $0, -20(%rbp)
.Land_end.6:
    movl        -8(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    movl        -24(%rbp), %r11d
    imull       -20(%rbp), %r11d
    movl        %r11d, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        $14, -28(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lor_true.9
    cmpl        $0, -8(%rbp)
    jne         .Lor_true.9
    movl        $0, -32(%rbp)
    jmp         .Lor_end.10
.Lor_true.9:
    movl        $1, -32(%rbp)
.Lor_end.10:
    movl        -28(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    movl        -32(%rbp), %r10d
    subl        %r10d, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        $16, -40(%rbp)
    cmpl        $0, -28(%rbp)
    jne         .Lor_true.13
    cmpl        $0, -40(%rbp)
    jne         .Lor_true.13
    movl        $0, -44(%rbp)
    jmp         .Lor_end.14
.Lor_true.13:
    movl        $1, -44(%rbp)
.Lor_end.14:
    movl        -40(%rbp), %eax
    cdq         
    idivl       -44(%rbp)
    movl        %eax, -48(%rbp)
    movl        -48(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    cmpl        $11, -4(%rbp)
    movl        $0, -52(%rbp)
    sete        -52(%rbp)
    cmpl        $0, -52(%rbp)
    je          .Land_false.19
    cmpl        $0, -8(%rbp)
    movl        $0, -56(%rbp)
    sete        -56(%rbp)
    cmpl        $0, -56(%rbp)
    je          .Land_false.19
    movl        $1, -60(%rbp)
    jmp         .Land_end.20
.Land_false.19:
    movl        $0, -60(%rbp)
.Land_end.20:
    cmpl        $0, -60(%rbp)
    je          .Land_false.23
    cmpl        $13, -28(%rbp)
    movl        $0, -64(%rbp)
    sete        -64(%rbp)
    cmpl        $0, -64(%rbp)
    je          .Land_false.23
    movl        $1, -68(%rbp)
    jmp         .Land_end.24
.Land_false.23:
    movl        $0, -68(%rbp)
.Land_end.24:
    cmpl        $0, -68(%rbp)
    je          .Land_false.27
    cmpl        $16, -40(%rbp)
    movl        $0, -72(%rbp)
    sete        -72(%rbp)
    cmpl        $0, -72(%rbp)
    je          .Land_false.27
    movl        $1, -76(%rbp)
    jmp         .Land_end.28
.Land_false.27:
    movl        $0, -76(%rbp)
.Land_end.28:
    movl        -76(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
