	.file	"test4.c"
	.text
	.p2align 4
	.type	adjust_limbs.constprop.0, @function
adjust_limbs.constprop.0:
.LFB6651:
	.cfi_startproc
	movq	8(%rdi), %rsi
	movq	(%rdi), %rdx
	movabsq	$-4294967296, %r11
	movq	%rsi, %rax
	movl	%edx, %ecx
	shrq	$32, %rax
	leal	(%rax,%rdx), %r8d
	movl	%esi, %eax
	movq	%r8, %r10
	subq	%rcx, %r10
	shrq	$63, %r10
	salq	$32, %r10
	addq	%rdx, %r10
	movq	16(%rdi), %rdx
	andq	%r11, %r10
	movq	%rdx, %r9
	orq	%r8, %r10
	shrq	$32, %r9
	leal	(%r9,%rsi), %ecx
	movq	%rcx, %rsi
	subq	%rax, %rsi
	shrq	$63, %rsi
	addq	%rsi, %r10
	movq	%r10, (%rdi)
	movq	24(%rdi), %r10
	movq	%r10, %r8
	shrq	$32, %r8
	leal	(%r8,%rdx), %r9d
	movl	%edx, %edx
	movq	%r9, %rax
	subq	%rdx, %rax
	shrq	$63, %rax
	addq	%rcx, %rax
	movq	32(%rdi), %rcx
	salq	$32, %rax
	movq	%rcx, %rsi
	orq	%r9, %rax
	shrq	$32, %rsi
	leal	(%rsi,%r10), %r9d
	movq	40(%rdi), %rsi
	movl	%r10d, %r10d
	movq	%r9, %r8
	subq	%r10, %r8
	movq	%rsi, %rdx
	shrq	$63, %r8
	shrq	$32, %rdx
	leal	(%rdx,%rcx), %r10d
	addq	%r8, %rax
	movl	%ecx, %ecx
	movq	48(%rdi), %rdx
	movq	%rax, 8(%rdi)
	movq	%r10, %rax
	movl	%esi, %r8d
	subq	%rcx, %rax
	movq	56(%rdi), %rcx
	shrq	$63, %rax
	addq	%r9, %rax
	movq	%rdx, %r9
	shrq	$32, %r9
	salq	$32, %rax
	orq	%r10, %rax
	leal	(%r9,%rsi), %r10d
	movq	%r10, %rsi
	subq	%r8, %rsi
	shrq	$63, %rsi
	addq	%rsi, %rax
	movq	%rax, 16(%rdi)
	movq	%rcx, %rax
	shrq	$32, %rax
	leal	(%rax,%rdx), %r9d
	movl	%edx, %edx
	movq	%r9, %rax
	subq	%rdx, %rax
	shrq	$63, %rax
	addq	%r10, %rax
	movq	64(%rdi), %r10
	salq	$32, %rax
	movq	%r10, %r8
	orq	%r9, %rax
	shrq	$32, %r8
	leal	(%r8,%rcx), %r9d
	movl	%ecx, %ecx
	movq	%r9, %rsi
	subq	%rcx, %rsi
	movq	72(%rdi), %rcx
	shrq	$63, %rsi
	movq	%rcx, %rdx
	addq	%rsi, %rax
	shrq	$32, %rdx
	movq	%rax, 24(%rdi)
	leal	(%rdx,%r10), %r8d
	movl	%r10d, %r10d
	movq	80(%rdi), %rdx
	movq	%r8, %rax
	subq	%r10, %rax
	shrq	$63, %rax
	addq	%r9, %rax
	movq	%rdx, %r9
	shrq	$32, %r9
	salq	$32, %rax
	leal	(%r9,%rcx), %r10d
	movl	%ecx, %ecx
	orq	%r8, %rax
	movq	%r10, %rsi
	subq	%rcx, %rsi
	movq	88(%rdi), %rcx
	shrq	$63, %rsi
	movq	%rcx, %r8
	addq	%rsi, %rax
	shrq	$32, %r8
	movq	%rax, 32(%rdi)
	leal	(%r8,%rdx), %r9d
	movl	%edx, %edx
	movq	%r9, %rax
	subq	%rdx, %rax
	shrq	$63, %rax
	addq	%r10, %rax
	movq	96(%rdi), %r10
	salq	$32, %rax
	movq	%r10, %rsi
	orq	%r9, %rax
	shrq	$32, %rsi
	leal	(%rsi,%rcx), %r9d
	movl	%ecx, %ecx
	movq	%r9, %r8
	subq	%rcx, %r8
	movq	104(%rdi), %rcx
	shrq	$63, %r8
	movq	%rcx, %rdx
	addq	%r8, %rax
	shrq	$32, %rdx
	movq	%rax, 40(%rdi)
	movl	%r10d, %eax
	leal	(%rdx,%r10), %esi
	movq	112(%rdi), %rdx
	movq	%rsi, %r10
	subq	%rax, %r10
	shrq	$63, %r10
	addq	%r9, %r10
	movq	%rdx, %r9
	shrq	$32, %r9
	salq	$32, %r10
	addl	%ecx, %r9d
	movl	%ecx, %ecx
	orq	%rsi, %r10
	movl	%edx, %esi
	movl	%r9d, %eax
	movq	%rax, %r8
	subq	%rcx, %r8
	shrq	$63, %r8
	addq	%r8, %r10
	movq	%r10, 48(%rdi)
	movl	%edx, %r10d
	addl	124(%rdi), %r10d
	movq	%r10, %rdx
	subq	%rsi, %rdx
	shrq	$63, %rdx
	addq	%rdx, %rax
	salq	$32, %rdx
	salq	$32, %rax
	orq	%r10, %rax
	subq	%rdx, %rax
	andq	%r11, %rax
	orq	%rsi, %rax
	movq	%rax, 56(%rdi)
	ret
	.cfi_endproc
.LFE6651:
	.size	adjust_limbs.constprop.0, .-adjust_limbs.constprop.0
	.p2align 4
	.type	add_limbs.constprop.0.isra.0, @function
add_limbs.constprop.0.isra.0:
.LFB6653:
	.cfi_startproc
	movq	16(%rdi), %rax
	movq	32(%rdi), %rdx
	addq	%rax, 8(%rdi)
	movq	56(%rdi), %rcx
	addq	24(%rdi), %rdx
	movq	88(%rdi), %rsi
	addq	40(%rdi), %rdx
	addq	48(%rdi), %rcx
	addq	64(%rdi), %rcx
	addq	72(%rdi), %rcx
	movq	%rdx, 16(%rdi)
	addq	80(%rdi), %rsi
	addq	96(%rdi), %rsi
	movq	%rcx, 24(%rdi)
	addq	104(%rdi), %rsi
	addq	112(%rdi), %rsi
	movq	%rsi, 32(%rdi)
	movq	128(%rdi), %r8
	addq	120(%rdi), %r8
	addq	136(%rdi), %r8
	addq	144(%rdi), %r8
	movq	176(%rdi), %r9
	addq	152(%rdi), %r8
	addq	160(%rdi), %r8
	addq	168(%rdi), %r9
	addq	184(%rdi), %r9
	movq	%r8, 40(%rdi)
	addq	192(%rdi), %r9
	addq	200(%rdi), %r9
	addq	208(%rdi), %r9
	addq	216(%rdi), %r9
	movq	232(%rdi), %r10
	movq	%r9, 48(%rdi)
	addq	224(%rdi), %r10
	addq	240(%rdi), %r10
	addq	248(%rdi), %r10
	addq	256(%rdi), %r10
	addq	264(%rdi), %r10
	addq	272(%rdi), %r10
	movq	296(%rdi), %r11
	addq	280(%rdi), %r10
	movq	352(%rdi), %rax
	addq	288(%rdi), %r11
	movq	%r10, 56(%rdi)
	addq	304(%rdi), %r11
	addq	312(%rdi), %r11
	addq	320(%rdi), %r11
	addq	328(%rdi), %r11
	addq	336(%rdi), %r11
	addq	344(%rdi), %rax
	addq	360(%rdi), %rax
	addq	368(%rdi), %rax
	movq	%r11, 64(%rdi)
	addq	376(%rdi), %rax
	addq	384(%rdi), %rax
	movq	%rax, 72(%rdi)
	movq	400(%rdi), %rdx
	addq	392(%rdi), %rdx
	movq	440(%rdi), %rcx
	movq	472(%rdi), %rsi
	addq	408(%rdi), %rdx
	vmovdqu	488(%rdi), %xmm0
	addq	416(%rdi), %rdx
	addq	424(%rdi), %rdx
	addq	432(%rdi), %rcx
	vpsrldq	$8, %xmm0, %xmm1
	addq	448(%rdi), %rcx
	movq	%rdx, 80(%rdi)
	vpaddq	%xmm1, %xmm0, %xmm2
	addq	456(%rdi), %rcx
	vpinsrq	$1, 504(%rdi), %xmm2, %xmm3
	addq	464(%rdi), %rsi
	addq	480(%rdi), %rsi
	movq	%rcx, 88(%rdi)
	movq	%rsi, 96(%rdi)
	vmovdqu	%xmm3, 104(%rdi)
	ret
	.cfi_endproc
.LFE6653:
	.size	add_limbs.constprop.0.isra.0, .-add_limbs.constprop.0.isra.0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"/dev/urandom"
.LC1:
	.string	"Error opening /dev/urandom"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Error reading from /dev/urandom"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB3:
	.text
.LHOTB3:
	.p2align 4
	.globl	generate_seed
	.type	generate_seed, @function
generate_seed:
.LFB6600:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$1, %edi
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	leaq	16(%rsp), %rsi
	call	clock_gettime
	xorl	%edi, %edi
	leaq	32(%rsp), %rsi
	call	clock_gettime
	xorl	%esi, %esi
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	open
	cmpl	$-1, %eax
	je	.L7
	leaq	8(%rsp), %rsi
	movl	$8, %edx
	movl	%eax, %edi
	movl	%eax, %ebx
	call	read
	cmpq	$8, %rax
	jne	.L8
	movl	%ebx, %edi
	call	close
	call	getpid
	movl	$186, %edi
	movslq	%eax, %rbx
	xorl	%eax, %eax
	call	syscall
	movq	%rax, %rdx
	movq	24(%rsp), %rax
	xorq	40(%rsp), %rax
	xorq	8(%rsp), %rax
	movslq	%edx, %rcx
	addq	$48, %rsp
	.cfi_def_cfa_offset 16
	xorq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	xorq	%rcx, %rax
	ret
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	generate_seed.cold, @function
generate_seed.cold:
.LFSB6600:
.L7:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -16
	movl	$.LC1, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L8:
	movl	$.LC2, %edi
	call	perror
	movl	%ebx, %edi
	call	close
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6600:
	.text
	.size	generate_seed, .-generate_seed
	.section	.text.unlikely
	.size	generate_seed.cold, .-generate_seed.cold
.LCOLDE3:
	.text
.LHOTE3:
	.p2align 4
	.globl	trim_leading_zeros_and_whitespace
	.type	trim_leading_zeros_and_whitespace, @function
trim_leading_zeros_and_whitespace:
.LFB6601:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	__ctype_b_loc
	movq	(%rax), %rdx
	jmp	.L11
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L12:
	addq	$1, %rbx
.L11:
	movsbq	(%rbx), %rax
	cmpb	$48, %al
	je	.L12
	testb	$32, 1(%rdx,%rax,2)
	jne	.L12
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE6601:
	.size	trim_leading_zeros_and_whitespace, .-trim_leading_zeros_and_whitespace
	.p2align 4
	.globl	trim_trailing_newline
	.type	trim_trailing_newline, @function
