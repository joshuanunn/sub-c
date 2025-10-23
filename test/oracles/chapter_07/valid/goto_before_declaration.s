    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $12, %rsp
    movl        $0, -4(%rbp)
    cmpl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lif_end.1
.Lreturn_a:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif_end.1:
    movl        $4, -12(%rbp)
    jmp         .Lreturn_a
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
