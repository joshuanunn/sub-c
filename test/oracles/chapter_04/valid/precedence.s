    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    jmp         .Lmain.or.tr.4
    jmp         .Lmain.and.fl.1
    movl        $1, -4(%rbp)
    jmp         .Lmain.and.en.2
.Lmain.and.fl.1:
    movl        $0, -4(%rbp)
.Lmain.and.en.2:
    cmpl        $0, -4(%rbp)
    jne         .Lmain.or.tr.4
    movl        $0, -8(%rbp)
    jmp         .Lmain.or.en.5
.Lmain.or.tr.4:
    movl        $1, -8(%rbp)
.Lmain.or.en.5:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
