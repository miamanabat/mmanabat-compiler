.data
.global b1
b1:
.quad 3
.data
.global b2
b2:
.quad 6
.data
.global b3
b3:
.quad 9
.text
.global B
B:
	pushq %rbp
	movq %rsp, %rbp

	pushq %rdi
	pushq %rsi
	subq $0, %rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
	movq b1, %rbx
	movq b2, %r10
	movq %rbx, %rax
	imulq %r10
	movq %rax, %r10
	movq -8(%rbp), %rbx
	movq -16(%rbp), %r11
	movq %rbx, %rdx
	cqo
	idivq %r11
	movq %rdx, %r11
	addq %r10, %r11
	pushq %r10
	pushq %r11
	movq %r11, %rdi
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
	movq -8(%rbp), %r10
	movq $37, %r11
	movq %r11, -8(%rbp)
# return statement
	movq -8(%rbp), %rbx
	movq %rbx, %rax
	jmp .B_epilogue
.B_epilogue:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $0, %rsp
# function called!
	pushq %r10
	pushq %r11
	movq $5, %rbx
	movq $3, %r10
	movq %rbx, %rdi
	movq %r10, %rsi
	call B
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
# return statement
	movq b3, %rbx
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
