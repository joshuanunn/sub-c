    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    subl        $1, -4(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lif.el.2
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    jmp         .Lif.en.1
.Lif.el.2:
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    subl        $1, -4(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lif.en.4
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.4:
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
