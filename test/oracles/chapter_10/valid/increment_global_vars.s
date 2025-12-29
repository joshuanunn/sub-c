    .globl      incr_i
    .text       
incr_i:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $64, %rsp
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
    subq        $64, %rsp
    movl        $-1, -12(%rbp)
    movl        -12(%rbp), %r10d
    cmpl        %r10d, j(%rip)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lif.en.5
    movl        j(%rip), %r10d
    movl        %r10d, -20(%rbp)
    subl        $1, j(%rip)
.Lif.en.5:
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
    subq        $64, %rsp
    movl        i(%rip), %r10d
    movl        %r10d, -28(%rbp)
    addl        $1, i(%rip)
    cmpl        $0, -28(%rbp)
    je          .Lcond.el.10
    movl        $0, -24(%rbp)
    jmp         .Lcond.en.9
.Lcond.el.10:
    call        incr_i@PLT
    movl        %eax, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -24(%rbp)
.Lcond.en.9:
    cmpl        $3, i(%rip)
    movl        $0, -36(%rbp)
    setne       -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Lif.en.13
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.13:
    subl        $1, j(%rip)
    cmpl        $0, j(%rip)
    je          .Lcond.el.16
    call        decr_j@PLT
    movl        %eax, -44(%rbp)
    movl        -44(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    jmp         .Lcond.en.15
.Lcond.el.16:
    movl        $0, -40(%rbp)
.Lcond.en.15:
    movl        $-2, -48(%rbp)
    movl        -48(%rbp), %r10d
    cmpl        %r10d, j(%rip)
    movl        $0, -52(%rbp)
    setne       -52(%rbp)
    cmpl        $0, -52(%rbp)
    je          .Lif.en.20
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.20:
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
