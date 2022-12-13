.data
.global str
str:
.quad .L0
.data
.global .L0
.L0:
.string "hello"
.data
.global str2
str2:
.quad .L1
.data
.global .L1
.L1:
.string " world"
.data
.global i
i:
.quad 76
.data
.global arr
arr:
.quad 1
.quad 2
.quad 3
.quad 4
.text
.global func
func:
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
	cmp %r10, %rbx
	je .L2
	movq $0, %rbx
	jmp .L3
.L2:
	movq $1, %rbx
.L3:
	movq %rbx, %rax
	jmp .func_epilogue
.func_epilogue:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
.text
.global f_int
f_int:
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
	movq %rbx, %rax
	jmp .f_int_epilogue
.f_int_epilogue:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
.text
.global f_str
f_str:
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
	movq %rbx, %rax
	jmp .f_str_epilogue
.f_str_epilogue:
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

	subq $16, %rsp
	movq $0, %r10
	lea arr, %rbx
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
	.data
.L4:
	.string " "
.text
	movq $.L4, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1, %r10
	lea arr, %rbx
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
	.data
.L5:
	.string " "
.text
	movq $.L5, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $2, %r10
	lea arr, %rbx
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
	.data
.L6:
	.string " "
.text
	movq $.L6, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $3, %r10
	lea arr, %rbx
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
	.data
.L7:
	.string "\n"
.text
	movq $.L7, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L8:
	.string "int args (false, true true) "
.text
	movq $.L8, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# function called!
	pushq %r10
	pushq %r11
	movq $0, %r10
	lea arr, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq (%rax), %rbx
	movq $0, %r10
	movq %rbx, %rdi
	movq %r10, %rsi
	call func
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
	movq $1, %r10
	lea arr, %rbx
	movq $8, %rax
	imulq %r10
	addq %rbx, %rax
	movq (%rax), %rbx
	movq $1, %r10
	movq %rbx, %rdi
	movq %r10, %rsi
	call func
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
	call func
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
.L9:
	.string "\n"
.text
	movq $.L9, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L10:
	.string "(76, 76)"
.text
	movq $.L10, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq i, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	.data
.L11:
	.string " "
.text
	movq $.L11, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $76, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	.data
.L12:
	.string " \n"
.text
	movq $.L12, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq i, %r10
	movq $67, %r11
	movq %r11, i
	.data
.L13:
	.string "(67, 76, 67, 67) "
.text
	movq $.L13, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq i, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	movq i, %rbx
	movq $9, %r10
	addq %rbx, %r10
	pushq %r10
	pushq %r11
	movq %r10, %rdi
	call print_integer
	popq %r11
	popq %r10
# function called!
	pushq %r10
	pushq %r11
	movq i, %rbx
	movq %rbx, %rdi
	call f_int
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
# function called!
	pushq %r10
	pushq %r11
	movq $67, %rbx
	movq %rbx, %rdi
	call f_int
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	.data
.L14:
	.string "\n"
.text
	movq $.L14, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L15:
	.string "hello"
.text
	movq $.L15, %rbx
	movq %rbx, -8(%rbp)
	movq str2, %r10
	.data
.L16:
	.string "hello"
.text
	movq $.L16, %r11
	movq %r11, str2
	movq str2, %rbx
	movq %rbx, -16(%rbp)
	.data
.L17:
	.string "testing function calls with global, literal, local, and reassigned strings: \n"
.text
	movq $.L17, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L18:
	.string "string args (hello, hello, hello, hello, hello) "
.text
	movq $.L18, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# function called!
	pushq %r10
	pushq %r11
	movq str, %rbx
	movq %rbx, %rdi
	call f_str
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
# function called!
	pushq %r10
	pushq %r11
	.data
.L19:
	.string "hello"
.text
	movq $.L19, %rbx
	movq %rbx, %rdi
	call f_str
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
# function called!
	pushq %r10
	pushq %r11
	.data
.L20:
	.string "hello"
.text
	movq $.L20, %rbx
	movq %rbx, %rdi
	call f_str
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
# function called!
	pushq %r10
	pushq %r11
	movq str2, %rbx
	movq %rbx, %rdi
	call f_str
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
# function called!
	pushq %r10
	pushq %r11
	movq -16(%rbp), %rbx
	movq %rbx, %rdi
	call f_str
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
	.data
.L21:
	.string "\n"
.text
	movq $.L21, %rbx
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
