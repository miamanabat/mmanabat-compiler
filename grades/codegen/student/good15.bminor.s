.data
.global x
x:
.quad 1
.data
.global a
a:
.quad 1
.quad 2
.quad 3
.quad 4
.data
.global b
b:
.quad 1
.data
.global c
c:
.quad 99
.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $0, %rsp
	movq x, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	movq $1, %r10
	lea a, %rbx
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
	movq b, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	movq c, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_character
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
