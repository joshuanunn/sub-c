    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $2147483642, -4(%rbp)
.Lloop.st.1:
.Lloop.ct.1:
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    subl        $5, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    cmpl        $256, -4(%rbp)
    movl        $0, -12(%rbp)
    setge       -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lloop.st.1
.Lloop.br.1:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
