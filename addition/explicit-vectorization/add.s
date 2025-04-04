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
	.globl	___add_n_256
	.type	___add_n_256, @function
___add_n_256:
.LFB6832:
	.cfi_startproc
	movq	(%rsi), %rax
	movq	(%rdx), %rdx
	movl	$1, %esi
	vmovdqa	AVX256_ZEROS(%rip), %ymm2
	movq	(%rdi), %r9
	vmovdqa	(%rax), %ymm0
	vpaddq	(%rdx), %ymm0, %ymm1
	vpcmpuq	$1, %ymm0, %ymm1, %k3
	kmovw	%k3, %eax
	movl	%eax, %ecx
	addl	%eax, %eax
	kmovw	%eax, %k1
	vpbroadcastq	%rsi, %ymm2{%k1}
	shrb	$3, %cl
	vpaddq	%ymm1, %ymm2, %ymm3
	movzbl	%cl, %r10d
	vpcmpuq	$1, %ymm1, %ymm3, %k4
	vmovdqa	%ymm3, (%r9)
	kmovw	%r10d, %k0
	kmovw	%k4, %r8d
	testb	%r8b, %r8b
	jne	.L154
.L139:
	movl	$1, %r9d
	kmovw	%r9d, %k3
	kandw	%k3, %k0, %k1
	kortestw	%k1, %k1
	jne	.L155
	vzeroupper
	ret
	.p2align 4,,10
	.p2align 3
.L154:
	vmovdqa	AVX256_MASK(%rip), %ymm4
	movzbl	%cl, %ecx
	kmovw	%ecx, %k7
	vpcmpeqq	%ymm4, %ymm3, %k6
	kmovw	%k6, %r11d
	leal	(%r11,%r8,2), %edx
	movq	(%rdi), %r8
	movl	%edx, %eax
	kmovw	%edx, %k5
	vpsubq	%ymm4, %ymm3, %ymm3{%k5}
	shrb	$4, %al
	vmovdqa	%ymm3, (%r8)
	movzbl	%al, %esi
	kmovw	%esi, %k2
	korw	%k2, %k7, %k0
	jmp	.L139
	.p2align 4,,10
	.p2align 3
.L155:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$5, %esi
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	vzeroupper
	call	limb_t_realloc
	movq	(%rax), %rdi
	movq	$1, 32(%rdi)
	movq	$5, 16(%rax)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6832:
	.size	___add_n_256, .-___add_n_256
	.p2align 4
	.globl	__add_n
	.type	__add_n, @function
__add_n:
.LFB6833:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %r11
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	16(%rsi), %rbx
	movq	(%rdi), %rdi
	movq	(%rsi), %r8
	movq	(%rdx), %r9
	andq	$-64, %rsp
	testl	%ebx, %ebx
	jle	.L161
	leal	-1(%rbx), %edx
	movl	%ebx, %ecx
	xorl	%eax, %eax
	xorl	%esi, %esi
	shrl	$3, %edx
	movl	$1, %r10d
	andl	$3, %edx
	je	.L159
	vmovdqa64	(%r8), %zmm0
	vpaddq	(%r9), %zmm0, %zmm1
	kmovw	%esi, %k6
	vmovdqa64	AVX512_ZEROS(%rip), %zmm2
	vpcmpuq	$1, %zmm0, %zmm1, %k2
	kmovw	%k2, %eax
	movl	%eax, %r12d
	addl	%eax, %eax
	movzbl	%al, %eax
	shrb	$7, %r12b
	kmovw	%eax, %k5
	korw	%k6, %k5, %k1
	vpbroadcastq	%r10, %zmm2{%k1}
	movzbl	%r12b, %r13d
	vpaddq	%zmm1, %zmm2, %zmm3
	vpcmpuq	$1, %zmm1, %zmm3, %k0
	vmovdqa64	%zmm3, (%rdi)
	kmovw	%k0, %eax
	testb	%al, %al
	je	.L190
.L165:
	movl	$8, %eax
	cmpl	$8, %ecx
	jle	.L187
	movl	%r13d, %esi
	cmpl	$1, %edx
	je	.L159
	cmpl	$2, %edx
	je	.L180
	vmovdqa64	(%r8,%rax,8), %zmm5
	vpaddq	(%r9,%rax,8), %zmm5, %zmm6
	kmovw	%r13d, %k6
	vmovdqa64	AVX512_ZEROS(%rip), %zmm7
	vpcmpuq	$1, %zmm5, %zmm6, %k5
	kmovw	%k5, %edx
	movl	%edx, %r12d
	addl	%edx, %edx
	movzbl	%dl, %edx
	shrb	$7, %r12b
	kmovw	%edx, %k1
	korw	%k1, %k6, %k4
	vpbroadcastq	%r10, %zmm7{%k4}
	movzbl	%r12b, %esi
	vpaddq	%zmm6, %zmm7, %zmm8
	vpcmpuq	$1, %zmm6, %zmm8, %k0
	vmovdqa64	%zmm8, (%rdi,%rax,8)
	kmovw	%k0, %r13d
	testb	%r13b, %r13b
	je	.L191
.L167:
	addq	$8, %rax
.L180:
	vmovdqa64	(%r8,%rax,8), %zmm10
	vpaddq	(%r9,%rax,8), %zmm10, %zmm11
	kmovw	%esi, %k4
	vmovdqa64	AVX512_ZEROS(%rip), %zmm12
	vpcmpuq	$1, %zmm10, %zmm11, %k6
	kmovw	%k6, %edx
	movl	%edx, %r12d
	addl	%edx, %edx
	movzbl	%dl, %edx
	shrb	$7, %r12b
	kmovw	%edx, %k1
	korw	%k4, %k1, %k3
	vpbroadcastq	%r10, %zmm12{%k3}
	movzbl	%r12b, %r13d
	vpaddq	%zmm11, %zmm12, %zmm13
	vpcmpuq	$1, %zmm11, %zmm13, %k0
	vmovdqa64	%zmm13, (%rdi,%rax,8)
	kmovw	%k0, %esi
	testb	%sil, %sil
	je	.L192
.L170:
	addq	$8, %rax
	movl	%r13d, %esi
	jmp	.L159
	.p2align 4,,10
	.p2align 3
.L162:
	vmovdqa64	(%r8,%rax,8), %zmm4
	vpaddq	(%r9,%rax,8), %zmm4, %zmm5
	kmovw	%r13d, %k7
	vmovdqa64	AVX512_ZEROS(%rip), %zmm6
	vpcmpuq	$1, %zmm4, %zmm5, %k0
	kmovw	%k0, %edx
	movl	%edx, %esi
	addl	%edx, %edx
	movzbl	%dl, %edx
	shrb	$7, %sil
	kmovw	%edx, %k6
	korw	%k6, %k7, %k5
	vpbroadcastq	%r10, %zmm6{%k5}
	movzbl	%sil, %r12d
	vpaddq	%zmm5, %zmm6, %zmm7
	kmovw	%r12d, %k2
	vpcmpuq	$1, %zmm5, %zmm7, %k1
	vmovdqa64	%zmm7, (%rdi,%rax,8)
	kmovw	%k1, %r13d
	testb	%r13b, %r13b
	je	.L193
.L174:
	vmovdqa64	AVX512_ZEROS(%rip), %zmm11
	leaq	8(%rax), %r12
	vmovdqa64	(%r8,%r12,8), %zmm9
	vpaddq	(%r9,%r12,8), %zmm9, %zmm10
	vpcmpuq	$1, %zmm9, %zmm10, %k0
	kmovw	%k0, %edx
	movl	%edx, %esi
	addl	%edx, %edx
	movzbl	%dl, %edx
	shrb	$7, %sil
	kmovw	%edx, %k7
	korw	%k7, %k2, %k6
	vpbroadcastq	%r10, %zmm11{%k6}
	movzbl	%sil, %r13d
	vpaddq	%zmm10, %zmm11, %zmm12
	kmovw	%r13d, %k0
	vpcmpuq	$1, %zmm10, %zmm12, %k5
	vmovdqa64	%zmm12, (%rdi,%r12,8)
	kmovw	%k5, %r13d
	testb	%r13b, %r13b
	je	.L194
