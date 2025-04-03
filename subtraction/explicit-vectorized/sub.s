	.file	"sub.c"
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
	.string	"Error reading header line"
	.section	.text.unlikely,"ax",@progbits
	.type	skip_first_line.part.0, @function
skip_first_line.part.0:
.LFB6840:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movl	$.LC1, %edi
	call	perror
	movq	%rbx, %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6840:
	.size	skip_first_line.part.0, .-skip_first_line.part.0
	.section	.rodata.str1.1
.LC2:
	.string	"/dev/urandom"
.LC3:
	.string	"Error opening /dev/urandom"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"Error reading from /dev/urandom"
	.section	.text.unlikely
.LCOLDB5:
	.text
.LHOTB5:
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
	movl	$.LC2, %edi
	call	open
	cmpl	$-1, %eax
	je	.L9
	leaq	8(%rsp), %rsi
	movl	$8, %edx
	movl	%eax, %edi
	movl	%eax, %ebx
	call	read
	cmpq	$8, %rax
	jne	.L10
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
	movslq	%edx, %rdx
	addq	$48, %rsp
	.cfi_def_cfa_offset 16
	xorq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	xorq	%rdx, %rax
	ret
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	generate_seed.cold, @function
generate_seed.cold:
.LFSB6820:
.L9:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -16
	movl	$.LC3, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L10:
	movl	$.LC4, %edi
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
.LCOLDE5:
	.text
.LHOTE5:
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
	jmp	.L13
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L14:
	addq	$1, %rbx
.L13:
	movsbq	(%rbx), %rax
	cmpb	$48, %al
	je	.L14
	testb	$32, 1(%rdx,%rax,2)
	jne	.L14
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
	je	.L24
	leaq	-1(%rbx,%rax), %rax
	cmpb	$10, (%rax)
	je	.L26
.L24:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L26:
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
.LC6:
	.string	"The two sums are not equal, lengths are different"
	.align 8
.LC7:
	.string	"Length of result = %ld, length of result_gmp = %ld\n"
	.section	.rodata.str1.1
.LC8:
	.string	"result = %s\n result_gmp = %s\n"
.LC9:
	.string	"The two sums are not equal"
.LC10:
	.string	"Mismatch at index %ld\n"
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"result[%ld] = %c, result_gmp[%ld] = %c\n"
	.section	.rodata.str1.1
.LC12:
	.string	"result = %s\nresult_gmp = %s\n"
	.section	.rodata.str1.8
	.align 8
.LC13:
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
	movslq	%edx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movzbl	(%rdi), %r13d
	movzbl	(%rsi), %r12d
	cmpb	$45, %r13b
	sete	%al
	addq	%rax, %rbx
	xorl	%eax, %eax
	cmpb	$45, %r12b
	sete	%al
	addq	%rax, %rbp
	call	__ctype_b_loc
	movq	(%rax), %rdx
	jmp	.L30
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L31:
	addq	$1, %rbx
.L30:
	movsbq	(%rbx), %rax
	cmpb	$48, %al
	je	.L31
	testb	$32, 1(%rdx,%rax,2)
	jne	.L31
	movsbq	0(%rbp), %rax
	cmpb	$48, %al
	jne	.L65
	.p2align 4
	.p2align 4
	.p2align 3
.L33:
	movsbq	1(%rbp), %rax
	addq	$1, %rbp
	cmpb	$48, %al
	je	.L33
.L65:
	testb	$32, 1(%rdx,%rax,2)
	jne	.L33
	movq	%rbx, %rdi
	call	strlen
	testq	%rax, %rax
	je	.L34
	leaq	-1(%rbx,%rax), %rax
	cmpb	$10, (%rax)
	je	.L66
.L34:
	movq	%rbp, %rdi
	call	strlen
	testq	%rax, %rax
	je	.L35
	leaq	-1(%rbp,%rax), %rax
	cmpb	$10, (%rax)
	je	.L67
.L35:
	testl	%r14d, %r14d
	jle	.L40
	call	__ctype_tolower_loc
	xorl	%edx, %edx
	.p2align 6
	.p2align 4
	.p2align 3
.L39:
	movsbq	(%rbx,%rdx), %rsi
	movq	(%rax), %rcx
	movl	(%rcx,%rsi,4), %ecx
	movb	%cl, (%rbx,%rdx)
	movsbq	0(%rbp,%rdx), %rsi
	movq	(%rax), %rcx
	movl	(%rcx,%rsi,4), %ecx
	movb	%cl, 0(%rbp,%rdx)
	addq	$1, %rdx
	cmpq	%r14, %rdx
	jne	.L39
.L40:
	movq	%rbx, %rdi
	call	strlen
	movq	%rbp, %rdi
	movq	%rax, %r15
	call	strlen
	cmpq	%rax, %r15
	jne	.L68
	xorl	%r14d, %r14d
	testq	%r15, %r15
	jne	.L41
	jmp	.L42
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L44:
	addq	$1, %r14
	cmpq	%r15, %r14
	je	.L42
.L41:
	movzbl	0(%rbp,%r14), %eax
	cmpb	%al, (%rbx,%r14)
	je	.L44
	movl	$.LC9, %edi
	call	puts
	movq	%r14, %rsi
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	printf
	movsbl	(%rbx,%r14), %edx
	movq	%r14, %rsi
	movq	%r14, %rcx
	movsbl	0(%rbp,%r14), %r8d
	movl	$.LC11, %edi
	xorl	%eax, %eax
	call	printf
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movl	$.LC12, %edi
	xorl	%eax, %eax
	call	printf
.L43:
	xorl	%eax, %eax
.L27:
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
.L42:
	.cfi_restore_state
	cmpb	$45, %r13b
	movl	$1, %eax
	sete	%cl
	cmpb	$45, %r12b
	sete	%dl
	cmpb	%dl, %cl
	je	.L27
	movl	$.LC13, %edi
	call	puts
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L68:
	movl	$.LC6, %edi
	call	puts
	movq	%rbp, %rdi
	call	strlen
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	strlen
	movq	%r12, %rdx
	movl	$.LC7, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	printf
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movl	$.LC8, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L67:
	movb	$0, (%rax)
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L66:
	movb	$0, (%rax)
	jmp	.L34
	.cfi_endproc
.LFE6823:
	.size	check_result, .-check_result
	.section	.rodata.str1.8
	.align 8
.LC14:
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
	jne	.L74
	cmpb	$0, 1(%rax)
	jne	.L74
.L71:
	movq	%rbp, %rdi
	call	free
	movl	$511, %esi
	movq	%rbx, %rdi
	call	mkdir
	testl	%eax, %eax
	je	.L88
	call	__errno_location
	movl	(%rax), %edi
	cmpl	$17, %edi
	jne	.L90
.L88:
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
.L74:
	.cfi_restore_state
	cmpl	$47, %edx
	je	.L91
.L75:
	movq	%rax, %rdi
	call	create_directory
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L91:
	cmpb	$0, 1(%rax)
	je	.L71
	jmp	.L75
.L90:
	call	strerror
	movq	stderr(%rip), %rdi
	movq	%rbx, %rdx
	movl	$.LC14, %esi
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
	je	.L95
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L95:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	open_gzfile.part.0
	.cfi_endproc
.LFE6825:
	.size	open_gzfile, .-open_gzfile
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
	je	.L98
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
.L98:
	.cfi_def_cfa_offset 655376
	.cfi_offset 3, -16
	movq	%rbx, %rdi
	call	skip_first_line.part.0
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
	.globl	limb_t_sub_n_256
	.type	limb_t_sub_n_256, @function
limb_t_sub_n_256:
.LFB6832:
	.cfi_startproc
	movq	%rdx, %rax
	movq	(%rsi), %rdx
	movq	(%rax), %rax
	movq	(%rdx), %rcx
	movq	(%rax), %rsi
	cmpq	%rcx, %rsi
	jnb	.L111
.L102:
	vmovdqa	(%rdx), %ymm0
	vmovdqa	(%rax), %ymm1
	movl	$1, %edx
	vmovdqa	AVX256_ZEROS(%rip), %ymm2
	vpcmpuq	$6, %ymm0, %ymm1, %k0
	kmovw	%k0, %eax
	shrb	%al
	kmovw	%eax, %k1
	vpbroadcastq	%rdx, %ymm2{%k1}
	movq	(%rdi), %rdx
	vpsubq	%ymm2, %ymm0, %ymm0
	vpsubq	%ymm1, %ymm0, %ymm0
	vpcmpuq	$1, %ymm0, %ymm0, %k2
	vmovdqa	%ymm0, (%rdx)
	kmovw	%k2, %eax
	testb	%al, %al
	jne	.L112
	vzeroupper
	ret
	.p2align 4,,10
	.p2align 3
