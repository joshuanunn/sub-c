    .globl      f
    .text       
f:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -8(%rbp)
.Lloop.st.1:
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    subl        $1, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lf.if.en.1
    movl        $17, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lf.if.en.1:
    jmp         .Lloop.st.1
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $10, %edi
    call        f@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
