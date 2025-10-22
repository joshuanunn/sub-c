    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $4, %rsp
    movl        $1, -4(%rbp)
.Lmain.label_if.1:
    cmpl        $0, -4(%rbp)
    je          .Lif_else.1
    jmp         .Lmain.label_expression.3
    jmp         .Lif_end.0
.Lif_else.1:
    jmp         .Lmain.label_empty.5
.Lif_end.0:
.Lmain.label_goto.2:
    jmp         .Lmain.label_return.4
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Lif_end.2
.Lmain.label_expression.3:
    movl        $0, -4(%rbp)
.Lif_end.2:
    jmp         .Lmain.label_if.1
.Lmain.label_return.4:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.label_empty.5:
    movl        $100, -4(%rbp)
    jmp         .Lmain.label_goto.2
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
