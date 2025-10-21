    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    jmp         .Lmain.labelB.0
.Lmain.labelA.1:
.Lmain.labelB.0:
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
