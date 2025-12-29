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
    jmp         .Lmain.if.en.0
.Lmain.if.el.1:
    jmp         .Llabel_empty.4
.Lmain.if.en.0:
.Llabel_goto.1:
    jmp         .Llabel_return.3
    jmp         .Lmain.if.en.2
.Llabel_expression.2:
    movl        $0, -4(%rbp)
.Lmain.if.en.2:
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
