    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $4, %r11d
    cmpl        $0, %r11d
    jne         .Lor.tr.1
    movl        $0, %r11d
    cmpl        $0, %r11d
    jne         .Lor.tr.1
    movl        $0, -4(%rbp)
    jmp         .Lor.en.2
.Lor.tr.1:
    movl        $1, -4(%rbp)
.Lor.en.2:
    movl        $0, %r11d
    cmpl        $0, %r11d
    jne         .Lor.tr.4
    movl        $3, %r11d
    cmpl        $0, %r11d
    jne         .Lor.tr.4
    movl        $0, -8(%rbp)
    jmp         .Lor.en.5
.Lor.tr.4:
    movl        $1, -8(%rbp)
.Lor.en.5:
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -8(%rbp), %r10d
    addl        %r10d, -12(%rbp)
    movl        $5, %r11d
    cmpl        $0, %r11d
    jne         .Lor.tr.8
    movl        $5, %r11d
    cmpl        $0, %r11d
    jne         .Lor.tr.8
    movl        $0, -16(%rbp)
    jmp         .Lor.en.9
.Lor.tr.8:
    movl        $1, -16(%rbp)
.Lor.en.9:
    movl        -12(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -16(%rbp), %r10d
    addl        %r10d, -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
