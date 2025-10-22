    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $20, %rsp
    movl        $1, -4(%rbp)
    jmp         .Lmain.post_declaration.2
    movl        $0, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
.Lmain.post_declaration.2:
    movl        $5, -8(%rbp)
    cmpl        $1, -4(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Land_false.3
    cmpl        $5, -8(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Land_false.3
    movl        $1, -20(%rbp)
    jmp         .Land_end.4
.Land_false.3:
    movl        $0, -20(%rbp)
.Land_end.4:
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
