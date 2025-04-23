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
	movzbl	(%rdi), %r14d
	movzbl	(%rsi), %r15d
	cmpb	$45, %r14b
	sete	%al
	xorl	%edx, %edx
	addq	%rax, %rdi
	cmpb	$45, %r15b
	sete	%dl
	leaq	(%rsi,%rdx), %rbx
	call	trim_leading_zeros_and_whitespace
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	trim_leading_zeros_and_whitespace
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	trim_trailing_newline
	movq	%r12, %rdi
	call	trim_trailing_newline
	movq	%rbp, %rdi
	call	strlen
	movq	%r12, %rdi
	movq	%rax, %r13
	call	strlen
	cmpq	%rax, %r13
	jne	.L28
	xorl	%ebx, %ebx
	testq	%r13, %r13
	je	.L30
	movq	%r13, %rcx
	andl	$7, %ecx
	je	.L29
	cmpq	$1, %rcx
	je	.L74
	cmpq	$2, %rcx
	je	.L75
	cmpq	$3, %rcx
	je	.L76
	cmpq	$4, %rcx
	je	.L77
	cmpq	$5, %rcx
	je	.L78
	cmpq	$6, %rcx
	je	.L79
	movzbl	(%r12), %esi
	cmpb	%sil, 0(%rbp)
	jne	.L88
	movl	$1, %ebx
.L79:
	movzbl	(%r12,%rbx), %edi
	cmpb	%dil, 0(%rbp,%rbx)
	jne	.L88
	addq	$1, %rbx
.L78:
	movzbl	(%r12,%rbx), %r8d
	cmpb	%r8b, 0(%rbp,%rbx)
	jne	.L88
	addq	$1, %rbx
.L77:
	movzbl	(%r12,%rbx), %r9d
	cmpb	%r9b, 0(%rbp,%rbx)
	jne	.L88
	addq	$1, %rbx
.L76:
	movzbl	(%r12,%rbx), %r10d
	cmpb	%r10b, 0(%rbp,%rbx)
	jne	.L88
	addq	$1, %rbx
.L75:
	movzbl	(%r12,%rbx), %r11d
	cmpb	%r11b, 0(%rbp,%rbx)
	jne	.L88
	addq	$1, %rbx
.L74:
	movzbl	(%r12,%rbx), %eax
	cmpb	%al, 0(%rbp,%rbx)
	jne	.L88
	addq	$1, %rbx
	cmpq	%rbx, %r13
	je	.L30
.L29:
	movzbl	(%r12,%rbx), %edx
	cmpb	%dl, 0(%rbp,%rbx)
	jne	.L88
	leaq	1(%rbx), %rcx
	movzbl	(%r12,%rcx), %esi
	movq	%rcx, %rbx
	cmpb	%sil, 0(%rbp,%rcx)
	jne	.L88
	addq	$1, %rbx
	movzbl	(%r12,%rbx), %edi
	cmpb	%dil, 0(%rbp,%rbx)
	jne	.L88
	movzbl	2(%r12,%rcx), %r8d
	leaq	2(%rcx), %rbx
	cmpb	%r8b, 2(%rbp,%rcx)
	jne	.L88
	movzbl	3(%r12,%rcx), %r9d
	leaq	3(%rcx), %rbx
	cmpb	%r9b, 3(%rbp,%rcx)
	jne	.L88
	movzbl	4(%r12,%rcx), %r10d
	leaq	4(%rcx), %rbx
	cmpb	%r10b, 4(%rbp,%rcx)
	jne	.L88
	movzbl	5(%r12,%rcx), %r11d
	leaq	5(%rcx), %rbx
	cmpb	%r11b, 5(%rbp,%rcx)
	jne	.L88
	movzbl	6(%r12,%rcx), %eax
	leaq	6(%rcx), %rbx
	cmpb	%al, 6(%rbp,%rcx)
	jne	.L88
	leaq	7(%rcx), %rbx
	cmpq	%rbx, %r13
	jne	.L29
.L30:
	cmpb	$45, %r14b
	movl	$1, %eax
	sete	%r14b
	cmpb	$45, %r15b
	sete	%r15b
	cmpb	%r15b, %r14b
	je	.L25
	movl	$.LC11, %edi
	call	puts
	.p2align 4
	.p2align 3