.L176:
	vmovdqa64	AVX512_ZEROS(%rip), %zmm1
	leaq	16(%rax), %r13
	vmovdqa64	(%r8,%r13,8), %zmm14
	vpaddq	(%r9,%r13,8), %zmm14, %zmm15
	vpcmpuq	$1, %zmm14, %zmm15, %k2
	kmovw	%k2, %edx
	movl	%edx, %r12d
	addl	%edx, %edx
	movzbl	%dl, %edx
	shrb	$7, %r12b
	kmovw	%edx, %k7
	korw	%k7, %k0, %k6
	vpbroadcastq	%r10, %zmm1{%k6}
	movzbl	%r12b, %esi
	vpaddq	%zmm15, %zmm1, %zmm0
	vpcmpuq	$1, %zmm15, %zmm0, %k5
	vmovdqa64	%zmm0, (%rdi,%r13,8)
	kmovw	%k5, %edx
	testb	%dl, %dl
	je	.L195
.L178:
	addq	$24, %rax
.L159:
	vmovdqa64	(%r8,%rax,8), %zmm15
	vpaddq	(%r9,%rax,8), %zmm15, %zmm1
	kmovw	%esi, %k3
	vmovdqa64	AVX512_ZEROS(%rip), %zmm0
	vpcmpuq	$1, %zmm15, %zmm1, %k1
	kmovw	%k1, %edx
	movl	%edx, %r12d
	addl	%edx, %edx
	movzbl	%dl, %edx
	shrb	$7, %r12b
	kmovw	%edx, %k4
	korw	%k3, %k4, %k2
	vpbroadcastq	%r10, %zmm0{%k2}
	movzbl	%r12b, %r13d
	vpaddq	%zmm1, %zmm0, %zmm2
	vpcmpuq	$1, %zmm1, %zmm2, %k0
	vmovdqa64	%zmm2, (%rdi,%rax,8)
	kmovw	%k0, %esi
	testb	%sil, %sil
	je	.L196
.L158:
	addq	$8, %rax
	cmpl	%eax, %ecx
	jg	.L162
.L187:
	vzeroupper
.L157:
	movl	$1, %edi
	kmovw	%r13d, %k4
	kmovw	%edi, %k3
	kandw	%k3, %k4, %k2
	kortestw	%k2, %k2
	jne	.L197
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
.L196:
	.cfi_restore_state
	vmovdqa64	AVX512_MASK(%rip), %zmm3
	movzbl	%r12b, %r13d
	kxorw	%k6, %k6, %k6
	kmovw	%r13d, %k5
	korw	%k6, %k5, %k1
	kmovw	%k1, %r13d
	vpcmpeqq	%zmm3, %zmm2, %k7
	vpsubq	%zmm3, %zmm2, %zmm2{%k7}
	vmovdqa64	%zmm2, (%rdi,%rax,8)
	jmp	.L158
	.p2align 4,,10
	.p2align 3
.L193:
	vmovdqa64	AVX512_MASK(%rip), %zmm8
	movzbl	%sil, %esi
	kxorw	%k2, %k2, %k2
	kmovw	%esi, %k4
	korw	%k2, %k4, %k2
	vpcmpeqq	%zmm8, %zmm7, %k3
	vpsubq	%zmm8, %zmm7, %zmm7{%k3}
	vmovdqa64	%zmm7, (%rdi,%rax,8)
	jmp	.L174
	.p2align 4,,10
	.p2align 3
.L194:
	vmovdqa64	AVX512_MASK(%rip), %zmm13
	movzbl	%sil, %esi
	kxorw	%k3, %k3, %k3
	kmovw	%esi, %k4
	korw	%k3, %k4, %k0
	vpcmpeqq	%zmm13, %zmm12, %k1
	vpsubq	%zmm13, %zmm12, %zmm12{%k1}
	vmovdqa64	%zmm12, (%rdi,%r12,8)
	jmp	.L176
	.p2align 4,,10
	.p2align 3
.L195:
	vmovdqa64	AVX512_MASK(%rip), %zmm2
	xorl	%esi, %esi
	movzbl	%r12b, %r12d
	kmovw	%esi, %k4
	kmovw	%r12d, %k3
	korw	%k4, %k3, %k0
	kmovw	%k0, %esi
	vpcmpeqq	%zmm2, %zmm0, %k1
	vpsubq	%zmm2, %zmm0, %zmm0{%k1}
	vmovdqa64	%zmm0, (%rdi,%r13,8)
	jmp	.L178
	.p2align 4,,10
	.p2align 3
.L161:
	xorl	%r13d, %r13d
	jmp	.L157
	.p2align 4,,10
	.p2align 3
.L197:
	leal	1(%rbx), %r8d
	movq	%r11, %rdi
	movslq	%r8d, %r12
	movq	%r12, %rsi
	call	limb_t_realloc
	movslq	%ebx, %r11
	movq	(%rax), %r9
	movq	$1, (%r9,%r11,8)
	movq	%r12, 16(%rax)
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L190:
	.cfi_restore_state
	vmovdqa64	AVX512_MASK(%rip), %zmm4
	movzbl	%r12b, %r13d
	kmovw	%r13d, %k7
	korw	%k6, %k7, %k2
	kmovw	%k2, %r13d
	vpcmpeqq	%zmm4, %zmm3, %k4
	vpsubq	%zmm4, %zmm3, %zmm3{%k4}
	vmovdqa64	%zmm3, (%rdi)
	jmp	.L165
.L192:
	vmovdqa64	AVX512_MASK(%rip), %zmm14
	xorl	%r13d, %r13d
	movzbl	%r12b, %r12d
	kmovw	%r13d, %k5
	kmovw	%r12d, %k7
	korw	%k5, %k7, %k6
	kmovw	%k6, %r13d
	vpcmpeqq	%zmm14, %zmm13, %k2
	vpsubq	%zmm14, %zmm13, %zmm13{%k2}
	vmovdqa64	%zmm13, (%rdi,%rax,8)
	jmp	.L170
.L191:
	vmovdqa64	AVX512_MASK(%rip), %zmm9
	xorl	%esi, %esi
	movzbl	%r12b, %r12d
	kmovw	%esi, %k2
	kmovw	%r12d, %k7
	korw	%k2, %k7, %k5
	kmovw	%k5, %esi
	vpcmpeqq	%zmm9, %zmm8, %k3
	vpsubq	%zmm9, %zmm8, %zmm8{%k3}
	vmovdqa64	%zmm8, (%rdi,%rax,8)
	jmp	.L167
	.cfi_endproc
.LFE6833:
	.size	__add_n, .-__add_n
	.p2align 4
	.globl	pml_add_n
	.type	pml_add_n, @function
pml_add_n:
.LFB6834:
	.cfi_startproc
	movq	16(%rsi), %rax
	testl	%eax, %eax
	je	.L201
	cmpl	$4, %eax
	jle	.L202
	jmp	__add_n
	.p2align 4,,10
	.p2align 3
.L201:
	ret
	.p2align 4,,10
	.p2align 3
.L202:
	jmp	___add_n_256
	.cfi_endproc
