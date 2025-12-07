    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
.L_label.0:
.Llabel_.1:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main_
main_:
    pushq       %rbp
    movq        %rsp, %rbp
.Llabel.2:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      _main
_main:
    pushq       %rbp
    movq        %rsp, %rbp
.Llabel.3:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
