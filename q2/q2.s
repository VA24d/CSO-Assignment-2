.global rec_combi

# issue with not integer value
# %rdi 1st argument, %rsi 2nd argument
# long long N, long long R
rec_combi:
    movq $0, %rax
    movq $0, %rdx
    cqto
    push %rdi
    push %rsi
    cmpq $0, %rsi
    jle base_case
    subq $1, %rdi
    subq $1, %rsi
    call rec_combi
    pop %rsi
    pop %rdi
    imulq %rdi, %rax
    idivq %rsi
    ret

base_case:
    movq %rdi, %rax
    ret

