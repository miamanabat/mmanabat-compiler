.data

.global i
i:
	.quad 1
.data

.global a
a:
	.quad 104
.data

.global b
b:
.text

.global f_char
f_char:
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
	call print_character
	popq %r11
	popq %r10
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
	movq -8(%rbp),%rbx
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

.global f_bool
f_bool:
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
	call print_boolean
	popq %r11
	popq %r10
.data
.S1:	.string "\n"
.text
	leaq .S1,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq -8(%rbp),%rbx
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
	subq $24,%rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
	movq a,%rbx
	mov %rbx, b
	movq $98,%rbx
	movq %rbx, -8(%rbp)
	movq $0,%rbx
	movq %rbx, -16(%rbp)
.data
.S2:	.string "testing function calls with global, literal, local, and reassigned strings: \n"
.text
	leaq .S2,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq a,%rbx
	mov %rbx, %rdi
	pushq %r10
	pushq %r11
	call f_char
	popq %r11
	popq %r10
	movq %rax, %rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_character
	popq %r11
	popq %r10
	movq b,%rbx
	mov %rbx, %rdi
	pushq %r10
	pushq %r11
	call f_char
	popq %r11
	popq %r10
	movq %rax, %rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_character
	popq %r11
	popq %r10
	movq -8(%rbp),%rbx
	mov %rbx, %rdi
	pushq %r10
	pushq %r11
	call f_char
	popq %r11
	popq %r10
	movq %rax, %rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_character
	popq %r11
	popq %r10
	movq i,%rbx
	mov %rbx, %rdi
	pushq %r10
	pushq %r11
	call f_bool
	popq %r11
	popq %r10
	movq %rax, %rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	movq $1,%rbx
	mov %rbx, %rdi
	pushq %r10
	pushq %r11
	call f_bool
	popq %r11
	popq %r10
	movq %rax, %rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	movq $0,%rbx
	mov %rbx, %rdi
	pushq %r10
	pushq %r11
	call f_bool
	popq %r11
	popq %r10
	movq %rax, %rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	movq -16(%rbp),%rbx
	mov %rbx, %rdi
	pushq %r10
	pushq %r11
	call f_bool
	popq %r11
	popq %r10
	movq %rax, %rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
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
	movq $9,%rbx
	movq %rbx, -24(%rbp)
	movq -24(%rbp),%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_character
	popq %r11
	popq %r10
	movq $10,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_character
	popq %r11
	popq %r10
	movq $9,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_character
	popq %r11
	popq %r10
	movq $63,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_character
	popq %r11
	popq %r10
	movq $92,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_character
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
