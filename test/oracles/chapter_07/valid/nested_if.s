    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $20, %rsp
    movl        $0, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lif_else.1
    movl        $2, -8(%rbp)
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    jmp         .Lif_end.0
.Lif_else.1:
    movl        $3, -12(%rbp)
    movl        -12(%rbp), %r10d
    cmpl        %r10d, -4(%rbp)
    movl        $0, -16(%rbp)
    setl        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lif_else.4
    cmpl        $0, -4(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    jmp         .Lif_end.3
.Lif_else.4:
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif_end.3:
.Lif_end.0:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
