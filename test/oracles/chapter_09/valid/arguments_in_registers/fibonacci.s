    .globl      fib
    .text       
fib:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        %edi, -36(%rbp)
    cmpl        $0, -36(%rbp)
    movl        $0, -4(%rbp)
    sete        -4(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lfib.or.tr.3
    cmpl        $1, -36(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lfib.or.tr.3
    movl        $0, -12(%rbp)
    jmp         .Lfib.or.en.4
.Lfib.or.tr.3:
    movl        $1, -12(%rbp)
.Lfib.or.en.4:
    cmpl        $0, -12(%rbp)
    je          .Lfib.if.el.6
    movl        -36(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    jmp         .Lfib.if.en.5
.Lfib.if.el.6:
    movl        -36(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    subl        $1, -16(%rbp)
    movl        -16(%rbp), %edi
    call        fib@PLT
    movl        %eax, -20(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    subl        $2, -24(%rbp)
    movl        -24(%rbp), %edi
    call        fib@PLT
    movl        %eax, -28(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    movl        -28(%rbp), %r10d
    addl        %r10d, -32(%rbp)
    movl        -32(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lfib.if.en.5:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $6, -4(%rbp)
    movl        -4(%rbp), %edi
    call        fib@PLT
    movl        %eax, -8(%rbp)
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
