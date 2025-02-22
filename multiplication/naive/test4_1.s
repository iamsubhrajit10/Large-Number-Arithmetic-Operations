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
	.globl	multiply
	.type	multiply, @function
multiply:
.LFB6645:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	prefetcht0	(%rdi)
	prefetcht0	(%rsi)
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	leal	-1(%rcx), %r12d
	pushq	%rbx
	andq	$-64, %rsp
	.cfi_offset 3, -48
	vmovd	(%rdi), %xmm1
	vmovd	4(%rdi), %xmm2
	vmovd	8(%rdi), %xmm8
	vmovd	(%rsi), %xmm15
	vmovd	4(%rsi), %xmm9
	vpunpcklqdq	%xmm2, %xmm1, %xmm14
	vmovd	12(%rsi), %xmm13
	vpunpcklqdq	%xmm1, %xmm2, %xmm4
	vpunpcklqdq	%xmm8, %xmm2, %xmm11
	vpunpcklqdq	%xmm1, %xmm1, %xmm0
	vmovd	8(%rsi), %xmm2
	vmovdqa	%xmm14, -48(%rsp)
	vinserti32x4	$0x1, %xmm14, %ymm11, %ymm3
	vinserti32x4	$0x1, %xmm4, %ymm0, %ymm5
	vpunpcklqdq	%xmm15, %xmm9, %xmm6
	vpunpcklqdq	%xmm2, %xmm13, %xmm7
	vpunpcklqdq	%xmm2, %xmm15, %xmm12
	vinserti32x8	$0x1, %ymm3, %zmm5, %zmm10
	vpunpcklqdq	%xmm9, %xmm15, %xmm3
	vinserti32x4	$0x1, %xmm7, %ymm6, %ymm4
	vmovdqa	%xmm7, -16(%rsp)
	vinserti32x4	$0x1, %xmm12, %ymm3, %ymm0
	vinserti32x8	$0x1, %ymm4, %zmm0, %zmm5
	vmovd	12(%rdi), %xmm0
	vpmuldq	%zmm5, %zmm10, %zmm10
	vpunpcklqdq	%xmm9, %xmm2, %xmm5
	vpunpcklqdq	%xmm0, %xmm8, %xmm7
	vmovdqa	%xmm5, -64(%rsp)
	vinserti32x4	$0x1, %xmm14, %ymm7, %ymm14
	vmovdqa64	%zmm10, (%rdx)
	vmovd	16(%rdi), %xmm10
	vpunpcklqdq	%xmm1, %xmm10, %xmm4
	vinserti32x4	$0x1, %xmm4, %ymm7, %ymm12
	vmovd	16(%rsi), %xmm4
	vinserti32x8	$0x1, %ymm12, %zmm14, %zmm16
	vmovd	20(%rsi), %xmm14
	vpunpcklqdq	%xmm14, %xmm15, %xmm3
	vinserti32x4	$0x1, %xmm3, %ymm5, %ymm3
	vpunpcklqdq	%xmm13, %xmm4, %xmm5
	vpunpcklqdq	%xmm4, %xmm14, %xmm4
	vinserti32x4	$0x1, %xmm5, %ymm6, %ymm13
	vinserti32x8	$0x1, %ymm3, %zmm13, %zmm12
	vmovd	20(%rdi), %xmm13
	vpmuldq	%zmm12, %zmm16, %zmm3
	vpunpcklqdq	%xmm10, %xmm0, %xmm12
	vpunpcklqdq	%xmm1, %xmm13, %xmm1
	vmovdqa64	%zmm3, 64(%rdx)
	vinserti32x4	$0x1, %xmm11, %ymm1, %ymm3
	vinserti32x4	$0x1, %xmm12, %ymm11, %ymm11
	vinserti32x8	$0x1, %ymm3, %zmm11, %zmm1
	vmovd	24(%rsi), %xmm3
	vmovdqa	%xmm4, -32(%rsp)
	vpunpcklqdq	%xmm3, %xmm15, %xmm15
	vinserti32x4	$0x1, %xmm4, %ymm15, %ymm15
	vinserti32x4	$0x1, -64(%rsp), %ymm5, %ymm4
	vinserti32x8	$0x1, %ymm15, %zmm4, %zmm15
	vmovd	28(%rsi), %xmm4
	vpmuldq	%zmm15, %zmm1, %zmm1
	vpunpcklqdq	%xmm3, %xmm4, %xmm15
	vpunpcklqdq	%xmm4, %xmm9, %xmm9
	vpunpcklqdq	%xmm4, %xmm2, %xmm2
	vmovdqa	%xmm15, -64(%rsp)
	vmovdqa64	%zmm1, 128(%rdx)
	vinserti32x4	$0x1, -32(%rsp), %ymm15, %ymm1
	vmovdqa	-16(%rsp), %xmm15
	vinserti32x4	$0x1, %xmm6, %ymm15, %ymm6
	vinserti32x8	$0x1, %ymm1, %zmm6, %zmm17
	vmovdqa	-48(%rsp), %xmm1
	vinserti32x4	$0x1, %xmm7, %ymm1, %ymm15
	vmovd	24(%rdi), %xmm7
	vpunpcklqdq	%xmm7, %xmm13, %xmm6
	vpunpcklqdq	%xmm13, %xmm10, %xmm13
	vinserti32x4	$0x1, %xmm6, %ymm12, %ymm12
	vmovdqa	%xmm6, -48(%rsp)
	vinserti32x8	$0x1, %ymm15, %zmm12, %zmm1
	vpmuldq	%zmm17, %zmm1, %zmm15
	vmovd	28(%rdi), %xmm1
	vpunpcklqdq	%xmm1, %xmm7, %xmm6
	vpunpcklqdq	%xmm8, %xmm1, %xmm8
	vpunpcklqdq	%xmm0, %xmm1, %xmm0
	vinserti32x4	$0x1, %xmm6, %ymm13, %ymm10
	vpunpcklqdq	%xmm7, %xmm1, %xmm7
	vinserti32x8	$0x1, %ymm11, %zmm10, %zmm11
	vmovdqa64	%zmm15, 192(%rdx)
	vpmuldq	%zmm17, %zmm11, %zmm15
	vmovdqa64	%zmm15, 256(%rdx)
	vmovdqa	-48(%rsp), %xmm15
	vinserti32x4	$0x1, %xmm8, %ymm15, %ymm10
	vpunpcklqdq	%xmm14, %xmm3, %xmm8
	vpunpcklqdq	%xmm4, %xmm3, %xmm3
	vinserti32x8	$0x1, %ymm12, %zmm10, %zmm12
	vmovdqa	-16(%rsp), %xmm10
	vinserti32x4	$0x1, %xmm5, %ymm8, %ymm11
	vpunpcklqdq	%xmm4, %xmm14, %xmm14
	vinserti32x4	$0x1, %xmm8, %ymm2, %ymm8
	vmovdqa	-32(%rsp), %xmm4
	vinserti32x4	$0x1, %xmm9, %ymm10, %ymm9
	vinserti32x4	$0x1, %xmm13, %ymm6, %ymm10
	vinserti32x4	$0x1, %xmm13, %ymm0, %ymm13
	vinserti32x8	$0x1, %ymm11, %zmm9, %zmm11
	vinserti32x8	$0x1, %ymm10, %zmm13, %zmm9
	vpunpcklqdq	%xmm1, %xmm1, %xmm13
	vpmuldq	%zmm11, %zmm12, %zmm12
	vmovdqa	-64(%rsp), %xmm11
	vinserti32x4	$0x1, %xmm15, %ymm6, %ymm1
	vinserti32x4	$0x1, %xmm13, %ymm7, %ymm0
	vinserti32x4	$0x1, %xmm3, %ymm14, %ymm15
	vinserti32x8	$0x1, %ymm0, %zmm1, %zmm6
	vinserti32x4	$0x1, %xmm11, %ymm5, %ymm5
	vmovdqa64	%zmm12, 320(%rdx)
	vinserti32x8	$0x1, %ymm5, %zmm8, %zmm12
	vpmuldq	%zmm12, %zmm9, %zmm10
	vinserti32x4	$0x1, %xmm11, %ymm4, %ymm9
	vinserti32x8	$0x1, %ymm15, %zmm9, %zmm11
	vpmuldq	%zmm11, %zmm6, %zmm5
	vmovdqa64	%zmm10, 384(%rdx)
	vmovdqa64	%zmm5, 448(%rdx)
	cmpl	$1, %r8d
	jle	.L146
	movl	%r8d, %ebx
	movl	%r8d, %r11d
	leaq	8(%rdx), %r14
	movl	$1, %r8d
	movl	$1, %ecx
	.p2align 4
	.p2align 3