.L31:
	xorl	%eax, %eax
.L25:
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
.L88:
	.cfi_restore_state
	movl	$.LC7, %edi
	call	puts
	movq	%rbx, %rsi
	movl	$.LC8, %edi
	xorl	%eax, %eax
	call	printf
	movsbl	0(%rbp,%rbx), %edx
	movq	%rbx, %rsi
	movq	%rbx, %rcx
	movsbl	(%r12,%rbx), %r8d
	movl	$.LC9, %edi
	xorl	%eax, %eax
	call	printf
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L28:
	movl	$.LC4, %edi
	call	puts
	movq	%r12, %rdi
	call	strlen
	movq	%rbp, %rdi
	movq	%rax, %r13
	call	strlen
	movq	%r13, %rdx
	movl	$.LC5, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	printf
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movl	$.LC6, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L31
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
	jne	.L95
	cmpb	$0, 1(%rax)
	jne	.L95
.L92:
	movq	%rbp, %rdi
	call	free
	movl	$511, %esi
	movq	%rbx, %rdi
	call	mkdir
	testl	%eax, %eax
	je	.L109
	call	__errno_location
	movl	(%rax), %edi
	cmpl	$17, %edi
	jne	.L111
.L109:
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
.L95:
	.cfi_restore_state
	cmpl	$47, %edx
	je	.L112
.L96:
	movq	%rax, %rdi
	call	create_directory
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L112:
	cmpb	$0, 1(%rax)
	je	.L92
	jmp	.L96
.L111:
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
	je	.L116
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L116:
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
	je	.L119
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
.L119:
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
	.type	multiply.constprop.0, @function
multiply.constprop.0:
.LFB6654:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	call	accumulate_multiply_AVX
	movq	%rdx, %rdi
	call	add_limbs.constprop.0.isra.0
	vzeroupper
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	adjust_limbs.constprop.0
	.cfi_endproc
.LFE6654:
	.size	multiply.constprop.0, .-multiply.constprop.0
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
	jle	.L132
	movl	%edi, %ebx
	movl	%edi, %r11d
	movl	$1, %r8d
	movl	$1, %ecx
	leaq	8(%rdx), %r13
	.p2align 4
	.p2align 3
.L129:
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
	je	.L128
	cmpq	$1, %r12
	je	.L180
	cmpq	$2, %r12
	je	.L181
	cmpq	$3, %r12
	je	.L182
	cmpq	$4, %r12
	je	.L183
	cmpq	$5, %r12
	je	.L184
	cmpq	$6, %r12
	je	.L185
	movq	(%rax), %rsi
	xorl	%edi, %edi
	addq	$8, %rax
.L185:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L184:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L183:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L182:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L181:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L180:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
	cmpq	%rax, %r9
	je	.L209
.L128:
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
	jne	.L128
.L209:
	movq	%rsi, (%rdx,%r8,8)
	addq	$1, %r8
	addl	%r10d, %ecx
	cmpq	%r8, %r11
	jne	.L129
	movl	%ebx, %r8d
	subl	$2, %r8d
	je	.L133
	movslq	%ebx, %r10
	leaq	(%rdx,%r10,8), %r10
	.p2align 4
	.p2align 3
.L131:
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
	je	.L130
	cmpq	$1, %r12
	je	.L186
	cmpq	$2, %r12
	je	.L187
	cmpq	$3, %r12
	je	.L188
	cmpq	$4, %r12
	je	.L189
	cmpq	$5, %r12
	je	.L190
	cmpq	$6, %r12
	je	.L191
	movq	(%rax), %rsi
	xorl	%edi, %edi
	addq	$8, %rax
.L191:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L190:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L189:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L188:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L187:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L186:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
	cmpq	%r9, %rax
	je	.L208
.L130:
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
	jne	.L130
.L208:
	movq	%rsi, (%r10)
	addl	%r11d, %ecx
	addq	$8, %r10
	subl	$1, %r8d
	jne	.L131
	leal	-2(%rbx,%rbx), %r11d
	movslq	%r11d, %rbx
	salq	$3, %rbx
.L127:
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
.L132:
	.cfi_restore_state
	movl	$8, %ebx
	movl	$1, %r11d
	jmp	.L127
