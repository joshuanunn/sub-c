    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $-1, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lmain.and.fl.2
    movl        $1, -8(%rbp)
    jmp         .Lmain.and.en.3
.Lmain.and.fl.2:
    movl        $0, -8(%rbp)
.Lmain.and.en.3:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
