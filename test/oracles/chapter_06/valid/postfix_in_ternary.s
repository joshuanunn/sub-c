    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $10, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    subl        $10, -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lcond.el.3
    movl        $0, -8(%rbp)
    jmp         .Lcond.en.2
.Lcond.el.3:
    movl        -4(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    subl        $1, -4(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -8(%rbp)
.Lcond.en.2:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
