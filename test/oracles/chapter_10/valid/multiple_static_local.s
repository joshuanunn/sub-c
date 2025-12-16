    .globl      foo
    .text       
foo:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        a.0(%rip), %r10d
    movl        %r10d, -4(%rbp)
    movl        -4(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, a.0(%rip)
    movl        a.0(%rip), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      bar
    .text       
bar:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        a.1(%rip), %r10d
    movl        %r10d, -4(%rbp)
    addl        $1, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, a.1(%rip)
    movl        a.1(%rip), %eax
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
    subq        $32, %rsp
    call        foo@PLT
    movl        %eax, -4(%rbp)
    call        bar@PLT
    movl        %eax, -8(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -8(%rbp), %r10d
    addl        %r10d, -12(%rbp)
    call        foo@PLT
    movl        %eax, -16(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -16(%rbp), %r10d
    addl        %r10d, -20(%rbp)
    call        bar@PLT
    movl        %eax, -24(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        -24(%rbp), %r10d
    addl        %r10d, -28(%rbp)
    movl        -28(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .data       
    .align      4
a.1:
    .long       4
    .data       
    .align      4
a.0:
    .long       3
    .section    .note.GNU-stack,"",@progbits
