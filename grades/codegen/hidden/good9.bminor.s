.data
.global a
a:
.quad 0
.quad 0
.quad 0
.quad 0
.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $0, %rsp
	movq $2, %r10
	movq $60, %r11
	leaq a, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq %r11, (%rax)
# return statement
	movq $2, %r10
	lea a, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq (%rax), %rbx
	movq $2, %r11
	lea a, %r10
	movq $8, %rax
	imulq %r11
	addq %r10, %rax
	movq (%rax), %r10
	movq $20, %r11
	movq %r10, %rax
	cqo
idivq %r11
	movq %rax, %r11
	movq $3, %r10
	movq %r11, %rax
	imulq %r10
	movq %rax, %r10
	addq %rbx, %r10
	movq $1, %r11
	lea a, %rbx
	movq $8, %rax
	imulq %r11
	addq %rbx, %rax
	movq (%rax), %rbx
	subq %rbx, %r10
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
