.data
.global T
T:
.quad 2
.quad 1
.quad 1
.quad 2
.quad 1
.quad 2
.quad 0
.quad 3
.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $8, %rsp
	movq $0, %rbx
	movq %rbx, -8(%rbp)
# for loop
.L0:
# if statement!
	movq -8(%rbp), %r10
	lea T, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq (%rax), %rbx
	movq $0, %r10
	cmp %r10, %rbx
	je .L4
	movq $0, %rbx
	jmp .L5
.L4:
	movq $1, %rbx
.L5:
	cmp $0, %rbx
	je .L2
# return statement
	movq $5, %r10
	lea T, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq (%rax), %rbx
	movq $10, %r10
	addq %rbx, %r10
	movq %r10, %rax
	jmp .main_epilogue
	jmp .L3
# else body
.L2:
# if statement!
	movq -8(%rbp), %r10
	lea T, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq (%rax), %rbx
	movq $1, %r10
	cmp %r10, %rbx
	je .L8
	movq $0, %rbx
	jmp .L9
.L8:
	movq $1, %rbx
.L9:
	cmp $0, %rbx
	je .L6
	movq -8(%rbp), %rbx
	movq %rbx, %r10
	addq $1, %rbx
	movq %rbx, -8(%rbp)
	jmp .L7
# else body
.L6:
# if statement!
	movq -8(%rbp), %r10
	lea T, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq (%rax), %rbx
	movq $2, %r10
	cmp %r10, %rbx
	je .L12
	movq $0, %rbx
	jmp .L13
.L12:
	movq $1, %rbx
.L13:
	cmp $0, %rbx
	je .L10
	movq -8(%rbp), %r10
	movq %r10, %r11
	addq $1, %r10
	movq %r10, -8(%rbp)
	lea T, %rbx
	movq $8, %rax
	imulq %r11
	addq %rbx, %rax
	movq (%rax), %rbx
	movq %rbx, %r10
	movq -8(%rbp), %r12
	movq %r12, %r13
	addq $1, %r12
	movq %r12, -8(%rbp)
	leaq T, %r11
	movq $8, %rax
	imulq %r13
	addq %r11, %rax
	subq $1, %rbx
	movq %rbx, (%rax)
	jmp .L11
# else body
.L10:
# return statement
	movq $1, %rbx
	movq %rbx, %rax
	jmp .main_epilogue
# done if statement
.L11:
# done if statement
.L7:
# done if statement
.L3:
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
