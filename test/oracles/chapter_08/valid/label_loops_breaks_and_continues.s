    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $0, -4(%rbp)
    jmp         .Ldo_label.0
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Ldo_label.0:
.Lloop.st.1:
    movl        $1, -4(%rbp)
    jmp         .Lwhile_label.1
.Lloop.ct.1:
    movl        $1, %r11d
    cmpl        $0, %r11d
    jne         .Lloop.st.1
.Lloop.br.1:
.Lwhile_label.1:
.Lloop.ct.2:
    movl        $1, %r11d
    cmpl        $0, %r11d
    je          .Lloop.br.2
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    addl        $1, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    jmp         .Lbreak_label.2
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lbreak_label.2:
    jmp         .Lloop.br.2
    jmp         .Lloop.ct.2
.Lloop.br.2:
    jmp         .Lfor_label.3
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lfor_label.3:
    movl        $0, -12(%rbp)
.Lloop.st.3:
    cmpl        $10, -12(%rbp)
    movl        $0, -16(%rbp)
    setl        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lloop.br.3
    movl        -4(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    addl        $1, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    jmp         .Lcontinue_label.4
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lcontinue_label.4:
    jmp         .Lloop.ct.3
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lloop.ct.3:
    movl        -12(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    addl        $1, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    jmp         .Lloop.st.3
.Lloop.br.3:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
