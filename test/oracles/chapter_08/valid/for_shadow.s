    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $36, %rsp
    movl        $1, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        $0, -12(%rbp)
.Lloop.st.1:
    cmpl        $10, -12(%rbp)
    movl        $0, -16(%rbp)
    setl        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lloop.br.1
    movl        -8(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -12(%rbp), %r10d
    addl        %r10d, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -8(%rbp)
.Lloop.ct.1:
    movl        -12(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    addl        $1, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    cmpl        $45, -8(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Land.fl.6
    cmpl        $1, -4(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Land.fl.6
    movl        $1, -36(%rbp)
    jmp         .Land.en.7
.Land.fl.6:
    movl        $0, -36(%rbp)
.Land.en.7:
    movl        -36(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
