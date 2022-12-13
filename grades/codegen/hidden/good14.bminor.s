.data
.global s
s:
.quad .L0
.data
.global .L0
.L0:
.string "no\n"
.text
.global f
f:
	pushq %rbp
	movq %rsp, %rbp

	subq $8, %rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
	movq s, %rbx
	movq %rbx, -8(%rbp)
	movq s, %r10
	.data
.L1:
	.string "ok\n"
.text
	movq $.L1, %r11
	movq %r11, s
# return statement
	movq -8(%rbp), %rbx
	movq %rbx, %rax
	jmp .f_epilogue
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

	subq $0, %rsp
# function called!
	pushq %r10
	pushq %r11
	call f
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq s, %rbx
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
