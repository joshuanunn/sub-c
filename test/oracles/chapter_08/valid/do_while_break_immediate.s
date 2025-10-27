    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $4, %rsp
    movl        $10, -4(%rbp)
.Lstart.dowhile.1:
    jmp         .Lbreak.dowhile.1
.Lcontinue.dowhile.1:
    movl        $1, -4(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lstart.dowhile.1
.Lbreak.dowhile.1:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
