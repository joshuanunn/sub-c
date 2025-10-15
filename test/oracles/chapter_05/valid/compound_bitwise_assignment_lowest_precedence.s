    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $188, %rsp
    movl        $11, -136(%rbp)
    movl        $12, -144(%rbp)
    movl        $0, %r11d
    cmpl        $0, %r11d
    jne         .Lor_true.6
    cmpl        $0, -144(%rbp)
    jne         .Lor_true.6
    movl        $0, -20(%rbp)
    jmp         .Lor_end.7
.Lor_true.6:
    movl        $1, -20(%rbp)
.Lor_end.7:
    movl        -136(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    movl        -20(%rbp), %r10d
    andl        %r10d, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -136(%rbp)
    cmpl        $0, -136(%rbp)
    jne         .Lor_true.10
    movl        $1, %r11d
    cmpl        $0, %r11d
    jne         .Lor_true.10
    movl        $0, -40(%rbp)
    jmp         .Lor_end.11
.Lor_true.10:
    movl        $1, -40(%rbp)
.Lor_end.11:
    movl        -144(%rbp), %r10d
    movl        %r10d, -44(%rbp)
    movl        -40(%rbp), %r10d
    xorl        %r10d, -44(%rbp)
    movl        -44(%rbp), %r10d
    movl        %r10d, -144(%rbp)
    movl        $14, -156(%rbp)
    cmpl        $0, -136(%rbp)
    jne         .Lor_true.14
    cmpl        $0, -144(%rbp)
    jne         .Lor_true.14
    movl        $0, -68(%rbp)
    jmp         .Lor_end.15
.Lor_true.14:
    movl        $1, -68(%rbp)
.Lor_end.15:
    movl        -156(%rbp), %r10d
    movl        %r10d, -72(%rbp)
    movl        -68(%rbp), %r10d
    orl         %r10d, -72(%rbp)
    movl        -72(%rbp), %r10d
    movl        %r10d, -156(%rbp)
    movl        $16, -168(%rbp)
    cmpl        $0, -156(%rbp)
    jne         .Lor_true.18
    cmpl        $0, -168(%rbp)
    jne         .Lor_true.18
    movl        $0, -96(%rbp)
    jmp         .Lor_end.19
.Lor_true.18:
    movl        $1, -96(%rbp)
.Lor_end.19:
    movl        -168(%rbp), %r10d
    movl        %r10d, -100(%rbp)
    movl        -96(%rbp), %ecx
    sarl        %cl, -100(%rbp)
    movl        -100(%rbp), %r10d
    movl        %r10d, -168(%rbp)
    movl        $18, -180(%rbp)
    cmpl        $0, -156(%rbp)
    jne         .Lor_true.22
    cmpl        $0, -168(%rbp)
    jne         .Lor_true.22
    movl        $0, -124(%rbp)
    jmp         .Lor_end.23
.Lor_true.22:
    movl        $1, -124(%rbp)
.Lor_end.23:
    movl        -180(%rbp), %r10d
    movl        %r10d, -128(%rbp)
    movl        -124(%rbp), %ecx
    shll        %cl, -128(%rbp)
    movl        -128(%rbp), %r10d
    movl        %r10d, -180(%rbp)
    cmpl        $1, -136(%rbp)
    movl        $0, -140(%rbp)
    sete        -140(%rbp)
    cmpl        $0, -140(%rbp)
    je          .Land_false.28
    cmpl        $13, -144(%rbp)
    movl        $0, -148(%rbp)
    sete        -148(%rbp)
    cmpl        $0, -148(%rbp)
    je          .Land_false.28
    movl        $1, -152(%rbp)
    jmp         .Land_end.29
.Land_false.28:
    movl        $0, -152(%rbp)
.Land_end.29:
    cmpl        $0, -152(%rbp)
    je          .Land_false.32
    cmpl        $15, -156(%rbp)
    movl        $0, -160(%rbp)
    sete        -160(%rbp)
    cmpl        $0, -160(%rbp)
    je          .Land_false.32
    movl        $1, -164(%rbp)
    jmp         .Land_end.33
.Land_false.32:
    movl        $0, -164(%rbp)
.Land_end.33:
    cmpl        $0, -164(%rbp)
    je          .Land_false.36
    cmpl        $8, -168(%rbp)
    movl        $0, -172(%rbp)
    sete        -172(%rbp)
    cmpl        $0, -172(%rbp)
    je          .Land_false.36
    movl        $1, -176(%rbp)
    jmp         .Land_end.37
.Land_false.36:
    movl        $0, -176(%rbp)
.Land_end.37:
    cmpl        $0, -176(%rbp)
    je          .Land_false.40
    cmpl        $36, -180(%rbp)
    movl        $0, -184(%rbp)
    sete        -184(%rbp)
    cmpl        $0, -184(%rbp)
    je          .Land_false.40
    movl        $1, -188(%rbp)
    jmp         .Land_end.41
.Land_false.40:
    movl        $0, -188(%rbp)
.Land_end.41:
    movl        -188(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
