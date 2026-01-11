    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $10, -4(%rbp)
    movl        $20, -12(%rbp)
    movl        $20, -8(%rbp)
    movl        $30, -16(%rbp)
    movl        $30, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
