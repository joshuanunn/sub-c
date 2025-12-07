    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $3, %r11d
    cmpl        $0, %r11d
    movl        $0, -4(%rbp)
    sete        -4(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lswit.cs.1.0
    movl        $3, %r11d
    cmpl        $3, %r11d
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lswit.cs.1.3
    movl        $3, %r11d
    cmpl        $4, %r11d
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lswit.cs.1.4
    jmp         .Lswit.df.1
.Lswit.cs.1.0:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.1.3:
    movl        $4, %r11d
    cmpl        $3, %r11d
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    jne         .Lswit.cs.2.3
    movl        $4, %r11d
    cmpl        $4, %r11d
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    jne         .Lswit.cs.2.4
    jmp         .Lswit.df.2
.Lswit.cs.2.3:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.2.4:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.df.2:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.br.2:
.Lswit.cs.1.4:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.df.1:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.br.1:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
