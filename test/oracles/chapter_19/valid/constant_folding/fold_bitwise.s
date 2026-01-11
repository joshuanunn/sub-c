    .globl      target_and
    .text       
target_and:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $983055, -4(%rbp)
    movl        $983055, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_or
    .text       
target_or:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $268374015, -4(%rbp)
    movl        $268374015, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_xor
    .text       
target_xor:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $267390960, -4(%rbp)
    movl        $267390960, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_shift_left
    .text       
target_shift_left:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $76283904, -4(%rbp)
    movl        $76283904, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target_shift_right
    .text       
target_shift_right:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $493447, -4(%rbp)
    movl        $493447, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    call        target_and@PLT
    movl        %eax, -4(%rbp)
    cmpl        $983055, -4(%rbp)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.2:
    call        target_or@PLT
    movl        %eax, -12(%rbp)
    cmpl        $268374015, -12(%rbp)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.5
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.5:
    call        target_xor@PLT
    movl        %eax, -20(%rbp)
    cmpl        $267390960, -20(%rbp)
    movl        $0, -24(%rbp)
    setne       -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.if.en.8
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.8:
    call        target_shift_left@PLT
    movl        %eax, -28(%rbp)
    cmpl        $76283904, -28(%rbp)
    movl        $0, -32(%rbp)
    setne       -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lmain.if.en.11
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.11:
    call        target_shift_right@PLT
    movl        %eax, -36(%rbp)
    cmpl        $493447, -36(%rbp)
    movl        $0, -40(%rbp)
    setne       -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lmain.if.en.14
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.14:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
