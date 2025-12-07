    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $100, -4(%rbp)
    movl        $0, -8(%rbp)
.Lloop.st.1:
    movl        -8(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    addl        $2, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -8(%rbp)
.Lloop.ct.1:
    movl        -4(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    subl        $1, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lloop.st.1
.Lloop.br.1:
    cmpl        $0, -4(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Land.fl.5
    cmpl        $200, -8(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Land.fl.5
    movl        $1, -28(%rbp)
    jmp         .Land.en.6
.Land.fl.5:
    movl        $0, -28(%rbp)
.Land.en.6:
    movl        -28(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
