.data
.global str
str:
.quad .L0
.data
.global .L0
.L0:
.string "hello"
.data
.global str2
str2:
.quad .L1
.data
.global .L1
.L1:
.string "hello"
.data
.global str3
str3:
.quad .L2
.data
.global .L2
.L2:
.string "world"
.data
.global str4
str4:
.quad 0
.text
.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $16, %rsp
	movq str4, %r10
	.data
.L3:
	.string "hello"
.text
	movq $.L3, %r11
	movq %r11, str4
	.data
.L4:
	.string "hello"
.text
	movq $.L4, %rbx
	movq %rbx, -8(%rbp)
	.data
.L5:
	.string "world"
.text
	movq $.L5, %rbx
	movq %rbx, -16(%rbp)
# if statement!
	pushq %r10
	pushq %r11
	movq str, %rbx
	movq %rbx, %rdi
	.data
.L8:
	.string "hello"
.text
	movq $.L8, %rbx
	movq %rbx, %rsi
	call strcmp
	popq %r11
	popq %r10
	cmp $0, %rax
	je .L9
	movq $0, %rbx
	jmp .L10
.L9:
	movq $1, %rbx
.L10:
	cmp $0, %rbx
	je .L6
	.data
.L11:
	.string "should be printed\n"
.text
	movq $.L11, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L7
# else body
.L6:
	.data
.L12:
	.string "should not be printed\n"
.text
	movq $.L12, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# done if statement
.L7:
# if statement!
	pushq %r10
	pushq %r11
	movq str, %rbx
	movq %rbx, %rdi
	.data
.L15:
	.string "hello"
.text
	movq $.L15, %rbx
	movq %rbx, %rsi
	call strcmp
	popq %r11
	popq %r10
	cmp $0, %rax
	jne .L16
	movq $0, %rbx
	jmp .L17
.L16:
	movq $1, %rbx
.L17:
	cmp $0, %rbx
	je .L13
	.data
.L18:
	.string "should not be printed\n"
.text
	movq $.L18, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L14
# else body
.L13:
	.data
.L19:
	.string "should be printed\n"
.text
	movq $.L19, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# done if statement
.L14:
# if statement!
	pushq %r10
	pushq %r11
	movq str, %rbx
	movq %rbx, %rdi
	.data
.L22:
	.string "world"
.text
	movq $.L22, %rbx
	movq %rbx, %rsi
	call strcmp
	popq %r11
	popq %r10
	cmp $0, %rax
	je .L23
	movq $0, %rbx
	jmp .L24
.L23:
	movq $1, %rbx
.L24:
	cmp $0, %rbx
	je .L20
	.data
.L25:
	.string "should not be printed\n"
.text
	movq $.L25, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L21
# else body
.L20:
	.data
.L26:
	.string "should be printed\n"
.text
	movq $.L26, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# done if statement
.L21:
# if statement!
	pushq %r10
	pushq %r11
	movq str, %rbx
	movq %rbx, %rdi
	.data
.L29:
	.string "world"
.text
	movq $.L29, %rbx
	movq %rbx, %rsi
	call strcmp
	popq %r11
	popq %r10
	cmp $0, %rax
	jne .L30
	movq $0, %rbx
	jmp .L31
.L30:
	movq $1, %rbx
.L31:
	cmp $0, %rbx
	je .L27
	.data
.L32:
	.string "should be printed\n"
.text
	movq $.L32, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L28
# else body
.L27:
	.data
.L33:
	.string "should not be printed\n"
.text
	movq $.L33, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# done if statement
.L28:
# if statement!
	pushq %r10
	pushq %r11
	movq str, %rbx
	movq %rbx, %rdi
	movq str2, %rbx
	movq %rbx, %rsi
	call strcmp
	popq %r11
	popq %r10
	cmp $0, %rax
	je .L36
	movq $0, %rbx
	jmp .L37
.L36:
	movq $1, %rbx
.L37:
	cmp $0, %rbx
	je .L34
	.data
.L38:
	.string "should be printed\n"
.text
	movq $.L38, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L35
# else body
.L34:
	.data
.L39:
	.string "should not be printed"
.text
	movq $.L39, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# done if statement
.L35:
# if statement!
	pushq %r10
	pushq %r11
	movq str, %rbx
	movq %rbx, %rdi
	movq str2, %rbx
	movq %rbx, %rsi
	call strcmp
	popq %r11
	popq %r10
	cmp $0, %rax
	jne .L42
	movq $0, %rbx
	jmp .L43
