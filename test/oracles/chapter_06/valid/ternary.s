    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $-1, -12(%rbp)
    movl        $0, %r11d
    cmpl        -12(%rbp), %r11d
    movl        $0, -16(%rbp)
    setg        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.cond.el.4
    movl        $4, -8(%rbp)
    jmp         .Lmain.cond.en.3
.Lmain.cond.el.4:
    movl        $5, -8(%rbp)
.Lmain.cond.en.3:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
