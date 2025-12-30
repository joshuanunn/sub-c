    .globl      callee
    .text       
callee:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -12(%rbp)
    cmpl        $1, -12(%rbp)
    movl        $0, -4(%rbp)
    sete        -4(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lswit.cs.1.1
    jmp         .Lswit.df.1
.Lswit.cs.1.1:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.df.1:
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, %edi
    call        target@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
