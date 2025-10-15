    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $24, %rsp
    movl        $15, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    xorl        $5, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        $1, -24(%rbp)
    movl        -20(%rbp), %r10d
    orl         %r10d, -24(%rbp)
    movl        -24(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
