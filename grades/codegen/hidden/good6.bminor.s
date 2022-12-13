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
	cmp $0, %rbx
	je .L0
	movq $0, %rbx
	jmp .L1
.L0:
	movq $1, %rbx
.L1:
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
.data
.global x
x:
.quad 4
.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $8, %rsp
	movq $10, %rbx
	movq %rbx, -8(%rbp)
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
# function called!
	pushq %r10
	pushq %r11
# function called!
	pushq %r10
	pushq %r11
	movq x, %rbx
	movq -8(%rbp), %r10
	cmp %r10, %rbx
	jle .L4
	movq $0, %rbx
	jmp .L5
.L4:
	movq $1, %rbx
.L5:
	movq -8(%rbp), %r10
	movq %rbx, %rdi
	movq %r10, %rsi
	call f
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	movq x, %r10
	movq -8(%rbp), %r11
	cmp %r11, %r10
	jle .L6
	movq $0, %r10
	jmp .L7
.L6:
	movq $1, %r10
.L7:
	movq -8(%rbp), %r11
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
	movq x, %r10
	movq -8(%rbp), %r11
	cmp %r11, %r10
	jle .L8
	movq $0, %r10
	jmp .L9
.L8:
	movq $1, %r10
.L9:
	movq -8(%rbp), %r11
	movq %r10, %rdi
	movq %r11, %rsi
	call f
	popq %r11
	popq %r10
	movq %rax, %r10
# function done!
	movq x, %r11
	movq -8(%rbp), %r12
	cmp %r12, %r11
	jle .L10
	movq $0, %r11
	jmp .L11
.L10:
	movq $1, %r11
.L11:
	movq -8(%rbp), %r12
	movq %rbx, %rdi
	movq %r10, %rsi
	movq %r11, %rdx
	movq %r12, %rcx
	call f
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
# function called!
	pushq %r10
	pushq %r11
# function called!
	pushq %r10
	pushq %r11
	movq x, %r10
	movq -8(%rbp), %r11
	cmp %r11, %r10
	jle .L12
	movq $0, %r10
	jmp .L13
.L12:
	movq $1, %r10
.L13:
	movq -8(%rbp), %r11
	movq %r10, %rdi
	movq %r11, %rsi
	call f
	popq %r11
	popq %r10
	movq %rax, %r10
# function done!
	movq x, %r11
	movq -8(%rbp), %r12
	cmp %r12, %r11
	jle .L14
	movq $0, %r11
	jmp .L15
.L14:
	movq $1, %r11
.L15:
	movq -8(%rbp), %r12
	movq %r10, %rdi
	movq %r11, %rsi
	movq %r12, %rdx
	call f
	popq %r11
	popq %r10
	movq %rax, %r10
# function done!
# function called!
	pushq %r10
	pushq %r11
	movq x, %r11
	movq -8(%rbp), %r12
	cmp %r12, %r11
	jle .L16
	movq $0, %r11
	jmp .L17
.L16:
	movq $1, %r11
.L17:
	movq -8(%rbp), %r12
	movq %r11, %rdi
	movq %r12, %rsi
	call f
	popq %r11
	popq %r10
	movq %rax, %r11
# function done!
	movq x, %r12
	movq -8(%rbp), %r13
	cmp %r13, %r12
	jle .L18
	movq $0, %r12
	jmp .L19
.L18:
	movq $1, %r12
.L19:
	movq -8(%rbp), %r13
	movq %rbx, %rdi
	movq %r10, %rsi
	movq %r11, %rdx
	movq %r12, %rcx
	movq %r13, %r8
	call f
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
# function called!
	pushq %r10
	pushq %r11
# function called!
	pushq %r10
	pushq %r11
# function called!
	pushq %r10
	pushq %r11
	movq x, %r10
	movq -8(%rbp), %r11
	cmp %r11, %r10
	jle .L20
	movq $0, %r10
	jmp .L21
.L20:
	movq $1, %r10
.L21:
	movq -8(%rbp), %r11
	movq %r10, %rdi
	movq %r11, %rsi
	call f
	popq %r11
	popq %r10
	movq %rax, %r10