.L141:
	movslq	%ecx, %rsi
	leal	1(%r8), %r10d
	xorl	%edi, %edi
	leaq	(%rdx,%rsi,8), %rax
	addq	%r8, %rsi
	leaq	(%r14,%rsi,8), %r9
	xorl	%esi, %esi
	movq	%r9, %r13
	subq	%rax, %r13
	subq	$8, %r13
	shrq	$3, %r13
	addq	$1, %r13
	andl	$7, %r13d
	je	.L140
	cmpq	$1, %r13
	je	.L200
	cmpq	$2, %r13
	je	.L201
	cmpq	$3, %r13
	je	.L202
	cmpq	$4, %r13
	je	.L203
	cmpq	$5, %r13
	je	.L204
	cmpq	$6, %r13
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
	cmpq	%rax, %r9
	je	.L232
.L140:
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
	jne	.L140
.L232:
	movq	%rsi, (%rdx,%r8,8)
	addq	$1, %r8
	addl	%r10d, %ecx
	cmpq	%r8, %r11
	jne	.L141
	movl	%ebx, %r8d
	subl	$2, %r8d
	je	.L147
	movslq	%ebx, %r11
	leaq	(%rdx,%r11,8), %r10
	.p2align 4
	.p2align 3
.L143:
	movslq	%ecx, %r9
	movslq	%r8d, %r13
	leal	1(%r8), %r11d
	xorl	%esi, %esi
	addq	%r9, %r13
	leaq	(%rdx,%r9,8), %rax
	xorl	%edi, %edi
	leaq	(%r14,%r13,8), %r9
	movq	%r9, %r13
	subq	%rax, %r13
	subq	$8, %r13
	shrq	$3, %r13
	addq	$1, %r13
	andl	$7, %r13d
	je	.L142
	cmpq	$1, %r13
	je	.L206
	cmpq	$2, %r13
	je	.L207
	cmpq	$3, %r13
	je	.L208
	cmpq	$4, %r13
	je	.L209
	cmpq	$5, %r13
	je	.L210
	cmpq	$6, %r13
	je	.L211
	movq	(%rax), %rsi
	xorl	%edi, %edi
	addq	$8, %rax
