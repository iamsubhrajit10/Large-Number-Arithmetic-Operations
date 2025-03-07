	.file	"add.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Error opening file %s: %s\n"
	.text
	.p2align 4
	.type	open_gzfile.part.0, @function
open_gzfile.part.0:
.LFB6839:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	__errno_location
	movl	(%rax), %edi
	call	strerror
	movq	stderr(%rip), %rdi
	movq	%rbx, %rdx
	movl	$.LC0, %esi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	fprintf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6839:
	.size	open_gzfile.part.0, .-open_gzfile.part.0
	.section	.rodata.str1.1
.LC1:
	.string	"/dev/urandom"
.LC2:
	.string	"Error opening /dev/urandom"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"Error reading from /dev/urandom"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB4:
	.text
.LHOTB4:
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
	movl	$.LC1, %edi
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
.LFSB6820:
.L7:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -16
	movl	$.LC2, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L8:
	movl	$.LC3, %edi
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
.LCOLDE4:
	.text
.LHOTE4:
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
.LFE6822:
	.size	trim_trailing_newline, .-trim_trailing_newline
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"The two sums are not equal, lengths are different"
	.align 8
.LC6:
	.string	"Length of result = %ld, length of result_gmp = %ld\n"
	.section	.rodata.str1.1
.LC7:
	.string	"result = %s\n result_gmp = %s\n"
.LC8:
	.string	"The two sums are not equal"
.LC9:
	.string	"Mismatch at index %ld\n"
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"result[%ld] = %c, result_gmp[%ld] = %c\n"
	.section	.rodata.str1.1
.LC11:
	.string	"result = %s\nresult_gmp = %s\n"
	.section	.rodata.str1.8
	.align 8
.LC12:
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
	jle	.L28
	call	__ctype_tolower_loc
	xorl	%r15d, %r15d
	movslq	%r12d, %rdi
	andl	$3, %r12d
	je	.L29
	cmpq	$1, %r12
	je	.L85
	cmpq	$2, %r12
	je	.L86
	movsbq	(%rbx), %rcx
	movq	(%rax), %rsi
	movl	$1, %r15d
	movl	(%rsi,%rcx,4), %r8d
	movb	%r8b, (%rbx)
	movsbq	0(%rbp), %r9
	movq	(%rax), %r10
	movl	(%r10,%r9,4), %r11d
	movb	%r11b, 0(%rbp)
.L86:
	movsbq	(%rbx,%r15), %r12
	movq	(%rax), %rdx
	movl	(%rdx,%r12,4), %ecx
	movb	%cl, (%rbx,%r15)
	movsbq	0(%rbp,%r15), %rsi
	movq	(%rax), %r8
	movl	(%r8,%rsi,4), %r9d
	movb	%r9b, 0(%rbp,%r15)
	addq	$1, %r15
.L85:
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
	je	.L28
.L29:
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
	jne	.L29
.L28:
	movq	%rbx, %rdi
	call	strlen
	movq	%rbp, %rdi
	movq	%rax, %r15
	call	strlen
	cmpq	%rax, %r15
	jne	.L30
	xorl	%r12d, %r12d
	testq	%r15, %r15
	je	.L32
	movq	%r15, %rax
	andl	$7, %eax
	je	.L31
	cmpq	$1, %rax
	je	.L88
	cmpq	$2, %rax
	je	.L89
	cmpq	$3, %rax
	je	.L90
	cmpq	$4, %rax
	je	.L91
	cmpq	$5, %rax
	je	.L92
	cmpq	$6, %rax
	je	.L93
	movzbl	0(%rbp), %edi
	cmpb	%dil, (%rbx)
	jne	.L106
	movl	$1, %r12d
.L93:
	movzbl	0(%rbp,%r12), %ecx
	cmpb	%cl, (%rbx,%r12)
	jne	.L106
	addq	$1, %r12
.L92:
	movzbl	0(%rbp,%r12), %r9d
	cmpb	%r9b, (%rbx,%r12)
	jne	.L106
	addq	$1, %r12
.L91:
	movzbl	0(%rbp,%r12), %r10d
	cmpb	%r10b, (%rbx,%r12)
	jne	.L106
	addq	$1, %r12
.L90:
	movzbl	0(%rbp,%r12), %r11d
	cmpb	%r11b, (%rbx,%r12)
	jne	.L106
	addq	$1, %r12
.L89:
	movzbl	0(%rbp,%r12), %edx
	cmpb	%dl, (%rbx,%r12)
	jne	.L106
	addq	$1, %r12
.L88:
	movzbl	0(%rbp,%r12), %esi
	cmpb	%sil, (%rbx,%r12)
	jne	.L106
	addq	$1, %r12
	cmpq	%r15, %r12
	je	.L32
.L31:
	movzbl	0(%rbp,%r12), %r8d
	cmpb	%r8b, (%rbx,%r12)
	jne	.L106
	leaq	1(%r12), %rax
	movzbl	0(%rbp,%rax), %edi
	movq	%rax, %r12
	cmpb	%dil, (%rbx,%rax)
	jne	.L106
	addq	$1, %r12
	movzbl	0(%rbp,%r12), %ecx
	cmpb	%cl, (%rbx,%r12)
	jne	.L106
	movzbl	2(%rbp,%rax), %r9d
	leaq	2(%rax), %r12
	cmpb	%r9b, 2(%rbx,%rax)
	jne	.L106
	movzbl	3(%rbp,%rax), %r10d
	leaq	3(%rax), %r12
	cmpb	%r10b, 3(%rbx,%rax)
	jne	.L106
	movzbl	4(%rbp,%rax), %r11d
	leaq	4(%rax), %r12
	cmpb	%r11b, 4(%rbx,%rax)
	jne	.L106
	movzbl	5(%rbp,%rax), %edx
	leaq	5(%rax), %r12
	cmpb	%dl, 5(%rbx,%rax)
	jne	.L106
	movzbl	6(%rbp,%rax), %esi
	leaq	6(%rax), %r12
	cmpb	%sil, 6(%rbx,%rax)
	jne	.L106
	leaq	7(%rax), %r12
	cmpq	%r15, %r12
	jne	.L31
.L32:
	cmpb	$45, %r13b
	movl	$1, %eax
	sete	%r13b
	cmpb	$45, %r14b
	sete	%r14b
	cmpb	%r14b, %r13b
	je	.L25
	movl	$.LC12, %edi
	call	puts
	.p2align 4
	.p2align 3
.L33:
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
.L106:
	.cfi_restore_state
	movl	$.LC8, %edi
	call	puts
	movq	%r12, %rsi
	movl	$.LC9, %edi
	xorl	%eax, %eax
	call	printf
	movsbl	(%rbx,%r12), %edx
	movq	%r12, %rsi
	movq	%r12, %rcx
	movsbl	0(%rbp,%r12), %r8d
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	printf
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movl	$.LC11, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L30:
	movl	$.LC5, %edi
	call	puts
	movq	%rbp, %rdi
	call	strlen
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	strlen
	movq	%r15, %rdx
	movl	$.LC6, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	printf
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movl	$.LC7, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L33
	.cfi_endproc
.LFE6823:
	.size	check_result, .-check_result
	.section	.rodata.str1.8
	.align 8
.LC13:
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
	movl	$.LC13, %esi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	fprintf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6824:
	.size	create_directory, .-create_directory
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
	je	.L134
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L134:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	open_gzfile.part.0
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
.LFSB6826:
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
.LFB6833:
	.cfi_startproc
	movq	(%rsi), %rsi
	movq	%rdi, %rax
	movq	(%rdx), %rdi
	movabsq	$4503599627370495, %rdx
	movq	(%rax), %rcx
	vpbroadcastq	%rdx, %ymm1
	movq	32(%rdi), %r9
	addq	32(%rsi), %r9
	movq	%r9, %r8
	shrq	$52, %r9
	andq	%rdx, %r8
	sall	$4, %r9d
	movq	%r8, 32(%rcx)
	vmovdqa	(%rdi), %ymm0
	vpaddq	(%rsi), %ymm0, %ymm4
	vpcmpuq	$6, %ymm1, %ymm4, %k0
	kmovw	%k0, %r10d
	addb	%r10b, %r9b
	je	.L141
	shrb	%r9b
	movl	$1, %r11d
	vpandq	%ymm1, %ymm4, %ymm3
	kmovw	%r9d, %k1
	vpbroadcastq	%r11, %ymm2{%k1}{z}
	vpaddq	%ymm2, %ymm3, %ymm4
