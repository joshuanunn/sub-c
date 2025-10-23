    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    jmp         .LlabelB
.LlabelA:
.LlabelB:
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
