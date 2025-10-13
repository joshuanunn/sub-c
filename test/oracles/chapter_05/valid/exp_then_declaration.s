    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $36, %rsp
    movl        $2593, -4(%rbp)
    negl        -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    movl        -24(%rbp), %eax
    cdq         
    movl        $3, %r10d
    idivl       %r10d
    movl        %edx, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    negl        -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    movl        -36(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
