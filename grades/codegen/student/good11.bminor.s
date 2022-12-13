.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $0, %rsp
# if statement!
	movq $1, %rbx
	movq $0, %r10
	and %rbx, %r10
	cmp $0, %r10
	je .L0
	.data
.L2:
	.string "should not be printed\n"
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
# if statement!
	movq $1, %rbx
	movq $0, %r10
	or %rbx, %r10
	cmp $0, %r10
	je .L3
	.data
.L5:
	.string "should be printed\n"
.text
	movq $.L5, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L4
# else body
.L3:
	.data
.L6:
	.string "should not be printed\n"
.text
	movq $.L6, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# done if statement
.L4:
# done if statement
.L1:
# if statement!
	movq $1, %rbx
	cmp $0, %rbx
	je .L9
	movq $0, %rbx
	jmp .L10
.L9:
	movq $1, %rbx
.L10:
	cmp $0, %rbx
	je .L7
	.data
.L11:
	.string "should not be printed\n"
.text
	movq $.L11, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L8
# else body
.L7:
# if statement!
	movq $0, %rbx
	cmp $0, %rbx
	je .L14
	movq $0, %rbx
	jmp .L15
.L14:
	movq $1, %rbx
.L15:
	cmp $0, %rbx
	je .L12
	.data
.L16:
	.string "should be printed\n"
.text
	movq $.L16, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L13
# else body
.L12:
	.data
.L17:
	.string "should not be printed\n"
.text
	movq $.L17, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# done if statement
.L13:
# done if statement
.L8:
# if statement!
	movq $1, %rbx
	cmp $0, %rbx
	je .L18
# if statement!
	movq $1, %rbx
	cmp $0, %rbx
	je .L20
	.data
.L22:
	.string "should be printed\n"
.text
	movq $.L22, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L21
# else body
.L20:
	.data
.L23:
	.string "should not be printed\n"
.text
	movq $.L23, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# done if statement
.L21:
	jmp .L19
# else body
.L18:
# done if statement
.L19:
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
