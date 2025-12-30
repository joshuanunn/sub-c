    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    jmp         .Lmain.if.en.0
.Llabel.0:
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.0:
    jmp         .Llabel.0
    .section    .note.GNU-stack,"",@progbits
