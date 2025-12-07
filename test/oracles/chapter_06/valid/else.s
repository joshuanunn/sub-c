    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lif.el.1
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    jmp         .Lif.en.0
.Lif.el.1:
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.0:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
