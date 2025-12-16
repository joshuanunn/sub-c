    .globl      x
    .text       
x:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $80, %rsp
    movl        %edi, -48(%rbp)
    movl        %esi, -52(%rbp)
    movl        %edx, -56(%rbp)
    movl        %ecx, -60(%rbp)
    movl        %r8d, -64(%rbp)
    movl        %r9d, -68(%rbp)
    cmpl        $1, -48(%rbp)
    movl        $0, -4(%rbp)
    sete        -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Land.fl.3
    cmpl        $2, -52(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Land.fl.3
    movl        $1, -12(%rbp)
    jmp         .Land.en.4
.Land.fl.3:
    movl        $0, -12(%rbp)
.Land.en.4:
    cmpl        $0, -12(%rbp)
    je          .Land.fl.7
    cmpl        $3, -56(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Land.fl.7
    movl        $1, -20(%rbp)
    jmp         .Land.en.8
.Land.fl.7:
    movl        $0, -20(%rbp)
.Land.en.8:
    cmpl        $0, -20(%rbp)
    je          .Land.fl.11
    cmpl        $4, -60(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Land.fl.11
    movl        $1, -28(%rbp)
    jmp         .Land.en.12
.Land.fl.11:
    movl        $0, -28(%rbp)
.Land.en.12:
    cmpl        $0, -28(%rbp)
    je          .Land.fl.15
    cmpl        $5, -64(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Land.fl.15
    movl        $1, -36(%rbp)
    jmp         .Land.en.16
.Land.fl.15:
    movl        $0, -36(%rbp)
.Land.en.16:
    cmpl        $0, -36(%rbp)
    je          .Land.fl.19
    cmpl        $6, -68(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Land.fl.19
    movl        $1, -44(%rbp)
    jmp         .Land.en.20
.Land.fl.19:
    movl        $0, -44(%rbp)
.Land.en.20:
    movl        -44(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $4, -4(%rbp)
    movl        -4(%rbp), %eax
    cdq         
    movl        $2, %r10d
    idivl       %r10d
    movl        %eax, -8(%rbp)
    movl        $24, -12(%rbp)
    movl        -8(%rbp), %ecx
    sarl        %cl, -12(%rbp)
    movl        $1, %edi
    movl        $2, %esi
    movl        $3, %edx
    movl        $4, %ecx
    movl        $5, %r8d
    movl        -12(%rbp), %r9d
    call        x@PLT
    movl        %eax, -16(%rbp)
    movl        -16(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
