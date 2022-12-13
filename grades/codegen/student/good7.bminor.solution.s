.data

.global x
x:
	.quad 5
.data

.global y
y:
	.quad 1
.text

.global nothing
nothing:
	pushq %rbp
	movq  %rsp, %rbp
	subq $0,%rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
.data
.S0:	.string "hey no args worked\n"
.text
	leaq .S0,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1,%rbx
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

.global onearg
onearg:
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
.data
.S1:	.string "yay one arg worked\n"
.text
	leaq .S1,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1,%rbx
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

.global multargs
multargs:
	pushq %rbp
	movq  %rsp, %rbp
	pushq %rdi
	pushq %rsi
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
	movq -16(%rbp),%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S2:	.string "yay two args worked\n"
.text
	leaq .S2,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1,%rbx
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
	subq $0,%rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
	pushq %r10
	pushq %r11
	call nothing
	popq %r11
	popq %r10
	movq %rax, %rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	movq $2,%rbx
	mov %rbx, %rdi
	pushq %r10
	pushq %r11
	call onearg
	popq %r11
	popq %r10
	movq %rax, %rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	movq $2,%rbx
	movq $1,%r10
	mov %rbx, %rdi
	mov %r10, %rsi
	pushq %r10
	pushq %r11
	call multargs
	popq %r11
	popq %r10
	movq %rax, %rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
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
