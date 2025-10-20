    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $4, %rsp
    movl        $0, -4(%rbp)
    movl        $1, %r11d
    cmpl        $0, %r11d
    je          .Lcond_e2.2
    jmp         .Lcond_end.1
.Lcond_e2.2:
.Lcond_end.1:
    movl        $2, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
