    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $12, %rsp
    movl        $5, %r11d
    cmpl        $0, %r11d
    movl        $0, -4(%rbp)
    setge       -4(%rbp)
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