.L141:
	vmovdqa	%ymm4, (%rcx)
	vzeroupper
	ret
	.cfi_endproc
.LFE6833:
	.size	limb_t_add_n_256, .-limb_t_add_n_256
	.p2align 4
	.globl	limb_t_add_n_512
	.type	limb_t_add_n_512, @function
limb_t_add_n_512:
.LFB6834:
	.cfi_startproc
	movabsq	$4503599627370495, %r8
	movq	(%rdx), %rcx
	movq	(%rsi), %rax
	vpbroadcastq	%r8, %xmm1
	vmovdqa	64(%rcx), %xmm0
	vpaddq	64(%rax), %xmm0, %xmm5
	vpcmpuq	$6, %xmm1, %xmm5, %k0
	kmovw	%k0, %eax
	movl	%eax, %ecx
	shrb	%cl
	je	.L146
	movl	$1, %r9d
	vpandq	%xmm1, %xmm5, %xmm3
	kmovw	%ecx, %k1
	vpbroadcastq	%r9, %xmm2{%k1}{z}
	vpaddq	%xmm2, %xmm3, %xmm4
	vpandq	%xmm1, %xmm4, %xmm5
.L146:
	movabsq	$4503599627370495, %r11
	movq	(%rdi), %r10
	sall	$7, %eax
	vpbroadcastq	%r11, %zmm7
	vmovdqa	%xmm5, 64(%r10)
	movq	(%rsi), %rsi
	movq	(%rdx), %rdx
	vmovdqa64	(%rsi), %zmm6
	vpaddq	(%rdx), %zmm6, %zmm12
	vpcmpuq	$6, %zmm7, %zmm12, %k3
	kmovw	%k3, %r8d
	shrb	%r8b
	orb	%r8b, %al
	je	.L147
	vmovdqa32	.LC19(%rip), %zmm9
	movl	$1, %ecx
	kmovw	%eax, %k2
	vpbroadcastq	%rcx, %zmm8{%k2}{z}
	vpandd	%zmm9, %zmm12, %zmm10
	vpaddq	%zmm10, %zmm8, %zmm11
	vpandd	%zmm11, %zmm9, %zmm12
.L147:
	movq	(%rdi), %rdi
	vmovdqa64	%zmm12, (%rdi)
	vzeroupper
	ret
	.cfi_endproc
.LFE6834:
	.size	limb_t_add_n_512, .-limb_t_add_n_512
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"Trying to run correctness test"
	.section	.rodata.str1.1
.LC21:
	.string	"experiments/results"
	.section	.rodata.str1.8
	.align 8
.LC22:
	.string	"Running random test cases for bit-size %d on core %d\n"
	.align 8
.LC23:
	.string	"../test/cases/%d/random.csv.gz"
	.align 8
.LC24:
	.string	"Running equal test cases for bit-size %d on core %d\n"
	.section	.rodata.str1.1
.LC25:
	.string	"../test/cases/%d/equal.csv.gz"
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"Running greater test cases for bit-size %d on core %d\n"
	.align 8
.LC27:
	.string	"../test/cases/%d/greater.csv.gz"
	.align 8
.LC28:
	.string	"Running smaller test cases for bit-size %d on core %d\n"
	.align 8
.LC29:
	.string	"../test/cases/%d/smaller.csv.gz"
	.section	.rodata.str1.1
.LC30:
	.string	"Invalid test case"
.LC31:
	.string	"rb"
.LC32:
	.string	"Error reading line"
.LC33:
	.string	","
.LC34:
	.string	"Error parsing line: %s\n"
	.section	.rodata.str1.8
	.align 8
.LC35:
	.string	"Test case failed, at iteration %d\n"
	.align 8
.LC36:
	.string	"Random test cases passed for bit-size %d\n"
	.align 8
.LC37:
	.string	"Equal test cases passed for bit-size %d\n"
	.align 8
.LC38:
	.string	"Greater test cases passed for bit-size %d\n"
	.align 8
.LC39:
	.string	"Smaller test cases passed for bit-size %d\n"
	.section	.text.unlikely
.LCOLDB40:
	.text
.LHOTB40:
	.p2align 4
	.globl	run_correctness_test
	.type	run_correctness_test, @function
