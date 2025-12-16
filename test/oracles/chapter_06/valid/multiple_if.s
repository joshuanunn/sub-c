    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lif.el.1
    movl        $2, -4(%rbp)
    jmp         .Lif.en.0
.Lif.el.1:
    movl        $3, -4(%rbp)
.Lif.en.0:
    cmpl        $0, -8(%rbp)
    je          .Lif.el.3
    movl        $4, -8(%rbp)
    jmp         .Lif.en.2
.Lif.el.3:
    movl        $5, -8(%rbp)
.Lif.en.2:
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -8(%rbp), %r10d
    addl        %r10d, -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
