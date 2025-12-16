    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $1, -8(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lif.el.1
    movl        $1, -8(%rbp)
    jmp         .Lif.en.0
.Lif.el.1:
    movl        -8(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    notl        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lif.en.3
    movl        $2, -8(%rbp)
.Lif.en.3:
.Lif.en.0:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
