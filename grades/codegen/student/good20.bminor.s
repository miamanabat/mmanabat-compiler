.data
.global arr
arr:
.quad 45
.quad 23
.quad 1
.quad 3
.quad 6
.quad 7
.quad 985
.quad 23
.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $32, %rsp
	movq $0, %rbx
	movq %rbx, -8(%rbp)
# for loop
	movq -8(%rbp), %r10
	movq $0, %r11
	movq %r11, -8(%rbp)
.L0:
	movq -8(%rbp), %rbx
	movq $8, %r10
	cmp %r10, %rbx
	jl .L2
	movq $0, %rbx
	jmp .L3
.L2:
	movq $1, %rbx
.L3:
	cmp $0, %rbx
	je .L1
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
	.data
.L4:
	.string ", "
.text
	movq $.L4, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -8(%rbp), %rbx
	movq %rbx, %r10
	addq $1, %rbx
	movq %rbx, -8(%rbp)
	jmp .L0
.L1:
	.data
.L5:
	.string "\nsorted array: "
.text
	movq $.L5, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# for loop
	movq -8(%rbp), %r10
	movq $0, %r11
	movq %r11, -8(%rbp)
.L6:
	movq -8(%rbp), %rbx
	movq $7, %r10
	cmp %r10, %rbx
	jl .L8
	movq $0, %rbx
	jmp .L9
.L8:
	movq $1, %rbx
.L9:
	cmp $0, %rbx
	je .L7
	movq -8(%rbp), %rbx
	movq %rbx, -16(%rbp)
# for loop
	movq -24(%rbp), %r10
	movq -8(%rbp), %r11
	movq $1, %r12
	addq %r11, %r12
	movq %r12, -24(%rbp)
.L10:
	movq -24(%rbp), %rbx
	movq $8, %r10
	cmp %r10, %rbx
	jl .L12
	movq $0, %rbx
	jmp .L13
.L12:
	movq $1, %rbx
.L13:
	cmp $0, %rbx
	je .L11
# if statement!
	movq -24(%rbp), %r10
	lea arr, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq (%rax), %rbx
	movq -16(%rbp), %r11
	lea arr, %r10
	movq $8, %rax
	imulq %r11
	addq %r10, %rax
	movq (%rax), %r10
	cmp %r10, %rbx
	jl .L16
	movq $0, %rbx
	jmp .L17
.L16:
	movq $1, %rbx
.L17:
	cmp $0, %rbx
	je .L14
	movq -16(%rbp), %r10
	movq -24(%rbp), %r11
	movq %r11, -16(%rbp)
	jmp .L15
# else body
.L14:
# done if statement
.L15:
	movq -24(%rbp), %rbx
	movq %rbx, %r10
	addq $1, %rbx
	movq %rbx, -24(%rbp)
	jmp .L10
.L11:
# if statement!
	movq -16(%rbp), %rbx
	movq -8(%rbp), %r10
	cmp %r10, %rbx
	jne .L20
	movq $0, %rbx
	jmp .L21
.L20:
	movq $1, %rbx
.L21:
	cmp $0, %rbx
	je .L18
	movq -16(%rbp), %r10
	lea arr, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq (%rax), %rbx
	movq %rbx, -32(%rbp)
	movq -16(%rbp), %r10
	movq -8(%rbp), %r12
	lea arr, %r11
	movq $8, %rax
	imulq %r12
	addq %r11, %rax
	movq (%rax), %r11
	leaq arr, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq %r11, (%rax)
	movq -8(%rbp), %r10
	movq -32(%rbp), %r11
	leaq arr, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq %r11, (%rax)
	jmp .L19
# else body
.L18:
# done if statement
.L19:
	movq -8(%rbp), %rbx
	movq %rbx, %r10
	addq $1, %rbx
	movq %rbx, -8(%rbp)
	jmp .L6
.L7:
# for loop
	movq -8(%rbp), %r10
	movq $0, %r11
	movq %r11, -8(%rbp)
.L22:
	movq -8(%rbp), %rbx
	movq $8, %r10
	cmp %r10, %rbx
	jl .L24
	movq $0, %rbx
	jmp .L25
.L24:
	movq $1, %rbx
.L25:
	cmp $0, %rbx
	je .L23
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
	.data
.L26:
	.string ", "
.text
	movq $.L26, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -8(%rbp), %rbx
	movq %rbx, %r10
	addq $1, %rbx
	movq %rbx, -8(%rbp)
	jmp .L22
.L23:
.main_epilogue:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
