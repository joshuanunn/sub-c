    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $5, -4(%rbp)
    cmpl        $5, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lswit.cs.1.5
    cmpl        $6, -4(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lswit.cs.1.6
    jmp         .Lswit.br.1
.Lswit.cs.1.5:
    movl        $10, -4(%rbp)
    jmp         .Lswit.br.1
.Lswit.cs.1.6:
    movl        $0, -4(%rbp)
    jmp         .Lswit.br.1
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
