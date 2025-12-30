    .globl      callee
    .text       
callee:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $40, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    addl        $5, -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    call        target@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
