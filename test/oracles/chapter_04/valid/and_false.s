    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $10, %r11d
    cmpl        $0, %r11d
    je          .Land.fl.1
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Land.fl.1
    movl        $1, -4(%rbp)
    jmp         .Land.en.2
.Land.fl.1:
    movl        $0, -4(%rbp)
.Land.en.2:
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Land.fl.4
    movl        $4, %r11d
    cmpl        $0, %r11d
    je          .Land.fl.4
    movl        $1, -8(%rbp)
    jmp         .Land.en.5
.Land.fl.4:
    movl        $0, -8(%rbp)
.Land.en.5:
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -8(%rbp), %r10d
    addl        %r10d, -12(%rbp)
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Land.fl.8
    movl        $0, %r11d
    cmpl        $0, %r11d
    je          .Land.fl.8
    movl        $1, -16(%rbp)
    jmp         .Land.en.9
.Land.fl.8:
    movl        $0, -16(%rbp)
.Land.en.9:
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
