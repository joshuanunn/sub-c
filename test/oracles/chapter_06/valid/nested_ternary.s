    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, -4(%rbp)
    movl        $2, -8(%rbp)
    movl        $0, -12(%rbp)
    movl        -8(%rbp), %r10d
    cmpl        %r10d, -4(%rbp)
    movl        $0, -16(%rbp)
    setg        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lcond_e2.5
    jmp         .Lcond_end.4
.Lcond_e2.5:
    cmpl        $0, -12(%rbp)
    je          .Lcond_e2.7
    jmp         .Lcond_end.6
.Lcond_e2.7:
.Lcond_end.6:
.Lcond_end.4:
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
