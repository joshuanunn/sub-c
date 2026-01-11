    .globl      callee
    .text       
callee:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, globvar(%rip)
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        %edi, -24(%rbp)
    movl        $10, -4(%rbp)
    cmpl        $1, -24(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lswit.cs.1.1
    cmpl        $2, -24(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lswit.cs.1.2
    jmp         .Lswit.df.1
.Lswit.cs.1.1:
    movl        $20, -4(%rbp)
    jmp         .Lswit.br.1
.Lswit.cs.1.2:
    movl        $10, %edi
    call        callee@PLT
    movl        %eax, -16(%rbp)
    jmp         .Lswit.br.1
.Lswit.df.1:
    movl        $-1, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, globvar(%rip)
.Lswit.br.1:
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
    movl        $2, %edi
    call        target@PLT
    movl        %eax, -4(%rbp)
    cmpl        $10, globvar(%rip)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.2
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.2:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      globvar
    .bss        
    .align      4
globvar:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
