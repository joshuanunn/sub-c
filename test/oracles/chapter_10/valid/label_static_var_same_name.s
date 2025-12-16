    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $5, x.1(%rip)
    jmp         .Lx.0
    movl        $0, x.1(%rip)
.Lx.0:
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
    .long       5
    .section    .note.GNU-stack,"",@progbits
