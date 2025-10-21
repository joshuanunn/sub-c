    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $4, %rsp
    movl        $5, -4(%rbp)
    jmp         .Lmain.ident.1
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.ident.1:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
