	.file	"mul.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Error opening file %s: %s\n"
	.text
	.p2align 4
	.type	open_gzfile.part.0, @function
open_gzfile.part.0:
.LFB6846:
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
.LFE6846:
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
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movslq	%edx, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movzbl	(%rdi), %r14d
	movzbl	(%rsi), %r13d
	cmpb	$45, %r14b
	sete	%al
	addq	%rax, %rdi
	xorl	%eax, %eax
	cmpb	$45, %r13b
	sete	%al
	addq	%rax, %r12
	call	trim_leading_zeros_and_whitespace
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	trim_leading_zeros_and_whitespace
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	trim_trailing_newline
	movq	%r12, %rdi
	call	trim_trailing_newline
	testl	%ebx, %ebx
	jle	.L28
	call	__ctype_tolower_loc
	xorl	%edx, %edx
	.p2align 6
	.p2align 4
	.p2align 3
.L29:
	movsbq	0(%rbp,%rdx), %rsi
	movq	(%rax), %rcx
	movl	(%rcx,%rsi,4), %ecx
	movb	%cl, 0(%rbp,%rdx)
	movsbq	(%r12,%rdx), %rsi
	movq	(%rax), %rcx
	movl	(%rcx,%rsi,4), %ecx
	movb	%cl, (%r12,%rdx)
	addq	$1, %rdx
	cmpq	%rbx, %rdx
	jne	.L29
.L28:
	movq	%rbp, %rdi
	call	strlen
	movq	%r12, %rdi
	movq	%rax, %r15
	call	strlen
	cmpq	%rax, %r15
	jne	.L30
	xorl	%ebx, %ebx
	testq	%r15, %r15
	jne	.L31
	jmp	.L32
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L34:
	addq	$1, %rbx
	cmpq	%r15, %rbx
	je	.L32
.L31:
	movzbl	(%r12,%rbx), %eax
	cmpb	%al, 0(%rbp,%rbx)
	je	.L34
	movl	$.LC8, %edi
	call	puts
	movq	%rbx, %rsi
	movl	$.LC9, %edi
	xorl	%eax, %eax
	call	printf
	movsbl	0(%rbp,%rbx), %edx
	movq	%rbx, %rsi
	movq	%rbx, %rcx
	movsbl	(%r12,%rbx), %r8d
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	printf
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movl	$.LC11, %edi
	xorl	%eax, %eax
	call	printf
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
.L32:
	.cfi_restore_state
	cmpb	$45, %r14b
	movl	$1, %eax
	sete	%cl
	cmpb	$45, %r13b
	sete	%dl
	cmpb	%dl, %cl
	je	.L25
	movl	$.LC12, %edi
	call	puts
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L30:
	movl	$.LC5, %edi
	call	puts
	movq	%r12, %rdi
	call	strlen
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	strlen
	movq	%rbx, %rdx
	movl	$.LC6, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	printf
	movq	%r12, %rdx
	movq	%rbp, %rsi
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
	jne	.L47
	cmpb	$0, 1(%rax)
	jne	.L47
.L44:
	movq	%rbp, %rdi
	call	free
	movl	$511, %esi
	movq	%rbx, %rdi
	call	mkdir
	testl	%eax, %eax
	je	.L61
	call	__errno_location
	movl	(%rax), %edi
	cmpl	$17, %edi
	jne	.L63
.L61:
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
.L47:
	.cfi_restore_state
	cmpl	$47, %edx
	je	.L64
.L48:
	movq	%rax, %rdi
	call	create_directory
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L64:
	cmpb	$0, 1(%rax)
	je	.L44
	jmp	.L48
.L63:
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
	je	.L68
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L68:
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
	je	.L71
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
.L71:
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
	.globl	__mul_acc_mul_AVX
	.type	__mul_acc_mul_AVX, @function
__mul_acc_mul_AVX:
.LFB6832:
	.cfi_startproc
	vmovdqa64	.LC16(%rip), %zmm2
	movq	(%rdi), %rax
	vmovdqa64	.LC17(%rip), %zmm3
	vpmovzxdq	(%rax), %zmm0
	movq	(%rsi), %rax
	vpmovzxdq	(%rax), %zmm1
	vpermq	%zmm0, %zmm2, %zmm2
	vpermq	%zmm1, %zmm3, %zmm3
	vpmuludq	%zmm3, %zmm2, %zmm2
	vmovdqa64	.LC19(%rip), %zmm3
	vpermq	%zmm1, %zmm3, %zmm3
	vmovdqa64	%zmm2, (%rdx)
	vmovdqa64	.LC18(%rip), %zmm2
	vpermq	%zmm0, %zmm2, %zmm2
	vpmuludq	%zmm3, %zmm2, %zmm2
	vmovdqa64	.LC21(%rip), %zmm3
	vpermq	%zmm1, %zmm3, %zmm3
	vmovdqa64	%zmm2, 64(%rdx)
	vmovdqa64	.LC20(%rip), %zmm2
	vpermq	%zmm0, %zmm2, %zmm2
	vpmuludq	%zmm3, %zmm2, %zmm2
	vmovdqa64	.LC23(%rip), %zmm3
	vpermq	%zmm1, %zmm3, %zmm3
	vmovdqa64	%zmm2, 128(%rdx)
	vmovdqa64	.LC22(%rip), %zmm2
	vpermq	%zmm0, %zmm2, %zmm2
	vpmuludq	%zmm3, %zmm2, %zmm2
	vmovdqa64	%zmm2, 192(%rdx)
	vmovdqa64	.LC24(%rip), %zmm2
	vpermq	%zmm0, %zmm2, %zmm2
	vpmuludq	%zmm3, %zmm2, %zmm2
	vmovdqa64	.LC26(%rip), %zmm3
	vpermq	%zmm1, %zmm3, %zmm3
	vmovdqa64	%zmm2, 256(%rdx)
	vmovdqa64	.LC25(%rip), %zmm2
	vpermq	%zmm0, %zmm2, %zmm2
	vpmuludq	%zmm3, %zmm2, %zmm2
	vmovdqa64	.LC28(%rip), %zmm3
	vpermq	%zmm1, %zmm3, %zmm3
	vmovdqa64	%zmm2, 320(%rdx)
	vmovdqa64	.LC27(%rip), %zmm2
	vpermq	%zmm0, %zmm2, %zmm2
	vpmuludq	%zmm3, %zmm2, %zmm2
	vmovdqa64	%zmm2, 384(%rdx)
	vmovdqa64	.LC29(%rip), %zmm2
	vpermq	%zmm0, %zmm2, %zmm0
	vmovdqa64	.LC30(%rip), %zmm2
	vpermq	%zmm1, %zmm2, %zmm1
	vpmuludq	%zmm1, %zmm0, %zmm0
	vmovdqa64	%zmm0, 448(%rdx)
	vzeroupper
	ret
	.cfi_endproc
.LFE6832:
	.size	__mul_acc_mul_AVX, .-__mul_acc_mul_AVX
	.p2align 4
	.globl	__mul_add_limbs
	.type	__mul_add_limbs, @function
