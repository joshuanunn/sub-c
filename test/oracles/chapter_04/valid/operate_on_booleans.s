    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $20, %rsp
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Land_false.1
    movl        $1, %r11d
    cmpl        $0, %r11d
    je          .Land_false.1
    movl        $1, -4(%rbp)
    jmp         .Land_end.2
.Land_false.1:
    movl        $0, -4(%rbp)
.Land_end.2:
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    notl        -8(%rbp)
    movl        $4, %r11d
    cmpl        $0, %r11d
    jne         .Lor_true.5
    movl        $3, %r11d
    cmpl        $0, %r11d
    jne         .Lor_true.5
    movl        $0, -12(%rbp)
    jmp         .Lor_end.6
.Lor_true.5:
    movl        $1, -12(%rbp)
.Lor_end.6:
    movl        -12(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    negl        -16(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -16(%rbp), %r10d
    subl        %r10d, -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
