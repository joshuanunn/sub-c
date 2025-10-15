    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $12, %rsp
    movl        $3, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    shll        $3, -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
