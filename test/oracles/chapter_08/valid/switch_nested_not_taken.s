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
    jmp         .Lswit.df.1
.Lswit.cs.1.1:
    cmpl        $0, -4(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lswit.cs.2.0
    jmp         .Lswit.df.2
.Lswit.cs.2.0:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.df.2:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.br.2:
.Lswit.df.1:
    movl        $2, -4(%rbp)
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
