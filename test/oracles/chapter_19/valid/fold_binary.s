    .globl      target_add
    .text       
target_add:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $300, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_sub
    .text       
target_sub:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $-2147483645, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_mult
    .text       
target_mult:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1000000, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_div
    .text       
target_div:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $277, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_rem
    .text       
target_rem:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_eq_true
    .text       
target_eq_true:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_eq_false
    .text       
target_eq_false:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_neq_true
    .text       
target_neq_true:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_neq_false
    .text       
target_neq_false:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_gt_true
    .text       
target_gt_true:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_gt_false
    .text       
target_gt_false:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_ge_true
    .text       
target_ge_true:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_ge_false
    .text       
target_ge_false:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_lt_true
    .text       
target_lt_true:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_lt_false
    .text       
target_lt_false:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_le_true
    .text       
target_le_true:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_le_false
    .text       
target_le_false:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
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
    subq        $128, %rsp
    call        target_add@PLT
    movl        %eax, -4(%rbp)
    cmpl        $300, -4(%rbp)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.2:
    call        target_sub@PLT
    movl        %eax, -12(%rbp)
    movl        val_to_negate(%rip), %r10d
    movl        %r10d, -16(%rbp)
    negl        -16(%rbp)
    movl        -16(%rbp), %r10d
    cmpl        %r10d, -12(%rbp)
    movl        $0, -20(%rbp)
    setne       -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.if.en.6
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.6:
    call        target_mult@PLT
    movl        %eax, -24(%rbp)
    cmpl        $1000000, -24(%rbp)
    movl        $0, -28(%rbp)
    setne       -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lmain.if.en.9
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.9:
    call        target_div@PLT
    movl        %eax, -32(%rbp)
    cmpl        $277, -32(%rbp)
    movl        $0, -36(%rbp)
    setne       -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Lmain.if.en.12
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.12:
    call        target_rem@PLT
    movl        %eax, -40(%rbp)
    cmpl        $1, -40(%rbp)
    movl        $0, -44(%rbp)
    setne       -44(%rbp)
    cmpl        $0, -44(%rbp)
    je          .Lmain.if.en.15
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.15:
    call        target_eq_false@PLT
    movl        %eax, -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Lmain.if.en.17
    movl        $6, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.17:
    call        target_eq_true@PLT
    movl        %eax, -52(%rbp)
    cmpl        $0, -52(%rbp)
    movl        $0, -56(%rbp)
    sete        -56(%rbp)
    cmpl        $0, -56(%rbp)
    je          .Lmain.if.en.20
    movl        $7, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.20:
    call        target_neq_false@PLT
    movl        %eax, -60(%rbp)
    cmpl        $0, -60(%rbp)
    je          .Lmain.if.en.22
    movl        $8, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.22:
    call        target_neq_true@PLT
    movl        %eax, -64(%rbp)
    cmpl        $0, -64(%rbp)
    movl        $0, -68(%rbp)
    sete        -68(%rbp)
    cmpl        $0, -68(%rbp)
    je          .Lmain.if.en.25
    movl        $9, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.25:
    call        target_gt_false@PLT
    movl        %eax, -72(%rbp)
    cmpl        $0, -72(%rbp)
    je          .Lmain.if.en.27
    movl        $10, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.27:
    call        target_gt_true@PLT
    movl        %eax, -76(%rbp)
    cmpl        $0, -76(%rbp)
    movl        $0, -80(%rbp)
    sete        -80(%rbp)
    cmpl        $0, -80(%rbp)
    je          .Lmain.if.en.30
    movl        $11, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.30:
    call        target_ge_false@PLT
    movl        %eax, -84(%rbp)
    cmpl        $0, -84(%rbp)
    je          .Lmain.if.en.32
    movl        $12, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.32:
    call        target_ge_true@PLT
    movl        %eax, -88(%rbp)
    cmpl        $0, -88(%rbp)
    movl        $0, -92(%rbp)
    sete        -92(%rbp)
    cmpl        $0, -92(%rbp)
    je          .Lmain.if.en.35
    movl        $13, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.35:
    call        target_lt_false@PLT
    movl        %eax, -96(%rbp)
    cmpl        $0, -96(%rbp)
    je          .Lmain.if.en.37
    movl        $14, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.37:
    call        target_lt_true@PLT
    movl        %eax, -100(%rbp)
    cmpl        $0, -100(%rbp)
    movl        $0, -104(%rbp)
    sete        -104(%rbp)
    cmpl        $0, -104(%rbp)
    je          .Lmain.if.en.40
    movl        $15, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.40:
    call        target_le_false@PLT
    movl        %eax, -108(%rbp)
    cmpl        $0, -108(%rbp)
    je          .Lmain.if.en.42
    movl        $16, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.42:
    call        target_le_true@PLT
    movl        %eax, -112(%rbp)
    cmpl        $0, -112(%rbp)
    movl        $0, -116(%rbp)
    sete        -116(%rbp)
    cmpl        $0, -116(%rbp)
    je          .Lmain.if.en.45
    movl        $17, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.45:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      val_to_negate
    .data       
    .align      4
val_to_negate:
    .long       2147483645
    .section    .note.GNU-stack,"",@progbits
