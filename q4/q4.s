.global baseball

# %rdi 1st argument, %rsi 2nd argument, %rdx 3rd argument, %rcx 4th argument, %r8 5th argument
# long long N, long long *post

# integer add (ie lower than or equal to 100)
# 
# 3rd 

# score => %rax
# iteration count => %r10

baseball:
    movq $0, %r10  
    movq $0, %rax

    movq $0, (%rdx)
    addq $8, %rdx
    movq $0, (%rdx)
    addq $8, %rdx

    movq $0, %r8
    movq $0, %r9
    jmp test

loop:
    movq (%rsi), %r14
    cmpq $101, %r14
    je C
    cmpq $102, %r14
    je D
    cmpq $103, %r14
    je plus

    jmp score

score:
    movq (%rsi), %r14
    addq %r14, %rax
    movq %r14, (%rdx)
    addq $8, %rdx

    jmp inc

C:
    movq -8(%rdx), %r14
    subq %r14, %rax

    subq $8, %rdx
    
    jmp inc

D:
    movq -8(%rdx), %r14
    imulq $2, %r14
    addq %r14, %rax
    movq %r14, (%rdx)
    addq $8, %rdx

    jmp inc

plus:
    movq -8(%rdx), %r14
    movq -16(%rdx), %r13

    addq %r13, %r14
    movq %r14, (%rdx)

    addq (%rdx), %rax
    addq $8, %rdx

    jmp inc

inc:
    addq $1, %r10
    addq $8, %rsi
    jmp test

test:
    cmpq %rdi, %r10
    jl loop

    ret

