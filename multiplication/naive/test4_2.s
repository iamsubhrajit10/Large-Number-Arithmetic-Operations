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
	jmp	.L26
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L27:
	addq	$1, %r12
.L26:
	movsbq	(%r12), %rcx
	cmpb	$48, %cl
	je	.L27
	testb	$32, 1(%rax,%rcx,2)
	jne	.L27
	movsbq	0(%r13), %rsi
	cmpb	$48, %sil
	jne	.L101
	.p2align 4
	.p2align 4
	.p2align 3
.L29:
	movsbq	1(%r13), %rsi
	addq	$1, %r13
	cmpb	$48, %sil
	je	.L29
.L101:
	testb	$32, 1(%rax,%rsi,2)
	jne	.L29
	movq	%r12, %rdi
	call	strlen
	testq	%rax, %rax
	je	.L30
	leaq	-1(%r12,%rax), %rdi
	cmpb	$10, (%rdi)
	je	.L102
	movq	%r13, %rdi
	call	strlen
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L32
.L33:
	movq	%r12, %rdi
	call	strlen
	cmpq	%r15, %rax
	jne	.L35
.L104:
	testq	%r15, %r15
	je	.L37
	xorl	%r14d, %r14d
	andl	$7, %r15d
	je	.L36
	cmpq	$1, %r15
	je	.L83
	cmpq	$2, %r15
	je	.L84
	cmpq	$3, %r15
	je	.L85
	cmpq	$4, %r15
	je	.L86
	cmpq	$5, %r15
	je	.L87
	cmpq	$6, %r15
	je	.L88
	movzbl	0(%r13), %r9d
	cmpb	%r9b, (%r12)
	jne	.L99
	movl	$1, %r14d
.L88:
	movzbl	0(%r13,%r14), %r10d
	cmpb	%r10b, (%r12,%r14)
	jne	.L99
	addq	$1, %r14
.L87:
	movzbl	0(%r13,%r14), %r11d
	cmpb	%r11b, (%r12,%r14)
	jne	.L99
	addq	$1, %r14
.L86:
	movzbl	0(%r13,%r14), %edx
	cmpb	%dl, (%r12,%r14)
	jne	.L99
	addq	$1, %r14
.L85:
	movzbl	0(%r13,%r14), %ecx
	cmpb	%cl, (%r12,%r14)
	jne	.L99
	addq	$1, %r14
.L84:
	movzbl	0(%r13,%r14), %esi
	cmpb	%sil, (%r12,%r14)
	jne	.L99
	addq	$1, %r14
.L83:
	movzbl	0(%r13,%r14), %r15d
	cmpb	%r15b, (%r12,%r14)
	jne	.L99
	addq	$1, %r14
	cmpq	%r14, %rax
	je	.L37
.L36:
	movzbl	0(%r13,%r14), %edi
	cmpb	%dil, (%r12,%r14)
	jne	.L99
	leaq	1(%r14), %r8
	movzbl	0(%r13,%r8), %r9d
	movq	%r8, %r14
	cmpb	%r9b, (%r12,%r8)
	jne	.L99
	addq	$1, %r14
	movzbl	0(%r13,%r14), %r10d
	cmpb	%r10b, (%r12,%r14)
	jne	.L99
	movzbl	2(%r13,%r8), %r11d
	leaq	2(%r8), %r14
	cmpb	%r11b, 2(%r12,%r8)
	jne	.L99
	movzbl	3(%r13,%r8), %edx
	leaq	3(%r8), %r14
	cmpb	%dl, 3(%r12,%r8)
	jne	.L99
	movzbl	4(%r13,%r8), %ecx
	leaq	4(%r8), %r14
	cmpb	%cl, 4(%r12,%r8)
	jne	.L99
	movzbl	5(%r13,%r8), %esi
	leaq	5(%r8), %r14
	cmpb	%sil, 5(%r12,%r8)
	jne	.L99
	movzbl	6(%r13,%r8), %r15d
	leaq	6(%r8), %r14
	cmpb	%r15b, 6(%r12,%r8)
	jne	.L99
	leaq	7(%r8), %r14
	cmpq	%r14, %rax
	jne	.L36
.L37:
	cmpb	$45, %bl
	movl	$1, %eax
	sete	%bl
	cmpb	$45, %bpl
	sete	%bpl
	cmpb	%bpl, %bl
	jne	.L103
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
.L30:
	.cfi_restore_state
	movq	%r13, %rdi
	call	strlen
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L37
.L32:
	leaq	-1(%r13,%r15), %r8
	cmpb	$10, (%r8)
	jne	.L33
	movb	$0, (%r8)
	movq	%r13, %rdi
	call	strlen
	movq	%r12, %rdi
	movq	%rax, %r15
	call	strlen
	cmpq	%r15, %rax
	je	.L104
	.p2align 4
	.p2align 3
.L35:
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
.L105:
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
.L99:
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
	jmp	.L105
	.p2align 4,,10
	.p2align 3
.L102:
	movb	$0, (%rdi)
	movq	%r13, %rdi
	call	strlen
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L33
	jmp	.L32
.L103:
	movl	$.LC11, %edi
	call	puts
	xorl	%eax, %eax
	jmp	.L105
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
.LFSB6606:
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
	jle	.L146
	movl	%edi, %ebx
	movl	%edi, %r11d
	movl	$1, %r8d
	movl	$1, %ecx
	leaq	8(%rdx), %r13
	.p2align 4
	.p2align 3
.L143:
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
	je	.L142
	cmpq	$1, %r12
	je	.L194
	cmpq	$2, %r12
	je	.L195
	cmpq	$3, %r12
	je	.L196
	cmpq	$4, %r12
	je	.L197
	cmpq	$5, %r12
	je	.L198
	cmpq	$6, %r12
	je	.L199
	movq	(%rax), %rsi
	xorl	%edi, %edi
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
.L195:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L194:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
	cmpq	%rax, %r9
	je	.L223
.L142:
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
	jne	.L142
