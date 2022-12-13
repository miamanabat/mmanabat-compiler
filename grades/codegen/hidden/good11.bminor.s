.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $40, %rsp
	movq $20, %rbx
	movq %rbx, -8(%rbp)
	movq -8(%rbp), %rbx
	movq %rbx, -16(%rbp)
	movq $10, %rbx
	movq %rbx, -24(%rbp)
	movq -16(%rbp), %r10
	movq -16(%rbp), %r11
	movq -24(%rbp), %r12
	addq %r11, %r12
	movq %r12, -16(%rbp)
	movq -16(%rbp), %r10
	movq -16(%rbp), %r11
	movq -8(%rbp), %r12
	addq %r11, %r12
	movq %r12, -16(%rbp)
	movq $2, %rbx
	movq %rbx, -32(%rbp)
	movq -16(%rbp), %r10
	movq -16(%rbp), %r11
	movq -32(%rbp), %r12
	addq %r11, %r12
	movq %r12, -16(%rbp)
	movq -16(%rbp), %r10
	movq -16(%rbp), %r11
	movq -8(%rbp), %r12
	addq %r11, %r12
	movq %r12, -16(%rbp)
	movq $3, %rbx
	movq %rbx, -40(%rbp)
	movq -16(%rbp), %r10
	movq -16(%rbp), %r11
	movq -40(%rbp), %r12
	addq %r11, %r12
	movq %r12, -16(%rbp)
# return statement
	movq -16(%rbp), %rbx
	movq -8(%rbp), %r10
	addq %rbx, %r10
	movq %r10, %rax
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
