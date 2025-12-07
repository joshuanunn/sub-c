    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, -4(%rbp)
.Llabel_if.0:
    cmpl        $0, -4(%rbp)
    je          .Lif.el.1
    jmp         .Llabel_expression.2
    jmp         .Lif.en.0
.Lif.el.1:
    jmp         .Llabel_empty.4
.Lif.en.0:
.Llabel_goto.1:
    jmp         .Llabel_return.3
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Lif.en.2
.Llabel_expression.2:
    movl        $0, -4(%rbp)
.Lif.en.2:
    jmp         .Llabel_if.0
.Llabel_return.3:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Llabel_empty.4:
    movl        $100, -4(%rbp)
    jmp         .Llabel_goto.1
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
