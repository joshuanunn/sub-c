    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $66, %edi
    call        putchar@PLT
    movl        %eax, -4(%rbp)
    movl        $10, %edi
    call        putchar@PLT
    movl        %eax, -8(%rbp)
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
