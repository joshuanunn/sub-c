    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $-1, -4(%rbp)
    movl        $-2, -8(%rbp)
    movl        $-1, %r11d
    cmpl        -8(%rbp), %r11d
    movl        $0, -12(%rbp)
    setne       -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
