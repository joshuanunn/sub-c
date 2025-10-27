    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $4, %rsp
    movl        $1, -4(%rbp)
.Llabel_if:
    cmpl        $0, -4(%rbp)
    je          .Lif.el.1
    jmp         .Llabel_expression
    jmp         .Lif.en.0
.Lif.el.1:
    jmp         .Llabel_empty
.Lif.en.0:
.Llabel_goto:
    jmp         .Llabel_return
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Lif.en.2
.Llabel_expression:
    movl        $0, -4(%rbp)
.Lif.en.2:
    jmp         .Llabel_if
.Llabel_return:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Llabel_empty:
    movl        $100, -4(%rbp)
    jmp         .Llabel_goto
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
