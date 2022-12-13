.data
.global c1
c1:
.quad 1
.data
.global c3
c3:
.quad 100
.text
.global C
C:
	pushq %rbp
	movq %rsp, %rbp

	pushq %rdi
	pushq %rsi
	subq $24, %rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
	movq $11, %rbx
	movq %rbx, -24(%rbp)
	movq $12, %rbx
	movq %rbx, -32(%rbp)
	movq $13, %rbx
	movq %rbx, -40(%rbp)
# return statement
	movq -8(%rbp), %rbx
	movq -16(%rbp), %r10
	addq %rbx, %r10
	movq -24(%rbp), %rbx
	addq %r10, %rbx
	movq -32(%rbp), %r10
	addq %rbx, %r10
	movq %r10, %rax
	jmp .C_epilogue
.C_epilogue:
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
# return statement
# function called!
	pushq %r10
	pushq %r11
	movq $1, %rbx
	movq $2, %r10
	movq %rbx, %rdi
	movq %r10, %rsi
	call C
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
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
