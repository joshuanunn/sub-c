    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $60, %rsp
    movl        $0, -40(%rbp)
    movl        $0, -48(%rbp)
    movl        -40(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    addl        $1, -40(%rbp)
    addl        $1, -40(%rbp)
    addl        $1, -40(%rbp)
    movl        -48(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    subl        $1, -48(%rbp)
    subl        $1, -48(%rbp)
    cmpl        $3, -40(%rbp)
    movl        $0, -44(%rbp)
    sete        -44(%rbp)
    cmpl        $0, -44(%rbp)
    je          .Land_false.8
    movl        $2, -52(%rbp)
    negl        -52(%rbp)
    movl        -52(%rbp), %r10d
    cmpl        %r10d, -48(%rbp)
    movl        $0, -56(%rbp)
    sete        -56(%rbp)
    cmpl        $0, -56(%rbp)
    je          .Land_false.8
    movl        $1, -60(%rbp)
    jmp         .Land_end.9
.Land_false.8:
    movl        $0, -60(%rbp)
.Land_end.9:
    movl        -60(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
