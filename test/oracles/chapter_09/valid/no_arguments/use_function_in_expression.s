    .globl      bar
    .text       
bar:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $9, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      foo
    .text       
foo:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    call        bar@PLT
    movl        %eax, -4(%rbp)
    movl        $2, -8(%rbp)
    movl        -8(%rbp), %r11d
    imull       -4(%rbp), %r11d
    movl        %r11d, -8(%rbp)
    movl        -8(%rbp), %eax
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
    call        foo@PLT
    movl        %eax, -4(%rbp)
    call        bar@PLT
    movl        %eax, -8(%rbp)
    movl        -8(%rbp), %eax
    cdq         
    movl        $3, %r10d
    idivl       %r10d
    movl        %eax, -12(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -12(%rbp), %r10d
    addl        %r10d, -16(%rbp)
    movl        -16(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
