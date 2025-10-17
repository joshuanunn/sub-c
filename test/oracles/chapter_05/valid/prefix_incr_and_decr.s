    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $68, %rsp
    movl        $1, -28(%rbp)
    movl        $2, -36(%rbp)
    addl        $1, -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -48(%rbp)
    subl        $1, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -60(%rbp)
    cmpl        $2, -28(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Land_false.7
    cmpl        $1, -36(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Land_false.7
    movl        $1, -44(%rbp)
    jmp         .Land_end.8
.Land_false.7:
    movl        $0, -44(%rbp)
.Land_end.8:
    cmpl        $0, -44(%rbp)
    je          .Land_false.11
    cmpl        $2, -48(%rbp)
    movl        $0, -52(%rbp)
    sete        -52(%rbp)
    cmpl        $0, -52(%rbp)
    je          .Land_false.11
    movl        $1, -56(%rbp)
    jmp         .Land_end.12
.Land_false.11:
    movl        $0, -56(%rbp)
.Land_end.12:
    cmpl        $0, -56(%rbp)
    je          .Land_false.15
    cmpl        $1, -60(%rbp)
    movl        $0, -64(%rbp)
    sete        -64(%rbp)
    cmpl        $0, -64(%rbp)
    je          .Land_false.15
    movl        $1, -68(%rbp)
    jmp         .Land_end.16
.Land_false.15:
    movl        $0, -68(%rbp)
.Land_end.16:
    movl        -68(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
