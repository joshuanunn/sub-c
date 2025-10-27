    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $8, %rsp
    movl        $0, -4(%rbp)
    addl        $1, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lcond.el.2
    addl        $1, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    jmp         .Lcond.en.1
.Lcond.el.2:
    movl        $0, -8(%rbp)
.Lcond.en.1:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
