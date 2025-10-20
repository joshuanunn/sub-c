    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $28, %rsp
    movl        $1, %r11d
    cmpl        $0, %r11d
    je          .Lcond_e2.4
    movl        $2, %r11d
    cmpl        $0, %r11d
    je          .Lcond_e2.7
    movl        $3, -12(%rbp)
    jmp         .Lcond_end.6
.Lcond_e2.7:
    movl        $4, -12(%rbp)
.Lcond_end.6:
    movl        -12(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    jmp         .Lcond_end.3
.Lcond_e2.4:
    movl        $5, -8(%rbp)
.Lcond_end.3:
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Lcond_e2.10
    movl        $2, %r11d
    cmpl        $0, %r11d
    je          .Lcond_e2.13
    movl        $3, -24(%rbp)
    jmp         .Lcond_end.12
.Lcond_e2.13:
    movl        $4, -24(%rbp)
.Lcond_end.12:
    movl        -24(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    jmp         .Lcond_end.9
.Lcond_e2.10:
    movl        $5, -20(%rbp)
.Lcond_end.9:
    movl        -20(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        -28(%rbp), %r11d
    imull       -16(%rbp), %r11d
    movl        %r11d, -28(%rbp)
    movl        -28(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
