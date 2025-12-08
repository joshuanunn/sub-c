    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, -4(%rbp)
    movl        $0, -8(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lif.en.0
    movl        $1, -8(%rbp)
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
