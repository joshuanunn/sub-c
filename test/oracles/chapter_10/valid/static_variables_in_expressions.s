    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $2, i.0(%rip)
    movl        $3, j.1(%rip)
    movl        j.1(%rip), %r10d
    cmpl        %r10d, i.0(%rip)
    movl        $0, -16(%rbp)
    setl        -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    cmpl        $0, -12(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lif.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lif.en.2:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .data       
    .align      4
i.0:
    .long       2
    .data       
    .align      4
j.1:
    .long       3
    .section    .note.GNU-stack,"",@progbits
