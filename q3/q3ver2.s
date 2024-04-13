.global eval_postfix

eval_postfix:
    movq $0, %r13
    movq $0, %rax
    movq $0, %rdx
    cqto
    jmp test

loop:
    movq (%rsi), %r14
    cmpq $42, %r14
    je mult
    cmpq $43, %r14
    je add
    cmpq $45, %r14
    je sub
    cmpq $47, %r14
    je div
    jmp int

int:
    push %r14
    jmp inc

mult:
    pop %r8
    pop %r10
    imulq %r8, %r10
    push %r10
    jmp inc

add:
    pop %r8
    pop %r10
    addq %r8, %r10
    push %r10
    jmp inc

sub:
    pop %r8
    pop %r10
    subq %r8, %r10
    push %r10
    jmp inc

div:
    pop %r8
    pop %rax
    movq $0, %rdx
    cqto
    idivq %r8
    push %rax
    jmp inc

inc:
    addq $1, %r13
    addq $8, %rsi
    jmp test

test:
    cmpq %rdi, %r13
    jl loop
    pop %rax
    ret
