    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $4, %rsp
    movl        $0, -4(%rbp)
    jmp         .Llabel.0
.Lloop.ct.1:
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Lloop.br.1
.Llabel.0:
    movl        $1, -4(%rbp)
    jmp         .Lloop.ct.1
.Lloop.br.1:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
