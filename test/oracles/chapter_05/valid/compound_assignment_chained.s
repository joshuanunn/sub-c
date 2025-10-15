    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $200, %rsp
    movl        $250, -108(%rbp)
    movl        $200, -116(%rbp)
    movl        $100, -128(%rbp)
    movl        $75, -144(%rbp)
    movl        $25, -20(%rbp)
    negl        -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -160(%rbp)
    movl        $0, -176(%rbp)
    movl        $0, -192(%rbp)
    movl        $7, -56(%rbp)
    negl        -56(%rbp)
    movl        -56(%rbp), %r10d
    movl        %r10d, -176(%rbp)
    movl        -160(%rbp), %eax
    cdq         
    idivl       -176(%rbp)
    movl        %edx, -64(%rbp)
    movl        -64(%rbp), %r10d
    movl        %r10d, -160(%rbp)
    movl        -144(%rbp), %eax
    cdq         
    idivl       -160(%rbp)
    movl        %eax, -72(%rbp)
    movl        -72(%rbp), %r10d
    movl        %r10d, -144(%rbp)
    movl        -128(%rbp), %r10d
    movl        %r10d, -80(%rbp)
    movl        -80(%rbp), %r11d
    imull       -144(%rbp), %r11d
    movl        %r11d, -80(%rbp)
    movl        -80(%rbp), %r10d
    movl        %r10d, -128(%rbp)
    movl        -116(%rbp), %r10d
    movl        %r10d, -88(%rbp)
    movl        -128(%rbp), %r10d
    subl        %r10d, -88(%rbp)
    movl        -88(%rbp), %r10d
    movl        %r10d, -116(%rbp)
    movl        -108(%rbp), %r10d
    movl        %r10d, -96(%rbp)
    movl        -116(%rbp), %r10d
    addl        %r10d, -96(%rbp)
    movl        -96(%rbp), %r10d
    movl        %r10d, -108(%rbp)
    movl        -108(%rbp), %r10d
    movl        %r10d, -192(%rbp)
    cmpl        $2250, -108(%rbp)
    movl        $0, -112(%rbp)
    sete        -112(%rbp)
    cmpl        $0, -112(%rbp)
    je          .Land_false.17
    cmpl        $2000, -116(%rbp)
    movl        $0, -120(%rbp)
    sete        -120(%rbp)
    cmpl        $0, -120(%rbp)
    je          .Land_false.17
    movl        $1, -124(%rbp)
    jmp         .Land_end.18
.Land_false.17:
    movl        $0, -124(%rbp)
.Land_end.18:
    cmpl        $0, -124(%rbp)
    je          .Land_false.22
    movl        $1800, -132(%rbp)
    negl        -132(%rbp)
    movl        -132(%rbp), %r10d
    cmpl        %r10d, -128(%rbp)
    movl        $0, -136(%rbp)
    sete        -136(%rbp)
    cmpl        $0, -136(%rbp)
    je          .Land_false.22
    movl        $1, -140(%rbp)
    jmp         .Land_end.23
.Land_false.22:
    movl        $0, -140(%rbp)
.Land_end.23:
    cmpl        $0, -140(%rbp)
    je          .Land_false.27
    movl        $18, -148(%rbp)
    negl        -148(%rbp)
    movl        -148(%rbp), %r10d
    cmpl        %r10d, -144(%rbp)
    movl        $0, -152(%rbp)
    sete        -152(%rbp)
    cmpl        $0, -152(%rbp)
    je          .Land_false.27
    movl        $1, -156(%rbp)
    jmp         .Land_end.28
.Land_false.27:
    movl        $0, -156(%rbp)
.Land_end.28:
    cmpl        $0, -156(%rbp)
    je          .Land_false.32
    movl        $4, -164(%rbp)
    negl        -164(%rbp)
    movl        -164(%rbp), %r10d
    cmpl        %r10d, -160(%rbp)
    movl        $0, -168(%rbp)
    sete        -168(%rbp)
    cmpl        $0, -168(%rbp)
    je          .Land_false.32
    movl        $1, -172(%rbp)
    jmp         .Land_end.33
.Land_false.32:
    movl        $0, -172(%rbp)
.Land_end.33:
    cmpl        $0, -172(%rbp)
    je          .Land_false.37
    movl        $7, -180(%rbp)
    negl        -180(%rbp)
    movl        -180(%rbp), %r10d
    cmpl        %r10d, -176(%rbp)
    movl        $0, -184(%rbp)
    sete        -184(%rbp)
    cmpl        $0, -184(%rbp)
    je          .Land_false.37
    movl        $1, -188(%rbp)
    jmp         .Land_end.38
.Land_false.37:
    movl        $0, -188(%rbp)
.Land_end.38:
    cmpl        $0, -188(%rbp)
    je          .Land_false.41
    cmpl        $2250, -192(%rbp)
    movl        $0, -196(%rbp)
    sete        -196(%rbp)
    cmpl        $0, -196(%rbp)
    je          .Land_false.41
    movl        $1, -200(%rbp)
    jmp         .Land_end.42
.Land_false.41:
    movl        $0, -200(%rbp)
.Land_end.42:
    movl        -200(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
