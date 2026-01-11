    .globl      target_negate
    .text       
target_negate:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $-3, -4(%rbp)
    movl        $-3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_negate_zero
    .text       
target_negate_zero:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_not
    .text       
target_not:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_not_zero
    .text       
target_not_zero:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, -4(%rbp)
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_complement
    .text       
target_complement:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $-2, -4(%rbp)
    movl        $-2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    call        target_negate@PLT
    movl        %eax, -4(%rbp)
    movl        three(%rip), %r10d
    movl        %r10d, -8(%rbp)
    negl        -8(%rbp)
    movl        -8(%rbp), %r10d
    cmpl        %r10d, -4(%rbp)
    movl        $0, -12(%rbp)
    setne       -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lmain.if.en.3
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.3:
    call        target_negate_zero@PLT
    movl        %eax, -16(%rbp)
    cmpl        $0, -16(%rbp)
    movl        $0, -20(%rbp)
    setne       -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.if.en.6
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.6:
    call        target_not@PLT
    movl        %eax, -24(%rbp)
    cmpl        $0, -24(%rbp)
    movl        $0, -28(%rbp)
    setne       -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lmain.if.en.9
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.9:
    call        target_not_zero@PLT
    movl        %eax, -32(%rbp)
    cmpl        $1, -32(%rbp)
    movl        $0, -36(%rbp)
    setne       -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Lmain.if.en.12
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.12:
    call        target_complement@PLT
    movl        %eax, -40(%rbp)
    movl        two(%rip), %r10d
    movl        %r10d, -44(%rbp)
    negl        -44(%rbp)
    movl        -44(%rbp), %r10d
    cmpl        %r10d, -40(%rbp)
    movl        $0, -48(%rbp)
    setne       -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Lmain.if.en.16
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.16:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      two
    .data       
    .align      4
two:
    .long       2
    .globl      three
    .data       
    .align      4
three:
    .long       3
    .section    .note.GNU-stack,"",@progbits