trim_trailing_newline:
.LFB6602:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	strlen
	testq	%rax, %rax
	je	.L22
	leaq	-1(%rbx,%rax), %rax
	cmpb	$10, (%rax)
	je	.L24
.L22:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L24:
	.cfi_restore_state
	movb	$0, (%rax)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE6602:
	.size	trim_trailing_newline, .-trim_trailing_newline
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"The two sums are not equal, lengths are different"
	.align 8
.LC5:
	.string	"Length of result = %ld, length of result_gmp = %ld\n"
	.section	.rodata.str1.1
.LC6:
	.string	"result = %s\n result_gmp = %s\n"
.LC7:
	.string	"The two sums are not equal"
.LC8:
	.string	"Mismatch at index %ld\n"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"result[%ld] = %c, result_gmp[%ld] = %c\n"
	.section	.rodata.str1.1
.LC10:
	.string	"result = %s\nresult_gmp = %s\n"
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"The two subs are not equal, one is negative and the other is not"
	.text
	.p2align 4
	.globl	check_result
	.type	check_result, @function
check_result:
.LFB6603:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movzbl	(%rdi), %ebx
	movzbl	(%rsi), %ebp
	cmpb	$45, %bl
	sete	%al
	xorl	%edx, %edx
	cmpb	$45, %bpl
	sete	%dl
	leaq	(%rdi,%rax), %r12
	leaq	(%rsi,%rdx), %r13
	call	__ctype_b_loc
	movq	(%rax), %rax
	jmp	.L28
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L29:
	addq	$1, %r12
.L28:
	movsbq	(%r12), %rcx
	cmpb	$48, %cl
	je	.L29
	testb	$32, 1(%rax,%rcx,2)
	jne	.L29
	movsbq	0(%r13), %rsi
	cmpb	$48, %sil
	jne	.L103
	.p2align 4
	.p2align 4
	.p2align 3
.L31:
	movsbq	1(%r13), %rsi
	addq	$1, %r13
	cmpb	$48, %sil
	je	.L31
.L103:
	testb	$32, 1(%rax,%rsi,2)
	jne	.L31
	movq	%r12, %rdi
	call	strlen
	testq	%rax, %rax
	je	.L32
	leaq	-1(%r12,%rax), %rdi
	cmpb	$10, (%rdi)
	je	.L104
	movq	%r13, %rdi
	call	strlen
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L34
.L35:
	movq	%r12, %rdi
	call	strlen
	cmpq	%r15, %rax
	jne	.L37
.L106:
	testq	%r15, %r15
	je	.L39
	xorl	%r14d, %r14d
	andl	$7, %r15d
	je	.L38
	cmpq	$1, %r15
	je	.L85
	cmpq	$2, %r15
	je	.L86
	cmpq	$3, %r15
	je	.L87
	cmpq	$4, %r15
	je	.L88
	cmpq	$5, %r15
	je	.L89
	cmpq	$6, %r15
	je	.L90
	movzbl	0(%r13), %r9d
	cmpb	%r9b, (%r12)
	jne	.L101
	movl	$1, %r14d
.L90:
	movzbl	0(%r13,%r14), %r10d
	cmpb	%r10b, (%r12,%r14)
	jne	.L101
	addq	$1, %r14
.L89:
	movzbl	0(%r13,%r14), %r11d
	cmpb	%r11b, (%r12,%r14)
	jne	.L101
	addq	$1, %r14
.L88:
	movzbl	0(%r13,%r14), %edx
	cmpb	%dl, (%r12,%r14)
	jne	.L101
	addq	$1, %r14
.L87:
	movzbl	0(%r13,%r14), %ecx
	cmpb	%cl, (%r12,%r14)
	jne	.L101
	addq	$1, %r14
.L86:
	movzbl	0(%r13,%r14), %esi
	cmpb	%sil, (%r12,%r14)
	jne	.L101
	addq	$1, %r14
.L85:
	movzbl	0(%r13,%r14), %r15d
	cmpb	%r15b, (%r12,%r14)
	jne	.L101
	addq	$1, %r14
	cmpq	%r14, %rax
	je	.L39
.L38:
	movzbl	0(%r13,%r14), %edi
	cmpb	%dil, (%r12,%r14)
	jne	.L101
	leaq	1(%r14), %r8
	movzbl	0(%r13,%r8), %r9d
	movq	%r8, %r14
	cmpb	%r9b, (%r12,%r8)
	jne	.L101
	addq	$1, %r14
	movzbl	0(%r13,%r14), %r10d
	cmpb	%r10b, (%r12,%r14)
	jne	.L101
	movzbl	2(%r13,%r8), %r11d
	leaq	2(%r8), %r14
	cmpb	%r11b, 2(%r12,%r8)
	jne	.L101
	movzbl	3(%r13,%r8), %edx
	leaq	3(%r8), %r14
	cmpb	%dl, 3(%r12,%r8)
	jne	.L101
	movzbl	4(%r13,%r8), %ecx
	leaq	4(%r8), %r14
	cmpb	%cl, 4(%r12,%r8)
	jne	.L101
	movzbl	5(%r13,%r8), %esi
	leaq	5(%r8), %r14
	cmpb	%sil, 5(%r12,%r8)
	jne	.L101
	movzbl	6(%r13,%r8), %r15d
	leaq	6(%r8), %r14
	cmpb	%r15b, 6(%r12,%r8)
	jne	.L101
	leaq	7(%r8), %r14
	cmpq	%r14, %rax
	jne	.L38
.L39:
	cmpb	$45, %bl
	movl	$1, %eax
	sete	%bl
	cmpb	$45, %bpl
	sete	%bpl
	cmpb	%bpl, %bl
	jne	.L105
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L32:
	.cfi_restore_state
	movq	%r13, %rdi
	call	strlen
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L39
.L34:
	leaq	-1(%r13,%r15), %r8
	cmpb	$10, (%r8)
	jne	.L35
	movb	$0, (%r8)
	movq	%r13, %rdi
	call	strlen
	movq	%r12, %rdi
	movq	%rax, %r15
	call	strlen
	cmpq	%r15, %rax
	je	.L106
	.p2align 4
	.p2align 3
.L37:
	movl	$.LC4, %edi
	call	puts
	movq	%r13, %rdi
	call	strlen
	movq	%r12, %rdi
	movq	%rax, %r15
	call	strlen
	movq	%r15, %rdx
	movl	$.LC5, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	printf
	movq	%r13, %rdx
	movq	%r12, %rsi
	movl	$.LC6, %edi
	xorl	%eax, %eax
	call	printf
	xorl	%eax, %eax
.L107:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L101:
	.cfi_restore_state
	movl	$.LC7, %edi
	call	puts
	movq	%r14, %rsi
	movl	$.LC8, %edi
	xorl	%eax, %eax
	call	printf
	movsbl	(%r12,%r14), %edx
	movq	%r14, %rcx
	movq	%r14, %rsi
	movsbl	0(%r13,%r14), %r8d
	movl	$.LC9, %edi
	xorl	%eax, %eax
	call	printf
	movq	%r13, %rdx
	movq	%r12, %rsi
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	printf
	xorl	%eax, %eax
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L104:
	movb	$0, (%rdi)
	movq	%r13, %rdi
	call	strlen
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L35
	jmp	.L34
.L105:
	movl	$.LC11, %edi
	call	puts
	xorl	%eax, %eax
	jmp	.L107
	.cfi_endproc
.LFE6603:
	.size	check_result, .-check_result
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"Error creating directory %s: %s\n"
	.text
	.p2align 4
	.globl	create_directory
	.type	create_directory, @function
create_directory:
.LFB6604:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	strdup
	movq	%rax, %rdi
	movq	%rax, %rbp
	call	dirname
	movzbl	(%rax), %edx
	cmpl	$46, %edx
	jne	.L113
	cmpb	$0, 1(%rax)
	jne	.L113
.L110:
	movq	%rbp, %rdi
	call	free
	movl	$511, %esi
	movq	%rbx, %rdi
	call	mkdir
	testl	%eax, %eax
	je	.L127
	call	__errno_location
	movl	(%rax), %edi
	cmpl	$17, %edi
	jne	.L129
.L127:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L113:
	.cfi_restore_state
	cmpl	$47, %edx
	je	.L130
.L114:
	movq	%rax, %rdi
	call	create_directory
	jmp	.L110
	.p2align 4,,10
	.p2align 3
.L130:
	cmpb	$0, 1(%rax)
	je	.L110
	jmp	.L114
.L129:
	call	strerror
	movq	stderr(%rip), %rdi
	movq	%rbx, %rdx
	movl	$.LC12, %esi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	fprintf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6604:
	.size	create_directory, .-create_directory
	.section	.rodata.str1.1
.LC13:
	.string	"Error opening file %s: %s\n"
	.text
	.p2align 4
	.globl	open_gzfile
	.type	open_gzfile, @function
open_gzfile:
.LFB6605:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	gzopen
	testq	%rax, %rax
	je	.L134
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L134:
	.cfi_restore_state
	call	__errno_location
	movl	(%rax), %edi
	call	strerror
	movq	stderr(%rip), %rdi
	movq	%rbx, %rdx
	movl	$.LC13, %esi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	fprintf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6605:
	.size	open_gzfile, .-open_gzfile
	.section	.rodata.str1.1
.LC14:
	.string	"Error reading header line"
	.section	.text.unlikely
.LCOLDB15:
	.text
.LHOTB15:
	.p2align 4
	.globl	skip_first_line
	.type	skip_first_line, @function
skip_first_line:
.LFB6606:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$655360, %edx
	movq	%rdi, %rbx
	subq	$655360, %rsp
	.cfi_def_cfa_offset 655376
	movq	%rsp, %rsi
	call	gzgets
	testq	%rax, %rax
	je	.L137
	addq	$655360, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	skip_first_line.cold, @function
skip_first_line.cold:
.LFSB6606:
.L137:
	.cfi_def_cfa_offset 655376
	.cfi_offset 3, -16
	movl	$.LC14, %edi
	call	perror
	movq	%rbx, %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6606:
	.text
	.size	skip_first_line, .-skip_first_line
	.section	.text.unlikely
	.size	skip_first_line.cold, .-skip_first_line.cold
.LCOLDE15:
	.text
.LHOTE15:
	.p2align 4
	.globl	accumulate_multiply_AVX
	.type	accumulate_multiply_AVX, @function
