    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Lif.en.0
.Llabel.0:
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.0:
    jmp         .Llabel.0
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
