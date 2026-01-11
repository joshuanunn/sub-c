    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        $0, -12(%rbp)
    movl        $1, -4(%rbp)
    movl        $2, -4(%rbp)
    movl        $3, -4(%rbp)
    movl        $0, -16(%rbp)
    movl        $-1, -8(%rbp)
    subl        $1, -8(%rbp)
    movl        $1, -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.and.fl.6
    movl        $-2, -24(%rbp)
    cmpl        $-2, -8(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lmain.and.fl.6
    movl        $1, -32(%rbp)
    jmp         .Lmain.and.en.7
.Lmain.and.fl.6:
    movl        $0, -32(%rbp)
.Lmain.and.en.7:
    movl        -32(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
