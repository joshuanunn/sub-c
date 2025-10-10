    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $12, %rsp
    movl        $0, %r11d
    cmpl        $0, %r11d
    jne         .Lor_true.2
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Land_false.0
    movl        $1, %eax
    cdq         
    movl        $0, %r10d
    idivl       %r10d
    movl        %eax, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Land_false.0
    movl        $1, -8(%rbp)
    jmp         .Land_end.1
.Land_false.0:
    movl        $0, -8(%rbp)
.Land_end.1:
    cmpl        $0, -8(%rbp)
    jne         .Lor_true.2
    movl        $0, -12(%rbp)
    jmp         .Lor_end.3
.Lor_true.2:
    movl        $1, -12(%rbp)
.Lor_end.3:
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
