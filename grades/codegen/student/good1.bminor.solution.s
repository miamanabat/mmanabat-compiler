.data

.global str
str:
	.string "hello"
.data

.global str2
str2:
	.string " world"
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
	movq  %rsp, %rbp
	pushq %rdi
	subq $0,%rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
	movq -8(%rbp),%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	movq -8(%rbp),%rbx
	movq $2,%r10
	cmp %r10, %rbx
	je .L1
	mov $0, %rbx
	jmp .L2
.L1:
	mov $1, %rbx
.L2:
	movq %rbx,%rax
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq  %rbp, %rsp
	popq %rbp
	ret
.text

.global main
main:
	pushq %rbp
	movq  %rsp, %rbp
	subq $8,%rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
	movq $3,%rbx
	movq $1,%r10
	cmp %r10, %rbx
	jge .L5
	mov $0, %rbx
	jmp .L6
.L5:
	mov $1, %rbx
.L6:
	cmp $0, %rbx
	jz .L3
.data
.S0:	.string "3 is greater than 1\n"
.text
	leaq .S0,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L4
.L3:
.L4:
	leaq arr,%rbx
	movq $0,%r10
	mov (%rbx,%r10,8), %r11
	pushq %r10
	pushq %r11
	mov %r11, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S1:	.string " "
.text
	leaq .S1,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	leaq arr,%rbx
	movq $1,%r10
	mov (%rbx,%r10,8), %r11
	pushq %r10
	pushq %r11
	mov %r11, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S2:	.string " "
.text
	leaq .S2,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	leaq arr,%rbx
	movq $2,%r10
	mov (%rbx,%r10,8), %r11
	pushq %r10
	pushq %r11
	mov %r11, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S3:	.string " "
.text
	leaq .S3,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	leaq arr,%rbx
	movq $3,%r10
	mov (%rbx,%r10,8), %r11
	pushq %r10
	pushq %r11
	mov %r11, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S4:	.string "\n"
.text
	leaq .S4,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S5:	.string "yes\n"
.text
	leaq .S5,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $234,%rbx
	leaq arr, %r10
	movq $0,%r11
	leaq (%r10,%r11,8), %r11
	mov %rbx, (%r11)
	movq $45,%rbx
	leaq arr, %r10
	movq $1,%r11
	leaq (%r10,%r11,8), %r11
	mov %rbx, (%r11)
	movq $11,%rbx
	leaq arr, %r10
	movq $2,%r11
	leaq (%r10,%r11,8), %r11
	mov %rbx, (%r11)
	movq $12,%rbx
	leaq arr, %r10
	movq $3,%r11
	leaq (%r10,%r11,8), %r11
	mov %rbx, (%r11)
	leaq arr,%rbx
	movq $0,%r10
	mov (%rbx,%r10,8), %r11
	pushq %r10
	pushq %r11
	mov %r11, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S6:	.string " "
.text
	leaq .S6,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	leaq arr,%rbx
	movq $1,%r10
	mov (%rbx,%r10,8), %r11
	pushq %r10
	pushq %r11
	mov %r11, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S7:	.string " "
.text
	leaq .S7,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	leaq arr,%rbx
	movq $2,%r10
	mov (%rbx,%r10,8), %r11
	pushq %r10
	pushq %r11
	mov %r11, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S8:	.string " "
.text
	leaq .S8,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	leaq arr,%rbx
	movq $3,%r10
	mov (%rbx,%r10,8), %r11
	pushq %r10
	pushq %r11
	mov %r11, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S9:	.string "\n"
.text
	leaq .S9,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1,%rbx
	movq $2,%r10
	add %rbx, %r10
	pushq %r10
	pushq %r11
	mov %r10, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S10:	.string "\n"
.text
	leaq .S10,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $0,%rbx
	movq %rbx, -8(%rbp)
	movq -8(%rbp),%rbx
	movq $1,%r10
	add %rbx, %r10
	mov %r10, -8(%rbp)
	movq -8(%rbp),%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S11:	.string " should be 1\n"
.text
	leaq .S11,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -8(%rbp),%rbx
	movq $1,%r10
	sub %r10, %rbx
	mov %rbx, -8(%rbp)
	movq -8(%rbp),%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S12:	.string " should be 0\n"
.text
	leaq .S12,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $6,%rbx
	mov %rbx, -8(%rbp)
	movq -8(%rbp),%rbx
	movq -8(%rbp),%r10
	mov %rbx, %rax
	imul %r10
	mov %rax, %r10
	mov %r10, -8(%rbp)
	movq -8(%rbp),%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S13:	.string " should be 36\n"
.text
	leaq .S13,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -8(%rbp),%rbx
	movq -8(%rbp),%r10
	mov %rbx, %rax
	cqo
	idiv %r10
	mov %rax, %r10
	mov %r10, -8(%rbp)
	movq -8(%rbp),%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S14:	.string " should be 1\n"
.text
	leaq .S14,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $2,%rbx
	mov %rbx, -8(%rbp)
	movq -8(%rbp),%rbx
	movq $2,%r10
	mov %rbx, %rax
	cqo
	idiv %r10
	mov %rdx, %r10
	pushq %r10
	pushq %r11
	mov %r10, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S15:	.string " should be 0\n"
.text
	leaq .S15,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -8(%rbp),%rbx
	movq $2,%r10
	movq %rbx, %rdi
	movq %r10, %rsi
	pushq %r10
	pushq %r11
	call integer_power
	popq %r11
	popq %r10
	movq %rax, %rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S16:	.string " should be 4\n"
.text
	leaq .S16,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -8(%rbp),%rbx
	movq $2,%r10
	movq %rbx, %rdi
	movq %r10, %rsi
	pushq %r10
	pushq %r11
	call integer_power
	popq %r11
	popq %r10
	movq %rax, %rbx
	movq $3,%r10
	movq %rbx, %rdi
	movq %r10, %rsi
	pushq %r10
	pushq %r11
	call integer_power
	popq %r11
	popq %r10
	movq %rax, %rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S17:	.string " should be 256\n"
.text
	leaq .S17,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $0,%rbx
	movq %rbx,%rax
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq  %rbp, %rsp
	popq %rbp
	ret
