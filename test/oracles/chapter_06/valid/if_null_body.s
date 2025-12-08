    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Lif.el.1
    jmp         .Lif.en.0
.Lif.el.1:
    movl        $1, -4(%rbp)
.Lif.en.0:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
