    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    jmp         .Llabel.0
.Lloop.ct.1:
    jmp         .Lloop.br.1
.Llabel.0:
    movl        $1, -4(%rbp)
    jmp         .Lloop.ct.1
.Lloop.br.1:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
