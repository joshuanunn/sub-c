    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $1, -4(%rbp)
    cmpl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lswit.cs.1.0
    cmpl        $1, -4(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lswit.cs.1.1
    jmp         .Lswit.df.1
.Lswit.cs.1.0:
    movl        $10, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.1.1:
    movl        -4(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -16(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    jmp         .Lswit.br.1
.Lswit.df.1:
    movl        $99, -4(%rbp)
.Lswit.br.1:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
