.data
.global a1
a1:
.quad 0
.data
.global a2
a2:
.quad 111
.data
.global a3
a3:
.quad 0
.text
.global A
A:
	pushq %rbp
	movq %rsp, %rbp

	subq $8, %rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
# if statement!
	movq a3, %rbx
	cmp $0, %rbx
	je .L0
# return statement
	movq a1, %rbx
	movq a2, %r10
	movq %rbx, %rax
	imulq %r10
	movq %rax, %r10
	movq %r10, %rax
	jmp .A_epilogue
	jmp .L1
# else body
.L0:
# done if statement
.L1:
	movq $3, %rbx
	movq %rbx, -8(%rbp)
# if statement!
	movq a3, %rbx
	cmp $0, %rbx
	je .L8
	movq $0, %rbx
	jmp .L9
.L8:
	movq $1, %rbx
.L9:
	cmp $0, %rbx
	je .L6
	movq $0, %rbx
	jmp .L7
.L6:
	movq $1, %rbx
.L7:
	cmp $0, %rbx
	je .L4
	movq $0, %rbx
	jmp .L5
.L4:
	movq $1, %rbx
.L5:
	cmp $0, %rbx
	je .L2
# return statement
	movq a1, %rbx
	movq -8(%rbp), %r10
	addq %rbx, %r10
	movq %r10, %rax
	jmp .A_epilogue
	jmp .L3
# else body
.L2:
# done if statement
.L3:
# return statement
	movq $0, %rbx
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
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $0, %rsp
# return statement
# function called!
	pushq %r10
	pushq %r11
	call A
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
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
