	.file	"add.c"
	.text
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
.LFB6820:
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
	je	.L4
	leaq	8(%rsp), %rsi
	movl	$8, %edx
	movl	%eax, %edi
	movl	%eax, %ebx
	call	read
	cmpq	$8, %rax
	jne	.L5
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
.LFSB6820:
.L4:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -16
	movl	$.LC1, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L5:
	movl	$.LC2, %edi
	call	perror
	movl	%ebx, %edi
	call	close
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6820:
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
.LFB6821:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	__ctype_b_loc
	movq	(%rax), %rdx
	jmp	.L9
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L10:
	addq	$1, %rbx
.L9:
	movsbq	(%rbx), %rax
	cmpb	$48, %al
	je	.L10
	testb	$32, 1(%rdx,%rax,2)
	jne	.L10
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE6821:
	.size	trim_leading_zeros_and_whitespace, .-trim_leading_zeros_and_whitespace
	.p2align 4
	.globl	trim_trailing_newline
	.type	trim_trailing_newline, @function
trim_trailing_newline:
.LFB6822:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	strlen
	testq	%rax, %rax
	je	.L20
	leaq	-1(%rbx,%rax), %rax
	cmpb	$10, (%rax)
	je	.L22
.L20:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L22:
	.cfi_restore_state
	movb	$0, (%rax)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE6822:
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
.LFB6823:
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
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movzbl	(%rdi), %r13d
	movzbl	(%rsi), %r14d
	cmpb	$45, %r13b
	sete	%al
	xorl	%edx, %edx
	addq	%rax, %rdi
	cmpb	$45, %r14b
	sete	%dl
	leaq	(%rsi,%rdx), %rbp
	call	trim_leading_zeros_and_whitespace
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	trim_leading_zeros_and_whitespace
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	trim_trailing_newline
	movq	%rbp, %rdi
	call	trim_trailing_newline
	testl	%r12d, %r12d
	jle	.L26
	call	__ctype_tolower_loc
	xorl	%r15d, %r15d
	movslq	%r12d, %rdi
	andl	$3, %r12d
	je	.L27
	cmpq	$1, %r12
	je	.L83
	cmpq	$2, %r12
	je	.L84
	movsbq	(%rbx), %rcx
	movq	(%rax), %rsi
	movl	$1, %r15d
	movl	(%rsi,%rcx,4), %r8d
	movb	%r8b, (%rbx)
	movsbq	0(%rbp), %r9
	movq	(%rax), %r10
	movl	(%r10,%r9,4), %r11d
	movb	%r11b, 0(%rbp)
.L84:
	movsbq	(%rbx,%r15), %r12
	movq	(%rax), %rdx
	movl	(%rdx,%r12,4), %ecx
	movb	%cl, (%rbx,%r15)
	movsbq	0(%rbp,%r15), %rsi
	movq	(%rax), %r8
	movl	(%r8,%rsi,4), %r9d
	movb	%r9b, 0(%rbp,%r15)
	addq	$1, %r15
.L83:
	movsbq	(%rbx,%r15), %r10
	movq	(%rax), %r11
	movl	(%r11,%r10,4), %r12d
	movb	%r12b, (%rbx,%r15)
	movsbq	0(%rbp,%r15), %rdx
	movq	(%rax), %rcx
	movl	(%rcx,%rdx,4), %esi
	movb	%sil, 0(%rbp,%r15)
	addq	$1, %r15
	cmpq	%rdi, %r15
	je	.L26
.L27:
	movq	(%rax), %r9
	movsbq	(%rbx,%r15), %r8
	movl	(%r9,%r8,4), %r10d
	movb	%r10b, (%rbx,%r15)
	movq	(%rax), %r12
	movsbq	0(%rbp,%r15), %r11
	movl	(%r12,%r11,4), %edx
	movb	%dl, 0(%rbp,%r15)
	movq	(%rax), %rcx
	movsbq	1(%rbx,%r15), %rsi
	movl	(%rcx,%rsi,4), %r8d
	movb	%r8b, 1(%rbx,%r15)
	movq	(%rax), %r10
	movsbq	1(%rbp,%r15), %r9
	movl	(%r10,%r9,4), %r11d
	movb	%r11b, 1(%rbp,%r15)
	movsbq	2(%rbx,%r15), %r12
	movq	(%rax), %rdx
	movl	(%rdx,%r12,4), %esi
	movb	%sil, 2(%rbx,%r15)
	movsbq	2(%rbp,%r15), %r8
	movq	(%rax), %rcx
	movl	(%rcx,%r8,4), %r9d
	movb	%r9b, 2(%rbp,%r15)
	movsbq	3(%rbx,%r15), %r10
	movq	(%rax), %r11
	movl	(%r11,%r10,4), %r12d
	movb	%r12b, 3(%rbx,%r15)
	movsbq	3(%rbp,%r15), %rdx
	movq	(%rax), %rsi
	movl	(%rsi,%rdx,4), %r8d
	movb	%r8b, 3(%rbp,%r15)
	addq	$4, %r15
	cmpq	%rdi, %r15
	jne	.L27
.L26:
	movq	%rbx, %rdi
	call	strlen
	movq	%rbp, %rdi
	movq	%rax, %r15
	call	strlen
	cmpq	%rax, %r15
	jne	.L28
	xorl	%r12d, %r12d
	testq	%r15, %r15
	je	.L30
	movq	%r15, %rax
	andl	$7, %eax
	je	.L29
	cmpq	$1, %rax
	je	.L86
	cmpq	$2, %rax
	je	.L87
	cmpq	$3, %rax
	je	.L88
	cmpq	$4, %rax
	je	.L89
	cmpq	$5, %rax
	je	.L90
	cmpq	$6, %rax
	je	.L91
	movzbl	0(%rbp), %edi
	cmpb	%dil, (%rbx)
	jne	.L104
	movl	$1, %r12d
.L91:
	movzbl	0(%rbp,%r12), %ecx
	cmpb	%cl, (%rbx,%r12)
	jne	.L104
	addq	$1, %r12
.L90:
	movzbl	0(%rbp,%r12), %r9d
	cmpb	%r9b, (%rbx,%r12)
	jne	.L104
	addq	$1, %r12
.L89:
	movzbl	0(%rbp,%r12), %r10d
	cmpb	%r10b, (%rbx,%r12)
	jne	.L104
	addq	$1, %r12
.L88:
	movzbl	0(%rbp,%r12), %r11d
	cmpb	%r11b, (%rbx,%r12)
	jne	.L104
	addq	$1, %r12
.L87:
	movzbl	0(%rbp,%r12), %edx
	cmpb	%dl, (%rbx,%r12)
	jne	.L104
	addq	$1, %r12
.L86:
	movzbl	0(%rbp,%r12), %esi
	cmpb	%sil, (%rbx,%r12)
	jne	.L104
	addq	$1, %r12
	cmpq	%r15, %r12
	je	.L30
.L29:
	movzbl	0(%rbp,%r12), %r8d
	cmpb	%r8b, (%rbx,%r12)
	jne	.L104
	leaq	1(%r12), %rax
	movzbl	0(%rbp,%rax), %edi
	movq	%rax, %r12
	cmpb	%dil, (%rbx,%rax)
	jne	.L104
	addq	$1, %r12
	movzbl	0(%rbp,%r12), %ecx
	cmpb	%cl, (%rbx,%r12)
	jne	.L104
	movzbl	2(%rbp,%rax), %r9d
	leaq	2(%rax), %r12
	cmpb	%r9b, 2(%rbx,%rax)
	jne	.L104
	movzbl	3(%rbp,%rax), %r10d
	leaq	3(%rax), %r12
	cmpb	%r10b, 3(%rbx,%rax)
	jne	.L104
	movzbl	4(%rbp,%rax), %r11d
	leaq	4(%rax), %r12
	cmpb	%r11b, 4(%rbx,%rax)
	jne	.L104
	movzbl	5(%rbp,%rax), %edx
	leaq	5(%rax), %r12
	cmpb	%dl, 5(%rbx,%rax)
	jne	.L104
	movzbl	6(%rbp,%rax), %esi
	leaq	6(%rax), %r12
	cmpb	%sil, 6(%rbx,%rax)
	jne	.L104
	leaq	7(%rax), %r12
	cmpq	%r15, %r12
	jne	.L29
.L30:
	cmpb	$45, %r13b
	movl	$1, %eax
	sete	%r13b
	cmpb	$45, %r14b
	sete	%r14b
	cmpb	%r14b, %r13b
	je	.L23
	movl	$.LC11, %edi
	call	puts
	.p2align 4
	.p2align 3
.L31:
	xorl	%eax, %eax
.L23:
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
.L104:
	.cfi_restore_state
	movl	$.LC7, %edi
	call	puts
	movq	%r12, %rsi
	movl	$.LC8, %edi
	xorl	%eax, %eax
	call	printf
	movsbl	(%rbx,%r12), %edx
	movq	%r12, %rsi
	movq	%r12, %rcx
	movsbl	0(%rbp,%r12), %r8d
	movl	$.LC9, %edi
	xorl	%eax, %eax
	call	printf
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L28:
	movl	$.LC4, %edi
	call	puts
	movq	%rbp, %rdi
	call	strlen
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	strlen
	movq	%r15, %rdx
	movl	$.LC5, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	printf
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movl	$.LC6, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L31
	.cfi_endproc
.LFE6823:
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
.LFB6824:
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
	jne	.L111
	cmpb	$0, 1(%rax)
	jne	.L111
.L108:
	movq	%rbp, %rdi
	call	free
	movl	$511, %esi
	movq	%rbx, %rdi
	call	mkdir
	testl	%eax, %eax
	je	.L125
	call	__errno_location
	movl	(%rax), %edi
	cmpl	$17, %edi
	jne	.L127
.L125:
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
.L111:
	.cfi_restore_state
	cmpl	$47, %edx
	je	.L128
.L112:
	movq	%rax, %rdi
	call	create_directory
	jmp	.L108
	.p2align 4,,10
	.p2align 3
.L128:
	cmpb	$0, 1(%rax)
	je	.L108
	jmp	.L112
.L127:
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
.LFE6824:
	.size	create_directory, .-create_directory
	.section	.rodata.str1.1
.LC13:
	.string	"Error opening file %s: %s\n"
	.text
	.p2align 4
	.globl	open_gzfile
	.type	open_gzfile, @function
open_gzfile:
.LFB6825:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	gzopen
	testq	%rax, %rax
	je	.L132
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L132:
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
.LFE6825:
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
.LFB6826:
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
	je	.L135
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
.LFSB6826:
.L135:
	.cfi_def_cfa_offset 655376
	.cfi_offset 3, -16
	movl	$.LC14, %edi
	call	perror
	movq	%rbx, %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6826:
	.text
	.size	skip_first_line, .-skip_first_line
	.section	.text.unlikely
	.size	skip_first_line.cold, .-skip_first_line.cold
.LCOLDE15:
	.text
.LHOTE15:
	.p2align 4
	.globl	limb_t_add_n_256
	.type	limb_t_add_n_256, @function
limb_t_add_n_256:
.LFB6832:
	.cfi_startproc
	vmovdqa	AVX256_52_MASK(%rip), %ymm1
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movq	(%rdx), %r8
	movabsq	$4503599627370495, %rdx
	movq	(%rsi), %rdi
	movq	(%rbx), %rcx
	movq	32(%r8), %rax
	addq	32(%rdi), %rax
	andq	$-32, %rsp
	andq	%rax, %rdx
	shrq	$52, %rax
	movq	%rdx, 32(%rcx)
	vmovdqa	(%r8), %ymm0
	sall	$4, %eax
	vpaddq	(%rdi), %ymm0, %ymm3
	vpcmpuq	$6, %ymm1, %ymm3, %k0
	kmovw	%k0, %r9d
	orb	%r9b, %al
	jne	.L139
	vmovdqa	%ymm3, (%rcx)
	vzeroupper
	movq	-8(%rbp), %rbx
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L139:
	.cfi_restore_state
	vmovdqa	AVX256_ZEROS(%rip), %ymm2
	shrb	%al
	movl	$1, %r10d
	kmovw	%eax, %k1
	vpbroadcastq	%r10, %ymm2{%k1}
	vpaddq	%ymm3, %ymm2, %ymm4
	vpcmpuq	$6, %ymm1, %ymm4, %k2
	vpandq	%ymm4, %ymm1, %ymm5
	vmovdqa	%ymm5, (%rcx)
	kmovw	%k2, %r11d
	testb	$1, %r11b
	jne	.L147
	vzeroupper
	movq	-8(%rbp), %rbx
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L147:
	.cfi_restore_state
	movq	16(%rsi), %rsi
	movq	%rbx, %rdi
	addl	$1, %esi
	movslq	%esi, %rsi
	vzeroupper
	call	limb_t_realloc
	movq	(%rbx), %rbx
	movq	$1, (%rbx)
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6832:
	.size	limb_t_add_n_256, .-limb_t_add_n_256
	.p2align 4
	.globl	limb_t_add_n_512
	.type	limb_t_add_n_512, @function
limb_t_add_n_512:
.LFB6833:
	.cfi_startproc
	vmovdqa	AVX128_52_MASK(%rip), %xmm1
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movq	(%rdi), %rcx
	movq	(%rdx), %rdx
	movq	(%rsi), %rdi
	vmovdqa	64(%rdx), %xmm0
	vpaddq	64(%rdi), %xmm0, %xmm4
	andq	$-64, %rsp
	vpcmpuq	$6, %xmm1, %xmm4, %k0
	kmovw	%k0, %eax
	testb	%al, %al
	je	.L149
	vmovdqa	AVX128_ZEROS(%rip), %xmm2
	movl	%eax, %r8d
	movl	$1, %r9d
	shrb	%r8b
	kmovw	%r8d, %k1
	vpbroadcastq	%r9, %xmm2{%k1}
	vpaddq	%xmm4, %xmm2, %xmm3
	vpandq	%xmm1, %xmm3, %xmm4
.L149:
	vmovdqa	%xmm4, 64(%rcx)
	vmovdqa64	(%rdi), %zmm5
	vpaddq	(%rdx), %zmm5, %zmm9
	sall	$7, %eax
	vmovdqa64	AVX512_52_MASK(%rip), %zmm6
	vpcmpuq	$6, %zmm6, %zmm9, %k3
	kmovw	%k3, %edx
	movl	%edx, %edi
	movzbl	%dl, %r11d
	shrb	%dil
	orb	%dil, %al
	je	.L151
	vmovdqa64	AVX512_ZEROS(%rip), %zmm7
	movl	$1, %r10d
	kmovw	%eax, %k2
	vpbroadcastq	%r10, %zmm7{%k2}
	vpaddq	%zmm9, %zmm7, %zmm8
	vpcmpuq	$6, %zmm6, %zmm8, %k4
	vpandd	%zmm6, %zmm8, %zmm9
	kmovw	%k4, %r11d
	andl	$1, %r11d
.L151:
	vmovdqa64	%zmm9, (%rcx)
	testl	%r11d, %r11d
	jne	.L162
	vzeroupper
	movq	-8(%rbp), %rbx
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L162:
	.cfi_restore_state
	movq	16(%rsi), %rsi
	movq	%rbx, %rdi
	addl	$1, %esi
	movslq	%esi, %rsi
	vzeroupper
	call	limb_t_realloc
	movq	(%rbx), %rbx
	movq	$1, (%rbx)
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6833:
	.size	limb_t_add_n_512, .-limb_t_add_n_512
	.p2align 4
	.globl	limb_t_add_n_1024
	.type	limb_t_add_n_1024, @function
limb_t_add_n_1024:
.LFB6834:
	.cfi_startproc
	vmovdqa	AVX256_52_MASK(%rip), %ymm1
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	movq	(%rdx), %r8
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movq	(%rsi), %r9
	movq	(%rdi), %rdi
	vmovdqa	128(%r8), %ymm0
	vpaddq	128(%r9), %ymm0, %ymm4
	andq	$-64, %rsp
	vpcmpuq	$6, %ymm1, %ymm4, %k0
	kmovw	%k0, %edx
	testb	%dl, %dl
	je	.L164
	vmovdqa	AVX256_ZEROS(%rip), %ymm2
	shrb	%dl
	movl	$1, %eax
	kmovw	%edx, %k1
	vpbroadcastq	%rax, %ymm2{%k1}
	vpaddq	%ymm4, %ymm2, %ymm3
	vpcmpuq	$6, %ymm1, %ymm3, %k6
	vpandq	%ymm3, %ymm1, %ymm4
	kmovw	%k6, %edx
	sall	$7, %edx
