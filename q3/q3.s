.global eval_postfix

# %rdi 1st argument (length of string), %rsi 2nd argument (pointer to string)

eval_postfix:
    # Initialize variables
    movq $0, %r8           # Counter for loop
    movq $0, %r9           # Stack pointer
    movq $0, %r10          # Temporary register for calculations
    movq $0, %r11          # Current number being constructed
    movq $0, %r12          # Flag to check if the current character is a number or an operator

eval_postfix_loop:
    cmpq $0, %r8           # Check if we have reached the end of the string
    je eval_postfix_end

    movzbq (%rsi), %rax    # Load current character into %rax
    cmpb $' ', %al         # Check if the current character is a space
    je eval_postfix_next   # If it is a space, skip to the next character

    cmpb $'+', %al         # Check if the current character is '+'
    je eval_postfix_op     # If it is an operator, perform operation

    cmpb $'-', %al         # Check if the current character is '-'
    je eval_postfix_op     # If it is an operator, perform operation

    cmpb $'*', %al         # Check if the current character is '*'
    je eval_postfix_op     # If it is an operator, perform operation

    cmpb $'/', %al         # Check if the current character is '/'
    je eval_postfix_op     # If it is an operator, perform operation

    subb $'0', %al         # Convert ASCII character to integer
    movq %rax, %r10        # Move the integer into temporary register

    movq $10, %rax         # Multiply the current number by 10 to shift it to the left
    imulq %r11, %rax
    addq %r10, %rax        # Add the new digit
    movq %rax, %r11        # Move the result back to %r11

    incq %rsi              # Move to the next character
    jmp eval_postfix_loop # Continue the loop

eval_postfix_op:
    # Perform operation
    popq %rbx              # Pop the top element from the stack into %rbx
    popq %rcx              # Pop the next element from the stack into %rcx

    cmpb $'+', %al         # Check if it's addition
    je eval_postfix_add    # If it is addition, perform addition

    cmpb $'-', %al         # Check if it's subtraction
    je eval_postfix_sub    # If it is subtraction, perform subtraction

    cmpb $'*', %al         # Check if it's multiplication
    je eval_postfix_mul    # If it is multiplication, perform multiplication

    cmpb $'/', %al         # Check if it's division
    je eval_postfix_div    # If it is division, perform division

eval_postfix_add:
    addq %rbx, %rcx        # Perform addition
    jmp eval_postfix_op_done

eval_postfix_sub:
    subq %rbx, %rcx        # Perform subtraction
    jmp eval_postfix_op_done

eval_postfix_mul:
    imulq %rbx, %rcx       # Perform multiplication
    jmp eval_postfix_op_done

eval_postfix_div:
    cqto                   # Sign-extend %rcx into %rdx
    idivq %rbx             # Perform division
    jmp eval_postfix_op_done

eval_postfix_op_done:
    pushq %rcx             # Push the result back onto the stack

eval_postfix_next:
    incq %rsi              # Move to the next character
    jmp eval_postfix_loop  # Continue the loop

eval_postfix_end:
    popq %rax              # Pop the final result from the stack into %rax
    ret                    