accumulate_multiply_AVX:
.LFB6642:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-64, %rsp
	vmovd	(%rdi), %xmm11
	vmovd	4(%rdi), %xmm1
	vmovd	8(%rdi), %xmm10
	vmovd	4(%rsi), %xmm14
	vpunpcklqdq	%xmm1, %xmm11, %xmm12
	vpunpcklqdq	%xmm11, %xmm1, %xmm3
	vpunpcklqdq	%xmm11, %xmm11, %xmm0
	vmovd	12(%rsi), %xmm7
	vpunpcklqdq	%xmm10, %xmm1, %xmm9
	vinserti32x4	$0x1, %xmm3, %ymm0, %ymm4
	vmovd	8(%rsi), %xmm3
	vmovdqa	%xmm12, -32(%rsp)
	vinserti32x4	$0x1, %xmm12, %ymm9, %ymm2
	vinserti32x8	$0x1, %ymm2, %zmm4, %zmm8
	vmovd	(%rsi), %xmm4
	vpunpcklqdq	%xmm3, %xmm7, %xmm5
	vmovdqa	%xmm5, -16(%rsp)
	vpunpcklqdq	%xmm4, %xmm14, %xmm6
	vpunpcklqdq	%xmm3, %xmm4, %xmm15
	vpunpcklqdq	%xmm14, %xmm4, %xmm1
	vinserti32x4	$0x1, %xmm5, %ymm6, %ymm13
	vinserti32x4	$0x1, %xmm15, %ymm1, %ymm2
	vmovd	16(%rdi), %xmm5
	vinserti32x8	$0x1, %ymm13, %zmm2, %zmm0
	vpmuldq	%zmm0, %zmm8, %zmm8
	vmovd	12(%rdi), %xmm0
	vpunpcklqdq	%xmm11, %xmm5, %xmm13
	vmovq	%xmm5, %r9
	vpunpcklqdq	%xmm14, %xmm3, %xmm5
	vpunpcklqdq	%xmm0, %xmm10, %xmm2
	vinserti32x4	$0x1, %xmm13, %ymm2, %ymm15
	vinserti32x4	$0x1, %xmm12, %ymm2, %ymm12
	vinserti32x8	$0x1, %ymm15, %zmm12, %zmm16
	vmovdqa64	%zmm8, (%rdx)
	vmovd	20(%rsi), %xmm8
	vpunpcklqdq	%xmm8, %xmm4, %xmm1
	vinserti32x4	$0x1, %xmm1, %ymm5, %ymm15
	vmovd	16(%rsi), %xmm1
	vpunpcklqdq	%xmm7, %xmm1, %xmm7
	vpunpcklqdq	%xmm1, %xmm8, %xmm1
	vinserti32x4	$0x1, %xmm7, %ymm6, %ymm13
	vinserti32x4	$0x1, %xmm5, %ymm7, %ymm5
	vinserti32x8	$0x1, %ymm15, %zmm13, %zmm12
	vpmuldq	%zmm12, %zmm16, %zmm15
	vmovd	20(%rdi), %xmm12
	vpunpcklqdq	%xmm11, %xmm12, %xmm11
	vinserti32x4	$0x1, %xmm9, %ymm11, %ymm13
	vmovdqa64	%zmm15, 64(%rdx)
	vmovq	%r9, %xmm15
	vpunpcklqdq	%xmm15, %xmm0, %xmm11
	vinserti32x4	$0x1, %xmm11, %ymm9, %ymm9
	vinserti32x8	$0x1, %ymm13, %zmm9, %zmm15
	vmovd	24(%rsi), %xmm13
	vpunpcklqdq	%xmm13, %xmm4, %xmm4
	vinserti32x4	$0x1, %xmm1, %ymm4, %ymm4
	vinserti32x8	$0x1, %ymm4, %zmm5, %zmm4
	vmovd	28(%rsi), %xmm5
	vpmuldq	%zmm4, %zmm15, %zmm15
	vpunpcklqdq	%xmm13, %xmm5, %xmm4
	vpunpcklqdq	%xmm5, %xmm14, %xmm14
	vpunpcklqdq	%xmm5, %xmm3, %xmm3
	vmovdqa	%xmm4, -48(%rsp)
	vinserti32x4	$0x1, %xmm1, %ymm4, %ymm4
	vmovdqa64	%zmm15, 128(%rdx)
	vmovdqa	-16(%rsp), %xmm15
	vinserti32x4	$0x1, %xmm6, %ymm15, %ymm6
	vinserti32x8	$0x1, %ymm4, %zmm6, %zmm17
	vmovd	24(%rdi), %xmm6
	vmovdqa	-32(%rsp), %xmm4
	vpunpcklqdq	%xmm6, %xmm12, %xmm15
	vinserti32x4	$0x1, %xmm2, %ymm4, %ymm2
	vinserti32x4	$0x1, %xmm15, %ymm11, %ymm11
	vmovdqa	%xmm15, -32(%rsp)
	vmovq	%r9, %xmm15
	vinserti32x8	$0x1, %ymm2, %zmm11, %zmm4
	vpunpcklqdq	%xmm12, %xmm15, %xmm12
	vpmuldq	%zmm17, %zmm4, %zmm2
	vmovdqa64	%zmm2, 192(%rdx)
	vmovd	28(%rdi), %xmm2
	vpunpcklqdq	%xmm2, %xmm6, %xmm4
	vpunpcklqdq	%xmm10, %xmm2, %xmm10
	vpunpcklqdq	%xmm0, %xmm2, %xmm0
	vinserti32x4	$0x1, %xmm4, %ymm12, %ymm15
	vpunpcklqdq	%xmm6, %xmm2, %xmm6
	vinserti32x8	$0x1, %ymm9, %zmm15, %zmm9
	vpmuldq	%zmm17, %zmm9, %zmm15
	vmovdqa64	%zmm15, 256(%rdx)
	vmovdqa	-32(%rsp), %xmm9
	vinserti32x4	$0x1, %xmm10, %ymm9, %ymm15
	vmovdqa	-16(%rsp), %xmm10
	vpunpcklqdq	%xmm8, %xmm13, %xmm9
	vpunpcklqdq	%xmm5, %xmm13, %xmm13
	vinserti32x8	$0x1, %ymm11, %zmm15, %zmm15
	vinserti32x4	$0x1, %xmm7, %ymm9, %ymm11
	vpunpcklqdq	%xmm5, %xmm8, %xmm8
	vinserti32x4	$0x1, %xmm14, %ymm10, %ymm14
	vinserti32x4	$0x1, %xmm9, %ymm3, %ymm9
	vinserti32x4	$0x1, %xmm12, %ymm4, %ymm10
	vinserti32x8	$0x1, %ymm11, %zmm14, %zmm11
	vinserti32x4	$0x1, %xmm12, %ymm0, %ymm12
	vinserti32x4	$0x1, -32(%rsp), %ymm4, %ymm4
	vpmuldq	%zmm11, %zmm15, %zmm15
	vmovdqa	-48(%rsp), %xmm11
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	vinserti32x8	$0x1, %ymm10, %zmm12, %zmm14
	vinserti32x4	$0x1, %xmm0, %ymm6, %ymm2
	vinserti32x4	$0x1, %xmm13, %ymm8, %ymm5
	vinserti32x4	$0x1, %xmm11, %ymm7, %ymm7
	vinserti32x4	$0x1, %xmm11, %ymm1, %ymm1
	vinserti32x8	$0x1, %ymm2, %zmm4, %zmm12
	vmovdqa64	%zmm15, 320(%rdx)
	vinserti32x8	$0x1, %ymm7, %zmm9, %zmm15
	vpmuldq	%zmm15, %zmm14, %zmm10
	vinserti32x8	$0x1, %ymm5, %zmm1, %zmm14
	vpmuldq	%zmm14, %zmm12, %zmm11
	vmovdqa64	%zmm10, 384(%rdx)
	vmovdqa64	%zmm11, 448(%rdx)
	vzeroupper
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6642:
	.size	accumulate_multiply_AVX, .-accumulate_multiply_AVX
	.p2align 4
	.globl	add_limbs
	.type	add_limbs, @function
add_limbs:
.LFB6643:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movslq	%esi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	cmpl	$1, %edi
	jle	.L148
	movl	%edi, %ebx
	movl	%edi, %r11d
	movl	$1, %r8d
	movl	$1, %ecx
	leaq	8(%rdx), %r13
	.p2align 4
	.p2align 3
.L145:
	movslq	%ecx, %rsi
	leal	1(%r8), %r10d
	xorl	%edi, %edi
	leaq	(%rdx,%rsi,8), %rax
	addq	%r8, %rsi
	leaq	0(%r13,%rsi,8), %r9
	xorl	%esi, %esi
	movq	%r9, %r12
	subq	%rax, %r12
	subq	$8, %r12
	shrq	$3, %r12
	addq	$1, %r12
	andl	$7, %r12d
	je	.L144
	cmpq	$1, %r12
	je	.L196
	cmpq	$2, %r12
	je	.L197
	cmpq	$3, %r12
	je	.L198
	cmpq	$4, %r12
	je	.L199
	cmpq	$5, %r12
	je	.L200
	cmpq	$6, %r12
	je	.L201
	movq	(%rax), %rsi
	xorl	%edi, %edi
	addq	$8, %rax
.L201:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L200:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L199:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L198:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L197:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L196:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
	cmpq	%rax, %r9
	je	.L225
.L144:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	8(%rax), %rsi
	adcq	$0, %rdi
	addq	16(%rax), %rsi
	adcq	$0, %rdi
	addq	24(%rax), %rsi
	adcq	$0, %rdi
	addq	32(%rax), %rsi
	adcq	$0, %rdi
	addq	40(%rax), %rsi
	adcq	$0, %rdi
	addq	48(%rax), %rsi
	adcq	$0, %rdi
	addq	56(%rax), %rsi
	adcq	$0, %rdi
	addq	$64, %rax
	cmpq	%rax, %r9
	jne	.L144
.L225:
	movq	%rsi, (%rdx,%r8,8)
	addq	$1, %r8
	addl	%r10d, %ecx
	cmpq	%r8, %r11
	jne	.L145
	movl	%ebx, %r8d
	subl	$2, %r8d
	je	.L149
	movslq	%ebx, %r10
	leaq	(%rdx,%r10,8), %r10
	.p2align 4
	.p2align 3
.L147:
	movslq	%ecx, %r9
	movslq	%r8d, %r12
	leal	1(%r8), %r11d
	xorl	%esi, %esi
	addq	%r9, %r12
	leaq	(%rdx,%r9,8), %rax
	xorl	%edi, %edi
	leaq	0(%r13,%r12,8), %r9
	movq	%r9, %r12
	subq	%rax, %r12
	subq	$8, %r12
	shrq	$3, %r12
	addq	$1, %r12
	andl	$7, %r12d
	je	.L146
	cmpq	$1, %r12
	je	.L202
	cmpq	$2, %r12
	je	.L203
	cmpq	$3, %r12
	je	.L204
	cmpq	$4, %r12
	je	.L205
	cmpq	$5, %r12
	je	.L206
	cmpq	$6, %r12
	je	.L207
	movq	(%rax), %rsi
	xorl	%edi, %edi
	addq	$8, %rax
.L207:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L206:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L205:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L204:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L203:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L202:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
	cmpq	%r9, %rax
	je	.L224
.L146:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	8(%rax), %rsi
	adcq	$0, %rdi
	addq	16(%rax), %rsi
	adcq	$0, %rdi
	addq	24(%rax), %rsi
	adcq	$0, %rdi
	addq	32(%rax), %rsi
	adcq	$0, %rdi
	addq	40(%rax), %rsi
	adcq	$0, %rdi
	addq	48(%rax), %rsi
	adcq	$0, %rdi
	addq	56(%rax), %rsi
	adcq	$0, %rdi
	addq	$64, %rax
	cmpq	%r9, %rax
	jne	.L146
.L224:
	movq	%rsi, (%r10)
	addl	%r11d, %ecx
	addq	$8, %r10
	subl	$1, %r8d
	jne	.L147
	leal	-2(%rbx,%rbx), %r11d
	movslq	%r11d, %rbx
	salq	$3, %rbx
