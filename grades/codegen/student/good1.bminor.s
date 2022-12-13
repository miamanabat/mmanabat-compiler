.data
.global str
str:
.quad .L0
.data
.global .L0
.L0:
.string "hello"
.data
.global str2
str2:
.quad .L1
.data
.global .L1
.L1:
.string " world"
.data
.global arr
arr:
.quad 1
.quad 2
.quad 3
.quad 4
.text
.global func
func:
	pushq %rbp
	movq %rsp, %rbp

	pushq %rdi
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
# return statement
	movq -8(%rbp), %rbx
	movq $2, %r10
	cmp %r10, %rbx
	je .L2
	movq $0, %rbx
	jmp .L3
.L2:
	movq $1, %rbx
.L3:
	movq %rbx, %rax
	jmp .func_epilogue
.func_epilogue:
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
# if statement!
	movq $3, %rbx
	movq $1, %r10
	cmp %r10, %rbx
	jge .L6
	movq $0, %rbx
	jmp .L7
.L6:
	movq $1, %rbx
.L7:
	cmp $0, %rbx
	je .L4
	.data
.L8:
	.string "3 is greater than 1\n"
.text
	movq $.L8, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L5
# else body
.L4:
# done if statement
.L5:
	movq $0, %r10
	lea arr, %rbx
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
	.data
.L9:
	.string " "
.text
	movq $.L9, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1, %r10
	lea arr, %rbx
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
	.data
.L10:
	.string " "
.text
	movq $.L10, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $2, %r10
	lea arr, %rbx
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
	.data
.L11:
	.string " "
.text
	movq $.L11, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $3, %r10
	lea arr, %rbx
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
	.data
.L12:
	.string "\n"
.text
	movq $.L12, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L13:
	.string "yes\n"
.text
	movq $.L13, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $0, %r10
	movq $234, %r11
	leaq arr, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq %r11, (%rax)
	movq $1, %r10
	movq $45, %r11
	leaq arr, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq %r11, (%rax)
	movq $2, %r10
	movq $11, %r11
	leaq arr, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq %r11, (%rax)
	movq $3, %r10
	movq $12, %r11
	leaq arr, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq %r11, (%rax)
	movq $0, %r10
	lea arr, %rbx
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
	.data
.L14:
	.string " "
.text
	movq $.L14, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1, %r10
	lea arr, %rbx
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
	.data
.L15:
	.string " "
.text
	movq $.L15, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $2, %r10
	lea arr, %rbx
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
	.data
.L16:
	.string " "
.text
	movq $.L16, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $3, %r10
	lea arr, %rbx
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
	.data
.L17:
	.string "\n"
.text
	movq $.L17, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1, %rbx
	movq $2, %r10
	addq %rbx, %r10
	pushq %r10
	pushq %r11
	movq %r10, %rdi
	call print_integer
	popq %r11
	popq %r10
	.data
.L18:
	.string "\n"
.text
	movq $.L18, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $0, %rbx
	movq %rbx, -8(%rbp)
	movq -8(%rbp), %r10
	movq -8(%rbp), %r11
	movq $1, %r12
	addq %r11, %r12
	movq %r12, -8(%rbp)
	movq -8(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	.data
.L19:
	.string " should be 1\n"
.text
	movq $.L19, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -8(%rbp), %r10
	movq -8(%rbp), %r11
	movq $1, %r12
	subq %r12, %r11
	movq %r11, -8(%rbp)
	movq -8(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	.data
.L20:
	.string " should be 0\n"
.text
	movq $.L20, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -8(%rbp), %r10
	movq $6, %r11
	movq %r11, -8(%rbp)
	movq -8(%rbp), %r10
	movq -8(%rbp), %r11
	movq -8(%rbp), %r12
	movq %r11, %rax
	imulq %r12
	movq %rax, %r12
	movq %r12, -8(%rbp)
	movq -8(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	.data
.L21:
	.string " should be 36\n"
.text
	movq $.L21, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -8(%rbp), %r10
	movq -8(%rbp), %r11
	movq -8(%rbp), %r12
	movq %r11, %rax
	cqo
idivq %r12
	movq %rax, %r12
	movq %r12, -8(%rbp)
	movq -8(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	.data
.L22:
	.string " should be 1\n"
.text
	movq $.L22, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -8(%rbp), %r10
	movq $2, %r11
	movq %r11, -8(%rbp)
	movq -8(%rbp), %rbx
	movq $2, %r10
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
	.data
.L23:
	.string " should be 0\n"
.text
	movq $.L23, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -8(%rbp), %rbx
	movq $2, %r10
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	movq %r10, %rsi
	call integer_power
	popq %r11
	popq %r10
	movq %rax, %r10
	pushq %r10
	pushq %r11
	movq %r10, %rdi
	call print_integer
	popq %r11
	popq %r10
	.data
.L24:
	.string " should be 4\n"
.text
	movq $.L24, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -8(%rbp), %rbx
	movq $2, %r10
	movq $3, %r11
	pushq %r10
	pushq %r11
	movq %r10, %rdi
	movq %r11, %rsi
	call integer_power
	popq %r11
	popq %r10
	movq %rax, %r11
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	movq %r11, %rsi
	call integer_power
	popq %r11
	popq %r10
	movq %rax, %r11
	pushq %r10
	pushq %r11
	movq %r11, %rdi
	call print_integer
	popq %r11
	popq %r10
	.data
.L25:
	.string " should be 256\n"
.text
	movq $.L25, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
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
