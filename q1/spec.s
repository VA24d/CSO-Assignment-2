.global max_sub_sum


# %rdi 1st argument, %rsi 2nd argument, %rdx 3rd argument, %rcx 4th argument
# long long int *arr, int size, int minLen, int maxLen
max_sub_sum:
        movq $0, (%r8)
        movq $0, %rbx

        jmp prefix_loop
        
prefix_loop:
        movq (%rdi, %rbx, 8), %r10
        movq (%r8, %rbx, 8), %r15
        addq %r10, %r15
        addq $1, %rbx
        movq %r15, (%r8, %rbx, 8)

        jmp prefix_test

prefix_test:
        cmpq %rsi, %rbx
        jle prefix_loop

        # reset value
        movq $1, %rbx
        movq (%r8, %rdx, 8), %rax
        # inc %rcx
        jmp outer

outer:
        movq %rdx, %r10    

inner_loop:
        movq %rbx, %r15
        movq %r10, %r12

        subq $1, %r12       
        addq %r15, %r12

update_test:
        cmpq %r12, %rsi
        jl update_max
        subq $1,  %r15

        jmp condition_test

condition_test:
        movq %r12, %r9
        imulq $8, %r9
        addq %r8, %r9
        movq (%r9), %r13 

        movq %r15, %r9
        imulq $8, %r9
        addq %r8, %r9
        movq (%r9), %r12   

        subq %r12, %r13

        cmpq %rax, %r13
        cmovg %r13, %rax

        jmp inner_test

inner_test:
        addq $1, %r10
        cmpq %r10, %rcx
        jge inner_loop

update_max:
        addq $1,  %rbx
        cmpq %rbx, %rsi
        jge outer
        
        ret
        