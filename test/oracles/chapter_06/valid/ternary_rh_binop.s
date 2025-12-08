    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Lcond.el.2
    movl        $1, -4(%rbp)
    jmp         .Lcond.en.1
.Lcond.el.2:
    movl        $0, %r11d
    cmpl        $0, %r11d
    jne         .Lor.tr.4
    movl        $2, %r11d
    cmpl        $0, %r11d
    jne         .Lor.tr.4
    movl        $0, -8(%rbp)
    jmp         .Lor.en.5
.Lor.tr.4:
    movl        $1, -8(%rbp)
.Lor.en.5:
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lcond.en.1:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
