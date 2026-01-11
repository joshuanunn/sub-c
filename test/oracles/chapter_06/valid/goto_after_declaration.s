    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $1, -4(%rbp)
    movl        $5, -8(%rbp)
    movl        $1, -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lmain.and.fl.3
    movl        $1, -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.and.fl.3
    movl        $1, -20(%rbp)
    jmp         .Lmain.and.en.4
.Lmain.and.fl.3:
    movl        $0, -20(%rbp)
.Lmain.and.en.4:
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