.L164:
	vmovdqa	%ymm4, 128(%rdi)
	vmovdqa64	AVX512_52_MASK(%rip), %zmm6
	vmovdqa64	64(%r8), %zmm5
	vpaddq	64(%r9), %zmm5, %zmm9
	vpcmpuq	$6, %zmm6, %zmm9, %k4
	kmovw	%k4, %eax
	movl	%eax, %ecx
	shrb	%cl
	orb	%dl, %cl
	je	.L165
	vmovdqa64	AVX512_ZEROS(%rip), %zmm7
	movl	$1, %r10d
	kmovw	%ecx, %k2
	vpbroadcastq	%r10, %zmm7{%k2}
	vpaddq	%zmm9, %zmm7, %zmm8
	vpcmpuq	$6, %zmm6, %zmm8, %k7
	vpandd	%zmm6, %zmm8, %zmm9
	kmovw	%k7, %eax
	andl	$1, %eax
.L165:
	vmovdqa64	%zmm9, 64(%rdi)
	vmovdqa64	(%r9), %zmm10
	sall	$7, %eax
	vpaddq	(%r8), %zmm10, %zmm13
	vpcmpuq	$6, %zmm6, %zmm13, %k5
	kmovw	%k5, %edx
	movl	%edx, %ecx
	movzbl	%dl, %r9d
	shrb	%cl
	orb	%cl, %al
	je	.L167
	vmovdqa64	AVX512_ZEROS(%rip), %zmm11
	movl	$1, %r11d
	kmovw	%eax, %k3
	vpbroadcastq	%r11, %zmm11{%k3}
	vpaddq	%zmm13, %zmm11, %zmm12
	vpcmpuq	$6, %zmm6, %zmm12, %k0
	vpandd	%zmm6, %zmm12, %zmm13
	kmovw	%k0, %r9d
	andl	$1, %r9d
.L167:
	vmovdqa64	%zmm13, (%rdi)
	testl	%r9d, %r9d
	jne	.L181
	vzeroupper
	movq	-8(%rbp), %rbx
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L181:
	.cfi_restore_state
	movq	16(%rsi), %rsi
	movq	%rbx, %rdi
	addl	$1, %esi
	movslq	%esi, %rsi
	vzeroupper
	call	limb_t_realloc
	movq	(%rbx), %rbx
	movq	$1, (%rbx)
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6834:
	.size	limb_t_add_n_1024, .-limb_t_add_n_1024
	.p2align 4
	.globl	limb_t_add_n_2048
	.type	limb_t_add_n_2048, @function
limb_t_add_n_2048:
.LFB6835:
	.cfi_startproc
	vmovdqa64	AVX512_52_MASK(%rip), %zmm0
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %r9
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movq	(%rdi), %rsi
	movq	(%r9), %r8
	movq	(%rdx), %rdi
	vmovdqa64	256(%rdi), %zmm1
	andq	$-64, %rsp
	vpaddq	256(%r8), %zmm1, %zmm4
	vpcmpuq	$6, %zmm0, %zmm4, %k0
	kmovw	%k0, %eax
	movl	%eax, %edx
	shrb	%dl
	je	.L183
	vmovdqa64	AVX512_ZEROS(%rip), %zmm2
	movl	$1, %eax
	kmovw	%edx, %k1
	vpbroadcastq	%rax, %zmm2{%k1}
	vpaddq	%zmm4, %zmm2, %zmm3
	vpcmpuq	$6, %zmm0, %zmm3, %k3
	vpandd	%zmm3, %zmm0, %zmm4
	kmovw	%k3, %eax
	andl	$1, %eax
.L183:
	vmovdqa64	%zmm4, 256(%rsi)
	sall	$7, %eax
	vmovdqa64	192(%rdi), %zmm5
	vpaddq	192(%r8), %zmm5, %zmm8
	vpcmpuq	$6, %zmm0, %zmm8, %k6
	kmovw	%k6, %ecx
	movl	%ecx, %edx
	shrb	%dl
	orb	%dl, %al
	je	.L184
	vmovdqa64	AVX512_ZEROS(%rip), %zmm6
	movl	$1, %ecx
	kmovw	%eax, %k2
	vpbroadcastq	%rcx, %zmm6{%k2}
	vpaddq	%zmm8, %zmm6, %zmm7
	vpcmpuq	$6, %zmm0, %zmm7, %k4
	vpandd	%zmm7, %zmm0, %zmm8
	kmovw	%k4, %ecx
	andl	$1, %ecx
.L184:
	vmovdqa64	%zmm8, 192(%rsi)
	sall	$7, %ecx
	vmovdqa64	128(%r8), %zmm9
	vpaddq	128(%rdi), %zmm9, %zmm12
	vpcmpuq	$6, %zmm0, %zmm12, %k7
	kmovw	%k7, %edx
	movl	%edx, %eax
	shrb	%al
	orb	%al, %cl
	je	.L185
	vmovdqa64	AVX512_ZEROS(%rip), %zmm10
	movl	$1, %r10d
	kmovw	%ecx, %k5
	vpbroadcastq	%r10, %zmm10{%k5}
	vpaddq	%zmm12, %zmm10, %zmm11
	vpcmpuq	$6, %zmm0, %zmm11, %k0
	vpandd	%zmm0, %zmm11, %zmm12
	kmovw	%k0, %edx
	andl	$1, %edx
.L185:
	vmovdqa64	%zmm12, 128(%rsi)
	sall	$7, %edx
	vmovdqa64	64(%r8), %zmm13
	vpaddq	64(%rdi), %zmm13, %zmm1
	vpcmpuq	$6, %zmm0, %zmm1, %k1
	kmovw	%k1, %eax
	movl	%eax, %ecx
	shrb	%cl
	orb	%cl, %dl
	je	.L186
	vmovdqa64	AVX512_ZEROS(%rip), %zmm14
	movl	$1, %r11d
	kmovw	%edx, %k3
	vpbroadcastq	%r11, %zmm14{%k3}
	vpaddq	%zmm1, %zmm14, %zmm15
	vpcmpuq	$6, %zmm0, %zmm15, %k6
	vpandd	%zmm0, %zmm15, %zmm1
	kmovw	%k6, %eax
	andl	$1, %eax
.L186:
	vmovdqa64	%zmm1, 64(%rsi)
	vmovdqa64	(%r8), %zmm2
	sall	$7, %eax
	vpaddq	(%rdi), %zmm2, %zmm5
	vpcmpuq	$6, %zmm0, %zmm5, %k2
	kmovw	%k2, %edx
	movl	%edx, %ecx
	movzbl	%dl, %edi
	shrb	%cl
	orb	%cl, %al
	je	.L188
	vmovdqa64	AVX512_ZEROS(%rip), %zmm3
	movl	$1, %r8d
	kmovw	%eax, %k4
	vpbroadcastq	%r8, %zmm3{%k4}
	vpaddq	%zmm5, %zmm3, %zmm4
	vpcmpuq	$6, %zmm0, %zmm4, %k7
	vpandd	%zmm0, %zmm4, %zmm5
	kmovw	%k7, %edi
	andl	$1, %edi
.L188:
	vmovdqa64	%zmm5, (%rsi)
	testl	%edi, %edi
	jne	.L208
	vzeroupper
	movq	-8(%rbp), %rbx
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L208:
	.cfi_restore_state
	movq	16(%r9), %r9
	movq	%rbx, %rdi
	addl	$1, %r9d
	movslq	%r9d, %rsi
	vzeroupper
	call	limb_t_realloc
	movq	(%rbx), %rbx
	movq	$1, (%rbx)
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6835:
	.size	limb_t_add_n_2048, .-limb_t_add_n_2048
	.p2align 4
	.globl	limb_t_add_n_4096
	.type	limb_t_add_n_4096, @function
limb_t_add_n_4096:
.LFB6836:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdx, %rax
	movq	%rsi, %r9
	vmovdqa	AVX128_52_MASK(%rip), %xmm1
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	movq	(%rsi), %rsi
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movq	(%rax), %rcx
	movq	(%rdi), %rdx
	movabsq	$4503599627370495, %rdi
	movq	624(%rcx), %rax
	addq	624(%rsi), %rax
	andq	$-64, %rsp
	andq	%rax, %rdi
	shrq	$52, %rax
	movq	%rdi, 624(%rdx)
	sall	$2, %eax
	vmovdqa	608(%rcx), %xmm0
	vpaddq	608(%rsi), %xmm0, %xmm4
	vpcmpuq	$6, %xmm1, %xmm4, %k0
	kmovw	%k0, %r8d
	orb	%r8b, %al
	je	.L210
	vmovdqa	AVX128_ZEROS(%rip), %xmm2
	movl	%eax, %edi
	movl	$1, %r10d
	shrb	%dil
	kmovw	%edi, %k1
	vpbroadcastq	%r10, %xmm2{%k1}
	vpaddq	%xmm4, %xmm2, %xmm3
	vpandq	%xmm1, %xmm3, %xmm4
.L210:
	vmovdqa	%xmm4, 608(%rdx)
	sall	$4, %eax
	xorl	%r8d, %r8d
	vmovdqa	576(%rcx), %ymm5
	vmovdqa	AVX256_52_MASK(%rip), %ymm6
	andl	$16, %eax
	vpaddq	576(%rsi), %ymm5, %ymm9
	vpcmpuq	$6, %ymm6, %ymm9, %k5
	kmovw	%k5, %r11d
	orb	%r11b, %al
	je	.L211
	vmovdqa	AVX256_ZEROS(%rip), %ymm7
	movl	$1, %r8d
	shrb	%al
	kmovw	%eax, %k2
	vpbroadcastq	%r8, %ymm7{%k2}
	vpaddq	%ymm9, %ymm7, %ymm8
	vpcmpuq	$6, %ymm6, %ymm8, %k7
	vpandq	%ymm8, %ymm6, %ymm9
	kmovw	%k7, %r8d
	andl	$1, %r8d
.L211:
	vmovdqa	%ymm9, 576(%rdx)
	sall	$7, %r8d
	vmovdqa64	512(%rcx), %zmm10
	vmovdqa64	AVX512_52_MASK(%rip), %zmm11
	vpaddq	512(%rsi), %zmm10, %zmm14
	vpcmpuq	$6, %zmm11, %zmm14, %k6
	kmovw	%k6, %edi
	movl	%edi, %r10d
	movzbl	%dil, %r11d
	shrb	%r10b
	orb	%r10b, %r8b
	je	.L213
	vmovdqa64	AVX512_ZEROS(%rip), %zmm12
	movl	$1, %eax
	kmovw	%r8d, %k3
	vpbroadcastq	%rax, %zmm12{%k3}
	vpaddq	%zmm14, %zmm12, %zmm13
	vpcmpuq	$6, %zmm11, %zmm13, %k4
	vpandd	%zmm11, %zmm13, %zmm14
	kmovw	%k4, %r11d
	andl	$1, %r11d
.L213:
	vmovdqa64	%zmm14, 512(%rdx)
	sall	$7, %r11d
	vmovdqa64	448(%rsi), %zmm15
	vpaddq	448(%rcx), %zmm15, %zmm2
	vpcmpuq	$6, %zmm11, %zmm2, %k0
	kmovw	%k0, %edi
	movl	%edi, %r10d
	movzbl	%dil, %eax
	shrb	%r10b
	orb	%r10b, %r11b
	je	.L215
	vmovdqa64	AVX512_ZEROS(%rip), %zmm0
	movl	$1, %r8d
	kmovw	%r11d, %k1
	vpbroadcastq	%r8, %zmm0{%k1}
	vpaddq	%zmm2, %zmm0, %zmm1
	vpcmpuq	$6, %zmm11, %zmm1, %k5
	vpandd	%zmm11, %zmm1, %zmm2
	kmovw	%k5, %eax
	andl	$1, %eax
.L215:
	vmovdqa64	%zmm2, 448(%rdx)
	sall	$7, %eax
	vmovdqa64	384(%rsi), %zmm3
	vpaddq	384(%rcx), %zmm3, %zmm6
	vpcmpuq	$6, %zmm11, %zmm6, %k2
	kmovw	%k2, %r11d
	movl	%r11d, %edi
	movzbl	%r11b, %r11d
	shrb	%dil
	orb	%dil, %al
	je	.L217
	vmovdqa64	AVX512_ZEROS(%rip), %zmm4
	movl	$1, %r10d
	kmovw	%eax, %k7
	vpbroadcastq	%r10, %zmm4{%k7}
	vpaddq	%zmm6, %zmm4, %zmm5
	vpcmpuq	$6, %zmm11, %zmm5, %k6
	vpandd	%zmm11, %zmm5, %zmm6
	kmovw	%k6, %r11d
	andl	$1, %r11d
.L217:
	vmovdqa64	%zmm6, 384(%rdx)
	sall	$7, %r11d
	vmovdqa64	320(%rsi), %zmm7
	vpaddq	320(%rcx), %zmm7, %zmm10
	vpcmpuq	$6, %zmm11, %zmm10, %k3
	kmovw	%k3, %eax
	movl	%eax, %r8d
	movzbl	%al, %r10d
	shrb	%r8b
	orb	%r8b, %r11b
	je	.L219
	vmovdqa64	AVX512_ZEROS(%rip), %zmm8
	movl	$1, %edi
	kmovw	%r11d, %k4
	vpbroadcastq	%rdi, %zmm8{%k4}
	vpaddq	%zmm10, %zmm8, %zmm9
	vpcmpuq	$6, %zmm11, %zmm9, %k0
	vpandd	%zmm11, %zmm9, %zmm10
	kmovw	%k0, %r10d
	andl	$1, %r10d
.L219:
	vmovdqa64	%zmm10, 320(%rdx)
	sall	$7, %r10d
	vmovdqa64	256(%rsi), %zmm12
	vpaddq	256(%rcx), %zmm12, %zmm15
	vpcmpuq	$6, %zmm11, %zmm15, %k1
	kmovw	%k1, %r11d
	movl	%r11d, %eax
	movzbl	%r11b, %edi
	shrb	%al
	orb	%al, %r10b
	je	.L221
	vmovdqa64	AVX512_ZEROS(%rip), %zmm13
	movl	$1, %r8d
	kmovw	%r10d, %k5
	vpbroadcastq	%r8, %zmm13{%k5}
	vpaddq	%zmm15, %zmm13, %zmm14
	vpcmpuq	$6, %zmm11, %zmm14, %k2
	vpandd	%zmm11, %zmm14, %zmm15
	kmovw	%k2, %edi
	andl	$1, %edi
.L221:
	vmovdqa64	%zmm15, 256(%rdx)
	sall	$7, %edi
	vmovdqa64	192(%rsi), %zmm0
	vpaddq	192(%rcx), %zmm0, %zmm3
	vpcmpuq	$6, %zmm11, %zmm3, %k7
	kmovw	%k7, %r10d
	movl	%r10d, %r11d
	movzbl	%r10b, %r10d
	shrb	%r11b
	orb	%r11b, %dil
	je	.L223
	vmovdqa64	AVX512_ZEROS(%rip), %zmm2
	movl	$1, %eax
	kmovw	%edi, %k6
	vpbroadcastq	%rax, %zmm2{%k6}
	vpaddq	%zmm3, %zmm2, %zmm1
	vpcmpuq	$6, %zmm11, %zmm1, %k3
	vpandd	%zmm11, %zmm1, %zmm3
	kmovw	%k3, %r10d
	andl	$1, %r10d
.L223:
	vmovdqa64	%zmm3, 192(%rdx)
	sall	$7, %r10d
	vmovdqa64	128(%rsi), %zmm4
	vpaddq	128(%rcx), %zmm4, %zmm7
	vpcmpuq	$6, %zmm11, %zmm7, %k4
	kmovw	%k4, %edi
	movl	%edi, %r8d
	movzbl	%dil, %edi
	shrb	%r8b
	orb	%r8b, %r10b
	je	.L225
	vmovdqa64	AVX512_ZEROS(%rip), %zmm5
	movl	$1, %r11d
	kmovw	%r10d, %k1
	vpbroadcastq	%r11, %zmm5{%k1}
	vpaddq	%zmm7, %zmm5, %zmm6
	vpcmpuq	$6, %zmm11, %zmm6, %k0
	vpandd	%zmm11, %zmm6, %zmm7
	kmovw	%k0, %edi
	andl	$1, %edi
.L225:
	vmovdqa64	%zmm7, 128(%rdx)
	sall	$7, %edi
	vmovdqa64	64(%rsi), %zmm8
	vpaddq	64(%rcx), %zmm8, %zmm12
	vpcmpuq	$6, %zmm11, %zmm12, %k5
	kmovw	%k5, %eax
	movl	%eax, %r10d
	movzbl	%al, %r11d
	shrb	%r10b
	orb	%r10b, %dil
	je	.L227
	vmovdqa64	AVX512_ZEROS(%rip), %zmm9
	movl	$1, %r8d
	kmovw	%edi, %k2
	vpbroadcastq	%r8, %zmm9{%k2}
	vpaddq	%zmm12, %zmm9, %zmm10
	vpcmpuq	$6, %zmm11, %zmm10, %k7
	vpandd	%zmm11, %zmm10, %zmm12
	kmovw	%k7, %r11d
	andl	$1, %r11d
