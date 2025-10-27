    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $1, -12(%rbp)
    negl        -12(%rbp)
    movl        -12(%rbp), %r10d
    cmpl        %r10d, -4(%rbp)
    movl        $0, -16(%rbp)
    setg        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lcond.el.4
    movl        $4, -8(%rbp)
    jmp         .Lcond.en.3
.Lcond.el.4:
    movl        $5, -8(%rbp)
.Lcond.en.3:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
