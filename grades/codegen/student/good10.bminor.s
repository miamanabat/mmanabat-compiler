.data
.global x
x:
.quad 10
.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $16, %rsp
	movq $3, %rbx
	negq %rbx
	movq $2, %r10
	movq $6, %r11
	movq %r10, %rax
	imulq %r11
	movq %rax, %r11
	addq %rbx, %r11
	movq %r11, -8(%rbp)
	movq -8(%rbp), %rbx
	movq x, %r10
	cmp %r10, %rbx
	jg .L2
	movq $0, %rbx
	jmp .L3
.L2:
	movq $1, %rbx
.L3:
	cmp $0, %rbx
	je .L0
	movq x, %rbx
	jmp .L1
.L0:
	movq -8(%rbp), %rbx
.L1:
	movq %rbx, -16(%rbp)
	movq -16(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	.data
.L4:
	.string " should be 9\n"
.text
	movq $.L4, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# return statement
	movq $0, %rbx
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