.L42:
	movq $1, %rbx
.L43:
	cmp $0, %rbx
	je .L40
	.data
.L44:
	.string "should not be printed\n"
.text
	movq $.L44, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L41
# else body
.L40:
	.data
.L45:
	.string "should be printed\n"
.text
	movq $.L45, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# done if statement
.L41:
# if statement!
	pushq %r10
	pushq %r11
	movq str, %rbx
	movq %rbx, %rdi
	movq str3, %rbx
	movq %rbx, %rsi
	call strcmp
	popq %r11
	popq %r10
	cmp $0, %rax
	jne .L48
	movq $0, %rbx
	jmp .L49
.L48:
	movq $1, %rbx
.L49:
	cmp $0, %rbx
	je .L46
	.data
.L50:
	.string "should be printed\n"
.text
	movq $.L50, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L47
# else body
.L46:
	.data
.L51:
	.string "should not be printed"
.text
	movq $.L51, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# done if statement
.L47:
# if statement!
	pushq %r10
	pushq %r11
	movq str, %rbx
	movq %rbx, %rdi
	movq str3, %rbx
	movq %rbx, %rsi
	call strcmp
	popq %r11
	popq %r10
	cmp $0, %rax
	je .L54
	movq $0, %rbx
	jmp .L55
.L54:
	movq $1, %rbx
.L55:
	cmp $0, %rbx
	je .L52
	.data
.L56:
	.string "should not be printed\n"
.text
	movq $.L56, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L53
# else body
.L52:
	.data
.L57:
	.string "should be printed\n"
.text
	movq $.L57, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# done if statement
.L53:
# if statement!
	pushq %r10
	pushq %r11
	movq str, %rbx
	movq %rbx, %rdi
	movq -8(%rbp), %rbx
	movq %rbx, %rsi
	call strcmp
	popq %r11
	popq %r10
	cmp $0, %rax
	je .L60
	movq $0, %rbx
	jmp .L61
.L60:
	movq $1, %rbx
.L61:
	cmp $0, %rbx
	je .L58
	.data
.L62:
	.string "should be printed\n"
.text
	movq $.L62, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L59
# else body
.L58:
	.data
.L63:
	.string "should not be printed\n"
.text
	movq $.L63, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# done if statement
.L59:
# if statement!
	pushq %r10
	pushq %r11
	movq str, %rbx
	movq %rbx, %rdi
	movq -8(%rbp), %rbx
	movq %rbx, %rsi
	call strcmp
	popq %r11
	popq %r10
	cmp $0, %rax
	jne .L66
	movq $0, %rbx
	jmp .L67
.L66:
	movq $1, %rbx
.L67:
	cmp $0, %rbx
	je .L64
	.data
.L68:
	.string "should not be printed\n"
.text
	movq $.L68, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L65
# else body
.L64:
	.data
.L69:
	.string "should be printed\n"
.text
	movq $.L69, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# done if statement
.L65:
# if statement!
	pushq %r10
	pushq %r11
	movq str, %rbx
	movq %rbx, %rdi
	movq -16(%rbp), %rbx
	movq %rbx, %rsi
	call strcmp
	popq %r11
	popq %r10
	cmp $0, %rax
	je .L72
	movq $0, %rbx
	jmp .L73
.L72:
	movq $1, %rbx
.L73:
	cmp $0, %rbx
	je .L70
	.data
.L74:
	.string "should not be printed\n"
.text
	movq $.L74, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L71
# else body
.L70:
	.data
.L75:
	.string "should be printed\n"
.text
	movq $.L75, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# done if statement
.L71:
# if statement!
	pushq %r10
	pushq %r11
	movq str, %rbx
	movq %rbx, %rdi
	movq -16(%rbp), %rbx
	movq %rbx, %rsi
	call strcmp
	popq %r11
	popq %r10
	cmp $0, %rax
	jne .L78
	movq $0, %rbx
	jmp .L79
.L78:
	movq $1, %rbx
.L79:
	cmp $0, %rbx
	je .L76
	.data
.L80:
	.string "should be printed\n"
.text
	movq $.L80, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
	jmp .L77
# else body
.L76:
	.data
.L81:
	.string "should not be printed\n"
.text
	movq $.L81, %rbx
	pushq %r10
	pushq %r11
	movq %rbx, %rdi
	call print_string
	popq %r11
	popq %r10
# done if statement
.L77:
.main_epilogue:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
