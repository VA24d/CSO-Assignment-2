.global max_sub_sum

# %rdi 1st argument, %rsi 2nd argument, %rdx 3rd argument, %rcx 4th argument
# long long int *arr, int size, int minLen, int maxLen
max_sub_sum:
    movq %rdi, %r8 # array ptr
    movq %rsi, %r9 # size
    movq $1, %r10

    //loop from index 1 to N-1 (considering 0 indexing)
    addq $8, %r8
    jmp prefix_test

prefix_loop:
    addq $1, %r10
    movq -8(%r8), %r11
    movq (%r8), %r12
    addq %r11, %r12
    movq %r12, (%r8)
    addq $8, %r8
    jmp prefix_test

prefix_test:
    cmpq %r9, %r10 #loop condition 
    jle prefix_loop
    # resetting changed values
    movq %rdi, %r8 # array ptr
    movq %rsi, %r9 # size
    movq $1, %r10
    # max sum in %rax
    # current sum in %r14
    movq %rdi+%left, %r15
    ret

# 2 pointer method
check_loop:





.ptr_L:

.ptr_R:
    

    



check_test:
