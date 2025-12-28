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
    je          .Lif.en.1
    movl        i(%rip), %r10d
    movl        %r10d, -8(%rbp)
    addl        $1, i(%rip)
    addl        $1, i(%rip)
.Lif.en.1:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
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
    je          .Lif.en.2
    movl        j(%rip), %r10d
    movl        %r10d, -12(%rbp)
    subl        $1, j(%rip)
.Lif.en.2:
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
    subq        $32, %rsp
    movl        i(%rip), %r10d
    movl        %r10d, -8(%rbp)
    addl        $1, i(%rip)
    cmpl        $0, -8(%rbp)
    je          .Lcond.el.3
    movl        $0, -4(%rbp)
    jmp         .Lcond.en.2
.Lcond.el.3:
    call        incr_i@PLT
    movl        %eax, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lcond.en.2:
    cmpl        $3, i(%rip)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lif.en.6
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.6:
    subl        $1, j(%rip)
    cmpl        $0, j(%rip)
    je          .Lcond.el.9
    call        decr_j@PLT
    movl        %eax, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    jmp         .Lcond.en.8
.Lcond.el.9:
    movl        $0, -20(%rbp)
.Lcond.en.8:
    movl        $-2, -28(%rbp)
    movl        -28(%rbp), %r10d
    cmpl        %r10d, j(%rip)
    movl        $0, -32(%rbp)
    setne       -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lif.en.13
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.13:
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
    .globl      j
    .bss        
    .align      4
j:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
