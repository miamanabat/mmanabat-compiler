.data
.global arr
arr:
.quad 0
.quad 0
.quad 0
.quad 0
.quad 0
.quad 0
.data
.global arr2
arr2:
.quad 1
.quad 2
.quad 3
.quad 4
.quad 5
.quad 6
.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $8, %rsp
	.data
.L0:
	.string "should be 000000, 123456:\n"
.text
	movq $.L0, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $0, %rbx
	movq %rbx, -8(%rbp)
# for loop
	movq -8(%rbp), %r10
	movq $0, %r11
	movq %r11, -8(%rbp)
.L1:
	movq -8(%rbp), %rbx
	movq $6, %r10
	cmp %r10, %rbx
	jl .L3
	movq $0, %rbx
	jmp .L4
.L3:
	movq $1, %rbx
.L4:
	cmp $0, %rbx
	je .L2
	movq -8(%rbp), %r10
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
	movq -8(%rbp), %rbx
	movq %rbx, %r10
	addq $1, %rbx
	movq %rbx, -8(%rbp)
	jmp .L1
.L2:
# for loop
	movq -8(%rbp), %r10
	movq $0, %r11
	movq %r11, -8(%rbp)
.L5:
	movq -8(%rbp), %rbx
	movq $6, %r10
	cmp %r10, %rbx
	jl .L7
	movq $0, %rbx
	jmp .L8
.L7:
	movq $1, %rbx
.L8:
	cmp $0, %rbx
	je .L6
	movq -8(%rbp), %r10
	lea arr2, %rbx
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
	movq -8(%rbp), %rbx
	movq %rbx, %r10
	addq $1, %rbx
	movq %rbx, -8(%rbp)
	jmp .L5
.L6:
.main_epilogue:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
