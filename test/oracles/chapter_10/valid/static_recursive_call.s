    .globl      print_alphabet
    .text       
print_alphabet:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        count.1(%rip), %r10d
    movl        %r10d, -4(%rbp)
    addl        $65, -4(%rbp)
    movl        -4(%rbp), %edi
    call        putchar@PLT
    movl        %eax, -8(%rbp)
    movl        count.1(%rip), %r10d
    movl        %r10d, -12(%rbp)
    addl        $1, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, count.1(%rip)
    cmpl        $26, count.1(%rip)
    movl        $0, -16(%rbp)
    setl        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lprint_alphabet.if.en.4
    call        print_alphabet@PLT
    movl        %eax, -20(%rbp)
.Lprint_alphabet.if.en.4:
    movl        count.1(%rip), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    call        print_alphabet@PLT
    movl        %eax, -4(%rbp)
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .bss        
    .align      4
count.1:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
