.data

.global arr
arr:
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
.data

.global arr2
arr2:
	.quad 1
	.quad 2
	.quad 3
	.quad 4
	.quad 5
	.quad 6
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
.data
.S0:	.string "should be 000000, 123456:\n"
.text
	leaq .S0,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $0,%rbx
	movq %rbx, -8(%rbp)
	movq $0,%rbx
	mov %rbx, -8(%rbp)
.L1:
	movq -8(%rbp),%rbx
	movq $6,%r10
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
	leaq -8(%rbp), %rbx
	mov (%rbx), %r10
	mov %r10, %r11
	add $1, %r10
	mov %r10, (%rbx)
	jmp .L1
.L2:
	movq $0,%rbx
	mov %rbx, -8(%rbp)
.L5:
	movq -8(%rbp),%rbx
	movq $6,%r10
	cmp %r10, %rbx
	jl .L7
	mov $0, %rbx
	jmp .L8
.L7:
	mov $1, %rbx
.L8:
	cmp $0, %rbx
	jz .L6
	leaq arr2,%rbx
	movq -8(%rbp),%r10
	mov (%rbx,%r10,8), %r11
	pushq %r10
	pushq %r11
	mov %r11, %rdi
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
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq  %rbp, %rsp
	popq %rbp
	ret
