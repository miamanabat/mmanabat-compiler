.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $0, %rsp
# if statement!
# function called!
	pushq %r10
	pushq %r11
# function called!
	pushq %r10
	pushq %r11
	.data
.L2:
	.string "hi"
.text
	movq $.L2, %rbx
	movq %rbx, %rdi
	call strlen
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	.data
.L3:
	.string "hi"
.text
	movq $.L3, %r10
	movq %rbx, %rdi
	movq %r10, %rsi
	call f
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
# function called!
	pushq %r10
	pushq %r11
	.data
.L4:
	.string "there"
.text
	movq $.L4, %r10
	movq %r10, %rdi
	call strlen
	popq %r11
	popq %r10
	movq %rax, %r10
# function done!
	cmp %r10, %rbx
	jg .L5
	movq $0, %rbx
	jmp .L6
.L5:
	movq $1, %rbx
.L6:
	cmp $0, %rbx
	je .L0
	.data
.L7:
	.string "no\n"
.text
	movq $.L7, %rbx
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
# function called!
	pushq %r10
	pushq %r11
# function called!
	pushq %r10
	pushq %r11
# function called!
	pushq %r10
	pushq %r11
	.data
.L10:
	.string "hi"
.text
	movq $.L10, %rbx
	movq %rbx, %rdi
	call strlen
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	.data
.L11:
	.string "hi"
.text
	movq $.L11, %r10
	movq %rbx, %rdi
	movq %r10, %rsi
	call f
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
# function called!
	pushq %r10
	pushq %r11
	.data
.L12:
	.string "hi"
.text
	movq $.L12, %r10
	movq %r10, %rdi
	call strlen
	popq %r11
	popq %r10
	movq %rax, %r10
# function done!
	.data
.L13:
	.string "hi"
.text
	movq $.L13, %r11
	movq %rbx, %rdi
	movq %r10, %rsi
	movq %r11, %rdx
	call f
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
# function called!
	pushq %r10
	pushq %r11
	.data
.L14:
	.string "there"
.text
	movq $.L14, %r10
	movq %r10, %rdi
	call strlen
	popq %r11
	popq %r10
	movq %rax, %r10
# function done!
	cmp %r10, %rbx
	jg .L15
	movq $0, %rbx
	jmp .L16
.L15:
	movq $1, %rbx
.L16:
	cmp $0, %rbx
	je .L8
	.data
.L17:
	.string "ok\n"
.text
	movq $.L17, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L9
# else body
.L8:
# done if statement
.L9:
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
# return statement
	movq -8(%rbp), %rbx
	movq $2, %r10
	movq %rbx, %rax
	imulq %r10
	movq %rax, %r10
	movq %r10, %rax
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
