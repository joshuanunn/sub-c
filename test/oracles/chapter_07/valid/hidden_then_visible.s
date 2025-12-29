    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        $2, -4(%rbp)
    movl        $-4, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        $7, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    addl        $1, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    cmpl        $8, -8(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.and.fl.6
    movl        $-4, -28(%rbp)
    movl        -28(%rbp), %r10d
    cmpl        %r10d, -4(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lmain.and.fl.6
    movl        $1, -36(%rbp)
    jmp         .Lmain.and.en.7
.Lmain.and.fl.6:
    movl        $0, -36(%rbp)
.Lmain.and.en.7:
    movl        -36(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
