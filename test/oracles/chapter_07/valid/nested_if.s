    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $0, -4(%rbp)
    movl        $3, -12(%rbp)
    movl        $1, -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.el.4
    movl        $1, -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.el.4:
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
