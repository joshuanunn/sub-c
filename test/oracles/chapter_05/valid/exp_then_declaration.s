    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $-2593, -8(%rbp)
    movl        $-2593, -4(%rbp)
    movl        $-1, -12(%rbp)
    movl        $-1, -4(%rbp)
    movl        $1, -20(%rbp)
    movl        $1, -16(%rbp)
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
