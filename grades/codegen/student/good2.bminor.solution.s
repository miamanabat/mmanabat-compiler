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

.global main
main:
	pushq %rbp
	movq  %rsp, %rbp
	subq $0,%rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
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
.S0:	.string " "
.text
	leaq .S0,%rbx
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
	movq $2,%r10
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
	movq $3,%r10
	mov (%rbx,%r10,8), %r11
	pushq %r10
	pushq %r11
	mov %r11, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S3:	.string "\n"
.text
	leaq .S3,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $23,%rbx
	neg %rbx
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
.S4:	.string ": -23 "
.text
	leaq .S4,%rbx
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
.S5:	.string ": 45  "
.text
	leaq .S5,%rbx
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
.S6:	.string ": 11 "
.text
	leaq .S6,%rbx
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
.S7:	.string ": 12 \n"
.text
	leaq .S7,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	leaq arr,%rbx
	movq $1,%r10
	mov (%rbx,%r10,8), %r11
	leaq arr,%rbx
	movq $2,%r10
	mov (%rbx,%r10,8), %r12
	add %r11, %r12
	leaq arr, %rbx
	movq $0,%r10
	leaq (%rbx,%r10,8), %r10
	mov %r12, (%r10)
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
.S8:	.string " should be 56\n"
.text
	leaq .S8,%rbx
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