__mul_add_limbs:
.LFB6834:
	.cfi_startproc
	movq	16(%rdi), %rcx
	movq	8(%rdi), %rdx
	xorl	%r9d, %r9d
	movq	%rcx, %r8
	addq	%rdx, %r8
	movq	32(%rdi), %r8
	adcq	$0, %r9
	movq	%r9, %rax
	xorl	%r9d, %r9d
	salq	$32, %rax
	addq	%rax, (%rdi)
	addq	24(%rdi), %r8
	adcq	$0, %r9
	addq	40(%rdi), %r8
	adcq	$0, %r9
	addq	%rcx, %rdx
	movq	%r9, %rax
	salq	$32, %rax
	addq	%rdx, %rax
	xorl	%edx, %edx
	movq	%rax, 8(%rdi)
	movq	56(%rdi), %rax
	addq	48(%rdi), %rax
	adcq	$0, %rdx
	addq	64(%rdi), %rax
	adcq	$0, %rdx
	addq	72(%rdi), %rax
	adcq	$0, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rax
	xorl	%edx, %edx
	salq	$32, %rax
	addq	%r8, %rax
	movq	%rax, 16(%rdi)
	movq	88(%rdi), %rax
	addq	80(%rdi), %rax
	adcq	$0, %rdx
	addq	96(%rdi), %rax
	adcq	$0, %rdx
	addq	104(%rdi), %rax
	adcq	$0, %rdx
	addq	112(%rdi), %rax
	adcq	$0, %rdx
	movq	%rax, %rcx
	movq	%rdx, %rax
	xorl	%edx, %edx
	salq	$32, %rax
	addq	%rsi, %rax
	movq	%rax, 24(%rdi)
	movq	128(%rdi), %rax
	addq	120(%rdi), %rax
	adcq	$0, %rdx
	addq	136(%rdi), %rax
	adcq	$0, %rdx
	addq	144(%rdi), %rax
	adcq	$0, %rdx
	addq	152(%rdi), %rax
	adcq	$0, %rdx
	addq	160(%rdi), %rax
	adcq	$0, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rax
	xorl	%edx, %edx
	salq	$32, %rax
	addq	%rcx, %rax
	movq	%rax, 32(%rdi)
	movq	176(%rdi), %rax
	addq	168(%rdi), %rax
	adcq	$0, %rdx
	addq	184(%rdi), %rax
	adcq	$0, %rdx
	addq	192(%rdi), %rax
	adcq	$0, %rdx
	addq	200(%rdi), %rax
	adcq	$0, %rdx
	addq	208(%rdi), %rax
	adcq	$0, %rdx
	addq	216(%rdi), %rax
	adcq	$0, %rdx
	movq	%rax, %rcx
	movq	%rdx, %rax
	xorl	%edx, %edx
	salq	$32, %rax
	addq	%rsi, %rax
	movq	%rax, 40(%rdi)
	movq	224(%rdi), %rax
	addq	232(%rdi), %rax
	adcq	$0, %rdx
	addq	240(%rdi), %rax
	adcq	$0, %rdx
	addq	248(%rdi), %rax
	adcq	$0, %rdx
	addq	256(%rdi), %rax
	adcq	$0, %rdx
	addq	264(%rdi), %rax
	adcq	$0, %rdx
	addq	272(%rdi), %rax
	adcq	$0, %rdx
	addq	280(%rdi), %rax
	adcq	$0, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rax
	xorl	%edx, %edx
	salq	$32, %rax
	addq	%rcx, %rax
	movq	%rax, 48(%rdi)
	movq	288(%rdi), %rax
	addq	296(%rdi), %rax
	adcq	$0, %rdx
	addq	304(%rdi), %rax
	adcq	$0, %rdx
	addq	312(%rdi), %rax
	adcq	$0, %rdx
	addq	320(%rdi), %rax
	adcq	$0, %rdx
	addq	328(%rdi), %rax
	adcq	$0, %rdx
	addq	336(%rdi), %rax
	adcq	$0, %rdx
	movq	%rax, %rcx
	movq	%rdx, %rax
	xorl	%edx, %edx
	salq	$32, %rax
	addq	%rsi, %rax
	movq	%rax, 56(%rdi)
	movq	352(%rdi), %rax
	addq	344(%rdi), %rax
	adcq	$0, %rdx
	addq	360(%rdi), %rax
	adcq	$0, %rdx
	addq	368(%rdi), %rax
	adcq	$0, %rdx
	addq	376(%rdi), %rax
	adcq	$0, %rdx
	addq	384(%rdi), %rax
	adcq	$0, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rax
	xorl	%edx, %edx
	salq	$32, %rax
	addq	%rcx, %rax
	movq	%rax, 64(%rdi)
	movq	400(%rdi), %rax
	addq	392(%rdi), %rax
	movq	440(%rdi), %r8
	adcq	$0, %rdx
	addq	408(%rdi), %rax
	movq	472(%rdi), %r10
	adcq	$0, %rdx
	addq	416(%rdi), %rax
	movq	496(%rdi), %rcx
	adcq	$0, %rdx
	addq	424(%rdi), %rax
	adcq	$0, %rdx
	xorl	%r9d, %r9d
	salq	$32, %rdx
	addq	%rsi, %rdx
	addq	432(%rdi), %r8
	adcq	$0, %r9
	addq	448(%rdi), %r8
	movq	%rdx, 72(%rdi)
	adcq	$0, %r9
	addq	456(%rdi), %r8
	adcq	$0, %r9
	xorl	%r11d, %r11d
	movq	%r9, %rdx
	salq	$32, %rdx
	addq	464(%rdi), %r10
	adcq	$0, %r11
	addq	480(%rdi), %r10
	leaq	(%rax,%rdx), %rax
	adcq	$0, %r11
	movq	%rax, 80(%rdi)
	xorl	%r9d, %r9d
	movq	%r11, %rax
	salq	$32, %rax
	addq	%r8, %rax
	movq	%rcx, %r8
	movq	%rax, 88(%rdi)
	movq	488(%rdi), %rax
	addq	%rax, %r8
	adcq	$0, %r9
	addq	%rcx, %rax
	movq	%r9, %rdx
	vmovq	%rax, %xmm1
	vpinsrq	$1, 504(%rdi), %xmm1, %xmm0
	salq	$32, %rdx
	addq	%r10, %rdx
	vmovdqu	%xmm0, 104(%rdi)
	movq	%rdx, 96(%rdi)
	ret
	.cfi_endproc
.LFE6834:
	.size	__mul_add_limbs, .-__mul_add_limbs
	.p2align 4
	.globl	__mul_adjust_limbs
	.type	__mul_adjust_limbs, @function
__mul_adjust_limbs:
.LFB6835:
	.cfi_startproc
	movq	8(%rdi), %rax
	movq	(%rdi), %rdx
	xorl	%esi, %esi
	movq	16(%rdi), %r8
	movq	%rax, %rcx
	shrq	$32, %rcx
	addl	%edx, %ecx
	setc	%sil
	shrq	$32, %rdx
	andl	$1, %esi
	salq	$32, %rcx
	addq	%rdx, %rsi
	movq	24(%rdi), %rdx
	orq	%rcx, %rsi
	movq	%r8, %rcx
	shrq	$32, %rcx
	addl	%eax, %ecx
	setc	%al
	movzbl	%al, %eax
	salq	$32, %rax
	addq	%rsi, %rax
	movq	%rax, (%rdi)
	movq	%rdx, %rax
	shrq	$32, %rax
	addl	%r8d, %eax
	movq	32(%rdi), %r8
	adcl	$0, %ecx
	salq	$32, %rax
	movq	%r8, %rsi
	orq	%rax, %rcx
	movq	40(%rdi), %rax
	shrq	$32, %rsi
	addl	%edx, %esi
	setc	%dl
	movzbl	%dl, %edx
	salq	$32, %rdx
	addq	%rcx, %rdx
	movq	%rdx, 8(%rdi)
	movq	%rax, %rdx
	shrq	$32, %rdx
	addl	%edx, %r8d
	movq	56(%rdi), %rdx
	adcl	$0, %esi
	salq	$32, %r8
	orq	%r8, %rsi
	movq	48(%rdi), %r8
	movq	%r8, %rcx
	shrq	$32, %rcx
	addl	%eax, %ecx
	setc	%al
	movzbl	%al, %eax
	salq	$32, %rax
	addq	%rsi, %rax
	movq	%rax, 16(%rdi)
	movq	%rdx, %rax
	shrq	$32, %rax
	addl	%eax, %r8d
	movq	72(%rdi), %rax
	adcl	$0, %ecx
	salq	$32, %r8
	orq	%r8, %rcx
	movq	64(%rdi), %r8
	movq	%r8, %rsi
	shrq	$32, %rsi
	addl	%edx, %esi
	setc	%dl
	movzbl	%dl, %edx
	salq	$32, %rdx
	addq	%rcx, %rdx
	movq	%rdx, 24(%rdi)
	movq	%rax, %rdx
	shrq	$32, %rdx
	addl	%edx, %r8d
	movq	88(%rdi), %rdx
	adcl	$0, %esi
	salq	$32, %r8
	orq	%r8, %rsi
	movq	80(%rdi), %r8
	movq	%r8, %rcx
	shrq	$32, %rcx
	addl	%eax, %ecx
	setc	%al
	movzbl	%al, %eax
	salq	$32, %rax
	addq	%rsi, %rax
	movq	96(%rdi), %rsi
	movq	%rax, 32(%rdi)
	movq	%rdx, %rax
	shrq	$32, %rax
	addl	%eax, %r8d
	movq	104(%rdi), %rax
	adcl	$0, %ecx
	salq	$32, %r8
	orq	%r8, %rcx
	movq	%rsi, %r8
	shrq	$32, %r8
	addl	%r8d, %edx
	setc	%r8b
	movzbl	%r8b, %r8d
	salq	$32, %r8
	addq	%r8, %rcx
	movq	%rcx, 40(%rdi)
	movq	%rax, %rcx
	shrq	$32, %rcx
	addl	%ecx, %esi
	movq	112(%rdi), %rcx
	adcl	$0, %edx
	salq	$32, %rsi
	orq	%rsi, %rdx
	movq	%rcx, %rsi
	shrq	$32, %rsi
	addl	%esi, %eax
	setc	%sil
	movl	%eax, %eax
	salq	$32, %rcx
	movzbl	%sil, %esi
	orq	%rcx, %rax
	salq	$32, %rsi
	movq	%rax, 56(%rdi)
	addq	%rsi, %rdx
	movq	%rdx, 48(%rdi)
	ret
	.cfi_endproc
.LFE6835:
	.size	__mul_adjust_limbs, .-__mul_adjust_limbs
	.p2align 4
	.globl	limb_mul_n
	.type	limb_mul_n, @function
limb_mul_n:
.LFB6836:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	call	__mul_acc_mul_AVX
	movq	%rdx, %rdi
	call	__mul_add_limbs
	vzeroupper
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	__mul_adjust_limbs
	.cfi_endproc
.LFE6836:
	.size	limb_mul_n, .-limb_mul_n
	.p2align 4
	.globl	__mul_acc_mul_AVXIFMA
	.type	__mul_acc_mul_AVXIFMA, @function
