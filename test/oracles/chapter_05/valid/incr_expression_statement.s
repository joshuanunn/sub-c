    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    addl        $1, -4(%rbp)
    addl        $1, -4(%rbp)
    addl        $1, -4(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    subl        $1, -8(%rbp)
    subl        $1, -8(%rbp)
    cmpl        $3, -4(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Land.fl.6
    movl        $2, -24(%rbp)
    negl        -24(%rbp)
    movl        -24(%rbp), %r10d
    cmpl        %r10d, -8(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Land.fl.6
    movl        $1, -32(%rbp)
    jmp         .Land.en.7
.Land.fl.6:
    movl        $0, -32(%rbp)
.Land.en.7:
    movl        -32(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
