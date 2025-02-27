	.file	"test4.c"
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
.LFSB6600:
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
	jne	.L26
	xorl	%ebx, %ebx
	testq	%r13, %r13
	je	.L28
	movq	%r13, %rcx
	andl	$7, %ecx
	je	.L27
	cmpq	$1, %rcx
	je	.L72
	cmpq	$2, %rcx
	je	.L73
	cmpq	$3, %rcx
	je	.L74
	cmpq	$4, %rcx
	je	.L75
	cmpq	$5, %rcx
	je	.L76
	cmpq	$6, %rcx
	je	.L77
	movzbl	(%r12), %esi
	cmpb	%sil, 0(%rbp)
	jne	.L86
	movl	$1, %ebx
.L77:
	movzbl	(%r12,%rbx), %edi
	cmpb	%dil, 0(%rbp,%rbx)
	jne	.L86
	addq	$1, %rbx
.L76:
	movzbl	(%r12,%rbx), %r8d
	cmpb	%r8b, 0(%rbp,%rbx)
	jne	.L86
	addq	$1, %rbx
.L75:
	movzbl	(%r12,%rbx), %r9d
	cmpb	%r9b, 0(%rbp,%rbx)
	jne	.L86
	addq	$1, %rbx
.L74:
	movzbl	(%r12,%rbx), %r10d
	cmpb	%r10b, 0(%rbp,%rbx)
	jne	.L86
	addq	$1, %rbx
.L73:
	movzbl	(%r12,%rbx), %r11d
	cmpb	%r11b, 0(%rbp,%rbx)
	jne	.L86
	addq	$1, %rbx
.L72:
	movzbl	(%r12,%rbx), %eax
	cmpb	%al, 0(%rbp,%rbx)
	jne	.L86
	addq	$1, %rbx
	cmpq	%rbx, %r13
	je	.L28
.L27:
	movzbl	(%r12,%rbx), %edx
	cmpb	%dl, 0(%rbp,%rbx)
	jne	.L86
	leaq	1(%rbx), %rcx
	movzbl	(%r12,%rcx), %esi
	movq	%rcx, %rbx
	cmpb	%sil, 0(%rbp,%rcx)
	jne	.L86
	addq	$1, %rbx
	movzbl	(%r12,%rbx), %edi
	cmpb	%dil, 0(%rbp,%rbx)
	jne	.L86
	movzbl	2(%r12,%rcx), %r8d
	leaq	2(%rcx), %rbx
	cmpb	%r8b, 2(%rbp,%rcx)
	jne	.L86
	movzbl	3(%r12,%rcx), %r9d
	leaq	3(%rcx), %rbx
	cmpb	%r9b, 3(%rbp,%rcx)
	jne	.L86
	movzbl	4(%r12,%rcx), %r10d
	leaq	4(%rcx), %rbx
	cmpb	%r10b, 4(%rbp,%rcx)
	jne	.L86
	movzbl	5(%r12,%rcx), %r11d
	leaq	5(%rcx), %rbx
	cmpb	%r11b, 5(%rbp,%rcx)
	jne	.L86
	movzbl	6(%r12,%rcx), %eax
	leaq	6(%rcx), %rbx
	cmpb	%al, 6(%rbp,%rcx)
	jne	.L86
	leaq	7(%rcx), %rbx
	cmpq	%rbx, %r13
	jne	.L27
.L28:
	cmpb	$45, %r14b
	movl	$1, %eax
	sete	%r14b
	cmpb	$45, %r15b
	sete	%r15b
	cmpb	%r15b, %r14b
	je	.L23
	movl	$.LC11, %edi
	call	puts
	.p2align 4
	.p2align 3
.L29:
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
.L86:
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
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L26:
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
	jmp	.L29
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
	jne	.L93
	cmpb	$0, 1(%rax)
	jne	.L93
.L90:
	movq	%rbp, %rdi
	call	free
	movl	$511, %esi
	movq	%rbx, %rdi
	call	mkdir
	testl	%eax, %eax
	je	.L107
	call	__errno_location
	movl	(%rax), %edi
	cmpl	$17, %edi
	jne	.L109
.L107:
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
.L93:
	.cfi_restore_state
	cmpl	$47, %edx
	je	.L110
.L94:
	movq	%rax, %rdi
	call	create_directory
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L110:
	cmpb	$0, 1(%rax)
	je	.L90
	jmp	.L94
