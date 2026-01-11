    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        x(%rip), %r10d
    movl        %r10d, -4(%rbp)
    movl        $4, x(%rip)
    cmpl        $10, -4(%rbp)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.1
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.1:
    movl        $0, -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lmain.if.en.3
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.3:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      x
    .data       
    .align      4
x:
    .long       10
    .section    .note.GNU-stack,"",@progbits
