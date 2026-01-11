    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        %edi, -28(%rbp)
    movl        $0, -4(%rbp)
    cmpl        $1, -28(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lswit.cs.1.1
    cmpl        $2, -28(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lswit.cs.1.2
    cmpl        $3, -28(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    jne         .Lswit.cs.1.3
    jmp         .Lswit.df.1
.Lswit.cs.1.1:
    movl        $1, globvar(%rip)
.Lswit.cs.1.2:
    movl        globvar(%rip), %r10d
    movl        %r10d, -20(%rbp)
    addl        $3, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, globvar(%rip)
.Lswit.cs.1.3:
    movl        globvar(%rip), %r10d
    movl        %r10d, -24(%rbp)
    movl        -24(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, globvar(%rip)
.Lswit.df.1:
    movl        $3, -4(%rbp)
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $2, %edi
    call        target@PLT
    movl        %eax, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    cmpl        $3, -8(%rbp)
    movl        $0, -12(%rbp)
    setne       -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lmain.if.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.2:
    cmpl        $6, globvar(%rip)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.4
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.4:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      globvar
    .bss        
    .align      4
globvar:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