__mul_acc_mul_AVXIFMA:
.LFB6837:
	.cfi_startproc
	vmovdqa64	ZEROS(%rip), %zmm0
	movq	%rdi, %rax
	movq	%rsi, %rdi
	vmovdqa64	.LC16(%rip), %zmm3
	movq	(%rdi), %rdi
	movq	(%rax), %rax
	movq	%rdx, %rsi
	vmovdqa64	.LC17(%rip), %zmm4
	vmovdqa64	%zmm0, %zmm5
	vmovdqa64	(%rax), %zmm1
	vmovdqa64	(%rdi), %zmm2
	vpermq	%zmm1, %zmm3, %zmm3
	vpermq	%zmm2, %zmm4, %zmm4
	vpmadd52huq	%zmm4, %zmm3, %zmm5
	vpmadd52luq	%zmm4, %zmm3, %zmm0
	vmovdqa64	.LC31(%rip), %zmm3
	vmovdqa64	.LC32(%rip), %zmm4
	vpermq	%zmm1, %zmm3, %zmm3
	vpermq	%zmm2, %zmm4, %zmm4
	vmovdqa64	%zmm5, (%rcx)
	vmovdqa64	%zmm0, (%rdx)
	vmovdqa64	ZEROS(%rip), %zmm0
	vmovdqa64	%zmm0, %zmm6
	vmovdqa64	%zmm0, %zmm5
	vpmadd52huq	%zmm4, %zmm3, %zmm6
	vpmadd52luq	%zmm4, %zmm3, %zmm5
	vmovdqa64	.LC33(%rip), %zmm3
	vpermq	%zmm1, %zmm3, %zmm1
	vmovdqa64	.LC34(%rip), %zmm3
	vpermq	%zmm2, %zmm3, %zmm2
	vmovdqa64	%zmm0, %zmm3
	vpmadd52huq	%zmm2, %zmm1, %zmm3
	vpmadd52luq	%zmm2, %zmm1, %zmm0
	vmovdqa64	%zmm6, 64(%rcx)
	vmovdqa64	%zmm5, 64(%rdx)
	vmovdqa64	%zmm3, 128(%rcx)
	vmovdqa64	%zmm0, 128(%rdx)
	movq	32(%rax), %rax
	mulq	32(%rdi)
	movabsq	$4503599627370495, %rdi
	andq	%rax, %rdi
	shrdq	$52, %rdx, %rax
	movq	%rdi, 192(%rsi)
	movq	%rax, 192(%rcx)
	vzeroupper
	ret
	.cfi_endproc
.LFE6837:
	.size	__mul_acc_mul_AVXIFMA, .-__mul_acc_mul_AVXIFMA
	.p2align 4
	.globl	__mul_add_limbs_52
	.type	__mul_add_limbs_52, @function
__mul_add_limbs_52:
.LFB6838:
	.cfi_startproc
	vmovdqu	8(%rdi), %xmm0
	movq	32(%rdi), %rdx
	addq	24(%rdi), %rdx
	addq	40(%rdi), %rdx
	movq	%rdx, 16(%rdi)
	vpsrldq	$8, %xmm0, %xmm1
	movq	56(%rdi), %rdx
	addq	48(%rdi), %rdx
	addq	64(%rdi), %rdx
	vpaddq	%xmm1, %xmm0, %xmm0
	addq	72(%rdi), %rdx
	vmovq	%xmm0, 8(%rdi)
	vmovdqu	176(%rdi), %xmm0
	movq	%rdx, 24(%rdi)
	movq	88(%rdi), %rdx
	addq	80(%rdi), %rdx
	vpsrldq	$8, %xmm0, %xmm1
	addq	96(%rdi), %rdx
	addq	104(%rdi), %rdx
	addq	112(%rdi), %rdx
	vpaddq	%xmm1, %xmm0, %xmm0
	movq	%rdx, 32(%rdi)
	movq	128(%rdi), %rdx
	addq	120(%rdi), %rdx
	addq	136(%rdi), %rdx
	vmovq	%xmm0, 56(%rdi)
	addq	144(%rdi), %rdx
	movq	%rdx, 40(%rdi)
	movq	160(%rdi), %rdx
	addq	152(%rdi), %rdx
	addq	168(%rdi), %rdx
	movq	%rdx, 48(%rdi)
	movq	192(%rdi), %rdx
	movq	%rdx, 64(%rdi)
	vmovdqu	8(%rsi), %xmm0
	vpsrldq	$8, %xmm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, 8(%rsi)
	movq	32(%rsi), %rdx
	addq	24(%rsi), %rdx
	vmovdqu	176(%rsi), %xmm0
	addq	40(%rsi), %rdx
	movq	%rdx, 16(%rsi)
	movq	56(%rsi), %rdx
	addq	48(%rsi), %rdx
	vpsrldq	$8, %xmm0, %xmm1
	addq	64(%rsi), %rdx
	addq	72(%rsi), %rdx
	vpaddq	%xmm1, %xmm0, %xmm0
	movq	%rdx, 24(%rsi)
	movq	88(%rsi), %rdx
	addq	80(%rsi), %rdx
	addq	96(%rsi), %rdx
	vmovq	%xmm0, 56(%rsi)
	addq	104(%rsi), %rdx
	addq	112(%rsi), %rdx
	movq	%rdx, 32(%rsi)
	movq	128(%rsi), %rdx
	addq	120(%rsi), %rdx
	addq	136(%rsi), %rdx
	addq	144(%rsi), %rdx
	movq	%rdx, 40(%rsi)
	movq	160(%rsi), %rdx
	addq	152(%rsi), %rdx
	addq	168(%rsi), %rdx
	movq	%rdx, 48(%rsi)
	movq	192(%rsi), %rdx
	movq	%rdx, 64(%rsi)
	ret
	.cfi_endproc
.LFE6838:
	.size	__mul_add_limbs_52, .-__mul_add_limbs_52
	.section	.rodata.str1.1
.LC35:
	.string	"%d"
	.text
	.p2align 4
	.globl	__mul_adjust_limbs_52
	.type	__mul_adjust_limbs_52, @function
__mul_adjust_limbs_52:
.LFB6839:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	xorl	%r15d, %r15d
	pushq	%r14
	pushq	%r13
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	movq	%rsi, %r13
	pushq	%r12
	.cfi_offset 12, -48
	movq	%rdi, %r12
	pushq	%rbx
	andq	$-64, %rsp
	subq	$192, %rsp
	.cfi_offset 3, -56
	vmovdqa64	(%rdi), %zmm0
	movq	64(%rdi), %rax
	vpandd	mask(%rip), %zmm0, %zmm4
	vpsrlq	$52, %zmm0, %zmm1
	vpaddq	(%rsi), %zmm1, %zmm2
	movq	%rax, 184(%rsp)
	vmovdqa32	%zmm4, (%rsp)
	vpsrlq	$52, %zmm2, %zmm0
	vmovdqa64	%zmm2, 64(%rsp)
	vpcmpuq	$4, ZEROS(%rip), %zmm0, %k0
	kmovd	%k0, %ebx
	movl	%ebx, %r14d
	vzeroupper
	.p2align 4
	.p2align 3
.L112:
	movl	%r15d, %ecx
	movl	%ebx, %esi
	movl	$.LC35, %edi
	xorl	%eax, %eax
	sarl	%cl, %esi
	addl	$1, %r15d
	andl	$1, %esi
	call	printf
	cmpl	$8, %r15d
	jne	.L112
	movl	$10, %edi
	shrb	$2, %r14b
	call	putchar
	vmovdqa32	(%rsp), %zmm3
	kmovw	%r14d, %k1
	vmovdqa32	64(%rsp), %zmm6
	vpandd	mask(%rip), %zmm6, %zmm1
	vmovdqa64	%zmm3, %zmm0
	vpaddq	one(%rip), %zmm3, %zmm0{%k1}
	valignq	$7, %zmm0, %zmm0, %zmm7
	valignq	$7, %zmm0, %zmm0, %zmm0
	vmovq	%xmm7, %rax
	vpaddq	%zmm1, %zmm0, %zmm0
	vmovdqa64	%zmm0, (%r12)
	addq	64(%r13), %rax
	vmovdqa32	%zmm1, 0(%r13)
	movq	%rax, 64(%r12)
	movq	0(%r13), %rax
	movq	%rax, (%r12)
	movq	184(%rsp), %rax
	movq	%rax, 72(%r12)
	vzeroupper
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6839:
	.size	__mul_adjust_limbs_52, .-__mul_adjust_limbs_52
	.p2align 4
	.globl	limb_mul_n_52
	.type	limb_mul_n_52, @function
limb_mul_n_52:
.LFB6840:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdx, %r8
	call	__mul_acc_mul_AVXIFMA
	movq	%rcx, %rsi
	movq	%r8, %rdi
	call	__mul_add_limbs_52
	vzeroupper
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__mul_adjust_limbs_52
	.cfi_endproc
.LFE6840:
	.size	limb_mul_n_52, .-limb_mul_n_52
	.section	.rodata.str1.8
	.align 8
.LC36:
	.string	"Running random test cases for bit-size %d on core %d\n"
	.align 8
.LC37:
	.string	"../test/cases/%d/random.csv.gz"
	.align 8
.LC38:
	.string	"Running equal test cases for bit-size %d on core %d\n"
	.section	.rodata.str1.1
.LC39:
	.string	"../test/cases/%d/equal.csv.gz"
	.section	.rodata.str1.8
	.align 8
.LC40:
	.string	"Running greater test cases for bit-size %d on core %d\n"
	.align 8
.LC41:
	.string	"../test/cases/%d/greater.csv.gz"
	.align 8
.LC42:
	.string	"Running smaller test cases for bit-size %d on core %d\n"
	.align 8
.LC43:
	.string	"../test/cases/%d/smaller.csv.gz"
	.section	.rodata.str1.1
.LC44:
	.string	"Invalid test case"
.LC45:
	.string	"rb"
.LC46:
	.string	"Running test case %d\n"
.LC47:
	.string	"Error reading line"
.LC48:
	.string	","
.LC49:
	.string	"Error parsing line: %s\n"
.LC53:
	.string	"Time taken: %f\n"
	.section	.rodata.str1.8
	.align 8
.LC54:
	.string	"Test case failed, at iteration %d\n"
	.align 8
.LC55:
	.string	"a = %s, b = %s\n Expected result = %s\n"
	.section	.rodata.str1.1
.LC56:
	.string	"Experimental result = %s\n"
.LC57:
	.string	"All test cases passed"
	.section	.text.unlikely
.LCOLDB60:
	.text
.LHOTB60:
	.p2align 4
	.globl	test_data
	.type	test_data, @function
