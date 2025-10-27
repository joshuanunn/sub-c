    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    cmpl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lif.en.1
    movl        $3, %eax
    cdq         
    movl        $4, %r10d
    idivl       %r10d
    movl        %eax, -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lif.el.4
    movl        $3, -4(%rbp)
    jmp         .Lif.en.3
.Lif.el.4:
    movl        $8, %eax
    cdq         
    movl        $2, %r10d
    idivl       %r10d
    movl        %eax, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lif.en.3:
.Lif.en.1:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