.LFE6834:
	.size	pml_add_n, .-pml_add_n
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
	xorl	%eax, %eax
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC17, %edx
	movl	$100, %esi
	movq	%rbx, %rdi
	call	snprintf
	movl	$.LC18, %esi
	movq	%rbx, %rdi
	leaq	224(%rsp), %r13
	call	open_gzfile
	movq	%rax, %rdi
	movq	%rax, %r15
	call	skip_first_line
	xorl	%edi, %edi
	call	time
	movl	%eax, %edi
	call	srand
	call	rand
	movl	$.LC19, %edi
	movslq	%eax, %rdx
	imulq	$351843721, %rdx, %rcx
	movl	%edx, %eax
	movq	%rdx, %rbp
	sarl	$31, %eax
	sarq	$45, %rcx
	subl	%eax, %ecx
	xorl	%eax, %eax
	imull	$100000, %ecx, %esi
	subl	%esi, %ebp
	xorl	%esi, %esi
	movl	%ebp, %edx
	call	printf
	movq	%r15, %rdi
	call	gzrewind
	movq	%r15, %rdi
	call	skip_first_line
	testl	%ebp, %ebp
	jle	.L204
	movl	%ebp, %edi
	xorl	%r12d, %r12d
	leaq	224(%rsp), %r13
	andl	$3, %edi
	je	.L207
	cmpl	$1, %edi
	je	.L278
	cmpl	$2, %edi
	je	.L279
	movl	$655360, %edx
	xorl	%esi, %esi
	movq	%r13, %rdi
	movl	$1, %r12d
	call	memset
	movl	$655360, %edx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L312
.L279:
	movl	$655360, %edx
	xorl	%esi, %esi
	movq	%r13, %rdi
	addl	$1, %r12d
	call	memset
	movl	$655360, %edx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L312
.L278:
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%r13, %rdi
	call	memset
	movl	$655360, %edx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L312
	addl	$1, %r12d
	cmpl	%r12d, %ebp
	je	.L204
.L207:
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%r13, %rdi
	call	memset
	movl	$655360, %edx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L312
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%r13, %rdi
	call	memset
	movl	$655360, %edx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L312
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%r13, %rdi
	call	memset
	movl	$655360, %edx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L312
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%r13, %rdi
	call	memset
	movl	$655360, %edx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L312
	addl	$4, %r12d
	cmpl	%r12d, %ebp
	jne	.L207
.L204:
	movl	$.LC21, %esi
	movq	%r13, %rdi
	call	strtok
	xorl	%edi, %edi
	movl	$.LC21, %esi
	movq	%rax, %r14
	call	strtok
	xorl	%edi, %edi
	movl	$.LC21, %esi
	movq	%rax, %rbx
	call	strtok
	testq	%r14, %r14
	sete	%r8b
	testq	%rbx, %rbx
	sete	%r9b
	orb	%r9b, %r8b
	jne	.L215
	testq	%rax, %rax
	je	.L215
	movq	%r14, %rdi
	leaq	16(%rsp), %r14
	call	limb_set_str
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	limb_set_str
	movq	%rbp, %rdi
	movq	%rax, %rsi
	movq	%rax, %r12
	call	limb_t_adjust_limb_sizes
	movq	16(%rbp), %rbx
	movl	$.LC23, %edi
	xorl	%eax, %eax
	movl	%ebx, %esi
	call	printf
	movslq	%ebx, %rdi
	call	limb_t_alloc
	movq	%rbp, %rsi
	movq	%r12, %rdx
	movq	%rax, %rdi
	movq	%rax, %r13
	call	pml_add_n
	xorl	%eax, %eax
	call	initialize_perf
	xorl	%eax, %eax
	call	start_perf
	xorl	%eax, %eax
	call	stop_perf
	movq	%r14, %rdi
	call	read_perf
	movl	$.LC24, %edi
	call	puts
	movq	stdout(%rip), %rdi
	movq	%r14, %rsi
	call	write_perf
	testl	%ebx, %ebx
	jle	.L210
	leal	-1(%rbx), %r10d
	movq	%rbp, %rdx
	movq	%r12, %rcx
	shrl	$6, %r10d
	salq	$6, %r10
	leaq	64(%rbp,%r10), %r11
	shrq	$6, %r10
	addq	$1, %r10
	andl	$7, %r10d
	je	.L211
	cmpq	$1, %r10
	je	.L280
	cmpq	$2, %r10
	je	.L281
	cmpq	$3, %r10
	je	.L282
	cmpq	$4, %r10
	je	.L283
	cmpq	$5, %r10
	je	.L284
	cmpq	$6, %r10
	je	.L285
	clflush	0(%rbp)
	clflush	(%r12)
	leaq	64(%rbp), %rdx
	leaq	64(%r12), %rcx
.L285:
	clflush	(%rdx)
	clflush	(%rcx)
	addq	$64, %rdx
	addq	$64, %rcx
.L284:
	clflush	(%rdx)
	clflush	(%rcx)
	addq	$64, %rdx
	addq	$64, %rcx
.L283:
	clflush	(%rdx)
	clflush	(%rcx)
	addq	$64, %rdx
	addq	$64, %rcx
.L282:
	clflush	(%rdx)
	clflush	(%rcx)
	addq	$64, %rdx
	addq	$64, %rcx
.L281:
	clflush	(%rdx)
	clflush	(%rcx)
	addq	$64, %rdx
	addq	$64, %rcx
.L280:
	clflush	(%rdx)
	clflush	(%rcx)
	addq	$64, %rdx
	addq	$64, %rcx
	cmpq	%rdx, %r11
	je	.L210
.L211:
	clflush	(%rdx)
	clflush	(%rcx)
	leaq	64(%rcx), %rax
	clflush	64(%rdx)
	clflush	(%rax)
	leaq	128(%rcx), %rsi
	clflush	128(%rdx)
	clflush	(%rsi)
	leaq	192(%rcx), %rdi
	clflush	192(%rdx)
	clflush	(%rdi)
	leaq	256(%rcx), %r8
	clflush	256(%rdx)
	clflush	(%r8)
	leaq	320(%rcx), %r9
	clflush	320(%rdx)
	clflush	(%r9)
	leaq	384(%rcx), %rbx
	clflush	384(%rdx)
	clflush	(%rbx)
	leaq	448(%rcx), %r14
	clflush	448(%rdx)
	clflush	(%r14)
	addq	$512, %rdx
	addq	$512, %rcx
	cmpq	%rdx, %r11
	jne	.L211
.L210:
	mfence
	movl	$.LC25, %edi
	leaq	64(%rsp), %rbx
	movl	$1, %r14d
	call	puts
	xorl	%eax, %eax
	call	start_perf
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	xorl	%eax, %eax
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
	movq	104(%rsp), %r10
	movq	96(%rsp), %r11
	subq	56(%rsp), %r10
	subq	48(%rsp), %r11
	movl	$.LC30, %edi
	movl	$1, %eax
	vcvtsi2sdq	%r10, %xmm2, %xmm0
	vcvtsi2sdq	%r11, %xmm2, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm3
	vmulsd	.LC29(%rip), %xmm3, %xmm0
	call	printf
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	.p2align 4
	.p2align 3
.L214:
	addq	%r14, %r14
#APP
# 232 "../myutils.h" 1
	CPUID
	RDTSC
	mov %edx, %edi
	mov %eax, %esi
	
# 0 "" 2
#NO_APP
	salq	$32, %rdi
	movl	%esi, %edx
	orq	%rdx, %rdi
	movq	%rdi, 8(%rsp)
	testq	%r14, %r14
	jle	.L212
	movq	%r14, %rcx
	xorl	%ebx, %ebx
	andl	$6, %ecx
	je	.L213
	cmpq	$1, %rcx
	je	.L286
	cmpq	$2, %rcx
	je	.L287
	cmpq	$3, %rcx
	je	.L288
	cmpq	$4, %rcx
	je	.L289
	cmpq	$5, %rcx
	je	.L290
	cmpq	$6, %rcx
	je	.L291
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movl	$1, %ebx
	call	pml_add_n
