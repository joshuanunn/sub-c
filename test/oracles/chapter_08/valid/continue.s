    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        $0, -4(%rbp)
    movl        $0, -12(%rbp)
.Lloop.st.1:
    cmpl        $10, -12(%rbp)
    movl        $0, -16(%rbp)
    setle       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lloop.br.1
    movl        -12(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        -12(%rbp), %eax
    cdq         
    movl        $2, %r10d
    idivl       %r10d
    movl        %edx, -20(%rbp)
    cmpl        $0, -20(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lif.en.3
    jmp         .Lloop.ct.1
.Lif.en.3:
    movl        -4(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    addl        $1, -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lloop.ct.1:
    movl        -12(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    addl        $1, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    cmpl        $5, -4(%rbp)
    movl        $0, -36(%rbp)
    sete        -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Land.fl.9
    cmpl        $10, -8(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Land.fl.9
    movl        $1, -44(%rbp)
    jmp         .Land.en.10
.Land.fl.9:
    movl        $0, -44(%rbp)
.Land.en.10:
    movl        -44(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
