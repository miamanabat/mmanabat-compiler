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
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $0, %rsp
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
.L2:
	.string " "
.text
	movq $.L2, %rbx
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
.L3:
	.string " "
.text
	movq $.L3, %rbx
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
.L4:
	.string " "
.text
	movq $.L4, %rbx
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
.L5:
	.string "\n"
.text
	movq $.L5, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $0, %r10
	movq $23, %r11
	negq %r11
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
.L6:
	.string ": -23 "
.text
	movq $.L6, %rbx
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
.L7:
	.string ": 45  "
.text
	movq $.L7, %rbx
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
.L8:
	.string ": 11 "
.text
	movq $.L8, %rbx
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
.L9:
	.string ": 12 \n"
.text
	movq $.L9, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $0, %r10
	movq $1, %r12
	lea arr, %r11
	movq $8, %rax
	imulq %r12
	addq %r11, %rax
	movq (%rax), %r11
	movq $2, %r13
	lea arr, %r12
	movq $8, %rax
	imulq %r13
	addq %r12, %rax
	movq (%rax), %r12
	addq %r11, %r12
	leaq arr, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq %r12, (%rax)
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
.L10:
	.string " should be 56\n"
.text
	movq $.L10, %rbx
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