.L109:
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
	je	.L114
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L114:
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
	je	.L117
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
.L117:
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
	vpmovzxdq	(%rdi), %zmm0
	vpmovzxdq	(%rsi), %zmm1
	vmovdqa64	.LC16(%rip), %zmm2
	vmovdqa64	.LC17(%rip), %zmm3
	vmovdqa64	.LC18(%rip), %zmm7
	vmovdqa64	.LC19(%rip), %zmm9
	vpermq	%zmm0, %zmm2, %zmm4
	vpermq	%zmm1, %zmm3, %zmm5
	vmovdqa64	.LC20(%rip), %zmm12
	vmovdqa64	.LC21(%rip), %zmm14
	vpmuludq	%zmm5, %zmm4, %zmm6
	vpermq	%zmm0, %zmm7, %zmm8
	vmovdqa64	.LC22(%rip), %zmm4
	vmovdqa64	.LC23(%rip), %zmm3
	vpermq	%zmm1, %zmm9, %zmm10
	vpermq	%zmm0, %zmm12, %zmm13
	vpermq	%zmm1, %zmm14, %zmm15
	vpermq	%zmm0, %zmm4, %zmm5
	vpmuludq	%zmm10, %zmm8, %zmm11
	vmovdqa64	.LC24(%rip), %zmm8
	vpmuludq	%zmm15, %zmm13, %zmm2
	vmovdqa64	.LC26(%rip), %zmm13
	vpermq	%zmm0, %zmm8, %zmm9
	vmovdqa64	.LC30(%rip), %zmm8
	vmovdqa64	%zmm6, (%rdx)
	vpermq	%zmm1, %zmm3, %zmm6
	vpermq	%zmm1, %zmm13, %zmm14
	vpmuludq	%zmm6, %zmm5, %zmm7
	vpmuludq	%zmm6, %zmm9, %zmm10
	vmovdqa64	.LC28(%rip), %zmm5
	vmovdqa64	%zmm11, 64(%rdx)
	vmovdqa64	.LC25(%rip), %zmm11
	vmovdqa64	%zmm2, 128(%rdx)
	vpermq	%zmm1, %zmm5, %zmm3
	vmovdqa64	.LC27(%rip), %zmm2
	vpermq	%zmm1, %zmm8, %zmm1
	vpermq	%zmm0, %zmm11, %zmm12
	vpermq	%zmm0, %zmm2, %zmm4
	vpmuludq	%zmm14, %zmm12, %zmm15
	vmovdqa64	%zmm7, 192(%rdx)
	vpmuludq	%zmm3, %zmm4, %zmm6
	vmovdqa64	.LC29(%rip), %zmm7
	vmovdqa64	%zmm10, 256(%rdx)
	vpermq	%zmm0, %zmm7, %zmm0
	vpmuludq	%zmm1, %zmm0, %zmm9
	vmovdqa64	%zmm15, 320(%rdx)
	vmovdqa64	%zmm6, 384(%rdx)
	vmovdqa64	%zmm9, 448(%rdx)
	vzeroupper
	ret
	.cfi_endproc
.LFE6642:
	.size	accumulate_multiply_AVX, .-accumulate_multiply_AVX
	.p2align 4
	.globl	horizontal_sum_128
	.type	horizontal_sum_128, @function
horizontal_sum_128:
.LFB6643:
	.cfi_startproc
	vmovdqa	%xmm0, %xmm1
	vpsrldq	$8, %xmm0, %xmm0
	vpaddq	%xmm1, %xmm0, %xmm2
	vmovq	%xmm2, %rax
	ret
	.cfi_endproc
.LFE6643:
	.size	horizontal_sum_128, .-horizontal_sum_128
	.p2align 4
	.globl	add_limbs
	.type	add_limbs, @function
add_limbs:
.LFB6644:
	.cfi_startproc
	vmovdqu	8(%rdi), %xmm0
	vmovdqu	24(%rdi), %xmm3
	vmovdqa	48(%rdi), %xmm8
	vmovq	40(%rdi), %xmm6
	vpsrldq	$8, %xmm0, %xmm1
	vpsrldq	$8, %xmm3, %xmm4
	vpaddq	64(%rdi), %xmm8, %xmm9
	vmovdqa	80(%rdi), %xmm12
	vpaddq	%xmm1, %xmm0, %xmm2
	vpaddq	%xmm4, %xmm3, %xmm5
	vmovq	112(%rdi), %xmm0
	vmovq	%xmm2, 8(%rdi)
	vpaddq	%xmm6, %xmm5, %xmm7
	vpsrldq	$8, %xmm9, %xmm10
	vmovdqu	136(%rdi), %xmm2
	vpaddq	120(%rdi), %xmm2, %xmm3
	vpaddq	96(%rdi), %xmm12, %xmm13
	vmovq	%xmm7, 16(%rdi)
	vpaddq	152(%rdi), %xmm3, %xmm4
	vpaddq	%xmm10, %xmm9, %xmm11
	vmovdqu	184(%rdi), %xmm7
	vpsrldq	$8, %xmm13, %xmm14
	vmovq	%xmm11, 24(%rdi)
	vpaddq	168(%rdi), %xmm7, %xmm8
	vpaddq	200(%rdi), %xmm8, %xmm9
	vpsrldq	$8, %xmm4, %xmm5
	vpaddq	%xmm14, %xmm13, %xmm15
	vmovdqa	240(%rdi), %xmm14
	vmovq	216(%rdi), %xmm12
	vpaddq	%xmm5, %xmm4, %xmm6
	vpaddq	%xmm0, %xmm15, %xmm1
	vpsrldq	$8, %xmm9, %xmm10
	vmovdqa	304(%rdi), %xmm4
	vmovq	%xmm6, 40(%rdi)
	vpaddq	%xmm10, %xmm9, %xmm11
	vpaddq	288(%rdi), %xmm4, %xmm5
	vmovq	336(%rdi), %xmm9
	vpaddq	320(%rdi), %xmm5, %xmm6
	vmovq	%xmm1, 32(%rdi)
	vpaddq	224(%rdi), %xmm14, %xmm15
	vpaddq	256(%rdi), %xmm15, %xmm0
	vpaddq	%xmm12, %xmm11, %xmm13
	vmovdqu	360(%rdi), %xmm11
	vpaddq	272(%rdi), %xmm0, %xmm2
	vpsrldq	$8, %xmm6, %xmm7
	vmovq	%xmm13, 48(%rdi)
	vpaddq	%xmm7, %xmm6, %xmm8
	vpsrldq	$8, %xmm2, %xmm1
	vpaddq	%xmm9, %xmm8, %xmm10
	vpaddq	%xmm1, %xmm2, %xmm3
	vmovq	%xmm10, 64(%rdi)
	vmovq	%xmm3, 56(%rdi)
	vpaddq	344(%rdi), %xmm11, %xmm12
	vpaddq	376(%rdi), %xmm12, %xmm13
	vmovdqu	408(%rdi), %xmm0
	vmovdqa	464(%rdi), %xmm10
	vpaddq	392(%rdi), %xmm0, %xmm2
	vpsrldq	$8, %xmm13, %xmm14
	vmovdqa	448(%rdi), %xmm6
	vpaddq	%xmm14, %xmm13, %xmm15
	vpsrldq	$8, %xmm10, %xmm11
	vpaddq	432(%rdi), %xmm6, %xmm7
	vmovq	424(%rdi), %xmm4
	vmovq	%xmm15, 72(%rdi)
	vpsrldq	$8, %xmm2, %xmm1
	vmovdqu	488(%rdi), %xmm15
	vmovq	480(%rdi), %xmm13
	vpaddq	%xmm1, %xmm2, %xmm3
	vpsrldq	$8, %xmm7, %xmm8
	vpaddq	%xmm11, %xmm10, %xmm12
	vpsrldq	$8, %xmm15, %xmm0
	vpaddq	%xmm4, %xmm3, %xmm5
	vpaddq	%xmm8, %xmm7, %xmm9
	vpaddq	%xmm0, %xmm15, %xmm2
	vpaddq	%xmm13, %xmm12, %xmm14
	vpinsrq	$1, 504(%rdi), %xmm2, %xmm1
	vmovq	%xmm5, 80(%rdi)
	vmovq	%xmm9, 88(%rdi)
	vmovq	%xmm14, 96(%rdi)
	vmovdqu	%xmm1, 104(%rdi)
	ret
	.cfi_endproc
