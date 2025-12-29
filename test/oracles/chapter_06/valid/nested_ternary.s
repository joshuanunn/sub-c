    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $1, -4(%rbp)
    movl        $2, -8(%rbp)
    movl        $0, -12(%rbp)
    movl        -8(%rbp), %r10d
    cmpl        %r10d, -4(%rbp)
    movl        $0, -20(%rbp)
    setg        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.cond.el.3
    movl        $5, -16(%rbp)
    jmp         .Lmain.cond.en.2
.Lmain.cond.el.3:
    cmpl        $0, -12(%rbp)
    je          .Lmain.cond.el.6
    movl        $6, -24(%rbp)
    jmp         .Lmain.cond.en.5
.Lmain.cond.el.6:
    movl        $7, -24(%rbp)
.Lmain.cond.en.5:
    movl        -24(%rbp), %r10d
    movl        %r10d, -16(%rbp)
.Lmain.cond.en.2:
    movl        -16(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
