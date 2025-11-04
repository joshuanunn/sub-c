    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $3, -4(%rbp)
    movl        $0, -8(%rbp)
    cmpl        $3, -4(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lswit.cs.1.3
    jmp         .Lswit.br.1
    movl        $5, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -16(%rbp)
.Lswit.cs.1.3:
    movl        $4, -16(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -16(%rbp), %r10d
    addl        %r10d, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -8(%rbp)
.Lswit.br.1:
    cmpl        $3, -4(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Land.fl.5
    cmpl        $4, -8(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Land.fl.5
    movl        $1, -32(%rbp)
    jmp         .Land.en.6
.Land.fl.5:
    movl        $0, -32(%rbp)
.Land.en.6:
    movl        -32(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
