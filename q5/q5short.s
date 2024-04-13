.global bin_s

# %rdi 1st argument, %rsi 2nd argument, %rdx 3rd argument, %rcx 4th argument, %r8 5th argument
# long long int bin_s(long long* arr, long long value, long long l, long long r, long long *itr)

# l=> %r10, r=> %rcx
# %r8 => count
# %r14

bin_s:
    movq $0, (%r8)
    movq %rdx, %r10 # initally 0
    movq $0, %rdx
    cqto
    jmp test

loop:
    addq $1, (%r8) # update for iteration

    movq $0, %rdx
    cqto

    movq %rcx, %rax
    addq %r10, %rax
    movq $2, %r12
    idivq %r12
    movzwq (%rdi, %rax, 2), %r14
    # movq %r14, %rax
    # ret
    cmpq %rsi, %r14 # issue in compare
    jl low
    jmp greatE

greatE:
    movq %rax, %rcx

    jmp test 

low:
    addq $1,  %rax
    movq %rax, %r10
    
    jmp test 

test: 
    movq %rcx, %r13
    subq %r10, %r13
    cmpq $2, %r13
    jl return
    jmp loop

return:
    movzwq (%rdi, %r10, 2), %r14
    cmpq %rsi, %r14
    je sel_l
    movzwq (%rdi, %rcx, 2), %r14
    cmpq %rsi, %r14
    je sel_r
    
    # not found
    movq $-1, %rax
    ret

sel_l:
    movq %r10, %rax
    ret
sel_r:
    movq %rcx, %rax
    ret
