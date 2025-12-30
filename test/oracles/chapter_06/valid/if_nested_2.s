    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $1, -8(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lmain.if.el.1
    movl        $1, -8(%rbp)
    jmp         .Lmain.if.en.0
.Lmain.if.el.1:
    movl        -8(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    notl        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lmain.if.en.3
    movl        $2, -8(%rbp)
.Lmain.if.en.3:
.Lmain.if.en.0:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
