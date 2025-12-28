    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, -4(%rbp)
    cmpl        $1, -4(%rbp)
    movl        $0, -8(%rbp)
    setg        -8(%rbp)
    cmpl        $0, -8(%rbp)
    movl        $0, -12(%rbp)
    setle       -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