.L291:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L290:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L289:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L288:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L287:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L286:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
	cmpq	%rbx, %r14
	je	.L212
.L213:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$8, %rbx
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	cmpq	%rbx, %r14
	jne	.L213
.L212:
#APP
# 245 "../myutils.h" 1
	RDTSCP
	mov %edx, %r8d
	mov %eax, %r9d
	CPUID
	
# 0 "" 2
#NO_APP
	movq	%r8, %rax
	movq	8(%rsp), %r11
	movl	%r9d, %r10d
	salq	$32, %rax
	orq	%r10, %rax
	subq	%r11, %rax
	cmpq	$699999999, %rax
	jle	.L214
	vxorpd	%xmm4, %xmm4, %xmm4
	movl	$.LC31, %edi
	vcvtsi2sdq	%rax, %xmm4, %xmm5
	movl	$1, %eax
	vcvtsi2sdq	%r14, %xmm4, %xmm6
	vdivsd	%xmm6, %xmm5, %xmm0
	call	printf
	movq	%r15, %rdi
	call	gzclose
.L315:
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
.L312:
	.cfi_restore_state
	movq	%r15, %rdi
	call	gzeof
	testl	%eax, %eax
	jne	.L315
	jmp	.L309
.L215:
	movq	stderr(%rip), %rdi
	movq	%r13, %rdx
	movl	$.LC22, %esi
	xorl	%eax, %eax
	call	fprintf
	movq	%r15, %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	run_perf_test.cold, @function
run_perf_test.cold:
.LFSB6836:
.L309:
	.cfi_def_cfa_offset 655648
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
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
	je	.L318
	jg	.L319
	testl	%r14d, %r14d
	je	.L320
	cmpl	$1, %r14d
	jne	.L322
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
	jmp	.L324
	.p2align 4,,10
	.p2align 3
.L320:
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
.L324:
	movl	$.LC18, %esi
	movq	%rbx, %rdi
	call	open_gzfile
	movq	%rax, %rdi
	movq	%rax, (%rsp)
	call	skip_first_line
	movl	$0, 12(%rsp)
	movl	%r14d, 28(%rsp)
.L341:
	xorl	%eax, %eax
	call	init_memory_pool
	movq	(%rsp), %rdi
	movl	$655360, %edx
	leaq	144(%rsp), %rsi
	call	gzgets
	testq	%rax, %rax
	je	.L440
	movl	$.LC21, %esi
	leaq	144(%rsp), %rdi
	call	strtok
	xorl	%edi, %edi
	movl	$.LC21, %esi
	movq	%rax, %r12
	call	strtok
	xorl	%edi, %edi
	movl	$.LC21, %esi
	movq	%rax, %rbp
	call	strtok
	testq	%r12, %r12
	movq	%rax, %r15
	sete	%al
	testq	%rbp, %rbp
	sete	%dl
	orb	%dl, %al
	jne	.L348
	testq	%r15, %r15
	je	.L348
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
	call	pml_add_n
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
	jle	.L335
	call	__ctype_tolower_loc
	xorl	%r8d, %r8d
	leal	-1(%rbx), %r10d
	andl	$3, %ebx
	je	.L334
	cmpq	$1, %rbx
	je	.L397
	cmpq	$2, %rbx
	je	.L398
	movsbq	(%r15), %r11
	movq	(%rax), %rdx
	movl	$1, %r8d
	movl	(%rdx,%r11,4), %ebx
	movb	%bl, (%r15)
	movsbq	0(%rbp), %rsi
	movq	(%rax), %rcx
	movl	(%rcx,%rsi,4), %edi
	movb	%dil, 0(%rbp)
.L398:
	movsbq	(%r15,%r8), %r9
	movq	(%rax), %r11
	movl	(%r11,%r9,4), %edx
	movb	%dl, (%r15,%r8)
	movsbq	0(%rbp,%r8), %rbx
	movq	(%rax), %rsi
	movl	(%rsi,%rbx,4), %ecx
	movb	%cl, 0(%rbp,%r8)
	addq	$1, %r8
.L397:
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
	je	.L335
.L334:
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
	jne	.L334
.L335:
	movq	%r15, %rdi
	call	strlen
	movq	%rbp, %rdi
	movq	%rax, 16(%rsp)
	call	strlen
	movq	16(%rsp), %r10
	cmpq	%rax, %r10
	jne	.L441
	xorl	%ebx, %ebx
	testq	%r10, %r10
	je	.L337
	movq	%r10, %r8
	andl	$7, %r8d
	je	.L336
	cmpq	$1, %r8
	je	.L400
	cmpq	$2, %r8
	je	.L401
	cmpq	$3, %r8
	je	.L402
	cmpq	$4, %r8
	je	.L403
	cmpq	$5, %r8
	je	.L404
	cmpq	$6, %r8
	je	.L405
	movzbl	0(%rbp), %edi
	cmpb	%dil, (%r15)
	jne	.L436
	movl	$1, %ebx
.L405:
	movzbl	0(%rbp,%rbx), %esi
	cmpb	%sil, (%r15,%rbx)
	jne	.L436
	addq	$1, %rbx
.L404:
	movzbl	0(%rbp,%rbx), %ecx
	cmpb	%cl, (%r15,%rbx)
	jne	.L436
	addq	$1, %rbx
.L403:
	movzbl	0(%rbp,%rbx), %r9d
	cmpb	%r9b, (%r15,%rbx)
	jne	.L436
	addq	$1, %rbx
.L402:
	movzbl	0(%rbp,%rbx), %r11d
	cmpb	%r11b, (%r15,%rbx)
	jne	.L436
	addq	$1, %rbx
.L401:
	movzbl	0(%rbp,%rbx), %edx
	cmpb	%dl, (%r15,%rbx)
	jne	.L436
	addq	$1, %rbx
.L400:
	movzbl	0(%rbp,%rbx), %eax
	cmpb	%al, (%r15,%rbx)
	jne	.L436
	addq	$1, %rbx
	cmpq	%rbx, %r10
	je	.L337
.L336:
	movzbl	0(%rbp,%rbx), %r8d
	cmpb	%r8b, (%r15,%rbx)
	jne	.L436
	leaq	1(%rbx), %rsi
	movzbl	0(%rbp,%rsi), %edi
	movq	%rsi, %rbx
	cmpb	%dil, (%r15,%rsi)
	jne	.L436
	addq	$1, %rbx
	movzbl	0(%rbp,%rbx), %ecx
	cmpb	%cl, (%r15,%rbx)
	jne	.L436
	movzbl	2(%rbp,%rsi), %r9d
	leaq	2(%rsi), %rbx
	cmpb	%r9b, 2(%r15,%rsi)
	jne	.L436
	movzbl	3(%rbp,%rsi), %r11d
	leaq	3(%rsi), %rbx
	cmpb	%r11b, 3(%r15,%rsi)
	jne	.L436
	movzbl	4(%rbp,%rsi), %edx
	leaq	4(%rsi), %rbx
	cmpb	%dl, 4(%r15,%rsi)
	jne	.L436
	movzbl	5(%rbp,%rsi), %eax
	leaq	5(%rsi), %rbx
	cmpb	%al, 5(%r15,%rsi)
	jne	.L436
	movzbl	6(%rbp,%rsi), %r8d
	leaq	6(%rsi), %rbx
	cmpb	%r8b, 6(%r15,%rsi)
	jne	.L436
	leaq	7(%rsi), %rbx
	cmpq	%rbx, %r10
	jne	.L336
