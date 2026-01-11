    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $-3, -4(%rbp)
    movl        $-2, -8(%rbp)
    movl        $6, -12(%rbp)
    movl        $6, -16(%rbp)
    movl        $1, -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
