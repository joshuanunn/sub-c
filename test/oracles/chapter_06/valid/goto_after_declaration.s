    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $20, %rsp
    movl        $1, -4(%rbp)
    jmp         .Lpost_declaration
    movl        $0, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
.Lpost_declaration:
    movl        $5, -8(%rbp)
    cmpl        $1, -4(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Land.fl.3
    cmpl        $5, -8(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Land.fl.3
    movl        $1, -20(%rbp)
    jmp         .Land.en.4
.Land.fl.3:
    movl        $0, -20(%rbp)
.Land.en.4:
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