.L337:
	cmpb	$45, 26(%rsp)
	sete	%r15b
	cmpb	$45, 27(%rsp)
	sete	%bpl
	cmpb	%bpl, %r15b
	jne	.L442
	movq	%r13, %rdi
	call	limb_t_free
	movq	%r14, %rdi
	call	limb_t_free
	movq	%r12, %rdi
	call	limb_t_free
	xorl	%eax, %eax
	call	destroy_memory_pool
	addl	$1, 12(%rsp)
	movl	12(%rsp), %r13d
	cmpl	$100000, %r13d
	jne	.L341
	movl	28(%rsp), %r14d
.L342:
	movl	NUM_BITS(%rip), %esi
	cmpl	$2, %r14d
	je	.L343
	cmpl	$3, %r14d
	je	.L344
	cmpl	$1, %r14d
	je	.L345
	movl	$.LC44, %edi
	xorl	%eax, %eax
	call	printf
.L346:
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
.L441:
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
.L339:
	movl	12(%rsp), %esi
	movl	$.LC43, %edi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
	.p2align 4,,10
	.p2align 3
.L436:
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
	jmp	.L339
	.p2align 4,,10
	.p2align 3
.L319:
	cmpl	$3, %r14d
	jne	.L322
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
	jmp	.L324
	.p2align 4,,10
	.p2align 3
.L318:
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
	jmp	.L324
	.p2align 4,,10
	.p2align 3
.L442:
	movl	$.LC11, %edi
	call	puts
	jmp	.L339
.L440:
	movq	(%rsp), %rdi
	movl	28(%rsp), %r14d
	call	gzeof
	testl	%eax, %eax
	jne	.L342
	jmp	.L416
	.p2align 4,,10
	.p2align 3
.L345:
	movl	$.LC45, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L346
.L344:
	movl	$.LC47, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L346
.L343:
	movl	$.LC46, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L346
.L348:
	movq	stderr(%rip), %rdi
	leaq	144(%rsp), %rdx
	movl	$.LC22, %esi
	xorl	%eax, %eax
	call	fprintf
	movq	(%rsp), %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
.L322:
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
.L416:
	.cfi_def_cfa_offset 655568
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movl	$.LC20, %edi
	call	perror
	movq	(%rsp), %rdi
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
	.string	"Starting addition"
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
	.string	"experiments/results/rdtsc_measurements/random_%d_%d.csv.gz"
	.section	.rodata.str1.1
.LC75:
	.string	"wb"
	.section	.rodata.str1.8
	.align 8
.LC76:
	.string	"experiments/results/timespec_measurements/random_%d_%d.csv.gz"
	.align 8
.LC77:
	.string	"experiments/results/cputime_measurements/random_%d_%d.csv.gz"
	.align 8
.LC78:
	.string	"experiments/results/rdtsc_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC79:
	.string	"experiments/results/timespec_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC80:
	.string	"experiments/results/cputime_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC81:
	.string	"experiments/results/cputime_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC82:
	.string	"experiments/results/rdtsc_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC83:
	.string	"experiments/results/timespec_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC84:
	.string	"experiments/results/timespec_measurements/greater_%d_%d.csv.gz"
	.align 8
.LC85:
	.string	"experiments/results/cputime_measurements/greater_%d_%d.csv.gz"
	.align 8
.LC86:
	.string	"experiments/results/rdtsc_measurements/greater_%d_%d.csv.gz"
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
	je	.L444
	cmpl	$2, %ebx
	je	.L445
	testl	%ebx, %ebx
	jne	.L446
	movl	$.LC50, %edi
	call	puts
	movl	$.LC51, %edi
	call	create_directory
	cmpl	$2, %ebp
	je	.L447
	jg	.L448
	testl	%ebp, %ebp
	je	.L449
	cmpl	$1, %ebp
	jne	.L451
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC36, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	64(%rsp), %r15
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC37, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC78, %edx
	movl	CORE_NO(%rip), %r8d
.L828:
	movl	$100, %esi
	movq	%r15, %rdi
	xorl	%eax, %eax
	call	snprintf
	movl	$.LC75, %esi
	movq	%r15, %rdi
	call	open_gzfile
	movq	%rax, 16(%rsp)
.L514:
	movl	$.LC18, %esi
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
	movl	$.LC57, %edi
	xorl	%eax, %eax
	call	printf
	call	rand
	movl	$.LC19, %edi
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
	jle	.L469
	movl	%r12d, %edi
	andl	$3, %edi
	je	.L463
	cmpl	$1, %edi
	je	.L707
	cmpl	$2, %edi
	je	.L708
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
	je	.L811
.L708:
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
	je	.L811
.L707:
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%rbp, %rdi
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L811
	addl	$1, %r13d
	cmpl	%r13d, %r12d
	je	.L469
.L463:
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%rbp, %rdi
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L811
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%rbp, %rdi
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L811
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%rbp, %rdi
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L811
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%rbp, %rdi
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	je	.L811
	addl	$4, %r13d
	cmpl	%r13d, %r12d
	jne	.L463
.L469:
	movl	$.LC21, %esi
	movq	%rbp, %rdi
	call	strtok
	xorl	%edi, %edi
	movl	$.LC21, %esi
	movq	%rax, %r15
	call	strtok
	xorl	%edi, %edi
	movl	$.LC21, %esi
	movq	%rax, %r12
	call	strtok
	testq	%r15, %r15
	sete	%r8b
	testq	%r12, %r12
	sete	%r9b
	orb	%r9b, %r8b
	jne	.L464
	testq	%rax, %rax
	je	.L464
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
	movl	$.LC58, %edi
	movq	%rax, %r13
	call	puts
	testl	%r15d, %r15d
	jle	.L475
	leal	-1(%r15), %r10d
	movq	%rbp, %rax
	movq	%r12, %rcx
	shrl	$6, %r10d
	salq	$6, %r10
	leaq	64(%rbp,%r10), %r11
	shrq	$6, %r10
	addq	$1, %r10
	andl	$7, %r10d
	je	.L474
	cmpq	$1, %r10
	je	.L709
	cmpq	$2, %r10
	je	.L710
	cmpq	$3, %r10
	je	.L711
	cmpq	$4, %r10
	je	.L712
	cmpq	$5, %r10
	je	.L713
	cmpq	$6, %r10
	jne	.L830
.L714:
	clflush	(%rax)
	clflush	(%rcx)
	addq	$64, %rax
	addq	$64, %rcx
.L713:
	clflush	(%rax)
	clflush	(%rcx)
	addq	$64, %rax
	addq	$64, %rcx
.L712:
	clflush	(%rax)
	clflush	(%rcx)
	addq	$64, %rax
	addq	$64, %rcx
.L711:
	clflush	(%rax)
	clflush	(%rcx)
	addq	$64, %rax
	addq	$64, %rcx
.L710:
	clflush	(%rax)
	clflush	(%rcx)
	addq	$64, %rax
	addq	$64, %rcx
.L709:
	clflush	(%rax)
	clflush	(%rcx)
	addq	$64, %rax
	addq	$64, %rcx
	cmpq	%r11, %rax
	je	.L475
.L474:
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
	jne	.L474
.L475:
	mfence
	cmpl	$1, %ebx
	je	.L471
	cmpl	$2, %ebx
	je	.L472
	movl	$.LC59, %edi
	call	puts
	movq	stdout(%rip), %rdi
	call	fflush
	xorl	%eax, %eax
#APP
# 767 "add.c" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movl	$1, %r15d
	call	pml_add_n
	.p2align 4
	.p2align 3
.L477:
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
	jle	.L480
	movq	%r15, %r10
	andl	$7, %r10d
	je	.L479
	cmpq	$1, %r10
	je	.L716
	cmpq	$2, %r10
	je	.L717
	cmpq	$3, %r10
	je	.L718
	cmpq	$4, %r10
	je	.L719
	cmpq	$5, %r10
	je	.L720
	cmpq	$6, %r10
	je	.L721
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movl	$1, %ebx
	call	pml_add_n
