    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $112, %rsp
    movl        %edi, -108(%rbp)
    movl        $3, -4(%rbp)
    cmpl        $0, -108(%rbp)
    je          .Ltarget.if.en.0
    movl        $3, -8(%rbp)
    movl        $4, -4(%rbp)
.Ltarget.if.en.0:
    movl        $10, -12(%rbp)
    cmpl        $0, -108(%rbp)
    je          .Ltarget.if.en.2
    movl        $10, -16(%rbp)
    movl        $9, -12(%rbp)
.Ltarget.if.en.2:
    movl        $-12, -24(%rbp)
    movl        $-12, -20(%rbp)
    cmpl        $0, -108(%rbp)
    je          .Ltarget.if.en.5
    movl        $-11, -20(%rbp)
.Ltarget.if.en.5:
    movl        $-100, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    cmpl        $0, -108(%rbp)
    je          .Ltarget.if.en.7
    movl        -32(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    subl        $1, -28(%rbp)
.Ltarget.if.en.7:
    cmpl        $0, -108(%rbp)
    je          .Ltarget.if.el.9
    cmpl        $4, -4(%rbp)
    movl        $0, -36(%rbp)
    sete        -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Ltarget.and.fl.13
    cmpl        $9, -12(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Ltarget.and.fl.13
    movl        $1, -44(%rbp)
    jmp         .Ltarget.and.en.14
.Ltarget.and.fl.13:
    movl        $0, -44(%rbp)
.Ltarget.and.en.14:
    cmpl        $0, -44(%rbp)
    je          .Ltarget.and.fl.18
    movl        $-11, -48(%rbp)
    cmpl        $-11, -20(%rbp)
    movl        $0, -52(%rbp)
    sete        -52(%rbp)
    cmpl        $0, -52(%rbp)
    je          .Ltarget.and.fl.18
    movl        $1, -56(%rbp)
    jmp         .Ltarget.and.en.19
.Ltarget.and.fl.18:
    movl        $0, -56(%rbp)
.Ltarget.and.en.19:
    cmpl        $0, -56(%rbp)
    je          .Ltarget.and.fl.23
    movl        $-101, -60(%rbp)
    movl        -60(%rbp), %r10d
    cmpl        %r10d, -28(%rbp)
    movl        $0, -64(%rbp)
    sete        -64(%rbp)
    cmpl        $0, -64(%rbp)
    je          .Ltarget.and.fl.23
    movl        $1, -68(%rbp)
    jmp         .Ltarget.and.en.24
.Ltarget.and.fl.23:
    movl        $0, -68(%rbp)
.Ltarget.and.en.24:
    cmpl        $0, -68(%rbp)
    je          .Ltarget.if.en.25
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Ltarget.if.en.25:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Ltarget.if.el.9:
    cmpl        $3, -4(%rbp)
    movl        $0, -72(%rbp)
    sete        -72(%rbp)
    cmpl        $0, -72(%rbp)
    je          .Ltarget.and.fl.29
    cmpl        $10, -12(%rbp)
    movl        $0, -76(%rbp)
    sete        -76(%rbp)
    cmpl        $0, -76(%rbp)
    je          .Ltarget.and.fl.29
    movl        $1, -80(%rbp)
    jmp         .Ltarget.and.en.30
.Ltarget.and.fl.29:
    movl        $0, -80(%rbp)
.Ltarget.and.en.30:
    cmpl        $0, -80(%rbp)
    je          .Ltarget.and.fl.34
    movl        $-12, -84(%rbp)
    movl        -84(%rbp), %r10d
    cmpl        %r10d, -20(%rbp)
    movl        $0, -88(%rbp)
    sete        -88(%rbp)
    cmpl        $0, -88(%rbp)
    je          .Ltarget.and.fl.34
    movl        $1, -92(%rbp)
    jmp         .Ltarget.and.en.35
.Ltarget.and.fl.34:
    movl        $0, -92(%rbp)
.Ltarget.and.en.35:
    cmpl        $0, -92(%rbp)
    je          .Ltarget.and.fl.39
    movl        $-100, -96(%rbp)
    movl        -96(%rbp), %r10d
    cmpl        %r10d, -28(%rbp)
    movl        $0, -100(%rbp)
    sete        -100(%rbp)
    cmpl        $0, -100(%rbp)
    je          .Ltarget.and.fl.39
    movl        $1, -104(%rbp)
    jmp         .Ltarget.and.en.40
.Ltarget.and.fl.39:
    movl        $0, -104(%rbp)
.Ltarget.and.en.40:
    cmpl        $0, -104(%rbp)
    je          .Ltarget.if.en.41
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Ltarget.if.en.41:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, %edi
    call        target@PLT
    movl        %eax, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lmain.if.en.1
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.1:
    movl        $1, %edi
    call        target@PLT
    movl        %eax, -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.3
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.3:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
