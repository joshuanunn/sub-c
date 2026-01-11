    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $0, -4(%rbp)
    movl        $1, -8(%rbp)
    movl        $0, -16(%rbp)
    cmpl        $0, -16(%rbp)
    jne         .Lswit.cs.2.3
    movl        $1, -20(%rbp)
    jmp         .Lswit.cs.2.4
.Lswit.cs.2.3:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.2.4:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
