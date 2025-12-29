    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, -4(%rbp)
    jmp         .Lmain.and.fl.1
    movl        $5, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lmain.and.fl.1
    movl        $1, -8(%rbp)
    jmp         .Lmain.and.en.2
.Lmain.and.fl.1:
    movl        $0, -8(%rbp)
.Lmain.and.en.2:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