.L223:
	movq	%rsi, (%rdx,%r8,8)
	addq	$1, %r8
	addl	%r10d, %ecx
	cmpq	%r8, %r11
	jne	.L143
	movl	%ebx, %r8d
	subl	$2, %r8d
	je	.L147
	movslq	%ebx, %r10
	leaq	(%rdx,%r10,8), %r10
	.p2align 4
	.p2align 3
.L145:
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
	je	.L144
	cmpq	$1, %r12
	je	.L200
	cmpq	$2, %r12
	je	.L201
	cmpq	$3, %r12
	je	.L202
	cmpq	$4, %r12
	je	.L203
	cmpq	$5, %r12
	je	.L204
	cmpq	$6, %r12
	je	.L205
	movq	(%rax), %rsi
	xorl	%edi, %edi
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
.L201:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L200:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
	cmpq	%r9, %rax
	je	.L222
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
	cmpq	%r9, %rax
	jne	.L144
.L222:
	movq	%rsi, (%r10)
	addl	%r11d, %ecx
	addq	$8, %r10
	subl	$1, %r8d
	jne	.L145
	leal	-2(%rbx,%rbx), %r11d
	movslq	%r11d, %rbx
	salq	$3, %rbx
.L141:
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
.L146:
	.cfi_restore_state
	movl	$8, %ebx
	movl	$1, %r11d
	jmp	.L141
.L147:
	movl	$16, %ebx
	movl	$2, %r11d
	jmp	.L141
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
	jle	.L228
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
	je	.L227
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
	je	.L235
	.p2align 4
	.p2align 3
.L227:
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
	jne	.L227
.L235:
	andl	$-2, %r9d
	salq	$32, %rbx
	leal	3(%r9), %r9d
	subq	%rbx, %rax
	movq	-8(%r8,%r9,8), %rdi
.L226:
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
.L228:
	.cfi_restore_state
	movq	%rax, %rdi
	movq	%r8, %r10
	jmp	.L226
	.cfi_endproc
.LFE6644:
	.size	adjust_limbs, .-adjust_limbs
	.p2align 4
	.type	multiply.constprop.0, @function
