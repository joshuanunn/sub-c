    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $4, %rsp
    movl        $0, -4(%rbp)
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Lif_else.1
    jmp         .Lif_end.0
.Lif_else.1:
    movl        $1, -4(%rbp)
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