.L227:
	vmovdqa64	%zmm12, 64(%rdx)
	vmovdqa64	(%rsi), %zmm13
	sall	$7, %r11d
	vpaddq	(%rcx), %zmm13, %zmm0
	vpcmpuq	$6, %zmm11, %zmm0, %k6
	kmovw	%k6, %ecx
	movl	%ecx, %esi
	movzbl	%cl, %eax
	shrb	%sil
	orb	%sil, %r11b
	je	.L229
	vmovdqa64	AVX512_ZEROS(%rip), %zmm14
	movl	$1, %edi
	kmovw	%r11d, %k3
	vpbroadcastq	%rdi, %zmm14{%k3}
	vpaddq	%zmm0, %zmm14, %zmm15
	vpcmpuq	$6, %zmm11, %zmm15, %k4
	vpandd	%zmm11, %zmm15, %zmm0
	kmovw	%k4, %eax
	andl	$1, %eax
.L229:
	vmovdqa64	%zmm0, (%rdx)
	testl	%eax, %eax
	jne	.L242
	vzeroupper
	movq	-8(%rbp), %rbx
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L242:
	.cfi_restore_state
	movq	16(%r9), %r9
	movq	%rbx, %rdi
	addl	$1, %r9d
	movslq	%r9d, %rsi
	vzeroupper
	call	limb_t_realloc
	movq	(%rbx), %rbx
	movq	$1, (%rbx)
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6836:
	.size	limb_t_add_n_4096, .-limb_t_add_n_4096
	.p2align 4
	.globl	limb_t_add_n_8192
	.type	limb_t_add_n_8192, @function
limb_t_add_n_8192:
.LFB6837:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %r11
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movq	(%rdi), %r9
	movq	(%rdx), %r8
	movq	(%rsi), %rdi
	vmovdqa	AVX128_52_MASK(%rip), %xmm1
	vmovdqa	1248(%r8), %xmm0
	andq	$-64, %rsp
	vpaddq	1248(%rdi), %xmm0, %xmm4
	vpcmpuq	$6, %xmm1, %xmm4, %k4
	kmovw	%k4, %eax
	testb	%al, %al
	je	.L244
	vmovdqa	AVX128_ZEROS(%rip), %xmm2
	movl	%eax, %edx
	movl	$1, %ecx
	shrb	%dl
	kmovw	%edx, %k7
	vpbroadcastq	%rcx, %xmm2{%k7}
	vpaddq	%xmm4, %xmm2, %xmm3
	vpandq	%xmm1, %xmm3, %xmm4
.L244:
	vmovdqa	%xmm4, 1248(%r9)
	sall	$4, %eax
	xorl	%ecx, %ecx
	vmovdqa	1216(%r8), %ymm5
	vmovdqa	AVX256_52_MASK(%rip), %ymm6
	andl	$16, %eax
	vpaddq	1216(%rdi), %ymm5, %ymm9
	vpcmpuq	$6, %ymm6, %ymm9, %k5
	kmovw	%k5, %esi
	orb	%sil, %al
	je	.L245
	vmovdqa	AVX256_ZEROS(%rip), %ymm7
	shrb	%al
	movl	$1, %r10d
	kmovw	%eax, %k1
	vpbroadcastq	%r10, %ymm7{%k1}
	vpaddq	%ymm9, %ymm7, %ymm8
	vpcmpuq	$6, %ymm6, %ymm8, %k0
	vpandq	%ymm8, %ymm6, %ymm9
	kmovw	%k0, %ecx
	andl	$1, %ecx
.L245:
	vmovdqa	%ymm9, 1216(%r9)
	sall	$7, %ecx
	movl	$1, %r10d
	vmovdqa64	1152(%rdi), %zmm10
	vmovdqa64	AVX512_52_MASK(%rip), %zmm12
	vpaddq	1152(%r8), %zmm10, %zmm11
	vpcmpuq	$6, %zmm12, %zmm11, %k6
	kmovw	%k6, %eax
	movl	%eax, %esi
	shrb	%sil
	orb	%sil, %cl
	je	.L287
	vmovdqa64	AVX512_ZEROS(%rip), %zmm13
	kmovw	%ecx, %k2
	vpbroadcastq	%r10, %zmm13{%k2}
	vpaddq	%zmm11, %zmm13, %zmm14
	vpcmpuq	$6, %zmm12, %zmm14, %k3
	vpandd	%zmm12, %zmm14, %zmm11
	kmovw	%k3, %edx
	andl	$1, %edx
.L273:
	vmovdqa64	%zmm11, 1152(%r9)
	movl	$1088, %esi
.L248:
	vmovdqa64	(%rdi,%rsi), %zmm15
	vpaddq	(%r8,%rsi), %zmm15, %zmm3
	sall	$7, %edx
	vmovdqa64	AVX512_52_MASK(%rip), %zmm1
	vpcmpuq	$6, %zmm1, %zmm3, %k4
	kmovw	%k4, %ecx
	movl	%ecx, %r12d
	movzbl	%cl, %ecx
	shrb	%r12b
	orb	%r12b, %dl
	je	.L247
	vmovdqa64	AVX512_ZEROS(%rip), %zmm2
	kmovw	%edx, %k7
	vpbroadcastq	%r10, %zmm2{%k7}
	vpaddq	%zmm3, %zmm2, %zmm0
	vpcmpuq	$6, %zmm1, %zmm0, %k5
	vpandd	%zmm1, %zmm0, %zmm3
	kmovw	%k5, %ecx
	andl	$1, %ecx
.L247:
	vmovdqa64	%zmm3, (%r9,%rsi)
	leaq	-64(%rsi), %rax
	sall	$7, %ecx
	vmovdqa64	-64(%rdi,%rsi), %zmm4
	vmovdqa64	AVX512_52_MASK(%rip), %zmm6
	vpaddq	-64(%r8,%rsi), %zmm4, %zmm5
	vpcmpuq	$6, %zmm6, %zmm5, %k1
	kmovw	%k1, %esi
	movl	%esi, %r12d
	shrb	%r12b
	orb	%r12b, %cl
	je	.L288
	vmovdqa64	AVX512_ZEROS(%rip), %zmm7
	kmovw	%ecx, %k6
	vpbroadcastq	%r10, %zmm7{%k6}
	vpaddq	%zmm5, %zmm7, %zmm8
	vpcmpuq	$6, %zmm6, %zmm8, %k0
	vpandd	%zmm6, %zmm8, %zmm5
	kmovw	%k0, %edx
	andl	$1, %edx
.L274:
	vmovdqa64	%zmm5, (%r9,%rax)
	vmovdqa64	-64(%rdi,%rax), %zmm9
	sall	$7, %edx
	vpaddq	-64(%r8,%rax), %zmm9, %zmm13
	vmovdqa64	AVX512_52_MASK(%rip), %zmm10
	vpcmpuq	$6, %zmm10, %zmm13, %k2
	kmovw	%k2, %ecx
	movl	%ecx, %r12d
	movzbl	%cl, %ecx
	shrb	%r12b
	orb	%r12b, %dl
	je	.L276
	vmovdqa64	AVX512_ZEROS(%rip), %zmm11
	kmovw	%edx, %k3
	vpbroadcastq	%r10, %zmm11{%k3}
	vpaddq	%zmm13, %zmm11, %zmm12
	vpcmpuq	$6, %zmm10, %zmm12, %k4
	vpandd	%zmm10, %zmm12, %zmm13
	kmovw	%k4, %ecx
	andl	$1, %ecx
.L276:
	vmovdqa64	%zmm13, -64(%r9,%rax)
	vmovdqa64	-128(%rdi,%rax), %zmm14
	sall	$7, %ecx
	vpaddq	-128(%r8,%rax), %zmm14, %zmm0
	vmovdqa64	AVX512_52_MASK(%rip), %zmm15
	vpcmpuq	$6, %zmm15, %zmm0, %k7
	kmovw	%k7, %edx
	movl	%edx, %esi
	movzbl	%dl, %r12d
	shrb	%sil
	orb	%sil, %cl
	je	.L278
	vmovdqa64	AVX512_ZEROS(%rip), %zmm1
	kmovw	%ecx, %k5
	vpbroadcastq	%r10, %zmm1{%k5}
	vpaddq	%zmm0, %zmm1, %zmm2
	vpcmpuq	$6, %zmm15, %zmm2, %k1
	vpandd	%zmm15, %zmm2, %zmm0
	kmovw	%k1, %r12d
	andl	$1, %r12d
.L278:
	vmovdqa64	%zmm0, -128(%r9,%rax)
	sall	$7, %r12d
	vmovdqa64	-192(%rdi,%rax), %zmm3
	vmovdqa64	AVX512_52_MASK(%rip), %zmm4
	vpaddq	-192(%r8,%rax), %zmm3, %zmm7
	vpcmpuq	$6, %zmm4, %zmm7, %k6
	kmovw	%k6, %ecx
	movl	%ecx, %edx
	movzbl	%cl, %ecx
	shrb	%dl
	orb	%dl, %r12b
	je	.L280
	vmovdqa64	AVX512_ZEROS(%rip), %zmm5
	kmovw	%r12d, %k2
	vpbroadcastq	%r10, %zmm5{%k2}
	vpaddq	%zmm7, %zmm5, %zmm6
	vpcmpuq	$6, %zmm4, %zmm6, %k0
	vpandd	%zmm4, %zmm6, %zmm7
	kmovw	%k0, %ecx
	andl	$1, %ecx
.L280:
	vmovdqa64	%zmm7, -192(%r9,%rax)
	sall	$7, %ecx
	vmovdqa64	-256(%rdi,%rax), %zmm8
	vmovdqa64	AVX512_52_MASK(%rip), %zmm9
	vpaddq	-256(%r8,%rax), %zmm8, %zmm12
	vpcmpuq	$6, %zmm9, %zmm12, %k3
	kmovw	%k3, %edx
	movl	%edx, %esi
	movzbl	%dl, %edx
	shrb	%sil
	orb	%sil, %cl
	je	.L282
	vmovdqa64	AVX512_ZEROS(%rip), %zmm10
	kmovw	%ecx, %k4
	vpbroadcastq	%r10, %zmm10{%k4}
	vpaddq	%zmm12, %zmm10, %zmm11
	vpcmpuq	$6, %zmm9, %zmm11, %k7
	vpandd	%zmm9, %zmm11, %zmm12
	kmovw	%k7, %edx
	andl	$1, %edx
.L282:
	vmovdqa64	%zmm12, -256(%r9,%rax)
	leaq	-320(%rax), %rsi
	cmpq	$256, %rax
	jne	.L248
	testl	%edx, %edx
	jne	.L289
	vzeroupper
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L288:
	.cfi_restore_state
	movzbl	%sil, %edx
	jmp	.L274
	.p2align 4,,10
	.p2align 3
.L287:
	movzbl	%al, %edx
	jmp	.L273
.L289:
	movq	16(%r11), %r11
	movq	%rbx, %rdi
	addl	$1, %r11d
	movslq	%r11d, %rsi
	vzeroupper
	call	limb_t_realloc
	movq	(%rbx), %rbx
	movq	$1, (%rbx)
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6837:
	.size	limb_t_add_n_8192, .-limb_t_add_n_8192
	.p2align 4
	.globl	limb_t_add_n_16384
	.type	limb_t_add_n_16384, @function
limb_t_add_n_16384:
.LFB6838:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%ecx, %ecx
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	movq	(%rdi), %r9
	movq	(%rdx), %r8
	movq	(%rsi), %rdi
	vmovdqa	AVX256_52_MASK(%rip), %ymm1
	vmovdqa	2496(%r8), %ymm0
	andq	$-64, %rsp
	vpaddq	2496(%rdi), %ymm0, %ymm4
	vpcmpuq	$6, %ymm1, %ymm4, %k3
	kmovw	%k3, %eax
	testb	%al, %al
	je	.L291
	vmovdqa	AVX256_ZEROS(%rip), %ymm2
	shrb	%al
	movl	$1, %edx
	kmovw	%eax, %k5
	vpbroadcastq	%rdx, %ymm2{%k5}
	vpaddq	%ymm4, %ymm2, %ymm3
	vpcmpuq	$6, %ymm1, %ymm3, %k7
	vpandq	%ymm3, %ymm1, %ymm4
	kmovw	%k7, %ecx
	andl	$1, %ecx
.L291:
	vmovdqa	%ymm4, 2496(%r9)
	sall	$7, %ecx
	movl	$1, %r11d
	vmovdqa64	2432(%rdi), %zmm5
	vmovdqa64	AVX512_52_MASK(%rip), %zmm7
	vpaddq	2432(%r8), %zmm5, %zmm6
	vpcmpuq	$6, %zmm7, %zmm6, %k4
	kmovw	%k4, %eax
	movl	%eax, %esi
	shrb	%sil
	orb	%sil, %cl
	je	.L331
	vmovdqa64	AVX512_ZEROS(%rip), %zmm8
	kmovw	%ecx, %k6
	vpbroadcastq	%r11, %zmm8{%k6}
	vpaddq	%zmm6, %zmm8, %zmm9
	vpcmpuq	$6, %zmm7, %zmm9, %k0
	vpandd	%zmm7, %zmm9, %zmm6
	kmovw	%k0, %esi
	movl	%esi, %eax
	andl	$1, %eax
.L316:
	movl	$2368, %ecx
	sall	$7, %eax
	vmovdqa64	%zmm6, 2432(%r9)
	vmovdqa64	AVX512_52_MASK(%rip), %zmm11
	vmovdqa64	(%rdi,%rcx), %zmm10
	vpaddq	(%r8,%rcx), %zmm10, %zmm14
	vpcmpuq	$6, %zmm11, %zmm14, %k1
	kmovw	%k1, %r13d
	movl	%r13d, %r10d
	movzbl	%r13b, %esi
	shrb	%r10b
	orb	%r10b, %al
	je	.L318
	vmovdqa64	AVX512_ZEROS(%rip), %zmm12
	kmovw	%eax, %k2
	vpbroadcastq	%r11, %zmm12{%k2}
	vpaddq	%zmm14, %zmm12, %zmm13
	vpcmpuq	$6, %zmm11, %zmm13, %k3
	vpandd	%zmm11, %zmm13, %zmm14
	kmovw	%k3, %esi
	andl	$1, %esi
.L318:
	leaq	-64(%rcx), %r10
	vmovdqa64	%zmm14, (%r9,%rcx)
	sall	$7, %esi
	vmovdqa64	AVX512_52_MASK(%rip), %zmm1
	vmovdqa64	(%rdi,%r10), %zmm15
	vpaddq	(%r8,%r10), %zmm15, %zmm3
	vpcmpuq	$6, %zmm1, %zmm3, %k5
	kmovw	%k5, %eax
	movl	%eax, %r13d
	movzbl	%al, %eax
	shrb	%r13b
	orb	%r13b, %sil
	je	.L320
	vmovdqa64	AVX512_ZEROS(%rip), %zmm2
	kmovw	%esi, %k7
	vpbroadcastq	%r11, %zmm2{%k7}
	vpaddq	%zmm3, %zmm2, %zmm0
	vpcmpuq	$6, %zmm1, %zmm0, %k4
	vpandd	%zmm1, %zmm0, %zmm3
	kmovw	%k4, %eax
	andl	$1, %eax
.L320:
	vmovdqa64	%zmm3, (%r9,%r10)
	addq	$-128, %rcx
	jmp	.L294
	.p2align 4,,10
	.p2align 3
.L306:
	vmovdqa64	AVX512_ZEROS(%rip), %zmm12
	kmovw	%edx, %k3
	vpbroadcastq	%r11, %zmm12{%k3}
	vpaddq	%zmm10, %zmm12, %zmm13
	vpcmpuq	$6, %zmm11, %zmm13, %k5
	vpandd	%zmm11, %zmm13, %zmm10
	kmovw	%k5, %eax
	andl	$1, %eax
.L321:
	vmovdqa64	%zmm10, (%r9,%r13)
	vmovdqa64	-64(%rdi,%r13), %zmm14
	sall	$7, %eax
	vpaddq	-64(%r8,%r13), %zmm14, %zmm0
	vmovdqa64	AVX512_52_MASK(%rip), %zmm15
	vpcmpuq	$6, %zmm15, %zmm0, %k7
	kmovw	%k7, %esi
	movl	%esi, %ecx
	movzbl	%sil, %r10d
	shrb	%cl
	orb	%cl, %al
	je	.L323
	vmovdqa64	AVX512_ZEROS(%rip), %zmm1
	kmovw	%eax, %k4
	vpbroadcastq	%r11, %zmm1{%k4}
	vpaddq	%zmm0, %zmm1, %zmm2
	vpcmpuq	$6, %zmm15, %zmm2, %k6
	vpandd	%zmm15, %zmm2, %zmm0
	kmovw	%k6, %r10d
	andl	$1, %r10d