.L211:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L210:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L209:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L208:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L207:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
.L206:
	addq	(%rax), %rsi
	adcq	$0, %rdi
	addq	$8, %rax
	cmpq	%r9, %rax
	je	.L231
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
	cmpq	%r9, %rax
	jne	.L142
.L231:
	movq	%rsi, (%r10)
	addl	%r11d, %ecx
	addq	$8, %r10
	subl	$1, %r8d
	jne	.L143
	leal	-2(%rbx,%rbx), %r8d
	movslq	%r8d, %rbx
	salq	$3, %rbx
.L139:
	movabsq	$-4294967296, %r13
	movslq	%r12d, %r12
	movq	(%rdx,%r12,8), %rcx
	movq	%rcx, (%rdx,%rbx)
	movq	8(%rdx), %rbx
	movq	(%rdx), %r14
	movq	%rbx, %r10
	shrq	$32, %r10
	movl	%r14d, %r9d
	leal	(%r10,%r14), %r11d
	movq	%r11, %rax
	subq	%r9, %rax
	shrq	$63, %rax
	salq	$32, %rax
	addq	%r14, %rax
	andq	%r13, %rax
	orq	%r11, %rax
	movq	%rax, (%rdx)
	movq	%rax, %r12
	cmpl	$1, %r8d
	je	.L148
	movq	24(%rdx), %r11
	movq	16(%rdx), %rdi
	leal	-2(%r8), %r14d
	shrl	%r14d
	movq	%r11, %r10
	movq	%rdi, %rcx
	movl	%edi, %r13d
	andl	$1, %r14d
	shrq	$32, %r10
	shrq	$32, %rcx
	addl	%edi, %r10d
	addl	%ebx, %ecx
	movl	%ebx, %ebx
	movl	%r10d, %r9d
	movl	%ecx, %eax
	movq	%r9, %r10
	movq	%rax, %rsi
	subq	%r13, %r10
	subq	%rbx, %rsi
	movl	$3, %r13d
	shrq	$63, %r10
	shrq	$63, %rsi
	addq	%r10, %rax
	addq	%rsi, %r12
	salq	$32, %rax
	movq	%r12, (%rdx)
	orq	%r9, %rax
	movq	%rax, 8(%rdx)
	cmpl	$3, %r8d
	jle	.L230
	testl	%r14d, %r14d
	je	.L145
	movq	32(%rdx), %r12
	movl	%r11d, %edi
	movl	$5, %r13d
	movq	%r12, %r14
	movl	%r12d, %esi
	shrq	$32, %r14
	addl	%r11d, %r14d
	movl	%r14d, %ebx
	movq	%rbx, %rcx
	subq	%rdi, %rcx
	shrq	$63, %rcx
	addq	%rcx, %rax
	movq	%rax, 8(%rdx)
	movl	%r12d, %eax
	addl	44(%rdx), %eax
	movq	%rax, %r10
	subq	%rsi, %r10
	shrq	$63, %r10
	addq	%r10, %rbx
	salq	$32, %rbx
	orq	%rbx, %rax
	movq	%rax, 16(%rdx)
	cmpl	$5, %r8d
	jle	.L230
	.p2align 4
	.p2align 3
.L145:
	movq	(%rdx,%r13,8), %r11
	leaq	2(%r13), %rsi
	movl	%r11d, %r12d
	addl	12(%rdx,%r13,8), %r12d
	movl	%r11d, %r9d
	movq	%r12, %r14
	subq	%r9, %r14
	shrq	$63, %r14
	addq	%r14, %rax
	movq	%rax, -4(%rdx,%r13,4)
	movq	8(%rdx,%r13,8), %rbx
	movl	%ebx, %edi
	addl	20(%rdx,%r13,8), %edi
	movl	%ebx, %ecx
	movq	%rdi, %rax
	subq	%rcx, %rax
	shrq	$63, %rax
	addq	%rax, %r12
	salq	$32, %r12
	orq	%rdi, %r12
	movq	%r12, 4(%rdx,%r13,4)
	movq	(%rdx,%rsi,8), %r10
	addq	$4, %r13
	movl	%r10d, %eax
	addl	12(%rdx,%rsi,8), %eax
	movl	%r10d, %r11d
	movq	%rax, %r9
	subq	%r11, %r9
	shrq	$63, %r9
	addq	%r9, %r12
	movq	%r12, -4(%rdx,%rsi,4)
	movq	8(%rdx,%rsi,8), %r12
	movl	%r12d, %r14d
	addl	20(%rdx,%rsi,8), %r14d
	movl	%r12d, %ebx
	movq	%r14, %r10
	subq	%rbx, %r10
	shrq	$63, %r10
	addq	%r10, %rax
	salq	$32, %rax
	orq	%r14, %rax
	movq	%rax, 4(%rdx,%rsi,4)
	cmpl	%r13d, %r8d
	jg	.L145
