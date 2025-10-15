    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $20, %rsp
    movl        $8, -20(%rbp)
    movl        -20(%rbp), %eax
    cdq         
    movl        $4, %r10d
    idivl       %r10d
    movl        %eax, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
