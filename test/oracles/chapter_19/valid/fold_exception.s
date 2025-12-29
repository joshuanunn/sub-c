    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    jmp         .Lmain.or.tr.2
    movl        $1, %eax
    cdq         
    movl        $0, %r10d
    idivl       %r10d
    movl        %eax, -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lmain.or.tr.2
    movl        $0, -12(%rbp)
    jmp         .Lmain.or.en.3
.Lmain.or.tr.2:
    movl        $1, -12(%rbp)
.Lmain.or.en.3:
    movl        -12(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    jmp         .Lmain.and.fl.6
    movl        $100, %eax
    cdq         
    movl        $0, %r10d
    idivl       %r10d
    movl        %edx, -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.and.fl.6
    movl        $1, -24(%rbp)
    jmp         .Lmain.and.en.7
.Lmain.and.fl.6:
    movl        $0, -24(%rbp)
.Lmain.and.en.7:
    movl        -24(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    jmp         .Lmain.cond.el.10
    movl        $2147483657, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    jmp         .Lmain.cond.en.9
.Lmain.cond.el.10:
    movl        $100, -32(%rbp)
.Lmain.cond.en.9:
    movl        -32(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    cmpl        $1, -4(%rbp)
    movl        $0, -40(%rbp)
    setne       -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lmain.if.en.13
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.13:
    cmpl        $0, -16(%rbp)
    movl        $0, -44(%rbp)
    setne       -44(%rbp)
    cmpl        $0, -44(%rbp)
    je          .Lmain.if.en.15
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.15:
    cmpl        $100, -28(%rbp)
    movl        $0, -48(%rbp)
    setne       -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Lmain.if.en.17
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.17:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
