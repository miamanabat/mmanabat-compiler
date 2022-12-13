.data

.global x
x:
	.quad 5
.data

.global y
y:
	.quad 4
.data

.global z
z:
	.quad 5
.data

.global a
a:
	.quad 97
.data

.global b
b:
	.quad 98
.data

.global c
c:
	.quad 97
.data

.global t
t:
	.quad 1
.data

.global f
f:
	.quad 0
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
.S0:	.string "x > y should be true: "
.text
	leaq .S0,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x,%rbx
	movq y,%r10
	cmp %r10, %rbx
	jg .L1
	mov $0, %rbx
	jmp .L2
.L1:
	mov $1, %rbx
.L2:
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
.data
.S2:	.string "x >= y should be true: "
.text
	leaq .S2,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x,%rbx
	movq y,%r10
	cmp %r10, %rbx
	jge .L3
	mov $0, %rbx
	jmp .L4
.L3:
	mov $1, %rbx
.L4:
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
.data
.S4:	.string "x < y should be false: "
.text
	leaq .S4,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x,%rbx
	movq y,%r10
	cmp %r10, %rbx
	jl .L5
	mov $0, %rbx
	jmp .L6
.L5:
	mov $1, %rbx
.L6:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S5:	.string "\n"
.text
	leaq .S5,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S6:	.string "x <= y should be false: "
.text
	leaq .S6,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x,%rbx
	movq y,%r10
	cmp %r10, %rbx
	jle .L7
	mov $0, %rbx
	jmp .L8
.L7:
	mov $1, %rbx
.L8:
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
.data
.S8:	.string "x == y should be false: "
.text
	leaq .S8,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x,%rbx
	movq y,%r10
	cmp %r10, %rbx
	je .L9
	mov $0, %rbx
	jmp .L10
.L9:
	mov $1, %rbx
.L10:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S9:	.string "\n"
.text
	leaq .S9,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S10:	.string "x != y should be true: "
.text
	leaq .S10,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x,%rbx
	movq y,%r10
	cmp %r10, %rbx
	jne .L11
	mov $0, %rbx
	jmp .L12
.L11:
	mov $1, %rbx
.L12:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S11:	.string "\n"
.text
	leaq .S11,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S12:	.string "x > z should be false: "
.text
	leaq .S12,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x,%rbx
	movq z,%r10
	cmp %r10, %rbx
	jg .L13
	mov $0, %rbx
	jmp .L14
.L13:
	mov $1, %rbx
.L14:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S13:	.string "\n"
.text
	leaq .S13,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S14:	.string "x >= z should be true: "
.text
	leaq .S14,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x,%rbx
	movq z,%r10
	cmp %r10, %rbx
	jge .L15
	mov $0, %rbx
	jmp .L16
.L15:
	mov $1, %rbx
.L16:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S15:	.string "\n"
.text
	leaq .S15,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S16:	.string "x < z should be false: "
.text
	leaq .S16,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x,%rbx
	movq z,%r10
	cmp %r10, %rbx
	jl .L17
	mov $0, %rbx
	jmp .L18
.L17:
	mov $1, %rbx
.L18:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S17:	.string "\n"
.text
	leaq .S17,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S18:	.string "x <= z should be true: "
.text
	leaq .S18,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x,%rbx
	movq z,%r10
	cmp %r10, %rbx
	jle .L19
	mov $0, %rbx
	jmp .L20
.L19:
	mov $1, %rbx
.L20:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S19:	.string "\n"
.text
	leaq .S19,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S20:	.string "x == z should be true: "
.text
	leaq .S20,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x,%rbx
	movq z,%r10
	cmp %r10, %rbx
	je .L21
	mov $0, %rbx
	jmp .L22
.L21:
	mov $1, %rbx
.L22:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S21:	.string "\n"
.text
	leaq .S21,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S22:	.string "x != z should be false: "
.text
	leaq .S22,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x,%rbx
	movq z,%r10
	cmp %r10, %rbx
	jne .L23
	mov $0, %rbx
	jmp .L24
.L23:
	mov $1, %rbx
.L24:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S23:	.string "\n"
.text
	leaq .S23,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S24:	.string "true == false should be false: "
.text
	leaq .S24,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq t,%rbx
	movq f,%r10
	cmp %r10, %rbx
	je .L25
	mov $0, %rbx
	jmp .L26
.L25:
	mov $1, %rbx
.L26:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S25:	.string "\n"
.text
	leaq .S25,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S26:	.string "true == true should be true: "
.text
	leaq .S26,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq t,%rbx
	movq t,%r10
	cmp %r10, %rbx
	je .L27
	mov $0, %rbx
	jmp .L28
.L27:
	mov $1, %rbx
.L28:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S27:	.string "\n"
.text
	leaq .S27,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S28:	.string "false == false should be true: "
.text
	leaq .S28,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq f,%rbx
	movq f,%r10
	cmp %r10, %rbx
	je .L29
	mov $0, %rbx
	jmp .L30
.L29:
	mov $1, %rbx
.L30:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S29:	.string "\n"
.text
	leaq .S29,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S30:	.string "true != false should be true: "
.text
	leaq .S30,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq t,%rbx
	movq f,%r10
	cmp %r10, %rbx
	jne .L31
	mov $0, %rbx
	jmp .L32
.L31:
	mov $1, %rbx
.L32:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S31:	.string "\n"
.text
	leaq .S31,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S32:	.string "true != true should be false: "
.text
	leaq .S32,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq t,%rbx
	movq t,%r10
	cmp %r10, %rbx
	jne .L33
	mov $0, %rbx
	jmp .L34
.L33:
	mov $1, %rbx
.L34:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S33:	.string "\n"
.text
	leaq .S33,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S34:	.string "false != false should be false: "
.text
	leaq .S34,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq f,%rbx
	movq f,%r10
	cmp %r10, %rbx
	jne .L35
	mov $0, %rbx
	jmp .L36
.L35:
	mov $1, %rbx
.L36:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S35:	.string "\n"
.text
	leaq .S35,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S36:	.string "a == b should be false: "
.text
	leaq .S36,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq a,%rbx
	movq b,%r10
	cmp %r10, %rbx
	je .L37
	mov $0, %rbx
	jmp .L38
.L37:
	mov $1, %rbx
.L38:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S37:	.string "\n"
.text
	leaq .S37,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S38:	.string "a != b should be true: "
.text
	leaq .S38,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq a,%rbx
	movq b,%r10
	cmp %r10, %rbx
	jne .L39
	mov $0, %rbx
	jmp .L40
.L39:
	mov $1, %rbx
.L40:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S39:	.string "\n"
.text
	leaq .S39,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S40:	.string "a == c should be true: "
.text
	leaq .S40,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq a,%rbx
	movq c,%r10
	cmp %r10, %rbx
	je .L41
	mov $0, %rbx
	jmp .L42
.L41:
	mov $1, %rbx
.L42:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S41:	.string "\n"
.text
	leaq .S41,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.data
.S42:	.string "a != c should be false: "
.text
	leaq .S42,%rbx
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq a,%rbx
	movq c,%r10
	cmp %r10, %rbx
	jne .L43
	mov $0, %rbx
	jmp .L44
.L43:
	mov $1, %rbx
.L44:
	pushq %r10
	pushq %r11
	mov %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
.data
.S43:	.string "\n"
.text
	leaq .S43,%rbx
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
