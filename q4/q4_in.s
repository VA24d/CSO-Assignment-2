.global baseball

# %rdi 1st argument, %rsi 2nd argument, %rdx 3rd argument, %rcx 4th argument, %r8 5th argument
# long long N, long long *post, long long *blank

# integer add (ie lower than or equal to 100)
# 
# 3rd 

# score => %rax
# iteration count => %r10

baseball:
    movq $0, %r10  
    movq $0, %rax

    push $0
    push $0

    movq $2, %r8  # 2 push above
    # movq $0, %r9
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
    addq $1, %r8
    movq (%rsi), %r14
    addq %r14, %rax
    push %r14

    jmp inc

C:
    subq $1, %r8
    
    pop %r14

    subq %r14, %rax

    # subq $8, %rdx
    
    jmp inc

D:
    addq $1, %r8

    pop %r14
    push %r14
    imulq $2, %r14
    addq %r14, %rax
    push %r14

    jmp inc

plus:
    addq $1, %r8 # reduction by 1

    pop %r14
    pop %r13
    push %r13
    push %r14

    addq %r13, %r14
    addq %r14, %rax
    
    push %r14

    jmp inc

inc:
    addq $1, %r10
    addq $8, %rsi
    jmp test

test:
    cmpq %rdi, %r10
    jl loop

    movq $0, %r9
    jmp clr_Stk_t



clr_Stk_l:
    addq $1, %r9
    pop %r14
    jmp clr_Stk_t

clr_Stk_t:
    cmpq %r8, %r9
    jl clr_Stk_l

    ret

