    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Lif.el.1
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Lif.el.3
    movl        $3, -4(%rbp)
    jmp         .Lif.en.2
.Lif.el.3:
    movl        $4, -4(%rbp)
.Lif.en.2:
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