.L143:
	movq	(%rdx,%rbp,8), %rbp
	movl	%r11d, %eax
	movq	%rbp, (%rdx,%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L148:
	.cfi_restore_state
	movl	$8, %ebx
	movl	$1, %r11d
	jmp	.L143
.L149:
	movl	$16, %ebx
	movl	$2, %r11d
	jmp	.L143
	.cfi_endproc
.LFE6643:
	.size	add_limbs, .-add_limbs
	.p2align 4
	.globl	adjust_limbs
	.type	adjust_limbs, @function
adjust_limbs:
.LFB6644:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	(%rsi), %rdx
	movq	%rsi, %r8
	movabsq	$-4294967296, %rbx
	movl	%edx, %ecx
	addl	12(%rsi), %ecx
	movl	%edx, %esi
	movq	%rcx, %rax
	subq	%rsi, %rax
	shrq	$63, %rax
	salq	$32, %rax
	addq	%rdx, %rax
	andq	%rbx, %rax
	orq	%rcx, %rax
	movq	%rax, (%r8)
	cmpl	$2, %edi
	jle	.L230
	movl	%edi, %r9d
	leaq	8(%r8), %rcx
	movq	%r8, %rsi
	subl	$3, %r9d
	movl	%r9d, %r11d
	shrl	%r11d
	leaq	(%rcx,%r11,8), %r10
	movq	%r10, %rdx
	subq	%r8, %rdx
	andl	$8, %edx
	je	.L229
	movq	(%rcx), %rbx
	movl	%ebx, %esi
	addl	12(%rcx), %esi
	movl	%ebx, %edi
	movq	%rsi, %r11
	subq	%rdi, %r11
	shrq	$63, %r11
	addq	%r11, %rax
	movq	%rax, (%r8)
	movq	8(%rcx), %rdx
	movl	%edx, %eax
	addl	20(%rcx), %eax
	movl	%edx, %ecx
	movq	%rax, %rbx
	subq	%rcx, %rbx
	leaq	24(%r8), %rcx
	shrq	$63, %rbx
	addq	%rbx, %rsi
	salq	$32, %rsi
	orq	%rsi, %rax
	leaq	8(%r8), %rsi
	movq	%rax, 8(%r8)
	cmpq	%rsi, %r10
	je	.L237
	.p2align 4
	.p2align 3
.L229:
	movq	(%rcx), %rdi
	addq	$16, %rsi
	addq	$32, %rcx
	movl	%edi, %edx
	addl	-20(%rcx), %edx
	movl	%edi, %r11d
	movq	%rdx, %rbx
	subq	%r11, %rbx
	shrq	$63, %rbx
	addq	%rbx, %rax
	movq	%rax, -16(%rsi)
	movq	-24(%rcx), %rax
	movl	%eax, %r11d
	addl	-12(%rcx), %r11d
	movl	%eax, %ebx
	movq	%r11, %rax
	subq	%rbx, %rax
	shrq	$63, %rax
	addq	%rax, %rdx
	salq	$32, %rdx
	orq	%r11, %rdx
	movq	%rdx, -8(%rsi)
	movq	-16(%rcx), %rdi
	movl	%edi, %eax
	addl	-4(%rcx), %eax
	movl	%edi, %r11d
	movq	%rax, %rbx
	subq	%r11, %rbx
	shrq	$63, %rbx
	addq	%rbx, %rdx
	movq	%rdx, -8(%rsi)
	movq	-8(%rcx), %rdx
	movl	%edx, %r11d
	addl	4(%rcx), %r11d
	movl	%edx, %edi
	movq	%r11, %rbx
	subq	%rdi, %rbx
	shrq	$63, %rbx
	addq	%rbx, %rax
	salq	$32, %rax
	orq	%r11, %rax
	movq	%rax, (%rsi)
	cmpq	%rsi, %r10
	jne	.L229
.L237:
	andl	$-2, %r9d
	salq	$32, %rbx
	leal	3(%r9), %r9d
	subq	%rbx, %rax
	movq	-8(%r8,%r9,8), %rdi
.L228:
	movabsq	$-4294967296, %r8
	movl	%edi, %ecx
	andq	%r8, %rax
	orq	%rcx, %rax
	movq	%rax, (%r10)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L230:
	.cfi_restore_state
	movq	%rax, %rdi
	movq	%r8, %r10
	jmp	.L228
	.cfi_endproc
.LFE6644:
	.size	adjust_limbs, .-adjust_limbs
	.p2align 4
	.globl	multiply
	.type	multiply, @function
multiply:
.LFB6645:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rax
	movq	%rdx, %rdi
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-64, %rsp
	subq	$64, %rsp
	vmovd	(%rax), %xmm11
	vmovd	4(%rax), %xmm1
	vmovd	8(%rax), %xmm10
	vmovd	4(%rsi), %xmm14
	vpunpcklqdq	%xmm1, %xmm11, %xmm12
	vpunpcklqdq	%xmm11, %xmm1, %xmm3
	vpunpcklqdq	%xmm11, %xmm11, %xmm0
	vmovd	12(%rsi), %xmm7
	vpunpcklqdq	%xmm10, %xmm1, %xmm9
	vinserti32x4	$0x1, %xmm3, %ymm0, %ymm4
	vmovd	8(%rsi), %xmm3
	vmovdqa	%xmm12, 32(%rsp)
	vinserti32x4	$0x1, %xmm12, %ymm9, %ymm2
	vinserti32x8	$0x1, %ymm2, %zmm4, %zmm8
	vmovd	(%rsi), %xmm4
	vpunpcklqdq	%xmm3, %xmm7, %xmm5
	vmovdqa	%xmm5, 48(%rsp)
	vpunpcklqdq	%xmm4, %xmm14, %xmm6
	vpunpcklqdq	%xmm3, %xmm4, %xmm15
	vpunpcklqdq	%xmm14, %xmm4, %xmm1
	vinserti32x4	$0x1, %xmm5, %ymm6, %ymm13
	vinserti32x4	$0x1, %xmm15, %ymm1, %ymm2
	vmovd	16(%rax), %xmm5
	vinserti32x8	$0x1, %ymm13, %zmm2, %zmm0
	vpmuldq	%zmm0, %zmm8, %zmm8
	vmovd	12(%rax), %xmm0
	vpunpcklqdq	%xmm11, %xmm5, %xmm13
	vmovq	%xmm5, %r9
	vpunpcklqdq	%xmm14, %xmm3, %xmm5
	vpunpcklqdq	%xmm0, %xmm10, %xmm2
	vinserti32x4	$0x1, %xmm13, %ymm2, %ymm15
	vinserti32x4	$0x1, %xmm12, %ymm2, %ymm12
	vinserti32x8	$0x1, %ymm15, %zmm12, %zmm16
	vmovdqa64	%zmm8, (%rdx)
	vmovd	20(%rsi), %xmm8
	vpunpcklqdq	%xmm8, %xmm4, %xmm1
	vinserti32x4	$0x1, %xmm1, %ymm5, %ymm15
	vmovd	16(%rsi), %xmm1
	vpunpcklqdq	%xmm7, %xmm1, %xmm7
	vpunpcklqdq	%xmm1, %xmm8, %xmm1
	vinserti32x4	$0x1, %xmm7, %ymm6, %ymm13
	vinserti32x4	$0x1, %xmm5, %ymm7, %ymm5
	vinserti32x8	$0x1, %ymm15, %zmm13, %zmm12
	vpmuldq	%zmm12, %zmm16, %zmm15
	vmovd	20(%rax), %xmm12
	vpunpcklqdq	%xmm11, %xmm12, %xmm11
	vinserti32x4	$0x1, %xmm9, %ymm11, %ymm13
	vmovdqa64	%zmm15, 64(%rdx)
	vmovq	%r9, %xmm15
	vpunpcklqdq	%xmm15, %xmm0, %xmm11
	vinserti32x4	$0x1, %xmm11, %ymm9, %ymm9
	vinserti32x8	$0x1, %ymm13, %zmm9, %zmm15
	vmovd	24(%rsi), %xmm13
	vpunpcklqdq	%xmm13, %xmm4, %xmm4
	vinserti32x4	$0x1, %xmm1, %ymm4, %ymm4
	vinserti32x8	$0x1, %ymm4, %zmm5, %zmm4
	vmovd	28(%rsi), %xmm5
	vpmuldq	%zmm4, %zmm15, %zmm15
	vpunpcklqdq	%xmm13, %xmm5, %xmm4
	vpunpcklqdq	%xmm5, %xmm14, %xmm14
	vpunpcklqdq	%xmm5, %xmm3, %xmm3
	vmovdqa	%xmm4, 16(%rsp)
	vinserti32x4	$0x1, %xmm1, %ymm4, %ymm4
	vmovdqa64	%zmm15, 128(%rdx)
	vmovdqa	48(%rsp), %xmm15
	vinserti32x4	$0x1, %xmm6, %ymm15, %ymm6
	vinserti32x8	$0x1, %ymm4, %zmm6, %zmm17
	vmovd	24(%rax), %xmm6
	vmovdqa	32(%rsp), %xmm4
	vpunpcklqdq	%xmm6, %xmm12, %xmm15
	vinserti32x4	$0x1, %xmm2, %ymm4, %ymm2
	vinserti32x4	$0x1, %xmm15, %ymm11, %ymm11
	vmovdqa	%xmm15, 32(%rsp)
	vmovq	%r9, %xmm15
	vinserti32x8	$0x1, %ymm2, %zmm11, %zmm4
	vpunpcklqdq	%xmm12, %xmm15, %xmm12
	vpmuldq	%zmm17, %zmm4, %zmm2
	vmovdqa64	%zmm2, 192(%rdx)
	vmovd	28(%rax), %xmm2
	vpunpcklqdq	%xmm2, %xmm6, %xmm4
	vpunpcklqdq	%xmm10, %xmm2, %xmm10
	vpunpcklqdq	%xmm0, %xmm2, %xmm0
	vinserti32x4	$0x1, %xmm4, %ymm12, %ymm15
	vpunpcklqdq	%xmm6, %xmm2, %xmm6
	vinserti32x8	$0x1, %ymm9, %zmm15, %zmm9
	vpmuldq	%zmm17, %zmm9, %zmm15
	vmovdqa64	%zmm15, 256(%rdx)
	vmovdqa	32(%rsp), %xmm9
	vinserti32x4	$0x1, %xmm10, %ymm9, %ymm15
	vmovdqa	48(%rsp), %xmm10
	vpunpcklqdq	%xmm8, %xmm13, %xmm9
	vpunpcklqdq	%xmm5, %xmm13, %xmm13
	vinserti32x8	$0x1, %ymm11, %zmm15, %zmm15
	vinserti32x4	$0x1, %xmm7, %ymm9, %ymm11
	vpunpcklqdq	%xmm5, %xmm8, %xmm8
	vinserti32x4	$0x1, %xmm14, %ymm10, %ymm14
	vinserti32x4	$0x1, %xmm9, %ymm3, %ymm9
	vinserti32x4	$0x1, %xmm12, %ymm4, %ymm10
	vinserti32x8	$0x1, %ymm11, %zmm14, %zmm11
	vinserti32x4	$0x1, %xmm12, %ymm0, %ymm12
	vinserti32x4	$0x1, 32(%rsp), %ymm4, %ymm4
	vpmuldq	%zmm11, %zmm15, %zmm15
	vmovdqa	16(%rsp), %xmm11
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	vinserti32x8	$0x1, %ymm10, %zmm12, %zmm14
	vinserti32x4	$0x1, %xmm0, %ymm6, %ymm2
	vinserti32x4	$0x1, %xmm13, %ymm8, %ymm5
	vinserti32x4	$0x1, %xmm11, %ymm7, %ymm7
	vinserti32x4	$0x1, %xmm11, %ymm1, %ymm1
	vinserti32x8	$0x1, %ymm2, %zmm4, %zmm12
	vmovdqa64	%zmm15, 320(%rdx)
	vinserti32x8	$0x1, %ymm7, %zmm9, %zmm15
	vpmuldq	%zmm15, %zmm14, %zmm10
	vinserti32x8	$0x1, %ymm5, %zmm1, %zmm14
	vpmuldq	%zmm14, %zmm12, %zmm11
	vmovdqa64	%zmm10, 384(%rdx)
	vmovdqa64	%zmm11, 448(%rdx)
	call	add_limbs.constprop.0.isra.0
	vzeroupper
	leave
	.cfi_def_cfa 7, 8
	jmp	adjust_limbs.constprop.0
	.cfi_endproc
.LFE6645:
	.size	multiply, .-multiply
	.section	.rodata.str1.1
.LC16:
	.string	"%016lx "
	.text
	.p2align 4
	.globl	print_array
	.type	print_array, @function
print_array:
.LFB6646:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L281
	movslq	%esi, %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	-8(,%rsi,8), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	(%rdi,%rsi,8), %rbp
	movq	%rdi, %rbx
	shrq	$3, %rax
	addq	$1, %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	andl	$7, %eax
	je	.L243
	cmpq	$1, %rax
	je	.L266
	cmpq	$2, %rax
	je	.L267
	cmpq	$3, %rax
	je	.L268
	cmpq	$4, %rax
	je	.L269
	cmpq	$5, %rax
	je	.L270
	cmpq	$6, %rax
	jne	.L284
.L271:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L270:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L269:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L268:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L267:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L266:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
	cmpq	%rbp, %rbx
	je	.L242
.L243:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$64, %rbx
	call	printf
	movq	-56(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	call	printf
	movq	-48(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	call	printf
	movq	-40(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	call	printf
	movq	-32(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	call	printf
	movq	-24(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	call	printf
	movq	-16(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	call	printf
	movq	-8(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	call	printf
	cmpq	%rbp, %rbx
	jne	.L243
.L242:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$10, %edi
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	jmp	putchar
	.p2align 4,,10
	.p2align 3
.L284:
	.cfi_restore_state
	movq	(%rdi), %rsi
	xorl	%eax, %eax
	movl	$.LC16, %edi
	addq	$8, %rbx
	call	printf
	jmp	.L271
	.p2align 4,,10
	.p2align 3
.L281:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	movl	$10, %edi
	jmp	putchar
	.cfi_endproc
.LFE6646:
	.size	print_array, .-print_array
	.p2align 4
	.globl	generate_random_numbers
	.type	generate_random_numbers, @function
generate_random_numbers:
.LFB6647:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L326
	movslq	%esi, %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	-4(,%rsi,4), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	(%rdi,%rsi,4), %rbp
	movq	%rdi, %rbx
	shrq	$2, %rax
	addq	$1, %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	andl	$7, %eax
	je	.L287
	cmpq	$1, %rax
	je	.L310
	cmpq	$2, %rax
	je	.L311
	cmpq	$3, %rax
	je	.L312
	cmpq	$4, %rax
	je	.L313
	cmpq	$5, %rax
	je	.L314
	cmpq	$6, %rax
	jne	.L329
.L315:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L314:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L313:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L312:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L311:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L310:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
	cmpq	%rbp, %rbx
	je	.L324
.L287:
	call	rand
	addq	$32, %rbx
	movl	%eax, -32(%rbx)
	call	rand
	movl	%eax, -28(%rbx)
	call	rand
	movl	%eax, -24(%rbx)
	call	rand
	movl	%eax, -20(%rbx)
	call	rand
	movl	%eax, -16(%rbx)
	call	rand
	movl	%eax, -12(%rbx)
	call	rand
	movl	%eax, -8(%rbx)
	call	rand
	movl	%eax, -4(%rbx)
	cmpq	%rbp, %rbx
	jne	.L287
.L324:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L329:
	.cfi_restore_state
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
	jmp	.L315
	.p2align 4,,10
	.p2align 3
.L326:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE6647:
	.size	generate_random_numbers, .-generate_random_numbers
	.section	.rodata.str1.1
.LC17:
	.string	"%016lx"
	.text
	.p2align 4
	.globl	limb_get_str
	.type	limb_get_str, @function
limb_get_str:
.LFB6648:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	testl	%esi, %esi
	jle	.L336
	movslq	%esi, %rsi
	movq	%rdi, %rbx
	xorl	%r12d, %r12d
	leaq	-8(,%rsi,8), %rax
	leaq	(%rdi,%rsi,8), %r13
	shrq	$3, %rax
	addq	$1, %rax
	andl	$3, %eax
	je	.L332
	cmpq	$1, %rax
	je	.L349
	cmpq	$2, %rax
	je	.L350
	movq	(%rdi), %rcx
	movq	(%rdx), %rdi
	movl	$17, %esi
	movl	$.LC17, %edx
	xorl	%eax, %eax
	movl	$16, %r12d
	addq	$8, %rbx
	call	snprintf
.L350:
	movq	(%rbx), %rcx
	movslq	%r12d, %rdi
	movl	$.LC17, %edx
	addq	0(%rbp), %rdi
	movl	$17, %esi
	xorl	%eax, %eax
	addl	$16, %r12d
	addq	$8, %rbx
	call	snprintf
.L349:
	movq	(%rbx), %rcx
	movslq	%r12d, %rdi
	movl	$.LC17, %edx
	addq	0(%rbp), %rdi
	movl	$17, %esi
	xorl	%eax, %eax
	addq	$8, %rbx
	addl	$16, %r12d
	call	snprintf
	cmpq	%r13, %rbx
	je	.L355
.L332:
	movq	(%rbx), %rcx
	movslq	%r12d, %rdi
	movl	$.LC17, %edx
	addq	0(%rbp), %rdi
	movl	$17, %esi
	xorl	%eax, %eax
	addq	$32, %rbx
	call	snprintf
	movq	-24(%rbx), %rcx
	leal	16(%r12), %edi
	xorl	%eax, %eax
	movl	$.LC17, %edx
	movl	$17, %esi
	movslq	%edi, %rdi
	addq	0(%rbp), %rdi
	call	snprintf
	leal	32(%r12), %edx
	movq	-16(%rbx), %rcx
	xorl	%eax, %eax
	movslq	%edx, %rdi
	movl	$17, %esi
	addq	0(%rbp), %rdi
	movl	$.LC17, %edx
	call	snprintf
	leal	48(%r12), %r8d
	movq	-8(%rbx), %rcx
	xorl	%eax, %eax
	movslq	%r8d, %rdi
	movl	$.LC17, %edx
	addq	0(%rbp), %rdi
	addl	$64, %r12d
	movl	$17, %esi
	call	snprintf
	cmpq	%r13, %rbx
	jne	.L332
.L355:
	movslq	%r12d, %r12
.L331:
	movq	0(%rbp), %rcx
	movb	$0, (%rcx,%r12)
	movq	0(%rbp), %r9
	cmpb	$48, (%r9)
	leaq	1(%r9), %r10
	jne	.L356
	.p2align 4
	.p2align 4
	.p2align 3
.L334:
	movq	%r10, 0(%rbp)
	addq	$1, %r10
	cmpb	$48, -1(%r10)
	je	.L334
.L356:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L336:
	.cfi_restore_state
	xorl	%r12d, %r12d
	jmp	.L331
	.cfi_endproc
.LFE6648:
	.size	limb_get_str, .-limb_get_str
	.section	.rodata.str1.1
.LC18:
	.string	"*** Test Case %d ***\n"
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"Time taken by Urdhva Tiryakbhyam: %f microseconds\n"
	.align 8
.LC21:
	.string	"Time taken by GMP: %f microseconds\n"
	.section	.rodata.str1.1
.LC22:
	.string	"Test failed"
	.section	.rodata.str1.8
	.align 8
.LC23:
	.string	"i: %d, expected: %c, result: %c\n"
	.section	.rodata.str1.1
.LC24:
	.string	"result: %s\n"
.LC25:
	.string	"expected: %s\n"
.LC26:
	.string	"passed"
.LC27:
	.string	"Test %s\n"
	.text
	.p2align 4
	.globl	test
	.type	test, @function
test:
.LFB6649:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-64, %rsp
	movl	$32, %edi
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	xorl	%ebx, %ebx
	subq	$832, %rsp
	call	malloc
	movl	$32, %edi
	movq	%rax, -296(%rbp)
	call	malloc
	movl	$512, %edx
	movl	$64, %esi
	leaq	-248(%rbp), %rdi
	movq	%rax, %r15
	call	posix_memalign
	testl	%eax, %eax
	jne	.L359
	movq	-248(%rbp), %rbx
.L359:
	movl	$65, %edi
	leaq	-240(%rbp), %r13
	leaq	-224(%rbp), %r12
	call	malloc
	leaq	64(%rbx), %rsi
	leaq	32(%r15), %rcx
	movq	%rbx, %r9
	movq	%rax, %r8
	movq	-296(%rbp), %rax
	movl	$0, -828(%rbp)
	leaq	-208(%rbp), %r14
	movq	%rcx, -856(%rbp)
	movq	%r15, %rbx
	addq	$32, %rax
	movq	%rsi, -304(%rbp)
	movq	%rax, -848(%rbp)
	movq	%r8, -288(%rbp)
	.p2align 4
	.p2align 3
.L374:
	movq	%r9, %rdi
	xorl	%eax, %eax
	vpxor	%xmm0, %xmm0, %xmm0
	movl	$64, %ecx
	rep stosq
	movq	%r9, -368(%rbp)
	movq	-296(%rbp), %r15
	movq	%r13, %rdi
	vmovdqu8	%ymm0, (%rbx)
	vmovdqu8	%ymm0, (%r15)
	vzeroupper
	call	__gmpz_init
	movq	%r12, %rdi
	call	__gmpz_init
	movq	%r14, %rdi
	call	__gmpz_init
	xorl	%edi, %edi
	call	time
	movl	%eax, %edi
	call	srand
	movq	%rbx, -272(%rbp)
	movq	%r15, %rbx
	movq	-848(%rbp), %r15
	.p2align 4
	.p2align 3
.L360:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
	cmpq	%r15, %rbx
	jne	.L360
	movq	-272(%rbp), %rbx
	movq	-856(%rbp), %r15
	.p2align 4
	.p2align 3
.L361:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
	cmpq	%rbx, %r15
	jne	.L361
	movq	-368(%rbp), %r9
	movq	-272(%rbp), %rbx
	xorl	%r15d, %r15d
	movq	%r9, -272(%rbp)
.L362:
	movl	$32, %edx
	movq	%r13, %rsi
	movq	%r13, %rdi
	call	__gmpz_mul_2exp
	movq	-296(%rbp), %r11
	movq	%r13, %rsi
	movq	%r13, %rdi
	movl	(%r11,%r15), %edx
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_mul_2exp
	movl	(%rbx,%r15), %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r13, %rsi
	movq	%r13, %rdi
	call	__gmpz_mul_2exp
	movq	-296(%rbp), %r10
	movq	%r13, %rsi
	movq	%r13, %rdi
	movl	4(%r10,%r15), %edx
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_mul_2exp
	movl	4(%rbx,%r15), %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r13, %rsi
	movq	%r13, %rdi
	call	__gmpz_mul_2exp
	movq	-296(%rbp), %r8
	movq	%r13, %rsi
	movq	%r13, %rdi
	movl	8(%r8,%r15), %edx
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_mul_2exp
	movl	8(%rbx,%r15), %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r13, %rsi
	movq	%r13, %rdi
	call	__gmpz_mul_2exp
	movq	-296(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r13, %rdi
	movl	12(%rdx,%r15), %edx
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_mul_2exp
	movl	12(%rbx,%r15), %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	addq	$16, %r15
	call	__gmpz_add_ui
	cmpq	$32, %r15
	jne	.L362
	movq	-272(%rbp), %rsi
	addl	$1, -828(%rbp)
	movl	$.LC18, %edi
	xorl	%eax, %eax
	movq	%rsi, -368(%rbp)
	movl	-828(%rbp), %esi
	call	printf
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	__gmpz_mul
	movq	%r14, %rdx
	movl	$16, %esi
	xorl	%edi, %edi
	call	__gmpz_get_str
	movq	-296(%rbp), %rcx
	vmovd	(%rbx), %xmm12
	vmovd	8(%rbx), %xmm14
	movq	%rax, -824(%rbp)
	vmovd	(%rcx), %xmm9
	vmovd	4(%rcx), %xmm2
	vmovd	8(%rcx), %xmm1
	vpunpcklqdq	%xmm14, %xmm12, %xmm0
	movq	-368(%rbp), %rax
	vmovq	%xmm14, %rdi
	vpunpcklqdq	%xmm2, %xmm9, %xmm11
	vpunpcklqdq	%xmm9, %xmm2, %xmm4
	vpunpcklqdq	%xmm9, %xmm9, %xmm5
	vpunpcklqdq	%xmm1, %xmm2, %xmm10
	vinserti32x4	$0x1, %xmm4, %ymm5, %ymm6
	vmovd	4(%rbx), %xmm4
	vmovdqa	%xmm11, -368(%rbp)
	vinserti32x4	$0x1, %xmm11, %ymm10, %ymm3
	vinserti32x8	$0x1, %ymm3, %zmm6, %zmm13
	vmovd	12(%rbx), %xmm6
	vpunpcklqdq	%xmm12, %xmm4, %xmm8
	vpunpcklqdq	%xmm4, %xmm12, %xmm2
	vinserti32x4	$0x1, %xmm0, %ymm2, %ymm3
	vmovd	12(%rcx), %xmm0
	vpunpcklqdq	%xmm14, %xmm6, %xmm7
	vinserti32x4	$0x1, %xmm7, %ymm8, %ymm15
	vmovdqa	%xmm7, -272(%rbp)
	vinserti32x8	$0x1, %ymm15, %zmm3, %zmm5
	vmovd	16(%rbx), %xmm3
	vmovq	%rdi, %xmm15
	vpmuldq	%zmm5, %zmm13, %zmm13
	vpunpcklqdq	%xmm0, %xmm1, %xmm5
	vpunpcklqdq	%xmm4, %xmm15, %xmm15
	vinserti32x4	$0x1, %xmm11, %ymm5, %ymm11
	vpunpcklqdq	%xmm6, %xmm3, %xmm6
	vmovdqa64	%zmm13, (%rax)
	vmovd	16(%rcx), %xmm13
	vpunpcklqdq	%xmm9, %xmm13, %xmm14
	vinserti32x4	$0x1, %xmm14, %ymm5, %ymm7
	vinserti32x8	$0x1, %ymm7, %zmm11, %zmm16
	vmovd	20(%rbx), %xmm7
	vinserti32x4	$0x1, %xmm6, %ymm8, %ymm11
	vpunpcklqdq	%xmm7, %xmm12, %xmm2
	vinserti32x4	$0x1, %xmm2, %ymm15, %ymm14
	vinserti32x4	$0x1, %xmm15, %ymm6, %ymm15
	vinserti32x8	$0x1, %ymm14, %zmm11, %zmm2
	vpunpcklqdq	%xmm13, %xmm0, %xmm11
	vpmuldq	%zmm2, %zmm16, %zmm14
	vmovdqa64	%zmm14, 64(%rax)
	vmovd	20(%rcx), %xmm14
	vpunpcklqdq	%xmm9, %xmm14, %xmm9
	vpunpcklqdq	%xmm14, %xmm13, %xmm13
	vinserti32x4	$0x1, %xmm10, %ymm9, %ymm2
	vmovd	24(%rbx), %xmm9
	vinserti32x4	$0x1, %xmm11, %ymm10, %ymm10
	vinserti32x8	$0x1, %ymm2, %zmm10, %zmm17
	vpunpcklqdq	%xmm3, %xmm7, %xmm2
	vpunpcklqdq	%xmm9, %xmm12, %xmm12
	vinserti32x4	$0x1, %xmm2, %ymm12, %ymm3
	vinserti32x8	$0x1, %ymm3, %zmm15, %zmm12
	vpmuldq	%zmm12, %zmm17, %zmm3
	vmovdqa	-272(%rbp), %xmm12
	vinserti32x4	$0x1, %xmm8, %ymm12, %ymm8
	vmovd	24(%rcx), %xmm12
	vmovdqa64	%zmm3, 128(%rax)
	vmovd	28(%rbx), %xmm3
	vpunpcklqdq	%xmm9, %xmm3, %xmm15
	vpunpcklqdq	%xmm3, %xmm4, %xmm4
	vmovdqa	%xmm15, -432(%rbp)
	vinserti32x4	$0x1, %xmm2, %ymm15, %ymm15
	vinserti32x8	$0x1, %ymm15, %zmm8, %zmm18
	vpunpcklqdq	%xmm12, %xmm14, %xmm8
	vmovdqa	-368(%rbp), %xmm15
	vinserti32x4	$0x1, %xmm8, %ymm11, %ymm11
	vinserti32x4	$0x1, %xmm5, %ymm15, %ymm5
	vmovdqa	%xmm8, %xmm15
	vinserti32x8	$0x1, %ymm5, %zmm11, %zmm5
	vpmuldq	%zmm18, %zmm5, %zmm8
	vmovdqa64	%zmm8, 192(%rax)
	vmovd	28(%rcx), %xmm8
	vpunpcklqdq	%xmm8, %xmm12, %xmm5
	vpunpcklqdq	%xmm1, %xmm8, %xmm1
	vpunpcklqdq	%xmm0, %xmm8, %xmm0
	vinserti32x4	$0x1, %xmm5, %ymm13, %ymm14
	vpunpcklqdq	%xmm12, %xmm8, %xmm12
	vinserti32x8	$0x1, %ymm10, %zmm14, %zmm10
	vpmuldq	%zmm18, %zmm10, %zmm14
	vpunpcklqdq	%xmm7, %xmm9, %xmm10
	vpunpcklqdq	%xmm3, %xmm9, %xmm9
	vpunpcklqdq	%xmm3, %xmm7, %xmm7
	vmovdqa64	%zmm14, 256(%rax)
	vmovdqa	%xmm15, %xmm14
	vinserti32x4	$0x1, %xmm1, %ymm15, %ymm15
	vinserti32x8	$0x1, %ymm11, %zmm15, %zmm1
	vinserti32x4	$0x1, %xmm6, %ymm10, %ymm11
	vmovdqa	-272(%rbp), %xmm15
	vinserti32x4	$0x1, %xmm4, %ymm15, %ymm4
	vinserti32x4	$0x1, %xmm13, %ymm5, %ymm15
	vinserti32x4	$0x1, %xmm13, %ymm0, %ymm13
	vinserti32x8	$0x1, %ymm11, %zmm4, %zmm11
	vinserti32x4	$0x1, %xmm14, %ymm5, %ymm5
	vmovdqa	-432(%rbp), %xmm4
	vpmuldq	%zmm11, %zmm1, %zmm1
	vinserti32x8	$0x1, %ymm15, %zmm13, %zmm11
	vinserti32x4	$0x1, %xmm4, %ymm6, %ymm6
	vinserti32x4	$0x1, %xmm4, %ymm2, %ymm2
	vmovdqa64	%zmm1, 320(%rax)
	vmovq	%rdi, %xmm1
	movq	%rax, %rdi
	vpunpcklqdq	%xmm3, %xmm1, %xmm15
	vinserti32x4	$0x1, %xmm9, %ymm7, %ymm3
	vinserti32x4	$0x1, %xmm10, %ymm15, %ymm10
	vinserti32x8	$0x1, %ymm3, %zmm2, %zmm4
	vinserti32x8	$0x1, %ymm6, %zmm10, %zmm0
	vpmuldq	%zmm0, %zmm11, %zmm13
	vpunpcklqdq	%xmm8, %xmm8, %xmm11
	vinserti32x4	$0x1, %xmm11, %ymm12, %ymm8
	vinserti32x8	$0x1, %ymm8, %zmm5, %zmm14
	vpmuldq	%zmm4, %zmm14, %zmm6
	vmovdqa64	%zmm13, 384(%rax)
	movq	%rax, -272(%rbp)
	vmovdqa64	%zmm6, 448(%rax)
	call	add_limbs.constprop.0.isra.0
	movq	-272(%rbp), %rdi
	call	adjust_limbs.constprop.0
	movq	-272(%rbp), %r9
	xorl	%r11d, %r11d
	movq	%rbx, -272(%rbp)
	movl	%r11d, %r15d
	movq	%r9, -368(%rbp)
	movq	%r9, %rbx
	vzeroupper
	.p2align 4
	.p2align 3
.L363:
	movq	-288(%rbp), %r10
	movq	(%rbx), %rcx
	movslq	%r15d, %rdi
	xorl	%eax, %eax
	movl	$.LC17, %edx
	movl	$17, %esi
	addq	$8, %rbx
	addl	$16, %r15d
	addq	%r10, %rdi
	call	snprintf
	movq	-304(%rbp), %r8
	cmpq	%r8, %rbx
	jne	.L363
	movq	-288(%rbp), %rcx
	movslq	%r15d, %rsi
	movq	-272(%rbp), %rbx
	movq	-368(%rbp), %rdx
	movb	$0, (%rcx,%rsi)
	cmpb	$48, (%rcx)
	jne	.L364
	.p2align 4
	.p2align 4
	.p2align 3
.L365:
	addq	$1, %rcx
	cmpb	$48, (%rcx)
	je	.L365
	movq	%rcx, -288(%rbp)
.L364:
#APP
# 298 "test4.c" 1
	mfence
# 0 "" 2
#NO_APP
	movq	-296(%rbp), %rdi
	vmovd	8(%rbx), %xmm5
	vmovd	4(%rbx), %xmm6
	vmovd	12(%rbx), %xmm7
	vmovd	(%rdi), %xmm15
	vmovd	4(%rdi), %xmm10
	vmovd	8(%rdi), %xmm1
	vpunpcklqdq	%xmm5, %xmm7, %xmm14
	vpunpcklqdq	%xmm10, %xmm15, %xmm8
	vpunpcklqdq	%xmm15, %xmm10, %xmm11
	vpunpcklqdq	%xmm15, %xmm15, %xmm0
	vmovdqa	%xmm14, -272(%rbp)
	vpunpcklqdq	%xmm1, %xmm10, %xmm9
	vinserti32x4	$0x1, %xmm11, %ymm0, %ymm12
	vmovd	12(%rdi), %xmm0
	vinserti32x4	$0x1, %xmm8, %ymm9, %ymm13
	vinserti32x8	$0x1, %ymm13, %zmm12, %zmm19
	vmovd	(%rbx), %xmm12
	vpunpcklqdq	%xmm12, %xmm6, %xmm3
	vpunpcklqdq	%xmm5, %xmm12, %xmm4
	vpunpcklqdq	%xmm6, %xmm12, %xmm10
	vinserti32x4	$0x1, %xmm14, %ymm3, %ymm2
	vmovd	16(%rdi), %xmm14
	vinserti32x4	$0x1, %xmm4, %ymm10, %ymm13
	vinserti32x8	$0x1, %ymm2, %zmm13, %zmm11
	vpunpcklqdq	%xmm0, %xmm1, %xmm2
	vpunpcklqdq	%xmm15, %xmm14, %xmm4
	vinserti32x4	$0x1, %xmm8, %ymm2, %ymm13
	vinserti32x4	$0x1, %xmm4, %ymm2, %ymm10
	vpmuldq	%zmm11, %zmm19, %zmm20
	vmovd	20(%rbx), %xmm11
	vinserti32x4	$0x1, %xmm2, %ymm8, %ymm2
	vinserti32x8	$0x1, %ymm10, %zmm13, %zmm21
	vmovd	16(%rbx), %xmm13
	vpunpcklqdq	%xmm6, %xmm5, %xmm10
	vmovdqa	%xmm10, -432(%rbp)
	vpunpcklqdq	%xmm11, %xmm12, %xmm4
	vpunpcklqdq	%xmm7, %xmm13, %xmm7
	vinserti32x4	$0x1, %xmm4, %ymm10, %ymm4
	vpunpcklqdq	%xmm13, %xmm11, %xmm13
	vinserti32x4	$0x1, %xmm7, %ymm3, %ymm10
	vmovdqa	%xmm13, -368(%rbp)
	vinserti32x8	$0x1, %ymm4, %zmm10, %zmm4
	vpunpcklqdq	%xmm14, %xmm0, %xmm10
	vmovdqa64	%zmm20, (%rdx)
	vpmuldq	%zmm4, %zmm21, %zmm22
	vmovd	20(%rdi), %xmm4
	vpunpcklqdq	%xmm15, %xmm4, %xmm15
	vinserti32x4	$0x1, %xmm9, %ymm15, %ymm15
	vinserti32x4	$0x1, %xmm10, %ymm9, %ymm9
	vinserti32x8	$0x1, %ymm15, %zmm9, %zmm23
	vmovd	24(%rbx), %xmm15
	vmovdqa64	%zmm22, 64(%rdx)
	vpunpcklqdq	%xmm15, %xmm12, %xmm12
	vinserti32x4	$0x1, %xmm13, %ymm12, %ymm12
	vinserti32x4	$0x1, -432(%rbp), %ymm7, %ymm13
	vinserti32x8	$0x1, %ymm12, %zmm13, %zmm12
	vmovd	24(%rdi), %xmm13
	vpmuldq	%zmm12, %zmm23, %zmm24
	vmovd	28(%rbx), %xmm12
	vpunpcklqdq	%xmm13, %xmm4, %xmm8
	vpunpcklqdq	%xmm4, %xmm14, %xmm4
	vinserti32x4	$0x1, %xmm8, %ymm10, %ymm10
	vpunpcklqdq	%xmm12, %xmm6, %xmm6
	vmovdqa	%xmm8, -432(%rbp)
	vmovdqa	-272(%rbp), %xmm8
	vinserti32x8	$0x1, %ymm2, %zmm10, %zmm25
	vpunpcklqdq	%xmm15, %xmm12, %xmm2
	vpunpcklqdq	%xmm12, %xmm5, %xmm5
	vinserti32x4	$0x1, %xmm3, %ymm8, %ymm3
	vmovdqa	%xmm2, -496(%rbp)
	vmovd	28(%rdi), %xmm8
	movq	%rdx, %rdi
	vinserti32x4	$0x1, -368(%rbp), %ymm2, %ymm2
	vmovdqa64	%zmm24, 128(%rdx)
	vpunpcklqdq	%xmm1, %xmm8, %xmm1
	vpunpcklqdq	%xmm0, %xmm8, %xmm0
	vinserti32x8	$0x1, %ymm2, %zmm3, %zmm26
	vpunpcklqdq	%xmm8, %xmm13, %xmm2
	vpunpcklqdq	%xmm13, %xmm8, %xmm13
	vinserti32x4	$0x1, %xmm2, %ymm4, %ymm14
	vpmuldq	%zmm26, %zmm25, %zmm27
	vinserti32x8	$0x1, %ymm9, %zmm14, %zmm9
	vmovdqa	-432(%rbp), %xmm14
	vpmuldq	%zmm26, %zmm9, %zmm28
	vinserti32x4	$0x1, %xmm1, %ymm14, %ymm3
	vinserti32x8	$0x1, %ymm10, %zmm3, %zmm1
	vpunpcklqdq	%xmm11, %xmm15, %xmm3
	vmovdqa	-272(%rbp), %xmm10
	vpunpcklqdq	%xmm12, %xmm15, %xmm15
	vinserti32x4	$0x1, %xmm7, %ymm3, %ymm9
	vpunpcklqdq	%xmm12, %xmm11, %xmm11
	vmovdqa64	%zmm27, 192(%rdx)
	vinserti32x4	$0x1, %xmm3, %ymm5, %ymm3
	vinserti32x4	$0x1, %xmm6, %ymm10, %ymm6
	vinserti32x4	$0x1, %xmm15, %ymm11, %ymm12
	vinserti32x8	$0x1, %ymm9, %zmm6, %zmm9
	vmovdqa64	%zmm28, 256(%rdx)
	vpmuldq	%zmm9, %zmm1, %zmm10
	vinserti32x4	$0x1, %xmm4, %ymm2, %ymm1
	vinserti32x4	$0x1, %xmm4, %ymm0, %ymm4
	vinserti32x8	$0x1, %ymm1, %zmm4, %zmm6
	vpunpcklqdq	%xmm8, %xmm8, %xmm0
	vinserti32x4	$0x1, %xmm14, %ymm2, %ymm2
	vinserti32x4	$0x1, %xmm0, %ymm13, %ymm8
	vinserti32x8	$0x1, %ymm8, %zmm2, %zmm14
	vmovdqa64	%zmm10, 320(%rdx)
	vmovdqa	-496(%rbp), %xmm9
	vmovdqa	-368(%rbp), %xmm4
	movq	%rdx, -272(%rbp)
	vinserti32x4	$0x1, %xmm9, %ymm7, %ymm7
	vinserti32x4	$0x1, %xmm9, %ymm4, %ymm9
	vinserti32x8	$0x1, %ymm7, %zmm3, %zmm1
	vinserti32x8	$0x1, %ymm12, %zmm9, %zmm7
	vpmuldq	%zmm1, %zmm6, %zmm6
	vpmuldq	%zmm7, %zmm14, %zmm5
	vmovdqa64	%zmm6, 384(%rdx)
	vmovdqa64	%zmm5, 448(%rdx)
	call	add_limbs.constprop.0.isra.0
	movq	-272(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -368(%rbp)
	call	adjust_limbs.constprop.0
	movl	$1, %r9d
	movq	%rbx, -840(%rbp)
	movq	-368(%rbp), %rbx
	movq	%r9, -272(%rbp)
	vmovdqa64	%zmm20, -368(%rbp)
	vmovdqa64	%zmm22, -432(%rbp)
	vmovdqa64	%zmm24, -496(%rbp)
	vmovdqa64	%zmm27, -560(%rbp)
	vmovdqa64	%zmm28, -624(%rbp)
	vmovdqa64	%zmm10, -688(%rbp)
	vmovdqa64	%zmm6, -752(%rbp)
	vmovdqa64	%zmm5, -816(%rbp)
	vzeroupper
	.p2align 4
	.p2align 3
.L368:
	leaq	-192(%rbp), %rsi
	xorl	%edi, %edi
	salq	-272(%rbp)
	movq	-272(%rbp), %r15
	call	getrusage
	fildq	-192(%rbp)
	fmuls	.LC19(%rip)
	movq	%r15, %r11
	fildq	-184(%rbp)
	faddp	%st, %st(1)
	fisttpq	-280(%rbp)
	testq	%r15, %r15
	jle	.L366
	xorl	%r15d, %r15d
	andl	$2, %r11d
	je	.L506
	cmpq	$1, %r11
	je	.L455
	cmpq	$2, %r11
	je	.L456
	vmovdqa64	-368(%rbp), %zmm10
	movq	%rbx, %rdi
	vmovdqa64	-432(%rbp), %zmm3
	movl	$1, %r15d
	vmovdqa64	-496(%rbp), %zmm1
	vmovdqa64	-560(%rbp), %zmm6
	vmovdqa64	-624(%rbp), %zmm0
	vmovdqa64	%zmm10, (%rbx)
	vmovdqa64	-688(%rbp), %zmm13
	vmovdqa64	-752(%rbp), %zmm8
	vmovdqa64	-816(%rbp), %zmm2
	vmovdqa64	%zmm3, 64(%rbx)
	vmovdqa64	%zmm1, 128(%rbx)
	vmovdqa64	%zmm6, 192(%rbx)
	vmovdqa64	%zmm0, 256(%rbx)
	vmovdqa64	%zmm13, 320(%rbx)
	vmovdqa64	%zmm8, 384(%rbx)
	vmovdqa64	%zmm2, 448(%rbx)
	call	add_limbs.constprop.0.isra.0
	call	adjust_limbs.constprop.0
.L456:
	vmovdqa64	-368(%rbp), %zmm14
	movq	%rbx, %rdi
	vmovdqa64	-432(%rbp), %zmm15
	addq	$1, %r15
	vmovdqa64	-496(%rbp), %zmm11
	vmovdqa64	-560(%rbp), %zmm12
	vmovdqa64	-624(%rbp), %zmm4
	vmovdqa64	%zmm14, (%rbx)
	vmovdqa64	-688(%rbp), %zmm9
	vmovdqa64	-752(%rbp), %zmm7
	vmovdqa64	-816(%rbp), %zmm5
	vmovdqa64	%zmm15, 64(%rbx)
	vmovdqa64	%zmm11, 128(%rbx)
	vmovdqa64	%zmm12, 192(%rbx)
	vmovdqa64	%zmm4, 256(%rbx)
	vmovdqa64	%zmm9, 320(%rbx)
	vmovdqa64	%zmm7, 384(%rbx)
	vmovdqa64	%zmm5, 448(%rbx)
	call	add_limbs.constprop.0.isra.0
	call	adjust_limbs.constprop.0
.L455:
	vmovdqa64	-368(%rbp), %zmm10
	movq	%rbx, %rdi
	vmovdqa64	-432(%rbp), %zmm3
	addq	$1, %r15
	vmovdqa64	-496(%rbp), %zmm1
	vmovdqa64	-560(%rbp), %zmm6
	vmovdqa64	-624(%rbp), %zmm0
	vmovdqa64	%zmm10, (%rbx)
	vmovdqa64	-688(%rbp), %zmm13
	vmovdqa64	-752(%rbp), %zmm8
	vmovdqa64	-816(%rbp), %zmm2
	vmovdqa64	%zmm3, 64(%rbx)
	vmovdqa64	%zmm1, 128(%rbx)
	vmovdqa64	%zmm6, 192(%rbx)
	vmovdqa64	%zmm0, 256(%rbx)
	vmovdqa64	%zmm13, 320(%rbx)
	vmovdqa64	%zmm8, 384(%rbx)
	vmovdqa64	%zmm2, 448(%rbx)
	call	add_limbs.constprop.0.isra.0
	call	adjust_limbs.constprop.0
	cmpq	%r15, -272(%rbp)
	je	.L509
.L506:
	vmovdqa64	-368(%rbp), %zmm29
	vmovdqa64	-432(%rbp), %zmm30
	vmovdqa64	-496(%rbp), %zmm31
	vmovdqa64	-560(%rbp), %zmm16
	vmovdqa64	-624(%rbp), %zmm17
	vmovdqa64	-688(%rbp), %zmm14
	vmovdqa64	-752(%rbp), %zmm15
	vmovdqa64	-816(%rbp), %zmm11
.L367:
	movq	%rbx, %rdi
	vmovdqa64	%zmm29, (%rbx)
	addq	$4, %r15
	vmovdqa64	%zmm30, 64(%rbx)
	vmovdqa64	%zmm31, 128(%rbx)
	vmovdqa64	%zmm16, 192(%rbx)
	vmovdqa64	%zmm17, 256(%rbx)
	vmovdqa64	%zmm14, 320(%rbx)
	vmovdqa64	%zmm15, 384(%rbx)
	vmovdqa64	%zmm11, 448(%rbx)
	call	add_limbs.constprop.0.isra.0
	call	adjust_limbs.constprop.0
	vmovdqa64	%zmm29, (%rbx)
	vmovdqa64	%zmm30, 64(%rbx)
	vmovdqa64	%zmm31, 128(%rbx)
	vmovdqa64	%zmm16, 192(%rbx)
	vmovdqa64	%zmm17, 256(%rbx)
	vmovdqa64	%zmm14, 320(%rbx)
	vmovdqa64	%zmm15, 384(%rbx)
	vmovdqa64	%zmm11, 448(%rbx)
	call	add_limbs.constprop.0.isra.0
	call	adjust_limbs.constprop.0
	vmovdqa64	%zmm29, (%rbx)
	vmovdqa64	%zmm30, 64(%rbx)
	vmovdqa64	%zmm31, 128(%rbx)
	vmovdqa64	%zmm16, 192(%rbx)
	vmovdqa64	%zmm17, 256(%rbx)
	vmovdqa64	%zmm14, 320(%rbx)
	vmovdqa64	%zmm15, 384(%rbx)
	vmovdqa64	%zmm11, 448(%rbx)
	call	add_limbs.constprop.0.isra.0
	call	adjust_limbs.constprop.0
	vmovdqa64	%zmm29, (%rbx)
	vmovdqa64	%zmm30, 64(%rbx)
	vmovdqa64	%zmm31, 128(%rbx)
	vmovdqa64	%zmm16, 192(%rbx)
	vmovdqa64	%zmm17, 256(%rbx)
	vmovdqa64	%zmm14, 320(%rbx)
	vmovdqa64	%zmm15, 384(%rbx)
	vmovdqa64	%zmm11, 448(%rbx)
	call	add_limbs.constprop.0.isra.0
	call	adjust_limbs.constprop.0
	cmpq	%r15, -272(%rbp)
	jne	.L367
.L509:
	vzeroupper
.L366:
	leaq	-192(%rbp), %rsi
	xorl	%edi, %edi
	call	getrusage
	fildq	-192(%rbp)
	fmuls	.LC19(%rip)
	fildq	-184(%rbp)
	faddp	%st, %st(1)
	fildq	-280(%rbp)
	fsubrp	%st, %st(1)
	fisttpq	-280(%rbp)
	movq	-280(%rbp), %r10
	cmpq	$249999, %r10
	jle	.L368
	vxorpd	%xmm12, %xmm12, %xmm12
	movl	$.LC20, %edi
	movl	$1, %eax
	movq	-272(%rbp), %r8
	vcvtsi2sdq	%r10, %xmm12, %xmm4
	movq	%rbx, -272(%rbp)
	movq	-840(%rbp), %rbx
	vcvtsi2sdq	%r8, %xmm12, %xmm9
	vdivsd	%xmm9, %xmm4, %xmm0
	call	printf
#APP
# 304 "test4.c" 1
	mfence
# 0 "" 2
#NO_APP
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	movl	$1, %r15d
	call	__gmpz_mul
	movq	-272(%rbp), %rdx
	movq	%rbx, -368(%rbp)
	movq	%rdx, -432(%rbp)
	.p2align 4
	.p2align 3
.L371:
	leaq	-192(%rbp), %rsi
	xorl	%edi, %edi
	addq	%r15, %r15
	call	getrusage
	fildq	-192(%rbp)
	fmuls	.LC19(%rip)
	fildq	-184(%rbp)
	faddp	%st, %st(1)
	fisttpq	-272(%rbp)
	testq	%r15, %r15
	jle	.L369
	movq	%r15, %rsi
	xorl	%ebx, %ebx
	andl	$6, %esi
	je	.L370
	cmpq	$1, %rsi
	je	.L457
	cmpq	$2, %rsi
	je	.L458
	cmpq	$3, %rsi
	je	.L459
	cmpq	$4, %rsi
	je	.L460
	cmpq	$5, %rsi
	je	.L461
	cmpq	$6, %rsi
	je	.L462
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	movl	$1, %ebx
	call	__gmpz_mul
.L462:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	addq	$1, %rbx
	call	__gmpz_mul
.L461:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	addq	$1, %rbx
	call	__gmpz_mul
.L460:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	addq	$1, %rbx
	call	__gmpz_mul
.L459:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	addq	$1, %rbx
	call	__gmpz_mul
.L458:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	addq	$1, %rbx
	call	__gmpz_mul
.L457:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	addq	$1, %rbx
	call	__gmpz_mul
	cmpq	%rbx, %r15
	je	.L369
.L370:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	addq	$8, %rbx
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	__gmpz_mul
	cmpq	%rbx, %r15
	jne	.L370
.L369:
	leaq	-192(%rbp), %rsi
	xorl	%edi, %edi
	call	getrusage
	fildq	-192(%rbp)
	fmuls	.LC19(%rip)
	fildq	-184(%rbp)
	faddp	%st, %st(1)
	fildq	-272(%rbp)
	fsubrp	%st, %st(1)
	fisttpq	-272(%rbp)
	movq	-272(%rbp), %rcx
	cmpq	$249999, %rcx
	jle	.L371
	vxorpd	%xmm7, %xmm7, %xmm7
	movq	-432(%rbp), %rdi
	movl	$1, %eax
	movq	-368(%rbp), %rbx
	vcvtsi2sdq	%r15, %xmm7, %xmm10
	xorl	%r15d, %r15d
	vcvtsi2sdq	%rcx, %xmm7, %xmm5
	movq	%rdi, -272(%rbp)
	movl	$.LC21, %edi
	vdivsd	%xmm10, %xmm5, %xmm0
	call	printf
	movq	-824(%rbp), %rdi
	call	strlen
	movq	-272(%rbp), %r9
	movq	%rax, %r11
	movq	%rax, %rdx
	andl	$7, %r11d
	je	.L510
	movq	-288(%rbp), %r8
	movq	-824(%rbp), %rax
	movzbl	(%r8), %r10d
	cmpb	%r10b, (%rax)
	jne	.L491
	movl	$1, %r15d
	cmpq	$1, %r11
	je	.L492
	cmpq	$2, %r11
	je	.L463
	cmpq	$3, %r11
	je	.L464
	cmpq	$4, %r11
	je	.L465
	cmpq	$5, %r11
	je	.L466
	cmpq	$6, %r11
	je	.L467
	movzbl	1(%r8), %esi
	cmpb	%sil, 1(%rax)
	jne	.L493
	movl	$2, %r15d
.L467:
	movq	-288(%rbp), %r11
	movq	-824(%rbp), %rcx
	leaq	1(%r15), %rdi
	movzbl	(%r11,%r15), %r8d
	cmpb	%r8b, (%rcx,%r15)
	jne	.L497
	movq	%rdi, %r15
.L466:
	movq	-288(%rbp), %rax
	movq	-824(%rbp), %rcx
	leaq	1(%r15), %r10
	movzbl	(%rax,%r15), %esi
	cmpb	%sil, (%rcx,%r15)
	jne	.L497
	movq	%r10, %r15
.L465:
	movq	-288(%rbp), %r11
	movq	-824(%rbp), %rcx
	leaq	1(%r15), %rdi
	movzbl	(%r11,%r15), %r8d
	cmpb	%r8b, (%rcx,%r15)
	jne	.L497
	movq	%rdi, %r15
.L464:
	movq	-288(%rbp), %rax
	movq	-824(%rbp), %rcx
	leaq	1(%r15), %r10
	movzbl	(%rax,%r15), %esi
	cmpb	%sil, (%rcx,%r15)
	jne	.L497
	movq	%r10, %r15
.L463:
	movq	-288(%rbp), %r8
	movq	-824(%rbp), %r11
	leaq	1(%r15), %rdi
	movzbl	(%r8,%r15), %r10d
	cmpb	%r10b, (%r11,%r15)
	jne	.L488
	movq	%rdi, %r15
	jmp	.L372
	.p2align 4,,10
	.p2align 3
.L373:
	movzbl	(%r8,%r15), %ecx
	leaq	1(%r15), %rax
	cmpb	%cl, (%r11,%r15)
	jne	.L488
	movzbl	(%r8,%rax), %esi
	movq	%rax, %r15
	leaq	1(%rax), %rdi
	cmpb	%sil, (%r11,%rax)
	jne	.L488
	movzbl	(%r8,%rdi), %r10d
	movq	%rdi, %r15
	cmpb	%r10b, (%r11,%rdi)
	jne	.L488
	movzbl	2(%r8,%rax), %edi
	leaq	2(%rax), %r15
	leaq	3(%rax), %rcx
	cmpb	%dil, 2(%r11,%rax)
	jne	.L488
	movzbl	3(%r8,%rax), %esi
	movq	%rcx, %r15
	leaq	4(%rax), %r10
	cmpb	%sil, 3(%r11,%rax)
	jne	.L488
	movzbl	4(%r8,%rax), %edi
	movq	%r10, %r15
	leaq	5(%rax), %rcx
	cmpb	%dil, 4(%r11,%rax)
	jne	.L488
	movzbl	5(%r8,%rax), %esi
	movq	%rcx, %r15
	leaq	6(%rax), %r10
	cmpb	%sil, 5(%r11,%rax)
	jne	.L488
	movzbl	6(%r8,%rax), %edi
	movq	%r10, %r15
	leaq	7(%rax), %rcx
	cmpb	%dil, 6(%r11,%rax)
	jne	.L488
	movq	%rcx, %r15
.L372:
	cmpq	%r15, %rdx
	jne	.L373
	movl	$.LC26, %esi
	movl	$.LC27, %edi
	xorl	%eax, %eax
	movq	%r9, -272(%rbp)
	call	printf
	movq	%r13, %rdi
	call	__gmpz_clear
	movq	%r12, %rdi
	call	__gmpz_clear
	movq	%r14, %rdi
	call	__gmpz_clear
	movq	-272(%rbp), %r9
	cmpl	$10000000, -828(%rbp)
	jne	.L374
	addq	$832, %rsp
	popq	%rbx
	popq	%rdx
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%rdx), %rsp
	.cfi_def_cfa 7, 8
	ret
.L492:
	.cfi_restore_state
	movq	%rax, %r11
	jmp	.L372
.L510:
	movq	-824(%rbp), %r11
	movq	-288(%rbp), %r8
	jmp	.L372
.L497:
	movq	-288(%rbp), %r8
	movq	%rcx, %r11
.L488:
	movl	$.LC22, %edi
	movq	%r8, -368(%rbp)
	movq	%r11, -272(%rbp)
	call	puts
	movl	%r15d, %esi
	movl	$.LC23, %edi
	xorl	%eax, %eax
	movq	-368(%rbp), %rbx
	movq	-272(%rbp), %r12
	movsbl	(%rbx,%r15), %ecx
	movsbl	(%r12,%r15), %edx
	call	printf
	movq	-368(%rbp), %rsi
	movl	$.LC24, %edi
	xorl	%eax, %eax
	call	printf
	movq	-272(%rbp), %rsi
	movl	$.LC25, %edi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
.L493:
	movq	-824(%rbp), %r11
	jmp	.L488
.L491:
	movq	%rax, %r11
	jmp	.L488
	.cfi_endproc
.LFE6649:
	.size	test, .-test
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB6650:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	call	test
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE6650:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC19:
	.long	1232348160
	.ident	"GCC: (GNU) 14.2.1 20250110 (Red Hat 14.2.1-7)"
	.section	.note.GNU-stack,"",@progbits
