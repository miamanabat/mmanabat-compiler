.text
.global collatz
collatz:
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
	movq -8(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
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
# if statement!
	movq -8(%rbp), %rbx
	movq $1, %r10
	cmp %r10, %rbx
	je .L2
	movq $0, %rbx
	jmp .L3
.L2:
	movq $1, %rbx
.L3:
	cmp $0, %rbx
	je .L0
# return statement
	movq -16(%rbp), %rbx
	movq %rbx, %rax
	jmp .collatz_epilogue
	jmp .L1
# else body
.L0:
# done if statement
.L1:
# if statement!
	movq -8(%rbp), %rbx
	movq $2, %r10
	movq %rbx, %rdx
	cqo
	idivq %r10
	movq %rdx, %r10
	movq $0, %rbx
	cmp %rbx, %r10
	je .L6
	movq $0, %rbx
	jmp .L7
.L6:
	movq $1, %rbx
.L7:
	cmp $0, %rbx
	je .L4
# return statement
# function called!
	pushq %r10
	pushq %r11
	movq -8(%rbp), %rbx
	movq $2, %r10
	movq %rbx, %rax
	cqo
idivq %r10
	movq %rax, %r10
	movq -16(%rbp), %rbx
	movq $1, %r11
	addq %rbx, %r11
	movq $1, %rbx
	movq %r10, %rdi
	movq %r11, %rsi
	movq %rbx, %rdx
	call collatz
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	movq %rbx, %rax
	jmp .collatz_epilogue
	jmp .L5
# else body
.L4:
# return statement
# function called!
	pushq %r10
	pushq %r11
	movq $3, %rbx
	movq -8(%rbp), %r10
	movq %rbx, %rax
	imulq %r10
	movq %rax, %r10
	movq $1, %rbx
	addq %r10, %rbx
	movq -16(%rbp), %r10
	movq $1, %r11
	addq %r10, %r11
	movq $1, %r10
	movq %rbx, %rdi
	movq %r11, %rsi
	movq %r10, %rdx
	call collatz
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	movq %rbx, %rax
	jmp .collatz_epilogue
# done if statement
.L5:
.collatz_epilogue:
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
	movq $27, %rbx
	movq $0, %r10
	movq %rbx, %rdi
	movq %r10, %rsi
	call collatz
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
