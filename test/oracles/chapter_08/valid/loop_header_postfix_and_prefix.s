    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $28, %rsp
    movl        $100, -4(%rbp)
    movl        $0, -8(%rbp)
.Lloop.ct.1:
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    subl        $1, -4(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lloop.br.1
    movl        -8(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    addl        $1, -8(%rbp)
    jmp         .Lloop.ct.1
.Lloop.br.1:
    cmpl        $100, -8(%rbp)
    movl        $0, -20(%rbp)
    setne       -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lif_end.3
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif_end.3:
    movl        $100, -4(%rbp)
    movl        $0, -8(%rbp)
.Lloop.ct.2:
    subl        $1, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lloop.br.2
    movl        -8(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    addl        $1, -8(%rbp)
    jmp         .Lloop.ct.2
.Lloop.br.2:
    cmpl        $99, -8(%rbp)
    movl        $0, -28(%rbp)
    setne       -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lif_end.6
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif_end.6:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
