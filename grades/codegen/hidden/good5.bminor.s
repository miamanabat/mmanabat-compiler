.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $8, %rsp
# if statement!
# function called!
	pushq %r10
	pushq %r11
# function called!
	pushq %r10
	pushq %r11
	movq $100, %rbx
	movq %rbx, %rdi
	call B
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	movq $1, %r10
	subq %r10, %rbx
	movq $10, %r10
	movq %rbx, %rdi
	movq %r10, %rsi
	call A
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	cmp $0, %rbx
	je .L0
	movq $3, %rbx
	movq %rbx, -8(%rbp)
# return statement
	movq $2, %rbx
# function called!
	pushq %r10
	pushq %r11
	movq $33, %r10
	movq %r10, %rdi
	call B
	popq %r11
	popq %r10
	movq %rax, %r10
# function done!
	movq %rbx, %rax
	imulq %r10
	movq %rax, %r10
	movq -8(%rbp), %rbx
	addq %r10, %rbx
	movq %rbx, %rax
	jmp .main_epilogue
	jmp .L1
# else body
.L0:
# done if statement
.L1:
# return statement
# function called!
	pushq %r10
	pushq %r11
# function called!
	pushq %r10
	pushq %r11
	.data
.L2:
	.string "hello"
.text
	movq $.L2, %rbx
	movq %rbx, %rdi
	call C
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	.data
.L3:
	.string "hello"
.text
	movq $.L3, %r10
	movq %rbx, %rdi
	movq %r10, %rsi
	call B
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	movq $3, %r10
	movq %rbx, %rdx
	cqo
	idivq %r10
	movq %rdx, %r10
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
.text
.global A
A:
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
# return statement
	movq -8(%rbp), %rbx
	movq -16(%rbp), %r10
	cmp %r10, %rbx
	je .L4
	movq $0, %rbx
	jmp .L5
.L4:
	movq $1, %rbx
.L5:
	movq %rbx, %rax
	jmp .A_epilogue
.A_epilogue:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
.text
.global B
B:
	pushq %rbp
	movq %rsp, %rbp

	pushq %rdi
	subq $0, %rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
# if statement!
	movq -8(%rbp), %rbx
	movq $33, %r10
	cmp %r10, %rbx
	je .L8
	movq $0, %rbx
	jmp .L9
.L8:
	movq $1, %rbx
.L9:
	cmp $0, %rbx
	je .L6
# return statement
	movq $10, %rbx
	movq %rbx, %rax
	jmp .B_epilogue
	jmp .L7
# else body
.L6:
# return statement
	movq $11, %rbx
	movq %rbx, %rax
	jmp .B_epilogue
# done if statement
.L7:
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
.global C
C:
	pushq %rbp
	movq %rsp, %rbp

	pushq %rdi
	subq $0, %rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
# return statement
	movq $33, %rbx
	movq %rbx, %rax
	jmp .C_epilogue
.C_epilogue:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