run_correctness_test:
.LFB6836:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edi, %r14d
	movl	$.LC20, %edi
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
	movl	$.LC21, %edi
	call	create_directory
	cmpl	$2, %r14d
	je	.L155
	jg	.L156
	testl	%r14d, %r14d
	je	.L157
	cmpl	$1, %r14d
	jne	.L159
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC24, %edi
	xorl	%eax, %eax
	leaq	32(%rsp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC25, %edx
	movl	$100, %esi
	call	snprintf
.L161:
	movl	$.LC31, %esi
	movq	%rbx, %rdi
	call	gzopen
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L278
	movq	%rax, %rdi
	call	skip_first_line
	movl	$0, 4(%rsp)
	movq	%r15, 16(%rsp)
	movl	%r14d, 28(%rsp)
.L179:
	movq	16(%rsp), %rdi
	movl	$655360, %edx
	leaq	144(%rsp), %rsi
	call	gzgets
	testq	%rax, %rax
	je	.L279
	movl	$.LC33, %esi
	leaq	144(%rsp), %rdi
	call	strtok
	xorl	%edi, %edi
	movl	$.LC33, %esi
	movq	%rax, %r12
	call	strtok
	xorl	%edi, %edi
	movl	$.LC33, %esi
	movq	%rax, %rbp
	call	strtok
	testq	%r12, %r12
	movq	%rax, %r15
	sete	%al
	testq	%rbp, %rbp
	sete	%dl
	orb	%dl, %al
	jne	.L186
	testq	%r15, %r15
	je	.L186
	movq	%r12, %rdi
	call	limb_set_str
	movq	%rbp, %rdi
	movq	%rax, %r14
	call	limb_set_str
	movq	%r14, %rdi
	movq	%rax, %rsi
	movq	%rax, %r12
	call	limb_t_adjust_limb_sizes
	movslq	16(%r14), %rdi
	call	limb_t_alloc
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%rax, %r13
	movq	%rax, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdi
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
	jle	.L173
	call	__ctype_tolower_loc
	xorl	%r8d, %r8d
	leal	-1(%rbx), %r10d
	andl	$3, %ebx
	je	.L172
	cmpq	$1, %rbx
	je	.L235
	cmpq	$2, %rbx
	je	.L236
	movsbq	(%r15), %r11
	movq	(%rax), %rdx
	movl	$1, %r8d
	movl	(%rdx,%r11,4), %ebx
	movb	%bl, (%r15)
	movsbq	0(%rbp), %rsi
	movq	(%rax), %rcx
	movl	(%rcx,%rsi,4), %edi
	movb	%dil, 0(%rbp)
.L236:
	movsbq	(%r15,%r8), %r9
	movq	(%rax), %r11
	movl	(%r11,%r9,4), %edx
	movb	%dl, (%r15,%r8)
	movsbq	0(%rbp,%r8), %rbx
	movq	(%rax), %rsi
	movl	(%rsi,%rbx,4), %ecx
	movb	%cl, 0(%rbp,%r8)
	addq	$1, %r8
.L235:
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
	je	.L173
.L172:
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
	jne	.L172
.L173:
	movq	%r15, %rdi
	call	strlen
	movq	%rbp, %rdi
	movq	%rax, 8(%rsp)
	call	strlen
	movq	8(%rsp), %r10
	cmpq	%rax, %r10
	jne	.L280
	xorl	%ebx, %ebx
	testq	%r10, %r10
	je	.L175
	movq	%r10, %r8
	andl	$7, %r8d
	je	.L174
	cmpq	$1, %r8
	je	.L238
	cmpq	$2, %r8
	je	.L239
	cmpq	$3, %r8
	je	.L240
	cmpq	$4, %r8
	je	.L241
	cmpq	$5, %r8
	je	.L242
	cmpq	$6, %r8
	je	.L243
	movzbl	0(%rbp), %edi
	cmpb	%dil, (%r15)
	jne	.L274
	movl	$1, %ebx
.L243:
	movzbl	0(%rbp,%rbx), %esi
	cmpb	%sil, (%r15,%rbx)
	jne	.L274
	addq	$1, %rbx
.L242:
	movzbl	0(%rbp,%rbx), %ecx
	cmpb	%cl, (%r15,%rbx)
	jne	.L274
	addq	$1, %rbx
.L241:
	movzbl	0(%rbp,%rbx), %r9d
	cmpb	%r9b, (%r15,%rbx)
	jne	.L274
	addq	$1, %rbx
.L240:
	movzbl	0(%rbp,%rbx), %r11d
	cmpb	%r11b, (%r15,%rbx)
	jne	.L274
	addq	$1, %rbx
.L239:
	movzbl	0(%rbp,%rbx), %edx
	cmpb	%dl, (%r15,%rbx)
	jne	.L274
	addq	$1, %rbx
.L238:
	movzbl	0(%rbp,%rbx), %eax
	cmpb	%al, (%r15,%rbx)
	jne	.L274
	addq	$1, %rbx
	cmpq	%rbx, %r10
	je	.L175
.L174:
	movzbl	0(%rbp,%rbx), %r8d
	cmpb	%r8b, (%r15,%rbx)
	jne	.L274
	leaq	1(%rbx), %rsi
	movzbl	0(%rbp,%rsi), %edi
	movq	%rsi, %rbx
	cmpb	%dil, (%r15,%rsi)
	jne	.L274
	addq	$1, %rbx
	movzbl	0(%rbp,%rbx), %ecx
	cmpb	%cl, (%r15,%rbx)
	jne	.L274
	movzbl	2(%rbp,%rsi), %r9d
	leaq	2(%rsi), %rbx
	cmpb	%r9b, 2(%r15,%rsi)
	jne	.L274
	movzbl	3(%rbp,%rsi), %r11d
	leaq	3(%rsi), %rbx
	cmpb	%r11b, 3(%r15,%rsi)
	jne	.L274
	movzbl	4(%rbp,%rsi), %edx
	leaq	4(%rsi), %rbx
	cmpb	%dl, 4(%r15,%rsi)
	jne	.L274
	movzbl	5(%rbp,%rsi), %eax
	leaq	5(%rsi), %rbx
	cmpb	%al, 5(%r15,%rsi)
	jne	.L274
	movzbl	6(%rbp,%rsi), %r8d
	leaq	6(%rsi), %rbx
	cmpb	%r8b, 6(%r15,%rsi)
	jne	.L274
	leaq	7(%rsi), %rbx
	cmpq	%rbx, %r10
	jne	.L174
.L175:
	cmpb	$45, 26(%rsp)
	sete	%r15b
	cmpb	$45, 27(%rsp)
	sete	%bpl
	cmpb	%bpl, %r15b
	jne	.L281
	movq	%r14, %rdi
	call	limb_t_free
	movq	%r12, %rdi
	call	limb_t_free
	movq	%r13, %rdi
	call	limb_t_free
	addl	$1, 4(%rsp)
	movl	4(%rsp), %r14d
	cmpl	$100000, %r14d
	jne	.L179
	movq	16(%rsp), %r12
	movl	28(%rsp), %r13d
.L180:
	movl	NUM_BITS(%rip), %esi
	cmpl	$2, %r13d
	je	.L181
	cmpl	$3, %r13d
	je	.L182
	cmpl	$1, %r13d
	je	.L183
	movl	$.LC36, %edi
	xorl	%eax, %eax
	call	printf
.L184:
	movq	%r12, %rdi
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
.L157:
	.cfi_restore_state
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC22, %edi
	xorl	%eax, %eax
	leaq	32(%rsp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC23, %edx
	movl	$100, %esi
	call	snprintf
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L280:
	movl	$.LC5, %edi
	call	puts
	movq	%rbp, %rdi
	call	strlen
	movq	%r15, %rdi
	movq	%rax, %rbx
	call	strlen
	movq	%rbx, %rdx
	movl	$.LC6, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	printf
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movl	$.LC7, %edi
	xorl	%eax, %eax
	call	printf
.L177:
	movl	4(%rsp), %esi
	movl	$.LC35, %edi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
	.p2align 4,,10
	.p2align 3
.L274:
	movl	$.LC8, %edi
	call	puts
	movq	%rbx, %rsi
	movl	$.LC9, %edi
	xorl	%eax, %eax
	call	printf
	movsbl	(%r15,%rbx), %edx
	movq	%rbx, %rsi
	movq	%rbx, %rcx
	movsbl	0(%rbp,%rbx), %r8d
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	printf
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movl	$.LC11, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L177
	.p2align 4,,10
	.p2align 3
.L156:
	cmpl	$3, %r14d
	jne	.L159
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC28, %edi
	xorl	%eax, %eax
	leaq	32(%rsp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC29, %edx
	movl	$100, %esi
	call	snprintf
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L155:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC26, %edi
	xorl	%eax, %eax
	leaq	32(%rsp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC27, %edx
	movl	$100, %esi
	call	snprintf
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L281:
	movl	$.LC12, %edi
	call	puts
	jmp	.L177
.L279:
	movq	16(%rsp), %r12
	movl	28(%rsp), %r13d
	movq	%r12, %rdi
	call	gzeof
	testl	%eax, %eax
	jne	.L180
	jmp	.L254
	.p2align 4,,10
	.p2align 3
.L183:
	movl	$.LC37, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L184
.L182:
	movl	$.LC39, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L184
.L181:
	movl	$.LC38, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L184
.L186:
	movq	16(%rsp), %r13
	movq	stderr(%rip), %rdi
	movl	$.LC34, %esi
	xorl	%eax, %eax
	leaq	144(%rsp), %rdx
	call	fprintf
	movq	%r13, %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
.L159:
	movl	$.LC30, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L278:
	movq	%rbx, %rdi
	call	open_gzfile.part.0
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	run_correctness_test.cold, @function
run_correctness_test.cold:
.LFSB6836:
.L254:
	.cfi_def_cfa_offset 655568
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movl	$.LC32, %edi
	call	perror
	movq	%r12, %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6836:
	.text
	.size	run_correctness_test, .-run_correctness_test
	.section	.text.unlikely
	.size	run_correctness_test.cold, .-run_correctness_test.cold
.LCOLDE40:
	.text
.LHOTE40:
	.section	.rodata.str1.8
	.align 8
.LC42:
	.string	"Trying to run benchmarking test"
	.align 8
.LC43:
	.string	"Running the tests with RDTSC measurements"
	.align 8
.LC44:
	.string	"experiments/results/rdtsc_measurements"
	.align 8
.LC45:
	.string	"Running the tests with timespec measurements"
	.align 8
.LC46:
	.string	"experiments/results/timespec_measurements"
	.align 8
.LC47:
	.string	"Running the tests with rusage measurements"
	.align 8
.LC48:
	.string	"experiments/results/cputime_measurements"
	.section	.rodata.str1.1
.LC49:
	.string	"Invalid measure type"
.LC50:
	.string	"Running %d iterations...\n"
	.section	.rodata.str1.8
	.align 8
.LC51:
	.string	"Iteration %d, reading test case %d\n"
	.section	.rodata.str1.1
.LC52:
	.string	"Starting addition"
	.section	.rodata.str1.8
	.align 8
.LC53:
	.string	"Calibrating CPU speed using RDTSC..."
	.section	.rodata.str1.1
.LC55:
	.string	"done"
	.section	.rodata.str1.8
	.align 8
.LC56:
	.string	"Calibrated time: %f microseconds\n"
	.section	.rodata.str1.1
.LC58:
	.string	"Adding %d times\n"
	.section	.rodata.str1.8
	.align 8
.LC61:
	.string	"RESULT: %.*f operations per second\n"
	.align 8
.LC62:
	.string	"Calibrating CPU speed using timespec..."
	.align 8
.LC63:
	.string	"Calibrating CPU speed using rusage..."
	.section	.rodata.str1.1
.LC66:
	.string	"done!"
	.section	.rodata.str1.8
	.align 8
.LC68:
	.string	"experiments/results/cputime_measurements/random_%d_%d.csv.gz"
	.section	.rodata.str1.1
.LC69:
	.string	"wb"
	.section	.rodata.str1.8
	.align 8
.LC70:
	.string	"experiments/results/rdtsc_measurements/random_%d_%d.csv.gz"
	.align 8
.LC71:
	.string	"experiments/results/timespec_measurements/random_%d_%d.csv.gz"
	.align 8
.LC72:
	.string	"experiments/results/cputime_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC73:
	.string	"experiments/results/rdtsc_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC74:
	.string	"experiments/results/timespec_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC75:
	.string	"experiments/results/rdtsc_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC76:
	.string	"experiments/results/timespec_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC77:
	.string	"experiments/results/cputime_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC78:
	.string	"experiments/results/rdtsc_measurements/greater_%d_%d.csv.gz"
	.align 8
.LC79:
	.string	"experiments/results/timespec_measurements/greater_%d_%d.csv.gz"
	.align 8
.LC80:
	.string	"experiments/results/cputime_measurements/greater_%d_%d.csv.gz"
	.section	.text.unlikely
.LCOLDB82:
	.text
.LHOTB82:
	.p2align 4
	.globl	run_benchmarking_test
	.type	run_benchmarking_test, @function
run_benchmarking_test:
.LFB6837:
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
	movl	$.LC42, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebx
	subq	$656008, %rsp
	.cfi_def_cfa_offset 656064
	call	puts
	movl	$.LC21, %edi
	call	create_directory
	cmpl	$1, %ebx
	je	.L283
	cmpl	$2, %ebx
	je	.L284
	testl	%ebx, %ebx
	jne	.L285
	movl	$.LC43, %edi
	call	puts
	movl	$.LC44, %edi
	call	create_directory
	cmpl	$2, %ebp
	je	.L286
	jg	.L287
	testl	%ebp, %ebp
	je	.L288
	cmpl	$1, %ebp
	jne	.L290
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC24, %edi
	xorl	%eax, %eax
	leaq	160(%rsp), %r13
	leaq	48(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r13, %rdi
	xorl	%eax, %eax
	movl	$.LC25, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC73, %edx
	movl	CORE_NO(%rip), %r8d
.L712:
	movl	$100, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	snprintf
	movl	$.LC69, %esi
	movq	%r12, %rdi
	call	gzopen
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L355
.L356:
	movl	$.LC31, %esi
	movq	%r13, %rdi
	call	gzopen
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L723
	movq	%rax, %rdi
	xorl	%r13d, %r13d
	leaq	640(%rsp), %rbp
	call	skip_first_line
	xorl	%eax, %eax
	call	generate_seed
	movl	%eax, %edi
	call	srand
	movl	$1, %esi
	movl	$.LC50, %edi
	xorl	%eax, %eax
	call	printf
	call	rand
	movl	$.LC51, %edi
	movslq	%eax, %rdx
	imulq	$351843721, %rdx, %rcx
	movl	%edx, %eax
	movq	%rdx, %r15
	sarl	$31, %eax
	sarq	$45, %rcx
	subl	%eax, %ecx
	xorl	%eax, %eax
	imull	$100000, %ecx, %esi
	subl	%esi, %r15d
	xorl	%esi, %esi
	movl	%r15d, %edx
	call	printf
	movq	%r14, %rdi
	call	gzrewind
	movq	%r14, %rdi
	call	skip_first_line
	testl	%r15d, %r15d
	jle	.L309
	movl	%r15d, %edi
	andl	$3, %edi
	je	.L303
	cmpl	$1, %edi
	je	.L574
	cmpl	$2, %edi
	je	.L575
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
	je	.L691
.L575:
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
	je	.L691
.L574:
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%rbp, %rdi
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L691
	addl	$1, %r13d
	cmpl	%r13d, %r15d
	je	.L309
.L303:
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%rbp, %rdi
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L691
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%rbp, %rdi
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L691
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%rbp, %rdi
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L691
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%rbp, %rdi
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L691
	addl	$4, %r13d
	cmpl	%r13d, %r15d
	jne	.L303
.L309:
	movl	$.LC33, %esi
	movq	%rbp, %rdi
	call	strtok
	xorl	%edi, %edi
	movl	$.LC33, %esi
	movq	%rax, %r15
	call	strtok
	xorl	%edi, %edi
	movl	$.LC33, %esi
	movq	%rax, %r12
	call	strtok
	testq	%r15, %r15
	sete	%r8b
	testq	%r12, %r12
	sete	%r9b
	orb	%r9b, %r8b
	jne	.L304
	testq	%rax, %rax
	je	.L304
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
	movl	$.LC52, %edi
	movq	%rax, %r13
	call	puts
	testl	%r15d, %r15d
	jle	.L315
	leal	-1(%r15), %r10d
	movq	%rbp, %rax
	movq	%r12, %rcx
	shrl	$6, %r10d
	salq	$6, %r10
	leaq	64(%rbp,%r10), %r11
	shrq	$6, %r10
	addq	$1, %r10
	andl	$7, %r10d
	je	.L314
	cmpq	$1, %r10
	je	.L576
	cmpq	$2, %r10
	je	.L577
	cmpq	$3, %r10
	je	.L578
	cmpq	$4, %r10
	je	.L579
	cmpq	$5, %r10
	je	.L580
	cmpq	$6, %r10
	jne	.L724
.L581:
	clflush	(%rax)
	clflush	(%rcx)
	addq	$64, %rax
	addq	$64, %rcx
.L580:
	clflush	(%rax)
	clflush	(%rcx)
	addq	$64, %rax
	addq	$64, %rcx
.L579:
	clflush	(%rax)
	clflush	(%rcx)
	addq	$64, %rax
	addq	$64, %rcx
.L578:
	clflush	(%rax)
	clflush	(%rcx)
	addq	$64, %rax
	addq	$64, %rcx
.L577:
	clflush	(%rax)
	clflush	(%rcx)
	addq	$64, %rax
	addq	$64, %rcx
.L576:
	clflush	(%rax)
	clflush	(%rcx)
	addq	$64, %rax
	addq	$64, %rcx
	cmpq	%rax, %r11
	je	.L315
.L314:
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
	cmpq	%rax, %r11
	jne	.L314
.L315:
	mfence
	cmpl	$1, %ebx
	je	.L311
	cmpl	$2, %ebx
	je	.L312
	movl	$.LC53, %edi
	call	puts
	movq	stdout(%rip), %rdi
	call	fflush
	xorl	%eax, %eax
#APP
# 664 "add.c" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$1, %r15d
	call	limb_t_add_n_512
	.p2align 4
	.p2align 3
.L317:
	addq	%r15, %r15
#APP
# 232 "../myutils.h" 1
	CPUID
	RDTSC
	mov %edx, %r10d
	mov %eax, %r11d
	
# 0 "" 2
#NO_APP
	salq	$32, %r10
	movl	%r11d, %edx
	xorl	%ebx, %ebx
	orq	%rdx, %r10
	movq	%r10, 8(%rsp)
	testq	%r15, %r15
	jle	.L320
	movq	%r15, %rsi
	andl	$7, %esi
	je	.L319
	cmpq	$1, %rsi
	je	.L583
	cmpq	$2, %rsi
	je	.L584
	cmpq	$3, %rsi
	je	.L585
	cmpq	$4, %rsi
	je	.L586
	cmpq	$5, %rsi
	je	.L587
	cmpq	$6, %rsi
	je	.L588
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$1, %ebx
	call	limb_t_add_n_512
.L588:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n_512
.L587:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n_512
.L586:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n_512
.L585:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n_512
.L584:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n_512
.L583:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	limb_t_add_n_512
	cmpq	%r15, %rbx
	je	.L320
.L319:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$8, %rbx
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	cmpq	%r15, %rbx
	jne	.L319
.L320:
#APP
# 245 "../myutils.h" 1
	RDTSCP
	mov %edx, %r8d
	mov %eax, %edi
	CPUID
	
# 0 "" 2
#NO_APP
	movq	%r8, %r9
	movq	8(%rsp), %rax
	movl	%edi, %ecx
	salq	$32, %r9
	orq	%rcx, %r9
	subq	%rax, %r9
	cmpq	$699999999, %r9
	jle	.L317
	vxorpd	%xmm10, %xmm10, %xmm10
	movl	$.LC55, %edi
	vcvtsi2sdq	%r9, %xmm10, %xmm11
	vmulsd	.LC54(%rip), %xmm11, %xmm12
	vcvtsi2sdq	%r15, %xmm10, %xmm13
	vcvttsd2siq	%xmm12, %r10
	vcvtsi2sdq	%r10, %xmm10, %xmm1
	vdivsd	%xmm13, %xmm1, %xmm14
	vmovsd	%xmm14, 8(%rsp)
	call	puts
	movl	$.LC56, %edi
	movl	$1, %eax
	vmovsd	8(%rsp), %xmm0
	call	printf
	movl	$.LC58, %edi
	xorl	%eax, %eax
	vmovsd	.LC57(%rip), %xmm15
	vdivsd	8(%rsp), %xmm15, %xmm6
	vcvttsd2usi	%xmm6, %r15
	leal	1(%r15), %r15d
	movl	%r15d, %esi
	call	printf
	movq	stdout(%rip), %rdi
	call	fflush
#APP
# 232 "../myutils.h" 1
	CPUID
	RDTSC
	mov %edx, %r11d
	mov %eax, %esi
	
# 0 "" 2
#NO_APP
	salq	$32, %r11
	movl	%esi, %edx
	xorl	%ebx, %ebx
	orq	%rdx, %r11
	movq	%r11, 8(%rsp)
	testl	%r15d, %r15d
	jle	.L324
	movl	%r15d, %r8d
	andl	$7, %r8d
	je	.L321
	cmpl	$1, %r8d
	je	.L590
	cmpl	$2, %r8d
	je	.L591
	cmpl	$3, %r8d
	je	.L592
	cmpl	$4, %r8d
	je	.L593
	cmpl	$5, %r8d
	je	.L594
	cmpl	$6, %r8d
	je	.L595
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$1, %ebx
	call	limb_t_add_n_512
.L595:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	limb_t_add_n_512
.L594:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	limb_t_add_n_512
.L593:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	limb_t_add_n_512
.L592:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	limb_t_add_n_512
.L591:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	limb_t_add_n_512
.L590:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	limb_t_add_n_512
	cmpl	%ebx, %r15d
	je	.L324
.L321:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$8, %ebx
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	cmpl	%ebx, %r15d
	jne	.L321
.L324:
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
	movq	8(%rsp), %rdi
	movl	%r12d, %r13d
	vcvtsi2sdl	%r15d, %xmm7, %xmm0
	orq	%r13, %rbp
	vmovsd	.LC59(%rip), %xmm2
	subq	%rdi, %rbp
	vcvtusi2sdq	%rbp, %xmm7, %xmm4
	vmulsd	.LC54(%rip), %xmm4, %xmm5
	vmulsd	%xmm0, %xmm2, %xmm3
	vdivsd	%xmm5, %xmm3, %xmm8
	vcomisd	.LC41(%rip), %xmm8
	ja	.L361
	vmovsd	.LC41(%rip), %xmm6
	xorl	%esi, %esi
	vmovsd	.LC60(%rip), %xmm9
.L323:
	vmulsd	%xmm9, %xmm6, %xmm10
	leal	1(%rsi), %r9d
	movl	%r9d, %esi
	vcomisd	%xmm10, %xmm8
	ja	.L322
	vmulsd	%xmm9, %xmm10, %xmm11
	addl	$1, %esi
	vcomisd	%xmm11, %xmm8
	ja	.L322
	vmulsd	%xmm9, %xmm11, %xmm12
	leal	2(%r9), %esi
	vcomisd	%xmm12, %xmm8
	ja	.L322
	vmulsd	%xmm9, %xmm12, %xmm1
	leal	3(%r9), %esi
	vcomisd	%xmm1, %xmm8
	ja	.L322
	vmulsd	%xmm9, %xmm1, %xmm13
	leal	4(%r9), %esi
	vcomisd	%xmm13, %xmm8
	ja	.L322
	vmulsd	%xmm9, %xmm13, %xmm14
	leal	5(%r9), %esi
	vcomisd	%xmm14, %xmm8
	ja	.L322
	vmulsd	%xmm9, %xmm14, %xmm15
	leal	6(%r9), %esi
	vcomisd	%xmm15, %xmm8
	ja	.L322
	vmulsd	%xmm9, %xmm15, %xmm6
	leal	7(%r9), %esi
	vcomisd	%xmm6, %xmm8
	jbe	.L323
	.p2align 4
	.p2align 3
.L322:
	vmovapd	%xmm8, %xmm0
	movl	$.LC61, %edi
	movl	$1, %eax
	call	printf
	movq	%r14, %rdi
	call	gzclose
	movq	16(%rsp), %rdi
	call	gzclose
.L706:
	addq	$656008, %rsp
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
.L284:
	.cfi_restore_state
	movl	$.LC47, %edi
	call	puts
	movl	$.LC48, %edi
	call	create_directory
	cmpl	$1, %ebp
	je	.L297
	jle	.L725
	cmpl	$2, %ebp
	je	.L300
	cmpl	$3, %ebp
	jne	.L290
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC28, %edi
	xorl	%eax, %eax
	leaq	160(%rsp), %r13
	leaq	384(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r13, %rdi
	xorl	%eax, %eax
	movl	$.LC29, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC77, %edx
	movl	CORE_NO(%rip), %r8d
.L722:
	movl	$100, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	snprintf
	movl	$.LC69, %esi
	movq	%r12, %rdi
	call	gzopen
	movq	%rax, 32(%rsp)
	testq	%rax, %rax
	jne	.L356
.L355:
	movq	%r12, %rdi
	call	open_gzfile.part.0
	.p2align 4,,10
	.p2align 3
.L283:
	movl	$.LC45, %edi
	call	puts
	movl	$.LC46, %edi
	call	create_directory
	cmpl	$2, %ebp
	je	.L292
	jg	.L293
	testl	%ebp, %ebp
	je	.L294
	cmpl	$1, %ebp
	jne	.L290
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC24, %edi
	xorl	%eax, %eax
	leaq	160(%rsp), %r13
	leaq	272(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r13, %rdi
	xorl	%eax, %eax
	movl	$.LC25, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC74, %edx
	movl	CORE_NO(%rip), %r8d
.L717:
	movl	$100, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	snprintf
	movl	$.LC69, %esi
	movq	%r12, %rdi
	call	gzopen
	movq	%rax, 40(%rsp)
	testq	%rax, %rax
	jne	.L356
	jmp	.L355
	.p2align 4,,10
	.p2align 3
.L725:
	testl	%ebp, %ebp
	jne	.L290
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC22, %edi
	xorl	%eax, %eax
	leaq	160(%rsp), %r13
	leaq	384(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r13, %rdi
	xorl	%eax, %eax
	movl	$.LC23, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC68, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L722
.L293:
	cmpl	$3, %ebp
	jne	.L290
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC28, %edi
	xorl	%eax, %eax
	leaq	160(%rsp), %r13
	leaq	272(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r13, %rdi
	xorl	%eax, %eax
	movl	$.LC29, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC76, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L717
.L287:
	cmpl	$3, %ebp
	jne	.L290
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC28, %edi
	xorl	%eax, %eax
	leaq	160(%rsp), %r13
	leaq	48(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r13, %rdi
	xorl	%eax, %eax
	movl	$.LC29, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC75, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L712
	.p2align 4,,10
	.p2align 3
.L691:
	movq	%r14, %rdi
	call	gzeof
	testl	%eax, %eax
	jne	.L706
	jmp	.L307
	.p2align 4,,10
	.p2align 3
.L312:
	movl	$.LC63, %edi
	call	puts
	movq	stdout(%rip), %rdi
	call	fflush
	xorl	%eax, %eax
#APP
# 741 "add.c" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$1, %ebx
	call	limb_t_add_n_512
	jmp	.L342
	.p2align 4,,10
	.p2align 3
.L727:
	fstp	%st(0)
.L342:
	leaq	496(%rsp), %rsi
	xorl	%edi, %edi
	addq	%rbx, %rbx
	xorl	%r15d, %r15d
	call	getrusage
	fildq	496(%rsp)
	fmuls	.LC64(%rip)
	fildq	504(%rsp)
	faddp	%st, %st(1)
	fisttpq	8(%rsp)
	testq	%rbx, %rbx
	jle	.L344
	movq	%rbx, %rsi
	andl	$6, %esi
	je	.L341
	cmpq	$1, %rsi
	je	.L612
	cmpq	$2, %rsi
	je	.L613
	cmpq	$3, %rsi
	je	.L614
	cmpq	$4, %rsi
	je	.L615
	cmpq	$5, %rsi
	je	.L616
	cmpq	$6, %rsi
	je	.L617
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$1, %r15d
	call	limb_t_add_n_512
.L617:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n_512
.L616:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n_512
.L615:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n_512
.L614:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n_512
.L613:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n_512
.L612:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n_512
	cmpq	%r15, %rbx
	je	.L344
.L341:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$8, %r15
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	cmpq	%r15, %rbx
	jne	.L341
.L344:
	leaq	496(%rsp), %rsi
	xorl	%edi, %edi
	call	getrusage
	fildq	496(%rsp)
	flds	.LC64(%rip)
	fxch	%st(1)
	fmuls	.LC64(%rip)
	fildq	504(%rsp)
	faddp	%st, %st(1)
	fildq	8(%rsp)
	fsubrp	%st, %st(1)
	fisttpq	8(%rsp)
	movq	8(%rsp), %rcx
	cmpq	$249999, %rcx
	jle	.L727
	vxorpd	%xmm3, %xmm3, %xmm3
	movl	$.LC55, %edi
	fstpt	16(%rsp)
	vcvtsi2sdq	%rcx, %xmm3, %xmm1
	vcvtsi2sdq	%rbx, %xmm3, %xmm4
	vdivsd	%xmm4, %xmm1, %xmm5
	vmovsd	%xmm5, 8(%rsp)
	call	puts
	movl	$.LC56, %edi
	movl	$1, %eax
	vmovsd	8(%rsp), %xmm0
	call	printf
	xorl	%eax, %eax
	vmovsd	.LC57(%rip), %xmm8
	vdivsd	8(%rsp), %xmm8, %xmm9
	vcvttsd2usi	%xmm9, %rdi
	leal	1(%rdi), %r15d
	movl	$.LC58, %edi
	movl	%r15d, %esi
	call	printf
	movq	stdout(%rip), %rdi
	call	fflush
	xorl	%edi, %edi
	leaq	496(%rsp), %rsi
	call	getrusage
	fildq	496(%rsp)
	fldt	16(%rsp)
	fmulp	%st, %st(1)
	fildq	504(%rsp)
	faddp	%st, %st(1)
	flds	.LC65(%rip)
	fxch	%st(1)
	fcomi	%st(1), %st
	jnb	.L345
	fstp	%st(1)
	fisttpq	8(%rsp)
.L346:
	xorl	%ebx, %ebx
	testl	%r15d, %r15d
	jle	.L353
	movl	%r15d, %r9d
	andl	$7, %r9d
	je	.L347
	cmpl	$1, %r9d
	je	.L619
	cmpl	$2, %r9d
	je	.L620
	cmpl	$3, %r9d
	je	.L621
	cmpl	$4, %r9d
	je	.L622
	cmpl	$5, %r9d
	je	.L623
	cmpl	$6, %r9d
	je	.L624
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$1, %ebx
	call	limb_t_add_n_512
.L624:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	limb_t_add_n_512
.L623:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	limb_t_add_n_512
.L622:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	limb_t_add_n_512
.L621:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	limb_t_add_n_512
.L620:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	limb_t_add_n_512
.L619:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	limb_t_add_n_512
	cmpl	%ebx, %r15d
	je	.L353
.L347:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$8, %ebx
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	cmpl	%ebx, %r15d
	jne	.L347
.L353:
	xorl	%edi, %edi
	leaq	496(%rsp), %rsi
	call	getrusage
	fildq	496(%rsp)
	fmuls	.LC64(%rip)
	movl	$.LC66, %edi
	fildq	504(%rsp)
	faddp	%st, %st(1)
	fstpt	16(%rsp)
	call	puts
	vxorpd	%xmm10, %xmm10, %xmm10
	movq	8(%rsp), %rbp
	vmovsd	.LC59(%rip), %xmm12
	vcvtsi2sdl	%r15d, %xmm10, %xmm11
	fildq	8(%rsp)
	testq	%rbp, %rbp
	fldt	16(%rsp)
	vmulsd	%xmm11, %xmm12, %xmm13
	jns	.L348
	fxch	%st(1)
	fadds	.LC67(%rip)
	fxch	%st(1)
.L348:
	fsubp	%st, %st(1)
	flds	.LC65(%rip)
	fxch	%st(1)
	fcomi	%st(1), %st
	jnb	.L349
	fstp	%st(1)
	fisttpq	8(%rsp)
	movq	8(%rsp), %r12
.L350:
	vxorpd	%xmm14, %xmm14, %xmm14
	vcvtusi2sdq	%r12, %xmm14, %xmm15
	vdivsd	%xmm15, %xmm13, %xmm6
	vcomisd	.LC41(%rip), %xmm6
	ja	.L366
	vmovsd	.LC41(%rip), %xmm9
	xorl	%esi, %esi
	vmovsd	.LC60(%rip), %xmm7
.L352:
	vmulsd	%xmm7, %xmm9, %xmm0
	leal	1(%rsi), %r13d
	movl	%r13d, %esi
	vcomisd	%xmm0, %xmm6
	ja	.L351
	vmulsd	%xmm7, %xmm0, %xmm2
	addl	$1, %esi
	vcomisd	%xmm2, %xmm6
	ja	.L351
	vmulsd	%xmm7, %xmm2, %xmm3
	leal	2(%r13), %esi
	vcomisd	%xmm3, %xmm6
	ja	.L351
	vmulsd	%xmm7, %xmm3, %xmm1
	leal	3(%r13), %esi
	vcomisd	%xmm1, %xmm6
	ja	.L351
	vmulsd	%xmm7, %xmm1, %xmm4
	leal	4(%r13), %esi
	vcomisd	%xmm4, %xmm6
	ja	.L351
	vmulsd	%xmm7, %xmm4, %xmm5
	leal	5(%r13), %esi
	vcomisd	%xmm5, %xmm6
	ja	.L351
	vmulsd	%xmm7, %xmm5, %xmm8
	leal	6(%r13), %esi
	vcomisd	%xmm8, %xmm6
	ja	.L351
	vmulsd	%xmm7, %xmm8, %xmm9
	leal	7(%r13), %esi
	vcomisd	%xmm9, %xmm6
	jbe	.L352
	.p2align 4
	.p2align 3
.L351:
	vmovapd	%xmm6, %xmm0
	movl	$.LC61, %edi
	movl	$1, %eax
	call	printf
	movq	%r14, %rdi
	call	gzclose
	movq	32(%rsp), %rdi
	call	gzclose
	jmp	.L706
	.p2align 4,,10
	.p2align 3
.L311:
	movl	$.LC62, %edi
	call	puts
	movq	stdout(%rip), %rdi
	call	fflush
	xorl	%eax, %eax
#APP
# 702 "add.c" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$1, %ebx
	call	limb_t_add_n_512
	.p2align 4
	.p2align 3
.L603:
	leaq	496(%rsp), %rsi
	movl	$4, %edi
	addq	%rbx, %rbx
	xorl	%r15d, %r15d
	call	clock_gettime
	movq	496(%rsp), %r11
	movq	504(%rsp), %rcx
	movq	%r11, 32(%rsp)
	movq	%rcx, 8(%rsp)
	testq	%rbx, %rbx
	jle	.L331
	movq	%rbx, %rdx
	andl	$7, %edx
	je	.L330
	cmpq	$1, %rdx
	je	.L597
	cmpq	$2, %rdx
	je	.L598
	cmpq	$3, %rdx
	je	.L599
	cmpq	$4, %rdx
	je	.L600
	cmpq	$5, %rdx
	je	.L601
	cmpq	$6, %rdx
	je	.L602
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$1, %r15d
	call	limb_t_add_n_512
.L602:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n_512
.L601:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n_512
.L600:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n_512
.L599:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n_512
.L598:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n_512
.L597:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_t_add_n_512
	cmpq	%rbx, %r15
	je	.L331
.L330:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$8, %r15
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	cmpq	%rbx, %r15
	jne	.L330
.L331:
	leaq	496(%rsp), %rsi
	movl	$4, %edi
	call	clock_gettime
	movq	32(%rsp), %rsi
	movq	8(%rsp), %r10
	movq	504(%rsp), %rdi
	movq	496(%rsp), %r8
	movq	%rdi, %r9
	subq	%rsi, %r8
	subq	%r10, %r9
	js	.L726
	imulq	$1000000000, %r8, %rax
	addq	%r9, %rax
	cmpq	$249999999, %rax
	jle	.L603
.L333:
	shrq	$3, %rax
	vxorpd	%xmm6, %xmm6, %xmm6
	movl	$.LC55, %edi
	movabsq	$2361183241434822607, %r11
	mulq	%r11
	vcvtsi2sdq	%rbx, %xmm6, %xmm0
	shrq	$4, %rdx
	vcvtsi2sdq	%rdx, %xmm6, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm7
	vmovsd	%xmm7, 8(%rsp)
	call	puts
	movl	$.LC56, %edi
	movl	$1, %eax
	vmovsd	8(%rsp), %xmm0
	call	printf
	movl	$.LC58, %edi
	xorl	%eax, %eax
	vmovsd	.LC57(%rip), %xmm2
	vdivsd	8(%rsp), %xmm2, %xmm3
	vcvttsd2usi	%xmm3, %rbx
	addl	$1, %ebx
	movl	%ebx, %esi
	call	printf
	movq	stdout(%rip), %rdi
	call	fflush
	leaq	496(%rsp), %rsi
	movl	$4, %edi
	call	clock_gettime
	movq	504(%rsp), %r15
	movq	496(%rsp), %rcx
	movq	%r15, 8(%rsp)
	xorl	%r15d, %r15d
	movq	%rcx, 32(%rsp)
	testl	%ebx, %ebx
	jle	.L337
	movl	%ebx, %edi
	andl	$7, %edi
	je	.L334
	cmpl	$1, %edi
	je	.L605
	cmpl	$2, %edi
	je	.L606
	cmpl	$3, %edi
	je	.L607
	cmpl	$4, %edi
	je	.L608
	cmpl	$5, %edi
	je	.L609
	cmpl	$6, %edi
	je	.L610
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$1, %r15d
	call	limb_t_add_n_512
.L610:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$1, %r15d
	call	limb_t_add_n_512
.L609:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$1, %r15d
	call	limb_t_add_n_512
.L608:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$1, %r15d
	call	limb_t_add_n_512
.L607:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$1, %r15d
	call	limb_t_add_n_512
.L606:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$1, %r15d
	call	limb_t_add_n_512
.L605:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$1, %r15d
	call	limb_t_add_n_512
	cmpl	%r15d, %ebx
	je	.L337
.L334:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addl	$8, %r15d
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	limb_t_add_n_512
	cmpl	%r15d, %ebx
	jne	.L334
.L337:
	leaq	496(%rsp), %rsi
	movl	$4, %edi
	call	clock_gettime
	movq	32(%rsp), %r13
	movq	8(%rsp), %r8
	movq	504(%rsp), %rbp
	movq	496(%rsp), %r12
	movq	%rbp, %r9
	subq	%r13, %r12
	subq	%r8, %r9
	jns	.L336
	leaq	1000000000(%rbp), %r9
	subq	$1, %r12
	subq	%r8, %r9
.L336:
	imulq	$1000000000, %r12, %r10
	vxorpd	%xmm4, %xmm4, %xmm4
	movabsq	$2361183241434822607, %rax
	vmovsd	.LC59(%rip), %xmm8
	vcvtsi2sdl	%ebx, %xmm4, %xmm5
	addq	%r10, %r9
	imulq	%r9
	sarq	$63, %r9
	vmulsd	%xmm5, %xmm8, %xmm9
	sarq	$7, %rdx
	subq	%r9, %rdx
	vcvtusi2sdq	%rdx, %xmm4, %xmm10
	vdivsd	%xmm10, %xmm9, %xmm11
	vcomisd	.LC41(%rip), %xmm11
	ja	.L363
	vmovsd	.LC41(%rip), %xmm2
	xorl	%esi, %esi
	vmovsd	.LC60(%rip), %xmm12
.L339:
	vmulsd	%xmm12, %xmm2, %xmm13
	leal	1(%rsi), %r11d
	movl	%r11d, %esi
	vcomisd	%xmm13, %xmm11
	ja	.L338
	vmulsd	%xmm12, %xmm13, %xmm14
	addl	$1, %esi
	vcomisd	%xmm14, %xmm11
	ja	.L338
	vmulsd	%xmm12, %xmm14, %xmm15
	leal	2(%r11), %esi
	vcomisd	%xmm15, %xmm11
	ja	.L338
	vmulsd	%xmm12, %xmm15, %xmm6
	leal	3(%r11), %esi
	vcomisd	%xmm6, %xmm11
	ja	.L338
	vmulsd	%xmm12, %xmm6, %xmm1
	leal	4(%r11), %esi
	vcomisd	%xmm1, %xmm11
	ja	.L338
	vmulsd	%xmm12, %xmm1, %xmm0
	leal	5(%r11), %esi
	vcomisd	%xmm0, %xmm11
	ja	.L338
	vmulsd	%xmm12, %xmm0, %xmm7
	leal	6(%r11), %esi
	vcomisd	%xmm7, %xmm11
	ja	.L338
	vmulsd	%xmm12, %xmm7, %xmm2
	leal	7(%r11), %esi
	vcomisd	%xmm2, %xmm11
	jbe	.L339
	.p2align 4
	.p2align 3
.L338:
	vmovapd	%xmm11, %xmm0
	movl	$.LC61, %edi
	movl	$1, %eax
	call	printf
	movq	%r14, %rdi
	call	gzclose
	movq	40(%rsp), %rdi
	call	gzclose
	jmp	.L706
	.p2align 4,,10
	.p2align 3
.L726:
	imulq	$1000000000, %r8, %rax
	subq	%r10, %rdi
	addq	%rdi, %rax
	cmpq	$249999999, %rax
	jle	.L603
	jmp	.L333
.L297:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC24, %edi
	xorl	%eax, %eax
	leaq	160(%rsp), %r13
	leaq	384(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r13, %rdi
	xorl	%eax, %eax
	movl	$.LC25, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC72, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L722
.L300:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC26, %edi
	xorl	%eax, %eax
	leaq	160(%rsp), %r13
	leaq	384(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r13, %rdi
	xorl	%eax, %eax
	movl	$.LC27, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC80, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L722
.L286:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC26, %edi
	xorl	%eax, %eax
	leaq	160(%rsp), %r13
	leaq	48(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r13, %rdi
	xorl	%eax, %eax
	movl	$.LC27, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC78, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L712
.L288:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC22, %edi
	xorl	%eax, %eax
	leaq	160(%rsp), %r13
	leaq	48(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r13, %rdi
	xorl	%eax, %eax
	movl	$.LC23, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC70, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L712
.L292:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC26, %edi
	xorl	%eax, %eax
	leaq	160(%rsp), %r13
	leaq	272(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r13, %rdi
	xorl	%eax, %eax
	movl	$.LC27, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC79, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L717
.L294:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC22, %edi
	xorl	%eax, %eax
	leaq	160(%rsp), %r13
	leaq	272(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r13, %rdi
	xorl	%eax, %eax
	movl	$.LC23, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC71, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L717
.L349:
	fsubp	%st, %st(1)
	fisttpq	8(%rsp)
	movq	8(%rsp), %r12
	btcq	$63, %r12
	jmp	.L350
.L345:
	fsubp	%st, %st(1)
	fisttpq	8(%rsp)
	movq	8(%rsp), %r8
	btcq	$63, %r8
	movq	%r8, 8(%rsp)
	jmp	.L346
.L724:
	clflush	0(%rbp)
	clflush	(%r12)
	leaq	64(%rbp), %rax
	leaq	64(%r12), %rcx
	jmp	.L581
.L366:
	xorl	%esi, %esi
	jmp	.L351
.L363:
	xorl	%esi, %esi
	jmp	.L338
.L361:
	xorl	%esi, %esi
	jmp	.L322
.L285:
	movl	$.LC49, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L290:
	movl	$.LC30, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L304:
	movq	stderr(%rip), %rdi
	movq	%rbp, %rdx
	movl	$.LC34, %esi
	xorl	%eax, %eax
	call	fprintf
	movq	%r14, %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
.L723:
	movq	%r13, %rdi
	call	open_gzfile.part.0
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	run_benchmarking_test.cold, @function
run_benchmarking_test.cold:
.LFSB6837:
.L307:
	.cfi_def_cfa_offset 656064
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movl	$.LC32, %edi
	call	perror
	movq	%r14, %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6837:
	.text
	.size	run_benchmarking_test, .-run_benchmarking_test
	.section	.text.unlikely
	.size	run_benchmarking_test.cold, .-run_benchmarking_test.cold
.LCOLDE82:
	.text
.LHOTE82:
	.section	.rodata.str1.8
	.align 8
.LC83:
	.string	"Usage: %s <number of bits> <core number> <test-case number> <measure_type>\n"
	.align 8
.LC84:
	.string	"test-case number: 0 --> Random numbers"
	.align 8
.LC85:
	.string	"test-case number: 1 --> Random numbers with a < b"
	.align 8
.LC86:
	.string	"test-case number: 2 --> Random numbers with a > b"
	.align 8
.LC87:
	.string	"test-case number: 3 --> Random numbers with a = b"
	.section	.rodata.str1.1
.LC88:
	.string	"measure_type: 0 --> RDTSC"
.LC89:
	.string	"measure_type: 1 --> Timespec"
.LC90:
	.string	"measure_type: 2 --> RUSAGE"
.LC91:
	.string	"add.c"
.LC92:
	.string	"atoi(argv[1]) > 0"
	.section	.rodata.str1.8
	.align 8
.LC93:
	.string	"atoi(argv[2]) >= 0 && atoi(argv[2]) < sysconf(_SC_NPROCESSORS_ONLN)"
	.align 8
.LC94:
	.string	"atoi(argv[3]) >= 0 && atoi(argv[3]) < 4"
	.align 8
.LC95:
	.string	"atoi(argv[4]) >= 0 && atoi(argv[4]) < 3"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB6835:
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
	je	.L729
	movq	(%rsi), %rsi
	movl	$.LC83, %edi
	xorl	%eax, %eax
	call	printf
	movl	$.LC84, %edi
	call	puts
	movl	$.LC85, %edi
	call	puts
	movl	$.LC86, %edi
	call	puts
	movl	$.LC87, %edi
	call	puts
	movl	$.LC88, %edi
	call	puts
	movl	$.LC89, %edi
	call	puts
	movl	$.LC90, %edi
	call	puts
	movl	$1, %eax
.L728:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L729:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	testl	%eax, %eax
	jle	.L739
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
	js	.L733
	movq	16(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	$84, %edi
	movq	%rax, %rbp
	call	sysconf
	movslq	%ebp, %rdx
	cmpq	%rax, %rdx
	jge	.L733
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
	js	.L735
	movq	24(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	$3, %eax
	jg	.L735
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
	js	.L737
	movq	32(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	$2, %eax
	jg	.L737
	movq	32(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	%rax, %rbx
	xorl	%eax, %eax
	call	init_memory_pool
	movl	%ebp, %edi
	call	run_correctness_test
	movl	%ebx, %esi
	movl	%ebp, %edi
	call	run_benchmarking_test
	xorl	%eax, %eax
	call	destroy_memory_pool
	xorl	%eax, %eax
	jmp	.L728
.L739:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$231, %edx
	movl	$.LC91, %esi
	movl	$.LC92, %edi
	call	__assert_fail
.L733:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$234, %edx
	movl	$.LC91, %esi
	movl	$.LC93, %edi
	call	__assert_fail
.L735:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$237, %edx
	movl	$.LC91, %esi
	movl	$.LC94, %edi
	call	__assert_fail
.L737:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$240, %edx
	movl	$.LC91, %esi
	movl	$.LC95, %edi
	call	__assert_fail
	.cfi_endproc
.LFE6835:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 5
__PRETTY_FUNCTION__.0:
	.string	"main"
	.globl	carry_space_ptr
	.bss
	.align 4
	.type	carry_space_ptr, @object
	.size	carry_space_ptr, 4
carry_space_ptr:
	.zero	4
	.globl	sum_space_ptr
	.align 4
	.type	sum_space_ptr, @object
	.size	sum_space_ptr, 4
sum_space_ptr:
	.zero	4
	.globl	carry_space
	.align 64
	.type	carry_space, @object
	.size	carry_space, 8
carry_space:
	.zero	8
	.globl	sum_space
	.align 64
	.type	sum_space, @object
	.size	sum_space, 8
sum_space:
	.zero	8
	.globl	NUM_BITS
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
	.section	.rodata
	.align 64
.LC19:
	.long	-1
	.long	1048575
	.long	-1
	.long	1048575
	.long	-1
	.long	1048575
	.long	-1
	.long	1048575
	.long	-1
	.long	1048575
	.long	-1
	.long	1048575
	.long	-1
	.long	1048575
	.long	-1
	.long	1048575
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC41:
	.long	0
	.long	1079574528
	.align 8
.LC54:
	.long	1394455622
	.long	1060595063
	.align 8
.LC57:
	.long	0
	.long	1097011920
	.align 8
.LC59:
	.long	0
	.long	1093567616
	.align 8
.LC60:
	.long	-1717986918
	.long	1069128089
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC64:
	.long	1232348160
	.align 4
.LC65:
	.long	1593835520
	.align 4
.LC67:
	.long	1602224128
	.ident	"GCC: (GNU) 14.2.1 20250110 (Red Hat 14.2.1-7)"
	.section	.note.GNU-stack,"",@progbits
