    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $10, -4(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lmain.or.tr.2
    movl        $0, -12(%rbp)
    jmp         .Lmain.or.en.3
.Lmain.or.tr.2:
    movl        $1, -12(%rbp)
.Lmain.or.en.3:
    cmpl        $0, -12(%rbp)
    je          .Lmain.cond.el.5
    movl        $20, -8(%rbp)
    jmp         .Lmain.cond.en.4
.Lmain.cond.el.5:
    movl        $0, -8(%rbp)
.Lmain.cond.en.4:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
