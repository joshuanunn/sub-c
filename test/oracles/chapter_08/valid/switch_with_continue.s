    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $0, -4(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lswit.cs.1.0
    movl        $1, -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lswit.cs.1.4
    jmp         .Lswit.br.1
.Lswit.cs.1.0:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.1.4:
    movl        $0, -12(%rbp)
    movl        $0, -16(%rbp)
.Lloop.st.2:
    cmpl        $10, -16(%rbp)
    movl        $0, -20(%rbp)
    setl        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lloop.br.2
    movl        -16(%rbp), %eax
    cdq         
    movl        $2, %r10d
    idivl       %r10d
    movl        %edx, -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.if.en.4
    jmp         .Lloop.ct.2
.Lmain.if.en.4:
    movl        -12(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    addl        $1, -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -12(%rbp)
.Lloop.ct.2:
    movl        -16(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    addl        $1, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    jmp         .Lloop.st.2
.Lloop.br.2:
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.br.1:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