.LFE6644:
	.size	add_limbs, .-add_limbs
	.p2align 4
	.globl	adjust_limbs
	.type	adjust_limbs, @function
adjust_limbs:
.LFB6645:
	.cfi_startproc
	movq	8(%rdi), %r8
	movq	(%rdi), %rdx
	xorl	%ecx, %ecx
	movq	16(%rdi), %rsi
	movq	24(%rdi), %r10
	movq	%r8, %rax
	shrq	$32, %rax
	movq	%r10, %r11
	addl	%edx, %eax
	setc	%cl
	shrq	$32, %rdx
	xorl	%r9d, %r9d
	addq	%rcx, %rdx
	movq	%rsi, %rcx
	salq	$32, %rax
	shrq	$32, %rcx
	orq	%rax, %rdx
	addl	%r8d, %ecx
	setc	%r9b
	shrq	$32, %r11
	salq	$32, %r9
	addq	%rdx, %r9
	movq	32(%rdi), %rdx
	addl	%esi, %r11d
	adcl	$0, %ecx
	salq	$32, %r11
	movq	%r9, (%rdi)
	movq	%rdx, %r8
	orq	%r11, %rcx
	movq	48(%rdi), %r11
	shrq	$32, %r8
	addl	%r8d, %r10d
	setc	%al
	movzbl	%al, %esi
	salq	$32, %rsi
	addq	%rcx, %rsi
	movq	40(%rdi), %rcx
	movq	%rsi, 8(%rdi)
	movq	%rcx, %r9
	shrq	$32, %r9
	addl	%edx, %r9d
	movq	%r11, %rdx
	adcl	$0, %r10d
	salq	$32, %r9
	shrq	$32, %rdx
	orq	%r9, %r10
	movq	64(%rdi), %r9
	addl	%edx, %ecx
	setc	%r8b
	movzbl	%r8b, %eax
	salq	$32, %rax
	addq	%r10, %rax
	movq	56(%rdi), %r10
	movq	%rax, 16(%rdi)
	movq	%r10, %rsi
	shrq	$32, %rsi
	addl	%r11d, %esi
	movq	%r9, %r11
	adcl	$0, %ecx
	salq	$32, %rsi
	shrq	$32, %r11
	orq	%rsi, %rcx
	movq	80(%rdi), %rsi
	addl	%r11d, %r10d
	setc	%dl
	movzbl	%dl, %r8d
	salq	$32, %r8
	addq	%rcx, %r8
	movq	72(%rdi), %rcx
	movq	%r8, 24(%rdi)
	movq	%rcx, %rax
	shrq	$32, %rax
	addl	%r9d, %eax
	movq	%rsi, %r9
	adcl	$0, %r10d
	salq	$32, %rax
	shrq	$32, %r9
	orq	%rax, %r10
	addl	%r9d, %ecx
	movq	96(%rdi), %r9
	setc	%r11b
	movzbl	%r11b, %edx
	movq	%r9, %rax
	salq	$32, %rdx
	addq	%r10, %rdx
	movq	88(%rdi), %r10
	movq	%rdx, 32(%rdi)
	movq	104(%rdi), %rdx
	movq	%r10, %r8
	shrq	$32, %r8
	addl	%esi, %r8d
	adcl	$0, %ecx
	salq	$32, %r8
	shrq	$32, %rax
	orq	%r8, %rcx
	movq	112(%rdi), %r8
	addl	%eax, %r10d
	setc	%sil
	movzbl	%sil, %r11d
	salq	$32, %r11
	addq	%rcx, %r11
	movq	%rdx, %rcx
	shrq	$32, %rcx
	movq	%r11, 40(%rdi)
	addl	%r9d, %ecx
	movq	%r8, %r9
	adcl	$0, %r10d
	salq	$32, %rcx
	shrq	$32, %r9
	orq	%rcx, %r10
	addl	%edx, %r9d
	setc	%al
	movzbl	%al, %esi
	salq	$32, %rsi
	addq	%rsi, %r10
	movq	%r10, 48(%rdi)
	movl	%r8d, %r10d
	addl	124(%rdi), %r10d
	adcl	$0, %r9d
	salq	$32, %r8
	orq	%r8, %r9
	movq	%r9, 56(%rdi)
	ret
	.cfi_endproc
