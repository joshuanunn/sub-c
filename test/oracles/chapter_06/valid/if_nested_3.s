    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $1, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lmain.if.en.0
    cmpl        $1, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.el.3
    movl        $3, -4(%rbp)
    jmp         .Lmain.if.en.2
.Lmain.if.el.3:
    movl        $4, -4(%rbp)
.Lmain.if.en.2:
.Lmain.if.en.0:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
