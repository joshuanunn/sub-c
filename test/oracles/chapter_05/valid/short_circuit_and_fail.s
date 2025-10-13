    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -16(%rbp)
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Land_false.2
    movl        $5, -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Land_false.2
    movl        $1, -12(%rbp)
    jmp         .Land_end.3
.Land_false.2:
    movl        $0, -12(%rbp)
.Land_end.3:
    movl        -16(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
