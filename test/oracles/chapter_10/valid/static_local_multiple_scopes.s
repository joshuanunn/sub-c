    .globl      print_letters
    .text       
print_letters:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        i.1(%rip), %edi
    call        putchar@PLT
    movl        %eax, -4(%rbp)
    movl        i.1(%rip), %r10d
    movl        %r10d, -8(%rbp)
    addl        $1, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, i.1(%rip)
    movl        i.2(%rip), %edi
    call        putchar@PLT
    movl        %eax, -12(%rbp)
    movl        i.2(%rip), %r10d
    movl        %r10d, -16(%rbp)
    addl        $1, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, i.2(%rip)
    movl        $10, %edi
    call        putchar@PLT
    movl        %eax, -20(%rbp)
    movl        $0, %eax
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
    subq        $48, %rsp
    movl        $0, -24(%rbp)
.Lloop.st.1:
    cmpl        $26, -24(%rbp)
    movl        $0, -28(%rbp)
    setl        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lloop.br.1
    call        print_letters@PLT
    movl        %eax, -32(%rbp)
.Lloop.ct.1:
    movl        -24(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    addl        $1, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .data       
    .align      4
i.1:
    .long       65
    .data       
    .align      4
i.2:
    .long       97
    .section    .note.GNU-stack,"",@progbits
