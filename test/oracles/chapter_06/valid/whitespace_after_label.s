    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    jmp         .Llabel2.0
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Llabel1.1:
.Llabel2.0:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