.L230:
	movl	%r8d, %r13d
	subl	$2, %r8d
	salq	$32, %r10
	andl	$-2, %r8d
	shrl	%r13d
	subq	%r10, %rax
	leal	3(%r8), %r8d
	subl	$1, %r13d
	movq	%rax, %r12
	movq	-8(%rdx,%r8,8), %r8
	leaq	8(%rdx,%r13,8), %rsi
.L144:
	movabsq	$-4294967296, %rdi
	movl	%r8d, %edx
	andq	%r12, %rdi
	orq	%rdx, %rdi
	movq	%rdi, (%rsi)
	vzeroupper
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L148:
	.cfi_restore_state
	movq	%rax, %r8
	movq	%rdx, %rsi
	jmp	.L144
.L146:
	movl	$8, %ebx
	movl	$1, %r8d
	jmp	.L139
.L147:
	movl	$16, %ebx
	movl	$2, %r8d
	jmp	.L139
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
	jle	.L274
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
	je	.L236
	cmpq	$1, %rax
	je	.L259
	cmpq	$2, %rax
	je	.L260
	cmpq	$3, %rax
	je	.L261
	cmpq	$4, %rax
	je	.L262
	cmpq	$5, %rax
	je	.L263
	cmpq	$6, %rax
	jne	.L277
.L264:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L263:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L262:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L261:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L260:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L259:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
	cmpq	%rbp, %rbx
	je	.L235
.L236:
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
	jne	.L236
.L235:
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
.L277:
	.cfi_restore_state
	movq	(%rdi), %rsi
	xorl	%eax, %eax
	movl	$.LC16, %edi
	addq	$8, %rbx
	call	printf
	jmp	.L264
	.p2align 4,,10
	.p2align 3
.L274:
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
	jle	.L319
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
	je	.L280
	cmpq	$1, %rax
	je	.L303
	cmpq	$2, %rax
	je	.L304
	cmpq	$3, %rax
	je	.L305
	cmpq	$4, %rax
	je	.L306
	cmpq	$5, %rax
	je	.L307
	cmpq	$6, %rax
	jne	.L322
.L308:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L307:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L306:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L305:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L304:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L303:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
	cmpq	%rbp, %rbx
	je	.L317
.L280:
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
	jne	.L280
.L317:
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
.L322:
	.cfi_restore_state
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
	jmp	.L308
	.p2align 4,,10
	.p2align 3
.L319:
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
	jle	.L329
	movslq	%esi, %rsi
	movq	%rdi, %rbx
	xorl	%r12d, %r12d
	leaq	-8(,%rsi,8), %rax
	leaq	(%rdi,%rsi,8), %r13
	shrq	$3, %rax
	addq	$1, %rax
	andl	$3, %eax
	je	.L325
	cmpq	$1, %rax
	je	.L342
	cmpq	$2, %rax
	je	.L343
	movq	(%rdi), %rcx
	movq	(%rdx), %rdi
	movl	$17, %esi
	movl	$.LC17, %edx
	xorl	%eax, %eax
	movl	$16, %r12d
	addq	$8, %rbx
	call	snprintf
.L343:
	movq	(%rbx), %rcx
	movslq	%r12d, %rdi
	movl	$.LC17, %edx
	addq	0(%rbp), %rdi
	movl	$17, %esi
	xorl	%eax, %eax
	addl	$16, %r12d
	addq	$8, %rbx
	call	snprintf
.L342:
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
	je	.L348
.L325:
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
	jne	.L325
.L348:
	movslq	%r12d, %r12
.L324:
	movq	0(%rbp), %rcx
	movb	$0, (%rcx,%r12)
	movq	0(%rbp), %r9
	cmpb	$48, (%r9)
	leaq	1(%r9), %r10
	jne	.L349
	.p2align 4
	.p2align 4
	.p2align 3
.L327:
	movq	%r10, 0(%rbp)
	addq	$1, %r10
	cmpb	$48, -1(%r10)
	je	.L327
.L349:
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
.L329:
	.cfi_restore_state
	xorl	%r12d, %r12d
	jmp	.L324
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
.LC21:
	.string	"tmp: %llu\n"
	.section	.rodata.str1.8
	.align 8