test_data:
.LFB6841:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-64, %rsp
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
	subq	$655744, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	cmpl	$2, %edi
	je	.L118
	jg	.L119
	testl	%edi, %edi
	je	.L120
	cmpl	$1, %edi
	jne	.L122
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC38, %edi
	xorl	%eax, %eax
	leaq	-655664(%rbp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC39, %edx
	movl	$100, %esi
	call	snprintf
.L124:
	movl	$.LC45, %esi
	movq	%rbx, %rdi
	call	gzopen
	movq	%rax, -655712(%rbp)
	testq	%rax, %rax
	je	.L158
	movq	%rax, %rdi
	call	skip_first_line
	movl	$1, %eax
	movl	$0, -655716(%rbp)
	vpbroadcastq	%rax, %zmm4
	vmovdqa64	%zmm4, -655792(%rbp)
	vzeroupper
.L143:
	movl	-655716(%rbp), %esi
	movl	$.LC46, %edi
	xorl	%eax, %eax
	call	printf
	movq	-655712(%rbp), %rdi
	movl	$655360, %edx
	leaq	-655408(%rbp), %rsi
	call	gzgets
	testq	%rax, %rax
	je	.L159
	movl	$.LC48, %esi
	leaq	-655408(%rbp), %rdi
	call	strtok
	xorl	%edi, %edi
	movl	$.LC48, %esi
	movq	%rax, -655688(%rbp)
	call	strtok
	xorl	%edi, %edi
	movl	$.LC48, %esi
	movq	%rax, -655696(%rbp)
	call	strtok
	cmpq	$0, -655688(%rbp)
	movq	%rax, -655704(%rbp)
	sete	%al
	cmpq	$0, -655696(%rbp)
	sete	%dl
	orb	%dl, %al
	jne	.L148
	cmpq	$0, -655704(%rbp)
	je	.L148
	movq	-655688(%rbp), %rdi
	call	limb_set_str
	movq	-655696(%rbp), %rdi
	movq	%rax, %r13
	call	limb_set_str
	movq	%r13, %rdi
	movq	%rax, %rsi
	movq	%rax, -655672(%rbp)
	call	limb_t_adjust_limb_sizes
	movq	16(%r13), %rax
	movabsq	$4503599627370495, %rdi
	vmovdqa64	-655792(%rbp), %zmm3
	vpbroadcastq	%rdi, %zmm0
	movl	%eax, %ebx
	movq	%rax, -655728(%rbp)
	vmovdqa64	%zmm0, mask(%rip)
	imull	%eax, %ebx
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqa64	%zmm3, one(%rip)
	vmovdqa64	%zmm0, ZEROS(%rip)
	movslq	%ebx, %rbx
	salq	$3, %rbx
	movq	%rbx, %rdi
	vzeroupper
	call	limb_t_alloc
	movq	%rbx, %rdi
	movl	$1, %ebx
	movq	%rax, %r12
	call	limb_t_alloc
	movq	(%r12), %rdx
	movq	-655672(%rbp), %rsi
	movq	%r13, %rdi
	movq	(%rax), %rcx
	movq	%rax, %r15
	call	limb_mul_n_52
	.p2align 4
	.p2align 3
.L132:
	leaq	-655552(%rbp), %rsi
	xorl	%edi, %edi
	addq	%rbx, %rbx
	call	getrusage
	fildq	-655552(%rbp)
	fmuls	.LC52(%rip)
	fildq	-655544(%rbp)
	faddp	%st, %st(1)
	fisttpq	-655680(%rbp)
	testq	%rbx, %rbx
	jle	.L130
	xorl	%r14d, %r14d
	.p2align 4
	.p2align 3
.L131:
	movq	(%r15), %rcx
	movq	(%r12), %rdx
	movq	%r13, %rdi
	addq	$1, %r14
	movq	-655672(%rbp), %rsi
	call	limb_mul_n_52
	cmpq	%r14, %rbx
	jne	.L131
.L130:
	leaq	-655552(%rbp), %rsi
	xorl	%edi, %edi
	call	getrusage
	fildq	-655552(%rbp)
	fmuls	.LC52(%rip)
	fildq	-655544(%rbp)
	faddp	%st, %st(1)
	fildq	-655680(%rbp)
	fsubrp	%st, %st(1)
	fisttpq	-655680(%rbp)
	movq	-655680(%rbp), %rax
	cmpq	$249999, %rax
	jle	.L132
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$.LC53, %edi
	vcvtsi2sdq	%rax, %xmm2, %xmm0
	movl	$1, %eax
	vcvtsi2sdq	%rbx, %xmm2, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	call	printf
	movl	-655728(%rbp), %eax
	movq	%r12, %rdi
	addl	%eax, %eax
	cltq
	movq	%rax, 16(%r12)
	call	limb_get_str
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	strlen
	movq	-655704(%rbp), %rsi
	xorl	%edi, %edi
	movq	%rax, %r12
	movzbl	(%rbx), %eax
	movzbl	(%rsi), %r15d
	cmpb	$45, %al
	movb	%al, -655680(%rbp)
	sete	%dil
	xorl	%r13d, %r13d
	addq	%rbx, %rdi
	cmpb	$45, %r15b
	sete	%r13b
	addq	%rsi, %r13
	call	trim_leading_zeros_and_whitespace
	movq	%r13, %rdi
	movq	%rax, %r14
	call	trim_leading_zeros_and_whitespace
	movq	%r14, %rdi
	movq	%rax, %r13
	call	trim_trailing_newline
	movq	%r13, %rdi
	call	trim_trailing_newline
	testl	%r12d, %r12d
	jle	.L135
	call	__ctype_tolower_loc
	leal	-1(%r12), %r8d
	xorl	%edx, %edx
	.p2align 6
	.p2align 4
	.p2align 3
.L136:
	movsbq	(%r14,%rdx), %rsi
	movq	(%rax), %rcx
	movl	(%rcx,%rsi,4), %ecx
	movb	%cl, (%r14,%rdx)
	movsbq	0(%r13,%rdx), %rsi
	movq	(%rax), %rcx
	movl	(%rcx,%rsi,4), %ecx
	movb	%cl, 0(%r13,%rdx)
	movq	%rdx, %rcx
	addq	$1, %rdx
	cmpq	%r8, %rcx
	jne	.L136
.L135:
	movq	%r14, %rdi
	call	strlen
	movq	%r13, %rdi
	movq	%rax, -655672(%rbp)
	call	strlen
	movq	-655672(%rbp), %rdx
	cmpq	%rax, %rdx
	jne	.L137
	xorl	%r12d, %r12d
	testq	%rdx, %rdx
	jne	.L138
	jmp	.L139
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L140:
	addq	$1, %r12
	cmpq	%r12, %rdx
	je	.L139
.L138:
	movzbl	0(%r13,%r12), %eax
	cmpb	%al, (%r14,%r12)
	je	.L140
	movl	$.LC8, %edi
	call	puts
	movq	%r12, %rsi
	movl	$.LC9, %edi
	xorl	%eax, %eax
	call	printf
	movsbl	(%r14,%r12), %edx
	movq	%r12, %rsi
	movq	%r12, %rcx
	movsbl	0(%r13,%r12), %r8d
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	printf
	movq	%r13, %rdx
	movq	%r14, %rsi
	movl	$.LC11, %edi
	xorl	%eax, %eax
	call	printf
.L141:
	movl	-655716(%rbp), %esi
	movl	$.LC54, %edi
	xorl	%eax, %eax
	call	printf
	movq	-655704(%rbp), %rcx
	movl	$.LC55, %edi
	xorl	%eax, %eax
	movq	-655696(%rbp), %rdx
	movq	-655688(%rbp), %rsi
	call	printf
	movl	$.LC56, %edi
	movq	%rbx, %rsi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
.L119:
	cmpl	$3, %edi
	jne	.L122
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC42, %edi
	xorl	%eax, %eax
	leaq	-655664(%rbp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC43, %edx
	movl	$100, %esi
	call	snprintf
	jmp	.L124
.L139:
	cmpb	$45, -655680(%rbp)
	sete	%dl
	cmpb	$45, %r15b
	sete	%al
	cmpb	%al, %dl
	jne	.L160
	addl	$1, -655716(%rbp)
	movl	-655716(%rbp), %eax
	cmpl	$100000, %eax
	jne	.L143
.L144:
	movl	$.LC57, %edi
	call	puts
	addq	$655744, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L137:
	.cfi_restore_state
	movl	$.LC5, %edi
	call	puts
	movq	%r13, %rdi
	call	strlen
	movq	%r14, %rdi
	movq	%rax, %r12
	call	strlen
	movq	%r12, %rdx
	movl	$.LC6, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	printf
	movq	%r13, %rdx
	movq	%r14, %rsi
	movl	$.LC7, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L141
.L118:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC40, %edi
	xorl	%eax, %eax
	leaq	-655664(%rbp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC41, %edx
	movl	$100, %esi
	call	snprintf
	jmp	.L124
.L120:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC36, %edi
	xorl	%eax, %eax
	leaq	-655664(%rbp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC37, %edx
	movl	$100, %esi
	call	snprintf
	jmp	.L124
.L160:
	movl	$.LC12, %edi
	call	puts
	jmp	.L141
.L159:
	movq	-655712(%rbp), %rdi
	call	gzeof
	testl	%eax, %eax
	jne	.L144
	jmp	.L155
.L148:
	movq	stderr(%rip), %rdi
	leaq	-655408(%rbp), %rdx
	movl	$.LC49, %esi
	xorl	%eax, %eax
	call	fprintf
	movq	-655712(%rbp), %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
.L122:
	movl	$.LC44, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L158:
	movq	%rbx, %rdi
	call	open_gzfile.part.0
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	test_data.cold, @function
test_data.cold:
.LFSB6841:
.L155:
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	.cfi_escape 0x10,0x6,0x2,0x76,0
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	movl	$.LC47, %edi
	call	perror
	movq	-655712(%rbp), %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6841:
	.text
	.size	test_data, .-test_data
	.section	.text.unlikely
	.size	test_data.cold, .-test_data.cold
.LCOLDE60:
	.text
.LHOTE60:
	.section	.rodata.str1.8
	.align 8
.LC61:
	.string	"Usage: %s <number of bits> <core number> <test-case number> <measure_type>\n"
	.align 8
.LC62:
	.string	"test-case number: 0 --> Random numbers"
	.align 8
.LC63:
	.string	"test-case number: 1 --> Random numbers with a < b"
	.align 8
.LC64:
	.string	"test-case number: 2 --> Random numbers with a > b"
	.align 8
.LC65:
	.string	"test-case number: 3 --> Random numbers with a = b"
	.section	.rodata.str1.1
.LC66:
	.string	"measure_type: 0 --> RDTSC"
.LC67:
	.string	"measure_type: 1 --> Timespec"
.LC68:
	.string	"measure_type: 2 --> RUSAGE"
.LC69:
	.string	"mul.c"
.LC70:
	.string	"atoi(argv[1]) > 0"
	.section	.rodata.str1.8
	.align 8
.LC71:
	.string	"atoi(argv[2]) >= 0 && atoi(argv[2]) < sysconf(_SC_NPROCESSORS_ONLN)"
	.align 8
.LC72:
	.string	"atoi(argv[3]) >= 0 && atoi(argv[3]) < 4"
	.align 8
.LC73:
	.string	"atoi(argv[4]) >= 0 && atoi(argv[4]) < 3"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB6842:
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
	je	.L162
	movq	(%rsi), %rsi
	movl	$.LC61, %edi
	xorl	%eax, %eax
	call	printf
	movl	$.LC62, %edi
	call	puts
	movl	$.LC63, %edi
	call	puts
	movl	$.LC64, %edi
	call	puts
	movl	$.LC65, %edi
	call	puts
	movl	$.LC66, %edi
	call	puts
	movl	$.LC67, %edi
	call	puts
	movl	$.LC68, %edi
	call	puts
	movl	$1, %eax
.L161:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L162:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	testl	%eax, %eax
	jle	.L172
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
	js	.L166
	movq	16(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	$84, %edi
	movq	%rax, %rbp
	call	sysconf
	movslq	%ebp, %rbp
	cmpq	%rax, %rbp
	jge	.L166
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
	js	.L168
	movq	24(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	$3, %eax
	jg	.L168
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
	js	.L170
	movq	32(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	$2, %eax
	jg	.L170
	movq	32(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	xorl	%eax, %eax
	call	init_memory_pool
	movl	%ebp, %edi
	call	test_data
	xorl	%eax, %eax
	call	destroy_memory_pool
	xorl	%eax, %eax
	jmp	.L161
.L172:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$580, %edx
	movl	$.LC69, %esi
	movl	$.LC70, %edi
	call	__assert_fail
.L166:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$583, %edx
	movl	$.LC69, %esi
	movl	$.LC71, %edi
	call	__assert_fail
.L168:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$586, %edx
	movl	$.LC69, %esi
	movl	$.LC72, %edi
	call	__assert_fail
.L170:
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$589, %edx
	movl	$.LC69, %esi
	movl	$.LC73, %edi
	call	__assert_fail
	.cfi_endproc
.LFE6842:
	.size	main, .-main
	.section	.rodata.str1.8
	.align 8
.LC74:
	.string	"Trying to run correctness test"
	.section	.rodata.str1.1
.LC75:
	.string	"experiments/results"
	.section	.rodata.str1.8
	.align 8
.LC76:
	.string	"Memory allocation failed for mul_str\n"
	.align 8
.LC77:
	.string	"Memory allocation failed for mul\n"
	.section	.rodata.str1.1
.LC78:
	.string	"Random test cases completed"
.LC79:
	.string	"Equal test cases completed"
.LC80:
	.string	"Greater test cases completed"
.LC81:
	.string	"Smaller test cases completed"
	.section	.text.unlikely
.LCOLDB82:
	.text
.LHOTB82:
	.p2align 4
	.globl	run_correctness_test
	.type	run_correctness_test, @function
run_correctness_test:
.LFB6843:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%edi, %r15d
	movl	$.LC74, %edi
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
	subq	$655544, %rsp
	.cfi_def_cfa_offset 655600
	call	puts
	movl	$.LC75, %edi
	call	create_directory
	cmpl	$2, %r15d
	je	.L174
	jg	.L175
	testl	%r15d, %r15d
	je	.L176
	cmpl	$1, %r15d
	jne	.L178
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC38, %edi
	xorl	%eax, %eax
	leaq	64(%rsp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC39, %edx
	movl	$100, %esi
	call	snprintf
.L180:
	movl	$.LC45, %esi
	movq	%rbx, %rdi
	call	gzopen
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L217
	movq	%rax, %rdi
	call	skip_first_line
	movl	$0, 28(%rsp)
	movl	%r15d, 44(%rsp)
.L198:
	movq	16(%rsp), %rdi
	movl	$655360, %edx
	leaq	176(%rsp), %rsi
	call	gzgets
	testq	%rax, %rax
	je	.L218
	movl	$.LC48, %esi
	leaq	176(%rsp), %rdi
	call	strtok
	xorl	%edi, %edi
	movl	$.LC48, %esi
	movq	%rax, 8(%rsp)
	call	strtok
	xorl	%edi, %edi
	movl	$.LC48, %esi
	movq	%rax, %rbp
	call	strtok
	cmpq	$0, 8(%rsp)
	movq	%rax, %rbx
	sete	%al
	testq	%rbp, %rbp
	sete	%dl
	orb	%dl, %al
	jne	.L206
	testq	%rbx, %rbx
	je	.L206
	movq	8(%rsp), %rdi
	call	limb_set_str
	movq	%rbp, %rdi
	movq	%rax, %r13
	call	limb_set_str
	movq	%r13, %rdi
	movq	%rax, %rsi
	movq	%rax, %r14
	call	limb_t_adjust_limb_sizes
	movq	16(%r13), %r12
	leal	0(,%r12,8), %edi
	movslq	%edi, %rdi
	addq	$1, %rdi
	call	memory_pool_alloc
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	je	.L212
	addl	%r12d, %r12d
	movslq	%r12d, %rdx
	salq	$3, %rdx
	movq	%rdx, %rdi
	movq	%rdx, 32(%rsp)
	call	memory_pool_alloc
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L213
	movq	32(%rsp), %rdx
	xorl	%esi, %esi
	movq	%rax, %rdi
	call	memset
	movq	%r15, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	limb_mul_n
	movl	%r12d, %esi
	leaq	56(%rsp), %rdx
	movq	%r15, %rdi
	call	limb_get_str32
	movq	56(%rsp), %r14
	movq	%r14, %rdi
	call	strlen
	movzbl	(%rbx), %r15d
	movq	%rax, %r12
	movzbl	(%r14), %eax
	cmpb	$45, %al
	movb	%al, 43(%rsp)
	sete	%al
	xorl	%r13d, %r13d
	movzbl	%al, %eax
	addq	%rax, %r14
	cmpb	$45, %r15b
	sete	%r13b
	movq	%r14, %rdi
	call	trim_leading_zeros_and_whitespace
	addq	%rbx, %r13
	movq	%r13, %rdi
	movq	%rax, %r14
	call	trim_leading_zeros_and_whitespace
	movq	%r14, %rdi
	movq	%rax, %r13
	call	trim_trailing_newline
	movq	%r13, %rdi
	call	trim_trailing_newline
	testl	%r12d, %r12d
	jle	.L190
	call	__ctype_tolower_loc
	leal	-1(%r12), %r8d
	xorl	%edx, %edx
	.p2align 6
	.p2align 4
	.p2align 3
.L191:
	movsbq	(%r14,%rdx), %rsi
	movq	(%rax), %rcx
	movl	(%rcx,%rsi,4), %ecx
	movb	%cl, (%r14,%rdx)
	movsbq	0(%r13,%rdx), %rsi
	movq	(%rax), %rcx
	movl	(%rcx,%rsi,4), %ecx
	movb	%cl, 0(%r13,%rdx)
	movq	%rdx, %rcx
	addq	$1, %rdx
	cmpq	%r8, %rcx
	jne	.L191
.L190:
	movq	%r14, %rdi
	call	strlen
	movq	%r13, %rdi
	movq	%rax, 32(%rsp)
	call	strlen
	movq	32(%rsp), %rdx
	cmpq	%rax, %rdx
	jne	.L192
	xorl	%r12d, %r12d
	testq	%rdx, %rdx
	jne	.L193
	jmp	.L194
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L195:
	addq	$1, %r12
	cmpq	%r12, %rdx
	je	.L194
.L193:
	movzbl	0(%r13,%r12), %eax
	cmpb	%al, (%r14,%r12)
	je	.L195
	movl	$.LC8, %edi
	call	puts
	movq	%r12, %rsi
	movl	$.LC9, %edi
	xorl	%eax, %eax
	call	printf
	movsbl	(%r14,%r12), %edx
	movq	%r12, %rsi
	movq	%r12, %rcx
	movsbl	0(%r13,%r12), %r8d
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	printf
	movq	%r13, %rdx
	movq	%r14, %rsi
	movl	$.LC11, %edi
	xorl	%eax, %eax
	call	printf
.L196:
	movl	28(%rsp), %esi
	movl	$.LC54, %edi
	xorl	%eax, %eax
	call	printf
	movq	8(%rsp), %rsi
	movq	%rbx, %rcx
	movq	%rbp, %rdx
	movl	$.LC55, %edi
	xorl	%eax, %eax
	call	printf
	movq	56(%rsp), %rsi
	movl	$.LC56, %edi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
	.p2align 4,,10
	.p2align 3
.L176:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC36, %edi
	xorl	%eax, %eax
	leaq	64(%rsp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC37, %edx
	movl	$100, %esi
	call	snprintf
	jmp	.L180
	.p2align 4,,10
	.p2align 3
.L194:
	cmpb	$45, 43(%rsp)
	sete	%dl
	cmpb	$45, %r15b
	sete	%al
	cmpb	%al, %dl
	jne	.L219
	addl	$1, 28(%rsp)
	movl	28(%rsp), %eax
	cmpl	$100000, %eax
	jne	.L198
	movl	44(%rsp), %r15d
.L199:
	cmpl	$2, %r15d
	je	.L200
	cmpl	$3, %r15d
	je	.L201
	cmpl	$1, %r15d
	je	.L202
	movl	$.LC78, %edi
	call	puts
.L203:
	movq	16(%rsp), %rdi
	call	gzclose
	addq	$655544, %rsp
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
.L192:
	.cfi_restore_state
	movl	$.LC5, %edi
	call	puts
	movq	%r13, %rdi
	call	strlen
	movq	%r14, %rdi
	movq	%rax, %r12
	call	strlen
	movq	%r12, %rdx
	movl	$.LC6, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	printf
	movq	%r13, %rdx
	movq	%r14, %rsi
	movl	$.LC7, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L196
	.p2align 4,,10
	.p2align 3
.L175:
	cmpl	$3, %r15d
	jne	.L178
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC42, %edi
	xorl	%eax, %eax
	leaq	64(%rsp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC43, %edx
	movl	$100, %esi
	call	snprintf
	jmp	.L180
	.p2align 4,,10
	.p2align 3
.L174:
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC40, %edi
	xorl	%eax, %eax
	leaq	64(%rsp), %rbx
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$.LC41, %edx
	movl	$100, %esi
	call	snprintf
	jmp	.L180
	.p2align 4,,10
	.p2align 3
.L219:
	movl	$.LC12, %edi
	call	puts
	jmp	.L196
.L218:
	movq	16(%rsp), %rdi
	movl	44(%rsp), %r15d
	call	gzeof
	testl	%eax, %eax
	jne	.L199
	jmp	.L211
	.p2align 4,,10
	.p2align 3
.L202:
	movl	$.LC79, %edi
	call	puts
	jmp	.L203
.L201:
	movl	$.LC81, %edi
	call	puts
	jmp	.L203
.L200:
	movl	$.LC80, %edi
	call	puts
	jmp	.L203
.L206:
	movq	stderr(%rip), %rdi
	leaq	176(%rsp), %rdx
	movl	$.LC49, %esi
	xorl	%eax, %eax
	call	fprintf
	movq	16(%rsp), %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
.L178:
	movl	$.LC44, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L217:
	movq	%rbx, %rdi
	call	open_gzfile.part.0
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	run_correctness_test.cold, @function
run_correctness_test.cold:
.LFSB6843:
.L211:
	.cfi_def_cfa_offset 655600
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movl	$.LC47, %edi
	call	perror
	movq	16(%rsp), %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
.L212:
	movl	$.LC76, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L213:
	movl	$.LC77, %edi
	call	perror
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6843:
	.text
	.size	run_correctness_test, .-run_correctness_test
	.section	.text.unlikely
	.size	run_correctness_test.cold, .-run_correctness_test.cold
.LCOLDE82:
	.text
.LHOTE82:
	.section	.rodata.str1.8
	.align 8
.LC84:
	.string	"Trying to run benchmarking test"
	.align 8
.LC85:
	.string	"Running the tests with RDTSC measurements"
	.align 8
.LC86:
	.string	"experiments/results/rdtsc_measurements"
	.align 8
.LC87:
	.string	"Running the tests with timespec measurements"
	.align 8
.LC88:
	.string	"experiments/results/timespec_measurements"
	.align 8
.LC89:
	.string	"Running the tests with rusage measurements"
	.align 8
.LC90:
	.string	"experiments/results/cputime_measurements"
	.section	.rodata.str1.1
.LC91:
	.string	"Invalid measure type"
.LC92:
	.string	"Running %d iterations...\n"
	.section	.rodata.str1.8
	.align 8
.LC93:
	.string	"Iteration %d, reading test case %d\n"
	.section	.rodata.str1.1
.LC94:
	.string	"Starting multiplication"
	.section	.rodata.str1.8
	.align 8
.LC95:
	.string	"Calibrating CPU speed using RDTSC..."
	.section	.rodata.str1.1
.LC96:
	.string	"tmp: %llu\n"
.LC98:
	.string	"done"
	.section	.rodata.str1.8
	.align 8
.LC99:
	.string	"Calibrated time: %f microseconds\n"
	.section	.rodata.str1.1
.LC101:
	.string	"multiplying %d times\n"
	.section	.rodata.str1.8
	.align 8
.LC104:
	.string	"RESULT: %.*f operations per second\n"
	.align 8
.LC105:
	.string	"Calibrating CPU speed using timespec..."
	.align 8
.LC106:
	.string	"Calibrating CPU speed using rusage..."
	.section	.rodata.str1.1
.LC108:
	.string	"done!"
	.section	.rodata.str1.8
	.align 8
.LC110:
	.string	"experiments/results/cputime_measurements/random_%d_%d.csv.gz"
	.section	.rodata.str1.1
.LC111:
	.string	"wb"
	.section	.rodata.str1.8
	.align 8
.LC112:
	.string	"experiments/results/rdtsc_measurements/random_%d_%d.csv.gz"
	.align 8
.LC113:
	.string	"experiments/results/timespec_measurements/random_%d_%d.csv.gz"
	.align 8
.LC114:
	.string	"experiments/results/cputime_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC115:
	.string	"experiments/results/rdtsc_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC116:
	.string	"experiments/results/timespec_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC117:
	.string	"experiments/results/rdtsc_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC118:
	.string	"experiments/results/timespec_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC119:
	.string	"experiments/results/cputime_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC120:
	.string	"experiments/results/rdtsc_measurements/greater_%d_%d.csv.gz"
	.align 8
.LC121:
	.string	"experiments/results/timespec_measurements/greater_%d_%d.csv.gz"
	.align 8
.LC122:
	.string	"experiments/results/cputime_measurements/greater_%d_%d.csv.gz"
	.section	.text.unlikely
.LCOLDB123:
	.text
.LHOTB123:
	.p2align 4
	.globl	run_benchmarking_test
	.type	run_benchmarking_test, @function
run_benchmarking_test:
.LFB6844:
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
	movl	$.LC84, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebx
	subq	$656024, %rsp
	.cfi_def_cfa_offset 656080
	call	puts
	movl	$.LC75, %edi
	call	create_directory
	cmpl	$1, %ebx
	je	.L221
	cmpl	$2, %ebx
	je	.L222
	testl	%ebx, %ebx
	jne	.L223
	movl	$.LC85, %edi
	call	puts
	movl	$.LC86, %edi
	call	create_directory
	cmpl	$2, %ebp
	je	.L224
	jg	.L225
	testl	%ebp, %ebp
	je	.L226
	cmpl	$1, %ebp
	jne	.L228
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
	movl	$.LC115, %edx
	movl	CORE_NO(%rip), %r8d
.L375:
	movl	$100, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	snprintf
	movl	$.LC111, %esi
	movq	%r12, %rdi
	call	gzopen
	movq	%rax, 32(%rsp)
	testq	%rax, %rax
	je	.L295
.L296:
	movl	$.LC45, %esi
	movq	%rbp, %rdi
	call	gzopen
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L386
	movq	%rax, %rdi
	xorl	%r13d, %r13d
	leaq	656(%rsp), %rbp
	call	skip_first_line
	xorl	%eax, %eax
	call	generate_seed
	movl	%eax, %edi
	call	srand
	movl	$1, %esi
	movl	$.LC92, %edi
	xorl	%eax, %eax
	call	printf
	call	rand
	xorl	%esi, %esi
	movl	$.LC93, %edi
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
	movq	%r14, %rdi
	call	gzrewind
	movq	%r14, %rdi
	call	skip_first_line
	testl	%r12d, %r12d
	jg	.L241
	jmp	.L247
	.p2align 4,,10
	.p2align 3
.L244:
	addl	$1, %r13d
	cmpl	%r13d, %r12d
	je	.L247
.L241:
	xorl	%esi, %esi
	movl	$655360, %edx
	movq	%rbp, %rdi
	call	memset
	movl	$655360, %edx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	gzgets
	testq	%rax, %rax
	jne	.L244
	movq	%r14, %rdi
	call	gzeof
	testl	%eax, %eax
	je	.L245
.L369:
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
.L222:
	.cfi_restore_state
	movl	$.LC89, %edi
	call	puts
	movl	$.LC90, %edi
	call	create_directory
	cmpl	$1, %ebp
	je	.L235
	jle	.L387
	cmpl	$2, %ebp
	je	.L238
	cmpl	$3, %ebp
	jne	.L228
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC42, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %rbp
	leaq	400(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$.LC43, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC119, %edx
	movl	CORE_NO(%rip), %r8d
.L385:
	movl	$100, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	snprintf
	movl	$.LC111, %esi
	movq	%r12, %rdi
	call	gzopen
	movq	%rax, 48(%rsp)
	testq	%rax, %rax
	jne	.L296
.L295:
	movq	%r12, %rdi
	call	open_gzfile.part.0
	.p2align 4,,10
	.p2align 3
.L221:
	movl	$.LC87, %edi
	call	puts
	movl	$.LC88, %edi
	call	create_directory
	cmpl	$2, %ebp
	je	.L230
	jg	.L231
	testl	%ebp, %ebp
	je	.L232
	cmpl	$1, %ebp
	jne	.L228
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
	movl	$.LC116, %edx
	movl	CORE_NO(%rip), %r8d
.L380:
	movl	$100, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	snprintf
	movl	$.LC111, %esi
	movq	%r12, %rdi
	call	gzopen
	movq	%rax, 56(%rsp)
	testq	%rax, %rax
	jne	.L296
	jmp	.L295
	.p2align 4,,10
	.p2align 3
.L387:
	testl	%ebp, %ebp
	jne	.L228
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
	movl	$.LC110, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L385
.L231:
	cmpl	$3, %ebp
	jne	.L228
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC42, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %rbp
	leaq	288(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$.LC43, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC118, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L380
.L225:
	cmpl	$3, %ebp
	jne	.L228
	movl	CORE_NO(%rip), %edx
	movl	NUM_BITS(%rip), %esi
	movl	$.LC42, %edi
	xorl	%eax, %eax
	leaq	176(%rsp), %rbp
	leaq	64(%rsp), %r12
	call	printf
	movl	NUM_BITS(%rip), %ecx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$.LC43, %edx
	movl	$100, %esi
	call	snprintf
	movl	NUM_BITS(%rip), %ecx
	movl	$.LC117, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L375
	.p2align 4,,10
	.p2align 3
.L247:
	movl	$.LC48, %esi
	movq	%rbp, %rdi
	call	strtok
	xorl	%edi, %edi
	movl	$.LC48, %esi
	movq	%rax, %r13
	call	strtok
	xorl	%edi, %edi
	movl	$.LC48, %esi
	movq	%rax, %r12
	call	strtok
	testq	%r13, %r13
	sete	%dl
	testq	%r12, %r12
	sete	%cl
	orb	%cl, %dl
	jne	.L242
	testq	%rax, %rax
	je	.L242
	movq	%r13, %rdi
	call	limb_set_str
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	limb_set_str
	movq	%rbp, %rdi
	movq	%rax, %rsi
	movq	%rax, %r13
	call	limb_t_adjust_limb_sizes
	movq	16(%rbp), %r15
	leal	0(,%r15,8), %edi
	movslq	%edi, %rdi
	addq	$1, %rdi
	call	memory_pool_alloc
	testq	%rax, %rax
	je	.L361
	leal	(%r15,%r15), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	movq	%rdx, %rdi
	movq	%rdx, (%rsp)
	call	memory_pool_alloc
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L362
	movq	(%rsp), %rdx
	xorl	%esi, %esi
	movq	%rax, %rdi
	call	memset
	movl	$.LC94, %edi
	call	puts
	testl	%r15d, %r15d
	jle	.L255
	leal	-1(%r15), %ecx
	movq	%rbp, %rax
	movq	%r13, %rdx
	shrl	$6, %ecx
	salq	$6, %rcx
	leaq	64(%rbp,%rcx), %rcx
	.p2align 5
	.p2align 4
	.p2align 3
.L254:
	clflush	(%rax)
	clflush	(%rdx)
	addq	$64, %rax
	addq	$64, %rdx
	cmpq	%rax, %rcx
	jne	.L254
.L255:
	mfence
	cmpl	$1, %ebx
	je	.L251
	cmpl	$2, %ebx
	je	.L252
	movl	$.LC95, %edi
	call	puts
	movq	stdout(%rip), %rdi
	call	fflush
	xorl	%eax, %eax
#APP
# 1038 "mul.c" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	limb_mul_n
	movq	$1, (%rsp)
	.p2align 4
	.p2align 3
.L257:
	salq	(%rsp)
	movq	(%rsp), %r9
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
	movl	%r9d, %r15d
	xorl	%ebx, %ebx
	orq	%rsi, %rdi
	movq	%rdi, 24(%rsp)
	testq	%r9, %r9
	je	.L260
	.p2align 4
	.p2align 3
.L259:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	limb_mul_n
	cmpl	%r15d, %ebx
	jne	.L259
.L260:
#APP
# 245 "../myutils.h" 1
	RDTSCP
	mov %edx, %esi
	mov %eax, %edi
	CPUID
	
# 0 "" 2
#NO_APP
	movq	%rsi, %rbx
	movq	24(%rsp), %rax
	movl	%edi, %edi
	salq	$32, %rbx
	orq	%rdi, %rbx
	movl	$.LC96, %edi
	subq	%rax, %rbx
	xorl	%eax, %eax
	movq	%rbx, %rsi
	call	printf
	cmpq	$699999999, %rbx
	jbe	.L257
	vxorpd	%xmm3, %xmm3, %xmm3
	movl	$.LC98, %edi
	vcvtusi2sdq	%rbx, %xmm3, %xmm0
	vmulsd	.LC97(%rip), %xmm0, %xmm0
	vcvttsd2usi	%xmm0, %rax
	vcvtusi2sdq	%rax, %xmm3, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm1
	vcvtsi2sdq	(%rsp), %xmm3, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm4
	vmovsd	%xmm4, (%rsp)
	call	puts
	movl	$.LC99, %edi
	movl	$1, %eax
	vmovsd	(%rsp), %xmm0
	call	printf
	movl	$.LC101, %edi
	xorl	%eax, %eax
	vmovsd	.LC100(%rip), %xmm0
	vdivsd	(%rsp), %xmm0, %xmm0
	vcvttsd2usi	%xmm0, %r15
	addl	$1, %r15d
	movl	%r15d, %esi
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
	movq	%rdi, (%rsp)
	testl	%r15d, %r15d
	jle	.L264
	.p2align 4
	.p2align 3
.L261:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	limb_mul_n
	cmpl	%ebx, %r15d
	jne	.L261
.L264:
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
	movq	(%rsp), %rax
	movl	%edi, %edi
	vcvtsi2sdl	%r15d, %xmm5, %xmm0
	orq	%rdi, %rsi
	vmovsd	.LC102(%rip), %xmm2
	subq	%rax, %rsi
	vmulsd	%xmm0, %xmm2, %xmm2
	vcvtusi2sdq	%rsi, %xmm5, %xmm0
	vmulsd	.LC97(%rip), %xmm0, %xmm0
	vdivsd	%xmm0, %xmm2, %xmm2
	vcomisd	.LC83(%rip), %xmm2
	ja	.L301
	vmovsd	.LC83(%rip), %xmm0
	xorl	%esi, %esi
	vmovsd	.LC103(%rip), %xmm1
	.p2align 4
	.p2align 4
	.p2align 3
.L263:
	vmulsd	%xmm1, %xmm0, %xmm0
	addl	$1, %esi
	vcomisd	%xmm0, %xmm2
	jbe	.L263
.L262:
	vmovsd	%xmm2, %xmm2, %xmm0
	movl	$.LC104, %edi
	movl	$1, %eax
	call	printf
	movq	%r14, %rdi
	call	gzclose
	movq	32(%rsp), %rdi
	call	gzclose
	jmp	.L369
	.p2align 4,,10
	.p2align 3
.L252:
	movl	$.LC106, %edi
	call	puts
	movq	stdout(%rip), %rdi
	call	fflush
	xorl	%eax, %eax
#APP
# 1115 "mul.c" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	movl	$1, %ebx
	call	limb_mul_n
	leaq	512(%rsp), %rax
	movq	%rax, (%rsp)
	jmp	.L282
	.p2align 4,,10
	.p2align 3
.L389:
	fstp	%st(0)
.L282:
	movq	(%rsp), %rsi
	xorl	%edi, %edi
	addq	%rbx, %rbx
	xorl	%r15d, %r15d
	call	getrusage
	fildq	512(%rsp)
	fmuls	.LC52(%rip)
	fildq	520(%rsp)
	faddp	%st, %st(1)
	fisttpq	24(%rsp)
	testq	%rbx, %rbx
	jle	.L284
	.p2align 4
	.p2align 3
.L281:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_mul_n
	cmpq	%r15, %rbx
	jne	.L281
.L284:
	movq	(%rsp), %rsi
	xorl	%edi, %edi
	call	getrusage
	fildq	512(%rsp)
	flds	.LC52(%rip)
	fxch	%st(1)
	fmuls	.LC52(%rip)
	fildq	520(%rsp)
	faddp	%st, %st(1)
	fildq	24(%rsp)
	fsubrp	%st, %st(1)
	fisttpq	24(%rsp)
	movq	24(%rsp), %rax
	cmpq	$249999, %rax
	jle	.L389
	vxorpd	%xmm7, %xmm7, %xmm7
	movl	$.LC98, %edi
	fstpt	32(%rsp)
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm1
	vcvtsi2sdq	%rbx, %xmm7, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm5
	vmovsd	%xmm5, 24(%rsp)
	call	puts
	movl	$.LC99, %edi
	movl	$1, %eax
	vmovsd	24(%rsp), %xmm0
	call	printf
	movl	$.LC101, %edi
	xorl	%eax, %eax
	vmovsd	.LC100(%rip), %xmm0
	vdivsd	24(%rsp), %xmm0, %xmm0
	vcvttsd2usi	%xmm0, %rbx
	leal	1(%rbx), %r15d
	movl	%r15d, %esi
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
	flds	.LC107(%rip)
	fxch	%st(1)
	fcomi	%st(1), %st
	jnb	.L285
	fstp	%st(1)
	fisttpq	24(%rsp)
.L286:
	xorl	%ebx, %ebx
	testl	%r15d, %r15d
	jle	.L293
	.p2align 4
	.p2align 3
.L287:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	limb_mul_n
	cmpl	%ebx, %r15d
	jne	.L287
.L293:
	movq	(%rsp), %rsi
	xorl	%edi, %edi
	call	getrusage
	fildq	512(%rsp)
	fmuls	.LC52(%rip)
	movl	$.LC108, %edi
	fildq	520(%rsp)
	faddp	%st, %st(1)
	fstpt	(%rsp)
	call	puts
	vxorpd	%xmm6, %xmm6, %xmm6
	movq	24(%rsp), %rax
	vmovsd	.LC102(%rip), %xmm2
	vcvtsi2sdl	%r15d, %xmm6, %xmm0
	fildq	24(%rsp)
	testq	%rax, %rax
	fldt	(%rsp)
	vmulsd	%xmm0, %xmm2, %xmm2
	jns	.L288
	fxch	%st(1)
	fadds	.LC109(%rip)
	fxch	%st(1)
.L288:
	fsubp	%st, %st(1)
	flds	.LC107(%rip)
	fxch	%st(1)
	fcomi	%st(1), %st
	jnb	.L289
	fstp	%st(1)
	fisttpq	(%rsp)
	movq	(%rsp), %rax
.L290:
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtusi2sdq	%rax, %xmm6, %xmm0
	vdivsd	%xmm0, %xmm2, %xmm2
	vcomisd	.LC83(%rip), %xmm2
	ja	.L306
	vmovsd	.LC83(%rip), %xmm0
	xorl	%esi, %esi
	vmovsd	.LC103(%rip), %xmm1
	.p2align 4
	.p2align 4
	.p2align 3
.L292:
	vmulsd	%xmm1, %xmm0, %xmm0
	addl	$1, %esi
	vcomisd	%xmm0, %xmm2
	jbe	.L292
.L291:
	vmovsd	%xmm2, %xmm2, %xmm0
	movl	$.LC104, %edi
	movl	$1, %eax
	call	printf
	movq	%r14, %rdi
	call	gzclose
	movq	48(%rsp), %rdi
	call	gzclose
	jmp	.L369
	.p2align 4,,10
	.p2align 3
.L251:
	movl	$.LC105, %edi
	call	puts
	movq	stdout(%rip), %rdi
	call	fflush
	xorl	%eax, %eax
#APP
# 1076 "mul.c" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	movl	$1, %ebx
	call	limb_mul_n
	leaq	512(%rsp), %rax
	movq	%rax, (%rsp)
	.p2align 4
	.p2align 3
.L348:
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
	jle	.L271
	.p2align 4
	.p2align 3
.L270:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	addq	$1, %r15
	call	limb_mul_n
	cmpq	%rbx, %r15
	jne	.L270
.L271:
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
	js	.L388
	imulq	$1000000000, %rax, %rax
	addq	%rcx, %rax
	cmpq	$249999999, %rax
	jle	.L348
.L273:
	shrq	$3, %rax
	vxorpd	%xmm6, %xmm6, %xmm6
	movl	$.LC98, %edi
	movabsq	$2361183241434822607, %rdx
	mulq	%rdx
	shrq	$4, %rdx
	vcvtsi2sdq	%rdx, %xmm6, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm1
	vcvtsi2sdq	%rbx, %xmm6, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm7
	vmovsd	%xmm7, 24(%rsp)
	call	puts
	movl	$.LC99, %edi
	movl	$1, %eax
	vmovsd	24(%rsp), %xmm0
	call	printf
	movl	$.LC101, %edi
	xorl	%eax, %eax
	vmovsd	.LC100(%rip), %xmm0
	vdivsd	24(%rsp), %xmm0, %xmm0
	vcvttsd2usi	%xmm0, %rbx
	leal	1(%rbx), %r15d
	xorl	%ebx, %ebx
	movl	%r15d, %esi
	call	printf
	movq	stdout(%rip), %rdi
	call	fflush
	movq	(%rsp), %rsi
	movl	$4, %edi
	call	clock_gettime
	movq	512(%rsp), %rax
	movq	%rax, 48(%rsp)
	movq	520(%rsp), %rax
	movq	%rax, 24(%rsp)
	testl	%r15d, %r15d
	jle	.L277
	.p2align 4
	.p2align 3
.L274:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	limb_mul_n
	cmpl	%ebx, %r15d
	jne	.L274
.L277:
	movq	(%rsp), %rsi
	movl	$4, %edi
	call	clock_gettime
	movq	48(%rsp), %rcx
	movq	24(%rsp), %rbx
	movq	520(%rsp), %rdx
	movq	512(%rsp), %rax
	subq	%rcx, %rax
	movq	%rdx, %rcx
	subq	%rbx, %rcx
	jns	.L276
	leaq	1000000000(%rdx), %rcx
	subq	$1, %rax
	subq	%rbx, %rcx
.L276:
	imulq	$1000000000, %rax, %rax
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovsd	.LC102(%rip), %xmm2
	vcvtsi2sdl	%r15d, %xmm4, %xmm0
	addq	%rax, %rcx
	movabsq	$2361183241434822607, %rax
	imulq	%rcx
	sarq	$63, %rcx
	vmulsd	%xmm0, %xmm2, %xmm2
	sarq	$7, %rdx
	subq	%rcx, %rdx
	vcvtusi2sdq	%rdx, %xmm4, %xmm0
	vdivsd	%xmm0, %xmm2, %xmm2
	vcomisd	.LC83(%rip), %xmm2
	ja	.L303
	vmovsd	.LC83(%rip), %xmm0
	xorl	%esi, %esi
	vmovsd	.LC103(%rip), %xmm1
	.p2align 4
	.p2align 4
	.p2align 3
.L279:
	vmulsd	%xmm1, %xmm0, %xmm0
	addl	$1, %esi
	vcomisd	%xmm0, %xmm2
	jbe	.L279
.L278:
	vmovsd	%xmm2, %xmm2, %xmm0
	movl	$.LC104, %edi
	movl	$1, %eax
	call	printf
	movq	%r14, %rdi
	call	gzclose
	movq	56(%rsp), %rdi
	call	gzclose
	jmp	.L369
	.p2align 4,,10
	.p2align 3
.L388:
	imulq	$1000000000, %rax, %rax
	subq	%rsi, %rdx
	addq	%rdx, %rax
	cmpq	$249999999, %rax
	jle	.L348
	jmp	.L273
.L235:
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
	movl	$.LC114, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L385
.L238:
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
	movl	$.LC122, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L385
.L226:
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
	movl	$.LC112, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L375
.L224:
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
	movl	$.LC120, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L375
.L230:
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
	movl	$.LC121, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L380
.L232:
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
	movl	$.LC113, %edx
	movl	CORE_NO(%rip), %r8d
	jmp	.L380
.L289:
	fsubp	%st, %st(1)
	fisttpq	(%rsp)
	movq	(%rsp), %rax
	btcq	$63, %rax
	jmp	.L290
.L285:
	fsubp	%st, %st(1)
	fisttpq	24(%rsp)
	movq	24(%rsp), %rax
	btcq	$63, %rax
	movq	%rax, 24(%rsp)
	jmp	.L286
.L306:
	xorl	%esi, %esi
	jmp	.L291
.L303:
	xorl	%esi, %esi
	jmp	.L278
.L301:
	xorl	%esi, %esi
	jmp	.L262
.L223:
	movl	$.LC91, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L228:
	movl	$.LC44, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L242:
	movq	stderr(%rip), %rdi
	movq	%rbp, %rdx
	movl	$.LC49, %esi
	xorl	%eax, %eax
	call	fprintf
	movq	%r14, %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
.L386:
	movq	%rbp, %rdi
	call	open_gzfile.part.0
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	run_benchmarking_test.cold, @function
run_benchmarking_test.cold:
.LFSB6844:
.L245:
	.cfi_def_cfa_offset 656080
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movl	$.LC47, %edi
	call	perror
	movq	%r14, %rdi
	call	gzclose
	movl	$1, %edi
	call	exit
.L361:
	movl	$.LC76, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L362:
	movl	$.LC77, %edi
	call	perror
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6844:
	.text
	.size	run_benchmarking_test, .-run_benchmarking_test
	.section	.text.unlikely
	.size	run_benchmarking_test.cold, .-run_benchmarking_test.cold
.LCOLDE123:
	.text
.LHOTE123:
	.section	.rodata
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 5
__PRETTY_FUNCTION__.0:
	.string	"main"
	.globl	ZEROS
	.bss
	.align 64
	.type	ZEROS, @object
	.size	ZEROS, 64
ZEROS:
	.zero	64
	.globl	mask
	.align 64
	.type	mask, @object
	.size	mask, 64
mask:
	.zero	64
	.globl	one
	.align 64
	.type	one, @object
	.size	one, 64
one:
	.zero	64
	.globl	NUM_BITS
	.align 4
	.type	NUM_BITS, @object
	.size	NUM_BITS, 4
NUM_BITS:
	.zero	4
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
	.align 64
.LC31:
	.quad	2
	.quad	3
	.quad	0
	.quad	1
	.quad	2
	.quad	3
	.quad	4
	.quad	1
	.align 64
.LC32:
	.quad	1
	.quad	0
	.quad	4
	.quad	3
	.quad	2
	.quad	1
	.quad	0
	.quad	4
	.align 64
.LC33:
	.quad	2
	.quad	3
	.quad	4
	.quad	2
	.quad	3
	.quad	4
	.quad	3
	.quad	4
	.align 64
.LC34:
	.quad	3
	.quad	2
	.quad	1
	.quad	4
	.quad	3
	.quad	2
	.quad	4
	.quad	3
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC52:
	.long	1232348160
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC83:
	.long	0
	.long	1079574528
	.align 8
.LC97:
	.long	1394455622
	.long	1060595063
	.align 8
.LC100:
	.long	0
	.long	1097011920
	.align 8
.LC102:
	.long	0
	.long	1093567616
	.align 8
.LC103:
	.long	-1717986918
	.long	1069128089
	.section	.rodata.cst4
	.align 4
.LC107:
	.long	1593835520
	.align 4
.LC109:
	.long	1602224128
	.ident	"GCC: (GNU) 14.2.1 20250110 (Red Hat 14.2.1-7)"
	.section	.note.GNU-stack,"",@progbits