multiply.constprop.0:
.LFB6655:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdx, %rcx
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-64, %rsp
	subq	$8, %rsp
	vmovd	(%rdi), %xmm0
	vmovd	4(%rdi), %xmm2
	vmovd	8(%rdi), %xmm4
	vmovd	4(%rsi), %xmm13
	vpunpcklqdq	%xmm0, %xmm2, %xmm5
	vpunpcklqdq	%xmm0, %xmm0, %xmm1
	vmovd	8(%rsi), %xmm7
	vpunpcklqdq	%xmm2, %xmm0, %xmm9
	vpunpcklqdq	%xmm4, %xmm2, %xmm14
	vmovd	12(%rsi), %xmm10
	vinserti32x4	$0x1, %xmm5, %ymm1, %ymm6
	vmovd	(%rsi), %xmm5
	vinserti32x4	$0x1, %xmm9, %ymm14, %ymm3
	vmovq	%xmm7, %r8
	vpunpcklqdq	%xmm7, %xmm10, %xmm11
	vinserti32x8	$0x1, %ymm3, %zmm6, %zmm8
	vpunpcklqdq	%xmm7, %xmm5, %xmm2
	vpunpcklqdq	%xmm5, %xmm13, %xmm6
	vpunpcklqdq	%xmm13, %xmm5, %xmm3
	vmovdqa	%xmm11, -8(%rsp)
	vinserti32x4	$0x1, %xmm11, %ymm6, %ymm12
	vinserti32x4	$0x1, %xmm2, %ymm3, %ymm1
	vinserti32x8	$0x1, %ymm12, %zmm1, %zmm7
	vmovd	12(%rdi), %xmm12
	vpmuldq	%zmm7, %zmm8, %zmm3
	vmovd	20(%rsi), %xmm7
	vmovd	16(%rdi), %xmm8
	vpunpcklqdq	%xmm12, %xmm4, %xmm2
	vmovq	%xmm12, %r10
	vpunpcklqdq	%xmm7, %xmm5, %xmm12
	vmovq	%xmm8, %r11
	vpunpcklqdq	%xmm0, %xmm8, %xmm11
	vmovq	%r8, %xmm8
	vinserti32x4	$0x1, %xmm9, %ymm2, %ymm1
	vinserti32x4	$0x1, %xmm11, %ymm2, %ymm15
	vpunpcklqdq	%xmm13, %xmm8, %xmm8
	vinserti32x8	$0x1, %ymm15, %zmm1, %zmm11
	vinserti32x4	$0x1, %xmm2, %ymm9, %ymm2
	vmovd	24(%rdi), %xmm9
	vmovdqa64	%zmm3, (%rdx)
	vmovq	%xmm7, %rdx
	vmovd	16(%rsi), %xmm7
	vinserti32x4	$0x1, %xmm12, %ymm8, %ymm15
	vpunpcklqdq	%xmm10, %xmm7, %xmm10
	vinserti32x4	$0x1, %xmm10, %ymm6, %ymm1
	vinserti32x4	$0x1, %xmm8, %ymm10, %ymm8
	vinserti32x8	$0x1, %ymm15, %zmm1, %zmm12
	vmovq	%r10, %xmm1
	vpmuldq	%zmm12, %zmm11, %zmm15
	vmovq	%r11, %xmm12
	vmovd	20(%rdi), %xmm11
	vpunpcklqdq	%xmm12, %xmm1, %xmm12
	vmovq	%rdx, %xmm1
	vpunpcklqdq	%xmm7, %xmm1, %xmm1
	vmovd	24(%rsi), %xmm7
	vpunpcklqdq	%xmm0, %xmm11, %xmm0
	vinserti32x4	$0x1, %xmm14, %ymm0, %ymm0
	vinserti32x4	$0x1, %xmm12, %ymm14, %ymm14
	vmovdqa	%xmm1, -40(%rsp)
	vpunpcklqdq	%xmm7, %xmm5, %xmm5
	vinserti32x8	$0x1, %ymm0, %zmm14, %zmm0
	vinserti32x4	$0x1, %xmm1, %ymm5, %ymm5
	vmovdqa64	%zmm15, 64(%rcx)
	vinserti32x8	$0x1, %ymm5, %zmm8, %zmm5
	vmovd	28(%rsi), %xmm8
	vpmuldq	%zmm5, %zmm0, %zmm0
	vpunpcklqdq	%xmm7, %xmm8, %xmm5
	vmovdqa	%xmm5, -56(%rsp)
	vinserti32x4	$0x1, %xmm1, %ymm5, %ymm5
	vmovdqa	-8(%rsp), %xmm1
	vinserti32x4	$0x1, %xmm6, %ymm1, %ymm6
	vinserti32x8	$0x1, %ymm5, %zmm6, %zmm16
	vpunpcklqdq	%xmm9, %xmm11, %xmm5
	vmovdqa64	%zmm0, 128(%rcx)
	vinserti32x4	$0x1, %xmm5, %ymm12, %ymm12
	vmovdqa	%xmm5, -24(%rsp)
	vmovq	%r11, %xmm5
	vmovq	%xmm15, %r11
	vinserti32x8	$0x1, %ymm2, %zmm12, %zmm1
	vmovd	28(%rdi), %xmm2
	vpunpcklqdq	%xmm11, %xmm5, %xmm11
	vpmuldq	%zmm16, %zmm1, %zmm6
	vpunpcklqdq	%xmm2, %xmm9, %xmm1
	vpunpcklqdq	%xmm4, %xmm2, %xmm4
	vpunpcklqdq	%xmm9, %xmm2, %xmm9
	vmovdqa64	%zmm6, 192(%rcx)
	vmovdqa	%xmm1, -72(%rsp)
	vinserti32x4	$0x1, %xmm1, %ymm11, %ymm1
	vinserti32x8	$0x1, %ymm14, %zmm1, %zmm14
	vmovdqa	-24(%rsp), %xmm1
	vpmuldq	%zmm16, %zmm14, %zmm5
	vinserti32x4	$0x1, %xmm4, %ymm1, %ymm14
	vinserti32x8	$0x1, %ymm12, %zmm14, %zmm1
	vpunpcklqdq	%xmm8, %xmm13, %xmm14
	vmovq	%rdx, %xmm12
	vmovdqa	-8(%rsp), %xmm13
	vpunpcklqdq	%xmm12, %xmm7, %xmm12
	vinserti32x4	$0x1, %xmm10, %ymm12, %ymm4
	vinserti32x4	$0x1, %xmm14, %ymm13, %ymm14
	vinserti32x8	$0x1, %ymm4, %zmm14, %zmm4
	vmovdqa	-72(%rsp), %xmm14
	vmovdqa64	%zmm5, 256(%rcx)
	vpmuldq	%zmm4, %zmm1, %zmm4
	vmovq	%r10, %xmm1
	vpextrq	$1, %xmm15, %r10
	vpunpcklqdq	%xmm1, %xmm2, %xmm1
	vinserti32x4	$0x1, %xmm11, %ymm14, %ymm13
	vinserti32x4	$0x1, %xmm11, %ymm1, %ymm11
	vinserti32x8	$0x1, %ymm13, %zmm11, %zmm1
	vmovdqa	-56(%rsp), %xmm13
	vmovq	%r8, %xmm11
	vpunpcklqdq	%xmm8, %xmm11, %xmm11
	vinserti32x4	$0x1, %xmm12, %ymm11, %ymm12
	vpunpcklqdq	%xmm2, %xmm2, %xmm11
	vinserti32x4	$0x1, %xmm13, %ymm10, %ymm10
	vmovdqa64	%zmm4, 320(%rcx)
	vinserti32x4	$0x1, -24(%rsp), %ymm14, %ymm2
	vinserti32x8	$0x1, %ymm10, %zmm12, %zmm10
	vinserti32x4	$0x1, %xmm11, %ymm9, %ymm12
	vpmuldq	%zmm10, %zmm1, %zmm1
	vpunpcklqdq	%xmm8, %xmm7, %xmm10
	vmovq	%rdx, %xmm7
	vinserti32x8	$0x1, %ymm12, %zmm2, %zmm11
	vmovdqa	-40(%rsp), %xmm12
	vpunpcklqdq	%xmm8, %xmm7, %xmm8
	vinserti32x4	$0x1, %xmm10, %ymm8, %ymm9
	vpsrldq	$8, %xmm3, %xmm7
	vextracti128	$0x1, %ymm3, %xmm10
	vinserti32x4	$0x1, %xmm13, %ymm12, %ymm13
	vextracti64x4	$0x1, %zmm3, %ymm3
	vpextrq	$1, %xmm10, %rsi
	vinserti32x8	$0x1, %ymm9, %zmm13, %zmm14
	vmovq	%xmm3, %rax
	vextracti128	$0x1, %ymm3, %xmm13
	vpextrq	$1, %xmm3, %rdi
	vmovq	%xmm13, %r9
	addq	%rsi, %rax
	vmovdqa64	%zmm1, 384(%rcx)
	vpextrq	$1, %xmm13, %r8
	vpaddq	%xmm7, %xmm10, %xmm9
	addq	%rdi, %rax
	vextracti128	$0x1, %ymm15, %xmm10
	addq	%r9, %r8
	movq	%rax, 16(%rcx)
	vextracti64x4	$0x1, %zmm15, %ymm15
	vmovq	%xmm10, %rdx
	addq	%r11, %r8
	vpextrq	$1, %xmm10, %rax
	vmovq	%xmm9, 8(%rcx)
	addq	%r10, %r8
	vmovq	%xmm15, %rsi
	addq	%rdx, %rax
	vextracti128	$0x1, %ymm15, %xmm7
	vpextrq	$1, %xmm15, %rdi
	addq	%rsi, %rax
	movq	%r8, 24(%rcx)
	vmovq	%xmm7, %r9
	addq	%rdi, %rax
	vpextrq	$1, %xmm7, %r8
	vmovq	%xmm0, %r11
	addq	%r9, %rax
	vextracti128	$0x1, %ymm0, %xmm12
	vpextrq	$1, %xmm0, %r10
	addq	%r8, %r11
	movq	%rax, 32(%rcx)
	vextracti64x4	$0x1, %zmm0, %ymm0
	vmovq	%xmm12, %rdx
	addq	%r10, %r11
	vpextrq	$1, %xmm12, %rax
	vpmuldq	%zmm14, %zmm11, %zmm2
	addq	%rdx, %r11
	vextracti128	$0x1, %ymm0, %xmm14
	vmovq	%xmm0, %rsi
	vpextrq	$1, %xmm0, %rdi
	addq	%rax, %r11
	vmovq	%xmm14, %r9
	addq	%rsi, %r11
	vpextrq	$1, %xmm14, %r8
	addq	%rdi, %r9
	movq	%r11, 40(%rcx)
	vmovq	%xmm6, %r11
	vextracti128	$0x1, %ymm6, %xmm15
	addq	%r8, %r9
	vpextrq	$1, %xmm6, %r10
	vmovq	%xmm15, %rdx
	addq	%r11, %r9
	vextracti64x4	$0x1, %zmm6, %ymm6
	vpextrq	$1, %xmm15, %rax
	vmovdqa64	%zmm2, 448(%rcx)
	addq	%r10, %r9
	vextracti128	$0x1, %ymm6, %xmm7
	vmovq	%xmm6, %rsi
	addq	%rdx, %r9
	vpextrq	$1, %xmm6, %rdi
	vpextrq	$1, %xmm7, %r8
	addq	%rax, %r9
	addq	%rsi, %rdi
	vmovq	%xmm5, %r11
	movq	%r9, 48(%rcx)
	vmovq	%xmm7, %r9
	vextracti128	$0x1, %ymm5, %xmm12
	vpextrq	$1, %xmm5, %r10
	addq	%r9, %rdi
	vmovq	%xmm12, %rdx
	vpextrq	$1, %xmm12, %rax
	addq	%r8, %rdi
	vextracti64x4	$0x1, %zmm5, %ymm5
	vextracti128	$0x1, %ymm4, %xmm10
	addq	%r11, %rdi
	vextracti128	$0x1, %ymm5, %xmm13
	vmovq	%xmm5, %rsi
	addq	%r10, %rdi
	vmovq	%xmm13, %r9
	vpextrq	$1, %xmm13, %r8
	addq	%rdx, %rdi
	vmovq	%xmm4, %r11
	vpextrq	$1, %xmm4, %r10
	addq	%rax, %rdi
	vextracti64x4	$0x1, %zmm4, %ymm4
	vmovq	%xmm10, %rdx
	movq	%rdi, 56(%rcx)
	vpextrq	$1, %xmm5, %rdi
	vmovq	%xmm4, %rax
	vextracti128	$0x1, %ymm4, %xmm6
	addq	%rsi, %rdi
	vpextrq	$1, %xmm10, %rsi
	vextracti128	$0x1, %ymm1, %xmm9
	addq	%r9, %rdi
	vmovq	%xmm6, %r9
	vextracti128	$0x1, %ymm2, %xmm13
	addq	%r8, %rdi
	vpextrq	$1, %xmm6, %r8
	addq	%r11, %rdi
	vmovq	%xmm1, %r11
	addq	%r10, %rdi
	vpextrq	$1, %xmm1, %r10
	vextracti64x4	$0x1, %zmm1, %ymm1
	addq	%rdx, %rdi
	addq	%rsi, %rax
	vmovq	%xmm9, %rdx
	movq	%rdi, 64(%rcx)
	vpextrq	$1, %xmm4, %rdi
	vpextrq	$1, %xmm9, %rsi
	vextracti128	$0x1, %ymm1, %xmm12
	addq	%rdi, %rax
	vpextrq	$1, %xmm1, %rdi
	addq	%r9, %rax
	vmovq	%xmm12, %r9
	addq	%r8, %rax
	vpextrq	$1, %xmm12, %r8
	addq	%r11, %rax
	addq	%r10, %rdx
	vmovq	%xmm2, %r11
	movq	%rax, 72(%rcx)
	addq	%rsi, %rdx
	vmovq	%xmm1, %rax
	vpextrq	$1, %xmm2, %r10
	addq	%rax, %rdx
	vextracti64x4	$0x1, %zmm2, %ymm2
	vpextrq	$1, %xmm13, %rax
	addq	%rdi, %rdx
	addq	%r9, %r8
	vmovq	%xmm2, %rsi
	movq	%rdx, 80(%rcx)
	addq	%r11, %r8
	vmovq	%xmm13, %rdx
	vextracti128	$0x1, %ymm2, %xmm10
	addq	%r10, %r8
	addq	%rdx, %rax
	vpextrq	$1, %xmm10, %rdi
	addq	%rsi, %rax
	vpsrldq	$8, %xmm2, %xmm11
	movq	%r8, 88(%rcx)
	movq	%rcx, %rsi
	vpaddq	%xmm10, %xmm11, %xmm15
	movq	%rax, 96(%rcx)
	vpinsrq	$1, %rdi, %xmm15, %xmm6
	movl	$15, %edi
	vmovdqu	%xmm6, 104(%rcx)
	vzeroupper
	leave
	.cfi_def_cfa 7, 8
	jmp	adjust_limbs
	.cfi_endproc
