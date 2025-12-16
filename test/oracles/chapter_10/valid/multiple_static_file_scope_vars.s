    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        foo(%rip), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .data       
    .align      4
foo:
    .long       4
    .section    .note.GNU-stack,"",@progbits
