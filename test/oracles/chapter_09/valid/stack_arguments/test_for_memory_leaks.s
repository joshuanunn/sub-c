    .globl      lots_of_args
    .text       
lots_of_args:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $96, %rsp
    movl        %edi, -8(%rbp)
    movl        %esi, -12(%rbp)
    movl        %edx, -16(%rbp)
    movl        %ecx, -20(%rbp)
    movl        %r8d, -24(%rbp)
    movl        %r9d, -28(%rbp)
    movl        16(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    movl        24(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    movl        32(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    movl        40(%rbp), %r10d
    movl        %r10d, -44(%rbp)
    movl        48(%rbp), %r10d
    movl        %r10d, -48(%rbp)
    movl        56(%rbp), %r10d
    movl        %r10d, -52(%rbp)
    movl        64(%rbp), %r10d
    movl        %r10d, -56(%rbp)
    movl        72(%rbp), %r10d
    movl        %r10d, -60(%rbp)
    movl        80(%rbp), %r10d
    movl        %r10d, -64(%rbp)
    movl        -52(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        -64(%rbp), %r10d
    addl        %r10d, -4(%rbp)
    movl        -4(%rbp), %eax
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
    subq        $96, %rsp
    movl        $0, -68(%rbp)
    movl        $0, -72(%rbp)
.Lloop.st.1:
    cmpl        $10000000, -72(%rbp)
    movl        $0, -76(%rbp)
    setl        -76(%rbp)
    cmpl        $0, -76(%rbp)
    je          .Lloop.br.1
    subq        $8, %rsp
    movl        $1, %edi
    movl        $2, %esi
    movl        $3, %edx
    movl        $4, %ecx
    movl        $5, %r8d
    movl        $6, %r9d
    pushq       $15
    pushq       $14
    pushq       $13
    movl        -68(%rbp), %eax
    pushq       %rax
    pushq       $11
    pushq       $10
    pushq       $9
    pushq       $8
    pushq       $7
    call        lots_of_args@PLT
    addq        $80, %rsp
    movl        %eax, -80(%rbp)
    movl        -80(%rbp), %r10d
    movl        %r10d, -68(%rbp)
.Lloop.ct.1:
    movl        -72(%rbp), %r10d
    movl        %r10d, -84(%rbp)
    addl        $1, -84(%rbp)
    movl        -84(%rbp), %r10d
    movl        %r10d, -72(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    cmpl        $150000000, -68(%rbp)
    movl        $0, -88(%rbp)
    sete        -88(%rbp)
    movl        -88(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
