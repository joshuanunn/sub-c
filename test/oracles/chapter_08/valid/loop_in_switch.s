    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $10, -4(%rbp)
    cmpl        $1, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lswit.cs.1.1
    cmpl        $10, -4(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lswit.cs.1.10
    jmp         .Lswit.df.1
.Lswit.cs.1.1:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.1.10:
    movl        $0, -16(%rbp)
.Lloop.st.2:
    cmpl        $5, -16(%rbp)
    movl        $0, -20(%rbp)
    setl        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lloop.br.2
    movl        -4(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    subl        $1, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    cmpl        $8, -4(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lmain.if.en.5
    jmp         .Lloop.br.2
.Lmain.if.en.5:
.Lloop.ct.2:
    movl        -16(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    addl        $1, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    jmp         .Lloop.st.2
.Lloop.br.2:
    movl        $123, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.df.1:
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.br.1:
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
