    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $24, %rsp
    movl        $1234, -12(%rbp)
    movl        $0, -24(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    sarl        $4, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    movl        -24(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
