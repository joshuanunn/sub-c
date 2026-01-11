    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $100, -4(%rbp)
    movl        $-100, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -16(%rbp), %r11d
    imull       $3, %r11d
    movl        %r11d, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    addl        $300, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Ltarget.cond.el.5
    movl        $1, -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    jmp         .Ltarget.cond.en.4
.Ltarget.cond.el.5:
    movl        $25, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -24(%rbp)
.Ltarget.cond.en.4:
    movl        -24(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    call        target@PLT
    movl        %eax, -4(%rbp)
    cmpl        $25, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
