    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $12, %rsp
    movl        $0, %r11d
    cmpl        $0, %r11d
    jne         .Lor_true.2
    movl        $5, %r11d
    cmpl        $0, %r11d
    jne         .Lor_true.2
    movl        $0, -4(%rbp)
    jmp         .Lor_end.3
.Lor_true.2:
    movl        $1, -4(%rbp)
.Lor_end.3:
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
