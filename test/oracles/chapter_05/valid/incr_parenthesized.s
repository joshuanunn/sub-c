    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $64, %rsp
    movl        $1, -4(%rbp)
    movl        $2, -8(%rbp)
    addl        $1, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    negl        -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    subl        $1, -8(%rbp)
    cmpl        $0, -24(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    cmpl        $2, -4(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Land.fl.6
    cmpl        $1, -8(%rbp)
    movl        $0, -36(%rbp)
    sete        -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Land.fl.6
    movl        $1, -40(%rbp)
    jmp         .Land.en.7
.Land.fl.6:
    movl        $0, -40(%rbp)
.Land.en.7:
    cmpl        $0, -40(%rbp)
    je          .Land.fl.11
    movl        $2, -44(%rbp)
    negl        -44(%rbp)
    movl        -44(%rbp), %r10d
    cmpl        %r10d, -12(%rbp)
    movl        $0, -48(%rbp)
    sete        -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Land.fl.11
    movl        $1, -52(%rbp)
    jmp         .Land.en.12
.Land.fl.11:
    movl        $0, -52(%rbp)
.Land.en.12:
    cmpl        $0, -52(%rbp)
    je          .Land.fl.15
    cmpl        $0, -20(%rbp)
    movl        $0, -56(%rbp)
    sete        -56(%rbp)
    cmpl        $0, -56(%rbp)
    je          .Land.fl.15
    movl        $1, -60(%rbp)
    jmp         .Land.en.16
.Land.fl.15:
    movl        $0, -60(%rbp)
.Land.en.16:
    movl        -60(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
