    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -16(%rbp)
    movl        $1, %r11d
    cmpl        $0, %r11d
    jne         .Lor_true.2
    movl        $1, -16(%rbp)
    cmpl        $0, -16(%rbp)
    jne         .Lor_true.2
    movl        $0, -12(%rbp)
    jmp         .Lor_end.3
.Lor_true.2:
    movl        $1, -12(%rbp)
.Lor_end.3:
    movl        -16(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
