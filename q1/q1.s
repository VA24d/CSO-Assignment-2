.global max_sub_sum

# %rdi 1st argument, %rsi 2nd argument, %rdx 3rd argument, %rcx 4th argument
# long long int *arr, int size, int minLen, int maxLen
max_sub_sum:
    movq %rdi, %r8 # array ptr
    movq $1, %r10 # initialize count

    movq $0, %r12 # initialize prefixsum

    jmp prefix_test

prefix_loop:
    addq (%r8), %r12
    movq %r12, (%r8)

    addq $8, %r8
    addq $1, %r10
    jmp prefix_test

prefix_test:
    cmpq %rsi, %r10 #loop condition 
    jle prefix_loop

    # resetting changed values
    movq %rdi, %r8 # array ptr


    # setting to min length
    movq %rdx, %r10 # count

    movq $-9223372036854775808, %rax # current max
    jmp minmax_test


# 2 pointer method
minmax_loop:
    movq $1, %r14 # count

    movq %rdi, %r12
    movq %rdi, %r13

    movq (%r13), %r15 # inside loop max

    addq $1, %r10
    jmp check_test

check_loop:
    movq (%r13), %r11
    subq (%r12), %r11
    
    cmpq %r15, %r11
    jg update
    jmp inc_inner

update:
    movq %r11, %r15
    jmp inc_inner

inc_inner:
    addq $8, %r12
    addq $8, %r13

    addq $1, %r14 # internal loop itr
    jmp check_test

check_test:
    cmpq %r9, %r14
    jl check_loop

    cmpq %rax, %r15
    jg update2

    jmp minmax_test

update2:
    movq %r15, %rax
    jmp minmax_test

    
minmax_test:
    movq %rsi, %r9
    subq %r10, %r9
    add $1, %r9

    cmpq %rcx, %r10
    jle minmax_loop
    
    # movq %r10, %rax

    ret

