    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    addl        $1, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lmain.cond.el.2
    addl        $1, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    jmp         .Lmain.cond.en.1
.Lmain.cond.el.2:
    movl        $0, -8(%rbp)
.Lmain.cond.en.1:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