.L112:
	shrb	%al
	movq	(%rdi), %r8
	movl	$6, %ecx
	movzbl	%al, %edx
	xorl	%eax, %eax
	.p2align 6
	.p2align 4
	.p2align 3
.L106:
	movq	(%r8,%rcx,8), %rdi
	movl	%eax, %esi
	movq	%rdi, %rax
	subq	%rsi, %rax
	movl	%edx, %esi
	sarl	%cl, %esi
	movslq	%esi, %rsi
	subq	%rsi, %rax
	cmpq	%rax, %rdi
	movq	%rax, (%r8,%rcx,8)
	setb	%al
	movzbl	%al, %eax
	subq	$1, %rcx
	jnb	.L106
	vzeroupper
	ret
	.p2align 4,,10
	.p2align 3
.L111:
	movl	$8, %r8d
.L104:
	cmpq	%rsi, %rcx
	jb	.L113
	movq	(%rdx,%r8), %rcx
	addq	$8, %r8
	movq	-8(%rax,%r8), %rsi
	cmpq	%rcx, %rsi
	jb	.L102
	jmp	.L104
.L113:
	movq	%rdx, %rcx
	movb	$1, 8(%rdi)
	movq	%rax, %rdx
	movq	%rcx, %rax
	jmp	.L102
	.cfi_endproc
.LFE6832:
	.size	limb_t_sub_n_256, .-limb_t_sub_n_256
	.p2align 4
	.globl	__sub_n
	.type	__sub_n, @function
__sub_n:
.LFB6833:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdx, %rax
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	(%rsi), %r8
	movq	(%rax), %r9
	movq	16(%rsi), %rcx
	movq	(%r8), %rdx
	movq	(%rdi), %rbx
	movq	(%r9), %rax
	cmpq	%rdx, %rax
	jnb	.L136
.L115:
	subl	$8, %ecx
	movl	$0, %edx
	movl	$1, %r12d
	movslq	%ecx, %rax
	jns	.L124
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L126:
	kmovw	%k0, %edx
.L124:
	vmovdqa64	(%r9,%rax,8), %zmm0
	vmovdqa64	(%r8,%rax,8), %zmm2
	sall	$7, %edx
	kmovw	%edx, %k2
	vpcmpuq	$6, %zmm2, %zmm0, %k0
	vpsubq	%zmm0, %zmm2, %zmm1
	vmovdqa64	AVX512_ZEROS(%rip), %zmm0
	kshiftrw	$1, %k0, %k1
	korw	%k2, %k1, %k1
	vpbroadcastq	%r12, %zmm0{%k1}
	vpsubq	%zmm0, %zmm1, %zmm0
	vpcmpuq	$6, %zmm1, %zmm0, %k3
	vmovdqa64	%zmm0, (%rbx,%rax,8)
	kmovw	%k3, %esi
	testb	%sil, %sil
	jne	.L137
.L122:
	subq	$8, %rax
	testl	%eax, %eax
	jns	.L126
	vzeroupper
.L134:
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L137:
	.cfi_restore_state
	shrl	%esi
	leaq	96(%rbx), %r10
	movl	$6, %ecx
	xorl	%edx, %edx
	andl	$127, %esi
	.p2align 6
	.p2align 4
	.p2align 3
.L123:
	movq	(%r10), %r11
	movl	%edx, %edi
	movq	%r11, %rdx
	subq	%rdi, %rdx
	movl	%esi, %edi
	sarl	%cl, %edi
	movslq	%edi, %rdi
	subq	%rdi, %rdx
	cmpq	%rdx, %r11
	movq	%rdx, (%r10)
	setb	%dil
	setb	%dl
	subl	$1, %ecx
	subq	$16, %r10
	movzbl	%dl, %edx
	cmpl	$-1, %ecx
	jne	.L123
	movzbl	%dil, %edi
	kmovw	%edi, %k4
	korw	%k4, %k0, %k0
	jmp	.L122
	.p2align 4,,10
	.p2align 3
.L136:
	cmpq	%rax, %rdx
	jb	.L116
	cmpl	$1, %ecx
	je	.L117
	movl	$8, %eax
.L118:
	movq	(%r8,%rax), %rdx
	movq	(%r9,%rax), %rsi
	cmpq	%rdx, %rsi
	jb	.L115
	addq	$8, %rax
	cmpq	%rsi, %rdx
	jnb	.L118
.L116:
	movq	%r8, %rax
	movb	$1, 8(%rdi)
	movq	%r9, %r8
	movq	%rax, %r9
	jmp	.L115
.L117:
	movq	$1, 16(%rdi)
	movq	$0, (%rbx)
	jmp	.L134
	.cfi_endproc
.LFE6833:
	.size	__sub_n, .-__sub_n
	.p2align 4
	.globl	limb_t_sub_n
	.type	limb_t_sub_n, @function
limb_t_sub_n:
.LFB6834:
	.cfi_startproc
	cmpl	$4, 16(%rsi)
	jg	.L139
	jmp	limb_t_sub_n_256
	.p2align 4,,10
	.p2align 3
.L139:
	jmp	__sub_n
	.cfi_endproc
.LFE6834:
	.size	limb_t_sub_n, .-limb_t_sub_n
	.section	.rodata.str1.1
.LC16:
	.string	"Running perf test"
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"../test/cases/%d/random.csv.gz"
	.section	.rodata.str1.1
.LC18:
	.string	"rb"
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"Iteration %d, reading test case %d\n"
	.section	.rodata.str1.1
.LC20:
	.string	"Error reading line"
.LC21:
	.string	","
.LC22:
	.string	"Error parsing line: %s\n"
.LC23:
	.string	"n = %d\n"
.LC24:
	.string	"Perf overhead: "
.LC25:
	.string	"Starting perf test"
.LC26:
	.string	"User instructions: %lld\n"
.LC27:
	.string	"L1D Cache Reads: %lld\n"
.LC28:
	.string	"L1D Cache Misses: %lld\n"
.LC30:
	.string	"L1D Cache Miss %: %f\n"
.LC31:
	.string	"Avg. RDTSC Ticks: %f\n"
	.section	.text.unlikely
.LCOLDB32:
	.text
.LHOTB32:
	.p2align 4
	.globl	run_perf_test
	.type	run_perf_test, @function
run_perf_test:
.LFB6836:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$.LC16, %edi
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
	subq	$655592, %rsp
	.cfi_def_cfa_offset 655648
	call	puts
	leaq	112(%rsp), %rbx
	movl	NUM_BITS(%rip), %ecx
	xorl	%eax, %eax
	movl	$100, %esi
	movq	%rbx, %rdi
	movl	$.LC17, %edx
	call	snprintf
	movl	$.LC18, %esi
	movq	%rbx, %rdi
	call	gzopen
	testq	%rax, %rax
	je	.L173
	leaq	224(%rsp), %rbp
	movl	$655360, %edx
	movq	%rax, %rdi
	movq	%rax, %r15
	movq	%rbp, %rsi
	call	gzgets
	testq	%rax, %rax
	je	.L169
	xorl	%edi, %edi
	call	time
	movl	%eax, %edi
	call	srand
	call	rand
	xorl	%esi, %esi
	movl	$.LC19, %edi
	movslq	%eax, %r12
	cltd
	imulq	$351843721, %r12, %r12
	sarq	$45, %r12
	subl	%edx, %r12d
	imull	$100000, %r12d, %edx
	subl	%edx, %eax
	movl	%eax, %edx
	movl	%eax, %r12d
	xorl	%eax, %eax
	call	printf
	movq	%r15, %rdi
	call	gzrewind
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L169
	testl	%r12d, %r12d
	jle	.L144
	xorl	%ebx, %ebx
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L145:
	addl	$1, %ebx
	cmpl	%ebx, %r12d
	je	.L144
.L147:
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%rbp, %rdi
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	gzgets
	testq	%rax, %rax
	jne	.L145
	movq	%r15, %rdi
	call	gzeof
	testl	%eax, %eax
	je	.L170
