    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $64, %rsp
    movl        $1, -4(%rbp)
    movl        $2, -8(%rbp)
    movl        $1, -16(%rbp)
    movl        $2, -4(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        $2, -24(%rbp)
    movl        $1, -8(%rbp)
    movl        $2, -20(%rbp)
    cmpl        $2, -4(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lmain.and.fl.5
    cmpl        $1, -8(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lmain.and.fl.5
    movl        $1, -36(%rbp)
    jmp         .Lmain.and.en.6
.Lmain.and.fl.5:
    movl        $0, -36(%rbp)
.Lmain.and.en.6:
    cmpl        $0, -36(%rbp)
    je          .Lmain.and.fl.9
    movl        $1, -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lmain.and.fl.9
    movl        $1, -44(%rbp)
    jmp         .Lmain.and.en.10
.Lmain.and.fl.9:
    movl        $0, -44(%rbp)
.Lmain.and.en.10:
    cmpl        $0, -44(%rbp)
    je          .Lmain.and.fl.13
    movl        $1, -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Lmain.and.fl.13
    movl        $1, -52(%rbp)
    jmp         .Lmain.and.en.14
.Lmain.and.fl.13:
    movl        $0, -52(%rbp)
.Lmain.and.en.14:
    movl        -52(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
