    .text       
foo:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    call        foo@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        bar(%rip), %r10d
    addl        %r10d, -8(%rbp)
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .data       
    .align      4
bar:
    .long       4
    .section    .note.GNU-stack,"",@progbits