.L133:
	movl	$16, %ebx
	movl	$2, %r11d
	jmp	.L127
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
	jle	.L214
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
	je	.L213
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
	je	.L221
	.p2align 4
	.p2align 3
.L213:
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
	jne	.L213
.L221:
	andl	$-2, %r9d
	salq	$32, %rbx
	leal	3(%r9), %r9d
	subq	%rbx, %rax
	movq	-8(%r8,%r9,8), %rdi
.L212:
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
.L214:
	.cfi_restore_state
	movq	%rax, %rdi
	movq	%r8, %r10
	jmp	.L212
	.cfi_endproc
.LFE6644:
	.size	adjust_limbs, .-adjust_limbs
	.p2align 4
	.globl	multiply
	.type	multiply, @function
multiply:
.LFB6645:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	call	accumulate_multiply_AVX
	movq	%rdx, %rdi
	call	add_limbs.constprop.0.isra.0
	vzeroupper
	popq	%rbx
	.cfi_def_cfa_offset 8
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
	jle	.L265
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
	je	.L227
	cmpq	$1, %rax
	je	.L250
	cmpq	$2, %rax
	je	.L251
	cmpq	$3, %rax
	je	.L252
	cmpq	$4, %rax
	je	.L253
	cmpq	$5, %rax
	je	.L254
	cmpq	$6, %rax
	jne	.L268
.L255:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L254:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L253:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L252:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L251:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L250:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
	cmpq	%rbp, %rbx
	je	.L226
.L227:
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
	jne	.L227
.L226:
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
.L268:
	.cfi_restore_state
	movq	(%rdi), %rsi
	xorl	%eax, %eax
	movl	$.LC16, %edi
	addq	$8, %rbx
	call	printf
	jmp	.L255
	.p2align 4,,10
	.p2align 3
.L265:
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
	jle	.L310
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
	je	.L271
	cmpq	$1, %rax
	je	.L294
	cmpq	$2, %rax
	je	.L295
	cmpq	$3, %rax
	je	.L296
	cmpq	$4, %rax
	je	.L297
	cmpq	$5, %rax
	je	.L298
	cmpq	$6, %rax
	jne	.L313
.L299:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L298:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L297:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L296:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L295:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L294:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
	cmpq	%rbp, %rbx
	je	.L308
.L271:
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
	jne	.L271
.L308:
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
.L313:
	.cfi_restore_state
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
	jmp	.L299
	.p2align 4,,10
	.p2align 3
.L310:
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
	jle	.L320
	movslq	%esi, %rsi
	movq	%rdi, %rbx
	xorl	%r12d, %r12d
	leaq	-8(,%rsi,8), %rax
	leaq	(%rdi,%rsi,8), %r13
	shrq	$3, %rax
	addq	$1, %rax
	andl	$3, %eax
	je	.L316
	cmpq	$1, %rax
	je	.L333
	cmpq	$2, %rax
	je	.L334
	movq	(%rdi), %rcx
	movq	(%rdx), %rdi
	movl	$17, %esi
	movl	$.LC17, %edx
	xorl	%eax, %eax
	movl	$16, %r12d
	addq	$8, %rbx
	call	snprintf
.L334:
	movq	(%rbx), %rcx
	movslq	%r12d, %rdi
	movl	$.LC17, %edx
	addq	0(%rbp), %rdi
	movl	$17, %esi
	xorl	%eax, %eax
	addl	$16, %r12d
	addq	$8, %rbx
	call	snprintf
.L333:
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
	je	.L339
.L316:
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
	jne	.L316
.L339:
	movslq	%r12d, %r12
.L315:
	movq	0(%rbp), %rcx
	movb	$0, (%rcx,%r12)
	movq	0(%rbp), %r9
	cmpb	$48, (%r9)
	leaq	1(%r9), %r10
	jne	.L340
	.p2align 4
	.p2align 4
	.p2align 3
.L318:
	movq	%r10, 0(%rbp)
	addq	$1, %r10
	cmpb	$48, -1(%r10)
	je	.L318
