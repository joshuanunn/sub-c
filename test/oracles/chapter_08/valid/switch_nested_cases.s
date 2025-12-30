    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $64, %rsp
    movl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        $0, -12(%rbp)
    movl        $0, -16(%rbp)
    cmpl        $0, -16(%rbp)
    jne         .Lswit.cs.1.0
    movl        $0, -20(%rbp)
    cmpl        $0, -20(%rbp)
    jne         .Lswit.cs.1.1
    movl        $1, -24(%rbp)
    cmpl        $0, -24(%rbp)
    jne         .Lswit.cs.1.3
    jmp         .Lswit.df.1
.Lswit.cs.1.0:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.1.1:
    jmp         .Lmain.if.en.3
.Lswit.cs.1.3:
    movl        $1, -4(%rbp)
    jmp         .Lswit.br.1
.Lmain.if.en.3:
.Lswit.df.1:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.br.1:
    movl        $0, -28(%rbp)
    cmpl        $0, -28(%rbp)
    jne         .Lswit.cs.2.0
    movl        $1, -32(%rbp)
    cmpl        $0, -32(%rbp)
    jne         .Lswit.cs.2.4
    jmp         .Lswit.df.2
.Lswit.cs.2.0:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.2.4:
    movl        $1, -8(%rbp)
    jmp         .Lswit.br.2
.Lswit.df.2:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.br.2:
    movl        $1, -36(%rbp)
    cmpl        $0, -36(%rbp)
    jne         .Lswit.cs.3.5
    jmp         .Lswit.df.3
.Lswit.cs.3.5:
    movl        $1, -12(%rbp)
    jmp         .Lloop.br.4
.Lswit.df.3:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lloop.br.4:
    cmpl        $0, -4(%rbp)
    je          .Lmain.and.fl.12
    cmpl        $0, -8(%rbp)
    je          .Lmain.and.fl.12
    movl        $1, -52(%rbp)
    jmp         .Lmain.and.en.13
.Lmain.and.fl.12:
    movl        $0, -52(%rbp)
.Lmain.and.en.13:
    cmpl        $0, -52(%rbp)
    je          .Lmain.and.fl.15
    cmpl        $0, -12(%rbp)
    je          .Lmain.and.fl.15
    movl        $1, -56(%rbp)
    jmp         .Lmain.and.en.16
.Lmain.and.fl.15:
    movl        $0, -56(%rbp)
.Lmain.and.en.16:
    movl        -56(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
