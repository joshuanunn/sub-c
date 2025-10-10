    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $4, %rsp
    movl        $35, -4(%rbp)
    shll        $2, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
