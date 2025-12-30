    .globl      f
    .text       
f:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        i.0(%rip), %r10d
    movl        %r10d, -4(%rbp)
    addl        $1, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, i.0(%rip)
    movl        j.1(%rip), %r10d
    movl        %r10d, -8(%rbp)
    movl        i.0(%rip), %r10d
    subl        %r10d, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, j.1(%rip)
    movl        k.2(%rip), %r10d
    movl        %r10d, -12(%rbp)
    movl        -12(%rbp), %r11d
    imull       j.1(%rip), %r11d
    movl        %r11d, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, k.2(%rip)
    movl        l.3(%rip), %eax
    cdq         
    movl        $2, %r10d
    idivl       %r10d
    movl        %eax, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, l.3(%rip)
    cmpl        $3, i.0(%rip)
    movl        $0, -20(%rbp)
    setne       -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lf.if.en.5
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lf.if.en.5:
    movl        $-6, -24(%rbp)
    movl        -24(%rbp), %r10d
    cmpl        %r10d, j.1(%rip)
    movl        $0, -28(%rbp)
    setne       -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lf.if.en.8
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lf.if.en.8:
    movl        $-18, -32(%rbp)
    movl        -32(%rbp), %r10d
    cmpl        %r10d, k.2(%rip)
    movl        $0, -36(%rbp)
    setne       -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Lf.if.en.11
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lf.if.en.11:
    cmpl        $6, l.3(%rip)
    movl        $0, -40(%rbp)
    setne       -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lf.if.en.13
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lf.if.en.13:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    call        f@PLT
    movl        %eax, -4(%rbp)
    call        f@PLT
    movl        %eax, -8(%rbp)
    call        f@PLT
    movl        %eax, -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .data       
    .align      4
l.3:
    .long       48
    .data       
    .align      4
k.2:
    .long       1
    .bss        
    .align      4
i.0:
    .zero       4
    .bss        
    .align      4
j.1:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
