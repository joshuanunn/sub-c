    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    jmp         .Lmain.if.en.1
.Lreturn_a.0:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.1:
    movl        $4, -12(%rbp)
    jmp         .Lreturn_a.0
    .section    .note.GNU-stack,"",@progbits
