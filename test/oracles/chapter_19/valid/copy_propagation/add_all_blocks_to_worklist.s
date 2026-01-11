    .globl      f
    .text       
f:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $100, global(%rip)
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, global(%rip)
    cmpl        $0, flag(%rip)
    je          .Lmain.if.en.0
    call        f@PLT
    movl        %eax, -4(%rbp)
.Lmain.if.en.0:
    movl        global(%rip), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      flag
    .data       
    .align      4
flag:
    .long       1
    .globl      global
    .bss        
    .align      4
global:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
