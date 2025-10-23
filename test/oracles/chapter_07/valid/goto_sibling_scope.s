    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $20, %rsp
    movl        $0, -4(%rbp)
    movl        $1, %r11d
    cmpl        $0, %r11d
    je          .Lif_end.0
    movl        $5, -8(%rbp)
    jmp         .Lother_if
    movl        $0, -4(%rbp)
.Lfirst_if:
    movl        $5, -8(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -8(%rbp), %r10d
    addl        %r10d, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lif_end.0:
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Lif_end.2
.Lother_if:
    movl        $6, -16(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -16(%rbp), %r10d
    addl        %r10d, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    jmp         .Lfirst_if
    movl        $0, -4(%rbp)
.Lif_end.2:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
