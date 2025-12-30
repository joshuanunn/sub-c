    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $10, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    subl        $10, -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lmain.cond.el.3
    movl        $0, -8(%rbp)
    jmp         .Lmain.cond.en.2
.Lmain.cond.el.3:
    movl        -4(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    subl        $1, -4(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -8(%rbp)
.Lmain.cond.en.2:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
