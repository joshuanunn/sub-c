    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $20, %rsp
    movl        $10, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        $5, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lcond_e2.3
    jmp         .Lcond_end.2
.Lcond_e2.3:
.Lcond_end.2:
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    cmpl        $5, -4(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Land_false.7
    cmpl        $5, -8(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Land_false.7
    movl        $1, -20(%rbp)
    jmp         .Land_end.8
.Land_false.7:
    movl        $0, -20(%rbp)
.Land_end.8:
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
