.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $40, %rsp
	movq $9, %rbx
	movq %rbx, -8(%rbp)
	movq -8(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
# if statement!
	movq $1, %rbx
	cmp $0, %rbx
	je .L0
	movq $4, %rbx
	movq %rbx, -16(%rbp)
	movq -16(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	.data
.L2:
	.string "\n"
.text
	movq $.L2, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L1
# else body
.L0:
# done if statement
.L1:
# if statement!
	movq $1, %rbx
	cmp $0, %rbx
	je .L3
	movq $3, %rbx
	movq %rbx, -24(%rbp)
	movq -8(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	.data
.L5:
	.string " "
.text
	movq $.L5, %rbx
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
	.data
.L6:
	.string "\n"
.text
	movq $.L6, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L4
# else body
.L3:
# done if statement
.L4:
	movq $1, %rbx
	movq %rbx, -32(%rbp)
	movq -32(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	movq $2, %rbx
	movq %rbx, -40(%rbp)
	movq -32(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	movq -40(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	movq -32(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
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
