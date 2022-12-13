.text
.global f
f:
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
	call print_string
	popq %r11
	popq %r10
.f_epilogue:
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
	.data
.L0:
	.string "hello"
.text
	movq $.L0, %rbx
	movq %rbx, -8(%rbp)
# function called!
	pushq %r10
	pushq %r11
	movq -8(%rbp), %rbx
	movq %rbx, %rdi
	call f
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
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
