    .globl      g
    .text       
g:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $128, %rsp
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
    .text       
f:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $128, %rsp
    movl        %edi, -108(%rbp)
    movl        %esi, -112(%rbp)
    movl        %edx, -116(%rbp)
    movl        %ecx, -120(%rbp)
    movl        -108(%rbp), %r10d
    movl        %r10d, -52(%rbp)
    movl        -52(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -52(%rbp)
    movl        -112(%rbp), %r10d
    movl        %r10d, -56(%rbp)
    movl        -56(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -56(%rbp)
    movl        -116(%rbp), %r10d
    movl        %r10d, -60(%rbp)
    movl        -60(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -60(%rbp)
    movl        -120(%rbp), %r10d
    movl        %r10d, -64(%rbp)
    movl        -64(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -64(%rbp)
    movl        -52(%rbp), %edi
    movl        -56(%rbp), %esi
    movl        -60(%rbp), %edx
    movl        -64(%rbp), %ecx
    call        g@PLT
    movl        %eax, -68(%rbp)
    movl        -68(%rbp), %r10d
    movl        %r10d, -48(%rbp)
    cmpl        $1, -48(%rbp)
    movl        $0, -72(%rbp)
    sete        -72(%rbp)
    cmpl        $0, -72(%rbp)
    je          .Land.fl.22
    cmpl        $1, -108(%rbp)
    movl        $0, -76(%rbp)
    sete        -76(%rbp)
    cmpl        $0, -76(%rbp)
    je          .Land.fl.22
    movl        $1, -80(%rbp)
    jmp         .Land.en.23
.Land.fl.22:
    movl        $0, -80(%rbp)
.Land.en.23:
    cmpl        $0, -80(%rbp)
    je          .Land.fl.26
    cmpl        $2, -112(%rbp)
    movl        $0, -84(%rbp)
    sete        -84(%rbp)
    cmpl        $0, -84(%rbp)
    je          .Land.fl.26
    movl        $1, -88(%rbp)
    jmp         .Land.en.27
.Land.fl.26:
    movl        $0, -88(%rbp)
.Land.en.27:
    cmpl        $0, -88(%rbp)
    je          .Land.fl.30
    cmpl        $3, -116(%rbp)
    movl        $0, -92(%rbp)
    sete        -92(%rbp)
    cmpl        $0, -92(%rbp)
    je          .Land.fl.30
    movl        $1, -96(%rbp)
    jmp         .Land.en.31
.Land.fl.30:
    movl        $0, -96(%rbp)
.Land.en.31:
    cmpl        $0, -96(%rbp)
    je          .Land.fl.34
    cmpl        $4, -120(%rbp)
    movl        $0, -100(%rbp)
    sete        -100(%rbp)
    cmpl        $0, -100(%rbp)
    je          .Land.fl.34
    movl        $1, -104(%rbp)
    jmp         .Land.en.35
.Land.fl.34:
    movl        $0, -104(%rbp)
.Land.en.35:
    movl        -104(%rbp), %eax
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
    subq        $128, %rsp
    movl        $1, %edi
    movl        $2, %esi
    movl        $3, %edx
    movl        $4, %ecx
    call        f@PLT
    movl        %eax, -124(%rbp)
    movl        -124(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
