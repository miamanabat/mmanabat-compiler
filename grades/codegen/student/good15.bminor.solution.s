.data

.global x
x:
	.quad 1
.data

.global a
a:
	.quad 1
	.quad 2
	.quad 3
	.quad 4
.data

.global b
b:
	.quad 1
.data

.global c
c:
	.quad 99
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
	movq x,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_integer
	popq %r11
	popq %r10
	leaq a,%rbx
	movq $1,%r10
	mov (%rbx,%r10,8), %r11
	pushq %r10
	pushq %r11
	mov %r11, %rdi
	call print_integer
	popq %r11
	popq %r10
	movq b,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	movq c,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_character
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
