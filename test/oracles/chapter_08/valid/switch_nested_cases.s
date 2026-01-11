    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $64, %rsp
    movl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        $0, -12(%rbp)
    movl        $0, -16(%rbp)
    movl        $0, -20(%rbp)
    movl        $1, -24(%rbp)
    movl        $1, -4(%rbp)
    movl        $0, -28(%rbp)
    cmpl        $0, -28(%rbp)
    jne         .Lswit.cs.2.0
    movl        $1, -32(%rbp)
    jmp         .Lswit.cs.2.4
.Lswit.cs.2.0:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.2.4:
    movl        $1, -8(%rbp)
    movl        $1, -36(%rbp)
    movl        $1, -12(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.and.fl.12
    movl        $1, -52(%rbp)
    jmp         .Lmain.and.en.13
.Lmain.and.fl.12:
    movl        $0, -52(%rbp)
.Lmain.and.en.13:
    cmpl        $0, -52(%rbp)
    je          .Lmain.and.fl.15
    cmpl        $0, -12(%rbp)
    je          .Lmain.and.fl.15
    movl        $1, -56(%rbp)
    jmp         .Lmain.and.en.16
.Lmain.and.fl.15:
    movl        $0, -56(%rbp)
.Lmain.and.en.16:
    movl        -56(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
