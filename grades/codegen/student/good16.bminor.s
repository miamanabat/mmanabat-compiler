.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $16, %rsp
	movq $1, %rbx
	movq %rbx, -8(%rbp)
	movq $4, %rbx
	movq $3, %r10
	movq %rbx, %rax
	imulq %r10
	movq %rax, %r10
	movq $1, %rbx
	movq %r10, %rax
	cqo
idivq %rbx
	movq %rax, %rbx
	movq $5, %r10
	addq %rbx, %r10
	movq $3, %rbx
	movq -8(%rbp), %r11
	movq %r11, %r12
	addq $1, %r11
	movq %r11, -8(%rbp)
	movq $1, %r11
	addq %r12, %r11
	movq $2, %r12
	pushq %r10
	pushq %r11
	movq %r11, %rdi
	movq %r12, %rsi
	call integer_power
	popq %r11
	popq %r10
	movq %rax, %r12
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	movq %r12, %rsi
	call integer_power
	popq %r11
	popq %r10
	movq %rax, %r12
	subq %r12, %r10
	movq %r10, -16(%rbp)
	.data
.L0:
	.string "a should be 2, x should be -64:\n"
.text
	movq $.L0, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -8(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	.data
.L1:
	.string " "
.text
	movq $.L1, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -16(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	.data
.L2:
	.string "\n"
.text
	movq $.L2, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.main_epilogue:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
