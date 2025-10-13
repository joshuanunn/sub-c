    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $52, %rsp
    movl        $2147483646, -44(%rbp)
    movl        $0, -20(%rbp)
    movl        -44(%rbp), %eax
    cdq         
    movl        $6, %r10d
    idivl       %r10d
    movl        %eax, -16(%rbp)
    cmpl        $0, -20(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        -24(%rbp), %r10d
    addl        %r10d, -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    movl        -40(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -40(%rbp)
    movl        -44(%rbp), %r10d
    movl        %r10d, -48(%rbp)
    subl        $1431655762, -48(%rbp)
    movl        -48(%rbp), %r10d
    cmpl        %r10d, -40(%rbp)
    movl        $0, -52(%rbp)
    sete        -52(%rbp)
    movl        -52(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
