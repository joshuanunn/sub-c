    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, %r11d
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
    cmpl        $0, -4(%rbp)
    je          .Land.fl.4
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Land.fl.4
    movl        $1, -8(%rbp)
    jmp         .Land.en.5
.Land.fl.4:
    movl        $0, -8(%rbp)
.Land.en.5:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
