    .globl      callee
    .text       
callee:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        %edi, -32(%rbp)
    cmpl        $3, -32(%rbp)
    movl        $0, -4(%rbp)
    sete        -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lcallee.and.fl.3
    cmpl        $0, called_counter(%rip)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lcallee.and.fl.3
    movl        $1, -12(%rbp)
    jmp         .Lcallee.and.en.4
.Lcallee.and.fl.3:
    movl        $0, -12(%rbp)
.Lcallee.and.en.4:
    cmpl        $0, -12(%rbp)
    je          .Lcallee.if.en.5
    movl        $1, called_counter(%rip)
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lcallee.if.en.5:
    cmpl        $4, -32(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lcallee.and.fl.9
    cmpl        $1, called_counter(%rip)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lcallee.and.fl.9
    movl        $1, -24(%rbp)
    jmp         .Lcallee.and.en.10
.Lcallee.and.fl.9:
    movl        $0, -24(%rbp)
.Lcallee.and.en.10:
    cmpl        $0, -24(%rbp)
    je          .Lcallee.if.en.11
    movl        $2, called_counter(%rip)
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lcallee.if.en.11:
    movl        $-1, -28(%rbp)
    movl        $-1, called_counter(%rip)
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $3, -4(%rbp)
.Lloop.st.1:
    movl        -4(%rbp), %edi
    call        callee@PLT
    movl        %eax, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        $4, -4(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lloop.st.1
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    call        target@PLT
    movl        %eax, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    cmpl        $4, -8(%rbp)
    movl        $0, -12(%rbp)
    setne       -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lmain.if.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.2:
    cmpl        $2, called_counter(%rip)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.4
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.4:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .bss        
    .align      4
called_counter:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
