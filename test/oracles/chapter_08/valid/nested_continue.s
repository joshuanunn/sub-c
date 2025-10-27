    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $36, %rsp
    movl        $5, -4(%rbp)
    movl        $0, -8(%rbp)
.Lloop.ct.1:
    cmpl        $0, -4(%rbp)
    movl        $0, -12(%rbp)
    setge       -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lloop.br.1
    movl        -4(%rbp), %r10d
    movl        %r10d, -16(%rbp)
.Lloop.ct.2:
    cmpl        $10, -16(%rbp)
    movl        $0, -20(%rbp)
    setle       -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lloop.br.2
    movl        -16(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    addl        $1, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -16(%rbp), %eax
    cdq         
    movl        $2, %r10d
    idivl       %r10d
    movl        %edx, -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lif_end.4
    jmp         .Lloop.ct.2
.Lif_end.4:
    movl        -8(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    addl        $1, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    jmp         .Lloop.ct.2
.Lloop.br.2:
    movl        -4(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    subl        $1, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    jmp         .Lloop.ct.1
.Lloop.br.1:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
