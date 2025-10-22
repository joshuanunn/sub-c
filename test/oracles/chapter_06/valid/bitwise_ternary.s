    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $12, %rsp
    movl        $1, -12(%rbp)
    xorl        $1, -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lcond_e2.3
    movl        $4, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    jmp         .Lcond_end.2
.Lcond_e2.3:
    movl        $5, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
.Lcond_end.2:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