.LFE6655:
	.size	multiply.constprop.0, .-multiply.constprop.0
	.p2align 4
	.globl	multiply
	.type	multiply, @function
multiply:
.LFB6645:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-64, %rsp
	subq	$64, %rsp
	vmovd	(%rdi), %xmm0
	vmovd	(%rsi), %xmm13
	vmovd	4(%rdi), %xmm2
	vmovd	8(%rdi), %xmm14
	vpunpcklqdq	%xmm0, %xmm0, %xmm1
	vmovd	4(%rsi), %xmm11
	vmovd	12(%rsi), %xmm9
	vpunpcklqdq	%xmm2, %xmm0, %xmm12
	vpunpcklqdq	%xmm14, %xmm2, %xmm10
	vpunpcklqdq	%xmm0, %xmm2, %xmm4
	vinserti32x4	$0x1, %xmm12, %ymm10, %ymm3
	vinserti32x4	$0x1, %xmm4, %ymm1, %ymm5
	vpunpcklqdq	%xmm13, %xmm11, %xmm7
	vmovdqa	%xmm12, 32(%rsp)
	vinserti32x8	$0x1, %ymm3, %zmm5, %zmm6
	vmovd	8(%rsi), %xmm3
	vpunpcklqdq	%xmm11, %xmm13, %xmm4
	vpunpcklqdq	%xmm3, %xmm9, %xmm8
	vpunpcklqdq	%xmm3, %xmm13, %xmm2
	vinserti32x4	$0x1, %xmm8, %ymm7, %ymm15
	vinserti32x4	$0x1, %xmm2, %ymm4, %ymm1
	vmovdqa	%xmm8, 48(%rsp)
	vmovd	16(%rdi), %xmm8
	vinserti32x8	$0x1, %ymm15, %zmm1, %zmm5
	vmovd	12(%rdi), %xmm1
	vpmuldq	%zmm5, %zmm6, %zmm6
	vpunpcklqdq	%xmm0, %xmm8, %xmm15
	vpunpcklqdq	%xmm11, %xmm3, %xmm5
	vmovq	%xmm8, %r10
	vmovdqa64	%zmm6, (%rdx)
	vpunpcklqdq	%xmm1, %xmm14, %xmm6
	vinserti32x4	$0x1, %xmm15, %ymm6, %ymm4
	vinserti32x4	$0x1, %xmm12, %ymm6, %ymm12
	vinserti32x8	$0x1, %ymm4, %zmm12, %zmm16
	vmovd	20(%rsi), %xmm4
	vpunpcklqdq	%xmm4, %xmm13, %xmm2
	vinserti32x4	$0x1, %xmm2, %ymm5, %ymm15
	vmovd	16(%rsi), %xmm2
	vpunpcklqdq	%xmm9, %xmm2, %xmm9
	vpunpcklqdq	%xmm2, %xmm4, %xmm2
	vinserti32x4	$0x1, %xmm9, %ymm7, %ymm8
	vinserti32x4	$0x1, %xmm5, %ymm9, %ymm5
	vinserti32x8	$0x1, %ymm15, %zmm8, %zmm12
	vmovq	%r10, %xmm8
	vpmuldq	%zmm12, %zmm16, %zmm15
	vmovd	20(%rdi), %xmm12
	vpunpcklqdq	%xmm8, %xmm1, %xmm8
	vpunpcklqdq	%xmm0, %xmm12, %xmm0
	vinserti32x4	$0x1, %xmm10, %ymm0, %ymm0
	vinserti32x4	$0x1, %xmm8, %ymm10, %ymm10
	vinserti32x8	$0x1, %ymm0, %zmm10, %zmm0
	vmovdqa64	%zmm15, 64(%rdx)
	vmovd	24(%rsi), %xmm15
	vpunpcklqdq	%xmm15, %xmm13, %xmm13
	vinserti32x4	$0x1, %xmm2, %ymm13, %ymm13
	vinserti32x8	$0x1, %ymm13, %zmm5, %zmm13
	vmovd	28(%rsi), %xmm5
	leal	-1(%rcx), %esi
	vpmuldq	%zmm13, %zmm0, %zmm0
	vpunpcklqdq	%xmm15, %xmm5, %xmm13
	vpunpcklqdq	%xmm5, %xmm3, %xmm3
	vmovdqa	%xmm13, 16(%rsp)
	vmovdqa64	%zmm0, 128(%rdx)
	vinserti32x4	$0x1, %xmm2, %ymm13, %ymm0
	vmovdqa	48(%rsp), %xmm13
	vinserti32x4	$0x1, %xmm7, %ymm13, %ymm7
	vinserti32x8	$0x1, %ymm0, %zmm7, %zmm17
	vmovd	24(%rdi), %xmm7
	vmovdqa	32(%rsp), %xmm0
	vpunpcklqdq	%xmm7, %xmm12, %xmm13
	vinserti32x4	$0x1, %xmm6, %ymm0, %ymm6
	vmovdqa	%xmm13, 32(%rsp)
	vinserti32x4	$0x1, %xmm13, %ymm8, %ymm13
	vinserti32x8	$0x1, %ymm6, %zmm13, %zmm8
	vmovq	%r10, %xmm6
	vpmuldq	%zmm17, %zmm8, %zmm0
	vpunpcklqdq	%xmm12, %xmm6, %xmm12
	vmovdqa64	%zmm0, 192(%rdx)
	vmovd	28(%rdi), %xmm0
	movl	%r8d, %edi
	vpunpcklqdq	%xmm0, %xmm7, %xmm8
	vpunpcklqdq	%xmm14, %xmm0, %xmm14
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	vinserti32x4	$0x1, %xmm8, %ymm12, %ymm6
	vpunpcklqdq	%xmm7, %xmm0, %xmm7
	vinserti32x8	$0x1, %ymm10, %zmm6, %zmm10
	vpmuldq	%zmm17, %zmm10, %zmm6
	vmovdqa64	%zmm6, 256(%rdx)
	vmovdqa	32(%rsp), %xmm10
	vinserti32x4	$0x1, %xmm14, %ymm10, %ymm6
	vpunpcklqdq	%xmm4, %xmm15, %xmm10
	vpunpcklqdq	%xmm5, %xmm15, %xmm15
	vinserti32x8	$0x1, %ymm13, %zmm6, %zmm14
	vpunpcklqdq	%xmm5, %xmm11, %xmm13
	vmovdqa	48(%rsp), %xmm11
	vinserti32x4	$0x1, %xmm9, %ymm10, %ymm6
	vpunpcklqdq	%xmm5, %xmm4, %xmm4
	vinserti32x4	$0x1, %xmm10, %ymm3, %ymm10
	vinserti32x4	$0x1, %xmm13, %ymm11, %ymm13
	vinserti32x4	$0x1, %xmm12, %ymm8, %ymm11
	vinserti32x4	$0x1, 32(%rsp), %ymm8, %ymm8
	vinserti32x8	$0x1, %ymm6, %zmm13, %zmm6
	vinserti32x4	$0x1, %xmm12, %ymm1, %ymm12
	vpunpcklqdq	%xmm0, %xmm0, %xmm1
	vpmuldq	%zmm6, %zmm14, %zmm14
	vinserti32x8	$0x1, %ymm11, %zmm12, %zmm13
	vinserti32x4	$0x1, %xmm1, %ymm7, %ymm0
	vinserti32x4	$0x1, %xmm15, %ymm4, %ymm5
	vinserti32x8	$0x1, %ymm0, %zmm8, %zmm12
	vmovdqa64	%zmm14, 320(%rdx)
	vmovdqa	16(%rsp), %xmm14
	vinserti32x4	$0x1, %xmm14, %ymm9, %ymm9
	vinserti32x4	$0x1, %xmm14, %ymm2, %ymm2
	vinserti32x8	$0x1, %ymm9, %zmm10, %zmm6
	vpmuldq	%zmm6, %zmm13, %zmm11
	vinserti32x8	$0x1, %ymm5, %zmm2, %zmm13
	vpmuldq	%zmm13, %zmm12, %zmm14
	vmovdqa64	%zmm11, 384(%rdx)
	vmovdqa64	%zmm14, 448(%rdx)
	call	add_limbs
	movq	%rdx, %rsi
	vzeroupper
	leave
	.cfi_def_cfa 7, 8
	leal	1(%rax), %edi
	jmp	adjust_limbs
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
.LC19:
	.string	"a"
