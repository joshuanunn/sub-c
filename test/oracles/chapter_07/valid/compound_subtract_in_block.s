    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $5, -4(%rbp)
    movl        $1, -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.1
    movl        $1, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        $5, -16(%rbp)
    cmpl        $4, -16(%rbp)
    movl        $0, -20(%rbp)
    setg        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.if.en.4
    movl        $1, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -16(%rbp)
.Lmain.if.en.4:
.Lmain.if.en.1:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
