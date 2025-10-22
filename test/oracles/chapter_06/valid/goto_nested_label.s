    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    jmp         .LlabelB.0
.LlabelA.1:
.LlabelB.0:
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
