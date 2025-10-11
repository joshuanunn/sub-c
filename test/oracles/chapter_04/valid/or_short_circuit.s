    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $8, %rsp
    movl        $1, %r11d
    cmpl        $0, %r11d
    jne         .Lor_true.0
    movl        $1, %eax
    cdq         
    movl        $0, %r10d
    idivl       %r10d
    movl        %eax, -4(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lor_true.0
    movl        $0, -8(%rbp)
    jmp         .Lor_end.1
.Lor_true.0:
    movl        $1, -8(%rbp)
.Lor_end.1:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
