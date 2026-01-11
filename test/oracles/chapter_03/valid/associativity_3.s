    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $1, -4(%rbp)
    movl        $4, -8(%rbp)
    movl        $1, -12(%rbp)
    movl        $4, -16(%rbp)
    movl        $8, -20(%rbp)
    movl        $8, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
