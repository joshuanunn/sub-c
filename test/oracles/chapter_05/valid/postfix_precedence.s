    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $1, -4(%rbp)
    movl        $1, -12(%rbp)
    movl        $2, -4(%rbp)
    movl        $0, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        $1, -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.and.fl.5
    cmpl        $0, -16(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.and.fl.5
    movl        $1, -28(%rbp)
    jmp         .Lmain.and.en.6
.Lmain.and.fl.5:
    movl        $0, -28(%rbp)
.Lmain.and.en.6:
    movl        -28(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