.LC20:
	.string	"perf_output_test4.txt"
	.section	.rodata.str1.8
	.align 8
.LC22:
	.string	"Time taken for AVX multiplication: %f\n"
	.align 8
.LC23:
	.string	"Time taken for GMP multiplication: %f\n"
	.section	.rodata.str1.1
.LC24:
	.string	"Test failed"
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"i: %d, expected: %c, result: %c\n"
	.section	.rodata.str1.1
.LC26:
	.string	"result: %s\n"
.LC27:
	.string	"expected: %s\n"
.LC28:
	.string	"passed"
.LC29:
	.string	"Test %s\n"
	.text
	.p2align 4
	.globl	test
	.type	test, @function
test:
.LFB6649:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$32, %edi
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
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$296, %rsp
	.cfi_def_cfa_offset 352
	call	malloc
	movl	$32, %edi
	leaq	48(%rsp), %r12
	leaq	64(%rsp), %r13
	movq	%rax, %r14
	call	malloc
	movl	$65, %edi
	movq	%rax, %r15
	call	malloc
	movq	%r12, %rdi
	movq	%rax, 8(%rsp)
	call	__gmpz_init
	movq	%r13, %rdi
	call	__gmpz_init
	leaq	80(%rsp), %rdi
	call	__gmpz_init
	leaq	40(%rsp), %rdi
	movl	$512, %edx
	movl	$64, %esi
	call	posix_memalign
	testl	%eax, %eax
	jne	.L359
	movq	40(%rsp), %rbp
