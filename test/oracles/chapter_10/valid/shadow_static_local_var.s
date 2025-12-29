    .globl      update_static_or_global
    .text       
update_static_or_global:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $64, %rsp
    movl        %edi, -4(%rbp)
    movl        %esi, -8(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lif.el.1
    movl        -8(%rbp), %r10d
    movl        %r10d, i(%rip)
    jmp         .Lif.en.0
.Lif.el.1:
    movl        -8(%rbp), %r10d
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
    subq        $64, %rsp
    cmpl        $0, i(%rip)
    movl        $0, -12(%rbp)
    setne       -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lif.en.3
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.3:
    movl        $1, %edi
    movl        $10, %esi
    call        update_static_or_global@PLT
    movl        %eax, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    cmpl        $0, -16(%rbp)
    movl        $0, -24(%rbp)
    setne       -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lif.en.6
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.6:
    cmpl        $10, i(%rip)
    movl        $0, -28(%rbp)
    setne       -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lif.en.8
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.8:
    movl        $0, %edi
    movl        $9, %esi
    call        update_static_or_global@PLT
    movl        %eax, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    cmpl        $9, -16(%rbp)
    movl        $0, -36(%rbp)
    setne       -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Lif.en.11
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.11:
    cmpl        $10, i(%rip)
    movl        $0, -40(%rbp)
    setne       -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lif.en.13
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.13:
    movl        $1, %edi
    movl        $11, %esi
    call        update_static_or_global@PLT
    movl        %eax, -44(%rbp)
    movl        -44(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    cmpl        $9, -16(%rbp)
    movl        $0, -48(%rbp)
    setne       -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Lif.en.16
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.16:
    cmpl        $11, i(%rip)
    movl        $0, -52(%rbp)
    setne       -52(%rbp)
    cmpl        $0, -52(%rbp)
    je          .Lif.en.18
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.18:
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
