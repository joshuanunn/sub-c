    .globl      f
    .text       
f:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -12(%rbp)
    movl        %esi, -16(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lf.if.en.0
    movl        $65, -12(%rbp)
.Lf.if.en.0:
    movl        -12(%rbp), %edi
    call        putchar@PLT
    movl        %eax, -8(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $68, %edi
    movl        $0, %esi
    call        f@PLT
    movl        %eax, -4(%rbp)
    cmpl        $68, -4(%rbp)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.2:
    movl        $70, %edi
    movl        $1, %esi
    call        f@PLT
    movl        %eax, -12(%rbp)
    cmpl        $70, -12(%rbp)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.5
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.5:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
