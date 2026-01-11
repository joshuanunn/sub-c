    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $1, -4(%rbp)
    movl        $0, -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lswit.cs.1.0
    movl        $1, -12(%rbp)
    jmp         .Lswit.cs.1.1
.Lswit.cs.1.0:
    movl        $10, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.1.1:
    movl        $2, -16(%rbp)
    movl        $2, -4(%rbp)
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
