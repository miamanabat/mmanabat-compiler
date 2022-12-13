.data

.global arr
arr:
	.quad 45
	.quad 23
	.quad 1
	.quad 3
	.quad 6
	.quad 7
	.quad 985
	.quad 23
.text

.global main
main:
	pushq %rbp
	movq  %rsp, %rbp
	subq $32,%rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
	movq $0,%rbx
	movq %rbx, -8(%rbp)
	movq $0,%rbx
	mov %rbx, -8(%rbp)
.L1:
	movq -8(%rbp),%rbx
	movq $8,%r10
	cmp %r10, %rbx
	jl .L3
	mov $0, %rbx
	jmp .L4
.L3:
	mov $1, %rbx
.L4:
	cmp $0, %rbx
	jz .L2
	leaq arr,%rbx
	movq -8(%rbp),%r10
	mov (%rbx,%r10,8), %r11
	pushq %r10
	pushq %r11
	mov %r11, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S0:	.string ", "
.text
	leaq .S0,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	leaq -8(%rbp), %rbx
	mov (%rbx), %r10
	mov %r10, %r11
	add $1, %r10
	mov %r10, (%rbx)
	jmp .L1
.L2:
.data
.S1:	.string "\nsorted array: "
.text
	leaq .S1,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $0,%rbx
	mov %rbx, -8(%rbp)
.L5:
	movq -8(%rbp),%rbx
	movq $7,%r10
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
	movq %rbx, -16(%rbp)
	movq -8(%rbp),%rbx
	movq $1,%r10
	add %rbx, %r10
	mov %r10, -24(%rbp)
.L9:
	movq -24(%rbp),%rbx
	movq $8,%r10
	cmp %r10, %rbx
	jl .L11
	mov $0, %rbx
	jmp .L12
.L11:
	mov $1, %rbx
.L12:
	cmp $0, %rbx
	jz .L10
	leaq arr,%rbx
	movq -24(%rbp),%r10
	mov (%rbx,%r10,8), %r11
	leaq arr,%rbx
	movq -16(%rbp),%r10
	mov (%rbx,%r10,8), %r12
	cmp %r12, %r11
	jl .L15
	mov $0, %rbx
	jmp .L16
.L15:
	mov $1, %rbx
.L16:
	cmp $0, %rbx
	jz .L13
	movq -24(%rbp),%rbx
	mov %rbx, -16(%rbp)
	jmp .L14
.L13:
.L14:
	leaq -24(%rbp), %rbx
	mov (%rbx), %r10
	mov %r10, %r11
	add $1, %r10
	mov %r10, (%rbx)
	jmp .L9
.L10:
	movq -16(%rbp),%rbx
	movq -8(%rbp),%r10
	cmp %r10, %rbx
	jne .L19
	mov $0, %rbx
	jmp .L20
.L19:
	mov $1, %rbx
.L20:
	cmp $0, %rbx
	jz .L17
	leaq arr,%rbx
	movq -16(%rbp),%r10
	mov (%rbx,%r10,8), %r11
	movq %r11, -32(%rbp)
	leaq arr,%rbx
	movq -8(%rbp),%r10
	mov (%rbx,%r10,8), %r11
	leaq arr, %rbx
	movq -16(%rbp),%r10
	leaq (%rbx,%r10,8), %r10
	mov %r11, (%r10)
	movq -32(%rbp),%rbx
	leaq arr, %r10
	movq -8(%rbp),%r11
	leaq (%r10,%r11,8), %r11
	mov %rbx, (%r11)
	jmp .L18
.L17:
.L18:
	leaq -8(%rbp), %rbx
	mov (%rbx), %r10
	mov %r10, %r11
	add $1, %r10
	mov %r10, (%rbx)
	jmp .L5
.L6:
	movq $0,%rbx
	mov %rbx, -8(%rbp)
.L21:
	movq -8(%rbp),%rbx
	movq $8,%r10
	cmp %r10, %rbx
	jl .L23
	mov $0, %rbx
	jmp .L24
.L23:
	mov $1, %rbx
.L24:
	cmp $0, %rbx
	jz .L22
	leaq arr,%rbx
	movq -8(%rbp),%r10
	mov (%rbx,%r10,8), %r11
	pushq %r10
	pushq %r11
	mov %r11, %rdi
	call print_integer
	popq %r11
	popq %r10
.data
.S2:	.string ", "
.text
	leaq .S2,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	leaq -8(%rbp), %rbx
	mov (%rbx), %r10
	mov %r10, %r11
	add $1, %r10
	mov %r10, (%rbx)
	jmp .L21
.L22:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq  %rbp, %rsp
	popq %rbp
	ret
