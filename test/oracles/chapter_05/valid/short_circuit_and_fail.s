    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $8, %rsp
    movl        $0, -4(%rbp)
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Land_false.2
    movl        $5, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Land_false.2
    movl        $1, -8(%rbp)
    jmp         .Land_end.3
.Land_false.2:
    movl        $0, -8(%rbp)
.Land_end.3:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
