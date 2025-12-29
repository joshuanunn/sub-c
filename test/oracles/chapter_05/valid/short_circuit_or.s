    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    jmp         .Lmain.or.tr.1
    movl        $1, -4(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lmain.or.tr.1
    movl        $0, -8(%rbp)
    jmp         .Lmain.or.en.2
.Lmain.or.tr.1:
    movl        $1, -8(%rbp)
.Lmain.or.en.2:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
