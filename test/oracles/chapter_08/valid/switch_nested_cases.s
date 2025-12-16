    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $64, %rsp
    movl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        $0, -12(%rbp)
    movl        $3, %r11d
    cmpl        $0, %r11d
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    jne         .Lswit.cs.1.0
    movl        $3, %r11d
    cmpl        $1, %r11d
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    jne         .Lswit.cs.1.1
    movl        $3, %r11d
    cmpl        $3, %r11d
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    jne         .Lswit.cs.1.3
    jmp         .Lswit.df.1
.Lswit.cs.1.0:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.1.1:
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Lif.en.3
.Lswit.cs.1.3:
    movl        $1, -4(%rbp)
    jmp         .Lswit.br.1
.Lif.en.3:
.Lswit.df.1:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.br.1:
    movl        $4, %r11d
    cmpl        $0, %r11d
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    jne         .Lswit.cs.2.0
    movl        $4, %r11d
    cmpl        $4, %r11d
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    jne         .Lswit.cs.2.4
    jmp         .Lswit.df.2
.Lswit.cs.2.0:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $1, %r11d
    cmpl        $0, %r11d
    je          .Lif.el.7
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    jmp         .Lif.en.6
.Lif.el.7:
.Lswit.cs.2.4:
    movl        $1, -8(%rbp)
    jmp         .Lswit.br.2
.Lif.en.6:
.Lswit.df.2:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.br.2:
    movl        $5, %r11d
    cmpl        $5, %r11d
    movl        $0, -36(%rbp)
    sete        -36(%rbp)
    cmpl        $0, -36(%rbp)
    jne         .Lswit.cs.3.5
    jmp         .Lswit.df.3
    movl        $0, -40(%rbp)
.Lloop.st.4:
    cmpl        $10, -40(%rbp)
    movl        $0, -44(%rbp)
    setl        -44(%rbp)
    cmpl        $0, -44(%rbp)
    je          .Lloop.br.4
    movl        $0, -4(%rbp)
.Lswit.cs.3.5:
    movl        $1, -12(%rbp)
    jmp         .Lloop.br.4
.Lswit.df.3:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lloop.ct.4:
    movl        -40(%rbp), %r10d
    movl        %r10d, -48(%rbp)
    addl        $1, -48(%rbp)
    movl        -48(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    jmp         .Lloop.st.4
.Lloop.br.4:
.Lswit.br.3:
    cmpl        $0, -4(%rbp)
    je          .Land.fl.12
    cmpl        $0, -8(%rbp)
    je          .Land.fl.12
    movl        $1, -52(%rbp)
    jmp         .Land.en.13
.Land.fl.12:
    movl        $0, -52(%rbp)
.Land.en.13:
    cmpl        $0, -52(%rbp)
    je          .Land.fl.15
    cmpl        $0, -12(%rbp)
    je          .Land.fl.15
    movl        $1, -56(%rbp)
    jmp         .Land.en.16
.Land.fl.15:
    movl        $0, -56(%rbp)
.Land.en.16:
    movl        -56(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
