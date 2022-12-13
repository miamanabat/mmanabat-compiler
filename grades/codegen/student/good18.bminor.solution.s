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
	movq $0,%rbx
	mov %rbx, -16(%rbp)
.L1:
	movq -16(%rbp),%rbx
	movq $10,%r10
	cmp %r10, %rbx
	jl .L3
	mov $0, %rbx
	jmp .L4
.L3:
	mov $1, %rbx
.L4:
	cmp $0, %rbx
	jz .L2
	movq $0,%rbx
	mov %rbx, -8(%rbp)
.L5:
	movq -8(%rbp),%rbx
	movq $10,%r10
	cmp %r10, %rbx
	jl .L7
	mov $0, %rbx
	jmp .L8
.L7:
	mov $1, %rbx
.L8:
	cmp $0, %rbx
	jz .L6
	movq -8(%rbp),%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	movq -16(%rbp),%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	leaq -8(%rbp), %rbx
	mov (%rbx), %r10
	mov %r10, %r11
	add $1, %r10
	mov %r10, (%rbx)
	jmp .L5
.L6:
.data
.S0:	.string "\n"
.text
	leaq .S0,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	leaq -16(%rbp), %rbx
	mov (%rbx), %r10
	mov %r10, %r11
	add $1, %r10
	mov %r10, (%rbx)
	jmp .L1
.L2:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq  %rbp, %rsp
	popq %rbp
	ret
