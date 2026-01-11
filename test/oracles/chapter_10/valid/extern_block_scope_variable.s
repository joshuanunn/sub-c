    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        foo(%rip), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      foo
    .data       
    .align      4
foo:
    .long       3
    .section    .note.GNU-stack,"",@progbits
