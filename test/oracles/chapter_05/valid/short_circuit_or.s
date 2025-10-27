    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $8, %rsp
    movl        $0, -4(%rbp)
    movl        $1, %r11d
    cmpl        $0, %r11d
    jne         .Lor.tr.1
    movl        $1, -4(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lor.tr.1
    movl        $0, -8(%rbp)
    jmp         .Lor.en.2
.Lor.tr.1:
    movl        $1, -8(%rbp)
.Lor.en.2:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
