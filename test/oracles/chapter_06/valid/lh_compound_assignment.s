    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $10, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    subl        $1, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lcond.el.3
    movl        -4(%rbp), %eax
    cdq         
    movl        $2, %r10d
    idivl       %r10d
    movl        %eax, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    jmp         .Lcond.en.2
.Lcond.el.3:
    movl        $0, -8(%rbp)
.Lcond.en.2:
    cmpl        $4, -4(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
