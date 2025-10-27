    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $4, %rsp
    movl        $10, -4(%rbp)
.Lloop.ct.1:
    movl        $1, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lloop.br.1
    jmp         .Lloop.br.1
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
