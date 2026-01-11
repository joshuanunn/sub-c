    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        $4, -4(%rbp)
    movl        $9, -8(%rbp)
    movl        $0, -12(%rbp)
    movl        $9, -16(%rbp)
    movl        $0, -20(%rbp)
    cmpl        $0, -20(%rbp)
    jne         .Lswit.cs.1.0
    movl        $0, -24(%rbp)
    cmpl        $0, -24(%rbp)
    jne         .Lswit.cs.1.7
    movl        $1, -28(%rbp)
    cmpl        $0, -28(%rbp)
    jne         .Lswit.cs.1.9
    movl        $0, -32(%rbp)
    cmpl        $0, -32(%rbp)
    jne         .Lswit.cs.1.1
    jmp         .Lswit.br.1
.Lswit.cs.1.0:
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.1.7:
    movl        $1, -12(%rbp)
.Lswit.cs.1.9:
    movl        $2, -12(%rbp)
.Lswit.cs.1.1:
    movl        -12(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    addl        $4, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -12(%rbp)
.Lswit.br.1:
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
