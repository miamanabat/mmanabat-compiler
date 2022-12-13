.text
.global f
f:
	pushq %rbp
	movq %rsp, %rbp

	pushq %rdi
	subq $8, %rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
# for loop
	movq -16(%rbp), %r10
	movq $0, %r11
	movq %r11, -16(%rbp)
.L0:
	movq -8(%rbp), %rbx
	movq $0, %r10
	cmp %r10, %rbx
	jg .L2
	movq $0, %rbx
	jmp .L3
.L2:
	movq $1, %rbx
.L3:
	cmp $0, %rbx
	je .L1
	movq -16(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	movq -16(%rbp), %r10
	movq -16(%rbp), %r11
	movq $1, %r12
	addq %r11, %r12
	movq %r12, -16(%rbp)
	movq -8(%rbp), %rbx
	movq %rbx, %r10
	subq $1, %rbx
	movq %rbx, -8(%rbp)
	jmp .L0
.L1:
.f_epilogue:
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

	subq $8, %rsp
	movq $6, %rbx
	movq %rbx, -8(%rbp)
# for loop
.L4:
# function called!
	pushq %r10
	pushq %r11
	movq -8(%rbp), %rbx
	movq %rbx, %rdi
	call f
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	movq $110, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_character
	popq %r11
	popq %r10
# if statement!
	movq -8(%rbp), %rbx
	movq $0, %r10
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
	movq $0, %rbx
	movq %rbx, %rax
	jmp .main_epilogue
	jmp .L7
# else body
.L6:
# done if statement
.L7:
	movq -8(%rbp), %rbx
	movq %rbx, %r10
	subq $1, %rbx
	movq %rbx, -8(%rbp)
	jmp .L4
.L5:
# return statement
	movq $1, %rbx
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