.LC23:
	.string	"Time taken for AVX multiplication: %f\n"
	.align 8
.LC25:
	.string	"Time taken for GMP multiplication: %f\n"
	.section	.rodata.str1.1
.LC26:
	.string	"Test failed"
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"i: %d, expected: %c, result: %c\n"
	.section	.rodata.str1.1
.LC28:
	.string	"result: %s\n"
.LC29:
	.string	"expected: %s\n"
.LC30:
	.string	"passed"
.LC31:
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
	subq	$312, %rsp
	.cfi_def_cfa_offset 368
	call	malloc
	movl	$32, %edi
	leaq	64(%rsp), %r15
	leaq	80(%rsp), %r12
	movq	%rax, %r13
	call	malloc
	movl	$65, %edi
	movq	%rax, %r14
	call	malloc
	movq	%r15, %rdi
	movq	%rax, 8(%rsp)
	call	__gmpz_init
	movq	%r12, %rdi
	call	__gmpz_init
	leaq	96(%rsp), %rdi
	call	__gmpz_init
	leaq	56(%rsp), %rdi
	movl	$512, %edx
	movl	$64, %esi
	call	posix_memalign
	movq	8(%rsp), %r10
	testl	%eax, %eax
	jne	.L352
	movq	56(%rsp), %rbp
.L352:
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$64, %ecx
	movq	%r10, 16(%rsp)
	rep stosq
	xorl	%edi, %edi
	call	time
	movl	%eax, %edi
	call	srand
	leaq	32(%r13), %rdx
	movq	%rbp, 8(%rsp)
	movq	%r13, %rbp
	movq	%rdx, %rbx
	.p2align 4
	.p2align 3
.L353:
	call	rand
	addq	$4, %rbp
	movl	%eax, -4(%rbp)
	cmpq	%rbx, %rbp
	jne	.L353
	movq	%r14, %rbp
	leaq	32(%r14), %rbx
	.p2align 4
	.p2align 3
.L354:
	call	rand
	addq	$4, %rbp
	movl	%eax, -4(%rbp)
	cmpq	%rbx, %rbp
	jne	.L354
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rbp
	xorl	%ebx, %ebx
	movq	%rsi, 8(%rsp)
.L355:
	movl	$32, %edx
	movq	%r15, %rsi
	movq	%r15, %rdi
	call	__gmpz_mul_2exp
	movl	0(%r13,%rbx), %edx
	movq	%r15, %rsi
	movq	%r15, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_mul_2exp
	movl	(%r14,%rbx), %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r15, %rsi
	movq	%r15, %rdi
	call	__gmpz_mul_2exp
	movl	4(%r13,%rbx), %edx
	movq	%r15, %rsi
	movq	%r15, %rdi
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
	movq	%r15, %rsi
	movq	%r15, %rdi
	call	__gmpz_mul_2exp
	movl	8(%r13,%rbx), %edx
	movq	%r15, %rsi
	movq	%r15, %rdi
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
	movq	%r15, %rsi
	movq	%r15, %rdi
	call	__gmpz_mul_2exp
	movl	12(%r13,%rbx), %edx
	movq	%r15, %rsi
	movq	%r15, %rdi
	call	__gmpz_add_ui
	movl	$32, %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	__gmpz_mul_2exp
	movl	12(%r14,%rbx), %edx
	movq	%r12, %rsi
	movq	%r12, %rdi
	addq	$16, %rbx
	call	__gmpz_add_ui
	cmpq	$32, %rbx
	jne	.L355
	movq	8(%rsp), %r8
	movl	$1, %esi
	movl	$.LC18, %edi
	xorl	%eax, %eax
	movq	%r8, 24(%rsp)
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
	call	start_perf
	movl	$64, %ecx
	movq	%rbp, %rdx
	movq	%r14, %rsi
	movl	$8, %r8d
	movq	%r13, %rdi
	call	multiply
	xorl	%eax, %eax
	call	stop_perf
	movl	$.LC19, %esi
	movl	$.LC20, %edi
	call	fopen
	leaq	112(%rsp), %rsi
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
	movq	%r12, %rdx
	movq	%r15, %rsi
	leaq	96(%rsp), %rdi
	call	__gmpz_mul
	leaq	96(%rsp), %rdx
	movl	$16, %esi
	xorl	%edi, %edi
	call	__gmpz_get_str
	movq	%rax, 16(%rsp)
#APP
# 336 "test4.c" 1
	mfence
# 0 "" 2
# 338 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	movl	$8, %r8d
	movq	%rbp, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	movl	$64, %ecx
	call	multiply
	movq	16(%rsp), %r11
	movq	24(%rsp), %r10
	movq	$1, 8(%rsp)
	movq	%r11, 32(%rsp)
	movq	%r10, 40(%rsp)
	.p2align 4
	.p2align 3
.L358:
	salq	8(%rsp)
	movq	8(%rsp), %r8
#APP
# 225 "../myutils.h" 1
	CPUID
	RDTSC
	mov %edx, %edi
	mov %eax, %esi
	
