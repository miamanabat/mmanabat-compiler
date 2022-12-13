.data
.global x
x:
.quad 2
.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $0, %rsp
	.data
.L0:
	.string " should be 64 and 0: \n"
.text
	movq $.L0, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x, %rbx
	movq $6, %r10
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
.L1:
	.string " "
.text
	movq $.L1, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x, %rbx
	movq $4, %r10
	negq %r10
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
# return statement
	movq x, %rbx
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
