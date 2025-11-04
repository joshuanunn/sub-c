    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $28, %rsp
    movl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
.Lloop.st.1:
    cmpl        $10, -8(%rbp)
    movl        $0, -12(%rbp)
    setl        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lloop.br.1
    movl        -8(%rbp), %eax
    cdq         
    movl        $2, %r10d
    idivl       %r10d
    movl        %edx, -16(%rbp)
    cmpl        $0, -16(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    jne         .Lswit.cs.2.0
    jmp         .Lswit.df.2
.Lswit.cs.2.0:
    jmp         .Lloop.ct.1
.Lswit.df.2:
    movl        -4(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    addl        $1, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lswit.br.2:
.Lloop.ct.1:
    movl        -8(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    addl        $1, -28(%rbp)
    movl        -28(%rbp), %r10d
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
