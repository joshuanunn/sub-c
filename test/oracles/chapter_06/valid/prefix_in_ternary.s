    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $4, %rsp
    movl        $0, -4(%rbp)
    addl        $1, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lcond_e2.2
    addl        $1, -4(%rbp)
    jmp         .Lcond_end.1
.Lcond_e2.2:
.Lcond_end.1:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