.L359:
	xorl	%eax, %eax
	movl	$64, %ecx
	movq	%rbp, %rdi
	movq	%r14, %rbx
	rep stosq
	xorl	%edi, %edi
	call	time
	movl	%eax, %edi
	call	srand
	leaq	32(%r14), %rdx
	movq	%rdx, (%rsp)
	.p2align 4
	.p2align 3
.L360:
	call	rand
	movq	(%rsp), %rsi
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
	cmpq	%rsi, %rbx
	jne	.L360
	leaq	32(%r15), %r8
	movq	%r15, %rbx
	movq	%r8, (%rsp)
	.p2align 4
	.p2align 3
.L361:
	call	rand
	movq	(%rsp), %r9
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
	cmpq	%r9, %rbx
	jne	.L361
	xorl	%ebx, %ebx
.L362:
	movl	$32, %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_mul_2exp
	movl	(%r14,%rbx), %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r13, %rsi
	movq	%r13, %rdi
	call	__gmpz_mul_2exp
	movl	(%r15,%rbx), %edx
	movq	%r13, %rsi
	movq	%r13, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_mul_2exp
	movl	4(%r14,%rbx), %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r13, %rsi
	movq	%r13, %rdi
	call	__gmpz_mul_2exp
	movl	4(%r15,%rbx), %edx
	movq	%r13, %rsi
	movq	%r13, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_mul_2exp
	movl	8(%r14,%rbx), %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r13, %rsi
	movq	%r13, %rdi
	call	__gmpz_mul_2exp
	movl	8(%r15,%rbx), %edx
	movq	%r13, %rsi
	movq	%r13, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_mul_2exp
	movl	12(%r14,%rbx), %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r13, %rsi
	movq	%r13, %rdi
	call	__gmpz_mul_2exp
	movl	12(%r15,%rbx), %edx
	movq	%r13, %rsi
	movq	%r13, %rdi
	addq	$16, %rbx
	call	__gmpz_add_ui
	cmpq	$32, %rbx
	jne	.L362
	movl	$1, %esi
	movl	$.LC18, %edi
	xorl	%eax, %eax
	call	printf
	xorl	%eax, %eax
	call	initialize_perf
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movl	$-1, %edx
	xorl	%esi, %esi
	movl	$pe, %edi
	call	perf_event_open
#APP
# 304 "test4.c" 1
	mfence
# 0 "" 2
# 306 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	xorl	%eax, %eax
	leaq	96(%rsp), %rbx
	call	start_perf
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	multiply.constprop.0
	xorl	%eax, %eax
	call	stop_perf
	movq	%rbx, %rdi
	call	read_perf
	movl	$.LC19, %esi
	movl	$.LC20, %edi
	call	fopen
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	write_perf
#APP
# 317 "test4.c" 1
	mfence
# 0 "" 2
# 319 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	80(%rsp), %rdi
	call	__gmpz_mul
	leaq	80(%rsp), %rdx
	movl	$16, %esi
	xorl	%edi, %edi
	call	__gmpz_get_str
	movq	%rax, 24(%rsp)
