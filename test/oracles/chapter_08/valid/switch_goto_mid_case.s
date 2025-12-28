    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    jmp         .Lmid_case.0
    movl        $1, -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lswit.cs.1.4
    jmp         .Lswit.br.1
.Lswit.cs.1.4:
    movl        $5, -4(%rbp)
.Lmid_case.0:
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    addl        $1, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.br.1:
    movl        $100, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
