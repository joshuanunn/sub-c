    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        $0, -4(%rbp)
    movl        $100, -8(%rbp)
.Lloop.ct.1:
    cmpl        $0, -8(%rbp)
    je          .Lloop.br.1
    movl        $10, -12(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -12(%rbp), %r10d
    subl        %r10d, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -8(%rbp)
.Lloop.ct.2:
    cmpl        $0, -12(%rbp)
    je          .Lloop.br.2
    movl        -4(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    addl        $1, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    subl        $1, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    jmp         .Lloop.ct.2
.Lloop.br.2:
    jmp         .Lloop.ct.1
.Lloop.br.1:
    cmpl        $100, -4(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Land.fl.6
    cmpl        $0, -8(%rbp)
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
