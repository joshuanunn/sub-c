    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        $0, -4(%rbp)
.Lloop.ct.1:
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    addl        $1, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    cmpl        $10, -4(%rbp)
    movl        $0, -12(%rbp)
    setg        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lif.en.2
    jmp         .Lloop.br.1
.Lif.en.2:
    jmp         .Lloop.ct.1
.Lloop.br.1:
    movl        $10, -16(%rbp)
.Lloop.ct.2:
    movl        -16(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    subl        $1, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    cmpl        $0, -16(%rbp)
    movl        $0, -24(%rbp)
    setl        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lif.en.5
    jmp         .Lloop.br.2
.Lif.en.5:
    jmp         .Lloop.ct.2
.Lloop.br.2:
    movl        $-1, -32(%rbp)
    movl        -32(%rbp), %r10d
    cmpl        %r10d, -16(%rbp)
    movl        $0, -36(%rbp)
    sete        -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Land.fl.10
    cmpl        $11, -4(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Land.fl.10
    movl        $1, -44(%rbp)
    jmp         .Land.en.11
.Land.fl.10:
    movl        $0, -44(%rbp)
.Land.en.11:
    movl        -44(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        -28(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
