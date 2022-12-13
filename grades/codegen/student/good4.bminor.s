.data
.global i
i:
.quad 1
.data
.global a
a:
.quad 104
.data
.global b
b:
.quad 0
.text
.global f_char
f_char:
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
	call print_character
	popq %r11
	popq %r10
	.data
.L0:
	.string "\n"
.text
	movq $.L0, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# return statement
	movq -8(%rbp), %rbx
	movq %rbx, %rax
	jmp .f_char_epilogue
.f_char_epilogue:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
.text
.global f_bool
f_bool:
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
	call print_boolean
	popq %r11
	popq %r10
	.data
.L1:
	.string "\n"
.text
	movq $.L1, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# return statement
	movq -8(%rbp), %rbx
	movq %rbx, %rax
	jmp .f_bool_epilogue
.f_bool_epilogue:
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

	subq $24, %rsp
	movq b, %r10
	movq a, %r11
	movq %r11, b
	movq $98, %rbx
	movq %rbx, -8(%rbp)
	movq $0, %rbx
	movq %rbx, -16(%rbp)
	.data
.L2:
	.string "testing function calls with global, literal, local, and reassigned strings: \n"
.text
	movq $.L2, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# function called!
	pushq %r10
	pushq %r11
	movq a, %rbx
	movq %rbx, %rdi
	call f_char
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_character
	popq %r11
	popq %r10
# function called!
	pushq %r10
	pushq %r11
	movq b, %rbx
	movq %rbx, %rdi
	call f_char
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_character
	popq %r11
	popq %r10
# function called!
	pushq %r10
	pushq %r11
	movq -8(%rbp), %rbx
	movq %rbx, %rdi
	call f_char
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_character
	popq %r11
	popq %r10
# function called!
	pushq %r10
	pushq %r11
	movq i, %rbx
	movq %rbx, %rdi
	call f_bool
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
	movq $1, %rbx
	movq %rbx, %rdi
	call f_bool
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
	movq $0, %rbx
	movq %rbx, %rdi
	call f_bool
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
	movq -16(%rbp), %rbx
	movq %rbx, %rdi
	call f_bool
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
	movq $116, %rbx
	movq %rbx, -24(%rbp)
	movq -24(%rbp), %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_character
	popq %r11
	popq %r10
	movq $110, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_character
	popq %r11
	popq %r10
	movq $116, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_character
	popq %r11
	popq %r10
	movq $63, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_character
	popq %r11
	popq %r10
	movq $92, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_character
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
