    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    jmp         .Lmain.label.0
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.label.0:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
