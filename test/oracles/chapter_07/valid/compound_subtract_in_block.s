    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $24, %rsp
    movl        $5, -4(%rbp)
    cmpl        $4, -4(%rbp)
    movl        $0, -8(%rbp)
    setg        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lif.en.1
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    subl        $4, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        $5, -16(%rbp)
    cmpl        $4, -16(%rbp)
    movl        $0, -20(%rbp)
    setg        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lif.en.4
    movl        -16(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    subl        $4, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -16(%rbp)
.Lif.en.4:
.Lif.en.1:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
