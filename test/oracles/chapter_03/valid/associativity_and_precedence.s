    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $20, -4(%rbp)
    movl        -4(%rbp), %eax
    cdq         
    movl        $2, %r10d
    idivl       %r10d
    movl        %eax, -8(%rbp)
    movl        $3, -12(%rbp)
    movl        $3, %eax
    cdq         
    idivl       -12(%rbp)
    movl        %edx, -16(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -16(%rbp), %r10d
    subl        %r10d, -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
