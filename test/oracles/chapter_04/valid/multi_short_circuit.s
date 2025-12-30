    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lmain.or.tr.5
    movl        $0, -12(%rbp)
    jmp         .Lmain.or.en.6
.Lmain.or.tr.5:
    movl        $1, -12(%rbp)
.Lmain.or.en.6:
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
