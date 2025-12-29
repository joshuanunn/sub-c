    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    jmp         .Lmain.cond.el.2
    movl        $1, -4(%rbp)
    jmp         .Lmain.cond.en.1
.Lmain.cond.el.2:
    jmp         .Lmain.or.tr.4
    movl        $0, -8(%rbp)
    jmp         .Lmain.or.en.5
.Lmain.or.tr.4:
    movl        $1, -8(%rbp)
.Lmain.or.en.5:
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lmain.cond.en.1:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
