    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $4, -4(%rbp)
    movl        $64, -8(%rbp)
    movl        $3, -12(%rbp)
    movl        $100, -16(%rbp)
    movl        -12(%rbp), %ecx
    sarl        %cl, -16(%rbp)
    movl        $64, -20(%rbp)
    movl        -16(%rbp), %r10d
    addl        %r10d, -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
