    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $4, %rsp
    movl        $0, -4(%rbp)
    jmp         .Llabel
.Lcontinue.while.1:
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Lbreak.while.1
.Llabel:
    movl        $1, -4(%rbp)
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
