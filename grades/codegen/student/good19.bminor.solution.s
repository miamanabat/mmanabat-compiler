.data

.global fd
fd:
.global fgets
.global fopen
.global strcmp
.text

.global main
main:
	pushq %rbp
	movq  %rsp, %rbp
	subq $24,%rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
.data
.S0:	.string "buffer"
.text
	leaq .S0,%rbx
	movq %rbx, -8(%rbp)
.data
.S1:	.string "test1.txt"
.text
	leaq .S1,%rbx
.data
.S2:	.string "r"
.text
	leaq .S2,%r10
	mov %rbx, %rdi
	mov %r10, %rsi
	pushq %r10
	pushq %r11
	call fopen
	popq %r11
	popq %r10
	movq %rax, %rbx
	movq %rbx, -16(%rbp)
	movq -8(%rbp),%rbx
	movq $4096,%r10
	movq -16(%rbp),%r11
	mov %rbx, %rdi
	mov %r10, %rsi
	mov %r11, %rdx
	pushq %r10
	pushq %r11
	call fgets
	popq %r11
	popq %r10
	movq %rax, %rbx
	movq %rbx, -24(%rbp)
.L1:
	movq -24(%rbp),%rbx
	movq $0,%r10
	cmp %r10, %rbx
	jne .L3
	mov $0, %rbx
	jmp .L4
.L3:
	mov $1, %rbx
.L4:
	cmp $0, %rbx
	jz .L2
	movq -8(%rbp),%rbx
.data
.S3:	.string "fd:integer;\n"
.text
	leaq .S3,%r10
	mov %rbx, %rdi
	mov %r10, %rsi
	pushq %r10
	pushq %r11
	call strcmp
	popq %r11
	popq %r10
	movq %rax, %rbx
	movq $0,%r10
	cmp %r10, %rbx
	je .L7
	mov $0, %rbx
	jmp .L8
.L7:
	mov $1, %rbx
.L8:
	cmp $0, %rbx
	jz .L5
.data
.S4:	.string "yes!\n"
.text
	leaq .S4,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L6
.L5:
.L6:
	movq -8(%rbp),%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -8(%rbp),%rbx
	movq $4096,%r10
	movq -16(%rbp),%r11
	mov %rbx, %rdi
	mov %r10, %rsi
	mov %r11, %rdx
	pushq %r10
	pushq %r11
	call fgets
	popq %r11
	popq %r10
	movq %rax, %rbx
	mov %rbx, -24(%rbp)
	jmp .L1
.L2:
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
