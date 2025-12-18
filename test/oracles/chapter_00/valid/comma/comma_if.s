    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $1, -4(%rbp)
    cmpl        $1, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lif.el.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    jmp         .Lif.en.1
.Lif.el.2:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.1:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