# 0 "" 2
#NO_APP
	salq	$32, %rdi
	movl	%esi, %ecx
	orq	%rcx, %rdi
	movq	%rdi, 24(%rsp)
	testq	%r8, %r8
	je	.L356
	movl	%r8d, %edx
	movl	%r8d, 16(%rsp)
	xorl	%ebx, %ebx
	andl	$7, %edx
	je	.L357
	cmpl	$1, %edx
	je	.L460
	cmpl	$2, %edx
	je	.L461
	cmpl	$3, %edx
	je	.L462
	cmpl	$4, %edx
	je	.L463
	cmpl	$5, %edx
	je	.L464
	cmpl	$6, %edx
	je	.L465
	movl	$8, %r8d
	movq	%rbp, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	movl	$64, %ecx
	movl	$1, %ebx
	call	multiply
.L465:
	movl	$8, %r8d
	movq	%rbp, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	movl	$64, %ecx
	addl	$1, %ebx
	call	multiply
.L464:
	movl	$8, %r8d
	movq	%rbp, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	movl	$64, %ecx
	addl	$1, %ebx
	call	multiply
.L463:
	movl	$8, %r8d
	movq	%rbp, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	movl	$64, %ecx
	addl	$1, %ebx
	call	multiply
.L462:
	movl	$8, %r8d
	movq	%rbp, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	movl	$64, %ecx
	addl	$1, %ebx
	call	multiply
.L461:
	movl	$8, %r8d
	movq	%rbp, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	movl	$64, %ecx
	addl	$1, %ebx
	call	multiply
.L460:
	movl	$8, %r8d
	movq	%rbp, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	movl	$64, %ecx
	addl	$1, %ebx
	call	multiply
	movl	16(%rsp), %eax
	cmpl	%eax, %ebx
	je	.L356
.L357:
	movl	$8, %r8d
	movq	%rbp, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	movl	$64, %ecx
	addl	$8, %ebx
	call	multiply
	movl	$64, %ecx
	movq	%rbp, %rdx
	movq	%r14, %rsi
	movl	$8, %r8d
	movq	%r13, %rdi
	call	multiply
	movl	$64, %ecx
	movq	%rbp, %rdx
	movq	%r14, %rsi
	movl	$8, %r8d
	movq	%r13, %rdi
	call	multiply
	movl	$64, %ecx
	movq	%rbp, %rdx
	movq	%r14, %rsi
	movl	$8, %r8d
	movq	%r13, %rdi
	call	multiply
	movl	$64, %ecx
	movq	%rbp, %rdx
	movq	%r14, %rsi
	movl	$8, %r8d
	movq	%r13, %rdi
	call	multiply
	movl	$64, %ecx
	movq	%rbp, %rdx
	movq	%r14, %rsi
	movl	$8, %r8d
	movq	%r13, %rdi
	call	multiply
	movl	$64, %ecx
	movq	%rbp, %rdx
	movq	%r14, %rsi
	movl	$8, %r8d
	movq	%r13, %rdi
	call	multiply
	movl	$64, %ecx
	movq	%rbp, %rdx
	movq	%r14, %rsi
	movl	$8, %r8d
	movq	%r13, %rdi
	call	multiply
	movl	16(%rsp), %r9d
	cmpl	%r9d, %ebx
	jne	.L357
.L356:
#APP
# 238 "../myutils.h" 1
	RDTSCP
	mov %edx, %r11d
	mov %eax, %r10d
	CPUID
	
# 0 "" 2
#NO_APP
	movq	%r11, %rbx
	movq	24(%rsp), %rdi
	movl	%r10d, %r8d
	xorl	%eax, %eax
	salq	$32, %rbx
	orq	%r8, %rbx
	subq	%rdi, %rbx
	movl	$.LC21, %edi
	movq	%rbx, %rsi
	call	printf
	cmpq	$699999999, %rbx
	jbe	.L358
	vxorpd	%xmm2, %xmm2, %xmm2
	movq	32(%rsp), %r13
	movq	40(%rsp), %r14
	movl	$.LC23, %edi
	vcvtusi2sdq	%rbx, %xmm2, %xmm0
	vmulsd	.LC22(%rip), %xmm0, %xmm1
	movl	$1, %eax
	vcvtsi2sdq	8(%rsp), %xmm2, %xmm4
	movq	%r13, 24(%rsp)
	movq	%r14, 16(%rsp)
	vcvttsd2usi	%xmm1, %rsi
	vcvtusi2sdq	%rsi, %xmm2, %xmm3
	vdivsd	%xmm4, %xmm3, %xmm0
	call	printf
#APP
# 347 "test4.c" 1
	mfence
# 0 "" 2
# 349 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	movq	24(%rsp), %rcx
	movq	16(%rsp), %r14
	leaq	64(%rbp), %rbx
	xorl	%r13d, %r13d
	movq	%rcx, 8(%rsp)
	.p2align 4
	.p2align 3
