    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $12, %rsp
    movl        $10, -4(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lor.tr.2
    movl        $0, %r11d
    cmpl        $0, %r11d
    jne         .Lor.tr.2
    movl        $0, -12(%rbp)
    jmp         .Lor.en.3
.Lor.tr.2:
    movl        $1, -12(%rbp)
.Lor.en.3:
    cmpl        $0, -12(%rbp)
    je          .Lcond.el.5
    movl        $20, -8(%rbp)
    jmp         .Lcond.en.4
.Lcond.el.5:
    movl        $0, -8(%rbp)
.Lcond.en.4:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
