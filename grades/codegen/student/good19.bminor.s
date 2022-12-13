.data
.global fd
fd:
.quad 0
.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $24, %rsp
	.data
.L0:
	.string "buffer"
.text
	movq $.L0, %rbx
	movq %rbx, -8(%rbp)
# function called!
	pushq %r10
	pushq %r11
	.data
.L1:
	.string "test1.txt"
.text
	movq $.L1, %rbx
	.data
.L2:
	.string "r"
.text
	movq $.L2, %r10
	movq %rbx, %rdi
	movq %r10, %rsi
	call fopen
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	movq %rbx, -16(%rbp)
# function called!
	pushq %r10
	pushq %r11
	movq -8(%rbp), %rbx
	movq $4096, %r10
	movq -16(%rbp), %r11
	movq %rbx, %rdi
	movq %r10, %rsi
	movq %r11, %rdx
	call fgets
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	movq %rbx, -24(%rbp)
# for loop
.L3:
	movq -24(%rbp), %rbx
	movq $0, %r10
	cmp %r10, %rbx
	jne .L5
	movq $0, %rbx
	jmp .L6
.L5:
	movq $1, %rbx
.L6:
	cmp $0, %rbx
	je .L4
# if statement!
# function called!
	pushq %r10
	pushq %r11
	movq -8(%rbp), %rbx
	.data
.L9:
	.string "fd:integer;\n"
.text
	movq $.L9, %r10
	movq %rbx, %rdi
	movq %r10, %rsi
	call strcmp
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	movq $0, %r10
	cmp %r10, %rbx
	je .L10
	movq $0, %rbx
	jmp .L11
.L10:
	movq $1, %rbx
.L11:
	cmp $0, %rbx
	je .L7
	.data
.L12:
	.string "yes!\n"
.text
	movq $.L12, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L8
# else body
.L7:
# done if statement
.L8:
	movq -8(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -24(%rbp), %r10
# function called!
	pushq %r10
	pushq %r11
	movq -8(%rbp), %r11
	movq $4096, %r12
	movq -16(%rbp), %r13
	movq %r11, %rdi
	movq %r12, %rsi
	movq %r13, %rdx
	call fgets
	popq %r11
	popq %r10
	movq %rax, %r11
# function done!
	movq %r11, -24(%rbp)
	jmp .L3
.L4:
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