.L721:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L720:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L719:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L718:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L717:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L716:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
	cmpq	%r15, %rbx
	je	.L480
.L479:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$8, %rbx
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	cmpq	%r15, %rbx
	jne	.L479
.L480:
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
	jle	.L477
	vxorpd	%xmm10, %xmm10, %xmm10
	movl	$.LC61, %edi
	vcvtsi2sdq	%rdx, %xmm10, %xmm11
	vmulsd	.LC60(%rip), %xmm11, %xmm12
	vcvtsi2sdq	%r15, %xmm10, %xmm13
	vcvttsd2siq	%xmm12, %r8
	vcvtsi2sdq	%r8, %xmm10, %xmm1
	vdivsd	%xmm13, %xmm1, %xmm14
	vmovsd	%xmm14, 8(%rsp)
	call	puts
	movl	$.LC62, %edi
	movl	$1, %eax
	vmovsd	8(%rsp), %xmm0
	call	printf
	movl	$.LC64, %edi
	xorl	%eax, %eax
	vmovsd	.LC63(%rip), %xmm15
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
	je	.L484
	movq	%r15, %r11
	andl	$7, %r11d
	je	.L481
	cmpq	$1, %r11
	je	.L723
	cmpq	$2, %r11
	je	.L724
	cmpq	$3, %r11
	je	.L725
	cmpq	$4, %r11
	je	.L726
	cmpq	$5, %r11
	je	.L727
	cmpq	$6, %r11
	je	.L728
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movl	$1, %ebx
	call	pml_add_n
.L728:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L727:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L726:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L725:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L724:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L723:
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %rsi
	call	pml_add_n
	movq	%rbx, %rdi
	addq	$1, %rbx
	cmpq	%rdi, 8(%rsp)
	je	.L484
.L481:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	leaq	7(%rbx), %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movq	%rdx, 32(%rsp)
	movq	%r12, %rdx
	addq	$8, %rbx
	call	pml_add_n
	movq	32(%rsp), %rcx
	cmpq	%rcx, 8(%rsp)
	jne	.L481
.L484:
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
	vmovsd	.LC65(%rip), %xmm2
	subq	%rax, %rbp
	vcvtusi2sdq	%rbp, %xmm7, %xmm4
	vmulsd	.LC60(%rip), %xmm4, %xmm5
	vmulsd	%xmm0, %xmm2, %xmm3
	vdivsd	%xmm5, %xmm3, %xmm8
	vcomisd	.LC29(%rip), %xmm8
	ja	.L517
	vmovsd	.LC29(%rip), %xmm6
	xorl	%esi, %esi
	vmovsd	.LC66(%rip), %xmm9
.L483:
	vmulsd	%xmm9, %xmm6, %xmm10
	leal	1(%rsi), %r8d
	movl	%r8d, %esi
	vcomisd	%xmm10, %xmm8
	ja	.L482
	vmulsd	%xmm9, %xmm10, %xmm11
	addl	$1, %esi
	vcomisd	%xmm11, %xmm8
	ja	.L482
	vmulsd	%xmm9, %xmm11, %xmm12
	leal	2(%r8), %esi
	vcomisd	%xmm12, %xmm8
	ja	.L482
	vmulsd	%xmm9, %xmm12, %xmm1
	leal	3(%r8), %esi
	vcomisd	%xmm1, %xmm8
	ja	.L482
	vmulsd	%xmm9, %xmm1, %xmm13
	leal	4(%r8), %esi
	vcomisd	%xmm13, %xmm8
	ja	.L482
	vmulsd	%xmm9, %xmm13, %xmm14
	leal	5(%r8), %esi
	vcomisd	%xmm14, %xmm8
	ja	.L482
	vmulsd	%xmm9, %xmm14, %xmm15
	leal	6(%r8), %esi
	vcomisd	%xmm15, %xmm8
	ja	.L482
	vmulsd	%xmm9, %xmm15, %xmm6
	leal	7(%r8), %esi
	vcomisd	%xmm6, %xmm8
	jbe	.L483
	.p2align 4
	.p2align 3
.L482:
	vmovapd	%xmm8, %xmm0
	movl	$.LC67, %edi
	movl	$1, %eax
	call	printf
	movq	%r14, %rdi
	call	gzclose
	movq	16(%rsp), %rdi
	call	gzclose
.L825:
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
.L445:
	.cfi_restore_state
	movl	$.LC54, %edi
	call	puts
	movl	$.LC55, %edi
	call	create_directory
	cmpl	$1, %ebp
	je	.L458
	jle	.L831
	cmpl	$2, %ebp
	je	.L461
	cmpl	$3, %ebp
	jne	.L451
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC40, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	400(%rsp), %r13
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC41, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC81, %edx
	movl	CORE_NO(%rip), %r8d
.L827:
	movl	$100, %esi
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	snprintf
	movl	$.LC75, %esi
	movq	%r13, %rdi
	call	open_gzfile
	movq	%rax, 48(%rsp)
	jmp	.L514
	.p2align 4,,10
	.p2align 3
