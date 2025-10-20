    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $4, %rsp
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Lcond_e2.1
    jmp         .Lcond_end.0
.Lcond_e2.1:
    movl        $0, %r11d
    cmpl        $0, %r11d
    jne         .Lor_true.3
    movl        $2, %r11d
    cmpl        $0, %r11d
    jne         .Lor_true.3
    movl        $0, -4(%rbp)
    jmp         .Lor_end.4
.Lor_true.3:
    movl        $1, -4(%rbp)
.Lor_end.4:
.Lcond_end.0:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
