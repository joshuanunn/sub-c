    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, -4(%rbp)
.Llabel_if.0:
    cmpl        $0, -4(%rbp)
    je          .Lmain.if.el.1
    jmp         .Llabel_expression.2
.Lmain.if.el.1:
    jmp         .Llabel_empty.4
.Llabel_goto.1:
    jmp         .Llabel_return.3
.Llabel_expression.2:
    movl        $0, -4(%rbp)
    jmp         .Llabel_if.0
.Llabel_return.3:
    movl        $100, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Llabel_empty.4:
    movl        $100, -4(%rbp)
    jmp         .Llabel_goto.1
    .section    .note.GNU-stack,"",@progbits
