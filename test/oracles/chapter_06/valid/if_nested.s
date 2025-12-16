    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, -4(%rbp)
    movl        $0, -8(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lif.el.1
    movl        $1, -8(%rbp)
    jmp         .Lif.en.0
.Lif.el.1:
    cmpl        $0, -8(%rbp)
    je          .Lif.en.2
    movl        $2, -8(%rbp)
.Lif.en.2:
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
