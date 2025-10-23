    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    jmp         .Llabel
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Llabel:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
