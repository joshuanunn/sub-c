    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $8, %rsp
    movl        $1, %r11d
    cmpl        $0, %r11d
    jne         .Lor_true.4
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Land_false.1
    movl        $2, %r11d
    cmpl        $0, %r11d
    je          .Land_false.1
    movl        $1, -4(%rbp)
    jmp         .Land_end.2
.Land_false.1:
    movl        $0, -4(%rbp)
.Land_end.2:
    cmpl        $0, -4(%rbp)
    jne         .Lor_true.4
    movl        $0, -8(%rbp)
    jmp         .Lor_end.5
.Lor_true.4:
    movl        $1, -8(%rbp)
.Lor_end.5:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