.L323:
	vmovdqa64	%zmm0, -64(%r9,%r13)
	vmovdqa64	-128(%rdi,%r13), %zmm3
	sall	$7, %r10d
	vpaddq	-128(%r8,%r13), %zmm3, %zmm7
	vmovdqa64	AVX512_52_MASK(%rip), %zmm4
	vpcmpuq	$6, %zmm4, %zmm7, %k1
	kmovw	%k1, %edx
	movl	%edx, %ecx
	movzbl	%dl, %eax
	shrb	%cl
	orb	%cl, %r10b
	je	.L325
	vmovdqa64	AVX512_ZEROS(%rip), %zmm5
	kmovw	%r10d, %k2
	vpbroadcastq	%r11, %zmm5{%k2}
	vpaddq	%zmm7, %zmm5, %zmm6
	vpcmpuq	$6, %zmm4, %zmm6, %k0
	vpandd	%zmm4, %zmm6, %zmm7
	kmovw	%k0, %eax
	andl	$1, %eax
.L325:
	vmovdqa64	%zmm7, -128(%r9,%r13)
	leaq	-192(%r13), %rcx
	cmpq	$128, %r13
	je	.L332
.L294:
	vmovdqa64	(%rdi,%rcx), %zmm4
	vpaddq	(%r8,%rcx), %zmm4, %zmm8
	sall	$7, %eax
	vmovdqa64	AVX512_52_MASK(%rip), %zmm5
	vpcmpuq	$6, %zmm5, %zmm8, %k6
	kmovw	%k6, %edx
	movl	%edx, %esi
	movzbl	%dl, %edx
	shrb	%sil
	orb	%sil, %al
	je	.L293
	vmovdqa64	AVX512_ZEROS(%rip), %zmm6
	kmovw	%eax, %k1
	vpbroadcastq	%r11, %zmm6{%k1}
	vpaddq	%zmm8, %zmm6, %zmm7
	vpcmpuq	$6, %zmm5, %zmm7, %k0
	vpandd	%zmm5, %zmm7, %zmm8
	kmovw	%k0, %edx
	andl	$1, %edx
.L293:
	vmovdqa64	%zmm8, (%r9,%rcx)
	leaq	-64(%rcx), %r13
	sall	$7, %edx
	vmovdqa64	-64(%rdi,%rcx), %zmm9
	vmovdqa64	AVX512_52_MASK(%rip), %zmm11
	vpaddq	-64(%r8,%rcx), %zmm9, %zmm10
	vpcmpuq	$6, %zmm11, %zmm10, %k2
	kmovw	%k2, %ecx
	movl	%ecx, %r10d
	shrb	%r10b
	orb	%r10b, %dl
	jne	.L306
	movzbl	%cl, %eax
	jmp	.L321
.L332:
	testl	%eax, %eax
	jne	.L333
	vzeroupper
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L331:
	.cfi_restore_state
	movzbl	%al, %eax
	jmp	.L316
.L333:
	movq	16(%r12), %r12
	movq	%rbx, %rdi
	addl	$1, %r12d
	movslq	%r12d, %rsi
	vzeroupper
	call	limb_t_realloc
	movq	(%rbx), %rbx
	movq	$1, (%rbx)
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6838:
	.size	limb_t_add_n_16384, .-limb_t_add_n_16384
	.p2align 4
	.globl	limb_t_add_n_32768
	.type	limb_t_add_n_32768, @function
limb_t_add_n_32768:
.LFB6839:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %r11
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movq	(%rdx), %r8
	movabsq	$4503599627370495, %rdx
	vmovdqa	AVX128_52_MASK(%rip), %xmm1
	movq	(%rdi), %r9
	movq	(%rsi), %rdi
	movq	5040(%r8), %rax
	andq	$-64, %rsp
	addq	5040(%rdi), %rax
	andq	%rax, %rdx
	shrq	$52, %rax
	movq	%rdx, 5040(%r9)
	sall	$2, %eax
	vmovdqa	5024(%r8), %xmm0
	vpaddq	5024(%rdi), %xmm0, %xmm4
	vpcmpuq	$6, %xmm1, %xmm4, %k2
	kmovw	%k2, %ecx
	orb	%cl, %al
	je	.L335
	vmovdqa	AVX128_ZEROS(%rip), %xmm2
	movl	%eax, %edx
	movl	$1, %esi
	shrb	%dl
	kmovw	%edx, %k7
	vpbroadcastq	%rsi, %xmm2{%k7}
	vpaddq	%xmm4, %xmm2, %xmm3
	vpandq	%xmm1, %xmm3, %xmm4
.L335:
	vmovdqa	%xmm4, 5024(%r9)
	sall	$4, %eax
	xorl	%ecx, %ecx
	vmovdqa	4992(%r8), %ymm5
	vmovdqa	AVX256_52_MASK(%rip), %ymm6
	andl	$16, %eax
	vpaddq	4992(%rdi), %ymm5, %ymm9
	vpcmpuq	$6, %ymm6, %ymm9, %k3
	kmovw	%k3, %r10d
	orb	%r10b, %al
	je	.L336
	vmovdqa	AVX256_ZEROS(%rip), %ymm7
	shrb	%al
	movl	$1, %r12d
	kmovw	%eax, %k1
	vpbroadcastq	%r12, %ymm7{%k1}
	vpaddq	%ymm9, %ymm7, %ymm8
	vpcmpuq	$6, %ymm6, %ymm8, %k4
	vpandq	%ymm8, %ymm6, %ymm9
	kmovw	%k4, %ecx
	andl	$1, %ecx
.L336:
	vmovdqa	%ymm9, 4992(%r9)
	movl	$4928, %esi
	movl	$1, %r10d
	jmp	.L339
	.p2align 4,,10
	.p2align 3
.L347:
	vmovdqa64	AVX512_ZEROS(%rip), %zmm2
	kmovw	%edx, %k7
	vpbroadcastq	%r10, %zmm2{%k7}
	vpaddq	%zmm0, %zmm2, %zmm3
	vpcmpuq	$6, %zmm1, %zmm3, %k3
	vpandd	%zmm1, %zmm3, %zmm0
	kmovw	%k3, %edx
	andl	$1, %edx
.L361:
	vmovdqa64	%zmm0, (%r9,%rax)
	vmovdqa64	-64(%rdi,%rax), %zmm4
	sall	$7, %edx
	vpaddq	-64(%r8,%rax), %zmm4, %zmm8
	vmovdqa64	AVX512_52_MASK(%rip), %zmm5
	vpcmpuq	$6, %zmm5, %zmm8, %k1
	kmovw	%k1, %ecx
	movl	%ecx, %r12d
	movzbl	%cl, %esi
	shrb	%r12b
	orb	%r12b, %dl
	je	.L363
	vmovdqa64	AVX512_ZEROS(%rip), %zmm6
	kmovw	%edx, %k4
	vpbroadcastq	%r10, %zmm6{%k4}
	vpaddq	%zmm8, %zmm6, %zmm7
	vpcmpuq	$6, %zmm5, %zmm7, %k0
	vpandd	%zmm5, %zmm7, %zmm8
	kmovw	%k0, %esi
	andl	$1, %esi
.L363:
	vmovdqa64	%zmm8, -64(%r9,%rax)
	vmovdqa64	-128(%rdi,%rax), %zmm9
	sall	$7, %esi
	vpaddq	-128(%r8,%rax), %zmm9, %zmm13
	vmovdqa64	AVX512_52_MASK(%rip), %zmm10
	vpcmpuq	$6, %zmm10, %zmm13, %k5
	kmovw	%k5, %edx
	movl	%edx, %r12d
	movzbl	%dl, %edx
	shrb	%r12b
	orb	%r12b, %sil
	je	.L365
	vmovdqa64	AVX512_ZEROS(%rip), %zmm11
	kmovw	%esi, %k6
	vpbroadcastq	%r10, %zmm11{%k6}
	vpaddq	%zmm13, %zmm11, %zmm12
	vpcmpuq	$6, %zmm10, %zmm12, %k2
	vpandd	%zmm10, %zmm12, %zmm13
	kmovw	%k2, %edx
	andl	$1, %edx
.L365:
	vmovdqa64	%zmm13, -128(%r9,%rax)
	sall	$7, %edx
	vmovdqa64	-192(%rdi,%rax), %zmm14
	vmovdqa64	AVX512_52_MASK(%rip), %zmm15
	vpaddq	-192(%r8,%rax), %zmm14, %zmm2
	vpcmpuq	$6, %zmm15, %zmm2, %k7
	kmovw	%k7, %ecx
	movl	%ecx, %esi
	movzbl	%cl, %r12d
	shrb	%sil
	orb	%sil, %dl
	je	.L367
	vmovdqa64	AVX512_ZEROS(%rip), %zmm1
	kmovw	%edx, %k3
	vpbroadcastq	%r10, %zmm1{%k3}
	vpaddq	%zmm2, %zmm1, %zmm0
	vpcmpuq	$6, %zmm15, %zmm0, %k1
	vpandd	%zmm15, %zmm0, %zmm2
	kmovw	%k1, %r12d
	andl	$1, %r12d
.L367:
	vmovdqa64	%zmm2, -192(%r9,%rax)
	sall	$7, %r12d
	vmovdqa64	-256(%rdi,%rax), %zmm3
	vmovdqa64	AVX512_52_MASK(%rip), %zmm5
	vpaddq	-256(%r8,%rax), %zmm3, %zmm4
	vpcmpuq	$6, %zmm5, %zmm4, %k4
	kmovw	%k4, %edx
	movl	%edx, %ecx
	shrb	%cl
	orb	%cl, %r12b
	je	.L368
	vmovdqa64	AVX512_ZEROS(%rip), %zmm6
	kmovw	%r12d, %k5
	vpbroadcastq	%r10, %zmm6{%k5}
	vpaddq	%zmm4, %zmm6, %zmm7
	vpcmpuq	$6, %zmm5, %zmm7, %k0
	vpandd	%zmm5, %zmm7, %zmm4
	kmovw	%k0, %ecx
	andl	$1, %ecx
.L369:
	vmovdqa64	%zmm4, -256(%r9,%rax)
	leaq	-320(%rax), %rsi
	cmpq	$256, %rax
	je	.L374
.L339:
	vmovdqa64	(%rdi,%rsi), %zmm10
	vpaddq	(%r8,%rsi), %zmm10, %zmm14
	sall	$7, %ecx
	vmovdqa64	AVX512_52_MASK(%rip), %zmm11
	vpcmpuq	$6, %zmm11, %zmm14, %k0
	kmovw	%k0, %edx
	movl	%edx, %r12d
	movzbl	%dl, %edx
	shrb	%r12b
	orb	%r12b, %cl
	je	.L338
	vmovdqa64	AVX512_ZEROS(%rip), %zmm12
	kmovw	%ecx, %k5
	vpbroadcastq	%r10, %zmm12{%k5}
	vpaddq	%zmm14, %zmm12, %zmm13
	vpcmpuq	$6, %zmm11, %zmm13, %k6
	vpandd	%zmm11, %zmm13, %zmm14
	kmovw	%k6, %edx
	andl	$1, %edx
.L338:
	vmovdqa64	%zmm14, (%r9,%rsi)
	leaq	-64(%rsi), %rax
	sall	$7, %edx
	vmovdqa64	-64(%rdi,%rsi), %zmm15
	vmovdqa64	AVX512_52_MASK(%rip), %zmm1
	vpaddq	-64(%r8,%rsi), %zmm15, %zmm0
	vpcmpuq	$6, %zmm1, %zmm0, %k2
	kmovw	%k2, %ecx
	movl	%ecx, %esi
	shrb	%sil
	orb	%sil, %dl
	jne	.L347
	movzbl	%cl, %edx
	jmp	.L361
	.p2align 4,,10
	.p2align 3
.L368:
	movzbl	%dl, %ecx
	jmp	.L369
.L374:
	testl	%ecx, %ecx
	jne	.L375
	vzeroupper
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L375:
	.cfi_restore_state
	movq	16(%r11), %r11
	movq	%rbx, %rdi
	addl	$1, %r11d
	movslq	%r11d, %rsi
	vzeroupper
	call	limb_t_realloc
	movq	(%rbx), %rbx
	movq	$1, (%rbx)
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6839:
	.size	limb_t_add_n_32768, .-limb_t_add_n_32768
	.p2align 4
	.globl	limb_t_add_n_65536
	.type	limb_t_add_n_65536, @function
limb_t_add_n_65536:
.LFB6840:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	.cfi_offset 12, -24
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movq	(%rdx), %r8
	movabsq	$4503599627370495, %rdx
	vmovdqa	AVX256_52_MASK(%rip), %ymm1
	movq	(%rdi), %r9
	movq	(%rsi), %rdi
	movq	10080(%r8), %rax
	andq	$-64, %rsp
	addq	10080(%rdi), %rax
	andq	%rax, %rdx
	shrq	$52, %rax
	movq	%rdx, 10080(%r9)
	sall	$4, %eax
	vmovdqa	10048(%r8), %ymm0
	vpaddq	10048(%rdi), %ymm0, %ymm3
	vpcmpuq	$6, %ymm1, %ymm3, %k3
	kmovw	%k3, %ecx
	orb	%cl, %al
	je	.L407
	vmovdqa	AVX256_ZEROS(%rip), %ymm2
	shrb	%al
	movl	$1, %esi
	kmovw	%eax, %k5
	vpbroadcastq	%rsi, %ymm2{%k5}
	vpaddq	%ymm3, %ymm2, %ymm4
	vpcmpuq	$6, %ymm1, %ymm4, %k1
	vpandq	%ymm4, %ymm1, %ymm3
	kmovw	%k1, %ecx
	movl	%ecx, %edx
	andl	$1, %edx
.L377:
	vmovdqa	%ymm3, 10048(%r9)
	movl	%edx, %ecx
	movl	$1, %r11d
	vmovdqa64	9984(%rdi), %zmm5
	vmovdqa64	AVX512_52_MASK(%rip), %zmm7
	sall	$7, %ecx
	vpaddq	9984(%r8), %zmm5, %zmm6
	vpcmpuq	$6, %zmm7, %zmm6, %k4
	kmovw	%k4, %eax
	movl	%eax, %esi
	shrb	%sil
	orb	%sil, %cl
	je	.L409
	vmovdqa64	AVX512_ZEROS(%rip), %zmm8
	kmovw	%ecx, %k6
	vpbroadcastq	%r11, %zmm8{%k6}
	vpaddq	%zmm6, %zmm8, %zmm9
	vpcmpuq	$6, %zmm7, %zmm9, %k2
	vpandd	%zmm7, %zmm9, %zmm6
	kmovw	%k2, %r10d
	andl	$1, %r10d
.L398:
	vmovdqa64	%zmm6, 9984(%r9)
	movl	$9920, %eax
	jmp	.L380
	.p2align 4,,10
	.p2align 3
.L388:
	vmovdqa64	AVX512_ZEROS(%rip), %zmm1
	kmovw	%edx, %k1
	vpbroadcastq	%r11, %zmm1{%k1}
	vpaddq	%zmm0, %zmm1, %zmm2
	vpcmpuq	$6, %zmm3, %zmm2, %k4
	vpandd	%zmm3, %zmm2, %zmm0
	kmovw	%k4, %eax
	andl	$1, %eax
.L399:
	vmovdqa64	%zmm0, (%r9,%rsi)
	vmovdqa64	-64(%rdi,%rsi), %zmm4
	sall	$7, %eax
	vpaddq	-64(%r8,%rsi), %zmm4, %zmm8
	vmovdqa64	AVX512_52_MASK(%rip), %zmm5
	vpcmpuq	$6, %zmm5, %zmm8, %k6
	kmovw	%k6, %ecx
	movl	%ecx, %r10d
	movzbl	%cl, %edx
	shrb	%r10b
	orb	%r10b, %al
	je	.L401
	vmovdqa64	AVX512_ZEROS(%rip), %zmm6
	kmovw	%eax, %k2
	vpbroadcastq	%r11, %zmm6{%k2}
	vpaddq	%zmm8, %zmm6, %zmm7
	vpcmpuq	$6, %zmm5, %zmm7, %k0
	vpandd	%zmm5, %zmm7, %zmm8
	kmovw	%k0, %edx
	andl	$1, %edx
