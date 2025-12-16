    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $10, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        $5, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lcond.el.2
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    jmp         .Lcond.en.1
.Lcond.el.2:
    movl        $2, -12(%rbp)
.Lcond.en.1:
    movl        -12(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    cmpl        $5, -4(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Land.fl.6
    cmpl        $5, -8(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Land.fl.6
    movl        $1, -24(%rbp)
    jmp         .Land.en.7
.Land.fl.6:
    movl        $0, -24(%rbp)
.Land.en.7:
    movl        -24(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
