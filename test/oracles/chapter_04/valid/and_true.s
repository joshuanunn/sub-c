    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $-1, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Land.fl.2
    movl        $1, -8(%rbp)
    jmp         .Land.en.3
.Land.fl.2:
    movl        $0, -8(%rbp)
.Land.en.3:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
