    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $12, %rsp
    movl        $400, -4(%rbp)
.Lstart.for.1:
    cmpl        $100, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lif_end.1
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif_end.1:
.Lcontinue.for.1:
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    subl        $100, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    jmp         .Lstart.for.1
.Lbreak.for.1:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
