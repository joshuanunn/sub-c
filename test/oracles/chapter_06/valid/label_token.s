    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    jmp         .L_foo_1_.0
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.L_foo_1_.0:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