.L401:
	vmovdqa64	%zmm8, -64(%r9,%rsi)
	vmovdqa64	-128(%rdi,%rsi), %zmm9
	sall	$7, %edx
	vpaddq	-128(%r8,%rsi), %zmm9, %zmm13
	vmovdqa64	AVX512_52_MASK(%rip), %zmm10
	vpcmpuq	$6, %zmm10, %zmm13, %k7
	kmovw	%k7, %eax
	movl	%eax, %ecx
	movzbl	%al, %r10d
	shrb	%cl
	orb	%cl, %dl
	je	.L403
	vmovdqa64	AVX512_ZEROS(%rip), %zmm11
	kmovw	%edx, %k3
	vpbroadcastq	%r11, %zmm11{%k3}
	vpaddq	%zmm13, %zmm11, %zmm12
	vpcmpuq	$6, %zmm10, %zmm12, %k5
	vpandd	%zmm10, %zmm12, %zmm13
	kmovw	%k5, %r10d
	andl	$1, %r10d
.L403:
	vmovdqa64	%zmm13, -128(%r9,%rsi)
	leaq	-192(%rsi), %rax
	cmpq	$128, %rsi
	je	.L410
.L380:
	vmovdqa64	(%rdi,%rax), %zmm10
	vpaddq	(%r8,%rax), %zmm10, %zmm14
	sall	$7, %r10d
	vmovdqa64	AVX512_52_MASK(%rip), %zmm11
	vpcmpuq	$6, %zmm11, %zmm14, %k0
	kmovw	%k0, %edx
	movl	%edx, %esi
	movzbl	%dl, %edx
	shrb	%sil
	orb	%sil, %r10b
	je	.L379
	vmovdqa64	AVX512_ZEROS(%rip), %zmm12
	kmovw	%r10d, %k7
	vpbroadcastq	%r11, %zmm12{%k7}
	vpaddq	%zmm14, %zmm12, %zmm13
	vpcmpuq	$6, %zmm11, %zmm13, %k3
	vpandd	%zmm11, %zmm13, %zmm14
	kmovw	%k3, %edx
	andl	$1, %edx
.L379:
	vmovdqa64	%zmm14, (%r9,%rax)
	sall	$7, %edx
	leaq	-64(%rax), %rsi
	vmovdqa64	-64(%rdi,%rax), %zmm15
	vmovdqa64	AVX512_52_MASK(%rip), %zmm3
	vpaddq	-64(%r8,%rax), %zmm15, %zmm0
	vpcmpuq	$6, %zmm3, %zmm0, %k5
	kmovw	%k5, %ecx
	movl	%ecx, %r10d
	shrb	%r10b
	orb	%r10b, %dl
	jne	.L388
	movzbl	%cl, %eax
	jmp	.L399
.L410:
	testl	%r10d, %r10d
	jne	.L411
	vzeroupper
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L407:
	.cfi_restore_state
	xorl	%edx, %edx
	jmp	.L377
.L409:
	movzbl	%al, %r10d
	jmp	.L398
.L411:
	movq	16(%r12), %r12
	movq	%rbx, %rdi
	addl	$1, %r12d
	movslq	%r12d, %rsi
	vzeroupper
	call	limb_t_realloc
	movq	(%rbx), %rbx
	movq	$1, (%rbx)
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6840:
	.size	limb_t_add_n_65536, .-limb_t_add_n_65536
	.p2align 4
	.globl	limb_t_add_n_131072
	.type	limb_t_add_n_131072, @function
limb_t_add_n_131072:
.LFB6841:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$1, %r11d
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	.cfi_offset 12, -24
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movq	(%rdx), %r8
	movabsq	$4503599627370495, %rdx
	vmovdqa64	AVX512_52_MASK(%rip), %zmm1
	movq	(%rdi), %r9
	movq	(%rsi), %rdi
	movq	20160(%r8), %rax
	andq	$-64, %rsp
	addq	20160(%rdi), %rax
	movq	%rax, %rcx
	andq	%rdx, %rax
	movq	%rax, 20160(%r9)
	shrq	$52, %rcx
	vmovdqa64	20032(%r8), %zmm0
	vpaddq	20032(%rdi), %zmm0, %zmm3
	sall	$7, %ecx
	vpcmpuq	$6, %zmm1, %zmm3, %k3
	kmovw	%k3, %edx
	movl	%edx, %esi
	shrb	%sil
	orb	%sil, %cl
	je	.L445
	vmovdqa64	AVX512_ZEROS(%rip), %zmm2
	kmovw	%ecx, %k5
	vpbroadcastq	%r11, %zmm2{%k5}
	vpaddq	%zmm3, %zmm2, %zmm4
	vpcmpuq	$6, %zmm1, %zmm4, %k1
	vpandd	%zmm1, %zmm4, %zmm3
	kmovw	%k1, %r10d
	andl	$1, %r10d
.L433:
	movl	$19968, %ecx
	sall	$7, %r10d
	vmovdqa64	%zmm3, 20032(%r9)
	vmovdqa64	AVX512_52_MASK(%rip), %zmm6
	vmovdqa64	(%r8,%rcx), %zmm5
	vpaddq	(%rdi,%rcx), %zmm5, %zmm9
	vpcmpuq	$6, %zmm6, %zmm9, %k4
	kmovw	%k4, %eax
	movl	%eax, %edx
	movzbl	%al, %eax
	shrb	%dl
	orb	%dl, %r10b
	jne	.L446
.L435:
	vmovdqa64	%zmm9, (%r9,%rcx)
	subq	$64, %rcx
	jmp	.L415
	.p2align 4,,10
	.p2align 3
.L424:
	vmovdqa64	AVX512_ZEROS(%rip), %zmm1
	kmovw	%edx, %k1
	vpbroadcastq	%r11, %zmm1{%k1}
	vpaddq	%zmm0, %zmm1, %zmm2
	vpcmpuq	$6, %zmm3, %zmm2, %k4
	vpandd	%zmm3, %zmm2, %zmm0
	kmovw	%k4, %eax
	andl	$1, %eax
.L436:
	vmovdqa64	%zmm0, (%r9,%rsi)
	vmovdqa64	-64(%r8,%rsi), %zmm4
	sall	$7, %eax
	vpaddq	-64(%rdi,%rsi), %zmm4, %zmm8
	vmovdqa64	AVX512_52_MASK(%rip), %zmm5
	vpcmpuq	$6, %zmm5, %zmm8, %k6
	kmovw	%k6, %ecx
	movl	%ecx, %r10d
	movzbl	%cl, %edx
	shrb	%r10b
	orb	%r10b, %al
	je	.L438
	vmovdqa64	AVX512_ZEROS(%rip), %zmm6
	kmovw	%eax, %k2
	vpbroadcastq	%r11, %zmm6{%k2}
	vpaddq	%zmm8, %zmm6, %zmm7
	vpcmpuq	$6, %zmm5, %zmm7, %k0
	vpandd	%zmm5, %zmm7, %zmm8
	kmovw	%k0, %edx
	andl	$1, %edx
.L438:
	vmovdqa64	%zmm8, -64(%r9,%rsi)
	vmovdqa64	-128(%r8,%rsi), %zmm9
	sall	$7, %edx
	vpaddq	-128(%rdi,%rsi), %zmm9, %zmm13
	vmovdqa64	AVX512_52_MASK(%rip), %zmm10
	vpcmpuq	$6, %zmm10, %zmm13, %k7
	kmovw	%k7, %eax
	movl	%eax, %ecx
	movzbl	%al, %eax
	shrb	%cl
	orb	%cl, %dl
	je	.L440
	vmovdqa64	AVX512_ZEROS(%rip), %zmm11
	kmovw	%edx, %k3
	vpbroadcastq	%r11, %zmm11{%k3}
	vpaddq	%zmm13, %zmm11, %zmm12
	vpcmpuq	$6, %zmm10, %zmm12, %k5
	vpandd	%zmm10, %zmm12, %zmm13
	kmovw	%k5, %eax
	andl	$1, %eax
.L440:
	vmovdqa64	%zmm13, -128(%r9,%rsi)
	leaq	-192(%rsi), %rcx
	cmpq	$128, %rsi
	je	.L447
.L415:
	vmovdqa64	(%r8,%rcx), %zmm10
	vpaddq	(%rdi,%rcx), %zmm10, %zmm14
	sall	$7, %eax
	vmovdqa64	AVX512_52_MASK(%rip), %zmm11
	vpcmpuq	$6, %zmm11, %zmm14, %k0
	kmovw	%k0, %edx
	movl	%edx, %esi
	movzbl	%dl, %edx
	shrb	%sil
	orb	%sil, %al
	je	.L414
	vmovdqa64	AVX512_ZEROS(%rip), %zmm12
	kmovw	%eax, %k7
	vpbroadcastq	%r11, %zmm12{%k7}
	vpaddq	%zmm14, %zmm12, %zmm13
	vpcmpuq	$6, %zmm11, %zmm13, %k3
	vpandd	%zmm11, %zmm13, %zmm14
	kmovw	%k3, %edx
	andl	$1, %edx
.L414:
	vmovdqa64	%zmm14, (%r9,%rcx)
	leaq	-64(%rcx), %rsi
	sall	$7, %edx
	vmovdqa64	-64(%r8,%rcx), %zmm15
	vmovdqa64	AVX512_52_MASK(%rip), %zmm3
	vpaddq	-64(%rdi,%rcx), %zmm15, %zmm0
	vpcmpuq	$6, %zmm3, %zmm0, %k5
	kmovw	%k5, %ecx
	movl	%ecx, %r10d
	shrb	%r10b
	orb	%r10b, %dl
	jne	.L424
	movzbl	%cl, %eax
	jmp	.L436
.L447:
	testl	%eax, %eax
	jne	.L448
	vzeroupper
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L446:
	.cfi_restore_state
	vmovdqa64	AVX512_ZEROS(%rip), %zmm7
	kmovw	%r10d, %k6
	vpbroadcastq	%r11, %zmm7{%k6}
	vpaddq	%zmm9, %zmm7, %zmm8
	vpcmpuq	$6, %zmm6, %zmm8, %k2
	vpandd	%zmm6, %zmm8, %zmm9
	kmovw	%k2, %eax
	andl	$1, %eax
	jmp	.L435
.L445:
	movzbl	%dl, %r10d
	jmp	.L433
.L448:
	movq	16(%r12), %r12
	movq	%rbx, %rdi
	addl	$1, %r12d
	movslq	%r12d, %rsi
	vzeroupper
	call	limb_t_realloc
	movq	(%rbx), %rbx
	movq	$1, (%rbx)
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6841:
	.size	limb_t_add_n_131072, .-limb_t_add_n_131072
	.section	.text.unlikely
.LCOLDB16:
	.text
.LHOTB16:
	.p2align 4
	.globl	limb_t_add_n
	.type	limb_t_add_n, @function
limb_t_add_n:
.LFB6842:
	.cfi_startproc
	movq	16(%rsi), %rax
	cmpl	$5, %eax
	jle	.L462
	cmpl	$10, %eax
	jle	.L463
	cmpl	$20, %eax
	jle	.L464
	cmpl	$40, %eax
	jle	.L465
	cmpl	$80, %eax
	jle	.L466
	cmpl	$160, %eax
	jle	.L467
	cmpl	$320, %eax
	jle	.L468
	cmpl	$640, %eax
	jle	.L469
	cmpl	$1280, %eax
	jle	.L470
	cmpl	$2560, %eax
	jg	.L459
	jmp	limb_t_add_n_131072
	.p2align 4,,10
	.p2align 3
.L463:
	jmp	limb_t_add_n_512
	.p2align 4,,10
	.p2align 3
.L462:
	jmp	limb_t_add_n_256
	.p2align 4,,10
	.p2align 3
.L466:
	jmp	limb_t_add_n_4096
	.p2align 4,,10
	.p2align 3
.L464:
	jmp	limb_t_add_n_1024
	.p2align 4,,10
	.p2align 3
.L465:
	jmp	limb_t_add_n_2048
	.p2align 4,,10
	.p2align 3
.L469:
	jmp	limb_t_add_n_32768
	.p2align 4,,10
	.p2align 3
.L467:
	jmp	limb_t_add_n_8192
	.p2align 4,,10
	.p2align 3
.L468:
	jmp	limb_t_add_n_16384
	.p2align 4,,10
	.p2align 3
.L470:
	jmp	limb_t_add_n_65536
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	limb_t_add_n.cold, @function
limb_t_add_n.cold:
.LFSB6842:
.L459:
	pushq	%rax
	.cfi_def_cfa_offset 16
	call	abort
	.cfi_endproc
.LFE6842:
	.text
	.size	limb_t_add_n, .-limb_t_add_n
	.section	.text.unlikely
	.size	limb_t_add_n.cold, .-limb_t_add_n.cold
.LCOLDE16:
	.text
.LHOTE16:
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Trying to run correctness test"
	.section	.rodata.str1.1
.LC18:
	.string	"experiments/results"
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"Running random test cases for bit-size %d on core %d\n"
	.align 8
.LC20:
	.string	"../test/cases/%d/random.csv.gz"
	.align 8
.LC21:
	.string	"Running equal test cases for bit-size %d on core %d\n"
	.section	.rodata.str1.1
.LC22:
	.string	"../test/cases/%d/equal.csv.gz"
	.section	.rodata.str1.8
	.align 8
.LC23:
	.string	"Running greater test cases for bit-size %d on core %d\n"
	.align 8
.LC24:
	.string	"../test/cases/%d/greater.csv.gz"
	.align 8
.LC25:
	.string	"Running smaller test cases for bit-size %d on core %d\n"
	.align 8
.LC26:
	.string	"../test/cases/%d/smaller.csv.gz"
	.section	.rodata.str1.1
.LC27:
	.string	"Invalid test case"
.LC28:
	.string	"rb"
.LC29:
	.string	"Error reading line"
.LC30:
	.string	","
.LC31:
	.string	"Error parsing line: %s\n"
	.section	.rodata.str1.8
	.align 8
.LC32:
	.string	"Test case failed, at iteration %d\n"
	.align 8
.LC33:
	.string	"Random test cases passed for bit-size %d\n"
	.align 8
.LC34:
	.string	"Equal test cases passed for bit-size %d\n"
	.align 8
.LC35:
	.string	"Greater test cases passed for bit-size %d\n"
	.align 8
.LC36:
	.string	"Smaller test cases passed for bit-size %d\n"
	.section	.text.unlikely
.LCOLDB37:
	.text
.LHOTB37:
	.p2align 4
	.globl	run_correctness_test
	.type	run_correctness_test, @function
