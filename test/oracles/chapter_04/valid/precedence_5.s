    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $1, -4(%rbp)
    movl        $3, -8(%rbp)
    movl        $1, -12(%rbp)
    movl        $3, %r11d
    cmpl        -12(%rbp), %r11d
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.and.fl.5
    movl        $1, -20(%rbp)
    jmp         .Lmain.and.en.6
.Lmain.and.fl.5:
    movl        $0, -20(%rbp)
.Lmain.and.en.6:
    movl        -20(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    addl        $1, -24(%rbp)
    movl        -24(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
