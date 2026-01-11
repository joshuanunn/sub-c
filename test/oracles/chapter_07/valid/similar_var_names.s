    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $80, %rsp
    movl        $1, -12(%rbp)
    movl        $2, -16(%rbp)
    movl        $2, -20(%rbp)
    movl        $20, -56(%rbp)
    movl        $20, -8(%rbp)
    movl        $5, -60(%rbp)
    movl        $20, -64(%rbp)
    movl        -60(%rbp), %r10d
    addl        %r10d, -64(%rbp)
    movl        -64(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        -64(%rbp), %r10d
    movl        %r10d, -68(%rbp)
    movl        -20(%rbp), %r10d
    addl        %r10d, -68(%rbp)
    movl        -68(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        -68(%rbp), %r10d
    movl        %r10d, -72(%rbp)
    movl        -12(%rbp), %r10d
    addl        %r10d, -72(%rbp)
    movl        -72(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
