    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $252, %rsp
    movl        $250, -140(%rbp)
    movl        $200, -148(%rbp)
    movl        $100, -160(%rbp)
    movl        $75, -172(%rbp)
    movl        $50, -184(%rbp)
    movl        $25, -196(%rbp)
    movl        $10, -208(%rbp)
    movl        $1, -220(%rbp)
    movl        $0, -232(%rbp)
    movl        $0, -244(%rbp)
    movl        $1, -232(%rbp)
    movl        -220(%rbp), %r10d
    movl        %r10d, -76(%rbp)
    movl        -232(%rbp), %ecx
    shll        %cl, -76(%rbp)
    movl        -76(%rbp), %r10d
    movl        %r10d, -220(%rbp)
    movl        -208(%rbp), %r10d
    movl        %r10d, -84(%rbp)
    movl        -220(%rbp), %ecx
    sarl        %cl, -84(%rbp)
    movl        -84(%rbp), %r10d
    movl        %r10d, -208(%rbp)
    movl        -196(%rbp), %r10d
    movl        %r10d, -92(%rbp)
    movl        -208(%rbp), %r10d
    addl        %r10d, -92(%rbp)
    movl        -92(%rbp), %r10d
    movl        %r10d, -196(%rbp)
    movl        -184(%rbp), %r10d
    movl        %r10d, -100(%rbp)
    movl        -196(%rbp), %r10d
    xorl        %r10d, -100(%rbp)
    movl        -100(%rbp), %r10d
    movl        %r10d, -184(%rbp)
    movl        -184(%rbp), %r10d
    movl        %r10d, -172(%rbp)
    movl        -160(%rbp), %r10d
    movl        %r10d, -112(%rbp)
    movl        -172(%rbp), %r10d
    orl         %r10d, -112(%rbp)
    movl        -112(%rbp), %r10d
    movl        %r10d, -160(%rbp)
    movl        -148(%rbp), %r10d
    movl        %r10d, -120(%rbp)
    movl        -120(%rbp), %r11d
    imull       -160(%rbp), %r11d
    movl        %r11d, -120(%rbp)
    movl        -120(%rbp), %r10d
    movl        %r10d, -148(%rbp)
    movl        -140(%rbp), %r10d
    movl        %r10d, -128(%rbp)
    movl        -148(%rbp), %r10d
    andl        %r10d, -128(%rbp)
    movl        -128(%rbp), %r10d
    movl        %r10d, -140(%rbp)
    movl        -140(%rbp), %r10d
    movl        %r10d, -244(%rbp)
    cmpl        $40, -140(%rbp)
    movl        $0, -144(%rbp)
    sete        -144(%rbp)
    cmpl        $0, -144(%rbp)
    je          .Land_false.20
    cmpl        $21800, -148(%rbp)
    movl        $0, -152(%rbp)
    sete        -152(%rbp)
    cmpl        $0, -152(%rbp)
    je          .Land_false.20
    movl        $1, -156(%rbp)
    jmp         .Land_end.21
.Land_false.20:
    movl        $0, -156(%rbp)
.Land_end.21:
    cmpl        $0, -156(%rbp)
    je          .Land_false.24
    cmpl        $109, -160(%rbp)
    movl        $0, -164(%rbp)
    sete        -164(%rbp)
    cmpl        $0, -164(%rbp)
    je          .Land_false.24
    movl        $1, -168(%rbp)
    jmp         .Land_end.25
.Land_false.24:
    movl        $0, -168(%rbp)
.Land_end.25:
    cmpl        $0, -168(%rbp)
    je          .Land_false.28
    cmpl        $41, -172(%rbp)
    movl        $0, -176(%rbp)
    sete        -176(%rbp)
    cmpl        $0, -176(%rbp)
    je          .Land_false.28
    movl        $1, -180(%rbp)
    jmp         .Land_end.29
.Land_false.28:
    movl        $0, -180(%rbp)
.Land_end.29:
    cmpl        $0, -180(%rbp)
    je          .Land_false.32
    cmpl        $41, -184(%rbp)
    movl        $0, -188(%rbp)
    sete        -188(%rbp)
    cmpl        $0, -188(%rbp)
    je          .Land_false.32
    movl        $1, -192(%rbp)
    jmp         .Land_end.33
.Land_false.32:
    movl        $0, -192(%rbp)
.Land_end.33:
    cmpl        $0, -192(%rbp)
    je          .Land_false.36
    cmpl        $27, -196(%rbp)
    movl        $0, -200(%rbp)
    sete        -200(%rbp)
    cmpl        $0, -200(%rbp)
    je          .Land_false.36
    movl        $1, -204(%rbp)
    jmp         .Land_end.37
.Land_false.36:
    movl        $0, -204(%rbp)
.Land_end.37:
    cmpl        $0, -204(%rbp)
    je          .Land_false.40
    cmpl        $2, -208(%rbp)
    movl        $0, -212(%rbp)
    sete        -212(%rbp)
    cmpl        $0, -212(%rbp)
    je          .Land_false.40
    movl        $1, -216(%rbp)
    jmp         .Land_end.41
.Land_false.40:
    movl        $0, -216(%rbp)
.Land_end.41:
    cmpl        $0, -216(%rbp)
    je          .Land_false.44
    cmpl        $2, -220(%rbp)
    movl        $0, -224(%rbp)
    sete        -224(%rbp)
    cmpl        $0, -224(%rbp)
    je          .Land_false.44
    movl        $1, -228(%rbp)
    jmp         .Land_end.45
.Land_false.44:
    movl        $0, -228(%rbp)
.Land_end.45:
    cmpl        $0, -228(%rbp)
    je          .Land_false.48
    cmpl        $1, -232(%rbp)
    movl        $0, -236(%rbp)
    sete        -236(%rbp)
    cmpl        $0, -236(%rbp)
    je          .Land_false.48
    movl        $1, -240(%rbp)
    jmp         .Land_end.49
.Land_false.48:
    movl        $0, -240(%rbp)
.Land_end.49:
    cmpl        $0, -240(%rbp)
    je          .Land_false.52
    cmpl        $40, -244(%rbp)
    movl        $0, -248(%rbp)
    sete        -248(%rbp)
    cmpl        $0, -248(%rbp)
    je          .Land_false.52
    movl        $1, -252(%rbp)
    jmp         .Land_end.53
.Land_false.52:
    movl        $0, -252(%rbp)
.Land_end.53:
    movl        -252(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
