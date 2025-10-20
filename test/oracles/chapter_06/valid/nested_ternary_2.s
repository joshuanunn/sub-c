    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $12, %rsp
    movl        $1, %r11d
    cmpl        $0, %r11d
    je          .Lcond_e2.3
    movl        $2, %r11d
    cmpl        $0, %r11d
    je          .Lcond_e2.5
    jmp         .Lcond_end.4
.Lcond_e2.5:
.Lcond_end.4:
    jmp         .Lcond_end.2
.Lcond_e2.3:
.Lcond_end.2:
    movl        $3, -4(%rbp)
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Lcond_e2.7
    movl        $2, %r11d
    cmpl        $0, %r11d
    je          .Lcond_e2.9
    jmp         .Lcond_end.8
.Lcond_e2.9:
.Lcond_end.8:
    jmp         .Lcond_end.6
.Lcond_e2.7:
.Lcond_end.6:
    movl        $3, -8(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -12(%rbp), %r11d
    imull       -8(%rbp), %r11d
    movl        %r11d, -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