run_correctness_test:
.LFB6844:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edi, %r14d
	movl	$.LC17, %edi
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
	subq	$655512, %rsp
	.cfi_def_cfa_offset 655568
	call	puts
	movl	$.LC18, %edi
	call	create_directory
	cmpl	$2, %r14d
	je	.L472
	jg	.L473
	testl	%r14d, %r14d
	je	.L474
	cmpl	$1, %r14d
	jne	.L476
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC21, %edi
	xorl	%eax, %eax
	leaq	32(%rsp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC22, %edx
	movl	$100, %esi
	call	snprintf
	jmp	.L478
	.p2align 4,,10
	.p2align 3
.L474:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC19, %edi
	xorl	%eax, %eax
	leaq	32(%rsp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC20, %edx
	movl	$100, %esi
	call	snprintf
.L478:
	movl	$.LC28, %esi
	movq	%rbx, %rdi
	call	open_gzfile
	movq	%rax, %rdi
	movq	%rax, (%rsp)
	call	skip_first_line
	movl	$0, 12(%rsp)
	movl	%r14d, 28(%rsp)
.L495:
	movq	(%rsp), %rdi
	movl	$655360, %edx
	leaq	144(%rsp), %rsi
	call	gzgets
	testq	%rax, %rax
	je	.L594
	movl	$.LC30, %esi
	leaq	144(%rsp), %rdi
	call	strtok
	xorl	%edi, %edi
	movl	$.LC30, %esi
	movq	%rax, %r12
	call	strtok
	xorl	%edi, %edi
	movl	$.LC30, %esi
	movq	%rax, %rbp
	call	strtok
	testq	%r12, %r12
	movq	%rax, %r15
	sete	%al
	testq	%rbp, %rbp
	sete	%dl
	orb	%dl, %al
	jne	.L502
	testq	%r15, %r15
	je	.L502
	movq	%r12, %rdi
	call	limb_set_str
	movq	%rbp, %rdi
	movq	%rax, %r13
	call	limb_set_str
	movq	%r13, %rdi
	movq	%rax, %rsi
	movq	%rax, %r14
	call	limb_t_adjust_limb_sizes
	movslq	16(%r13), %rdi
	call	limb_t_alloc
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%rax, %r12
	movq	%rax, %rdi
	call	limb_t_add_n
	movq	%r12, %rdi
	call	limb_get_str
	movq	%rax, %rbp
	movq	%rax, %rdi
	call	strlen
	movzbl	0(%rbp), %esi
	movzbl	(%r15), %ecx
	movq	%rax, %rbx
	cmpb	$45, %sil
	movb	%sil, 26(%rsp)
	sete	%dil
	xorl	%r9d, %r9d
	cmpb	$45, %cl
	movb	%cl, 27(%rsp)
	sete	%r9b
	movzbl	%dil, %r8d
	leaq	0(%rbp,%r8), %rdi
	leaq	(%r15,%r9), %rbp
	call	trim_leading_zeros_and_whitespace
	movq	%rbp, %rdi
	movq	%rax, %r15
	call	trim_leading_zeros_and_whitespace
	movq	%r15, %rdi
	movq	%rax, %rbp
	call	trim_trailing_newline
	movq	%rbp, %rdi
	call	trim_trailing_newline
	testl	%ebx, %ebx
	jle	.L489
	call	__ctype_tolower_loc
	xorl	%r8d, %r8d
	leal	-1(%rbx), %r10d
	andl	$3, %ebx
	je	.L488
	cmpq	$1, %rbx
	je	.L551
	cmpq	$2, %rbx
	je	.L552
	movsbq	(%r15), %r11
	movq	(%rax), %rdx
	movl	$1, %r8d
	movl	(%rdx,%r11,4), %ebx
	movb	%bl, (%r15)
	movsbq	0(%rbp), %rsi
	movq	(%rax), %rcx
	movl	(%rcx,%rsi,4), %edi
	movb	%dil, 0(%rbp)
.L552:
	movsbq	(%r15,%r8), %r9
	movq	(%rax), %r11
	movl	(%r11,%r9,4), %edx
	movb	%dl, (%r15,%r8)
	movsbq	0(%rbp,%r8), %rbx
	movq	(%rax), %rsi
	movl	(%rsi,%rbx,4), %ecx
	movb	%cl, 0(%rbp,%r8)
	addq	$1, %r8
.L551:
	movsbq	(%r15,%r8), %rdi
	movq	(%rax), %r9
	movq	%r8, %rcx
	movl	(%r9,%rdi,4), %r11d
	movb	%r11b, (%r15,%r8)
	movsbq	0(%rbp,%r8), %rdx
	movq	(%rax), %rbx
	movl	(%rbx,%rdx,4), %esi
	movb	%sil, 0(%rbp,%r8)
	addq	$1, %r8
	cmpq	%rcx, %r10
	je	.L489
.L488:
	movq	(%rax), %r9
	movsbq	(%r15,%r8), %rdi
	movl	(%r9,%rdi,4), %r11d
	movb	%r11b, (%r15,%r8)
	movq	(%rax), %rbx
	movsbq	0(%rbp,%r8), %rdx
	movl	(%rbx,%rdx,4), %esi
	movb	%sil, 0(%rbp,%r8)
	movq	(%rax), %rcx
	movsbq	1(%r15,%r8), %rdi
	movl	(%rcx,%rdi,4), %r9d
	movb	%r9b, 1(%r15,%r8)
	movq	(%rax), %rdx
	movsbq	1(%rbp,%r8), %r11
	movl	(%rdx,%r11,4), %ebx
	movb	%bl, 1(%rbp,%r8)
	movsbq	2(%r15,%r8), %rsi
	leaq	3(%r8), %rbx
	movq	(%rax), %rdi
	movl	(%rdi,%rsi,4), %ecx
	movb	%cl, 2(%r15,%r8)
	movsbq	2(%rbp,%r8), %r9
	movq	(%rax), %r11
	movl	(%r11,%r9,4), %edx
	movb	%dl, 2(%rbp,%r8)
	movsbq	3(%r15,%r8), %rdi
	movq	(%rax), %rsi
	movl	(%rsi,%rdi,4), %ecx
	movb	%cl, 3(%r15,%r8)
	movsbq	3(%rbp,%r8), %r9
	movq	(%rax), %r11
	movl	(%r11,%r9,4), %edx
	movb	%dl, 3(%rbp,%r8)
	addq	$4, %r8
	cmpq	%rbx, %r10
	jne	.L488
.L489:
	movq	%r15, %rdi
	call	strlen
	movq	%rbp, %rdi
	movq	%rax, 16(%rsp)
	call	strlen
	movq	16(%rsp), %r10
	cmpq	%rax, %r10
	jne	.L595
	xorl	%ebx, %ebx
	testq	%r10, %r10
	je	.L491
	movq	%r10, %r8
	andl	$7, %r8d
	je	.L490
	cmpq	$1, %r8
	je	.L554
	cmpq	$2, %r8
	je	.L555
	cmpq	$3, %r8
	je	.L556
	cmpq	$4, %r8
	je	.L557
	cmpq	$5, %r8
	je	.L558
	cmpq	$6, %r8
	je	.L559
	movzbl	0(%rbp), %edi
	cmpb	%dil, (%r15)
	jne	.L590
	movl	$1, %ebx
.L559:
	movzbl	0(%rbp,%rbx), %esi
	cmpb	%sil, (%r15,%rbx)
	jne	.L590
	addq	$1, %rbx
.L558:
	movzbl	0(%rbp,%rbx), %ecx
	cmpb	%cl, (%r15,%rbx)
	jne	.L590
	addq	$1, %rbx
.L557:
	movzbl	0(%rbp,%rbx), %r9d
	cmpb	%r9b, (%r15,%rbx)
	jne	.L590
	addq	$1, %rbx
.L556:
	movzbl	0(%rbp,%rbx), %r11d
	cmpb	%r11b, (%r15,%rbx)
	jne	.L590
	addq	$1, %rbx
.L555:
	movzbl	0(%rbp,%rbx), %edx
	cmpb	%dl, (%r15,%rbx)
	jne	.L590
	addq	$1, %rbx
.L554:
	movzbl	0(%rbp,%rbx), %eax
	cmpb	%al, (%r15,%rbx)
	jne	.L590
	addq	$1, %rbx
	cmpq	%rbx, %r10
	je	.L491
.L490:
	movzbl	0(%rbp,%rbx), %r8d
	cmpb	%r8b, (%r15,%rbx)
	jne	.L590
	leaq	1(%rbx), %rsi
	movzbl	0(%rbp,%rsi), %edi
	movq	%rsi, %rbx
	cmpb	%dil, (%r15,%rsi)
	jne	.L590
	addq	$1, %rbx
	movzbl	0(%rbp,%rbx), %ecx
	cmpb	%cl, (%r15,%rbx)
	jne	.L590
	movzbl	2(%rbp,%rsi), %r9d
	leaq	2(%rsi), %rbx
	cmpb	%r9b, 2(%r15,%rsi)
	jne	.L590
	movzbl	3(%rbp,%rsi), %r11d
	leaq	3(%rsi), %rbx
	cmpb	%r11b, 3(%r15,%rsi)
	jne	.L590
	movzbl	4(%rbp,%rsi), %edx
	leaq	4(%rsi), %rbx
	cmpb	%dl, 4(%r15,%rsi)
	jne	.L590
	movzbl	5(%rbp,%rsi), %eax
	leaq	5(%rsi), %rbx
	cmpb	%al, 5(%r15,%rsi)
	jne	.L590
	movzbl	6(%rbp,%rsi), %r8d
	leaq	6(%rsi), %rbx
	cmpb	%r8b, 6(%r15,%rsi)
	jne	.L590
	leaq	7(%rsi), %rbx
	cmpq	%rbx, %r10
	jne	.L490
.L491:
	cmpb	$45, 26(%rsp)
	sete	%r15b
	cmpb	$45, 27(%rsp)
	sete	%bpl
	cmpb	%bpl, %r15b
	jne	.L596
	movq	%r13, %rdi
	call	limb_t_free
	movq	%r14, %rdi
	call	limb_t_free
	movq	%r12, %rdi
	call	limb_t_free
	addl	$1, 12(%rsp)
	movl	12(%rsp), %r13d
	cmpl	$100000, %r13d
	jne	.L495
	movl	28(%rsp), %r14d
.L496:
	movl	NUM_BITS(%rip), %esi
	cmpl	$2, %r14d
	je	.L497
	cmpl	$3, %r14d
	je	.L498
	cmpl	$1, %r14d
	je	.L499
	movl	$.LC33, %edi
	xorl	%eax, %eax
	call	printf
.L500:
	movq	(%rsp), %rdi
	call	gzclose
	addq	$655512, %rsp
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
.L595:
	.cfi_restore_state
	movl	$.LC4, %edi
	call	puts
	movq	%rbp, %rdi
	call	strlen
	movq	%r15, %rdi
	movq	%rax, %rbx
	call	strlen
	movq	%rbx, %rdx
	movl	$.LC5, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	printf
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movl	$.LC6, %edi
	xorl	%eax, %eax
	call	printf
.L493:
	movl	12(%rsp), %esi
	movl	$.LC32, %edi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
	.p2align 4,,10
	.p2align 3
.L590:
	movl	$.LC7, %edi
	call	puts
	movq	%rbx, %rsi
	movl	$.LC8, %edi
	xorl	%eax, %eax
	call	printf
	movsbl	(%r15,%rbx), %edx
	movq	%rbx, %rsi
	movq	%rbx, %rcx
	movsbl	0(%rbp,%rbx), %r8d
	movl	$.LC9, %edi
	xorl	%eax, %eax
	call	printf
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L493
	.p2align 4,,10
	.p2align 3
.L473:
	cmpl	$3, %r14d
	jne	.L476
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC25, %edi
	xorl	%eax, %eax
	leaq	32(%rsp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC26, %edx
	movl	$100, %esi
	call	snprintf
	jmp	.L478
	.p2align 4,,10
	.p2align 3
.L472:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC23, %edi
	xorl	%eax, %eax
	leaq	32(%rsp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC24, %edx
	movl	$100, %esi
	call	snprintf
	jmp	.L478
	.p2align 4,,10
	.p2align 3
.L596:
	movl	$.LC11, %edi
	call	puts
	jmp	.L493
.L594:
	movq	(%rsp), %rdi
	movl	28(%rsp), %r14d
	call	gzeof
	testl	%eax, %eax
	jne	.L496
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L499:
	movl	$.LC34, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L500
.L498:
	movl	$.LC36, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L500
.L497:
	movl	$.LC35, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L500
.L502:
	movq	stderr(%rip), %rdi
	leaq	144(%rsp), %rdx
	movl	$.LC31, %esi
	xorl	%eax, %eax
	call	fprintf
	movq	(%rsp), %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
.L476:
	movl	$.LC27, %edi
	call	puts
	movl	$1, %edi
	call	exit
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	run_correctness_test.cold, @function
run_correctness_test.cold:
.LFSB6844:
.L570:
	.cfi_def_cfa_offset 655568
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movl	$.LC29, %edi
	call	perror
	movq	(%rsp), %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6844:
	.text
	.size	run_correctness_test, .-run_correctness_test
	.section	.text.unlikely
	.size	run_correctness_test.cold, .-run_correctness_test.cold
.LCOLDE37:
	.text
.LHOTE37:
	.section	.rodata.str1.8
	.align 8
.LC39:
	.string	"Trying to run benchmarking test"
	.align 8
.LC40:
	.string	"Running the tests with RDTSC measurements"
	.align 8
.LC41:
	.string	"experiments/results/rdtsc_measurements"
	.align 8
.LC42:
	.string	"Running the tests with timespec measurements"
	.align 8
.LC43:
	.string	"experiments/results/timespec_measurements"
	.align 8
.LC44:
	.string	"Running the tests with rusage measurements"
	.align 8
.LC45:
	.string	"experiments/results/cputime_measurements"
	.section	.rodata.str1.1
.LC46:
	.string	"Invalid measure type"
.LC47:
	.string	"Running %d iterations...\n"
	.section	.rodata.str1.8
	.align 8
.LC48:
	.string	"Iteration %d, reading test case %d\n"
	.section	.rodata.str1.1
.LC49:
	.string	"Starting addition"
	.section	.rodata.str1.8
	.align 8
.LC50:
	.string	"Calibrating CPU speed using RDTSC..."
	.section	.rodata.str1.1
.LC52:
	.string	"done"
	.section	.rodata.str1.8
	.align 8
.LC53:
	.string	"Calibrated time: %f microseconds\n"
	.section	.rodata.str1.1
.LC55:
	.string	"Adding %lld times\n"
	.section	.rodata.str1.8
	.align 8
.LC58:
	.string	"RESULT: %.*f operations per second\n"
	.align 8
.LC59:
	.string	"Calibrating CPU speed using timespec..."
	.align 8
.LC60:
	.string	"Calibrating CPU speed using rusage..."
	.section	.rodata.str1.1
.LC63:
	.string	"done!"
	.section	.rodata.str1.8
	.align 8
.LC65:
	.string	"experiments/results/rdtsc_measurements/random_%d_%d.csv.gz"
	.section	.rodata.str1.1
.LC66:
	.string	"wb"
	.section	.rodata.str1.8
	.align 8
.LC67:
	.string	"experiments/results/timespec_measurements/random_%d_%d.csv.gz"
	.align 8
.LC68:
	.string	"experiments/results/cputime_measurements/random_%d_%d.csv.gz"
	.align 8
.LC69:
	.string	"experiments/results/rdtsc_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC70:
	.string	"experiments/results/timespec_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC71:
	.string	"experiments/results/cputime_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC72:
	.string	"experiments/results/cputime_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC73:
	.string	"experiments/results/rdtsc_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC74:
	.string	"experiments/results/timespec_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC75:
	.string	"experiments/results/timespec_measurements/greater_%d_%d.csv.gz"
	.align 8
.LC76:
	.string	"experiments/results/cputime_measurements/greater_%d_%d.csv.gz"
	.align 8
.LC77:
	.string	"experiments/results/rdtsc_measurements/greater_%d_%d.csv.gz"
	.section	.text.unlikely
.LCOLDB79:
	.text
.LHOTB79:
	.p2align 4
	.globl	run_benchmarking_test
	.type	run_benchmarking_test, @function
run_benchmarking_test:
.LFB6845:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	movl	%edi, %ebp
	movl	$.LC39, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebx
	subq	$656024, %rsp
	.cfi_def_cfa_offset 656080
	call	puts
	movl	$.LC18, %edi
	call	create_directory
	cmpl	$1, %ebx
	je	.L598
	cmpl	$2, %ebx
	je	.L599
	testl	%ebx, %ebx
	jne	.L600
	movl	$.LC40, %edi
	call	puts
	movl	$.LC41, %edi
	call	create_directory
	cmpl	$2, %ebp
	je	.L601
	jg	.L602
	testl	%ebp, %ebp
	je	.L603
	cmpl	$1, %ebp
	jne	.L605
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC21, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	64(%rsp), %r15
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC22, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC69, %edx
	movl	CORE_NO(%rip), %r8d
.L982:
	movl	$100, %esi
	movq	%r15, %rdi
	xorl	%eax, %eax
	call	snprintf
	movl	$.LC66, %esi
	movq	%r15, %rdi
	call	open_gzfile
	movq	%rax, 16(%rsp)
.L668:
	movl	$.LC28, %esi
	movq	%r14, %rdi
	xorl	%r13d, %r13d
	call	open_gzfile
	leaq	656(%rsp), %rbp
	movq	%rax, %rdi
	movq	%rax, %r14
	call	skip_first_line
	xorl	%eax, %eax
	call	generate_seed
	movl	%eax, %edi
	call	srand
	movl	$1, %esi
	movl	$.LC47, %edi
	xorl	%eax, %eax
	call	printf
	call	rand
	movl	$.LC48, %edi
	movslq	%eax, %rdx
	imulq	$351843721, %rdx, %rcx
	movl	%edx, %eax
	movq	%rdx, %r12
	sarl	$31, %eax
	sarq	$45, %rcx
	subl	%eax, %ecx
	xorl	%eax, %eax
	imull	$100000, %ecx, %esi
	subl	%esi, %r12d
	xorl	%esi, %esi
	movl	%r12d, %edx
	call	printf
	movq	%r14, %rdi
	call	gzrewind
	movq	%r14, %rdi
	call	skip_first_line
	testl	%r12d, %r12d
	jle	.L623
	movl	%r12d, %edi
	andl	$3, %edi
	je	.L617
	cmpl	$1, %edi
	je	.L861
	cmpl	$2, %edi
	je	.L862
	movl	$655360, %edx
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movl	$1, %r13d
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L965
.L862:
	movl	$655360, %edx
	xorl	%esi, %esi
	movq	%rbp, %rdi
	addl	$1, %r13d
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L965
.L861:
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%rbp, %rdi
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L965
	addl	$1, %r13d
	cmpl	%r13d, %r12d
	je	.L623
.L617:
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%rbp, %rdi
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L965
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%rbp, %rdi
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L965
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%rbp, %rdi
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L965
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%rbp, %rdi
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L965
	addl	$4, %r13d
	cmpl	%r13d, %r12d
	jne	.L617
.L623:
	movl	$.LC30, %esi
	movq	%rbp, %rdi
	call	strtok
	xorl	%edi, %edi
	movl	$.LC30, %esi
	movq	%rax, %r15
	call	strtok
	xorl	%edi, %edi
	movl	$.LC30, %esi
	movq	%rax, %r12
	call	strtok
	testq	%r15, %r15
	sete	%r8b
	testq	%r12, %r12
	sete	%r9b
	orb	%r9b, %r8b
	jne	.L618
	testq	%rax, %rax
	je	.L618
	movq	%r15, %rdi
	call	limb_set_str
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	limb_set_str
	movq	%rbp, %rdi
	movq	%rax, %rsi
	movq	%rax, %r12
	call	limb_t_adjust_limb_sizes
	movq	16(%rbp), %r15
	movslq	%r15d, %rdi
	call	limb_t_alloc
	movl	$.LC49, %edi
	movq	%rax, %r13
	call	puts
	testl	%r15d, %r15d
	jle	.L629
	leal	-1(%r15), %r10d
	movq	%rbp, %rax
	movq	%r12, %rcx
	shrl	$6, %r10d
	salq	$6, %r10
	leaq	64(%rbp,%r10), %r11
	shrq	$6, %r10
	addq	$1, %r10
	andl	$7, %r10d
	je	.L628
	cmpq	$1, %r10
	je	.L863
	cmpq	$2, %r10
	je	.L864
	cmpq	$3, %r10
	je	.L865
	cmpq	$4, %r10
	je	.L866
	cmpq	$5, %r10
	je	.L867
	cmpq	$6, %r10
	jne	.L984
.L868:
	clflush	(%rax)
	clflush	(%rcx)
	addq	$64, %rax
	addq	$64, %rcx
.L867:
	clflush	(%rax)
	clflush	(%rcx)
	addq	$64, %rax
	addq	$64, %rcx
.L866:
	clflush	(%rax)
	clflush	(%rcx)
	addq	$64, %rax
	addq	$64, %rcx
.L865:
	clflush	(%rax)
	clflush	(%rcx)
	addq	$64, %rax
	addq	$64, %rcx
.L864:
	clflush	(%rax)
	clflush	(%rcx)
	addq	$64, %rax
	addq	$64, %rcx
.L863:
	clflush	(%rax)
	clflush	(%rcx)
	addq	$64, %rax
	addq	$64, %rcx
	cmpq	%r11, %rax
	je	.L629
.L628:
	clflush	(%rax)
	clflush	(%rcx)
	leaq	64(%rcx), %rdx
	clflush	64(%rax)
	clflush	(%rdx)
	leaq	128(%rcx), %rsi
	clflush	128(%rax)
	clflush	(%rsi)
	leaq	192(%rcx), %rdi
	clflush	192(%rax)
	clflush	(%rdi)
	leaq	256(%rcx), %r8
	clflush	256(%rax)
	clflush	(%r8)
	leaq	320(%rcx), %r9
	clflush	320(%rax)
	clflush	(%r9)
	leaq	384(%rcx), %r15
	clflush	384(%rax)
	clflush	(%r15)
	leaq	448(%rcx), %r10
	clflush	448(%rax)
	clflush	(%r10)
	addq	$512, %rax
	addq	$512, %rcx
	cmpq	%r11, %rax
	jne	.L628
.L629:
	mfence
	cmpl	$1, %ebx
	je	.L625
	cmpl	$2, %ebx
	je	.L626
	movl	$.LC50, %edi
	call	puts
	movq	stdout(%rip), %rdi
	call	fflush
	xorl	%eax, %eax
#APP
# 1009 "add.c" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$1, %r15d
	call	limb_t_add_n
	.p2align 4
	.p2align 3
.L631:
	addq	%r15, %r15
#APP
# 232 "../myutils.h" 1
	CPUID
	RDTSC
	mov %edx, %r8d
	mov %eax, %esi
	
# 0 "" 2
#NO_APP
	salq	$32, %r8
	movl	%esi, %r9d
	xorl	%ebx, %ebx
	orq	%r9, %r8
	movq	%r8, 8(%rsp)
	testq	%r15, %r15
	jle	.L634
	movq	%r15, %r10
	andl	$7, %r10d
	je	.L633
	cmpq	$1, %r10
	je	.L870
	cmpq	$2, %r10
	je	.L871
	cmpq	$3, %r10
	je	.L872
	cmpq	$4, %r10
	je	.L873
	cmpq	$5, %r10
	je	.L874
	cmpq	$6, %r10
	je	.L875
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$1, %ebx
	call	limb_t_add_n
.L875:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L874:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L873:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L872:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L871:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L870:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
	cmpq	%r15, %rbx
	je	.L634
.L633:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$8, %rbx
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	cmpq	%r15, %rbx
	jne	.L633
.L634:
#APP
# 245 "../myutils.h" 1
	RDTSCP
	mov %edx, %r11d
	mov %eax, %edi
	CPUID
	
# 0 "" 2
#NO_APP
	movq	%r11, %rdx
	movq	8(%rsp), %rax
	movl	%edi, %ecx
	salq	$32, %rdx
	orq	%rcx, %rdx
	subq	%rax, %rdx
	cmpq	$699999999, %rdx
	jle	.L631
	vxorpd	%xmm10, %xmm10, %xmm10
	movl	$.LC52, %edi
	vcvtsi2sdq	%rdx, %xmm10, %xmm11
	vmulsd	.LC51(%rip), %xmm11, %xmm12
	vcvtsi2sdq	%r15, %xmm10, %xmm13
	vcvttsd2siq	%xmm12, %r8
	vcvtsi2sdq	%r8, %xmm10, %xmm1
	vdivsd	%xmm13, %xmm1, %xmm14
	vmovsd	%xmm14, 8(%rsp)
	call	puts
	movl	$.LC53, %edi
	movl	$1, %eax
	vmovsd	8(%rsp), %xmm0
	call	printf
	movl	$.LC55, %edi
	xorl	%eax, %eax
	vmovsd	.LC54(%rip), %xmm15
	vdivsd	8(%rsp), %xmm15, %xmm6
	vcvttsd2usi	%xmm6, %r15
	movq	%r15, 8(%rsp)
	leaq	1(%r15), %r15
	movq	%r15, %rsi
	call	printf
	movq	stdout(%rip), %rdi
	call	fflush
#APP
# 232 "../myutils.h" 1
	CPUID
	RDTSC
	mov %edx, %r9d
	mov %eax, %esi
	
# 0 "" 2
#NO_APP
	salq	$32, %r9
	movl	%esi, %r10d
	xorl	%ebx, %ebx
	orq	%r10, %r9
	movq	%r9, 48(%rsp)
	testq	%r15, %r15
	je	.L638
	movq	%r15, %r11
	andl	$7, %r11d
	je	.L635
	cmpq	$1, %r11
	je	.L877
	cmpq	$2, %r11
	je	.L878
	cmpq	$3, %r11
	je	.L879
	cmpq	$4, %r11
	je	.L880
	cmpq	$5, %r11
	je	.L881
	cmpq	$6, %r11
	je	.L882
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$1, %ebx
	call	limb_t_add_n
.L882:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L881:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L880:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L879:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L878:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L877:
	movq	%rbp, %rdi
	movq	%r13, %rdx
	movq	%r12, %rsi
	call	limb_t_add_n
	movq	%rbx, %rdi
	addq	$1, %rbx
	cmpq	%rdi, 8(%rsp)
	je	.L638
.L635:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	leaq	7(%rbx), %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movq	%rdx, 32(%rsp)
	movq	%r13, %rdx
	addq	$8, %rbx
	call	limb_t_add_n
	movq	32(%rsp), %rcx
	cmpq	%rcx, 8(%rsp)
	jne	.L635
.L638:
#APP
# 245 "../myutils.h" 1
	RDTSCP
	mov %edx, %ebp
	mov %eax, %r12d
	CPUID
	
# 0 "" 2
#NO_APP
	vxorpd	%xmm7, %xmm7, %xmm7
	salq	$32, %rbp
	movq	48(%rsp), %rax
	movl	%r12d, %r13d
	vcvtsi2sdq	%r15, %xmm7, %xmm0
	orq	%r13, %rbp
	vmovsd	.LC56(%rip), %xmm2
	subq	%rax, %rbp
	vcvtusi2sdq	%rbp, %xmm7, %xmm4
	vmulsd	.LC51(%rip), %xmm4, %xmm5
	vmulsd	%xmm0, %xmm2, %xmm3
	vdivsd	%xmm5, %xmm3, %xmm8
	vcomisd	.LC38(%rip), %xmm8
	ja	.L671
	vmovsd	.LC38(%rip), %xmm6
	xorl	%esi, %esi
	vmovsd	.LC57(%rip), %xmm9
.L637:
	vmulsd	%xmm9, %xmm6, %xmm10
	leal	1(%rsi), %r8d
	movl	%r8d, %esi
	vcomisd	%xmm10, %xmm8
	ja	.L636
	vmulsd	%xmm9, %xmm10, %xmm11
	addl	$1, %esi
	vcomisd	%xmm11, %xmm8
	ja	.L636
	vmulsd	%xmm9, %xmm11, %xmm12
	leal	2(%r8), %esi
	vcomisd	%xmm12, %xmm8
	ja	.L636
	vmulsd	%xmm9, %xmm12, %xmm1
	leal	3(%r8), %esi
	vcomisd	%xmm1, %xmm8
	ja	.L636
	vmulsd	%xmm9, %xmm1, %xmm13
	leal	4(%r8), %esi
	vcomisd	%xmm13, %xmm8
	ja	.L636
	vmulsd	%xmm9, %xmm13, %xmm14
	leal	5(%r8), %esi
	vcomisd	%xmm14, %xmm8
	ja	.L636
	vmulsd	%xmm9, %xmm14, %xmm15
	leal	6(%r8), %esi
	vcomisd	%xmm15, %xmm8
	ja	.L636
	vmulsd	%xmm9, %xmm15, %xmm6
	leal	7(%r8), %esi
	vcomisd	%xmm6, %xmm8
	jbe	.L637
	.p2align 4
	.p2align 3
.L636:
	vmovapd	%xmm8, %xmm0
	movl	$.LC58, %edi
	movl	$1, %eax
	call	printf
	movq	%r14, %rdi
	call	gzclose
	movq	16(%rsp), %rdi
	call	gzclose
.L979:
	addq	$656024, %rsp
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
.L599:
	.cfi_restore_state
	movl	$.LC44, %edi
	call	puts
	movl	$.LC45, %edi
	call	create_directory
	cmpl	$1, %ebp
	je	.L612
	jle	.L985
	cmpl	$2, %ebp
	je	.L615
	cmpl	$3, %ebp
	jne	.L605
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC25, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	400(%rsp), %r13
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC26, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC72, %edx
	movl	CORE_NO(%rip), %r8d
.L981:
	movl	$100, %esi
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	snprintf
	movl	$.LC66, %esi
	movq	%r13, %rdi
	call	open_gzfile
	movq	%rax, 48(%rsp)
	jmp	.L668
	.p2align 4,,10
	.p2align 3
.L598:
	movl	$.LC42, %edi
	call	puts
	movl	$.LC43, %edi
	call	create_directory
	cmpl	$2, %ebp
	je	.L607
	jg	.L608
	testl	%ebp, %ebp
	je	.L609
	cmpl	$1, %ebp
	jne	.L605
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC21, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	288(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC22, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC70, %edx
	movl	CORE_NO(%rip), %r8d
.L983:
	movl	$100, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	snprintf
	movl	$.LC66, %esi
	movq	%r12, %rdi
	call	open_gzfile
	movq	%rax, 32(%rsp)
	jmp	.L668
	.p2align 4,,10
	.p2align 3
.L985:
	testl	%ebp, %ebp
	jne	.L605
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC19, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	400(%rsp), %r13
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC20, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC68, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L981
.L608:
	cmpl	$3, %ebp
	jne	.L605
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC25, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	288(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC26, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC74, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L983
.L602:
	cmpl	$3, %ebp
	jne	.L605
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC25, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	64(%rsp), %r15
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC26, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC73, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L982
	.p2align 4,,10
	.p2align 3
.L965:
	movq	%r14, %rdi
	call	gzeof
	testl	%eax, %eax
	jne	.L979
	jmp	.L621
	.p2align 4,,10
	.p2align 3
.L626:
	movl	$.LC60, %edi
	call	puts
	movq	stdout(%rip), %rdi
	call	fflush
	xorl	%eax, %eax
#APP
# 1086 "add.c" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$1, %ebx
	call	limb_t_add_n
	jmp	.L655
	.p2align 4,,10
	.p2align 3
.L986:
	fstp	%st(0)
.L655:
	leaq	512(%rsp), %rsi
	xorl	%edi, %edi
	addq	%rbx, %rbx
	xorl	%r15d, %r15d
	call	getrusage
	fildq	512(%rsp)
	fmuls	.LC61(%rip)
	fildq	520(%rsp)
	faddp	%st, %st(1)
	fisttpq	8(%rsp)
	testq	%rbx, %rbx
	jle	.L657
	movq	%rbx, %rdi
	andl	$6, %edi
	je	.L654
	cmpq	$1, %rdi
	je	.L898
	cmpq	$2, %rdi
	je	.L899
	cmpq	$3, %rdi
	je	.L900
	cmpq	$4, %rdi
	je	.L901
	cmpq	$5, %rdi
	je	.L902
	cmpq	$6, %rdi
	je	.L903
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$1, %r15d
	call	limb_t_add_n
.L903:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n
.L902:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n
.L901:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n
.L900:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n
.L899:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n
.L898:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n
	cmpq	%r15, %rbx
	je	.L657
.L654:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$8, %r15
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	cmpq	%r15, %rbx
	jne	.L654
.L657:
	leaq	512(%rsp), %rsi
	xorl	%edi, %edi
	call	getrusage
	fildq	512(%rsp)
	flds	.LC61(%rip)
	fxch	%st(1)
	fmuls	.LC61(%rip)
	fildq	520(%rsp)
	faddp	%st, %st(1)
	fildq	8(%rsp)
	fsubrp	%st, %st(1)
	fisttpq	8(%rsp)
	movq	8(%rsp), %r8
	cmpq	$249999, %r8
	jle	.L986
	vxorpd	%xmm3, %xmm3, %xmm3
	movl	$.LC52, %edi
	fstpt	16(%rsp)
	vcvtsi2sdq	%r8, %xmm3, %xmm1
	vcvtsi2sdq	%rbx, %xmm3, %xmm4
	vdivsd	%xmm4, %xmm1, %xmm5
	vmovsd	%xmm5, 8(%rsp)
	call	puts
	movl	$.LC53, %edi
	movl	$1, %eax
	vmovsd	8(%rsp), %xmm0
	call	printf
	movl	$.LC55, %edi
	xorl	%eax, %eax
	vmovsd	.LC54(%rip), %xmm8
	vdivsd	8(%rsp), %xmm8, %xmm9
	vcvttsd2usi	%xmm9, %rsi
	movq	%rsi, %r15
	addq	$1, %rsi
	movq	%rsi, 8(%rsp)
	call	printf
	movq	stdout(%rip), %rdi
	call	fflush
	xorl	%edi, %edi
	leaq	512(%rsp), %rsi
	call	getrusage
	fildq	512(%rsp)
	fldt	16(%rsp)
	fmulp	%st, %st(1)
	fildq	520(%rsp)
	faddp	%st, %st(1)
	flds	.LC62(%rip)
	fxch	%st(1)
	fcomi	%st(1), %st
	jnb	.L658
	fstp	%st(1)
	fisttpq	16(%rsp)
.L659:
	xorl	%ebx, %ebx
	cmpq	$0, 8(%rsp)
	je	.L666
	movq	%r15, %r10
	addq	$1, %r10
	andl	$7, %r10d
	je	.L660
	cmpq	$1, %r10
	je	.L905
	cmpq	$2, %r10
	je	.L906
	cmpq	$3, %r10
	je	.L907
	cmpq	$4, %r10
	je	.L908
	cmpq	$5, %r10
	je	.L909
	cmpq	$6, %r10
	je	.L910
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$1, %ebx
	call	limb_t_add_n
.L910:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L909:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L908:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L907:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L906:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L905:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%rbx, %r11
	addq	$1, %rbx
	cmpq	%r11, %r15
	je	.L666
.L660:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	leaq	7(%rbx), %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movq	%rdx, 32(%rsp)
	movq	%r13, %rdx
	addq	$8, %rbx
	call	limb_t_add_n
	movq	32(%rsp), %rax
	cmpq	%rax, %r15
	jne	.L660
.L666:
	xorl	%edi, %edi
	leaq	512(%rsp), %rsi
	call	getrusage
	fildq	512(%rsp)
	fmuls	.LC61(%rip)
	movl	$.LC63, %edi
	fildq	520(%rsp)
	faddp	%st, %st(1)
	fstpt	32(%rsp)
	call	puts
	vxorpd	%xmm10, %xmm10, %xmm10
	movq	16(%rsp), %rbp
	vmovsd	.LC56(%rip), %xmm12
	vcvtsi2sdq	8(%rsp), %xmm10, %xmm11
	testq	%rbp, %rbp
	movq	%rbp, 8(%rsp)
	fildq	8(%rsp)
	vmulsd	%xmm11, %xmm12, %xmm13
	fldt	32(%rsp)
	jns	.L661
	fxch	%st(1)
	fadds	.LC64(%rip)
	fxch	%st(1)
.L661:
	fsubp	%st, %st(1)
	flds	.LC62(%rip)
	fxch	%st(1)
	fcomi	%st(1), %st
	jnb	.L662
	fstp	%st(1)
	fisttpq	8(%rsp)
	movq	8(%rsp), %r12
.L663:
	vxorpd	%xmm14, %xmm14, %xmm14
	vcvtusi2sdq	%r12, %xmm14, %xmm15
	vdivsd	%xmm15, %xmm13, %xmm6
	vcomisd	.LC38(%rip), %xmm6
	ja	.L676
	vmovsd	.LC38(%rip), %xmm9
	xorl	%esi, %esi
	vmovsd	.LC57(%rip), %xmm7
.L665:
	vmulsd	%xmm7, %xmm9, %xmm0
	leal	1(%rsi), %r13d
	movl	%r13d, %esi
	vcomisd	%xmm0, %xmm6
	ja	.L664
	vmulsd	%xmm7, %xmm0, %xmm2
	addl	$1, %esi
	vcomisd	%xmm2, %xmm6
	ja	.L664
	vmulsd	%xmm7, %xmm2, %xmm3
	leal	2(%r13), %esi
	vcomisd	%xmm3, %xmm6
	ja	.L664
	vmulsd	%xmm7, %xmm3, %xmm1
	leal	3(%r13), %esi
	vcomisd	%xmm1, %xmm6
	ja	.L664
	vmulsd	%xmm7, %xmm1, %xmm4
	leal	4(%r13), %esi
	vcomisd	%xmm4, %xmm6
	ja	.L664
	vmulsd	%xmm7, %xmm4, %xmm5
	leal	5(%r13), %esi
	vcomisd	%xmm5, %xmm6
	ja	.L664
	vmulsd	%xmm7, %xmm5, %xmm8
	leal	6(%r13), %esi
	vcomisd	%xmm8, %xmm6
	ja	.L664
	vmulsd	%xmm7, %xmm8, %xmm9
	leal	7(%r13), %esi
	vcomisd	%xmm9, %xmm6
	jbe	.L665
	.p2align 4
	.p2align 3
.L664:
	vmovapd	%xmm6, %xmm0
	movl	$.LC58, %edi
	movl	$1, %eax
	call	printf
	movq	%r14, %rdi
	call	gzclose
	movq	48(%rsp), %rdi
	call	gzclose
	jmp	.L979
	.p2align 4,,10
	.p2align 3
.L625:
	movl	$.LC59, %edi
	call	puts
	movq	stdout(%rip), %rdi
	call	fflush
	xorl	%eax, %eax
#APP
# 1047 "add.c" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$1, %ebx
	call	limb_t_add_n
	.p2align 4
	.p2align 3
.L646:
	leaq	512(%rsp), %rsi
	movl	$4, %edi
	addq	%rbx, %rbx
	xorl	%r15d, %r15d
	call	clock_gettime
	movq	512(%rsp), %r11
	movq	520(%rsp), %rcx
	movq	%r11, 48(%rsp)
	movq	%rcx, 8(%rsp)
	testq	%rbx, %rbx
	jle	.L645
	movq	%rbx, %rdx
	andl	$7, %edx
	je	.L644
	cmpq	$1, %rdx
	je	.L884
	cmpq	$2, %rdx
	je	.L885
	cmpq	$3, %rdx
	je	.L886
	cmpq	$4, %rdx
	je	.L887
	cmpq	$5, %rdx
	je	.L888
	cmpq	$6, %rdx
	je	.L889
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$1, %r15d
	call	limb_t_add_n
.L889:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n
.L888:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n
.L887:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n
.L886:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n
.L885:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n
.L884:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n
	cmpq	%rbx, %r15
	je	.L645
.L644:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$8, %r15
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	cmpq	%rbx, %r15
	jne	.L644
.L645:
	leaq	512(%rsp), %rsi
	movl	$4, %edi
	call	clock_gettime
	movq	48(%rsp), %rsi
	movq	8(%rsp), %r9
	movq	520(%rsp), %rdi
	movq	512(%rsp), %r8
	movq	%rdi, %r10
	subq	%rsi, %r8
	subq	%r9, %r10
	jns	.L643
	movq	8(%rsp), %rax
	leaq	1000000000(%rdi), %r10
	subq	$1, %r8
	subq	%rax, %r10
.L643:
	imulq	$1000000000, %r8, %r11
	addq	%r11, %r10
	cmpq	$249999999, %r10
	jle	.L646
	movabsq	$2361183241434822607, %rax
	vxorpd	%xmm6, %xmm6, %xmm6
	movl	$.LC52, %edi
	imulq	%r10
	sarq	$63, %r10
	vcvtsi2sdq	%rbx, %xmm6, %xmm0
	sarq	$7, %rdx
	subq	%r10, %rdx
	vcvtsi2sdq	%rdx, %xmm6, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm7
	vmovsd	%xmm7, 8(%rsp)
	call	puts
	movl	$.LC53, %edi
	movl	$1, %eax
	vmovsd	8(%rsp), %xmm0
	call	printf
	movl	$.LC55, %edi
	xorl	%eax, %eax
	vmovsd	.LC54(%rip), %xmm2
	vdivsd	8(%rsp), %xmm2, %xmm3
	vcvttsd2usi	%xmm3, %rbx
	leaq	1(%rbx), %r15
	movq	%rbx, 8(%rsp)
	xorl	%ebx, %ebx
	movq	%r15, %rsi
	call	printf
	movq	stdout(%rip), %rdi
	call	fflush
	movl	$4, %edi
	leaq	512(%rsp), %rsi
	call	clock_gettime
	movq	512(%rsp), %rcx
	movq	520(%rsp), %rdi
	movq	%rcx, 16(%rsp)
	movq	%rdi, 48(%rsp)
	testq	%r15, %r15
	je	.L650
	movq	%r15, %r8
	andl	$7, %r8d
	je	.L647
	cmpq	$1, %r8
	je	.L891
	cmpq	$2, %r8
	je	.L892
	cmpq	$3, %r8
	je	.L893
	cmpq	$4, %r8
	je	.L894
	cmpq	$5, %r8
	je	.L895
	cmpq	$6, %r8
	je	.L896
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$1, %ebx
	call	limb_t_add_n
.L896:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L895:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L894:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L893:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L892:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n
.L891:
	movq	%r12, %rsi
	movq	%r13, %rdx
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%rbx, %rsi
	addq	$1, %rbx
	cmpq	%rsi, 8(%rsp)
	je	.L650
.L647:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n
	leaq	7(%rbx), %r9
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movq	%r9, 56(%rsp)
	addq	$8, %rbx
	call	limb_t_add_n
	movq	56(%rsp), %r10
	cmpq	%r10, 8(%rsp)
	jne	.L647
.L650:
	leaq	512(%rsp), %rsi
	movl	$4, %edi
	call	clock_gettime
	movq	16(%rsp), %r13
	movq	48(%rsp), %r11
	movq	520(%rsp), %rbp
	movq	512(%rsp), %r12
	movq	%rbp, %rcx
	subq	%r13, %r12
	subq	%r11, %rcx
	jns	.L649
	movq	48(%rsp), %rax
	leaq	1000000000(%rbp), %rcx
	subq	$1, %r12
	subq	%rax, %rcx
.L649:
	imulq	$1000000000, %r12, %rdx
	vxorpd	%xmm4, %xmm4, %xmm4
	movabsq	$2361183241434822607, %rax
	vmovsd	.LC56(%rip), %xmm8
	vcvtsi2sdq	%r15, %xmm4, %xmm5
	addq	%rdx, %rcx
	imulq	%rcx
	sarq	$63, %rcx
	vmulsd	%xmm5, %xmm8, %xmm9
	sarq	$7, %rdx
	subq	%rcx, %rdx
	vcvtusi2sdq	%rdx, %xmm4, %xmm10
	vdivsd	%xmm10, %xmm9, %xmm11
	vcomisd	.LC38(%rip), %xmm11
	ja	.L673
	vmovsd	.LC38(%rip), %xmm2
	xorl	%esi, %esi
	vmovsd	.LC57(%rip), %xmm12
.L652:
	vmulsd	%xmm12, %xmm2, %xmm13
	leal	1(%rsi), %r15d
	movl	%r15d, %esi
	vcomisd	%xmm13, %xmm11
	ja	.L651
	vmulsd	%xmm12, %xmm13, %xmm14
	addl	$1, %esi
	vcomisd	%xmm14, %xmm11
	ja	.L651
	vmulsd	%xmm12, %xmm14, %xmm15
	leal	2(%r15), %esi
	vcomisd	%xmm15, %xmm11
	ja	.L651
	vmulsd	%xmm12, %xmm15, %xmm6
	leal	3(%r15), %esi
	vcomisd	%xmm6, %xmm11
	ja	.L651
	vmulsd	%xmm12, %xmm6, %xmm1
	leal	4(%r15), %esi
	vcomisd	%xmm1, %xmm11
	ja	.L651
	vmulsd	%xmm12, %xmm1, %xmm0
	leal	5(%r15), %esi
	vcomisd	%xmm0, %xmm11
	ja	.L651
	vmulsd	%xmm12, %xmm0, %xmm7
	leal	6(%r15), %esi
	vcomisd	%xmm7, %xmm11
	ja	.L651
	vmulsd	%xmm12, %xmm7, %xmm2
	leal	7(%r15), %esi
	vcomisd	%xmm2, %xmm11
	jbe	.L652
	.p2align 4
	.p2align 3
.L651:
	vmovapd	%xmm11, %xmm0
	movl	$.LC58, %edi
	movl	$1, %eax
	call	printf
	movq	%r14, %rdi
	call	gzclose
	movq	32(%rsp), %rdi
	call	gzclose
	jmp	.L979
.L612:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC21, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	400(%rsp), %r13
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC22, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC71, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L981
.L615:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC23, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	400(%rsp), %r13
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC24, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC76, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L981
.L601:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC23, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	64(%rsp), %r15
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC24, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC77, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L982
.L603:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC19, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	64(%rsp), %r15
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC20, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC65, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L982
.L609:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC19, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	288(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC20, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC67, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L983
.L607:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC23, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	288(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC24, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC75, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L983
.L662:
	fsubp	%st, %st(1)
	fisttpq	8(%rsp)
	movq	8(%rsp), %r12
	btcq	$63, %r12
	jmp	.L663
.L658:
	fsubp	%st, %st(1)
	fisttpq	16(%rsp)
	movq	16(%rsp), %r9
	btcq	$63, %r9
	movq	%r9, 16(%rsp)
	jmp	.L659
.L984:
	clflush	0(%rbp)
	clflush	(%r12)
	leaq	64(%rbp), %rax
	leaq	64(%r12), %rcx
	jmp	.L868
.L676:
	xorl	%esi, %esi
	jmp	.L664
.L673:
	xorl	%esi, %esi
	jmp	.L651
.L671:
	xorl	%esi, %esi
	jmp	.L636
.L600:
	movl	$.LC46, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L605:
	movl	$.LC27, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L618:
	movq	stderr(%rip), %rdi
	movq	%rbp, %rdx
	movl	$.LC31, %esi
	xorl	%eax, %eax
	call	fprintf
	movq	%r14, %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	run_benchmarking_test.cold, @function
run_benchmarking_test.cold:
.LFSB6845:
.L621:
	.cfi_def_cfa_offset 656080
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movl	$.LC29, %edi
	call	perror
	movq	%r14, %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6845:
	.text
	.size	run_benchmarking_test, .-run_benchmarking_test
	.section	.text.unlikely
	.size	run_benchmarking_test.cold, .-run_benchmarking_test.cold
.LCOLDE79:
	.text
.LHOTE79:
	.section	.rodata.str1.8
	.align 8
.LC80:
	.string	"Usage: %s <number of bits> <core number> <test-case number> <measure_type>\n"
	.align 8
.LC81:
	.string	"test-case number: 0 --> Random numbers"
	.align 8
.LC82:
	.string	"test-case number: 1 --> Random numbers with a < b"
	.align 8
.LC83:
	.string	"test-case number: 2 --> Random numbers with a > b"
	.align 8
.LC84:
	.string	"test-case number: 3 --> Random numbers with a = b"
	.section	.rodata.str1.1
.LC85:
	.string	"measure_type: 0 --> RDTSC"
.LC86:
	.string	"measure_type: 1 --> Timespec"
.LC87:
	.string	"measure_type: 2 --> RUSAGE"
.LC88:
	.string	"add.c"
.LC89:
	.string	"atoi(argv[1]) > 0"
	.section	.rodata.str1.8
	.align 8
.LC90:
	.string	"atoi(argv[2]) >= 0 && atoi(argv[2]) < sysconf(_SC_NPROCESSORS_ONLN)"
	.align 8
.LC91:
	.string	"atoi(argv[3]) >= 0 && atoi(argv[3]) < 4"
	.align 8
.LC92:
	.string	"atoi(argv[4]) >= 0 && atoi(argv[4]) < 3"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB6843:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	cmpl	$5, %edi
	je	.L988
	movq	(%rsi), %rsi
	movl	$.LC80, %edi
	xorl	%eax, %eax
	call	printf
	movl	$.LC81, %edi
	call	puts
	movl	$.LC82, %edi
	call	puts
	movl	$.LC83, %edi
	call	puts
	movl	$.LC84, %edi
	call	puts
	movl	$.LC85, %edi
	call	puts
	movl	$.LC86, %edi
	call	puts
	movl	$.LC87, %edi
	call	puts
	movl	$1, %eax
.L987:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L988:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	testl	%eax, %eax
	jle	.L998
	movq	8(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	movq	16(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	movl	%eax, NUM_BITS(%rip)
	call	strtol
	testl	%eax, %eax
	js	.L992
	movq	16(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	$84, %edi
	movq	%rax, %rbp
	call	sysconf
	movslq	%ebp, %rdx
	cmpq	%rax, %rdx
	jge	.L992
	movq	16(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	movq	24(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	movl	%eax, CORE_NO(%rip)
	call	strtol
	testl	%eax, %eax
	js	.L994
	movq	24(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	$3, %eax
	jg	.L994
	movq	24(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	movq	32(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	movl	%eax, %ebp
	call	strtol
	testl	%eax, %eax
	js	.L996
	movq	32(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	$2, %eax
	jg	.L996
	movq	32(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	%rax, %rbx
	xorl	%eax, %eax
	call	init_memory_pool
	movl	%ebx, %esi
	movl	%ebp, %edi
	call	run_benchmarking_test
	xorl	%eax, %eax
	call	destroy_memory_pool
	xorl	%eax, %eax
	jmp	.L987
.L998:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$575, %edx
	movl	$.LC88, %esi
	movl	$.LC89, %edi
	call	__assert_fail
.L992:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$578, %edx
	movl	$.LC88, %esi
	movl	$.LC90, %edi
	call	__assert_fail
.L994:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$581, %edx
	movl	$.LC88, %esi
	movl	$.LC91, %edi
	call	__assert_fail
.L996:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$584, %edx
	movl	$.LC88, %esi
	movl	$.LC92, %edi
	call	__assert_fail
	.cfi_endproc
.LFE6843:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 5
__PRETTY_FUNCTION__.0:
	.string	"main"
	.globl	NUM_BITS
	.bss
	.align 4
	.type	NUM_BITS, @object
	.size	NUM_BITS, 4
NUM_BITS:
	.zero	4
	.globl	CORE_NO
	.align 4
	.type	CORE_NO, @object
	.size	CORE_NO, 4
CORE_NO:
	.zero	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC38:
	.long	0
	.long	1079574528
	.align 8
.LC51:
	.long	1394455622
	.long	1060595063
	.align 8
.LC54:
	.long	0
	.long	1097011920
	.align 8
.LC56:
	.long	0
	.long	1093567616
	.align 8
.LC57:
	.long	-1717986918
	.long	1069128089
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC61:
	.long	1232348160
	.align 4
.LC62:
	.long	1593835520
	.align 4
.LC64:
	.long	1602224128
	.ident	"GCC: (GNU) 14.2.1 20250110 (Red Hat 14.2.1-7)"
	.section	.note.GNU-stack,"",@progbits