.L171:
	addq	$655592, %rsp
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
.L144:
	.cfi_restore_state
	movl	$.LC21, %esi
	movq	%rbp, %rdi
	call	strtok
	xorl	%edi, %edi
	movl	$.LC21, %esi
	movq	%rax, %r12
	call	strtok
	xorl	%edi, %edi
	movl	$.LC21, %esi
	movq	%rax, %rbx
	call	strtok
	testq	%r12, %r12
	sete	%dl
	testq	%rbx, %rbx
	sete	%cl
	orb	%cl, %dl
	jne	.L163
	testq	%rax, %rax
	je	.L163
	movq	%r12, %rdi
	call	limb_set_str
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	limb_set_str
	movq	%r13, %rdi
	movq	%rax, %rsi
	movq	%rax, %rbp
	call	limb_t_adjust_limb_sizes
	movq	16(%r13), %rbx
	movl	$.LC23, %edi
	xorl	%eax, %eax
	movl	%ebx, %esi
	call	printf
	movslq	%ebx, %rdi
	call	limb_t_alloc
	cmpl	$4, 16(%r13)
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rax, %r14
	movq	%rax, %rdi
	jle	.L174
	call	__sub_n
.L151:
	xorl	%eax, %eax
	leaq	16(%rsp), %r12
	call	initialize_perf
	xorl	%eax, %eax
	call	start_perf
	xorl	%eax, %eax
	call	stop_perf
	movq	%r12, %rdi
	call	read_perf
	movl	$.LC24, %edi
	call	puts
	movq	stdout(%rip), %rdi
	movq	%r12, %rsi
	call	write_perf
	testl	%ebx, %ebx
	jle	.L152
	leal	-1(%rbx), %ecx
	movq	%r13, %rax
	movq	%rbp, %rdx
	shrl	$6, %ecx
	salq	$6, %rcx
	leaq	64(%r13,%rcx), %rcx
	.p2align 5
	.p2align 4
	.p2align 3
.L153:
	clflush	(%rax)
	clflush	(%rdx)
	addq	$64, %rax
	addq	$64, %rdx
	cmpq	%rax, %rcx
	jne	.L153
.L152:
	mfence
	movl	$.LC25, %edi
	call	puts
	xorl	%eax, %eax
	call	start_perf
	cmpl	$4, 16(%r13)
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	jg	.L154
	call	limb_t_sub_n_256
.L155:
	xorl	%eax, %eax
	leaq	64(%rsp), %rbx
	call	stop_perf
	movq	%rbx, %rdi
	call	read_perf
	movq	stdout(%rip), %rdi
	movq	%rbx, %rsi
	call	write_perf
	movq	72(%rsp), %rsi
	movl	$.LC26, %edi
	xorl	%eax, %eax
	subq	24(%rsp), %rsi
	call	printf
	movq	96(%rsp), %rsi
	movl	$.LC27, %edi
	xorl	%eax, %eax
	subq	48(%rsp), %rsi
	call	printf
	movq	104(%rsp), %rsi
	movl	$.LC28, %edi
	xorl	%eax, %eax
	subq	56(%rsp), %rsi
	call	printf
	vxorpd	%xmm2, %xmm2, %xmm2
	movq	104(%rsp), %rax
	subq	56(%rsp), %rax
	vcvtsi2sdq	%rax, %xmm2, %xmm0
	movq	96(%rsp), %rax
	subq	48(%rsp), %rax
	movl	$.LC30, %edi
	vcvtsi2sdq	%rax, %xmm2, %xmm1
	movl	$1, %eax
	vdivsd	%xmm1, %xmm0, %xmm0
	vmulsd	.LC29(%rip), %xmm0, %xmm0
	call	printf
	cmpl	$4, 16(%rbp)
	movq	%r14, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	jg	.L156
	call	limb_t_sub_n_256
.L157:
	movl	$1, %r12d
	.p2align 4
	.p2align 3
.L162:
	addq	%r12, %r12
#APP
# 232 "../myutils.h" 1
	CPUID
	RDTSC
	mov %edx, %edi
	mov %eax, %esi
	
# 0 "" 2
#NO_APP
	salq	$32, %rdi
	movl	%esi, %esi
	orq	%rsi, %rdi
	movq	%rdi, 8(%rsp)
	testq	%r12, %r12
	jle	.L158
	xorl	%ebx, %ebx
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L175:
	call	limb_t_sub_n_256
	addq	$1, %rbx
	cmpq	%rbx, %r12
	je	.L158
.L161:
	cmpl	$4, 16(%rbp)
	movq	%r14, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	jle	.L175
	call	__sub_n
	addq	$1, %rbx
	cmpq	%rbx, %r12
	jne	.L161
.L158:
#APP
# 245 "../myutils.h" 1
	RDTSCP
	mov %edx, %esi
	mov %eax, %edi
	CPUID
	
# 0 "" 2
#NO_APP
	movq	%rsi, %rax
	movq	8(%rsp), %rcx
	movl	%edi, %edi
	salq	$32, %rax
	orq	%rdi, %rax
	subq	%rcx, %rax
	cmpq	$699999999, %rax
	jle	.L162
	vxorpd	%xmm3, %xmm3, %xmm3
	movl	$.LC31, %edi
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	movl	$1, %eax
	vcvtsi2sdq	%r12, %xmm3, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	call	printf
	movq	%r15, %rdi
	call	gzclose
	jmp	.L171
.L174:
	call	limb_t_sub_n_256
	jmp	.L151
.L156:
	call	__sub_n
	jmp	.L157
.L154:
	call	__sub_n
	jmp	.L155
.L163:
	movq	stderr(%rip), %rdi
	movq	%rbp, %rdx
	movl	$.LC22, %esi
	xorl	%eax, %eax
	call	fprintf
	movq	%r15, %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
.L173:
	movq	%rbx, %rdi
	call	open_gzfile.part.0
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	run_perf_test.cold, @function
run_perf_test.cold:
.LFSB6836:
.L169:
	.cfi_def_cfa_offset 655648
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	%r15, %rdi
	call	skip_first_line.part.0
.L170:
	movl	$.LC20, %edi
	call	perror
	movq	%r15, %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6836:
	.text
	.size	run_perf_test, .-run_perf_test
	.section	.text.unlikely
	.size	run_perf_test.cold, .-run_perf_test.cold
.LCOLDE32:
	.text
.LHOTE32:
	.section	.rodata.str1.8
	.align 8
.LC33:
	.string	"Trying to run correctness test"
	.section	.rodata.str1.1
.LC34:
	.string	"experiments/results"
	.section	.rodata.str1.8
	.align 8
.LC35:
	.string	"Running random test cases for bit-size %d on core %d\n"
	.align 8
.LC36:
	.string	"Running equal test cases for bit-size %d on core %d\n"
	.section	.rodata.str1.1
.LC37:
	.string	"../test/cases/%d/equal.csv.gz"
	.section	.rodata.str1.8
	.align 8
.LC38:
	.string	"Running greater test cases for bit-size %d on core %d\n"
	.align 8
.LC39:
	.string	"../test/cases/%d/greater.csv.gz"
	.align 8
.LC40:
	.string	"Running smaller test cases for bit-size %d on core %d\n"
	.align 8
.LC41:
	.string	"../test/cases/%d/smaller.csv.gz"
	.section	.rodata.str1.1
.LC42:
	.string	"Invalid test case"
	.section	.rodata.str1.8
	.align 8
.LC43:
	.string	"Test case failed, at iteration %d\n"
	.align 8
.LC44:
	.string	"Random test cases passed for bit-size %d\n"
	.align 8
.LC45:
	.string	"Equal test cases passed for bit-size %d\n"
	.align 8
.LC46:
	.string	"Greater test cases passed for bit-size %d\n"
	.align 8
.LC47:
	.string	"Smaller test cases passed for bit-size %d\n"
	.section	.text.unlikely
.LCOLDB48:
	.text
.LHOTB48:
	.p2align 4
	.globl	run_correctness_test
	.type	run_correctness_test, @function
