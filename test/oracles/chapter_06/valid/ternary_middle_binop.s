    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    jmp         .Lcond.en.1
.Lcond.el.2:
    movl        $4, -8(%rbp)
.Lcond.en.1:
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
