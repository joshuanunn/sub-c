    .globl      foo
foo:
    pushq       %rbp
    movq        %rsp, %rbp
    jmp         .Llabel.0
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Llabel.0:
    movl        $5, %eax
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
    jmp         .Llabel.1
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Llabel.1:
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