.L340:
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
.L320:
	.cfi_restore_state
	xorl	%r12d, %r12d
	jmp	.L315
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$32, %edi
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	xorl	%r14d, %r14d
	pushq	%r13
	pushq	%r12
	pushq	%r10
	pushq	%rbx
	subq	$288, %rsp
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 10, -56
	.cfi_offset 3, -64
	call	malloc
	movl	$32, %edi
	movq	%rax, %r13
	call	malloc
	movl	$512, %edx
	movl	$64, %esi
	leaq	-248(%rbp), %rdi
	movq	%rax, %r12
	call	posix_memalign
	testl	%eax, %eax
	jne	.L343
	movq	-248(%rbp), %r14
.L343:
	movl	$65, %edi
	leaq	-240(%rbp), %rbx
	call	malloc
	leaq	32(%r12), %rdx
	leaq	64(%r14), %rcx
	movl	$0, -292(%rbp)
	movq	%rax, %r8
	leaq	32(%r13), %rax
	movq	%rdx, -320(%rbp)
	movq	%rax, -312(%rbp)
	movq	%rcx, -328(%rbp)
	movq	%r8, -280(%rbp)
	.p2align 4
	.p2align 3
.L358:
	xorl	%eax, %eax
	movl	$64, %ecx
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%r14, %rdi
	rep stosq
	vmovdqu8	%ymm0, (%r12)
	movq	%rbx, %rdi
	vmovdqu8	%ymm0, 0(%r13)
	vzeroupper
	call	__gmpz_init
	leaq	-224(%rbp), %rdi
	call	__gmpz_init
	leaq	-208(%rbp), %rdi
	call	__gmpz_init
	xorl	%edi, %edi
	call	time
	movl	%eax, %edi
	call	srand
	movq	-312(%rbp), %r15
	movq	%r12, -264(%rbp)
	movq	%r13, %r12
	.p2align 4
	.p2align 3
.L344:
	call	rand
	addq	$4, %r12
	movl	%eax, -4(%r12)
	cmpq	%r15, %r12
	jne	.L344
	movq	-264(%rbp), %r12
	movq	-320(%rbp), %r15
	.p2align 4
	.p2align 3
.L345:
	call	rand
	addq	$4, %r12
	movl	%eax, -4(%r12)
	cmpq	%r15, %r12
	jne	.L345
	movq	-264(%rbp), %r12
	xorl	%r15d, %r15d
