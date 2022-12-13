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

	subq $24, %rsp
	movq $0, %rbx
	movq %rbx, -8(%rbp)
	movq $1, %rbx
	movq %rbx, -16(%rbp)
	movq -8(%rbp), %rbx
	movq %rbx, %r10
	addq $1, %rbx
	movq %rbx, -8(%rbp)
	movq %r10, -24(%rbp)
	.data
.L0:
	.string "a should be 0, x should be 1: "
.text
	movq $.L0, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -24(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	movq -8(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	.data
.L1:
	.string "\n"
.text
	movq $.L1, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -24(%rbp), %r10
	movq -16(%rbp), %r11
	movq %r11, %r12
	subq $1, %r11
	movq %r11, -16(%rbp)
	movq %r12, -24(%rbp)
	.data
.L2:
	.string "a should be 1, y should be 0: "
.text
	movq $.L2, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -24(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	movq -16(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	.data
.L3:
	.string "\n"
.text
	movq $.L3, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -24(%rbp), %r10
	movq -8(%rbp), %r11
	negq %r11
	movq %r11, -24(%rbp)
	.data
.L4:
	.string "a should be -1, x should be 1: "
.text
	movq $.L4, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -24(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	movq -8(%rbp), %rbx
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
	.data
.L6:
	.string "this should be 3, 4, 4, 3\n"
.text
	movq $.L6, %rbx
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
	movq %rbx, %r10
	movq $2, %r12
	leaq arr, %r11
	movq $8, %rax
	imulq %r12
	addq %r11, %rax
	addq $1, %rbx
	movq %rbx, (%rax)
	pushq %r10
	pushq %r11
	movq %r10, %rdi
	call print_integer
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
	movq $3, %r10
	lea arr, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq (%rax), %rbx
	movq %rbx, %r10
	movq $3, %r13
	leaq arr, %r12
	movq $8, %rax
	imulq %r13
	addq %r12, %rax
	subq $1, %rbx
	movq %rbx, (%rax)
	pushq %r10
	pushq %r11
	movq %r10, %rdi
	call print_integer
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
.L7:
	.string "\n"
.text
	movq $.L7, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.main_epilogue:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
