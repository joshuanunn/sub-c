    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $8, %rsp
    movl        $0, -4(%rbp)
    movl        $1, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lif_end.0
    cmpl        $1, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lif_else.3
    movl        $3, -4(%rbp)
    jmp         .Lif_end.2
.Lif_else.3:
    movl        $4, -4(%rbp)
.Lif_end.2:
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
