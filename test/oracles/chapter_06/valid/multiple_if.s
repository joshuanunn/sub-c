    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        $3, -4(%rbp)
    movl        $5, -8(%rbp)
    movl        $8, -12(%rbp)
    movl        $8, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
