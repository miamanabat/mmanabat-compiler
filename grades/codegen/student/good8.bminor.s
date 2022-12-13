.data
.global x
x:
.quad 5
.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $8, %rsp
	movq $0, %rbx
	movq %rbx, -8(%rbp)
# for loop
	movq -8(%rbp), %r10
	movq $0, %r11
	movq %r11, -8(%rbp)
.L0:
	movq -8(%rbp), %rbx
	movq $4, %r10
	cmp %r10, %rbx
	jl .L2
	movq $0, %rbx
	jmp .L3
.L2:
	movq $1, %rbx
.L3:
	cmp $0, %rbx
	je .L1
	movq -8(%rbp), %rbx
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
	jmp .L0
.L1:
	.data
.L4:
	.string "\n"
.text
	movq $.L4, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -8(%rbp), %r10
	movq $0, %r11
	movq %r11, -8(%rbp)
# for loop
.L5:
	movq -8(%rbp), %rbx
	movq $4, %r10
	cmp %r10, %rbx
	jl .L7
	movq $0, %rbx
	jmp .L8
.L7:
	movq $1, %rbx
.L8:
	cmp $0, %rbx
	je .L6
	movq -8(%rbp), %rbx
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
	.data
.L9:
	.string "\n"
.text
	movq $.L9, %rbx
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
.L10:
	movq -8(%rbp), %rbx
	movq $4, %r10
	cmp %r10, %rbx
	jl .L12
	movq $0, %rbx
	jmp .L13
.L12:
	movq $1, %rbx
.L13:
	cmp $0, %rbx
	je .L11
	movq -8(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	movq -8(%rbp), %r10
	movq -8(%rbp), %r11
	movq $1, %r12
	addq %r11, %r12
	movq %r12, -8(%rbp)
	jmp .L10
.L11:
	.data
.L14:
	.string "\n"
.text
	movq $.L14, %rbx
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
.L15:
# if statement!
	movq -8(%rbp), %rbx
	movq $4, %r10
	cmp %r10, %rbx
	jge .L19
	movq $0, %rbx
	jmp .L20
.L19:
	movq $1, %rbx
.L20:
	cmp $0, %rbx
	je .L17
# return statement
	movq $0, %rbx
	movq %rbx, %rax
	jmp .main_epilogue
	jmp .L18
# else body
.L17:
# done if statement
.L18:
	movq -8(%rbp), %rbx
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
	jmp .L15
.L16:
	.data
.L21:
	.string "\n"
.text
	movq $.L21, %rbx
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
