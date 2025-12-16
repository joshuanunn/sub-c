    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
.Lloop.st.1:
    cmpl        $5, -4(%rbp)
    movl        $0, -8(%rbp)
    setl        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lloop.br.1
    movl        foo(%rip), %r10d
    movl        %r10d, -12(%rbp)
    addl        $1, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, foo(%rip)
.Lloop.ct.1:
    movl        -4(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    addl        $1, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    movl        foo(%rip), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      foo
    .bss        
    .align      4
foo:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
