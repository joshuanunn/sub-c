    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        $1, -4(%rbp)
    negl        -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, y(%rip)
    movl        x(%rip), %r10d
    movl        %r10d, -8(%rbp)
    shll        $1, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    orl         $1, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, x(%rip)
    cmpl        $3, x(%rip)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lif.en.4
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.4:
    movl        $5, -20(%rbp)
    negl        -20(%rbp)
    movl        y(%rip), %r10d
    movl        %r10d, -24(%rbp)
    movl        -20(%rbp), %r10d
    andl        %r10d, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    xorl        $12, -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    sarl        $2, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, y(%rip)
    movl        $3, -36(%rbp)
    negl        -36(%rbp)
    movl        -36(%rbp), %r10d
    cmpl        %r10d, y(%rip)
    movl        $0, -40(%rbp)
    setne       -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lif.en.11
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.11:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      x
    .data       
    .align      4
x:
    .long       1
    .globl      y
    .bss        
    .align      4
y:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
