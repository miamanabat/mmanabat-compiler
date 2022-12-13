.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $16, %rsp
# for loop
	movq -16(%rbp), %r10
	movq $0, %r11
	movq %r11, -16(%rbp)
.L0:
	movq -16(%rbp), %rbx
	movq $10, %r10
	cmp %r10, %rbx
	jl .L2
	movq $0, %rbx
	jmp .L3
.L2:
	movq $1, %rbx
.L3:
	cmp $0, %rbx
	je .L1
# for loop
	movq -8(%rbp), %r10
	movq $0, %r11
	movq %r11, -8(%rbp)
.L4:
	movq -8(%rbp), %rbx
	movq $10, %r10
	cmp %r10, %rbx
	jl .L6
	movq $0, %rbx
	jmp .L7
.L6:
	movq $1, %rbx
.L7:
	cmp $0, %rbx
	je .L5
	movq -8(%rbp), %rbx
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
	movq -8(%rbp), %rbx
	movq %rbx, %r10
	addq $1, %rbx
	movq %rbx, -8(%rbp)
	jmp .L4
.L5:
	.data
.L8:
	.string "\n"
.text
	movq $.L8, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -16(%rbp), %rbx
	movq %rbx, %r10
	addq $1, %rbx
	movq %rbx, -16(%rbp)
	jmp .L0
.L1:
.main_epilogue:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