.L346:
	movl	$32, %edx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	__gmpz_mul_2exp
	movl	0(%r13,%r15), %edx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	__gmpz_add_ui
	leaq	-224(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	(%r12,%r15), %edx
	leaq	-224(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	__gmpz_mul_2exp
	movl	4(%r13,%r15), %edx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	__gmpz_add_ui
	leaq	-224(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	4(%r12,%r15), %edx
	leaq	-224(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	__gmpz_mul_2exp
	movl	8(%r13,%r15), %edx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	__gmpz_add_ui
	leaq	-224(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	8(%r12,%r15), %edx
	leaq	-224(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	__gmpz_mul_2exp
	movl	12(%r13,%r15), %edx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	__gmpz_add_ui
	leaq	-224(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	12(%r12,%r15), %edx
	addq	$16, %r15
	leaq	-224(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	cmpq	$32, %r15
	jne	.L346
	addl	$1, -292(%rbp)
	movl	-292(%rbp), %esi
	movl	$.LC18, %edi
	xorl	%eax, %eax
	call	printf
	leaq	-224(%rbp), %rdx
	movq	%rbx, %rsi
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
	leaq	-208(%rbp), %rdx
	movl	$16, %esi
	xorl	%edi, %edi
	call	__gmpz_get_str
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	movq	%rax, -288(%rbp)
	call	multiply.constprop.0
	movq	%r13, -264(%rbp)
	xorl	%r10d, %r10d
	movq	-280(%rbp), %r13
	movq	-328(%rbp), %r15
	movq	%r12, -272(%rbp)
	movq	%r14, %r12
	movq	%r14, -304(%rbp)
	movl	%r10d, %r14d
	.p2align 4
	.p2align 3
.L347:
	movq	(%r12), %rcx
	movslq	%r14d, %rdi
	movl	$.LC17, %edx
	xorl	%eax, %eax
	addq	%r13, %rdi
	movl	$17, %esi
	addq	$8, %r12
	addl	$16, %r14d
	call	snprintf
	cmpq	%r15, %r12
	jne	.L347
	movq	-280(%rbp), %r11
	movslq	%r14d, %r9
	movq	-264(%rbp), %r13
	movq	-272(%rbp), %r12
	movq	-304(%rbp), %r14
	movb	$0, (%r11,%r9)
	cmpb	$48, (%r11)
	jne	.L348
	.p2align 4
	.p2align 4
	.p2align 3
.L349:
	addq	$1, %r11
	cmpb	$48, (%r11)
	je	.L349
	movq	%r11, -280(%rbp)
.L348:
#APP
# 298 "test4.c" 1
	mfence
# 0 "" 2
#NO_APP
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	multiply.constprop.0
	movq	$1, -264(%rbp)
	.p2align 4
	.p2align 3
.L352:
	leaq	-192(%rbp), %rsi
	xorl	%edi, %edi
	salq	-264(%rbp)
	movq	-264(%rbp), %r15
	call	getrusage
	fildq	-192(%rbp)
	fmuls	.LC19(%rip)
	movq	%r15, %r8
	fildq	-184(%rbp)
	faddp	%st, %st(1)
	fisttpq	-272(%rbp)
	testq	%r15, %r15
	jle	.L350
	xorl	%r15d, %r15d
	andl	$6, %r8d
	je	.L351
	cmpq	$1, %r8
	je	.L451
	cmpq	$2, %r8
	je	.L452
	cmpq	$3, %r8
	je	.L453
	cmpq	$4, %r8
	je	.L454
	cmpq	$5, %r8
	je	.L455
	cmpq	$6, %r8
	je	.L456
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	movl	$1, %r15d
	call	multiply.constprop.0
.L456:
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	addq	$1, %r15
	call	multiply.constprop.0
.L455:
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	addq	$1, %r15
	call	multiply.constprop.0
.L454:
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	addq	$1, %r15
	call	multiply.constprop.0
.L453:
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	addq	$1, %r15
	call	multiply.constprop.0
.L452:
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	addq	$1, %r15
	call	multiply.constprop.0
.L451:
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	addq	$1, %r15
	call	multiply.constprop.0
	cmpq	%r15, -264(%rbp)
	je	.L350
.L351:
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	addq	$8, %r15
	call	multiply.constprop.0
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	multiply.constprop.0
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	multiply.constprop.0
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	multiply.constprop.0
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	multiply.constprop.0
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	multiply.constprop.0
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	multiply.constprop.0
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	multiply.constprop.0
	cmpq	%r15, -264(%rbp)
	jne	.L351
.L350:
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
	movq	-272(%rbp), %rdx
	cmpq	$249999, %rdx
	jle	.L352
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$.LC20, %edi
	movl	$1, %eax
	vcvtsi2sdq	%rdx, %xmm2, %xmm3
	vcvtsi2sdq	-264(%rbp), %xmm2, %xmm1
	vdivsd	%xmm1, %xmm3, %xmm0
	call	printf
#APP
# 304 "test4.c" 1
	mfence
# 0 "" 2
#NO_APP
	leaq	-224(%rbp), %rdx
	movq	%rbx, %rsi
	leaq	-208(%rbp), %rdi
	movl	$1, %r15d
	call	__gmpz_mul
	movq	%r12, -272(%rbp)
	.p2align 4
	.p2align 3
.L355:
	leaq	-192(%rbp), %rsi
	xorl	%edi, %edi
	addq	%r15, %r15
	call	getrusage
	fildq	-192(%rbp)
	fmuls	.LC19(%rip)
	fildq	-184(%rbp)
	faddp	%st, %st(1)
	fisttpq	-264(%rbp)
	testq	%r15, %r15
	jle	.L353
	movq	%r15, %rcx
	xorl	%r12d, %r12d
	andl	$6, %ecx
	je	.L354
	cmpq	$1, %rcx
	je	.L457
	cmpq	$2, %rcx
	je	.L458
	cmpq	$3, %rcx
	je	.L459
	cmpq	$4, %rcx
	je	.L460
	cmpq	$5, %rcx
	je	.L461
	cmpq	$6, %rcx
	je	.L462
	leaq	-224(%rbp), %rdx
	movq	%rbx, %rsi
	leaq	-208(%rbp), %rdi
	movl	$1, %r12d
	call	__gmpz_mul
.L462:
	leaq	-224(%rbp), %rdx
	movq	%rbx, %rsi
	leaq	-208(%rbp), %rdi
	addq	$1, %r12
	call	__gmpz_mul
.L461:
	leaq	-224(%rbp), %rdx
	movq	%rbx, %rsi
	leaq	-208(%rbp), %rdi
	addq	$1, %r12
	call	__gmpz_mul
.L460:
	leaq	-224(%rbp), %rdx
	movq	%rbx, %rsi
	leaq	-208(%rbp), %rdi
	addq	$1, %r12
	call	__gmpz_mul
.L459:
	leaq	-224(%rbp), %rdx
	movq	%rbx, %rsi
	leaq	-208(%rbp), %rdi
	addq	$1, %r12
	call	__gmpz_mul
.L458:
	leaq	-224(%rbp), %rdx
	movq	%rbx, %rsi
	leaq	-208(%rbp), %rdi
	addq	$1, %r12
	call	__gmpz_mul
.L457:
	leaq	-224(%rbp), %rdx
	movq	%rbx, %rsi
	leaq	-208(%rbp), %rdi
	addq	$1, %r12
	call	__gmpz_mul
	cmpq	%r12, %r15
	je	.L353
.L354:
	leaq	-224(%rbp), %rdx
	movq	%rbx, %rsi
	leaq	-208(%rbp), %rdi
	addq	$8, %r12
	call	__gmpz_mul
	leaq	-224(%rbp), %rdx
	movq	%rbx, %rsi
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
	leaq	-224(%rbp), %rdx
	movq	%rbx, %rsi
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
	leaq	-224(%rbp), %rdx
	movq	%rbx, %rsi
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
	leaq	-224(%rbp), %rdx
	movq	%rbx, %rsi
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
	leaq	-224(%rbp), %rdx
	movq	%rbx, %rsi
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
	leaq	-224(%rbp), %rdx
	movq	%rbx, %rsi
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
	leaq	-224(%rbp), %rdx
	movq	%rbx, %rsi
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
	cmpq	%r12, %r15
	jne	.L354
.L353:
	xorl	%edi, %edi
	leaq	-192(%rbp), %rsi
	call	getrusage
	fildq	-192(%rbp)
	fmuls	.LC19(%rip)
	fildq	-184(%rbp)
	faddp	%st, %st(1)
	fildq	-264(%rbp)
	fsubrp	%st, %st(1)
	fisttpq	-264(%rbp)
	movq	-264(%rbp), %rdi
	cmpq	$249999, %rdi
	jle	.L355
	vxorpd	%xmm4, %xmm4, %xmm4
	movl	$1, %eax
	movq	-272(%rbp), %r12
	vcvtsi2sdq	%rdi, %xmm4, %xmm5
	movl	$.LC21, %edi
	vcvtsi2sdq	%r15, %xmm4, %xmm6
	xorl	%r15d, %r15d
	vdivsd	%xmm6, %xmm5, %xmm0
	call	printf
	movq	-288(%rbp), %rdi
	call	strlen
	movq	%rax, %r10
	movq	%rax, %rdx
	andl	$7, %r10d
	je	.L513
	movq	-280(%rbp), %rsi
	movq	-288(%rbp), %r9
	movzbl	(%rsi), %r11d
	cmpb	%r11b, (%r9)
	jne	.L495
	movl	$1, %r15d
	cmpq	$1, %r10
	je	.L496
	cmpq	$2, %r10
	je	.L463
	cmpq	$3, %r10
	je	.L464
	cmpq	$4, %r10
	je	.L465
	cmpq	$5, %r10
	je	.L466
	cmpq	$6, %r10
	je	.L467
	movzbl	1(%rsi), %eax
	cmpb	%al, 1(%r9)
	jne	.L497
	movl	$2, %r15d
.L467:
	movq	-280(%rbp), %r10
	movq	-288(%rbp), %rcx
	leaq	1(%r15), %rdi
	movzbl	(%r10,%r15), %r9d
	cmpb	%r9b, (%rcx,%r15)
	jne	.L501
	movq	%rdi, %r15
.L466:
	movq	-280(%rbp), %rsi
	movq	-288(%rbp), %rcx
	leaq	1(%r15), %r11
	movzbl	(%rsi,%r15), %r8d
	cmpb	%r8b, (%rcx,%r15)
	jne	.L501
	movq	%r11, %r15
.L465:
	movq	-280(%rbp), %rdi
	movq	-288(%rbp), %rcx
	leaq	1(%r15), %rax
	movzbl	(%rdi,%r15), %r10d
	cmpb	%r10b, (%rcx,%r15)
	jne	.L501
	movq	%rax, %r15
.L464:
	movq	-280(%rbp), %r11
	movq	-288(%rbp), %rcx
	leaq	1(%r15), %r9
	movzbl	(%r11,%r15), %esi
	cmpb	%sil, (%rcx,%r15)
	jne	.L501
	movq	%r9, %r15
.L463:
	movq	-280(%rbp), %r8
	movq	-288(%rbp), %rdi
	leaq	1(%r15), %rax
	movzbl	(%r8,%r15), %r10d
	cmpb	%r10b, (%rdi,%r15)
	jne	.L492
	movq	%rax, %r15
	jmp	.L356
	.p2align 4,,10
	.p2align 3
.L357:
	movzbl	(%r8,%r15), %ecx
	leaq	1(%r15), %r9
	cmpb	%cl, (%rdi,%r15)
	jne	.L492
	movzbl	(%r8,%r9), %esi
	movq	%r9, %r15
	leaq	1(%r9), %r11
	cmpb	%sil, (%rdi,%r9)
	jne	.L492
	movzbl	(%r8,%r11), %eax
	movq	%r11, %r15
	cmpb	%al, (%rdi,%r11)
	jne	.L492
	movzbl	2(%r8,%r9), %ecx
	leaq	2(%r9), %r15
	leaq	3(%r9), %r10
	cmpb	%cl, 2(%rdi,%r9)
	jne	.L492
	movzbl	3(%r8,%r9), %esi
	movq	%r10, %r15
	leaq	4(%r9), %r11
	cmpb	%sil, 3(%rdi,%r9)
	jne	.L492
	movzbl	4(%r8,%r9), %r10d
	movq	%r11, %r15
	leaq	5(%r9), %rax
	cmpb	%r10b, 4(%rdi,%r9)
	jne	.L492
	movzbl	5(%r8,%r9), %r11d
	movq	%rax, %r15
	leaq	6(%r9), %rcx
	cmpb	%r11b, 5(%rdi,%r9)
	jne	.L492
	movzbl	6(%r8,%r9), %esi
	movq	%rcx, %r15
	leaq	7(%r9), %rax
	cmpb	%sil, 6(%rdi,%r9)
	jne	.L492
	movq	%rax, %r15
.L356:
	cmpq	%r15, %rdx
	jne	.L357
	movl	$.LC26, %esi
	movl	$.LC27, %edi
	xorl	%eax, %eax
	call	printf
	movq	%rbx, %rdi
	call	__gmpz_clear
	leaq	-224(%rbp), %rdi
	call	__gmpz_clear
	leaq	-208(%rbp), %rdi
	call	__gmpz_clear
	cmpl	$10000000, -292(%rbp)
	jne	.L358
	addq	$288, %rsp
	popq	%rbx
	popq	%r10
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L496:
	.cfi_restore_state
	movq	%r9, %rdi
	movq	%rsi, %r8
	jmp	.L356
.L513:
	movq	-288(%rbp), %rdi
	movq	-280(%rbp), %r8
	jmp	.L356
.L501:
	movq	-280(%rbp), %r8
	movq	%rcx, %rdi
.L492:
	movq	%rdi, -264(%rbp)
	movl	$.LC22, %edi
	movq	%r8, -272(%rbp)
	call	puts
	movl	%r15d, %esi
	movl	$.LC23, %edi
	xorl	%eax, %eax
	movq	-272(%rbp), %rdx
	movq	-264(%rbp), %rbx
	movsbl	(%rdx,%r15), %ecx
	movsbl	(%rbx,%r15), %edx
	call	printf
	movq	-272(%rbp), %rsi
	movl	$.LC24, %edi
	xorl	%eax, %eax
	call	printf
	movq	-264(%rbp), %rsi
	movl	$.LC25, %edi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
.L497:
	movq	-288(%rbp), %rdi
	movq	%rsi, %r8
	jmp	.L492
.L495:
	movq	%r9, %rdi
	movq	%rsi, %r8
	jmp	.L492
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
