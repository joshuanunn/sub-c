    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        %edi, -24(%rbp)
    movl        $1, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        $0, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -12(%rbp), %r10d
    addl        %r10d, -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $10, %edi
    call        target@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
