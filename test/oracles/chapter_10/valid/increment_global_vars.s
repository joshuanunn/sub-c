    .globl      incr_i
    .text       
incr_i:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    cmpl        $1, i(%rip)
    movl        $0, -4(%rbp)
    sete        -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lincr_i.if.en.1
    movl        i(%rip), %r10d
    movl        %r10d, -8(%rbp)
    addl        $1, i(%rip)
    addl        $1, i(%rip)
.Lincr_i.if.en.1:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      decr_j
    .text       
decr_j:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $-1, -4(%rbp)
    movl        -4(%rbp), %r10d
    cmpl        %r10d, j(%rip)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Ldecr_j.if.en.2
    movl        j(%rip), %r10d
    movl        %r10d, -12(%rbp)
    subl        $1, j(%rip)
.Ldecr_j.if.en.2:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        i(%rip), %r10d
    movl        %r10d, -8(%rbp)
    addl        $1, i(%rip)
    cmpl        $0, -8(%rbp)
    je          .Lmain.cond.el.3
    movl        $0, -4(%rbp)
    jmp         .Lmain.cond.en.2
.Lmain.cond.el.3:
    call        incr_i@PLT
    movl        %eax, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lmain.cond.en.2:
    cmpl        $3, i(%rip)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.6
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.6:
    subl        $1, j(%rip)
    cmpl        $0, j(%rip)
    je          .Lmain.cond.el.9
    call        decr_j@PLT
    movl        %eax, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    jmp         .Lmain.cond.en.8
.Lmain.cond.el.9:
    movl        $0, -20(%rbp)
.Lmain.cond.en.8:
    movl        $-2, -28(%rbp)
    movl        -28(%rbp), %r10d
    cmpl        %r10d, j(%rip)
    movl        $0, -32(%rbp)
    setne       -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lmain.if.en.13
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.13:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      i
    .bss        
    .align      4
i:
    .zero       4
    .globl      j
    .bss        
    .align      4
j:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
