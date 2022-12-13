.data
.global x
x:
.quad 5
.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $0, %rsp
	.data
.L0:
	.string "true: "
.text
	movq $.L0, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1, %rbx
	movq $1, %r10
	and %rbx, %r10
	pushq %r10
	pushq %r11
	movq %r10, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L1:
	.string " false: "
.text
	movq $.L1, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1, %rbx
	movq $0, %r10
	and %rbx, %r10
	pushq %r10
	pushq %r11
	movq %r10, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L2:
	.string ", true: "
.text
	movq $.L2, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1, %rbx
	movq $0, %r10
	or %rbx, %r10
	pushq %r10
	pushq %r11
	movq %r10, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L3:
	.string "\n"
.text
	movq $.L3, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L4:
	.string "false: "
.text
	movq $.L4, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1, %rbx
	cmp $0, %rbx
	je .L5
	movq $0, %rbx
	jmp .L6
.L5:
	movq $1, %rbx
.L6:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L7:
	.string ", false: "
.text
	movq $.L7, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1, %rbx
	cmp $0, %rbx
	je .L8
	movq $0, %rbx
	jmp .L9
.L8:
	movq $1, %rbx
.L9:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L10:
	.string ", true: "
.text
	movq $.L10, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1, %rbx
	cmp $0, %rbx
	je .L13
	movq $0, %rbx
	jmp .L14
.L13:
	movq $1, %rbx
.L14:
	cmp $0, %rbx
	je .L11
	movq $0, %rbx
	jmp .L12
.L11:
	movq $1, %rbx
.L12:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L15:
	.string "\n"
.text
	movq $.L15, %rbx
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
