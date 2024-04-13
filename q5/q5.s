.global bin_s

# %rdi 1st argument, %rsi 2nd argument, %rdx 3rd argument, %rcx 4th argument
# long long N,long long* post, long long* itr, long long value
bin_s:
    movq $0, (%rdx)
    cqto

    movq $0, %r8
    movq %rdi, %r10
    subq $1, %r10
    jmp test

loop:
    movq %r8, %rax
    addq %r10, %rax
    divq $2
    ret
    addq $1, (%rdx)

test:
    cmpq %r8, %r10
    jg loop
    cmpq %rax, %rcx  # cur value
    je equal
    jmp nequal
    jmp 

equal:
    ret

nequal: 
    movq $-1, %rax
    ret
