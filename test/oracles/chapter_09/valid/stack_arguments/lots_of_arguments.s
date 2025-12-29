    .globl      foo
    .text       
foo:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $96, %rsp
    movl        %edi, -64(%rbp)
    movl        %esi, -68(%rbp)
    movl        %edx, -72(%rbp)
    movl        %ecx, -76(%rbp)
    movl        %r8d, -80(%rbp)
    movl        %r9d, -84(%rbp)
    movl        16(%rbp), %r10d
    movl        %r10d, -88(%rbp)
    movl        24(%rbp), %r10d
    movl        %r10d, -92(%rbp)
    cmpl        $1, -64(%rbp)
    movl        $0, -4(%rbp)
    sete        -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lfoo.and.fl.3
    cmpl        $2, -68(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lfoo.and.fl.3
    movl        $1, -12(%rbp)
    jmp         .Lfoo.and.en.4
.Lfoo.and.fl.3:
    movl        $0, -12(%rbp)
.Lfoo.and.en.4:
    cmpl        $0, -12(%rbp)
    je          .Lfoo.and.fl.7
    cmpl        $3, -72(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lfoo.and.fl.7
    movl        $1, -20(%rbp)
    jmp         .Lfoo.and.en.8
.Lfoo.and.fl.7:
    movl        $0, -20(%rbp)
.Lfoo.and.en.8:
    cmpl        $0, -20(%rbp)
    je          .Lfoo.and.fl.11
    cmpl        $4, -76(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lfoo.and.fl.11
    movl        $1, -28(%rbp)
    jmp         .Lfoo.and.en.12
.Lfoo.and.fl.11:
    movl        $0, -28(%rbp)
.Lfoo.and.en.12:
    cmpl        $0, -28(%rbp)
    je          .Lfoo.and.fl.15
    cmpl        $5, -80(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lfoo.and.fl.15
    movl        $1, -36(%rbp)
    jmp         .Lfoo.and.en.16
.Lfoo.and.fl.15:
    movl        $0, -36(%rbp)
.Lfoo.and.en.16:
    cmpl        $0, -36(%rbp)
    je          .Lfoo.and.fl.19
    cmpl        $6, -84(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lfoo.and.fl.19
    movl        $1, -44(%rbp)
    jmp         .Lfoo.and.en.20
.Lfoo.and.fl.19:
    movl        $0, -44(%rbp)
.Lfoo.and.en.20:
    cmpl        $0, -44(%rbp)
    je          .Lfoo.and.fl.23
    cmpl        $7, -88(%rbp)
    movl        $0, -48(%rbp)
    sete        -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Lfoo.and.fl.23
    movl        $1, -52(%rbp)
    jmp         .Lfoo.and.en.24
.Lfoo.and.fl.23:
    movl        $0, -52(%rbp)
.Lfoo.and.en.24:
    cmpl        $0, -52(%rbp)
    je          .Lfoo.and.fl.27
    cmpl        $8, -92(%rbp)
    movl        $0, -56(%rbp)
    sete        -56(%rbp)
    cmpl        $0, -56(%rbp)
    je          .Lfoo.and.fl.27
    movl        $1, -60(%rbp)
    jmp         .Lfoo.and.en.28
.Lfoo.and.fl.27:
    movl        $0, -60(%rbp)
.Lfoo.and.en.28:
    movl        -60(%rbp), %eax
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
    movl        $1, %edi
    movl        $2, %esi
    movl        $3, %edx
    movl        $4, %ecx
    movl        $5, %r8d
    movl        $6, %r9d
    pushq       $8
    pushq       $7
    call        foo@PLT
    addq        $16, %rsp
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
