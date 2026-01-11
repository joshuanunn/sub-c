    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        $1, -4(%rbp)
    movl        $2, -8(%rbp)
    movl        $3, -12(%rbp)
    movl        $3, -4(%rbp)
    movl        $30, -16(%rbp)
    movl        $32, -20(%rbp)
    movl        $32, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
