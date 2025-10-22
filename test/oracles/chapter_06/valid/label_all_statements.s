    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $4, %rsp
    movl        $1, -4(%rbp)
.Llabel_if.1:
    cmpl        $0, -4(%rbp)
    je          .Lif_else.1
    jmp         .Llabel_expression.3
    jmp         .Lif_end.0
.Lif_else.1:
    jmp         .Llabel_empty.5
.Lif_end.0:
.Llabel_goto.2:
    jmp         .Llabel_return.4
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Lif_end.2
.Llabel_expression.3:
    movl        $0, -4(%rbp)
.Lif_end.2:
    jmp         .Llabel_if.1
.Llabel_return.4:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Llabel_empty.5:
    movl        $100, -4(%rbp)
    jmp         .Llabel_goto.2
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
