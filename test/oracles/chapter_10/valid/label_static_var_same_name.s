    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        x.1(%rip), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .data       
    .align      4
x.1:
    .long       5
    .section    .note.GNU-stack,"",@progbits
