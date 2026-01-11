    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $10, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        $5, -4(%rbp)
    movl        $5, -12(%rbp)
    movl        $5, -8(%rbp)
    movl        $1, -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.and.fl.6
    cmpl        $5, -12(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.and.fl.6
    movl        $1, -24(%rbp)
    jmp         .Lmain.and.en.7
.Lmain.and.fl.6:
    movl        $0, -24(%rbp)
.Lmain.and.en.7:
    movl        -24(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
