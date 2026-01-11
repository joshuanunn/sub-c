    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        $1, -4(%rbp)
    movl        $2, -8(%rbp)
    movl        $2, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        $1, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        $1, -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.and.fl.3
    cmpl        $1, -8(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.and.fl.3
    movl        $1, -28(%rbp)
    jmp         .Lmain.and.en.4
.Lmain.and.fl.3:
    movl        $0, -28(%rbp)
.Lmain.and.en.4:
    cmpl        $0, -28(%rbp)
    je          .Lmain.and.fl.7
    cmpl        $2, -12(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lmain.and.fl.7
    movl        $1, -36(%rbp)
    jmp         .Lmain.and.en.8
.Lmain.and.fl.7:
    movl        $0, -36(%rbp)
.Lmain.and.en.8:
    cmpl        $0, -36(%rbp)
    je          .Lmain.and.fl.11
    cmpl        $1, -8(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lmain.and.fl.11
    movl        $1, -44(%rbp)
    jmp         .Lmain.and.en.12
.Lmain.and.fl.11:
    movl        $0, -44(%rbp)
.Lmain.and.en.12:
    movl        -44(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
