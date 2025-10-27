    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $8, %rsp
    movl        $2, %r11d
    cmpl        $2, %r11d
    movl        $0, -4(%rbp)
    sete        -4(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lor.tr.2
    movl        $0, %r11d
    cmpl        $0, %r11d
    jne         .Lor.tr.2
    movl        $0, -8(%rbp)
    jmp         .Lor.en.3
.Lor.tr.2:
    movl        $1, -8(%rbp)
.Lor.en.3:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
