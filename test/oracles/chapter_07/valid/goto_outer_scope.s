    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $24, %rsp
    movl        $10, -4(%rbp)
    movl        $0, -8(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lif_end.0
    movl        $1, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    jmp         .Lend
.Lif_end.0:
    movl        $9, -4(%rbp)
.Lend:
    cmpl        $10, -4(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Land_false.4
    cmpl        $1, -8(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Land_false.4
    movl        $1, -24(%rbp)
    jmp         .Land_end.5
.Land_false.4:
    movl        $0, -24(%rbp)
.Land_end.5:
    movl        -24(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
