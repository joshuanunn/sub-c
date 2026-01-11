    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $7, -4(%rbp)
    movl        $7, -8(%rbp)
    movl        $14, -12(%rbp)
    movl        $0, -16(%rbp)
    cmpl        $0, -16(%rbp)
    jne         .Lswit.cs.1.2
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.1.2:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