.LFE6645:
	.size	adjust_limbs, .-adjust_limbs
	.p2align 4
	.globl	multiply
	.type	multiply, @function
multiply:
.LFB6646:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	accumulate_multiply_AVX
	movq	%rdx, %rdi
	call	add_limbs
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	adjust_limbs
	.cfi_endproc
.LFE6646:
	.size	multiply, .-multiply
	.section	.rodata.str1.1
.LC31:
	.string	"%016lx "
	.text
	.p2align 4
	.globl	print_array
	.type	print_array, @function
print_array:
.LFB6647:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L166
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
	je	.L128
	cmpq	$1, %rax
	je	.L151
	cmpq	$2, %rax
	je	.L152
	cmpq	$3, %rax
	je	.L153
	cmpq	$4, %rax
	je	.L154
	cmpq	$5, %rax
	je	.L155
	cmpq	$6, %rax
	jne	.L169
.L156:
	movq	(%rbx), %rsi
	movl	$.LC31, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L155:
	movq	(%rbx), %rsi
	movl	$.LC31, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L154:
	movq	(%rbx), %rsi
	movl	$.LC31, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L153:
	movq	(%rbx), %rsi
	movl	$.LC31, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L152:
	movq	(%rbx), %rsi
	movl	$.LC31, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L151:
	movq	(%rbx), %rsi
	movl	$.LC31, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
	cmpq	%rbp, %rbx
	je	.L127
.L128:
	movq	(%rbx), %rsi
	movl	$.LC31, %edi
	xorl	%eax, %eax
	addq	$64, %rbx
	call	printf
	movq	-56(%rbx), %rsi
	movl	$.LC31, %edi
	xorl	%eax, %eax
	call	printf
	movq	-48(%rbx), %rsi
	movl	$.LC31, %edi
	xorl	%eax, %eax
	call	printf
	movq	-40(%rbx), %rsi
	movl	$.LC31, %edi
	xorl	%eax, %eax
	call	printf
	movq	-32(%rbx), %rsi
	movl	$.LC31, %edi
	xorl	%eax, %eax
	call	printf
	movq	-24(%rbx), %rsi
	movl	$.LC31, %edi
	xorl	%eax, %eax
	call	printf
	movq	-16(%rbx), %rsi
	movl	$.LC31, %edi
	xorl	%eax, %eax
	call	printf
	movq	-8(%rbx), %rsi
	movl	$.LC31, %edi
	xorl	%eax, %eax
	call	printf
	cmpq	%rbp, %rbx
	jne	.L128
.L127:
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
.L169:
	.cfi_restore_state
	movq	(%rdi), %rsi
	xorl	%eax, %eax
	movl	$.LC31, %edi
	addq	$8, %rbx
	call	printf
	jmp	.L156
	.p2align 4,,10
	.p2align 3
.L166:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	movl	$10, %edi
	jmp	putchar
	.cfi_endproc
.LFE6647:
	.size	print_array, .-print_array
	.p2align 4
	.globl	generate_random_numbers
	.type	generate_random_numbers, @function
generate_random_numbers:
.LFB6648:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L211
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
	je	.L172
	cmpq	$1, %rax
	je	.L195
	cmpq	$2, %rax
	je	.L196
	cmpq	$3, %rax
	je	.L197
	cmpq	$4, %rax
	je	.L198
	cmpq	$5, %rax
	je	.L199
	cmpq	$6, %rax
	jne	.L214
.L200:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L199:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L198:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L197:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L196:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L195:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
	cmpq	%rbp, %rbx
	je	.L209
.L172:
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
	jne	.L172
.L209:
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
.L214:
	.cfi_restore_state
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
	jmp	.L200
	.p2align 4,,10
	.p2align 3
.L211:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE6648:
	.size	generate_random_numbers, .-generate_random_numbers
	.section	.rodata.str1.1
.LC32:
	.string	"%08x"
	.text
	.p2align 4
	.globl	limb_get_str32
	.type	limb_get_str32, @function
limb_get_str32:
.LFB6649:
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
	jle	.L221
	movslq	%esi, %rsi
	movq	%rdi, %rbx
	xorl	%r12d, %r12d
	leaq	-4(,%rsi,4), %rax
	leaq	(%rdi,%rsi,4), %r13
	shrq	$2, %rax
	addq	$1, %rax
	andl	$3, %eax
	je	.L217
	cmpq	$1, %rax
	je	.L234
	cmpq	$2, %rax
	je	.L235
	movl	(%rdi), %ecx
	movq	(%rdx), %rdi
	movl	$9, %esi
	movl	$.LC32, %edx
	xorl	%eax, %eax
	movl	$8, %r12d
	addq	$4, %rbx
	call	snprintf
.L235:
	movl	(%rbx), %ecx
	movslq	%r12d, %rdi
	movl	$.LC32, %edx
	addq	0(%rbp), %rdi
	movl	$9, %esi
	xorl	%eax, %eax
	addl	$8, %r12d
	addq	$4, %rbx
	call	snprintf
