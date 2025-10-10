    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $8, %rsp
    movl        $1, %r11d
    cmpl        $0, %r11d
    jne         .Lor_true.0
    movl        $0, %r11d
    cmpl        $0, %r11d
    jne         .Lor_true.0
    movl        $0, -4(%rbp)
    jmp         .Lor_end.1
.Lor_true.0:
    movl        $1, -4(%rbp)
.Lor_end.1:
    cmpl        $0, -4(%rbp)
    je          .Land_false.2
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Land_false.2
    movl        $1, -8(%rbp)
    jmp         .Land_end.3
.Land_false.2:
    movl        $0, -8(%rbp)
.Land_end.3:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
