.global rec_combi

rec_combi:
    movq $1, %rax
    cmpq $0, %rsi
    jle base_case
    push %rdi
    push %rsi
    subq $1, %rdi
    subq $1, %rsi
    call rec_combi
    pop %rsi
    pop %rdi
    imulq %rdi, %rax
    movq $0, %rdx
    cqto
    idivq %rsi
    ret

base_case:
    movq $1, %rax
    ret
