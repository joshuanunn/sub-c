    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    jmp         .Lend.0
.Lend.0:
    movl        x.1(%rip), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .data       
    .align      4
x.1:
    .long       10
    .section    .note.GNU-stack,"",@progbits
