    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
.Lloop.st.1:
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    addl        $1, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    cmpl        $3, -4(%rbp)
    movl        $0, -12(%rbp)
    setg        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lmain.if.en.2
    jmp         .Lloop.br.1
.Lmain.if.en.2:
.Lloop.ct.1:
    jmp         .Lloop.st.1
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
