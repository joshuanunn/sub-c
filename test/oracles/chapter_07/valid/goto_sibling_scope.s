    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $0, -4(%rbp)
    movl        $5, -8(%rbp)
    jmp         .Lother_if.1
.Lfirst_if.0:
    movl        $6, -12(%rbp)
    movl        -8(%rbp), %r10d
    addl        %r10d, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    jmp         .Lmain.if.en.2
.Lother_if.1:
    movl        $6, -16(%rbp)
    movl        $6, -20(%rbp)
    movl        $6, -4(%rbp)
    jmp         .Lfirst_if.0
.Lmain.if.en.2:
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
