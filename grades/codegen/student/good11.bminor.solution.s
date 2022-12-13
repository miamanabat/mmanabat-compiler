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
	movq $1,%rbx
	movq $0,%r10
	and %rbx, %r10
	cmp $0, %r10
	jz .L1
.data
.S0:	.string "should not be printed\n"
.text
	leaq .S0,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L2
.L1:
	movq $1,%rbx
	movq $0,%r10
	or %rbx, %r10
	cmp $0, %r10
	jz .L3
.data
.S1:	.string "should be printed\n"
.text
	leaq .S1,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L4
.L3:
.data
.S2:	.string "should not be printed\n"
.text
	leaq .S2,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.L4:
.L2:
	movq $1,%rbx
	not %rbx
	cmp $0, %rbx
	jz .L5
.data
.S3:	.string "should not be printed\n"
.text
	leaq .S3,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L6
.L5:
	movq $0,%rbx
	not %rbx
	cmp $0, %rbx
	jz .L7
.data
.S4:	.string "should be printed\n"
.text
	leaq .S4,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L8
.L7:
.data
.S5:	.string "should not be printed\n"
.text
	leaq .S5,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.L8:
.L6:
	movq $1,%rbx
	cmp $0, %rbx
	jz .L9
	movq $1,%rbx
	cmp $0, %rbx
	jz .L11
.data
.S6:	.string "should be printed\n"
.text
	leaq .S6,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L12
.L11:
.data
.S7:	.string "should not be printed\n"
.text
	leaq .S7,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.L12:
	jmp .L10
.L9:
.L10:
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
