    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $10, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        $5, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lmain.cond.el.2
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    jmp         .Lmain.cond.en.1
.Lmain.cond.el.2:
    movl        $2, -12(%rbp)
.Lmain.cond.en.1:
    movl        -12(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    cmpl        $5, -4(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.and.fl.6
    cmpl        $5, -8(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.and.fl.6
    movl        $1, -24(%rbp)
    jmp         .Lmain.and.en.7
.Lmain.and.fl.6:
    movl        $0, -24(%rbp)
.Lmain.and.en.7:
    movl        -24(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
