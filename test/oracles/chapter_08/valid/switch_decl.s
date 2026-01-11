    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $3, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        $1, -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lswit.cs.1.3
    jmp         .Lswit.br.1
.Lswit.cs.1.3:
    movl        $4, -16(%rbp)
    movl        $4, -20(%rbp)
    movl        $4, -8(%rbp)
.Lswit.br.1:
    movl        $1, -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.and.fl.5
    cmpl        $4, -8(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lmain.and.fl.5
    movl        $1, -32(%rbp)
    jmp         .Lmain.and.en.6
.Lmain.and.fl.5:
    movl        $0, -32(%rbp)
.Lmain.and.en.6:
    movl        -32(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
