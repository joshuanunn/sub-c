    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $0, -12(%rbp)
    movl        $0, -8(%rbp)
    movl        $0, -4(%rbp)
.Lloop.st.1:
    cmpl        $5, -4(%rbp)
    movl        $0, -16(%rbp)
    setl        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lloop.br.1
    movl        -12(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -8(%rbp), %r10d
    addl        %r10d, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    addl        $1, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    addl        $2, -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
