    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, -4(%rbp)
    addl        $2, -4(%rbp)
    cmpl        $4, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lif.en.2
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.2:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
