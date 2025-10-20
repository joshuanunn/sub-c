    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $24, %rsp
    movl        $10, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        $5, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lcond_e2.4
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    jmp         .Lcond_end.3
.Lcond_e2.4:
    movl        $2, -12(%rbp)
.Lcond_end.3:
    movl        -12(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    cmpl        $5, -4(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Land_false.8
    cmpl        $5, -8(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Land_false.8
    movl        $1, -24(%rbp)
    jmp         .Land_end.9
.Land_false.8:
    movl        $0, -24(%rbp)
.Land_end.9:
    movl        -24(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