run_correctness_test:
.LFB6837:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edi, %r14d
	movl	$.LC33, %edi
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
	movl	$.LC34, %edi
	call	create_directory
	cmpl	$2, %r14d
	je	.L177
	jg	.L178
	testl	%r14d, %r14d
	je	.L179
	cmpl	$1, %r14d
	jne	.L181
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC36, %edi
	xorl	%eax, %eax
	leaq	32(%rsp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC37, %edx
	movl	$100, %esi
	call	snprintf
	jmp	.L183
	.p2align 4,,10
	.p2align 3
.L179:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC35, %edi
	xorl	%eax, %eax
	leaq	32(%rsp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC17, %edx
	movl	$100, %esi
	call	snprintf
.L183:
	movl	$.LC18, %esi
	movq	%rbx, %rdi
	call	gzopen
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L240
	movl	$655360, %edx
	leaq	144(%rsp), %rsi
	movq	%rax, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L234
	movl	$0, 12(%rsp)
	movq	%r15, 16(%rsp)
	movl	%r14d, 28(%rsp)
.L210:
	movq	16(%rsp), %rdi
	movl	$655360, %edx
	leaq	144(%rsp), %rsi
	call	gzgets
	testq	%rax, %rax
	je	.L241
	movl	$.LC21, %esi
	leaq	144(%rsp), %rdi
	call	strtok
	xorl	%edi, %edi
	movl	$.LC21, %esi
	movq	%rax, %rbx
	call	strtok
	xorl	%edi, %edi
	movl	$.LC21, %esi
	movq	%rax, %rbp
	call	strtok
	testq	%rbx, %rbx
	movq	%rax, %r12
	sete	%al
	testq	%rbp, %rbp
	sete	%dl
	orb	%dl, %al
	jne	.L217
	testq	%r12, %r12
	je	.L217
	movq	%rbx, %rdi
	call	limb_set_str
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	limb_set_str
	movq	%rbx, %rdi
	movq	%rax, %rsi
	movq	%rax, %r13
	call	limb_t_adjust_limb_sizes
	movslq	16(%rbx), %rdi
	call	limb_t_alloc
	cmpl	$4, 16(%rbx)
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%rax, %r14
	movq	%rax, %rdi
	jg	.L190
	call	limb_t_sub_n_256
.L191:
	movq	%r14, %rdi
	call	limb_get_str
	movq	%rax, %rdi
	movq	%rax, %r15
	call	strlen
	movzbl	(%r12), %ecx
	movq	%rax, %rbp
	movzbl	(%r15), %eax
	movb	%cl, 27(%rsp)
	cmpb	$45, %al
	movb	%al, 26(%rsp)
	sete	%al
	movzbl	%al, %eax
	addq	%rax, %r15
	xorl	%eax, %eax
	cmpb	$45, %cl
	sete	%al
	addq	%rax, %r12
	call	__ctype_b_loc
	movq	(%rax), %rsi
	jmp	.L194
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L195:
	addq	$1, %r15
.L194:
	movsbq	(%r15), %rax
	cmpb	$48, %al
	je	.L195
	testb	$32, 1(%rsi,%rax,2)
	jne	.L195
	movsbq	(%r12), %rax
	cmpb	$48, %al
	jne	.L242
	.p2align 4
	.p2align 4
	.p2align 3
.L197:
	movsbq	1(%r12), %rax
	addq	$1, %r12
	cmpb	$48, %al
	je	.L197
.L242:
	testb	$32, 1(%rsi,%rax,2)
	jne	.L197
	movq	%r15, %rdi
	call	strlen
	testq	%rax, %rax
	je	.L198
	leaq	-1(%r15,%rax), %rax
	cmpb	$10, (%rax)
	jne	.L198
	movb	$0, (%rax)
	.p2align 4
	.p2align 3
.L198:
	movq	%r12, %rdi
	call	strlen
	testq	%rax, %rax
	je	.L199
	leaq	-1(%r12,%rax), %rax
	cmpb	$10, (%rax)
	jne	.L199
	movb	$0, (%rax)
	.p2align 4
	.p2align 3
.L199:
	testl	%ebp, %ebp
	jle	.L204
	call	__ctype_tolower_loc
	leal	-1(%rbp), %r9d
	xorl	%esi, %esi
	.p2align 6
	.p2align 4
	.p2align 3
.L203:
	movsbq	(%r15,%rsi), %rcx
	movq	(%rax), %rdx
	movl	(%rdx,%rcx,4), %edx
	movb	%dl, (%r15,%rsi)
	movsbq	(%r12,%rsi), %rcx
	movq	(%rax), %rdx
	movl	(%rdx,%rcx,4), %edx
	movb	%dl, (%r12,%rsi)
	movq	%rsi, %rdx
	addq	$1, %rsi
	cmpq	%rdx, %r9
	jne	.L203
.L204:
	movq	%r15, %rdi
	call	strlen
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	strlen
	cmpq	%rax, %rbp
	jne	.L243
	xorl	%eax, %eax
	testq	%rbp, %rbp
	jne	.L205
	jmp	.L206
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L207:
	addq	$1, %rax
	cmpq	%rax, %rbp
	je	.L206
.L205:
	movzbl	(%r12,%rax), %edi
	cmpb	%dil, (%r15,%rax)
	je	.L207
	movq	%rax, %r13
	movl	$.LC9, %edi
	call	puts
	movq	%r13, %rsi
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	printf
	movsbl	(%r15,%r13), %edx
	movq	%r13, %rsi
	movq	%r13, %rcx
	movsbl	(%r12,%r13), %r8d
	movl	$.LC11, %edi
	xorl	%eax, %eax
	call	printf
	movq	%r12, %rdx
	movq	%r15, %rsi
	movl	$.LC12, %edi
	xorl	%eax, %eax
	call	printf
.L208:
	movl	12(%rsp), %esi
	movl	$.LC43, %edi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
	.p2align 4,,10
	.p2align 3
.L190:
	call	__sub_n
	jmp	.L191
	.p2align 4,,10
	.p2align 3
.L206:
	cmpb	$45, 26(%rsp)
	sete	%dl
	cmpb	$45, 27(%rsp)
	sete	%al
	cmpb	%al, %dl
	jne	.L244
	movq	%rbx, %rdi
	call	limb_t_free
	movq	%r13, %rdi
	call	limb_t_free
	movq	%r14, %rdi
	call	limb_t_free
	addl	$1, 12(%rsp)
	movl	12(%rsp), %eax
	cmpl	$100000, %eax
	jne	.L210
	movq	16(%rsp), %r15
	movl	28(%rsp), %r14d
.L211:
	movl	NUM_BITS(%rip), %esi
	cmpl	$2, %r14d
	je	.L212
	cmpl	$3, %r14d
	je	.L213
	cmpl	$1, %r14d
	je	.L214
	movl	$.LC44, %edi
	xorl	%eax, %eax
	call	printf
.L215:
	movq	%r15, %rdi
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
.L243:
	.cfi_restore_state
	movl	$.LC6, %edi
	call	puts
	movq	%r12, %rdi
	call	strlen
	movq	%r15, %rdi
	movq	%rax, %rbx
	call	strlen
	movq	%rbx, %rdx
	movl	$.LC7, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	printf
	movq	%r12, %rdx
	movq	%r15, %rsi
	movl	$.LC8, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L208
	.p2align 4,,10
	.p2align 3
.L178:
	cmpl	$3, %r14d
	jne	.L181
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC40, %edi
	xorl	%eax, %eax
	leaq	32(%rsp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC41, %edx
	movl	$100, %esi
	call	snprintf
	jmp	.L183
	.p2align 4,,10
	.p2align 3
.L177:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC38, %edi
	xorl	%eax, %eax
	leaq	32(%rsp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC39, %edx
	movl	$100, %esi
	call	snprintf
	jmp	.L183
.L244:
	movl	$.LC13, %edi
	call	puts
	jmp	.L208
.L241:
	movq	16(%rsp), %r15
	movl	28(%rsp), %r14d
	movq	%r15, %rdi
	call	gzeof
	testl	%eax, %eax
	jne	.L211
	jmp	.L235
	.p2align 4,,10
	.p2align 3
.L214:
	movl	$.LC45, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L215
.L213:
	movl	$.LC47, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L215
.L212:
	movl	$.LC46, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L215
.L217:
	movq	16(%rsp), %r15
	movq	stderr(%rip), %rdi
	movl	$.LC22, %esi
	xorl	%eax, %eax
	leaq	144(%rsp), %rdx
	call	fprintf
	movq	%r15, %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
.L240:
	movq	%rbx, %rdi
	call	open_gzfile.part.0
.L181:
	movl	$.LC42, %edi
	call	puts
	movl	$1, %edi
	call	exit
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	run_correctness_test.cold, @function
run_correctness_test.cold:
.LFSB6837:
.L234:
	.cfi_def_cfa_offset 655568
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	%r15, %rdi
	call	skip_first_line.part.0
.L235:
	movl	$.LC20, %edi
	call	perror
	movq	%r15, %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6837:
	.text
	.size	run_correctness_test, .-run_correctness_test
	.section	.text.unlikely
	.size	run_correctness_test.cold, .-run_correctness_test.cold
.LCOLDE48:
	.text
.LHOTE48:
	.section	.rodata.str1.8
	.align 8
.LC49:
	.string	"Trying to run benchmarking test"
	.align 8
.LC50:
	.string	"Running the tests with RDTSC measurements"
	.align 8
.LC51:
	.string	"experiments/results/rdtsc_measurements"
	.align 8
.LC52:
	.string	"Running the tests with timespec measurements"
	.align 8
.LC53:
	.string	"experiments/results/timespec_measurements"
	.align 8
.LC54:
	.string	"Running the tests with rusage measurements"
	.align 8
.LC55:
	.string	"experiments/results/cputime_measurements"
	.section	.rodata.str1.1
.LC56:
	.string	"Invalid measure type"
.LC57:
	.string	"Running %d iterations...\n"
.LC58:
	.string	"Starting subtraction"
	.section	.rodata.str1.8
	.align 8
.LC59:
	.string	"Calibrating CPU speed using RDTSC..."
	.section	.rodata.str1.1
.LC61:
	.string	"done"
	.section	.rodata.str1.8
	.align 8
.LC62:
	.string	"Calibrated time: %f microseconds\n"
	.section	.rodata.str1.1
.LC64:
	.string	"Adding %lld times\n"
	.section	.rodata.str1.8
	.align 8
.LC67:
	.string	"RESULT: %.*f operations per second\n"
	.align 8
.LC68:
	.string	"Calibrating CPU speed using timespec..."
	.align 8
.LC69:
	.string	"Calibrating CPU speed using rusage..."
	.section	.rodata.str1.1
.LC72:
	.string	"done!"
	.section	.rodata.str1.8
	.align 8
.LC74:
	.string	"experiments/results/cputime_measurements/random_%d_%d.csv.gz"
	.section	.rodata.str1.1
.LC75:
	.string	"wb"
	.section	.rodata.str1.8
	.align 8
.LC76:
	.string	"experiments/results/rdtsc_measurements/random_%d_%d.csv.gz"
	.align 8
.LC77:
	.string	"experiments/results/timespec_measurements/random_%d_%d.csv.gz"
	.align 8
.LC78:
	.string	"experiments/results/cputime_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC79:
	.string	"experiments/results/rdtsc_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC80:
	.string	"experiments/results/timespec_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC81:
	.string	"experiments/results/rdtsc_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC82:
	.string	"experiments/results/timespec_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC83:
	.string	"experiments/results/cputime_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC84:
	.string	"experiments/results/rdtsc_measurements/greater_%d_%d.csv.gz"
	.align 8
.LC85:
	.string	"experiments/results/timespec_measurements/greater_%d_%d.csv.gz"
	.align 8
.LC86:
	.string	"experiments/results/cputime_measurements/greater_%d_%d.csv.gz"
	.section	.text.unlikely
.LCOLDB88:
	.text
.LHOTB88:
	.p2align 4
	.globl	run_benchmarking_test
	.type	run_benchmarking_test, @function
run_benchmarking_test:
.LFB6838:
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
	movl	$.LC49, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebx
	subq	$656024, %rsp
	.cfi_def_cfa_offset 656080
	call	puts
	movl	$.LC34, %edi
	call	create_directory
	cmpl	$1, %ebx
	je	.L246
	cmpl	$2, %ebx
	je	.L247
	testl	%ebx, %ebx
	jne	.L248
	movl	$.LC50, %edi
	call	puts
	movl	$.LC51, %edi
	call	create_directory
	cmpl	$2, %ebp
	je	.L249
	jg	.L250
	testl	%ebp, %ebp
	je	.L251
	cmpl	$1, %ebp
	jne	.L253
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC36, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %rbp
	leaq	64(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$.LC37, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC79, %edx
	movl	CORE_NO(%rip), %r8d
.L415:
	movl	$100, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	snprintf
	movl	$.LC75, %esi
	movq	%r12, %rdi
	call	gzopen
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L337
.L338:
	movl	$.LC18, %esi
	movq	%rbp, %rdi
	call	gzopen
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L426
	leaq	656(%rsp), %r12
	movl	$655360, %edx
	movq	%rax, %rdi
	movq	%r12, %rsi
	call	gzgets
	testq	%rax, %rax
	je	.L404
	xorl	%eax, %eax
	call	generate_seed
	movl	%eax, %edi
	call	srand
	movl	$1, %esi
	movl	$.LC57, %edi
	xorl	%eax, %eax
	call	printf
	call	rand
	xorl	%esi, %esi
	movl	$.LC19, %edi
	movslq	%eax, %rbp
	cltd
	imulq	$351843721, %rbp, %rbp
	sarq	$45, %rbp
	subl	%edx, %ebp
	imull	$100000, %ebp, %edx
	subl	%edx, %eax
	movl	%eax, %edx
	movl	%eax, %ebp
	xorl	%eax, %eax
	call	printf
	movq	%r14, %rdi
	call	gzrewind
	movl	$655360, %edx
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L404
	xorl	%r13d, %r13d
	testl	%ebp, %ebp
	jg	.L268
	jmp	.L274
	.p2align 4,,10
	.p2align 3
.L271:
	addl	$1, %r13d
	cmpl	%r13d, %ebp
	je	.L274
.L268:
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%r12, %rdi
	call	memset
	movl	$655360, %edx
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	jne	.L271
	movq	%r14, %rdi
	call	gzeof
	testl	%eax, %eax
	je	.L272
.L409:
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
.L247:
	.cfi_restore_state
	movl	$.LC54, %edi
	call	puts
	movl	$.LC55, %edi
	call	create_directory
	cmpl	$1, %ebp
	je	.L260
	jle	.L427
	cmpl	$2, %ebp
	je	.L263
	cmpl	$3, %ebp
	jne	.L253
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC40, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %rbp
	leaq	400(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$.LC41, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC83, %edx
	movl	CORE_NO(%rip), %r8d
.L425:
	movl	$100, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	snprintf
	movl	$.LC75, %esi
	movq	%r12, %rdi
	call	gzopen
	movq	%rax, 48(%rsp)
	testq	%rax, %rax
	jne	.L338
.L337:
	movq	%r12, %rdi
	call	open_gzfile.part.0
	.p2align 4,,10
	.p2align 3
.L246:
	movl	$.LC52, %edi
	call	puts
	movl	$.LC53, %edi
	call	create_directory
	cmpl	$2, %ebp
	je	.L255
	jg	.L256
	testl	%ebp, %ebp
	je	.L257
	cmpl	$1, %ebp
	jne	.L253
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC36, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %rbp
	leaq	288(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$.LC37, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC80, %edx
	movl	CORE_NO(%rip), %r8d
.L420:
	movl	$100, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	snprintf
	movl	$.LC75, %esi
	movq	%r12, %rdi
	call	gzopen
	movq	%rax, 32(%rsp)
	testq	%rax, %rax
	jne	.L338
	jmp	.L337
	.p2align 4,,10
	.p2align 3
.L427:
	testl	%ebp, %ebp
	jne	.L253
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC35, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %rbp
	leaq	400(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$.LC17, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC74, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L425
.L256:
	cmpl	$3, %ebp
	jne	.L253
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC40, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %rbp
	leaq	288(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$.LC41, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC82, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L420
.L250:
	cmpl	$3, %ebp
	jne	.L253
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC40, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %rbp
	leaq	64(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$.LC41, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC81, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L415
	.p2align 4,,10
	.p2align 3
.L274:
	movl	$.LC21, %esi
	movq	%r12, %rdi
	call	strtok
	xorl	%edi, %edi
	movl	$.LC21, %esi
	movq	%rax, %r13
	call	strtok
	xorl	%edi, %edi
	movl	$.LC21, %esi
	movq	%rax, %rbp
	call	strtok
	testq	%r13, %r13
	sete	%dl
	testq	%rbp, %rbp
	sete	%cl
	orb	%cl, %dl
	jne	.L269
	testq	%rax, %rax
	je	.L269
	movq	%r13, %rdi
	call	limb_set_str
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	limb_set_str
	movq	%r12, %rdi
	movq	%rax, %rsi
	movq	%rax, %rbp
	call	limb_t_adjust_limb_sizes
	movq	16(%r12), %r15
	movslq	%r15d, %rdi
	call	limb_t_alloc
	movl	$.LC58, %edi
	movq	%rax, %r13
	call	puts
	testl	%r15d, %r15d
	jle	.L280
	leal	-1(%r15), %ecx
	movq	%r12, %rax
	movq	%rbp, %rdx
	shrl	$6, %ecx
	salq	$6, %rcx
	leaq	64(%r12,%rcx), %rcx
	.p2align 5
	.p2align 4
	.p2align 3
.L279:
	clflush	(%rax)
	clflush	(%rdx)
	addq	$64, %rax
	addq	$64, %rdx
	cmpq	%rax, %rcx
	jne	.L279
.L280:
	mfence
	cmpl	$1, %ebx
	je	.L276
	cmpl	$2, %ebx
	je	.L277
	movl	$.LC59, %edi
	call	puts
	movq	stdout(%rip), %rdi
	call	fflush
	xorl	%eax, %eax
#APP
# 818 "sub.c" 1
	cpuid
	
# 0 "" 2
#NO_APP
	cmpl	$4, 16(%rbp)
	movq	%r13, %rdx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	jg	.L281
	call	limb_t_sub_n_256
.L282:
	movl	$1, %r15d
	.p2align 4
	.p2align 3
.L284:
	addq	%r15, %r15
#APP
# 232 "../myutils.h" 1
	CPUID
	RDTSC
	mov %edx, %edi
	mov %eax, %esi
	
# 0 "" 2
#NO_APP
	salq	$32, %rdi
	movl	%esi, %esi
	xorl	%ebx, %ebx
	orq	%rsi, %rdi
	movq	%rdi, (%rsp)
	testq	%r15, %r15
	jg	.L288
	jmp	.L289
	.p2align 4,,10
	.p2align 3
.L428:
	call	limb_t_sub_n_256
	addq	$1, %rbx
	cmpq	%r15, %rbx
	je	.L289
.L288:
	cmpl	$4, 16(%rbp)
	movq	%r13, %rdx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	jle	.L428
	call	__sub_n
	addq	$1, %rbx
	cmpq	%r15, %rbx
	jne	.L288
.L289:
#APP
# 245 "../myutils.h" 1
	RDTSCP
	mov %edx, %esi
	mov %eax, %edi
	CPUID
	
# 0 "" 2
#NO_APP
	movq	%rsi, %rax
	movq	(%rsp), %rcx
	movl	%edi, %edi
	salq	$32, %rax
	orq	%rdi, %rax
	subq	%rcx, %rax
	cmpq	$699999999, %rax
	jle	.L284
	vxorpd	%xmm3, %xmm3, %xmm3
	movl	$.LC61, %edi
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	vmulsd	.LC60(%rip), %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %rax
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	vmovapd	%xmm0, %xmm1
	vcvtsi2sdq	%r15, %xmm3, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm4
	vmovsd	%xmm4, (%rsp)
	call	puts
	movl	$.LC62, %edi
	movl	$1, %eax
	vmovsd	(%rsp), %xmm0
	call	printf
	movl	$.LC64, %edi
	vmovsd	.LC63(%rip), %xmm0
	vdivsd	(%rsp), %xmm0, %xmm0
	vcvttsd2usi	%xmm0, %r15
	leaq	1(%r15), %rax
	movq	%rax, %rsi
	movq	%rax, (%rsp)
	xorl	%eax, %eax
	call	printf
	movq	stdout(%rip), %rdi
	call	fflush
#APP
# 232 "../myutils.h" 1
	CPUID
	RDTSC
	mov %edx, %edi
	mov %eax, %esi
	
# 0 "" 2
#NO_APP
	salq	$32, %rdi
	movl	%esi, %esi
	xorl	%ebx, %ebx
	orq	%rsi, %rdi
	cmpq	$0, (%rsp)
	movq	%rdi, 48(%rsp)
	jne	.L290
	jmp	.L295
	.p2align 4,,10
	.p2align 3
.L429:
	call	limb_t_sub_n_256
	leaq	1(%rbx), %rax
	cmpq	%rbx, %r15
	je	.L295
.L344:
	movq	%rax, %rbx
.L290:
	cmpl	$4, 16(%rbp)
	movq	%r13, %rdx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	jle	.L429
	call	__sub_n
	leaq	1(%rbx), %rax
	cmpq	%rbx, %r15
	jne	.L344
.L295:
#APP
# 245 "../myutils.h" 1
	RDTSCP
	mov %edx, %esi
	mov %eax, %edi
	CPUID
	
# 0 "" 2
#NO_APP
	vxorpd	%xmm5, %xmm5, %xmm5
	salq	$32, %rsi
	movq	48(%rsp), %rax
	movl	%edi, %edi
	vcvtsi2sdq	(%rsp), %xmm5, %xmm0
	orq	%rdi, %rsi
	vmovsd	.LC65(%rip), %xmm2
	subq	%rax, %rsi
	vmulsd	%xmm0, %xmm2, %xmm2
	vcvtusi2sdq	%rsi, %xmm5, %xmm0
	vmulsd	.LC60(%rip), %xmm0, %xmm0
	vdivsd	%xmm0, %xmm2, %xmm2
	vcomisd	.LC29(%rip), %xmm2
	ja	.L343
	vmovsd	.LC29(%rip), %xmm0
	xorl	%esi, %esi
	vmovsd	.LC66(%rip), %xmm1
	.p2align 4
	.p2align 4
	.p2align 3
.L292:
	vmulsd	%xmm1, %xmm0, %xmm0
	addl	$1, %esi
	vcomisd	%xmm0, %xmm2
	jbe	.L292
.L291:
	vmovapd	%xmm2, %xmm0
	movl	$.LC67, %edi
	movl	$1, %eax
	call	printf
	movq	%r14, %rdi
	call	gzclose
	movq	24(%rsp), %rdi
	call	gzclose
	jmp	.L409
	.p2align 4,,10
	.p2align 3
.L277:
	movl	$.LC69, %edi
	call	puts
	movq	stdout(%rip), %rdi
	call	fflush
	xorl	%eax, %eax
#APP
# 895 "sub.c" 1
	cpuid
	
# 0 "" 2
#NO_APP
	cmpl	$4, 16(%r12)
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	jg	.L317
	call	limb_t_sub_n_256
.L318:
	leaq	512(%rsp), %rax
	movl	$1, %ebx
	movq	%rax, (%rsp)
	jmp	.L320
	.p2align 4,,10
	.p2align 3
.L434:
	fstp	%st(0)
.L320:
	movq	(%rsp), %rsi
	xorl	%edi, %edi
	addq	%rbx, %rbx
	xorl	%r15d, %r15d
	call	getrusage
	fildq	512(%rsp)
	fmuls	.LC70(%rip)
	fildq	520(%rsp)
	faddp	%st, %st(1)
	fisttpq	24(%rsp)
	testq	%rbx, %rbx
	jg	.L319
	jmp	.L324
	.p2align 4,,10
	.p2align 3
.L430:
	call	limb_t_sub_n_256
	addq	$1, %r15
	cmpq	%r15, %rbx
	je	.L324
.L319:
	cmpl	$4, 16(%r12)
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	jle	.L430
	call	__sub_n
	addq	$1, %r15
	cmpq	%r15, %rbx
	jne	.L319
.L324:
	movq	(%rsp), %rsi
	xorl	%edi, %edi
	call	getrusage
	fildq	512(%rsp)
	flds	.LC70(%rip)
	fxch	%st(1)
	fmuls	.LC70(%rip)
	fildq	520(%rsp)
	faddp	%st, %st(1)
	fildq	24(%rsp)
	fsubrp	%st, %st(1)
	fisttpq	24(%rsp)
	movq	24(%rsp), %rax
	cmpq	$249999, %rax
	jle	.L434
	vxorpd	%xmm7, %xmm7, %xmm7
	movl	$.LC61, %edi
	fstpt	32(%rsp)
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	vmovapd	%xmm0, %xmm1
	vcvtsi2sdq	%rbx, %xmm7, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm5
	vmovsd	%xmm5, 24(%rsp)
	call	puts
	movl	$.LC62, %edi
	movl	$1, %eax
	vmovsd	24(%rsp), %xmm0
	call	printf
	movl	$.LC64, %edi
	vmovsd	.LC63(%rip), %xmm0
	vdivsd	24(%rsp), %xmm0, %xmm0
	vcvttsd2usi	%xmm0, %r15
	leaq	1(%r15), %rax
	movq	%rax, %rsi
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	call	printf
	movq	stdout(%rip), %rdi
	call	fflush
	movq	(%rsp), %rsi
	xorl	%edi, %edi
	call	getrusage
	fildq	512(%rsp)
	fldt	32(%rsp)
	fmulp	%st, %st(1)
	fildq	520(%rsp)
	faddp	%st, %st(1)
	flds	.LC71(%rip)
	fxch	%st(1)
	fcomi	%st(1), %st
	jnb	.L325
	fstp	%st(1)
	fisttpq	32(%rsp)
.L326:
	xorl	%ebx, %ebx
	cmpq	$0, 24(%rsp)
	jne	.L327
	jmp	.L335
	.p2align 4,,10
	.p2align 3
.L431:
	call	limb_t_sub_n_256
	leaq	1(%rbx), %rdx
	cmpq	%rbx, %r15
	je	.L335
.L351:
	movq	%rdx, %rbx
.L327:
	cmpl	$4, 16(%r12)
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	jle	.L431
	call	__sub_n
	leaq	1(%rbx), %rdx
	cmpq	%rbx, %r15
	jne	.L351
.L335:
	movq	(%rsp), %rsi
	xorl	%edi, %edi
	call	getrusage
	fildq	512(%rsp)
	fmuls	.LC70(%rip)
	movl	$.LC72, %edi
	fildq	520(%rsp)
	faddp	%st, %st(1)
	fstpt	(%rsp)
	call	puts
	vxorpd	%xmm6, %xmm6, %xmm6
	movq	32(%rsp), %rax
	vmovsd	.LC65(%rip), %xmm2
	vcvtsi2sdq	24(%rsp), %xmm6, %xmm0
	testq	%rax, %rax
	movq	%rax, 24(%rsp)
	fildq	24(%rsp)
	vmulsd	%xmm0, %xmm2, %xmm2
	fldt	(%rsp)
	jns	.L328
	fxch	%st(1)
	fadds	.LC73(%rip)
	fxch	%st(1)
.L328:
	fsubp	%st, %st(1)
	flds	.LC71(%rip)
	fxch	%st(1)
	fcomi	%st(1), %st
	jnb	.L329
	fstp	%st(1)
	fisttpq	(%rsp)
	movq	(%rsp), %rax
.L330:
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtusi2sdq	%rax, %xmm6, %xmm0
	vdivsd	%xmm0, %xmm2, %xmm2
	vcomisd	.LC29(%rip), %xmm2
	ja	.L350
	vmovsd	.LC29(%rip), %xmm0
	xorl	%esi, %esi
	vmovsd	.LC66(%rip), %xmm1
	.p2align 4
	.p2align 4
	.p2align 3
.L332:
	vmulsd	%xmm1, %xmm0, %xmm0
	addl	$1, %esi
	vcomisd	%xmm0, %xmm2
	jbe	.L332
.L331:
	vmovapd	%xmm2, %xmm0
	movl	$.LC67, %edi
	movl	$1, %eax
	call	printf
	movq	%r14, %rdi
	call	gzclose
	movq	48(%rsp), %rdi
	call	gzclose
	jmp	.L409
	.p2align 4,,10
	.p2align 3
.L276:
	movl	$.LC68, %edi
	call	puts
	movq	stdout(%rip), %rdi
	call	fflush
	xorl	%eax, %eax
#APP
# 856 "sub.c" 1
	cpuid
	
# 0 "" 2
#NO_APP
	cmpl	$4, 16(%rbp)
	movq	%r13, %rdx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	jg	.L298
	call	limb_t_sub_n_256
.L299:
	leaq	512(%rsp), %rax
	movl	$1, %ebx
	movq	%rax, (%rsp)
	.p2align 4
	.p2align 3
.L307:
	movq	(%rsp), %rsi
	movl	$4, %edi
	addq	%rbx, %rbx
	xorl	%r15d, %r15d
	call	clock_gettime
	movq	512(%rsp), %rax
	movq	%rax, 48(%rsp)
	movq	520(%rsp), %rax
	movq	%rax, 24(%rsp)
	testq	%rbx, %rbx
	jg	.L305
	jmp	.L306
	.p2align 4,,10
	.p2align 3
.L432:
	call	limb_t_sub_n_256
	addq	$1, %r15
	cmpq	%rbx, %r15
	je	.L306
.L305:
	cmpl	$4, 16(%rbp)
	movq	%r13, %rdx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	jle	.L432
	call	__sub_n
	addq	$1, %r15
	cmpq	%rbx, %r15
	jne	.L305
.L306:
	movq	(%rsp), %rsi
	movl	$4, %edi
	call	clock_gettime
	movq	48(%rsp), %rcx
	movq	24(%rsp), %rsi
	movq	520(%rsp), %rdx
	movq	512(%rsp), %rax
	subq	%rcx, %rax
	movq	%rdx, %rcx
	subq	%rsi, %rcx
	jns	.L302
	leaq	1000000000(%rdx), %rcx
	movq	24(%rsp), %rdx
	subq	$1, %rax
	subq	%rdx, %rcx
.L302:
	imulq	$1000000000, %rax, %rax
	addq	%rax, %rcx
	cmpq	$249999999, %rcx
	jle	.L307
	movabsq	$2361183241434822607, %rax
	vxorpd	%xmm6, %xmm6, %xmm6
	movl	$.LC61, %edi
	imulq	%rcx
	sarq	$63, %rcx
	sarq	$7, %rdx
	subq	%rcx, %rdx
	vcvtsi2sdq	%rdx, %xmm6, %xmm0
	vmovapd	%xmm0, %xmm1
	vcvtsi2sdq	%rbx, %xmm6, %xmm0
	xorl	%ebx, %ebx
	vdivsd	%xmm0, %xmm1, %xmm7
	vmovsd	%xmm7, 24(%rsp)
	call	puts
	movl	$.LC62, %edi
	movl	$1, %eax
	vmovsd	24(%rsp), %xmm0
	call	printf
	movl	$.LC64, %edi
	vmovsd	.LC63(%rip), %xmm0
	vdivsd	24(%rsp), %xmm0, %xmm0
	vcvttsd2usi	%xmm0, %r15
	leaq	1(%r15), %rax
	movq	%rax, %rsi
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	call	printf
	movq	stdout(%rip), %rdi
	call	fflush
	movq	(%rsp), %rsi
	movl	$4, %edi
	call	clock_gettime
	movq	512(%rsp), %rcx
	cmpq	$0, 24(%rsp)
	movq	%rcx, 56(%rsp)
	movq	520(%rsp), %rcx
	movq	%rcx, 48(%rsp)
	jne	.L308
	jmp	.L313
	.p2align 4,,10
	.p2align 3
.L433:
	call	limb_t_sub_n_256
	leaq	1(%rbx), %rdx
	cmpq	%rbx, %r15
	je	.L313
.L346:
	movq	%rdx, %rbx
.L308:
	cmpl	$4, 16(%rbp)
	movq	%r13, %rdx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	jle	.L433
	call	__sub_n
	leaq	1(%rbx), %rdx
	cmpq	%rbx, %r15
	jne	.L346
.L313:
	movq	(%rsp), %rsi
	movl	$4, %edi
	call	clock_gettime
	movq	56(%rsp), %rcx
	movq	48(%rsp), %rbx
	movq	520(%rsp), %rdx
	movq	512(%rsp), %rax
	subq	%rcx, %rax
	movq	%rdx, %rcx
	subq	%rbx, %rcx
	jns	.L310
	movq	48(%rsp), %rbx
	leaq	1000000000(%rdx), %rcx
	subq	$1, %rax
	subq	%rbx, %rcx
.L310:
	imulq	$1000000000, %rax, %rax
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovsd	.LC65(%rip), %xmm2
	vcvtsi2sdq	24(%rsp), %xmm4, %xmm0
	addq	%rax, %rcx
	movabsq	$2361183241434822607, %rax
	imulq	%rcx
	sarq	$63, %rcx
	vmulsd	%xmm0, %xmm2, %xmm2
	sarq	$7, %rdx
	subq	%rcx, %rdx
	vcvtusi2sdq	%rdx, %xmm4, %xmm0
	vdivsd	%xmm0, %xmm2, %xmm2
	vcomisd	.LC29(%rip), %xmm2
	ja	.L347
	vmovsd	.LC29(%rip), %xmm0
	xorl	%esi, %esi
	vmovsd	.LC66(%rip), %xmm1
	.p2align 4
	.p2align 4
	.p2align 3
.L315:
	vmulsd	%xmm1, %xmm0, %xmm0
	addl	$1, %esi
	vcomisd	%xmm0, %xmm2
	jbe	.L315
.L314:
	vmovapd	%xmm2, %xmm0
	movl	$.LC67, %edi
	movl	$1, %eax
	call	printf
	movq	%r14, %rdi
	call	gzclose
	movq	32(%rsp), %rdi
	call	gzclose
	jmp	.L409
.L260:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC36, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %rbp
	leaq	400(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$.LC37, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC78, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L425
.L263:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC38, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %rbp
	leaq	400(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$.LC39, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC86, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L425
.L251:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC35, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %rbp
	leaq	64(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$.LC17, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC76, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L415
.L249:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC38, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %rbp
	leaq	64(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$.LC39, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC84, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L415
.L257:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC35, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %rbp
	leaq	288(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$.LC17, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC77, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L420
.L298:
	call	__sub_n
	jmp	.L299
.L255:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC38, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %rbp
	leaq	288(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$.LC39, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC85, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L420
.L329:
	fsubp	%st, %st(1)
	fisttpq	(%rsp)
	movq	(%rsp), %rax
	btcq	$63, %rax
	jmp	.L330
.L325:
	fsubp	%st, %st(1)
	fisttpq	32(%rsp)
	movq	32(%rsp), %rax
	btcq	$63, %rax
	movq	%rax, 32(%rsp)
	jmp	.L326
.L317:
	call	__sub_n
	jmp	.L318
.L281:
	call	__sub_n
	jmp	.L282
.L350:
	xorl	%esi, %esi
	jmp	.L331
.L343:
	xorl	%esi, %esi
	jmp	.L291
.L347:
	xorl	%esi, %esi
	jmp	.L314
.L248:
	movl	$.LC56, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L253:
	movl	$.LC42, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L269:
	movq	stderr(%rip), %rdi
	movq	%r12, %rdx
	movl	$.LC22, %esi
	xorl	%eax, %eax
	call	fprintf
	movq	%r14, %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
.L426:
	movq	%rbp, %rdi
	call	open_gzfile.part.0
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	run_benchmarking_test.cold, @function
run_benchmarking_test.cold:
.LFSB6838:
.L272:
	.cfi_def_cfa_offset 656080
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movl	$.LC20, %edi
	call	perror
	movq	%r14, %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
.L404:
	movq	%r14, %rdi
	call	skip_first_line.part.0
	.cfi_endproc
.LFE6838:
	.text
	.size	run_benchmarking_test, .-run_benchmarking_test
	.section	.text.unlikely
	.size	run_benchmarking_test.cold, .-run_benchmarking_test.cold
.LCOLDE88:
	.text
.LHOTE88:
	.section	.rodata.str1.8
	.align 8
.LC89:
	.string	"Usage: %s <number of bits> <core number> <test-case number> <benchmark measure type> <type of measure>\n"
	.align 8
.LC90:
	.string	"test-case number: 0 --> Random numbers"
	.align 8
.LC91:
	.string	"test-case number: 1 --> Random numbers with a < b"
	.align 8
.LC92:
	.string	"test-case number: 2 --> Random numbers with a > b"
	.align 8
.LC93:
	.string	"test-case number: 3 --> Random numbers with a = b"
	.align 8
.LC94:
	.string	"benchmark measure type: 0 --> RDTSC"
	.align 8
.LC95:
	.string	"benchmark measure type: 1 --> Timespec"
	.align 8
.LC96:
	.string	"benchmark measure type: 2 --> RUSAGE"
	.align 8
.LC97:
	.string	"type of measure: 0 --> correctness test"
	.align 8
.LC98:
	.string	"type of measure: 1 --> benchmarking test"
	.section	.rodata.str1.1
.LC99:
	.string	"sub.c"
.LC100:
	.string	"atoi(argv[1]) > 0"
	.section	.rodata.str1.8
	.align 8
.LC101:
	.string	"atoi(argv[2]) >= 0 && atoi(argv[2]) < sysconf(_SC_NPROCESSORS_ONLN)"
	.align 8
.LC102:
	.string	"atoi(argv[3]) >= 0 && atoi(argv[3]) < 4"
	.align 8
.LC103:
	.string	"atoi(argv[4]) >= 0 && atoi(argv[4]) < 3"
	.align 8
.LC104:
	.string	"atoi(argv[5]) >= 0 && atoi(argv[5]) < 3"
	.section	.rodata.str1.1
.LC105:
	.string	"Invalid type of measure"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB6835:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rsi, %rbx
	cmpl	$6, %edi
	je	.L436
	movq	(%rsi), %rsi
	movl	$.LC89, %edi
	xorl	%eax, %eax
	call	printf
	movl	$.LC90, %edi
	call	puts
	movl	$.LC91, %edi
	call	puts
	movl	$.LC92, %edi
	call	puts
	movl	$.LC93, %edi
	call	puts
	movl	$.LC94, %edi
	call	puts
	movl	$.LC95, %edi
	call	puts
	movl	$.LC96, %edi
	call	puts
	movl	$.LC97, %edi
	call	puts
	movl	$.LC98, %edi
	call	puts
	movl	$1, %eax
.L435:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L436:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	testl	%eax, %eax
	jle	.L452
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
	js	.L440
	movq	16(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	$84, %edi
	movq	%rax, %rbp
	call	sysconf
	movslq	%ebp, %rbp
	cmpq	%rax, %rbp
	jge	.L440
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
	js	.L442
	movq	24(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	$3, %eax
	jg	.L442
	movq	24(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	movq	32(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	movl	%eax, %r12d
	call	strtol
	testl	%eax, %eax
	js	.L444
	movq	32(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	$2, %eax
	jg	.L444
	movq	32(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	movq	40(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	movq	%rax, %rbp
	call	strtol
	testl	%eax, %eax
	js	.L446
	movq	40(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	$2, %eax
	jg	.L446
	movq	40(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	movq	%rax, %rbx
	xorl	%eax, %eax
	call	init_memory_pool
	cmpl	$1, %ebx
	je	.L447
	cmpl	$2, %ebx
	je	.L448
	testl	%ebx, %ebx
	jne	.L449
	movl	%r12d, %edi
	call	run_correctness_test
.L450:
	xorl	%eax, %eax
	call	destroy_memory_pool
	xorl	%eax, %eax
	jmp	.L435
.L448:
	xorl	%eax, %eax
	call	run_perf_test
	jmp	.L450
.L447:
	movl	%ebp, %esi
	movl	%r12d, %edi
	call	run_benchmarking_test
	jmp	.L450
.L452:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$259, %edx
	movl	$.LC99, %esi
	movl	$.LC100, %edi
	call	__assert_fail
.L440:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$262, %edx
	movl	$.LC99, %esi
	movl	$.LC101, %edi
	call	__assert_fail
.L442:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$265, %edx
	movl	$.LC99, %esi
	movl	$.LC102, %edi
	call	__assert_fail
.L444:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$268, %edx
	movl	$.LC99, %esi
	movl	$.LC103, %edi
	call	__assert_fail
.L446:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$271, %edx
	movl	$.LC99, %esi
	movl	$.LC104, %edi
	call	__assert_fail
.L449:
	movl	$.LC105, %edi
	call	puts
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6835:
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
.LC29:
	.long	0
	.long	1079574528
	.align 8
.LC60:
	.long	1394455622
	.long	1060595063
	.align 8
.LC63:
	.long	0
	.long	1097011920
	.align 8
.LC65:
	.long	0
	.long	1093567616
	.align 8
.LC66:
	.long	-1717986918
	.long	1069128089
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC70:
	.long	1232348160
	.align 4
.LC71:
	.long	1593835520
	.align 4
.LC73:
	.long	1602224128
	.ident	"GCC: (GNU) 14.2.1 20250110 (Red Hat 14.2.1-7)"
	.section	.note.GNU-stack,"",@progbits
