    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    jmp         .Lor.tr.1
    movl        $0, -8(%rbp)
    jmp         .Lor.en.2
.Lor.tr.1:
    movl        $1, -8(%rbp)
.Lor.en.2:
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
