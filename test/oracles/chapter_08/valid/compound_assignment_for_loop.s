    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $1, -4(%rbp)
    movl        $-1, -8(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -12(%rbp), %r11d
    imull       -8(%rbp), %r11d
    movl        %r11d, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lloop.st.1:
    movl        $-100, -16(%rbp)
    movl        -16(%rbp), %r10d
    cmpl        %r10d, -4(%rbp)
    movl        $0, -20(%rbp)
    setge       -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lloop.br.1
.Lloop.ct.1:
    movl        -4(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    subl        $3, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    movl        $-103, -28(%rbp)
    movl        -28(%rbp), %r10d
    cmpl        %r10d, -4(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    movl        -32(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
