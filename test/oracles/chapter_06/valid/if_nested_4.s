    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $1, -8(%rbp)
    movl        $0, -12(%rbp)
    movl        $4, -16(%rbp)
    movl        $4, -4(%rbp)
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
