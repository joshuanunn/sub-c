    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $8, %rsp
    movl        $0, -4(%rbp)
    movl        $1, %r11d
    cmpl        $0, %r11d
    je          .Lcond_e2.2
    movl        $2, -8(%rbp)
    jmp         .Lcond_end.1
.Lcond_e2.2:
    movl        $3, -8(%rbp)
.Lcond_end.1:
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
