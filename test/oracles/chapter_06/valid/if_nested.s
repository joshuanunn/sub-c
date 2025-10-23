    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $8, %rsp
    movl        $1, -4(%rbp)
    movl        $0, -8(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lif_else.1
    movl        $1, -8(%rbp)
    jmp         .Lif_end.0
.Lif_else.1:
    cmpl        $0, -8(%rbp)
    je          .Lif_end.2
    movl        $2, -8(%rbp)
.Lif_end.2:
.Lif_end.0:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
