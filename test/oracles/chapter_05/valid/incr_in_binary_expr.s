    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        $2, -4(%rbp)
    movl        $2, -12(%rbp)
    movl        $3, -4(%rbp)
    movl        $5, -16(%rbp)
    movl        $5, -8(%rbp)
    movl        $6, -8(%rbp)
    movl        $10, -24(%rbp)
    movl        $10, -20(%rbp)
    movl        $1, -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lmain.and.fl.6
    cmpl        $6, -8(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lmain.and.fl.6
    movl        $1, -36(%rbp)
    jmp         .Lmain.and.en.7
.Lmain.and.fl.6:
    movl        $0, -36(%rbp)
.Lmain.and.en.7:
    cmpl        $0, -36(%rbp)
    je          .Lmain.and.fl.10
    movl        $1, -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lmain.and.fl.10
    movl        $1, -44(%rbp)
    jmp         .Lmain.and.en.11
.Lmain.and.fl.10:
    movl        $0, -44(%rbp)
.Lmain.and.en.11:
    movl        -44(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
