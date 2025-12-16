    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, -8(%rbp)
    negl        -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    addl        $1, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lif.el.2
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    jmp         .Lif.en.1
.Lif.el.2:
    addl        $1, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lif.en.3
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.3:
.Lif.en.1:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
