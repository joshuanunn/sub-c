    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $24, %rsp
    movl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
.Lstart.for.1:
    cmpl        $10, -8(%rbp)
    movl        $0, -12(%rbp)
    setl        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lbreak.for.1
    movl        -8(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    addl        $1, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        -8(%rbp), %eax
    cdq         
    movl        $2, %r10d
    idivl       %r10d
    movl        %edx, -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lif_end.3
    jmp         .Lcontinue.for.1
.Lif_end.3:
    movl        -4(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    movl        -8(%rbp), %r10d
    addl        %r10d, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lcontinue.for.1:
    jmp         .Lstart.for.1
.Lbreak.for.1:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