# function done!
	movq x, %r11
	movq -8(%rbp), %r12
	cmp %r12, %r11
	jle .L22
	movq $0, %r11
	jmp .L23
.L22:
	movq $1, %r11
.L23:
	movq -8(%rbp), %r12
	movq %r10, %rdi
	movq %r11, %rsi
	movq %r12, %rdx
	call f
	popq %r11
	popq %r10
	movq %rax, %r10
# function done!
# function called!
	pushq %r10
	pushq %r11
	movq x, %r11
	movq -8(%rbp), %r12
	cmp %r12, %r11
	jle .L24
	movq $0, %r11
	jmp .L25
.L24:
	movq $1, %r11
.L25:
	movq -8(%rbp), %r12
	movq %r11, %rdi
	movq %r12, %rsi
	call f
	popq %r11
	popq %r10
	movq %rax, %r11
# function done!
	movq x, %r12
	movq -8(%rbp), %r13
	cmp %r13, %r12
	jle .L26
	movq $0, %r12
	jmp .L27
.L26:
	movq $1, %r12
.L27:
	movq -8(%rbp), %r13
	movq %r10, %rdi
	movq %r11, %rsi
	movq %r12, %rdx
	movq %r13, %rcx
	call f
	popq %r11
	popq %r10
	movq %rax, %r10
# function done!
# function called!
	pushq %r10
	pushq %r11
# function called!
	pushq %r10
	pushq %r11
	movq x, %r11
	movq -8(%rbp), %r12
	cmp %r12, %r11
	jle .L28
	movq $0, %r11
	jmp .L29
.L28:
	movq $1, %r11
.L29:
	movq -8(%rbp), %r12
	movq %r11, %rdi
	movq %r12, %rsi
	call f
	popq %r11
	popq %r10
	movq %rax, %r11
# function done!
	movq x, %r12
	movq -8(%rbp), %r13
	cmp %r13, %r12
	jle .L30
	movq $0, %r12
	jmp .L31
.L30:
	movq $1, %r12
.L31:
	movq -8(%rbp), %r13
	movq %r11, %rdi
	movq %r12, %rsi
	movq %r13, %rdx
	call f
	popq %r11
	popq %r10
	movq %rax, %r11
# function done!
# function called!
	pushq %r10
	pushq %r11
	movq x, %r12
	movq -8(%rbp), %r13
	cmp %r13, %r12
	jle .L32
	movq $0, %r12
	jmp .L33
.L32:
	movq $1, %r12
.L33:
	movq -8(%rbp), %r13
	movq %r12, %rdi
	movq %r13, %rsi
	call f
	popq %r11
	popq %r10
	movq %rax, %r12
# function done!
	movq x, %r13
	movq -8(%rbp), %r14
	cmp %r14, %r13
	jle .L34
	movq $0, %r13
	jmp .L35
.L34:
	movq $1, %r13
.L35:
	movq -8(%rbp), %r14
	movq %rbx, %rdi
	movq %r10, %rsi
	movq %r11, %rdx
	movq %r12, %rcx
	movq %r13, %r8
	movq %r14, %r9
	call f
	popq %r11
	popq %r10
	movq %rax, %rbx
# function done!
	cmp $0, %rbx
	je .L2
# return statement
	movq $1, %rbx
	movq %rbx, %rax
	jmp .main_epilogue
	jmp .L3
# else body
.L2:
# if statement!
	movq x, %rbx
	movq -8(%rbp), %r10
	movq x, %r11
	movq -8(%rbp), %r12
	movq %r11, %rax
	imulq %r12
	movq %rax, %r12
	subq %r12, %r10
	cmp %r10, %rbx
	jl .L38
	movq $0, %rbx
	jmp .L39
.L38:
	movq $1, %rbx
.L39:
	cmp $0, %rbx
	je .L36
# return statement
	movq $4, %rbx
	movq %rbx, %rax
	jmp .main_epilogue
	jmp .L37
# else body
.L36:
# return statement
	movq $2, %rbx
	movq %rbx, %rax
	jmp .main_epilogue
# done if statement
.L37:
# done if statement
.L3:
.main_epilogue:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
