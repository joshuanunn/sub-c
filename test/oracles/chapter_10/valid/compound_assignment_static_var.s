    .globl      f
    .text       
f:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $64, %rsp
    movl        $0, i.0(%rip)
    movl        $0, j.1(%rip)
    movl        $1, k.2(%rip)
    movl        $48, l.3(%rip)
    movl        i.0(%rip), %r10d
    movl        %r10d, -20(%rbp)
    addl        $1, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, i.0(%rip)
    movl        j.1(%rip), %r10d
    movl        %r10d, -24(%rbp)
    movl        i.0(%rip), %r10d
    subl        %r10d, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, j.1(%rip)
    movl        k.2(%rip), %r10d
    movl        %r10d, -28(%rbp)
    movl        -28(%rbp), %r11d
    imull       j.1(%rip), %r11d
    movl        %r11d, -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, k.2(%rip)
    movl        l.3(%rip), %eax
    cdq         
    movl        $2, %r10d
    idivl       %r10d
    movl        %eax, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, l.3(%rip)
    cmpl        $3, i.0(%rip)
    movl        $0, -36(%rbp)
    setne       -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Lif.en.5
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.5:
    movl        $6, -40(%rbp)
    negl        -40(%rbp)
    movl        -40(%rbp), %r10d
    cmpl        %r10d, j.1(%rip)
    movl        $0, -44(%rbp)
    setne       -44(%rbp)
    cmpl        $0, -44(%rbp)
    je          .Lif.en.8
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.8:
    movl        $18, -48(%rbp)
    negl        -48(%rbp)
    movl        -48(%rbp), %r10d
    cmpl        %r10d, k.2(%rip)
    movl        $0, -52(%rbp)
    setne       -52(%rbp)
    cmpl        $0, -52(%rbp)
    je          .Lif.en.11
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.11:
    cmpl        $6, l.3(%rip)
    movl        $0, -56(%rbp)
    setne       -56(%rbp)
    cmpl        $0, -56(%rbp)
    je          .Lif.en.13
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.13:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
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
    movl        $0, %eax
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
