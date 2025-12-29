    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $-2147483647, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lloop.st.1:
    movl        -4(%rbp), %eax
    cdq         
    movl        $5, %r10d
    idivl       %r10d
    movl        %edx, -12(%rbp)
    cmpl        $0, -12(%rbp)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lloop.br.1
    movl        -4(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    addl        $1, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lloop.ct.1:
    jmp         .Lloop.st.1
.Lloop.br.1:
    movl        -4(%rbp), %eax
    cdq         
    movl        $5, %r10d
    idivl       %r10d
    movl        %edx, -24(%rbp)
    cmpl        $0, -24(%rbp)
    jne         .Lmain.or.tr.7
    cmpl        $0, -4(%rbp)
    movl        $0, -28(%rbp)
    setg        -28(%rbp)
    cmpl        $0, -28(%rbp)
    jne         .Lmain.or.tr.7
    movl        $0, -32(%rbp)
    jmp         .Lmain.or.en.8
.Lmain.or.tr.7:
    movl        $1, -32(%rbp)
.Lmain.or.en.8:
    movl        -32(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
