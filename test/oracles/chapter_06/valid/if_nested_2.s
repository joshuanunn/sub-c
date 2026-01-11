    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $1, -8(%rbp)
    movl        $-2, -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lmain.if.en.3
    movl        $2, -8(%rbp)
.Lmain.if.en.3:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