.L234:
	movl	(%rbx), %ecx
	movslq	%r12d, %rdi
	movl	$.LC32, %edx
	addq	0(%rbp), %rdi
	movl	$9, %esi
	xorl	%eax, %eax
	addq	$4, %rbx
	addl	$8, %r12d
	call	snprintf
	cmpq	%r13, %rbx
	je	.L240
.L217:
	movl	(%rbx), %ecx
	movslq	%r12d, %rdi
	movl	$.LC32, %edx
	addq	0(%rbp), %rdi
	movl	$9, %esi
	xorl	%eax, %eax
	addq	$16, %rbx
	call	snprintf
	movl	-12(%rbx), %ecx
	leal	8(%r12), %edi
	xorl	%eax, %eax
	movl	$.LC32, %edx
	movl	$9, %esi
	movslq	%edi, %rdi
	addq	0(%rbp), %rdi
	call	snprintf
	leal	16(%r12), %edx
	movl	-8(%rbx), %ecx
	xorl	%eax, %eax
	movslq	%edx, %rdi
	movl	$9, %esi
	addq	0(%rbp), %rdi
	movl	$.LC32, %edx
	call	snprintf
	leal	24(%r12), %r8d
	movl	-4(%rbx), %ecx
	xorl	%eax, %eax
	movslq	%r8d, %rdi
	movl	$.LC32, %edx
	addq	0(%rbp), %rdi
	addl	$32, %r12d
	movl	$9, %esi
	call	snprintf
	cmpq	%r13, %rbx
	jne	.L217
.L240:
	movslq	%r12d, %r12
.L216:
	movq	0(%rbp), %rcx
	movb	$0, (%rcx,%r12)
	movq	0(%rbp), %r9
	cmpb	$48, (%r9)
	leaq	1(%r9), %r10
	jne	.L241
	.p2align 4
	.p2align 4
	.p2align 3
.L219:
	movq	%r10, 0(%rbp)
	addq	$1, %r10
	cmpb	$48, -1(%r10)
	je	.L219
.L241:
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
.L221:
	.cfi_restore_state
	xorl	%r12d, %r12d
	jmp	.L216
	.cfi_endproc
.LFE6649:
	.size	limb_get_str32, .-limb_get_str32
	.section	.rodata.str1.1
.LC33:
	.string	"*** Test Case %d ***\n"
	.section	.rodata.str1.8
	.align 8
.LC34:
	.string	"Time taken by Urdhva Tiryakbhyam: %f microseconds\n"
	.align 8
.LC35:
	.string	"Time taken by GMP: %f microseconds\n"
	.section	.rodata.str1.1
.LC36:
	.string	"Test failed"
	.section	.rodata.str1.8
	.align 8
.LC37:
	.string	"i: %d, expected: %c, result: %c\n"
	.section	.rodata.str1.1
.LC38:
	.string	"result: %s\n"
.LC39:
	.string	"expected: %s\n"
.LC40:
	.string	"passed"
.LC41:
	.string	"Test %s\n"
	.text
	.p2align 4
	.globl	test
	.type	test, @function
test:
.LFB6650:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$32, %edx
	movl	$64, %esi
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	xorl	%r15d, %r15d
	pushq	%r14
	leaq	-168(%rbp), %rdi
	pushq	%r13
	pushq	%r12
	pushq	%r10
	pushq	%rbx
	subq	$192, %rsp
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 10, -56
	.cfi_offset 3, -64
	call	posix_memalign
	testl	%eax, %eax
	jne	.L244
	movq	-168(%rbp), %r15
.L244:
	leaq	-176(%rbp), %rdi
	movl	$32, %edx
	movl	$64, %esi
	xorl	%r13d, %r13d
	call	posix_memalign
	testl	%eax, %eax
	jne	.L245
	movq	-176(%rbp), %r13
.L245:
	leaq	-184(%rbp), %rdi
	movl	$128, %edx
	movl	$64, %esi
	call	posix_memalign
	movq	$0, -200(%rbp)
	testl	%eax, %eax
	jne	.L246
	movq	-184(%rbp), %rax
	movq	%rax, -200(%rbp)
.L246:
	leaq	-160(%rbp), %rbx
	leaq	-144(%rbp), %r12
	movq	%rbx, %rdi
	call	__gmpz_init
	movq	%r12, %rdi
	call	__gmpz_init
	leaq	-128(%rbp), %rdi
	call	__gmpz_init
	movl	$65, %edi
	call	malloc
	movq	%rax, %r14
	movq	%rax, -192(%rbp)
	xorl	%eax, %eax
	call	initialize_perf
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$-1, %edx
	movl	$pe, %edi
	call	perf_event_open
	movq	-200(%rbp), %rdx
	movb	$0, 64(%r14)
	xorl	%edi, %edi
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqu64	%zmm1, (%r14)
	vmovdqa	%ymm0, (%r15)
	vmovdqa	%ymm0, 0(%r13)
	vmovdqa64	%zmm1, (%rdx)
	vmovdqa64	%zmm1, 64(%rdx)
	vzeroupper
	call	time
	xorl	%r14d, %r14d
	movl	%eax, %edi
	call	srand
	movl	$8, %esi
	movq	%r15, %rdi
	call	generate_random_numbers
	movl	$8, %esi
	movq	%r13, %rdi
	call	generate_random_numbers
