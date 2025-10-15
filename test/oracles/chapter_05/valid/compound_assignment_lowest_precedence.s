    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $148, %rsp
    movl        $10, -108(%rbp)
    movl        $12, -116(%rbp)
    movl        $0, %r11d
    cmpl        $0, %r11d
    jne         .Lor_true.5
    cmpl        $0, -116(%rbp)
    jne         .Lor_true.5
    movl        $0, -20(%rbp)
    jmp         .Lor_end.6
.Lor_true.5:
    movl        $1, -20(%rbp)
.Lor_end.6:
    movl        -108(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    movl        -20(%rbp), %r10d
    addl        %r10d, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -108(%rbp)
    cmpl        $0, -108(%rbp)
    je          .Land_false.9
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Land_false.9
    movl        $1, -40(%rbp)
    jmp         .Land_end.10
.Land_false.9:
    movl        $0, -40(%rbp)
.Land_end.10:
    movl        -116(%rbp), %r10d
    movl        %r10d, -44(%rbp)
    movl        -44(%rbp), %r11d
    imull       -40(%rbp), %r11d
    movl        %r11d, -44(%rbp)
    movl        -44(%rbp), %r10d
    movl        %r10d, -116(%rbp)
    movl        $14, -128(%rbp)
    cmpl        $0, -108(%rbp)
    jne         .Lor_true.13
    cmpl        $0, -116(%rbp)
    jne         .Lor_true.13
    movl        $0, -68(%rbp)
    jmp         .Lor_end.14
.Lor_true.13:
    movl        $1, -68(%rbp)
.Lor_end.14:
    movl        -128(%rbp), %r10d
    movl        %r10d, -72(%rbp)
    movl        -68(%rbp), %r10d
    subl        %r10d, -72(%rbp)
    movl        -72(%rbp), %r10d
    movl        %r10d, -128(%rbp)
    movl        $16, -140(%rbp)
    cmpl        $0, -128(%rbp)
    jne         .Lor_true.17
    cmpl        $0, -140(%rbp)
    jne         .Lor_true.17
    movl        $0, -96(%rbp)
    jmp         .Lor_end.18
.Lor_true.17:
    movl        $1, -96(%rbp)
.Lor_end.18:
    movl        -140(%rbp), %eax
    cdq         
    idivl       -96(%rbp)
    movl        %eax, -100(%rbp)
    movl        -100(%rbp), %r10d
    movl        %r10d, -140(%rbp)
    cmpl        $11, -108(%rbp)
    movl        $0, -112(%rbp)
    sete        -112(%rbp)
    cmpl        $0, -112(%rbp)
    je          .Land_false.23
    cmpl        $0, -116(%rbp)
    movl        $0, -120(%rbp)
    sete        -120(%rbp)
    cmpl        $0, -120(%rbp)
    je          .Land_false.23
    movl        $1, -124(%rbp)
    jmp         .Land_end.24
.Land_false.23:
    movl        $0, -124(%rbp)
.Land_end.24:
    cmpl        $0, -124(%rbp)
    je          .Land_false.27
    cmpl        $13, -128(%rbp)
    movl        $0, -132(%rbp)
    sete        -132(%rbp)
    cmpl        $0, -132(%rbp)
    je          .Land_false.27
    movl        $1, -136(%rbp)
    jmp         .Land_end.28
.Land_false.27:
    movl        $0, -136(%rbp)
.Land_end.28:
    cmpl        $0, -136(%rbp)
    je          .Land_false.31
    cmpl        $16, -140(%rbp)
    movl        $0, -144(%rbp)
    sete        -144(%rbp)
    cmpl        $0, -144(%rbp)
    je          .Land_false.31
    movl        $1, -148(%rbp)
    jmp         .Land_end.32
.Land_false.31:
    movl        $0, -148(%rbp)
.Land_end.32:
    movl        -148(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
