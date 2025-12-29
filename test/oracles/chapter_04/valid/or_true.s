    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    jmp         .Lmain.or.tr.1
    movl        $0, -4(%rbp)
    jmp         .Lmain.or.en.2
.Lmain.or.tr.1:
    movl        $1, -4(%rbp)
.Lmain.or.en.2:
    jmp         .Lmain.or.tr.4
    movl        $0, -8(%rbp)
    jmp         .Lmain.or.en.5
.Lmain.or.tr.4:
    movl        $1, -8(%rbp)
.Lmain.or.en.5:
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -8(%rbp), %r10d
    addl        %r10d, -12(%rbp)
    jmp         .Lmain.or.tr.8
    jmp         .Lmain.or.tr.8
    movl        $0, -16(%rbp)
    jmp         .Lmain.or.en.9
.Lmain.or.tr.8:
    movl        $1, -16(%rbp)
.Lmain.or.en.9:
    movl        -12(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -16(%rbp), %r10d
    addl        %r10d, -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
