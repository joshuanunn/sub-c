    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $8, %rsp
    movl        $0, %r11d
    cmpl        $0, %r11d
    jne         .Lor_true.1
    movl        $5, %r11d
    cmpl        $0, %r11d
    jne         .Lor_true.1
    movl        $0, -8(%rbp)
    jmp         .Lor_end.2
.Lor_true.1:
    movl        $1, -8(%rbp)
.Lor_end.2:
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