#APP
# 336 "test4.c" 1
	mfence
# 0 "" 2
# 338 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	multiply.constprop.0
	movq	$1, (%rsp)
	.p2align 4
	.p2align 3
.L365:
	leaq	144(%rsp), %rsi
	xorl	%edi, %edi
	salq	(%rsp)
	movq	(%rsp), %rbx
	call	getrusage
	fildq	144(%rsp)
	fmuls	.LC21(%rip)
	movq	%rbx, %r10
	fildq	152(%rsp)
	faddp	%st, %st(1)
	fisttpq	16(%rsp)
	testq	%rbx, %rbx
	jle	.L363
	xorl	%ebx, %ebx
	andl	$6, %r10d
	je	.L364
	cmpq	$1, %r10
	je	.L465
	cmpq	$2, %r10
	je	.L466
	cmpq	$3, %r10
	je	.L467
	cmpq	$4, %r10
	je	.L468
	cmpq	$5, %r10
	je	.L469
	cmpq	$6, %r10
	je	.L470
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	movl	$1, %ebx
	call	multiply.constprop.0
.L470:
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	addq	$1, %rbx
	call	multiply.constprop.0
.L469:
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	addq	$1, %rbx
	call	multiply.constprop.0
.L468:
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	addq	$1, %rbx
	call	multiply.constprop.0
.L467:
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	addq	$1, %rbx
	call	multiply.constprop.0
.L466:
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	addq	$1, %rbx
	call	multiply.constprop.0
.L465:
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	addq	$1, %rbx
	call	multiply.constprop.0
	cmpq	%rbx, (%rsp)
	je	.L363
.L364:
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	addq	$8, %rbx
	call	multiply.constprop.0
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	multiply.constprop.0
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	multiply.constprop.0
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	multiply.constprop.0
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	multiply.constprop.0
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	multiply.constprop.0
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	multiply.constprop.0
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	multiply.constprop.0
	cmpq	%rbx, (%rsp)
	jne	.L364
.L363:
	leaq	144(%rsp), %rsi
	xorl	%edi, %edi
	call	getrusage
	fildq	144(%rsp)
	fmuls	.LC21(%rip)
	fildq	152(%rsp)
	faddp	%st, %st(1)
	fildq	16(%rsp)
	fsubrp	%st, %st(1)
	fisttpq	16(%rsp)
	movq	16(%rsp), %r11
	cmpq	$249999, %r11
	jle	.L365
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$.LC22, %edi
	movl	$1, %eax
	vcvtsi2sdq	%r11, %xmm2, %xmm0
	vcvtsi2sdq	(%rsp), %xmm2, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	call	printf
#APP
# 347 "test4.c" 1
	mfence
# 0 "" 2
# 349 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	xorl	%r15d, %r15d
	leaq	64(%rbp), %r14
	.p2align 4
	.p2align 3
.L366:
	movq	8(%rsp), %rdx
	movq	0(%rbp), %rcx
	movslq	%r15d, %rdi
	xorl	%eax, %eax
	movl	$17, %esi
	addq	$8, %rbp
	addl	$16, %r15d
	addq	%rdx, %rdi
	movl	$.LC17, %edx
	call	snprintf
	cmpq	%rbp, %r14
	jne	.L366
	movq	8(%rsp), %rcx
	movslq	%r15d, %rbp
	movb	$0, (%rcx,%rbp)
	cmpb	$48, (%rcx)
	jne	.L367
	.p2align 4
	.p2align 4
	.p2align 3
.L368:
	addq	$1, 8(%rsp)
	movq	8(%rsp), %rdi
	cmpb	$48, (%rdi)
	je	.L368
.L367:
#APP
# 354 "test4.c" 1
	mfence
# 0 "" 2
# 356 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	80(%rsp), %rdi
	movl	$1, %ebx
	call	__gmpz_mul
	.p2align 4
	.p2align 3
.L371:
	leaq	144(%rsp), %rsi
	xorl	%edi, %edi
	addq	%rbx, %rbx
	call	getrusage
	fildq	144(%rsp)
	fmuls	.LC21(%rip)
	fildq	152(%rsp)
	faddp	%st, %st(1)
	fisttpq	(%rsp)
	testq	%rbx, %rbx
	jle	.L369
	movq	%rbx, %rsi
	xorl	%r14d, %r14d
	andl	$6, %esi
	je	.L370
	cmpq	$1, %rsi
	je	.L471
	cmpq	$2, %rsi
	je	.L472
	cmpq	$3, %rsi
	je	.L473
	cmpq	$4, %rsi
	je	.L474
	cmpq	$5, %rsi
	je	.L475
	cmpq	$6, %rsi
	je	.L476
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	80(%rsp), %rdi
	movl	$1, %r14d
	call	__gmpz_mul
.L476:
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	80(%rsp), %rdi
	addq	$1, %r14
	call	__gmpz_mul
.L475:
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	80(%rsp), %rdi
	addq	$1, %r14
	call	__gmpz_mul
.L474:
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	80(%rsp), %rdi
	addq	$1, %r14
	call	__gmpz_mul
.L473:
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	80(%rsp), %rdi
	addq	$1, %r14
	call	__gmpz_mul
.L472:
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	80(%rsp), %rdi
	addq	$1, %r14
	call	__gmpz_mul
.L471:
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	80(%rsp), %rdi
	addq	$1, %r14
	call	__gmpz_mul
	cmpq	%r14, %rbx
	je	.L369
.L370:
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	80(%rsp), %rdi
	addq	$8, %r14
	call	__gmpz_mul
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	80(%rsp), %rdi
	call	__gmpz_mul
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	80(%rsp), %rdi
	call	__gmpz_mul
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	80(%rsp), %rdi
	call	__gmpz_mul
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	80(%rsp), %rdi
	call	__gmpz_mul
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	80(%rsp), %rdi
	call	__gmpz_mul
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	80(%rsp), %rdi
	call	__gmpz_mul
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	80(%rsp), %rdi
	call	__gmpz_mul
	cmpq	%r14, %rbx
	jne	.L370
