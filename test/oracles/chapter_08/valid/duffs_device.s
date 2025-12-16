    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $80, %rsp
    movl        $37, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    addl        $4, -12(%rbp)
    movl        -12(%rbp), %eax
    cdq         
    movl        $5, %r10d
    idivl       %r10d
    movl        %eax, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        -4(%rbp), %eax
    cdq         
    movl        $5, %r10d
    idivl       %r10d
    movl        %edx, -20(%rbp)
    cmpl        $0, -20(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    jne         .Lswit.cs.1.0
    cmpl        $4, -20(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    jne         .Lswit.cs.1.4
    cmpl        $3, -20(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    jne         .Lswit.cs.1.3
    cmpl        $2, -20(%rbp)
    movl        $0, -36(%rbp)
    sete        -36(%rbp)
    cmpl        $0, -36(%rbp)
    jne         .Lswit.cs.1.2
    cmpl        $1, -20(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    jne         .Lswit.cs.1.1
    jmp         .Lswit.br.1
.Lswit.cs.1.0:
.Lloop.st.2:
    movl        -4(%rbp), %r10d
    movl        %r10d, -44(%rbp)
    subl        $1, -44(%rbp)
    movl        -44(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lswit.cs.1.4:
    movl        -4(%rbp), %r10d
    movl        %r10d, -48(%rbp)
    subl        $1, -48(%rbp)
    movl        -48(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lswit.cs.1.3:
    movl        -4(%rbp), %r10d
    movl        %r10d, -52(%rbp)
    subl        $1, -52(%rbp)
    movl        -52(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lswit.cs.1.2:
    movl        -4(%rbp), %r10d
    movl        %r10d, -56(%rbp)
    subl        $1, -56(%rbp)
    movl        -56(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lswit.cs.1.1:
    movl        -4(%rbp), %r10d
    movl        %r10d, -60(%rbp)
    subl        $1, -60(%rbp)
    movl        -60(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lloop.ct.2:
    movl        -8(%rbp), %r10d
    movl        %r10d, -64(%rbp)
    subl        $1, -64(%rbp)
    movl        -64(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    cmpl        $0, -8(%rbp)
    movl        $0, -68(%rbp)
    setg        -68(%rbp)
    cmpl        $0, -68(%rbp)
    jne         .Lloop.st.2
.Lloop.br.2:
.Lswit.br.1:
    cmpl        $0, -4(%rbp)
    movl        $0, -72(%rbp)
    sete        -72(%rbp)
    cmpl        $0, -72(%rbp)
    je          .Land.fl.18
    cmpl        $0, -8(%rbp)
    movl        $0, -76(%rbp)
    sete        -76(%rbp)
    cmpl        $0, -76(%rbp)
    je          .Land.fl.18
    movl        $1, -80(%rbp)
    jmp         .Land.en.19
.Land.fl.18:
    movl        $0, -80(%rbp)
.Land.en.19:
    movl        -80(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