.L444:
	movl	$.LC52, %edi
	call	puts
	movl	$.LC53, %edi
	call	create_directory
	cmpl	$2, %ebp
	je	.L453
	jg	.L454
	testl	%ebp, %ebp
	je	.L455
	cmpl	$1, %ebp
	jne	.L451
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC36, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	288(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC37, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC79, %edx
	movl	CORE_NO(%rip), %r8d
.L829:
	movl	$100, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	snprintf
	movl	$.LC75, %esi
	movq	%r12, %rdi
	call	open_gzfile
	movq	%rax, 32(%rsp)
	jmp	.L514
	.p2align 4,,10
	.p2align 3
.L831:
	testl	%ebp, %ebp
	jne	.L451
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC35, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	400(%rsp), %r13
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC17, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC77, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L827
.L454:
	cmpl	$3, %ebp
	jne	.L451
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC40, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	288(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC41, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC83, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L829
.L448:
	cmpl	$3, %ebp
	jne	.L451
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC40, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	64(%rsp), %r15
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC41, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC82, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L828
	.p2align 4,,10
	.p2align 3
.L811:
	movq	%r14, %rdi
	call	gzeof
	testl	%eax, %eax
	jne	.L825
	jmp	.L467
	.p2align 4,,10
	.p2align 3
.L472:
	movl	$.LC69, %edi
	call	puts
	movq	stdout(%rip), %rdi
	call	fflush
	xorl	%eax, %eax
#APP
# 844 "add.c" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movl	$1, %ebx
	call	pml_add_n
	jmp	.L501
	.p2align 4,,10
	.p2align 3
.L832:
	fstp	%st(0)
.L501:
	leaq	512(%rsp), %rsi
	xorl	%edi, %edi
	addq	%rbx, %rbx
	xorl	%r15d, %r15d
	call	getrusage
	fildq	512(%rsp)
	fmuls	.LC70(%rip)
	fildq	520(%rsp)
	faddp	%st, %st(1)
	fisttpq	8(%rsp)
	testq	%rbx, %rbx
	jle	.L503
	movq	%rbx, %rdi
	andl	$6, %edi
	je	.L500
	cmpq	$1, %rdi
	je	.L744
	cmpq	$2, %rdi
	je	.L745
	cmpq	$3, %rdi
	je	.L746
	cmpq	$4, %rdi
	je	.L747
	cmpq	$5, %rdi
	je	.L748
	cmpq	$6, %rdi
	je	.L749
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movl	$1, %r15d
	call	pml_add_n
.L749:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %r15
	call	pml_add_n
.L748:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %r15
	call	pml_add_n
.L747:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %r15
	call	pml_add_n
.L746:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %r15
	call	pml_add_n
.L745:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %r15
	call	pml_add_n
.L744:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %r15
	call	pml_add_n
	cmpq	%r15, %rbx
	je	.L503
.L500:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$8, %r15
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	cmpq	%r15, %rbx
	jne	.L500
.L503:
	leaq	512(%rsp), %rsi
	xorl	%edi, %edi
	call	getrusage
	fildq	512(%rsp)
	flds	.LC70(%rip)
	fxch	%st(1)
	fmuls	.LC70(%rip)
	fildq	520(%rsp)
	faddp	%st, %st(1)
	fildq	8(%rsp)
	fsubrp	%st, %st(1)
	fisttpq	8(%rsp)
	movq	8(%rsp), %r8
	cmpq	$249999, %r8
	jle	.L832
	vxorpd	%xmm3, %xmm3, %xmm3
	movl	$.LC61, %edi
	fstpt	16(%rsp)
	vcvtsi2sdq	%r8, %xmm3, %xmm1
	vcvtsi2sdq	%rbx, %xmm3, %xmm4
	vdivsd	%xmm4, %xmm1, %xmm5
	vmovsd	%xmm5, 8(%rsp)
	call	puts
	movl	$.LC62, %edi
	movl	$1, %eax
	vmovsd	8(%rsp), %xmm0
	call	printf
	movl	$.LC64, %edi
	xorl	%eax, %eax
	vmovsd	.LC63(%rip), %xmm8
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
	flds	.LC71(%rip)
	fxch	%st(1)
	fcomi	%st(1), %st
	jnb	.L504
	fstp	%st(1)
	fisttpq	16(%rsp)
.L505:
	xorl	%ebx, %ebx
	cmpq	$0, 8(%rsp)
	je	.L512
	movq	%r15, %r10
	addq	$1, %r10
	andl	$7, %r10d
	je	.L506
	cmpq	$1, %r10
	je	.L751
	cmpq	$2, %r10
	je	.L752
	cmpq	$3, %r10
	je	.L753
	cmpq	$4, %r10
	je	.L754
	cmpq	$5, %r10
	je	.L755
	cmpq	$6, %r10
	je	.L756
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movl	$1, %ebx
	call	pml_add_n
.L756:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L755:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L754:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L753:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L752:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L751:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%rbx, %r11
	addq	$1, %rbx
	cmpq	%r11, %r15
	je	.L512
.L506:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	leaq	7(%rbx), %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movq	%rdx, 32(%rsp)
	movq	%r12, %rdx
	addq	$8, %rbx
	call	pml_add_n
	movq	32(%rsp), %rax
	cmpq	%rax, %r15
	jne	.L506
.L512:
	xorl	%edi, %edi
	leaq	512(%rsp), %rsi
	call	getrusage
	fildq	512(%rsp)
	fmuls	.LC70(%rip)
	movl	$.LC72, %edi
	fildq	520(%rsp)
	faddp	%st, %st(1)
	fstpt	32(%rsp)
	call	puts
	vxorpd	%xmm10, %xmm10, %xmm10
	movq	16(%rsp), %rbp
	vmovsd	.LC65(%rip), %xmm12
	vcvtsi2sdq	8(%rsp), %xmm10, %xmm11
	testq	%rbp, %rbp
	movq	%rbp, 8(%rsp)
	fildq	8(%rsp)
	vmulsd	%xmm11, %xmm12, %xmm13
	fldt	32(%rsp)
	jns	.L507
	fxch	%st(1)
	fadds	.LC73(%rip)
	fxch	%st(1)
.L507:
	fsubp	%st, %st(1)
	flds	.LC71(%rip)
	fxch	%st(1)
	fcomi	%st(1), %st
	jnb	.L508
	fstp	%st(1)
	fisttpq	8(%rsp)
	movq	8(%rsp), %r12
.L509:
	vxorpd	%xmm14, %xmm14, %xmm14
	vcvtusi2sdq	%r12, %xmm14, %xmm15
	vdivsd	%xmm15, %xmm13, %xmm6
	vcomisd	.LC29(%rip), %xmm6
	ja	.L522
	vmovsd	.LC29(%rip), %xmm9
	xorl	%esi, %esi
	vmovsd	.LC66(%rip), %xmm7
.L511:
	vmulsd	%xmm7, %xmm9, %xmm0
	leal	1(%rsi), %r13d
	movl	%r13d, %esi
	vcomisd	%xmm0, %xmm6
	ja	.L510
	vmulsd	%xmm7, %xmm0, %xmm2
	addl	$1, %esi
	vcomisd	%xmm2, %xmm6
	ja	.L510
	vmulsd	%xmm7, %xmm2, %xmm3
	leal	2(%r13), %esi
	vcomisd	%xmm3, %xmm6
	ja	.L510
	vmulsd	%xmm7, %xmm3, %xmm1
	leal	3(%r13), %esi
	vcomisd	%xmm1, %xmm6
	ja	.L510
	vmulsd	%xmm7, %xmm1, %xmm4
	leal	4(%r13), %esi
	vcomisd	%xmm4, %xmm6
	ja	.L510
	vmulsd	%xmm7, %xmm4, %xmm5
	leal	5(%r13), %esi
	vcomisd	%xmm5, %xmm6
	ja	.L510
	vmulsd	%xmm7, %xmm5, %xmm8
	leal	6(%r13), %esi
	vcomisd	%xmm8, %xmm6
	ja	.L510
	vmulsd	%xmm7, %xmm8, %xmm9
	leal	7(%r13), %esi
	vcomisd	%xmm9, %xmm6
	jbe	.L511
	.p2align 4
	.p2align 3
.L510:
	vmovapd	%xmm6, %xmm0
	movl	$.LC67, %edi
	movl	$1, %eax
	call	printf
	movq	%r14, %rdi
	call	gzclose
	movq	48(%rsp), %rdi
	call	gzclose
	jmp	.L825
	.p2align 4,,10
	.p2align 3
.L471:
	movl	$.LC68, %edi
	call	puts
	movq	stdout(%rip), %rdi
	call	fflush
	xorl	%eax, %eax
#APP
# 805 "add.c" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movl	$1, %ebx
	call	pml_add_n
	.p2align 4
	.p2align 3
.L492:
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
	jle	.L491
	movq	%rbx, %rdx
	andl	$7, %edx
	je	.L490
	cmpq	$1, %rdx
	je	.L730
	cmpq	$2, %rdx
	je	.L731
	cmpq	$3, %rdx
	je	.L732
	cmpq	$4, %rdx
	je	.L733
	cmpq	$5, %rdx
	je	.L734
	cmpq	$6, %rdx
	je	.L735
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movl	$1, %r15d
	call	pml_add_n
.L735:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %r15
	call	pml_add_n
.L734:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %r15
	call	pml_add_n
.L733:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %r15
	call	pml_add_n
.L732:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %r15
	call	pml_add_n
.L731:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %r15
	call	pml_add_n
.L730:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %r15
	call	pml_add_n
	cmpq	%rbx, %r15
	je	.L491
.L490:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$8, %r15
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	cmpq	%rbx, %r15
	jne	.L490
.L491:
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
	jns	.L489
	movq	8(%rsp), %rax
	leaq	1000000000(%rdi), %r10
	subq	$1, %r8
	subq	%rax, %r10
.L489:
	imulq	$1000000000, %r8, %r11
	addq	%r11, %r10
	cmpq	$249999999, %r10
	jle	.L492
	movabsq	$2361183241434822607, %rax
	vxorpd	%xmm6, %xmm6, %xmm6
	movl	$.LC61, %edi
	imulq	%r10
	sarq	$63, %r10
	vcvtsi2sdq	%rbx, %xmm6, %xmm0
	sarq	$7, %rdx
	subq	%r10, %rdx
	vcvtsi2sdq	%rdx, %xmm6, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm7
	vmovsd	%xmm7, 8(%rsp)
	call	puts
	movl	$.LC62, %edi
	movl	$1, %eax
	vmovsd	8(%rsp), %xmm0
	call	printf
	movl	$.LC64, %edi
	xorl	%eax, %eax
	vmovsd	.LC63(%rip), %xmm2
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
	je	.L496
	movq	%r15, %r8
	andl	$7, %r8d
	je	.L493
	cmpq	$1, %r8
	je	.L737
	cmpq	$2, %r8
	je	.L738
	cmpq	$3, %r8
	je	.L739
	cmpq	$4, %r8
	je	.L740
	cmpq	$5, %r8
	je	.L741
	cmpq	$6, %r8
	je	.L742
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movl	$1, %ebx
	call	pml_add_n
.L742:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L741:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L740:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L739:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L738:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	addq	$1, %rbx
	call	pml_add_n
.L737:
	movq	%rbp, %rsi
	movq	%r12, %rdx
	movq	%r13, %rdi
	call	pml_add_n
	movq	%rbx, %rsi
	addq	$1, %rbx
	cmpq	%rsi, 8(%rsp)
	je	.L496
.L493:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pml_add_n
	leaq	7(%rbx), %r9
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movq	%r9, 56(%rsp)
	addq	$8, %rbx
	call	pml_add_n
	movq	56(%rsp), %r10
	cmpq	%r10, 8(%rsp)
	jne	.L493
.L496:
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
	jns	.L495
	movq	48(%rsp), %rax
	leaq	1000000000(%rbp), %rcx
	subq	$1, %r12
	subq	%rax, %rcx
.L495:
	imulq	$1000000000, %r12, %rdx
	vxorpd	%xmm4, %xmm4, %xmm4
	movabsq	$2361183241434822607, %rax
	vmovsd	.LC65(%rip), %xmm8
	vcvtsi2sdq	%r15, %xmm4, %xmm5
	addq	%rdx, %rcx
	imulq	%rcx
	sarq	$63, %rcx
	vmulsd	%xmm5, %xmm8, %xmm9
	sarq	$7, %rdx
	subq	%rcx, %rdx
	vcvtusi2sdq	%rdx, %xmm4, %xmm10
	vdivsd	%xmm10, %xmm9, %xmm11
	vcomisd	.LC29(%rip), %xmm11
	ja	.L519
	vmovsd	.LC29(%rip), %xmm2
	xorl	%esi, %esi
	vmovsd	.LC66(%rip), %xmm12
.L498:
	vmulsd	%xmm12, %xmm2, %xmm13
	leal	1(%rsi), %r15d
	movl	%r15d, %esi
	vcomisd	%xmm13, %xmm11
	ja	.L497
	vmulsd	%xmm12, %xmm13, %xmm14
	addl	$1, %esi
	vcomisd	%xmm14, %xmm11
	ja	.L497
	vmulsd	%xmm12, %xmm14, %xmm15
	leal	2(%r15), %esi
	vcomisd	%xmm15, %xmm11
	ja	.L497
	vmulsd	%xmm12, %xmm15, %xmm6
	leal	3(%r15), %esi
	vcomisd	%xmm6, %xmm11
	ja	.L497
	vmulsd	%xmm12, %xmm6, %xmm1
	leal	4(%r15), %esi
	vcomisd	%xmm1, %xmm11
	ja	.L497
	vmulsd	%xmm12, %xmm1, %xmm0
	leal	5(%r15), %esi
	vcomisd	%xmm0, %xmm11
	ja	.L497
	vmulsd	%xmm12, %xmm0, %xmm7
	leal	6(%r15), %esi
	vcomisd	%xmm7, %xmm11
	ja	.L497
	vmulsd	%xmm12, %xmm7, %xmm2
	leal	7(%r15), %esi
	vcomisd	%xmm2, %xmm11
	jbe	.L498
	.p2align 4
	.p2align 3
.L497:
	vmovapd	%xmm11, %xmm0
	movl	$.LC67, %edi
	movl	$1, %eax
	call	printf
	movq	%r14, %rdi
	call	gzclose
	movq	32(%rsp), %rdi
	call	gzclose
	jmp	.L825
.L458:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC36, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	400(%rsp), %r13
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC37, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC80, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L827
.L461:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC38, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	400(%rsp), %r13
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC39, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC85, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L827
.L447:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC38, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	64(%rsp), %r15
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC39, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC86, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L828
.L449:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC35, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	64(%rsp), %r15
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC17, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC74, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L828
.L455:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC35, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	288(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC17, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC76, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L829
.L453:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC38, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %r14
	leaq	288(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$.LC39, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC84, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L829
.L508:
	fsubp	%st, %st(1)
	fisttpq	8(%rsp)
	movq	8(%rsp), %r12
	btcq	$63, %r12
	jmp	.L509
.L504:
	fsubp	%st, %st(1)
	fisttpq	16(%rsp)
	movq	16(%rsp), %r9
	btcq	$63, %r9
	movq	%r9, 16(%rsp)
	jmp	.L505
.L830:
	clflush	0(%rbp)
	clflush	(%r12)
	leaq	64(%rbp), %rax
	leaq	64(%r12), %rcx
	jmp	.L714
.L522:
	xorl	%esi, %esi
	jmp	.L510
.L519:
	xorl	%esi, %esi
	jmp	.L497
.L517:
	xorl	%esi, %esi
	jmp	.L482
.L446:
	movl	$.LC56, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L451:
	movl	$.LC42, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L464:
	movq	stderr(%rip), %rdi
	movq	%rbp, %rdx
	movl	$.LC22, %esi
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
.LFSB6838:
.L467:
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
	.string	"add.c"
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
	je	.L834
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
.L833:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L834:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	testl	%eax, %eax
	jle	.L850
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
	js	.L838
	movq	16(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	$84, %edi
	movq	%rax, %rbp
	call	sysconf
	movslq	%ebp, %rdx
	cmpq	%rax, %rdx
	jge	.L838
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
	js	.L840
	movq	24(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	$3, %eax
	jg	.L840
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
	js	.L842
	movq	32(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	$2, %eax
	jg	.L842
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
	js	.L844
	movq	40(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	$2, %eax
	jg	.L844
	movq	40(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	movq	%rax, %rbx
	xorl	%eax, %eax
	call	init_memory_pool
	cmpl	$1, %ebx
	je	.L845
	cmpl	$2, %ebx
	je	.L846
	testl	%ebx, %ebx
	jne	.L847
	movl	%r12d, %edi
	call	run_correctness_test
.L848:
	xorl	%eax, %eax
	call	destroy_memory_pool
	xorl	%eax, %eax
	jmp	.L833
.L846:
	xorl	%eax, %eax
	call	run_perf_test
	jmp	.L848
.L845:
	movl	%ebp, %esi
	movl	%r12d, %edi
	call	run_benchmarking_test
	jmp	.L848
.L850:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$206, %edx
	movl	$.LC99, %esi
	movl	$.LC100, %edi
	call	__assert_fail
.L838:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$209, %edx
	movl	$.LC99, %esi
	movl	$.LC101, %edi
	call	__assert_fail
.L840:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$212, %edx
	movl	$.LC99, %esi
	movl	$.LC102, %edi
	call	__assert_fail
.L842:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$215, %edx
	movl	$.LC99, %esi
	movl	$.LC103, %edi
	call	__assert_fail
.L844:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$218, %edx
	movl	$.LC99, %esi
	movl	$.LC104, %edi
	call	__assert_fail
.L847:
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
