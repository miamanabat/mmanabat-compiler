.data
.global digits
digits:
.quad 14
.quad 8
.quad 6168
.quad 42
.quad 0
.quad 74546
.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $8, %rsp
	movq $4, %r10
	movq $468, %r11
	negq %r11
	leaq digits, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq %r11, (%rax)
	movq $0, %rbx
	movq %rbx, -8(%rbp)
# for loop
.L0:
# function called!
	pushq %r10
	pushq %r11
	movq -8(%rbp), %r10
	lea digits, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq (%rax), %rbx
	movq -8(%rbp), %r10
	movq %rbx, %rdi
	movq %r10, %rsi
	call abs
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	movq -8(%rbp), %r11
	lea digits, %r10
	movq $8, %rax
	imulq %r11
	addq %r10, %rax
	movq (%rax), %r10
	cmp %r10, %rbx
	je .L2
	movq $0, %rbx
	jmp .L3
.L2:
	movq $1, %rbx
.L3:
	cmp $0, %rbx
	je .L1
	movq -8(%rbp), %r10
	lea digits, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq (%rax), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	movq -8(%rbp), %r10
	movq -8(%rbp), %r11
	movq $1, %r12
	addq %r11, %r12
	movq %r12, -8(%rbp)
	movq $32, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_character
	popq %r11
	popq %r10
	jmp .L0
.L1:
	movq $110, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_character
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
