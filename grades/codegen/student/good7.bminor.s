.data
.global x
x:
.quad 5
.data
.global y
y:
.quad 1
.text
.global nothing
nothing:
	pushq %rbp
	movq %rsp, %rbp

	subq $0, %rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
	.data
.L0:
	.string "hey no args worked\n"
.text
	movq $.L0, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# return statement
	movq $1, %rbx
	movq %rbx, %rax
	jmp .nothing_epilogue
.nothing_epilogue:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
.text
.global onearg
onearg:
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
	call print_integer
	popq %r11
	popq %r10
	.data
.L1:
	.string "yay one arg worked\n"
.text
	movq $.L1, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# return statement
	movq $1, %rbx
	movq %rbx, %rax
	jmp .onearg_epilogue
.onearg_epilogue:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
.text
.global multargs
multargs:
	pushq %rbp
	movq %rsp, %rbp

	pushq %rdi
	pushq %rsi
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
	call print_integer
	popq %r11
	popq %r10
	movq -16(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L2:
	.string "yay two args worked\n"
.text
	movq $.L2, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# return statement
	movq $1, %rbx
	movq %rbx, %rax
	jmp .multargs_epilogue
.multargs_epilogue:
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
	call nothing
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
# function called!
	pushq %r10
	pushq %r11
	movq $2, %rbx
	movq %rbx, %rdi
	call onearg
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
# function called!
	pushq %r10
	pushq %r11
	movq $2, %rbx
	movq $1, %r10
	movq %rbx, %rdi
	movq %r10, %rsi
	call multargs
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
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
