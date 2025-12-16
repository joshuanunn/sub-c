    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    call        update_x@PLT
    movl        %eax, -4(%rbp)
    cmpl        $0, x(%rip)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lswit.cs.1.0
    cmpl        $1, x(%rip)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    jne         .Lswit.cs.1.1
    cmpl        $4, x(%rip)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    jne         .Lswit.cs.1.4
    jmp         .Lswit.df.1
.Lswit.cs.1.0:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.1.1:
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.cs.1.4:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.df.1:
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.br.1:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      update_x
    .text       
update_x:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $4, x(%rip)
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      x
    .bss        
    .align      4
x:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
