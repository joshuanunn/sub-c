    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    cmpl        $1, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lswit.cs.1.1
    cmpl        $2, -4(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lswit.cs.1.2
    cmpl        $4, -4(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    jne         .Lswit.cs.1.4
    jmp         .Lswit.df.1
.Lswit.cs.1.1:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.1.2:
    movl        $9, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.1.4:
    movl        $11, -4(%rbp)
    jmp         .Lswit.br.1
.Lswit.df.1:
    movl        $22, -4(%rbp)
.Lswit.br.1:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
