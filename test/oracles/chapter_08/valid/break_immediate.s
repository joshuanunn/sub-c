    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $4, %rsp
    movl        $10, -4(%rbp)
.Lcontinue.while.1:
    movl        $1, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lbreak.while.1
    jmp         .Lbreak.while.1
    jmp         .Lcontinue.while.1
.Lbreak.while.1:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
