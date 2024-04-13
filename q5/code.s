.globl	bin_s

bin_s:
.LFB0:

	pushq	%rbp

	movq	%rsp, %rbp

	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	jmp	.L2
.L10:
	movq	-48(%rbp), %rax
	subq	-40(%rbp), %rax
	cmpq	$1, %rax
	jg	.L3
	movq	-40(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	cmpq	%rax, -32(%rbp)
	je	.L4
	movq	-48(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	cmpq	%rax, -32(%rbp)
	jne	.L5
	movq	-48(%rbp), %rax
	jmp	.L1
.L5:
	movq	$-1, %rax
	jmp	.L1
.L4:
	movq	-40(%rbp), %rax
	jmp	.L1
.L3:
	movq	-40(%rbp), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$63, %rdx
	addq	%rdx, %rax
	sarq	%rax
	movq	%rax, -8(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	cmpq	%rax, -32(%rbp)
	jg	.L9
	movq	-8(%rbp), %rax
	movq	%rax, -48(%rbp)
	jmp	.L2
.L9:
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -40(%rbp)
.L2:
	movq	-40(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jl	.L10
.L1:
	popq	%rbp
	ret
	