.data
.global X
X:
.quad 11
.quad 30
.quad 22
.quad 0
.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $8, %rsp
# for loop
	movq -8(%rbp), %r10
	movq $0, %r11
	movq %r11, -8(%rbp)
.L0:
	movq -8(%rbp), %r10
	lea X, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq (%rax), %rbx
	movq $0, %r10
	cmp %r10, %rbx
	jne .L2
	movq $0, %rbx
	jmp .L3
.L2:
	movq $1, %rbx
.L3:
	cmp $0, %rbx
	je .L1
	movq -8(%rbp), %r10
	lea X, %rbx
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
	movq $32, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_character
	popq %r11
	popq %r10
	movq -8(%rbp), %r10
	lea X, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq (%rax), %rbx
	movq $3, %r10
	movq %rbx, %rdx
	cqo
	idivq %r10
	movq %rdx, %r10
	pushq %r10
	pushq %r11
	movq %r10, %rdi
	call print_integer
	popq %r11
	popq %r10
	movq $110, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_character
	popq %r11
	popq %r10
	movq -8(%rbp), %rbx
	movq %rbx, %r10
	addq $1, %rbx
	movq %rbx, -8(%rbp)
	jmp .L0
.L1:
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
