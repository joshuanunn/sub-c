    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $20, %rsp
    movl        $1, -4(%rbp)
    movl        $0, -8(%rbp)
.Lstart.for.1:
    cmpl        $10, -8(%rbp)
    movl        $0, -12(%rbp)
    setl        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lbreak.for.1
    movl        -4(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    addl        $2, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lcontinue.for.1:
    movl        -8(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    addl        $1, -8(%rbp)
    jmp         .Lstart.for.1
.Lbreak.for.1:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
