    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    jmp         .L_main.0
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.L_main.0:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
