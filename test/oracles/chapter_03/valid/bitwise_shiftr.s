    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $4, %rsp
    movl        $1000, -4(%rbp)
    sarl        $4, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
