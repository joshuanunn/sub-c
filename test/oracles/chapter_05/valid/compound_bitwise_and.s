    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $8, %rsp
    movl        $3, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    andl        $6, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
