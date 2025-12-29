    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    jmp         .Lmain.and.fl.1
    movl        $1, -4(%rbp)
    jmp         .Lmain.and.en.2
.Lmain.and.fl.1:
    movl        $0, -4(%rbp)
.Lmain.and.en.2:
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    notl        -8(%rbp)
    jmp         .Lmain.or.tr.5
    jmp         .Lmain.or.tr.5
    movl        $0, -12(%rbp)
    jmp         .Lmain.or.en.6
.Lmain.or.tr.5:
    movl        $1, -12(%rbp)
.Lmain.or.en.6:
    movl        -12(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    negl        -16(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -16(%rbp), %r10d
    subl        %r10d, -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
