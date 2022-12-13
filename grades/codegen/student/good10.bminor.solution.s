.data

.global x
x:
	.quad 10
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
	movq $3,%rbx
	neg %rbx
	movq $2,%r10
	movq $6,%r11
	mov %r10, %rax
	imul %r11
	mov %rax, %r11
	add %rbx, %r11
	movq %r11, -8(%rbp)
	movq -8(%rbp),%rbx
	movq x,%r10
	cmp %r10, %rbx
	jg .L3
	mov $0, %rbx
	jmp .L4
.L3:
	mov $1, %rbx
.L4:
	cmp $0, %rbx
	je .L1
	movq x,%r10
	mov %r10, %rbx
	jmp .L2
.L1:
	movq -8(%rbp),%r10
	mov %r10, %rbx
.L2:
	movq %rbx, -16(%rbp)
	movq -16(%rbp),%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S0:	.string " should be 9\n"
.text
	leaq .S0,%rbx
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
