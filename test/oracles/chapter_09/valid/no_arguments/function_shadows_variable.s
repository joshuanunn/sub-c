    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $3, -4(%rbp)
    movl        $4, -8(%rbp)
    movl        $7, -12(%rbp)
    movl        $1, -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.2
    call        foo@PLT
    movl        %eax, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -8(%rbp)
.Lmain.if.en.2:
    movl        $3, -24(%rbp)
    movl        -8(%rbp), %r10d
    addl        %r10d, -24(%rbp)
    movl        -24(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      foo
    .text       
foo:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $8, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
