.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $16, %rsp
	.data
.L0:
	.string "sssss"
.text
	movq $.L0, %rbx
	movq %rbx, -8(%rbp)
# function called!
	pushq %r10
	pushq %r11
	movq -8(%rbp), %rbx
	movq %rbx, %rdi
	call strdup
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	movq %rbx, -16(%rbp)
# if statement!
	pushq %r10
	pushq %r11
	movq -8(%rbp), %rbx
	movq %rbx, %rdi
	movq -16(%rbp), %rbx
	movq %rbx, %rsi
	call strcmp
	popq %r11
	popq %r10
	cmp $0, %rax
	je .L3
	movq $0, %rbx
	jmp .L4
.L3:
	movq $1, %rbx
.L4:
	cmp $0, %rbx
	je .L1
# return statement
	movq $22, %rbx
	movq %rbx, %rax
	jmp .main_epilogue
	jmp .L2
# else body
.L1:
# return statement
	movq $11, %rbx
	movq %rbx, %rax
	jmp .main_epilogue
# done if statement
.L2:
.main_epilogue:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
