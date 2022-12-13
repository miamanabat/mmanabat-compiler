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
	movq %rsp, %rbp

	subq $0, %rsp
	.data
.L0:
	.string "x > y should be true: "
.text
	movq $.L0, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x, %rbx
	movq y, %r10
	cmp %r10, %rbx
	jg .L1
	movq $0, %rbx
	jmp .L2
.L1:
	movq $1, %rbx
.L2:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L3:
	.string "\n"
.text
	movq $.L3, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L4:
	.string "x >= y should be true: "
.text
	movq $.L4, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x, %rbx
	movq y, %r10
	cmp %r10, %rbx
	jge .L5
	movq $0, %rbx
	jmp .L6
.L5:
	movq $1, %rbx
.L6:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L7:
	.string "\n"
.text
	movq $.L7, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L8:
	.string "x < y should be false: "
.text
	movq $.L8, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x, %rbx
	movq y, %r10
	cmp %r10, %rbx
	jl .L9
	movq $0, %rbx
	jmp .L10
.L9:
	movq $1, %rbx
.L10:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L11:
	.string "\n"
.text
	movq $.L11, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L12:
	.string "x <= y should be false: "
.text
	movq $.L12, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x, %rbx
	movq y, %r10
	cmp %r10, %rbx
	jle .L13
	movq $0, %rbx
	jmp .L14
.L13:
	movq $1, %rbx
.L14:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L15:
	.string "\n"
.text
	movq $.L15, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L16:
	.string "x == y should be false: "
.text
	movq $.L16, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x, %rbx
	movq y, %r10
	cmp %r10, %rbx
	je .L17
	movq $0, %rbx
	jmp .L18
.L17:
	movq $1, %rbx
.L18:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L19:
	.string "\n"
.text
	movq $.L19, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L20:
	.string "x != y should be true: "
.text
	movq $.L20, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x, %rbx
	movq y, %r10
	cmp %r10, %rbx
	jne .L21
	movq $0, %rbx
	jmp .L22
.L21:
	movq $1, %rbx
.L22:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L23:
	.string "\n"
.text
	movq $.L23, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L24:
	.string "x > z should be false: "
.text
	movq $.L24, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x, %rbx
	movq z, %r10
	cmp %r10, %rbx
	jg .L25
	movq $0, %rbx
	jmp .L26
.L25:
	movq $1, %rbx
.L26:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L27:
	.string "\n"
.text
	movq $.L27, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L28:
	.string "x >= z should be true: "
.text
	movq $.L28, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x, %rbx
	movq z, %r10
	cmp %r10, %rbx
	jge .L29
	movq $0, %rbx
	jmp .L30
.L29:
	movq $1, %rbx
.L30:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L31:
	.string "\n"
.text
	movq $.L31, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L32:
	.string "x < z should be false: "
.text
	movq $.L32, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x, %rbx
	movq z, %r10
	cmp %r10, %rbx
	jl .L33
	movq $0, %rbx
	jmp .L34
.L33:
	movq $1, %rbx
.L34:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L35:
	.string "\n"
.text
	movq $.L35, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L36:
	.string "x <= z should be true: "
.text
	movq $.L36, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x, %rbx
	movq z, %r10
	cmp %r10, %rbx
	jle .L37
	movq $0, %rbx
	jmp .L38
.L37:
	movq $1, %rbx
.L38:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L39:
	.string "\n"
.text
	movq $.L39, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L40:
	.string "x == z should be true: "
.text
	movq $.L40, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x, %rbx
	movq z, %r10
	cmp %r10, %rbx
	je .L41
	movq $0, %rbx
	jmp .L42
.L41:
	movq $1, %rbx
.L42:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L43:
	.string "\n"
.text
	movq $.L43, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L44:
	.string "x != z should be false: "
.text
	movq $.L44, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq x, %rbx
	movq z, %r10
	cmp %r10, %rbx
	jne .L45
	movq $0, %rbx
	jmp .L46
.L45:
	movq $1, %rbx
.L46:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L47:
	.string "\n"
.text
	movq $.L47, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L48:
	.string "true == false should be false: "
.text
	movq $.L48, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq t, %rbx
	movq f, %r10
	cmp %r10, %rbx
	je .L49
	movq $0, %rbx
	jmp .L50
.L49:
	movq $1, %rbx
.L50:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L51:
	.string "\n"
.text
	movq $.L51, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L52:
	.string "true == true should be true: "
.text
	movq $.L52, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq t, %rbx
	movq t, %r10
	cmp %r10, %rbx
	je .L53
	movq $0, %rbx
	jmp .L54
.L53:
	movq $1, %rbx
.L54:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L55:
	.string "\n"
.text
	movq $.L55, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L56:
	.string "false == false should be true: "
.text
	movq $.L56, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq f, %rbx
	movq f, %r10
	cmp %r10, %rbx
	je .L57
	movq $0, %rbx
	jmp .L58
.L57:
	movq $1, %rbx
.L58:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L59:
	.string "\n"
.text
	movq $.L59, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L60:
	.string "true != false should be true: "
.text
	movq $.L60, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq t, %rbx
	movq f, %r10
	cmp %r10, %rbx
	jne .L61
	movq $0, %rbx
	jmp .L62
.L61:
	movq $1, %rbx
.L62:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L63:
	.string "\n"
.text
	movq $.L63, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L64:
	.string "true != true should be false: "
.text
	movq $.L64, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq t, %rbx
	movq t, %r10
	cmp %r10, %rbx
	jne .L65
	movq $0, %rbx
	jmp .L66
.L65:
	movq $1, %rbx
.L66:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L67:
	.string "\n"
.text
	movq $.L67, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L68:
	.string "false != false should be false: "
.text
	movq $.L68, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq f, %rbx
	movq f, %r10
	cmp %r10, %rbx
	jne .L69
	movq $0, %rbx
	jmp .L70
.L69:
	movq $1, %rbx
.L70:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L71:
	.string "\n"
.text
	movq $.L71, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L72:
	.string "a == b should be false: "
.text
	movq $.L72, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq a, %rbx
	movq b, %r10
	cmp %r10, %rbx
	je .L73
	movq $0, %rbx
	jmp .L74
.L73:
	movq $1, %rbx
.L74:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L75:
	.string "\n"
.text
	movq $.L75, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L76:
	.string "a != b should be true: "
.text
	movq $.L76, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq a, %rbx
	movq b, %r10
	cmp %r10, %rbx
	jne .L77
	movq $0, %rbx
	jmp .L78
.L77:
	movq $1, %rbx
.L78:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L79:
	.string "\n"
.text
	movq $.L79, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L80:
	.string "a == c should be true: "
.text
	movq $.L80, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq a, %rbx
	movq c, %r10
	cmp %r10, %rbx
	je .L81
	movq $0, %rbx
	jmp .L82
.L81:
	movq $1, %rbx
.L82:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L83:
	.string "\n"
.text
	movq $.L83, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	.data
.L84:
	.string "a != c should be false: "
.text
	movq $.L84, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	movq a, %rbx
	movq c, %r10
	cmp %r10, %rbx
	jne .L85
	movq $0, %rbx
	jmp .L86
.L85:
	movq $1, %rbx
.L86:
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_boolean
	popq %r11
	popq %r10
	.data
.L87:
	.string "\n"
.text
	movq $.L87, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
.main_epilogue:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
