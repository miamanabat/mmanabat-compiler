.data

.global x
x:
	.quad 5
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
.data
.S0:	.string "true: "
.text
	leaq .S0,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1,%rbx
	movq $1,%r10
	and %rbx, %r10
	pushq %r10
	pushq %r11
	mov %r10, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S1:	.string " false: "
.text
	leaq .S1,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1,%rbx
	movq $0,%r10
	and %rbx, %r10
	pushq %r10
	pushq %r11
	mov %r10, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S2:	.string ", true: "
.text
	leaq .S2,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1,%rbx
	movq $0,%r10
	or %rbx, %r10
	pushq %r10
	pushq %r11
	mov %r10, %rdi
	call print_boolean
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
.data
.S4:	.string "false: "
.text
	leaq .S4,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1,%rbx
	not %rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S5:	.string ", false: "
.text
	leaq .S5,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1,%rbx
	not %rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S6:	.string ", true: "
.text
	leaq .S6,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq $1,%rbx
	not %rbx
	not %rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S7:	.string "\n"
.text
	leaq .S7,%rbx
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
