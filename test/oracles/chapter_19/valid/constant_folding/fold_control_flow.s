    .globl      target_if
    .text       
target_if:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_if_else_true
    .text       
target_if_else_true:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_if_else_false
    .text       
target_if_else_false:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_conditional_true
    .text       
target_conditional_true:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $2, -4(%rbp)
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_conditional_false
    .text       
target_conditional_false:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $5, -4(%rbp)
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_do_loop
    .text       
target_do_loop:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $10, -4(%rbp)
    movl        $10, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_while_loop_false
    .text       
target_while_loop_false:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_while_loop_true
    .text       
target_while_loop_true:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $10, -4(%rbp)
    movl        $10, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_for_loop_true
    .text       
target_for_loop_true:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $100, -8(%rbp)
    movl        $100, -4(%rbp)
    movl        $100, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_for_loop_false
    .text       
target_for_loop_false:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    movl        $100, -8(%rbp)
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $80, %rsp
    call        target_if@PLT
    movl        %eax, -4(%rbp)
    cmpl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.2:
    call        target_if_else_true@PLT
    movl        %eax, -12(%rbp)
    cmpl        $2, -12(%rbp)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.5
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.5:
    call        target_if_else_false@PLT
    movl        %eax, -20(%rbp)
    cmpl        $3, -20(%rbp)
    movl        $0, -24(%rbp)
    setne       -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.if.en.8
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.8:
    call        target_conditional_true@PLT
    movl        %eax, -28(%rbp)
    cmpl        $2, -28(%rbp)
    movl        $0, -32(%rbp)
    setne       -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lmain.if.en.11
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.11:
    call        target_conditional_false@PLT
    movl        %eax, -36(%rbp)
    cmpl        $5, -36(%rbp)
    movl        $0, -40(%rbp)
    setne       -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lmain.if.en.14
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.14:
    call        target_do_loop@PLT
    movl        %eax, -44(%rbp)
    cmpl        $10, -44(%rbp)
    movl        $0, -48(%rbp)
    setne       -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Lmain.if.en.17
    movl        $6, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.17:
    call        target_while_loop_false@PLT
    movl        %eax, -52(%rbp)
    cmpl        $0, -52(%rbp)
    movl        $0, -56(%rbp)
    setne       -56(%rbp)
    cmpl        $0, -56(%rbp)
    je          .Lmain.if.en.20
    movl        $7, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.20:
    call        target_while_loop_true@PLT
    movl        %eax, -60(%rbp)
    cmpl        $10, -60(%rbp)
    movl        $0, -64(%rbp)
    setne       -64(%rbp)
    cmpl        $0, -64(%rbp)
    je          .Lmain.if.en.23
    movl        $8, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.23:
    call        target_for_loop_true@PLT
    movl        %eax, -68(%rbp)
    cmpl        $100, -68(%rbp)
    movl        $0, -72(%rbp)
    setne       -72(%rbp)
    cmpl        $0, -72(%rbp)
    je          .Lmain.if.en.26
    movl        $9, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.26:
    call        target_for_loop_false@PLT
    movl        %eax, -76(%rbp)
    cmpl        $0, -76(%rbp)
    movl        $0, -80(%rbp)
    setne       -80(%rbp)
    cmpl        $0, -80(%rbp)
    je          .Lmain.if.en.29
    movl        $10, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.29:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
