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

    movq $1, %r9        # i value r9 lo undhi
    movq (%r8, %rdx, 8), %rax
    jmp loop1

loop1:
    movq %rdx, %r10    
    jmp loop2

loop2:
    movq %r9, %r11
    movq %r10, %r12
    sub $1, %r12      
    addq %r11, %r12
    cmpq %r12, %rsi
    jl update
    subq $1,  %r11
    
    movq (%r8, %r12, 8), %r13   
    movq (%r8, %r11, 8), %r12   
    subq %r12, %r13
    cmpq %rax, %r13
    cmovg %r13, %rax
    addq $1,  %r10
    cmpq %r10, %rcx
    jge loop2

update:
    addq $1,  %r9
    cmpq %r9, %rsi
    jge loop1
    
    ret
