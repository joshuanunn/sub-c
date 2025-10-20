    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $8, %rsp
    movl        $1, -8(%rbp)
    xorl        $1, -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lcond_e2.3
    movl        $4, -4(%rbp)
    jmp         .Lcond_end.2
.Lcond_e2.3:
    movl        $5, -4(%rbp)
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