.L359:
	movq	0(%rbp), %rcx
	movslq	%r13d, %rdi
	movl	$.LC17, %edx
	xorl	%eax, %eax
	addq	%r14, %rdi
	movl	$17, %esi
	addq	$8, %rbp
	addl	$16, %r13d
	call	snprintf
	cmpq	%rbp, %rbx
	jne	.L359
	movslq	%r13d, %rdx
	movq	8(%rsp), %rbp
	movb	$0, (%r14,%rdx)
	cmpb	$48, (%r14)
	jne	.L360
	.p2align 4
	.p2align 4
	.p2align 3
.L361:
	addq	$1, %r14
	cmpb	$48, (%r14)
	je	.L361
.L360:
	movq	%r14, 24(%rsp)
	movq	%rbp, 8(%rsp)
#APP
# 354 "test4.c" 1
	mfence
# 0 "" 2
# 356 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	movq	%r12, %rdx
	movq	%r15, %rsi
	leaq	96(%rsp), %rdi
	movl	$1, %ebp
	call	__gmpz_mul
	movq	8(%rsp), %rax
	movq	24(%rsp), %r14
	leaq	160(%rsp), %rbx
	movq	%rax, 16(%rsp)
	.p2align 4
	.p2align 3
.L364:
	movq	%rbx, %rsi
	xorl	%edi, %edi
	addq	%rbp, %rbp
	call	getrusage
	fildq	160(%rsp)
	fmuls	.LC24(%rip)
	fildq	168(%rsp)
	faddp	%st, %st(1)
	fisttpq	8(%rsp)
	testq	%rbp, %rbp
	jle	.L362
	movq	%rbp, %r9
	xorl	%r13d, %r13d
	andl	$6, %r9d
	je	.L363
	cmpq	$1, %r9
	je	.L466
	cmpq	$2, %r9
	je	.L467
	cmpq	$3, %r9
	je	.L468
	cmpq	$4, %r9
	je	.L469
	cmpq	$5, %r9
	je	.L470
	cmpq	$6, %r9
	je	.L471
	movq	%r12, %rdx
	movq	%r15, %rsi
	leaq	96(%rsp), %rdi
	movl	$1, %r13d
	call	__gmpz_mul
.L471:
	movq	%r12, %rdx
	movq	%r15, %rsi
	leaq	96(%rsp), %rdi
	addq	$1, %r13
	call	__gmpz_mul
.L470:
	movq	%r12, %rdx
	movq	%r15, %rsi
	leaq	96(%rsp), %rdi
	addq	$1, %r13
	call	__gmpz_mul
.L469:
	movq	%r12, %rdx
	movq	%r15, %rsi
	leaq	96(%rsp), %rdi
	addq	$1, %r13
	call	__gmpz_mul
.L468:
	movq	%r12, %rdx
	movq	%r15, %rsi
	leaq	96(%rsp), %rdi
	addq	$1, %r13
	call	__gmpz_mul
.L467:
	movq	%r12, %rdx
	movq	%r15, %rsi
	leaq	96(%rsp), %rdi
	addq	$1, %r13
	call	__gmpz_mul
.L466:
	movq	%r12, %rdx
	movq	%r15, %rsi
	leaq	96(%rsp), %rdi
	addq	$1, %r13
	call	__gmpz_mul
	cmpq	%r13, %rbp
	je	.L362
.L363:
	movq	%r12, %rdx
	movq	%r15, %rsi
	leaq	96(%rsp), %rdi
	addq	$8, %r13
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%r15, %rsi
	leaq	96(%rsp), %rdi
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%r15, %rsi
	leaq	96(%rsp), %rdi
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%r15, %rsi
	leaq	96(%rsp), %rdi
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%r15, %rsi
	leaq	96(%rsp), %rdi
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%r15, %rsi
	leaq	96(%rsp), %rdi
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%r15, %rsi
	leaq	96(%rsp), %rdi
	call	__gmpz_mul
	movq	%r12, %rdx
	movq	%r15, %rsi
	leaq	96(%rsp), %rdi
	call	__gmpz_mul
	cmpq	%r13, %rbp
	jne	.L363
.L362:
	movq	%rbx, %rsi
	xorl	%edi, %edi
	call	getrusage
	fildq	160(%rsp)
	fmuls	.LC24(%rip)
	fildq	168(%rsp)
	faddp	%st, %st(1)
	fildq	8(%rsp)
	fsubrp	%st, %st(1)
	fisttpq	8(%rsp)
	movq	8(%rsp), %r11
	cmpq	$249999, %r11
	jle	.L364
	vxorpd	%xmm5, %xmm5, %xmm5
	movq	16(%rsp), %r15
	movl	$.LC25, %edi
	movl	$1, %eax
	vcvtsi2sdq	%r11, %xmm5, %xmm6
	movq	%r14, 16(%rsp)
	vcvtsi2sdq	%rbp, %xmm5, %xmm7
	movq	%r15, 8(%rsp)
	vdivsd	%xmm7, %xmm6, %xmm0
	call	printf
