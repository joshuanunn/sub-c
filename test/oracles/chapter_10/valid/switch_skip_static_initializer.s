    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    cmpl        $1, a(%rip)
    movl        $0, -4(%rbp)
    sete        -4(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lswit.cs.1.1
    cmpl        $3, a(%rip)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lswit.cs.1.3
    jmp         .Lswit.br.1
.Lswit.cs.1.1:
    movl        $0, x.0(%rip)
.Lswit.cs.1.3:
    movl        x.0(%rip), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.br.1:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .data       
    .align      4
x.0:
    .long       10
    .globl      a
    .data       
    .align      4
a:
    .long       3
    .section    .note.GNU-stack,"",@progbits
