    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $64, %rsp
    movl        $1, -4(%rbp)
    movl        $2, -8(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    addl        $1, -4(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    subl        $1, -8(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    cmpl        $2, -4(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Land.fl.5
    cmpl        $1, -8(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Land.fl.5
    movl        $1, -36(%rbp)
    jmp         .Land.en.6
.Land.fl.5:
    movl        $0, -36(%rbp)
.Land.en.6:
    cmpl        $0, -36(%rbp)
    je          .Land.fl.9
    cmpl        $1, -12(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Land.fl.9
    movl        $1, -44(%rbp)
    jmp         .Land.en.10
.Land.fl.9:
    movl        $0, -44(%rbp)
.Land.en.10:
    cmpl        $0, -44(%rbp)
    je          .Land.fl.13
    cmpl        $2, -20(%rbp)
    movl        $0, -48(%rbp)
    sete        -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Land.fl.13
    movl        $1, -52(%rbp)
    jmp         .Land.en.14
.Land.fl.13:
    movl        $0, -52(%rbp)
.Land.en.14:
    movl        -52(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