.L369:
	leaq	144(%rsp), %rsi
	xorl	%edi, %edi
	call	getrusage
	fildq	144(%rsp)
	fmuls	.LC21(%rip)
	fildq	152(%rsp)
	faddp	%st, %st(1)
	fildq	(%rsp)
	fsubrp	%st, %st(1)
	fisttpq	(%rsp)
	movq	(%rsp), %r8
	cmpq	$249999, %r8
	jle	.L371
	vxorpd	%xmm3, %xmm3, %xmm3
	movl	$.LC23, %edi
	movl	$1, %eax
	vcvtsi2sdq	%r8, %xmm3, %xmm4
	vcvtsi2sdq	%rbx, %xmm3, %xmm5
	vdivsd	%xmm5, %xmm4, %xmm0
	call	printf
#APP
# 362 "test4.c" 1
	mfence
# 0 "" 2
# 364 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	movq	24(%rsp), %rdi
	xorl	%ebx, %ebx
	call	strlen
	movq	%rax, %r13
	movq	%rax, %r12
	andl	$7, %r13d
	je	.L372
	movq	8(%rsp), %r10
	movq	24(%rsp), %r9
	movzbl	(%r10), %eax
	cmpb	%al, (%r9)
	jne	.L506
	movl	$1, %ebx
	cmpq	$1, %r13
	je	.L372
	cmpq	$2, %r13
	je	.L477
	cmpq	$3, %r13
	je	.L478
	cmpq	$4, %r13
	je	.L479
	cmpq	$5, %r13
	je	.L480
	cmpq	$6, %r13
	jne	.L509
.L481:
	movq	8(%rsp), %rcx
	movq	24(%rsp), %rbp
	leaq	1(%rbx), %rdx
	movzbl	(%rcx,%rbx), %edi
	cmpb	%dil, 0(%rbp,%rbx)
	jne	.L506
	movq	%rdx, %rbx
.L480:
	movq	8(%rsp), %rsi
	movq	24(%rsp), %r8
	leaq	1(%rbx), %r14
	movzbl	(%rsi,%rbx), %r13d
	cmpb	%r13b, (%r8,%rbx)
	jne	.L506
	movq	%r14, %rbx
.L479:
	movq	8(%rsp), %rax
	movq	24(%rsp), %r10
	leaq	1(%rbx), %r9
	movzbl	(%rax,%rbx), %r11d
	cmpb	%r11b, (%r10,%rbx)
	jne	.L506
	movq	%r9, %rbx
.L478:
	movq	8(%rsp), %rbp
	movq	24(%rsp), %rdx
	leaq	1(%rbx), %r15
	movzbl	0(%rbp,%rbx), %ecx
	cmpb	%cl, (%rdx,%rbx)
	jne	.L506
	movq	%r15, %rbx
.L477:
	movq	8(%rsp), %r8
	movq	24(%rsp), %r14
	leaq	1(%rbx), %rdi
	movzbl	(%r8,%rbx), %esi
	cmpb	%sil, (%r14,%rbx)
	jne	.L506
	movq	%rdi, %rbx
	cmpq	%rbx, %r12
	je	.L510
.L373:
	movq	8(%rsp), %r10
	movq	24(%rsp), %r9
	leaq	1(%rbx), %r13
	movzbl	(%r10,%rbx), %eax
	cmpb	%al, (%r9,%rbx)
	jne	.L506
	movq	8(%rsp), %rdx
	movq	%r9, %r15
	movq	%r13, %rbx
	leaq	1(%r13), %r11
	movzbl	(%rdx,%r13), %ebp
	cmpb	%bpl, (%r9,%r13)
	jne	.L506
	movq	8(%rsp), %rdi
	movq	%r11, %rbx
	movzbl	(%rdi,%r11), %ecx
	cmpb	%cl, (%r9,%r11)
	jne	.L506
	movzbl	2(%rdi,%r13), %r8d
	leaq	2(%r13), %rbx
	leaq	3(%r13), %r14
	cmpb	%r8b, 2(%r9,%r13)
	jne	.L506
	movzbl	3(%rdi,%r13), %r9d
	movq	%r14, %rbx
	leaq	4(%r13), %rsi
	cmpb	%r9b, 3(%r15,%r13)
	jne	.L506
	movzbl	4(%rdi,%r13), %eax
	movq	%rsi, %rbx
	leaq	5(%r13), %r10
	cmpb	%al, 4(%r15,%r13)
	jne	.L506
	movzbl	5(%rdi,%r13), %edx
	movq	%r10, %rbx
	leaq	6(%r13), %r11
	cmpb	%dl, 5(%r15,%r13)
	jne	.L506
	movzbl	6(%rdi,%r13), %edi
	movq	%r11, %rbx
	leaq	7(%r13), %rbp
	cmpb	%dil, 6(%r15,%r13)
	jne	.L506
	movq	%rbp, %rbx
.L372:
	cmpq	%rbx, %r12
	jne	.L373
.L510:
	movl	$.LC28, %esi
	movl	$.LC29, %edi
	xorl	%eax, %eax
	call	printf
	addq	$296, %rsp
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
.L509:
	.cfi_restore_state
	movl	$2, %r11d
	movzbl	-1(%r10,%r11), %r15d
	cmpb	%r15b, (%r9,%rbx)
	jne	.L506
	movq	%r11, %rbx
	jmp	.L481
.L506:
	movl	$.LC24, %edi
	call	puts
	movq	8(%rsp), %r12
	movl	%ebx, %esi
	xorl	%eax, %eax
	movq	24(%rsp), %r13
	movl	$.LC25, %edi
	movsbl	(%r12,%rbx), %ecx
	movsbl	0(%r13,%rbx), %edx
	call	printf
	movq	%r12, %rsi
	movl	$.LC26, %edi
	xorl	%eax, %eax
	call	printf
	movl	$.LC27, %edi
	movq	%r13, %rsi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
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
.LC21:
	.long	1232348160
	.ident	"GCC: (GNU) 14.2.1 20250110 (Red Hat 14.2.1-7)"
	.section	.note.GNU-stack,"",@progbits
