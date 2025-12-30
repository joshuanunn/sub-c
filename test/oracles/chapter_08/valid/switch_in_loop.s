    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $64, %rsp
    movl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        $0, -12(%rbp)
.Lloop.st.1:
    cmpl        $10, -12(%rbp)
    movl        $0, -16(%rbp)
    setl        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lloop.br.1
    cmpl        $0, -12(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    jne         .Lswit.cs.2.0
    cmpl        $1, -12(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    jne         .Lswit.cs.2.1
    cmpl        $2, -12(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    jne         .Lswit.cs.2.2
    jmp         .Lswit.df.2
.Lswit.cs.2.0:
    movl        $2, -4(%rbp)
    jmp         .Lswit.br.2
.Lswit.cs.2.1:
    movl        -4(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    movl        -32(%rbp), %r11d
    imull       $3, %r11d
    movl        %r11d, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    jmp         .Lswit.br.2
.Lswit.cs.2.2:
    movl        -4(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    movl        -36(%rbp), %r11d
    imull       $4, %r11d
    movl        %r11d, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    jmp         .Lswit.br.2
.Lswit.df.2:
    movl        -4(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    addl        $1, -40(%rbp)
    movl        -40(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lswit.br.2:
    movl        -8(%rbp), %r10d
    movl        %r10d, -44(%rbp)
    addl        $1, -44(%rbp)
    movl        -44(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -48(%rbp)
    addl        $1, -48(%rbp)
    movl        -48(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    cmpl        $10, -8(%rbp)
    movl        $0, -52(%rbp)
    sete        -52(%rbp)
    cmpl        $0, -52(%rbp)
    je          .Lmain.and.fl.12
    cmpl        $31, -4(%rbp)
    movl        $0, -56(%rbp)
    sete        -56(%rbp)
    cmpl        $0, -56(%rbp)
    je          .Lmain.and.fl.12
    movl        $1, -60(%rbp)
    jmp         .Lmain.and.en.13
.Lmain.and.fl.12:
    movl        $0, -60(%rbp)
.Lmain.and.en.13:
    movl        -60(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