#APP
# 362 "test4.c" 1
	mfence
# 0 "" 2
# 364 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	movq	8(%rsp), %rdi
	xorl	%ebx, %ebx
	call	strlen
	movq	8(%rsp), %rdi
	movq	16(%rsp), %r10
	movq	%rax, %r8
	movq	%rax, %r12
	andl	$7, %r8d
	je	.L365
	movzbl	(%r10), %esi
	cmpb	%sil, (%rdi)
	jne	.L502
	movl	$1, %ebx
	cmpq	$1, %r8
	je	.L365
	cmpq	$2, %r8
	je	.L472
	cmpq	$3, %r8
	je	.L473
	cmpq	$4, %r8
	je	.L474
	cmpq	$5, %r8
	je	.L475
	cmpq	$6, %r8
	jne	.L514
.L476:
	movzbl	(%r10,%rbx), %eax
	leaq	1(%rbx), %rbp
	cmpb	%al, (%rdi,%rbx)
	jne	.L502
	movq	%rbp, %rbx
.L475:
	movzbl	(%r10,%rbx), %r13d
	leaq	1(%rbx), %r9
	cmpb	%r13b, (%rdi,%rbx)
	jne	.L502
	movq	%r9, %rbx
.L474:
	movzbl	(%r10,%rbx), %r15d
	leaq	1(%rbx), %r11
	cmpb	%r15b, (%rdi,%rbx)
	jne	.L502
	movq	%r11, %rbx
.L473:
	movzbl	(%r10,%rbx), %r8d
	leaq	1(%rbx), %r14
	cmpb	%r8b, (%rdi,%rbx)
	jne	.L502
	movq	%r14, %rbx
.L472:
	movzbl	(%r10,%rbx), %edx
	leaq	1(%rbx), %rsi
	cmpb	%dl, (%rdi,%rbx)
	jne	.L502
	movq	%rsi, %rbx
	cmpq	%rbx, %r12
	je	.L515
.L366:
	movzbl	(%r10,%rbx), %ecx
	leaq	1(%rbx), %rbp
	cmpb	%cl, (%rdi,%rbx)
	jne	.L502
	movzbl	(%r10,%rbp), %r9d
	movq	%rbp, %rbx
	leaq	1(%rbp), %rax
	cmpb	%r9b, (%rdi,%rbp)
	jne	.L502
	movzbl	(%r10,%rax), %r13d
	movq	%rax, %rbx
	cmpb	%r13b, (%rdi,%rax)
	jne	.L502
	movzbl	2(%r10,%rbp), %r15d
	leaq	2(%rbp), %rbx
	leaq	3(%rbp), %r11
	cmpb	%r15b, 2(%rdi,%rbp)
	jne	.L502
	movzbl	3(%r10,%rbp), %r8d
	movq	%r11, %rbx
	leaq	4(%rbp), %r14
	cmpb	%r8b, 3(%rdi,%rbp)
	jne	.L502
	movzbl	4(%r10,%rbp), %esi
	movq	%r14, %rbx
	leaq	5(%rbp), %rdx
	cmpb	%sil, 4(%rdi,%rbp)
	jne	.L502
	movzbl	5(%r10,%rbp), %eax
	movq	%rdx, %rbx
	leaq	6(%rbp), %rcx
	cmpb	%al, 5(%rdi,%rbp)
	jne	.L502
	movzbl	6(%r10,%rbp), %r13d
	movq	%rcx, %rbx
	leaq	7(%rbp), %r9
	cmpb	%r13b, 6(%rdi,%rbp)
	jne	.L502
	movq	%r9, %rbx
.L365:
	cmpq	%rbx, %r12
	jne	.L366
.L515:
	movl	$.LC30, %esi
	movl	$.LC31, %edi
	xorl	%eax, %eax
	call	printf
	addq	$312, %rsp
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
.L514:
	.cfi_restore_state
	movl	$2, %edx
	movzbl	-1(%r10,%rdx), %ecx
	cmpb	%cl, (%rdi,%rbx)
	jne	.L502
	movq	%rdx, %rbx
	jmp	.L476
.L502:
	movq	%rdi, 8(%rsp)
	movl	$.LC26, %edi
	movq	%r10, 16(%rsp)
	call	puts
	movq	8(%rsp), %rdi
	movl	%ebx, %esi
	xorl	%eax, %eax
	movq	16(%rsp), %r12
	movsbl	(%rdi,%rbx), %edx
	movl	$.LC27, %edi
	movsbl	(%r12,%rbx), %ecx
	call	printf
	movq	16(%rsp), %rsi
	movl	$.LC28, %edi
	xorl	%eax, %eax
	call	printf
	movq	8(%rsp), %rsi
	movl	$.LC29, %edi
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
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC22:
	.long	1394455622
	.long	1060595063
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC24:
	.long	1232348160
	.ident	"GCC: (GNU) 14.2.1 20250110 (Red Hat 14.2.1-7)"
	.section	.note.GNU-stack,"",@progbits
