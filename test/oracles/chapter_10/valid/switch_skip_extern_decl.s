    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $10, -4(%rbp)
    movl        $0, -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lswit.cs.1.1
    movl        $0, -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lswit.cs.1.2
    movl        $1, -16(%rbp)
    cmpl        $0, -16(%rbp)
    jne         .Lswit.cs.1.10
    jmp         .Lswit.df.1
.Lswit.cs.1.1:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.1.2:
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.1.10:
    movl        x(%rip), %r10d
    movl        %r10d, -20(%rbp)
    movl        -20(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -20(%rbp)
    cmpl        $30, -20(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.if.en.5
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.5:
.Lswit.df.1:
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      x
    .data       
    .align      4
x:
    .long       15
    .section    .note.GNU-stack,"",@progbits
