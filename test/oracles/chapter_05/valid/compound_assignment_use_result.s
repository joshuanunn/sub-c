    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $1, -4(%rbp)
    movl        $4, -12(%rbp)
    movl        $4, -4(%rbp)
    movl        $4, -8(%rbp)
    movl        $1, -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.and.fl.4
    cmpl        $4, -4(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.and.fl.4
    movl        $1, -24(%rbp)
    jmp         .Lmain.and.en.5
.Lmain.and.fl.4:
    movl        $0, -24(%rbp)
.Lmain.and.en.5:
    movl        -24(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
