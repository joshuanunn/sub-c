    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    jmp         .Lmain.if.el.1
    jmp         .Lmain.if.el.3
    movl        $3, -4(%rbp)
    jmp         .Lmain.if.en.2
.Lmain.if.el.3:
    movl        $4, -4(%rbp)
.Lmain.if.en.2:
    jmp         .Lmain.if.en.0
.Lmain.if.el.1:
    movl        $1, -4(%rbp)
.Lmain.if.en.0:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
