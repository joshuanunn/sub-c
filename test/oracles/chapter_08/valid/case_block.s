    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $4, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        $1, -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lswit.cs.1.2
    jmp         .Lswit.br.1
.Lswit.cs.1.2:
    movl        $8, -16(%rbp)
    movl        $8, -8(%rbp)
.Lswit.br.1:
    movl        $1, -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.and.fl.4
    cmpl        $8, -8(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.and.fl.4
    movl        $1, -28(%rbp)
    jmp         .Lmain.and.en.5
.Lmain.and.fl.4:
    movl        $0, -28(%rbp)
.Lmain.and.en.5:
    movl        -28(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
