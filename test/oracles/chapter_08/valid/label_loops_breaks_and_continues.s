    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $24, %rsp
    movl        $0, -4(%rbp)
    jmp         .Ldo_label
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Ldo_label:
.Lstart.dowhile.1:
    movl        $1, -4(%rbp)
    jmp         .Lwhile_label
.Lcontinue.dowhile.1:
    movl        $1, %r11d
    cmpl        $0, %r11d
    jne         .Lstart.dowhile.1
.Lbreak.dowhile.1:
.Lwhile_label:
.Lcontinue.while.2:
    movl        $1, %r11d
    cmpl        $0, %r11d
    je          .Lbreak.while.2
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    addl        $1, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    jmp         .Lbreak_label
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lbreak_label:
    jmp         .Lbreak.while.2
    jmp         .Lcontinue.while.2
.Lbreak.while.2:
    jmp         .Lfor_label
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lfor_label:
    movl        $0, -12(%rbp)
.Lstart.for.3:
    cmpl        $10, -12(%rbp)
    movl        $0, -16(%rbp)
    setl        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lbreak.for.3
    movl        -4(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    addl        $1, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    jmp         .Lcontinue_label
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lcontinue_label:
    jmp         .Lcontinue.for.3
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lcontinue.for.3:
    movl        -12(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    addl        $1, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    jmp         .Lstart.for.3
.Lbreak.for.3:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
