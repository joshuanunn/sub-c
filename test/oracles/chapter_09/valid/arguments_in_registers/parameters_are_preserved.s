    .globl      g
g:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        %edi, -32(%rbp)
    movl        %esi, -36(%rbp)
    movl        %edx, -40(%rbp)
    movl        %ecx, -44(%rbp)
    cmpl        $2, -32(%rbp)
    movl        $0, -4(%rbp)
    sete        -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Land.fl.3
    cmpl        $4, -36(%rbp)
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
    cmpl        $6, -40(%rbp)
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
    cmpl        $8, -44(%rbp)
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
    je          .Lif.en.13
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.13:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      f
f:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $80, %rsp
    movl        %edi, -64(%rbp)
    movl        %esi, -68(%rbp)
    movl        %edx, -72(%rbp)
    movl        %ecx, -76(%rbp)
    movl        -64(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        -8(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -8(%rbp)
    movl        -68(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -12(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -12(%rbp)
    movl        -72(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -16(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -16(%rbp)
    movl        -76(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -20(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -20(%rbp)
    movl        -8(%rbp), %edi
    movl        -12(%rbp), %esi
    movl        -16(%rbp), %edx
    movl        -20(%rbp), %ecx
    call        g@PLT
    movl        %eax, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    cmpl        $1, -4(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Land.fl.8
    cmpl        $1, -64(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Land.fl.8
    movl        $1, -36(%rbp)
    jmp         .Land.en.9
.Land.fl.8:
    movl        $0, -36(%rbp)
.Land.en.9:
    cmpl        $0, -36(%rbp)
    je          .Land.fl.12
    cmpl        $2, -68(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Land.fl.12
    movl        $1, -44(%rbp)
    jmp         .Land.en.13
.Land.fl.12:
    movl        $0, -44(%rbp)
.Land.en.13:
    cmpl        $0, -44(%rbp)
    je          .Land.fl.16
    cmpl        $3, -72(%rbp)
    movl        $0, -48(%rbp)
    sete        -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Land.fl.16
    movl        $1, -52(%rbp)
    jmp         .Land.en.17
.Land.fl.16:
    movl        $0, -52(%rbp)
.Land.en.17:
    cmpl        $0, -52(%rbp)
    je          .Land.fl.20
    cmpl        $4, -76(%rbp)
    movl        $0, -56(%rbp)
    sete        -56(%rbp)
    cmpl        $0, -56(%rbp)
    je          .Land.fl.20
    movl        $1, -60(%rbp)
    jmp         .Land.en.21
.Land.fl.20:
    movl        $0, -60(%rbp)
.Land.en.21:
    movl        -60(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, %edi
    movl        $2, %esi
    movl        $3, %edx
    movl        $4, %ecx
    call        f@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
