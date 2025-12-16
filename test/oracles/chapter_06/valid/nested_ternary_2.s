    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $1, %r11d
    cmpl        $0, %r11d
    je          .Lcond.el.2
    movl        $2, %r11d
    cmpl        $0, %r11d
    je          .Lcond.el.5
    movl        $3, -12(%rbp)
    jmp         .Lcond.en.4
.Lcond.el.5:
    movl        $4, -12(%rbp)
.Lcond.en.4:
    movl        -12(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    jmp         .Lcond.en.1
.Lcond.el.2:
    movl        $5, -8(%rbp)
.Lcond.en.1:
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Lcond.el.8
    movl        $2, %r11d
    cmpl        $0, %r11d
    je          .Lcond.el.11
    movl        $3, -24(%rbp)
    jmp         .Lcond.en.10
.Lcond.el.11:
    movl        $4, -24(%rbp)
.Lcond.en.10:
    movl        -24(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    jmp         .Lcond.en.7
.Lcond.el.8:
    movl        $5, -20(%rbp)
.Lcond.en.7:
    movl        -20(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        -28(%rbp), %r11d
    imull       -16(%rbp), %r11d
    movl        %r11d, -28(%rbp)
    movl        -28(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
