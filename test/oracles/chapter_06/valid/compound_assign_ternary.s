    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $8, %rsp
    movl        $4, -4(%rbp)
    movl        $1, %r11d
    cmpl        $0, %r11d
    je          .Lcond_e2.2
    jmp         .Lcond_end.1
.Lcond_e2.2:
.Lcond_end.1:
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        -8(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -8(%rbp)
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
