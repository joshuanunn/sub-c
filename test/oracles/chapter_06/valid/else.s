    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $4, %rsp
    movl        $0, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lif_else.1
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    jmp         .Lif_end.0
.Lif_else.1:
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif_end.0:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
