    .globl      update_static_or_global
    .text       
update_static_or_global:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -8(%rbp)
    movl        %esi, -12(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lif.el.1
    movl        -12(%rbp), %r10d
    movl        %r10d, i(%rip)
    jmp         .Lif.en.0
.Lif.el.1:
    movl        -12(%rbp), %r10d
    movl        %r10d, i.2(%rip)
.Lif.en.0:
    movl        i.2(%rip), %eax
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
    cmpl        $0, i(%rip)
    movl        $0, -4(%rbp)
    setne       -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lif.en.1
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.1:
    movl        $1, %edi
    movl        $10, %esi
    call        update_static_or_global@PLT
    movl        %eax, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    cmpl        $0, -8(%rbp)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lif.en.4
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.4:
    cmpl        $10, i(%rip)
    movl        $0, -20(%rbp)
    setne       -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lif.en.6
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.6:
    movl        $0, %edi
    movl        $9, %esi
    call        update_static_or_global@PLT
    movl        %eax, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    cmpl        $9, -8(%rbp)
    movl        $0, -28(%rbp)
    setne       -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lif.en.9
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.9:
    cmpl        $10, i(%rip)
    movl        $0, -32(%rbp)
    setne       -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lif.en.11
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.11:
    movl        $1, %edi
    movl        $11, %esi
    call        update_static_or_global@PLT
    movl        %eax, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    cmpl        $9, -8(%rbp)
    movl        $0, -40(%rbp)
    setne       -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lif.en.14
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.14:
    cmpl        $11, i(%rip)
    movl        $0, -44(%rbp)
    setne       -44(%rbp)
    cmpl        $0, -44(%rbp)
    je          .Lif.en.16
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.16:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      i
    .bss        
    .align      4
i:
    .zero       4
    .bss        
    .align      4
i.2:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
