    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
.Lloop.st.1:
    cmpl        $10, -8(%rbp)
    movl        $0, -12(%rbp)
    setl        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lloop.br.1
    movl        $0, -16(%rbp)
.Lloop.st.2:
    cmpl        $10, -16(%rbp)
    movl        $0, -20(%rbp)
    setl        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lloop.br.2
    movl        -8(%rbp), %eax
    cdq         
    movl        $2, %r10d
    idivl       %r10d
    movl        %eax, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        -28(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -28(%rbp)
    movl        -8(%rbp), %r10d
    cmpl        %r10d, -28(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lif.el.6
    jmp         .Lloop.br.2
    jmp         .Lif.en.5
.Lif.el.6:
    movl        -4(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    movl        -8(%rbp), %r10d
    addl        %r10d, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lif.en.5:
.Lloop.ct.2:
    movl        -16(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    addl        $1, -40(%rbp)
    movl        -40(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    jmp         .Lloop.st.2
.Lloop.br.2:
.Lloop.ct.1:
    movl        -8(%rbp), %r10d
    movl        %r10d, -44(%rbp)
    addl        $1, -44(%rbp)
    movl        -44(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
