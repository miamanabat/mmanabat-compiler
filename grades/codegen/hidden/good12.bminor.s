.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $0, %rsp
# return statement
	movq $4, %rbx
	movq $9, %r10
	movq $2, %r11
	negq %r11
	movq $5, %r12
	negq %r12
	subq %r12, %r11
	movq %r10, %rax
	cqo
idivq %r11
	movq %rax, %r11
	addq %rbx, %r11
	movq $2, %rbx
	movq $1, %r10
	addq %rbx, %r10
	movq $4, %rbx
	movq %r10, %rax
	imulq %rbx
	movq %rax, %rbx
	movq $1, %r10
	subq %r10, %rbx
	movq $3, %r10
	movq %rbx, %rdx
	cqo
	idivq %r10
	movq %rdx, %r10
	movq $7, %rbx
	movq %r10, %rax
	imulq %rbx
	movq %rax, %rbx
	addq %r11, %rbx
	movq $2, %r10
	movq $3, %r11
	pushq %r10
	pushq %r11
	movq %r10, %rdi
	movq %r11, %rsi
	call integer_power
	popq %r11
	popq %r10
	movq %rax, %r11
	subq %r11, %rbx
	movq %rbx, %rax
	jmp .main_epilogue
.main_epilogue:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