.L247:
	movl	$32, %edx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	__gmpz_mul_2exp
	movl	(%r15,%r14), %edx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_mul_2exp
	movl	0(%r13,%r14), %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	__gmpz_mul_2exp
	movl	4(%r15,%r14), %edx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_mul_2exp
	movl	4(%r13,%r14), %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	__gmpz_mul_2exp
	movl	8(%r15,%r14), %edx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_mul_2exp
	movl	8(%r13,%r14), %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	__gmpz_mul_2exp
	movl	12(%r15,%r14), %edx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_mul_2exp
	movl	12(%r13,%r14), %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	addq	$16, %r14
	call	__gmpz_add_ui
	cmpq	$32, %r14
	jne	.L247
	movl	$1, %esi
	movl	$.LC33, %edi
	xorl	%eax, %eax
	call	printf
	movq	%r12, %rdx
	movq	%rbx, %rsi
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
	leaq	-128(%rbp), %rdx
	movl	$16, %esi
	xorl	%edi, %edi
	call	__gmpz_get_str
	movq	%rax, %r14
#APP
# 588 "test4.c" 1
	mfence
# 0 "" 2
#NO_APP
	xorl	%eax, %eax
	call	start_perf
	movq	-200(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	multiply
	xorl	%eax, %eax
	call	stop_perf
	leaq	-96(%rbp), %rdi
	call	read_perf
	movq	stdout(%rip), %rdi
	leaq	-96(%rbp), %rsi
	call	write_perf
	movq	-200(%rbp), %rdi
	movl	$16, %esi
	leaq	-192(%rbp), %rdx
	call	limb_get_str32
#APP
# 604 "test4.c" 1
	mfence
# 0 "" 2
#NO_APP
	xorl	%eax, %eax
	call	start_perf
	movq	-200(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	multiply
	movq	%r14, -240(%rbp)
	movq	$1, -208(%rbp)
	.p2align 4
	.p2align 3
.L253:
	leaq	-112(%rbp), %rsi
	movl	$4, %edi
	salq	-208(%rbp)
	xorl	%r14d, %r14d
	call	clock_gettime
	movq	-112(%rbp), %rcx
	movq	-104(%rbp), %rsi
	movq	-208(%rbp), %rdi
	movq	%rcx, -224(%rbp)
	movq	%rsi, -216(%rbp)
	testq	%rdi, %rdi
	jle	.L252
	movq	%rdi, %rax
	andl	$7, %eax
	je	.L405
	cmpq	$1, %rax
	je	.L354
	cmpq	$2, %rax
	je	.L355
	cmpq	$3, %rax
	je	.L356
	cmpq	$4, %rax
	je	.L357
	cmpq	$5, %rax
	je	.L358
	cmpq	$6, %rax
	je	.L359
	movq	-200(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	movl	$1, %r14d
	call	multiply
.L359:
	movq	-200(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	addq	$1, %r14
	call	multiply
.L358:
	movq	-200(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	addq	$1, %r14
	call	multiply
.L357:
	movq	-200(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	addq	$1, %r14
	call	multiply
.L356:
	movq	-200(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	addq	$1, %r14
	call	multiply
.L355:
	movq	-200(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	addq	$1, %r14
	call	multiply
.L354:
	movq	-200(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	addq	$1, %r14
	call	multiply
	movq	-208(%rbp), %r8
	cmpq	%r8, %r14
	je	.L252
.L405:
	movq	%r14, %r9
	movq	-200(%rbp), %r14
.L251:
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	movq	%r9, -232(%rbp)
	call	multiply
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	multiply
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	multiply
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	multiply
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	multiply
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	multiply
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	multiply
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	multiply
	movq	-232(%rbp), %r9
	movq	-208(%rbp), %r10
	addq	$8, %r9
	cmpq	%r10, %r9
	jne	.L251
.L252:
	leaq	-112(%rbp), %rsi
	movl	$4, %edi
	call	clock_gettime
	movq	-104(%rbp), %r11
	movq	-112(%rbp), %rdx
	movq	-224(%rbp), %rcx
	movq	-216(%rbp), %rsi
	movq	%r11, %rdi
	subq	%rcx, %rdx
	subq	%rsi, %rdi
	jns	.L250
	movq	-216(%rbp), %rax
	leaq	1000000000(%r11), %rdi
	subq	$1, %rdx
	subq	%rax, %rdi
.L250:
	imulq	$1000000000, %rdx, %r8
	addq	%r8, %rdi
	cmpq	$249999999, %rdi
	jle	.L253
	movabsq	$2361183241434822607, %rax
	vxorpd	%xmm2, %xmm2, %xmm2
	movq	-240(%rbp), %r15
	imulq	%rdi
	sarq	$63, %rdi
	xorl	%eax, %eax
	vcvtsi2sdq	-208(%rbp), %xmm2, %xmm4
	sarq	$7, %rdx
	subq	%rdi, %rdx
	vcvtsi2sdq	%rdx, %xmm2, %xmm3
	vdivsd	%xmm4, %xmm3, %xmm5
	vmovsd	%xmm5, -200(%rbp)
	call	stop_perf
	movl	$.LC34, %edi
	movl	$1, %eax
	vmovsd	-200(%rbp), %xmm0
	call	printf
	leaq	-96(%rbp), %rdi
	call	read_perf
	movq	stdout(%rip), %rdi
	leaq	-96(%rbp), %rsi
	call	write_perf
#APP
# 613 "test4.c" 1
	mfence
# 0 "" 2
#NO_APP
	movq	%r12, %rdx
	movq	%rbx, %rsi
	leaq	-128(%rbp), %rdi
	movl	$1, %r13d
	call	__gmpz_mul
	movq	%r15, -208(%rbp)
	.p2align 4
	.p2align 3
.L259:
	leaq	-112(%rbp), %rsi
	movl	$4, %edi
	addq	%r13, %r13
	xorl	%r15d, %r15d
	call	clock_gettime
	movq	-112(%rbp), %r14
	movq	%r14, -200(%rbp)
	movq	-104(%rbp), %r14
	testq	%r13, %r13
	jle	.L258
	movq	%r13, %r9
	andl	$6, %r9d
	je	.L257
	cmpq	$1, %r9
	je	.L361
	cmpq	$2, %r9
	je	.L362
	cmpq	$3, %r9
	je	.L363
	cmpq	$4, %r9
	je	.L364
	cmpq	$5, %r9
	je	.L365
	cmpq	$6, %r9
	je	.L366
	movq	%r12, %rdx
	movq	%rbx, %rsi
	leaq	-128(%rbp), %rdi
	movl	$1, %r15d
	call	__gmpz_mul
.L366:
	movq	%r12, %rdx
	movq	%rbx, %rsi
	leaq	-128(%rbp), %rdi
	addq	$1, %r15
	call	__gmpz_mul
.L365:
	movq	%r12, %rdx
	movq	%rbx, %rsi
	leaq	-128(%rbp), %rdi
	addq	$1, %r15
	call	__gmpz_mul
.L364:
	movq	%r12, %rdx
	movq	%rbx, %rsi
	leaq	-128(%rbp), %rdi
	addq	$1, %r15
	call	__gmpz_mul
.L363:
	movq	%r12, %rdx
	movq	%rbx, %rsi
	leaq	-128(%rbp), %rdi
	addq	$1, %r15
	call	__gmpz_mul
.L362:
	movq	%r12, %rdx
	movq	%rbx, %rsi
	leaq	-128(%rbp), %rdi
	addq	$1, %r15
	call	__gmpz_mul
.L361:
	movq	%r12, %rdx
	movq	%rbx, %rsi
	leaq	-128(%rbp), %rdi
	addq	$1, %r15
	call	__gmpz_mul
	cmpq	%r15, %r13
	je	.L258
.L257:
	movq	%r12, %rdx
	movq	%rbx, %rsi
	leaq	-128(%rbp), %rdi
	addq	$8, %r15
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%rbx, %rsi
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%rbx, %rsi
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%rbx, %rsi
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%rbx, %rsi
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%rbx, %rsi
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%rbx, %rsi
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%rbx, %rsi
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
	cmpq	%r15, %r13
	jne	.L257
.L258:
	leaq	-112(%rbp), %rsi
	movl	$4, %edi
	call	clock_gettime
	movq	-104(%rbp), %r10
	movq	-112(%rbp), %r11
	movq	-200(%rbp), %rcx
	movq	%r10, %rsi
	subq	%rcx, %r11
	subq	%r14, %rsi
	jns	.L256
	leaq	1000000000(%r10), %rsi
	subq	$1, %r11
	subq	%r14, %rsi
.L256:
	imulq	$1000000000, %r11, %rdi
	addq	%rdi, %rsi
	cmpq	$249999999, %rsi
	jle	.L259
	vxorpd	%xmm6, %xmm6, %xmm6
	movq	-208(%rbp), %r14
	movl	$.LC35, %edi
	xorl	%ebx, %ebx
	movabsq	$2361183241434822607, %rax
	vcvtsi2sdq	%r13, %xmm6, %xmm8
	imulq	%rsi
	sarq	$63, %rsi
	movl	$1, %eax
	sarq	$7, %rdx
	subq	%rsi, %rdx
	vcvtsi2sdq	%rdx, %xmm6, %xmm7
	vdivsd	%xmm8, %xmm7, %xmm0
	call	printf
	movq	%r14, %rdi
	call	strlen
	movq	-192(%rbp), %r12
	movq	%rax, %r13
	movq	%rax, %r8
	andl	$7, %r13d
	je	.L260
	movzbl	(%r12), %r9d
	cmpb	%r9b, (%r14)
	jne	.L396
	movl	$1, %ebx
	cmpq	$1, %r13
	je	.L260
	cmpq	$2, %r13
	je	.L367
	cmpq	$3, %r13
	je	.L368
	cmpq	$4, %r13
	je	.L369
	cmpq	$5, %r13
	je	.L370
	cmpq	$6, %r13
	jne	.L408
.L371:
	movzbl	(%r12,%rbx), %ecx
	leaq	1(%rbx), %r11
	cmpb	%cl, (%r14,%rbx)
	jne	.L396
	movq	%r11, %rbx
.L370:
	movzbl	(%r12,%rbx), %edi
	leaq	1(%rbx), %rsi
	cmpb	%dil, (%r14,%rbx)
	jne	.L396
	movq	%rsi, %rbx
.L369:
	movzbl	(%r12,%rbx), %edx
	leaq	1(%rbx), %rax
	cmpb	%dl, (%r14,%rbx)
	jne	.L396
	movq	%rax, %rbx
.L368:
	movzbl	(%r12,%rbx), %r9d
	leaq	1(%rbx), %r13
	cmpb	%r9b, (%r14,%rbx)
	jne	.L396
	movq	%r13, %rbx
.L367:
	movzbl	(%r12,%rbx), %r10d
	leaq	1(%rbx), %r15
	cmpb	%r10b, (%r14,%rbx)
	jne	.L396
	movq	%r15, %rbx
	cmpq	%rbx, %r8
	je	.L409
.L261:
	movzbl	(%r12,%rbx), %ecx
	leaq	1(%rbx), %r11
	cmpb	%cl, (%r14,%rbx)
	jne	.L396
	movzbl	(%r12,%r11), %esi
	movq	%r11, %rbx
	leaq	1(%r11), %rdi
	cmpb	%sil, (%r14,%r11)
	jne	.L396
	movzbl	(%r12,%rdi), %eax
	movq	%rdi, %rbx
	cmpb	%al, (%r14,%rdi)
	jne	.L396
	movzbl	2(%r12,%r11), %r13d
	leaq	2(%r11), %rbx
	leaq	3(%r11), %rdx
	cmpb	%r13b, 2(%r14,%r11)
	jne	.L396
	movzbl	3(%r12,%r11), %r15d
	movq	%rdx, %rbx
	leaq	4(%r11), %r9
	cmpb	%r15b, 3(%r14,%r11)
	jne	.L396
	movzbl	4(%r12,%r11), %ecx
	movq	%r9, %rbx
	leaq	5(%r11), %r10
	cmpb	%cl, 4(%r14,%r11)
	jne	.L396
	movzbl	5(%r12,%r11), %esi
	movq	%r10, %rbx
	leaq	6(%r11), %rdi
	cmpb	%sil, 5(%r14,%r11)
	jne	.L396
	movzbl	6(%r12,%r11), %edx
	movq	%rdi, %rbx
	leaq	7(%r11), %rax
	cmpb	%dl, 6(%r14,%r11)
	jne	.L396
	movq	%rax, %rbx
.L260:
	cmpq	%rbx, %r8
	jne	.L261
.L409:
	movl	$.LC40, %esi
	movl	$.LC41, %edi
	xorl	%eax, %eax
	call	printf
	addq	$192, %rsp
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
.L408:
	.cfi_restore_state
	movl	$2, %r15d
	movzbl	-1(%r12,%r15), %r10d
	cmpb	%r10b, (%r14,%rbx)
	jne	.L396
	movq	%r15, %rbx
	jmp	.L371
.L396:
	movl	$.LC36, %edi
	call	puts
	movsbl	(%r12,%rbx), %ecx
	movl	%ebx, %esi
	xorl	%eax, %eax
	movsbl	(%r14,%rbx), %edx
	movl	$.LC37, %edi
	call	printf
	movq	%r12, %rsi
	movl	$.LC38, %edi
	xorl	%eax, %eax
	call	printf
	movl	$.LC39, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6650:
	.size	test, .-test
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB6651:
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
.LFE6651:
	.size	main, .-main
	.section	.rodata
	.align 64
.LC16:
	.quad	0
	.quad	0
	.quad	1
	.quad	0
	.quad	1
	.quad	2
	.quad	0
	.quad	1
	.align 64
.LC17:
	.quad	0
	.quad	1
	.quad	0
	.quad	2
	.quad	1
	.quad	0
	.quad	3
	.quad	2
	.align 64
.LC18:
	.quad	2
	.quad	3
	.quad	0
	.quad	1
	.quad	2
	.quad	3
	.quad	4
	.quad	0
	.align 64
.LC19:
	.quad	1
	.quad	0
	.quad	4
	.quad	3
	.quad	2
	.quad	1
	.quad	0
	.quad	5
	.align 64
.LC20:
	.quad	1
	.quad	2
	.quad	3
	.quad	4
	.quad	5
	.quad	0
	.quad	1
	.quad	2
	.align 64
.LC21:
	.quad	4
	.quad	3
	.quad	2
	.quad	1
	.quad	0
	.quad	6
	.quad	5
	.quad	4
	.align 64
.LC22:
	.quad	3
	.quad	4
	.quad	5
	.quad	6
	.quad	0
	.quad	1
	.quad	2
	.quad	3
	.align 64
.LC23:
	.quad	3
	.quad	2
	.quad	1
	.quad	0
	.quad	7
	.quad	6
	.quad	5
	.quad	4
	.align 64
.LC24:
	.quad	4
	.quad	5
	.quad	6
	.quad	7
	.quad	1
	.quad	2
	.quad	3
	.quad	4
	.align 64
.LC25:
	.quad	5
	.quad	6
	.quad	7
	.quad	2
	.quad	3
	.quad	4
	.quad	5
	.quad	6
	.align 64
.LC26:
	.quad	3
	.quad	2
	.quad	1
	.quad	7
	.quad	6
	.quad	5
	.quad	4
	.quad	3
	.align 64
.LC27:
	.quad	7
	.quad	3
	.quad	4
	.quad	5
	.quad	6
	.quad	7
	.quad	4
	.quad	5
	.align 64
.LC28:
	.quad	2
	.quad	7
	.quad	6
	.quad	5
	.quad	4
	.quad	3
	.quad	7
	.quad	6
	.align 64
.LC29:
	.quad	6
	.quad	7
	.quad	5
	.quad	6
	.quad	7
	.quad	6
	.quad	7
	.quad	7
	.align 64
.LC30:
	.quad	5
	.quad	4
	.quad	7
	.quad	6
	.quad	5
	.quad	7
	.quad	6
	.quad	7
	.ident	"GCC: (GNU) 14.2.1 20250110 (Red Hat 14.2.1-7)"
	.section	.note.GNU-stack,"",@progbits
