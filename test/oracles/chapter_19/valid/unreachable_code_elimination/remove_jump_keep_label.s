    .globl      callee
    .text       
callee:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        x(%rip), %r10d
    movl        %r10d, -4(%rbp)
    addl        $1, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, x(%rip)
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      f
    .text       
f:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
.Lloop.st.1:
    cmpl        $10, -4(%rbp)
    movl        $0, -8(%rbp)
    setl        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lloop.br.1
    call        callee@PLT
    movl        %eax, -12(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    addl        $1, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    call        f@PLT
    movl        %eax, -4(%rbp)
    movl        x(%rip), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      x
    .bss        
    .align      4
x:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
