    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $36, %rsp
    movl        $1, -28(%rbp)
    movl        $0, -32(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    movl        $3, -20(%rbp)
    movl        -20(%rbp), %r11d
    imull       -32(%rbp), %r11d
    movl        %r11d, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    movl        -32(%rbp), %r10d
    addl        %r10d, -36(%rbp)
    movl        -36(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
