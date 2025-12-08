    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    call        foo@PLT
    movl        %eax, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    cmpl        $0, -4(%rbp)
    movl        $0, -12(%rbp)
    setg        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lif.en.2
    movl        $3, -16(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -16(%rbp), %r10d
    addl        %r10d, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lif.en.2:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      foo
foo:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
