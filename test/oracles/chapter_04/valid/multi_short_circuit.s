    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    jmp         .Lmain.and.fl.2
    movl        $1, %eax
    cdq         
    movl        $0, %r10d
    idivl       %r10d
    movl        %eax, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lmain.and.fl.2
    movl        $1, -8(%rbp)
    jmp         .Lmain.and.en.3
.Lmain.and.fl.2:
    movl        $0, -8(%rbp)
.Lmain.and.en.3:
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
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
