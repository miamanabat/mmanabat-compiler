.text

.global main
main:
	pushq %rbp
	movq  %rsp, %rbp
	subq $16,%rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
	movq $1,%rbx
	movq %rbx, -8(%rbp)
	movq $4,%rbx
	movq $3,%r10
	mov %rbx, %rax
	imul %r10
	mov %rax, %r10
	movq $1,%rbx
	mov %r10, %rax
	cqo
	idiv %rbx
	mov %rax, %rbx
	movq $5,%r10
	add %rbx, %r10
	movq $3,%rbx
	leaq -8(%rbp), %r11
	mov (%r11), %r12
	mov %r12, %r13
	add $1, %r12
	mov %r12, (%r11)
	movq $1,%r11
	add %r13, %r11
	movq %rbx, %rdi
	movq %r11, %rsi
	pushq %r10
	pushq %r11
	call integer_power
	popq %r11
	popq %r10
	movq %rax, %rbx
	movq $2,%r11
	movq %rbx, %rdi
	movq %r11, %rsi
	pushq %r10
	pushq %r11
	call integer_power
	popq %r11
	popq %r10
	movq %rax, %rbx
	sub %rbx, %r10
	movq %r10, -16(%rbp)
.data
.S0:	.string "a should be 2, x should be -64:\n"
.text
	leaq .S0,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -8(%rbp),%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
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
	movq -16(%rbp),%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S2:	.string "\n"
.text
	leaq .S2,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq  %rbp, %rsp
	popq %rbp
	ret
