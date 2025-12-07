    .globl      foo
foo:
    pushq       %rbp
    movq        %rsp, %rbp
    jmp         .Lfoo.0
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lfoo.0:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    call        foo@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
