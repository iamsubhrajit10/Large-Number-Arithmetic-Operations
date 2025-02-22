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
	.section	.rodata.str1.1
.LC16:
	.string	"%016lx "
	.text
	.p2align 4
	.globl	print_array
	.type	print_array, @function
print_array:
.LFB6645:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L178
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
	je	.L140
	cmpq	$1, %rax
	je	.L163
	cmpq	$2, %rax
	je	.L164
	cmpq	$3, %rax
	je	.L165
	cmpq	$4, %rax
	je	.L166
	cmpq	$5, %rax
	je	.L167
	cmpq	$6, %rax
	jne	.L181
.L168:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L167:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L166:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L165:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L164:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
.L163:
	movq	(%rbx), %rsi
	movl	$.LC16, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
	cmpq	%rbp, %rbx
	je	.L139
.L140:
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
	jne	.L140
.L139:
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
.L181:
	.cfi_restore_state
	movq	(%rdi), %rsi
	xorl	%eax, %eax
	movl	$.LC16, %edi
	addq	$8, %rbx
	call	printf
	jmp	.L168
	.p2align 4,,10
	.p2align 3
.L178:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	movl	$10, %edi
	jmp	putchar
	.cfi_endproc
.LFE6645:
	.size	print_array, .-print_array
	.p2align 4
	.globl	generate_random_numbers
	.type	generate_random_numbers, @function
generate_random_numbers:
.LFB6646:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L223
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
	je	.L184
	cmpq	$1, %rax
	je	.L207
	cmpq	$2, %rax
	je	.L208
	cmpq	$3, %rax
	je	.L209
	cmpq	$4, %rax
	je	.L210
	cmpq	$5, %rax
	je	.L211
	cmpq	$6, %rax
	jne	.L226
.L212:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L211:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L210:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L209:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L208:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
.L207:
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
	cmpq	%rbp, %rbx
	je	.L221
.L184:
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
	jne	.L184
.L221:
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
.L226:
	.cfi_restore_state
	call	rand
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
	jmp	.L212
	.p2align 4,,10
	.p2align 3
.L223:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE6646:
	.size	generate_random_numbers, .-generate_random_numbers
	.section	.rodata.str1.1
.LC17:
	.string	"%016lx"
	.text
	.p2align 4
	.globl	limb_get_str
	.type	limb_get_str, @function
limb_get_str:
.LFB6647:
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
	jle	.L233
	movslq	%esi, %rsi
	movq	%rdi, %rbx
	xorl	%r12d, %r12d
	leaq	-8(,%rsi,8), %rax
	leaq	(%rdi,%rsi,8), %r13
	shrq	$3, %rax
	addq	$1, %rax
	andl	$3, %eax
	je	.L229
	cmpq	$1, %rax
	je	.L246
	cmpq	$2, %rax
	je	.L247
	movq	(%rdi), %rcx
	movq	(%rdx), %rdi
	movl	$17, %esi
	movl	$.LC17, %edx
	xorl	%eax, %eax
	movl	$16, %r12d
	addq	$8, %rbx
	call	snprintf
.L247:
	movq	(%rbx), %rcx
	movslq	%r12d, %rdi
	movl	$.LC17, %edx
	addq	0(%rbp), %rdi
	movl	$17, %esi
	xorl	%eax, %eax
	addl	$16, %r12d
	addq	$8, %rbx
	call	snprintf
.L246:
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
	je	.L252
.L229:
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
	jne	.L229
.L252:
	movslq	%r12d, %r12
.L228:
	movq	0(%rbp), %rcx
	movb	$0, (%rcx,%r12)
	movq	0(%rbp), %r9
	cmpb	$48, (%r9)
	leaq	1(%r9), %r10
	jne	.L253
	.p2align 4
	.p2align 4
	.p2align 3
.L231:
	movq	%r10, 0(%rbp)
	addq	$1, %r10
	cmpb	$48, -1(%r10)
	je	.L231
.L253:
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
.L233:
	.cfi_restore_state
	xorl	%r12d, %r12d
	jmp	.L228
	.cfi_endproc
.LFE6647:
	.size	limb_get_str, .-limb_get_str
	.section	.rodata.str1.1
.LC18:
	.string	"*** Test Case %d ***\n"
.LC19:
	.string	"a"
.LC20:
	.string	"perf_output_test4.txt"
.LC21:
	.string	"iterations: %ld\n"
.LC22:
	.string	"time: %ld\n"
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"Time taken for AVX multiplication: %f\n"
	.align 8
.LC25:
	.string	"multiply() was called %ld times\n"
	.section	.rodata.str1.1
.LC27:
	.string	"times ran: %ld\n"
.LC28:
	.string	"total time: %ld\n"
	.section	.rodata.str1.8
	.align 8
.LC29:
	.string	"Time taken for GMP multiplication: %f\n"
	.section	.rodata.str1.1
.LC30:
	.string	"Test failed"
	.section	.rodata.str1.8
	.align 8
.LC31:
	.string	"i: %d, expected: %c, result: %c\n"
	.section	.rodata.str1.1
.LC32:
	.string	"result: %s\n"
.LC33:
	.string	"expected: %s\n"
.LC34:
	.string	"passed"
.LC35:
	.string	"Test %s\n"
	.text
	.p2align 4
	.globl	test
	.type	test, @function
test:
.LFB6648:
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
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	xorl	%r13d, %r13d
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$1024, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	call	malloc
	movl	$32, %edi
	movq	%rax, %r12
	call	malloc
	movl	$65, %edi
	movq	%rax, -272(%rbp)
	call	malloc
	leaq	-240(%rbp), %rdi
	movq	%rax, %r14
	call	__gmpz_init
	leaq	-224(%rbp), %rdi
	call	__gmpz_init
	leaq	-208(%rbp), %rdi
	call	__gmpz_init
	movl	$512, %edx
	movl	$64, %esi
	leaq	-248(%rbp), %rdi
	call	posix_memalign
	testl	%eax, %eax
	jne	.L256
	movq	-248(%rbp), %r13
.L256:
	xorl	%eax, %eax
	movl	$64, %ecx
	movq	%r13, %rdi
	movq	%r12, %r15
	rep stosq
	xorl	%edi, %edi
	leaq	32(%r12), %rbx
	call	time
	movl	%eax, %edi
	call	srand
.L257:
	call	rand
	addq	$4, %r15
	movl	%eax, -4(%r15)
	cmpq	%r15, %rbx
	jne	.L257
	movq	-272(%rbp), %rdx
	movq	%rdx, %r15
	leaq	32(%rdx), %rbx
.L258:
	call	rand
	addq	$4, %r15
	movl	%eax, -4(%r15)
	cmpq	%r15, %rbx
	jne	.L258
	movq	-272(%rbp), %r15
	xorl	%ebx, %ebx
.L259:
	leaq	-240(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	(%r12,%rbx), %edx
	leaq	-240(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	leaq	-224(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	(%r15,%rbx), %edx
	leaq	-224(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	leaq	-240(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	4(%r12,%rbx), %edx
	leaq	-240(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	leaq	-224(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	4(%r15,%rbx), %edx
	leaq	-224(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	leaq	-240(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	8(%r12,%rbx), %edx
	leaq	-240(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	leaq	-224(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	8(%r15,%rbx), %edx
	leaq	-224(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	leaq	-240(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	12(%r12,%rbx), %edx
	leaq	-240(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	leaq	-224(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	12(%r15,%rbx), %edx
	addq	$16, %rbx
	leaq	-224(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	cmpq	$32, %rbx
	jne	.L259
	movl	$1, %esi
	movl	$.LC18, %edi
	xorl	%eax, %eax
	call	printf
#APP
# 299 "test4.c" 1
	mfence
# 0 "" 2
# 301 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	movl	$.LC19, %esi
	movl	$.LC20, %edi
	call	fopen
#APP
# 312 "test4.c" 1
	mfence
# 0 "" 2
# 314 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	leaq	-224(%rbp), %rdx
	leaq	-240(%rbp), %rsi
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
	leaq	-208(%rbp), %rdx
	movl	$16, %esi
	xorl	%edi, %edi
	call	__gmpz_get_str
	movq	%rax, %r15
#APP
# 331 "test4.c" 1
	mfence
# 0 "" 2
# 333 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	vmovd	(%r12), %xmm4
	movq	-272(%rbp), %rsi
	xorl	%edi, %edi
	vmovd	4(%r12), %xmm2
	vmovd	8(%r12), %xmm1
	vpunpcklqdq	%xmm4, %xmm4, %xmm0
	vmovd	12(%rsi), %xmm7
	vpunpcklqdq	%xmm2, %xmm4, %xmm13
	vpunpcklqdq	%xmm1, %xmm2, %xmm9
	vpunpcklqdq	%xmm4, %xmm2, %xmm5
	vinserti32x4	$0x1, %xmm13, %ymm9, %ymm3
	vinserti32x4	$0x1, %xmm5, %ymm0, %ymm6
	vmovd	8(%rsi), %xmm5
	vmovd	16(%r12), %xmm0
	vinserti32x8	$0x1, %ymm3, %zmm6, %zmm18
	vmovd	(%rsi), %xmm3
	vmovd	4(%rsi), %xmm6
	vpunpcklqdq	%xmm5, %xmm7, %xmm8
	vmovq	%xmm0, %r8
	vpunpcklqdq	%xmm3, %xmm6, %xmm15
	vpunpcklqdq	%xmm5, %xmm3, %xmm11
	vpunpcklqdq	%xmm6, %xmm3, %xmm12
	vmovdqa	%xmm8, -272(%rbp)
	vinserti32x4	$0x1, %xmm8, %ymm15, %ymm10
	vinserti32x4	$0x1, %xmm11, %ymm12, %ymm14
	vpunpcklqdq	%xmm4, %xmm0, %xmm8
	vinserti32x8	$0x1, %ymm10, %zmm14, %zmm2
	vmovd	12(%r12), %xmm10
	vmovd	20(%rsi), %xmm14
	vpmuldq	%zmm2, %zmm18, %zmm21
	vmovq	%xmm10, %r9
	vpunpcklqdq	%xmm10, %xmm1, %xmm2
	vmovd	16(%rsi), %xmm10
	vpunpcklqdq	%xmm14, %xmm3, %xmm0
	vinserti32x4	$0x1, %xmm8, %ymm2, %ymm11
	vinserti32x4	$0x1, %xmm13, %ymm2, %ymm12
	vinserti32x4	$0x1, %xmm2, %ymm13, %ymm2
	vmovd	24(%r12), %xmm13
	vpunpcklqdq	%xmm7, %xmm10, %xmm7
	vinserti32x8	$0x1, %ymm11, %zmm12, %zmm16
	vpunpcklqdq	%xmm6, %xmm5, %xmm12
	vinserti32x4	$0x1, %xmm7, %ymm15, %ymm8
	vinserti32x4	$0x1, %xmm0, %ymm12, %ymm11
	vinserti32x4	$0x1, %xmm12, %ymm7, %ymm12
	vinserti32x8	$0x1, %ymm11, %zmm8, %zmm0
	vmovd	20(%r12), %xmm8
	vmovq	%r8, %xmm11
	vpmuldq	%zmm0, %zmm16, %zmm22
	vmovq	%r9, %xmm0
	vpunpcklqdq	%xmm11, %xmm0, %xmm11
	vpunpcklqdq	%xmm4, %xmm8, %xmm4
	vinserti32x4	$0x1, %xmm9, %ymm4, %ymm4
	vinserti32x4	$0x1, %xmm11, %ymm9, %ymm9
	vinserti32x8	$0x1, %ymm4, %zmm9, %zmm19
	vpunpcklqdq	%xmm10, %xmm14, %xmm4
	vmovd	24(%rsi), %xmm10
	vpunpcklqdq	%xmm10, %xmm3, %xmm3
	vmovdqa64	%zmm22, 64(%r13)
	vinserti32x4	$0x1, %xmm4, %ymm3, %ymm0
	vinserti32x8	$0x1, %ymm0, %zmm12, %zmm3
	vmovd	28(%rsi), %xmm12
	vpunpcklqdq	%xmm13, %xmm8, %xmm0
	vmovdqa	%xmm0, -304(%rbp)
	vinserti32x4	$0x1, %xmm0, %ymm11, %ymm11
	vmovdqa	-272(%rbp), %xmm0
	vpmuldq	%zmm3, %zmm19, %zmm23
	vpunpcklqdq	%xmm10, %xmm12, %xmm3
	vinserti32x8	$0x1, %ymm2, %zmm11, %zmm2
	vpunpcklqdq	%xmm12, %xmm6, %xmm6
	vmovdqa	%xmm3, -320(%rbp)
	vinserti32x4	$0x1, %xmm15, %ymm0, %ymm15
	vinserti32x4	$0x1, %xmm4, %ymm3, %ymm3
	vpunpcklqdq	%xmm12, %xmm5, %xmm5
	vinserti32x8	$0x1, %ymm3, %zmm15, %zmm20
	vmovd	28(%r12), %xmm15
	vmovq	%r8, %xmm3
	vpmuldq	%zmm20, %zmm2, %zmm17
	vpunpcklqdq	%xmm8, %xmm3, %xmm8
	vpunpcklqdq	%xmm15, %xmm13, %xmm2
	vpunpcklqdq	%xmm1, %xmm15, %xmm1
	vpunpcklqdq	%xmm13, %xmm15, %xmm13
	vmovdqa64	%zmm23, 128(%r13)
	vinserti32x4	$0x1, %xmm2, %ymm8, %ymm0
	vinserti32x8	$0x1, %ymm9, %zmm0, %zmm9
	vmovdqa	-304(%rbp), %xmm0
	vpmuldq	%zmm20, %zmm9, %zmm3
	vinserti32x4	$0x1, %xmm1, %ymm0, %ymm9
	vmovdqa	-272(%rbp), %xmm0
	vmovdqa64	%zmm17, 192(%r13)
	vinserti32x8	$0x1, %ymm11, %zmm9, %zmm1
	vpunpcklqdq	%xmm14, %xmm10, %xmm9
	vpunpcklqdq	%xmm12, %xmm10, %xmm10
	vinserti32x4	$0x1, %xmm7, %ymm9, %ymm11
	vinserti32x4	$0x1, %xmm6, %ymm0, %ymm6
	vmovq	%r9, %xmm0
	vinserti32x8	$0x1, %ymm11, %zmm6, %zmm11
	vinserti32x4	$0x1, %xmm8, %ymm2, %ymm6
	vinserti32x4	$0x1, %xmm9, %ymm5, %ymm9
	vpmuldq	%zmm11, %zmm1, %zmm1
	vpunpcklqdq	%xmm0, %xmm15, %xmm11
	vinserti32x4	$0x1, -304(%rbp), %ymm2, %ymm2
	vmovdqa64	%zmm3, 256(%r13)
	vinserti32x4	$0x1, %xmm8, %ymm11, %ymm8
	vpunpcklqdq	%xmm12, %xmm14, %xmm14
	vmovdqa	-320(%rbp), %xmm11
	vextracti64x4	$0x0, %zmm21, %ymm5
	vinserti32x8	$0x1, %ymm6, %zmm8, %zmm6
	vpunpcklqdq	%xmm15, %xmm15, %xmm8
	vinserti32x4	$0x1, %xmm10, %ymm14, %ymm12
	vinserti32x4	$0x1, %xmm11, %ymm7, %ymm7
	vinserti32x4	$0x1, %xmm8, %ymm13, %ymm15
	vinserti32x4	$0x1, %xmm11, %ymm4, %ymm4
	vinserti32x8	$0x1, %ymm7, %zmm9, %zmm0
	vinserti32x8	$0x1, %ymm12, %zmm4, %zmm11
	vextracti64x4	$0x1, %zmm21, %ymm13
	vpmuldq	%zmm0, %zmm6, %zmm7
	vinserti32x8	$0x1, %ymm15, %zmm2, %zmm6
	vextracti128	$0x1, %ymm5, %xmm4
	vmovdqa64	%zmm1, 320(%r13)
	vpmuldq	%zmm11, %zmm6, %zmm0
	vextracti128	$0x1, %ymm13, %xmm15
	vpextrq	$1, %xmm5, %r11
	vmovq	%xmm13, %rax
	vpextrq	$1, %xmm4, %rcx
	vextracti64x4	$0x0, %zmm22, %ymm2
	vpextrq	$1, %xmm13, %rdx
	vmovq	%xmm15, %rsi
	vpextrq	$1, %xmm15, %r8
	vextracti128	$0x1, %ymm2, %xmm10
	vmovq	%xmm2, %r9
	vmovq	%xmm4, %r12
	vmovdqa64	%zmm7, 384(%r13)
	leaq	(%r12,%r11), %r10
	vextracti64x4	$0x1, %zmm22, %ymm14
	vextracti64x4	$0x0, %zmm23, %ymm13
	vmovdqa64	%zmm0, 448(%r13)
	vextracti128	$0x1, %ymm14, %xmm11
	vextracti128	$0x1, %ymm13, %xmm15
	movq	%r11, -432(%rbp)
	vpextrq	$1, %xmm2, %r11
	vpextrq	$1, %xmm11, -304(%rbp)
	vextracti64x4	$0x1, %zmm23, %ymm2
	movq	%rcx, -1040(%rbp)
	addq	%rax, %rcx
	addq	%rdx, %rcx
	addq	%rsi, %r8
	movq	%rdi, -1032(%rbp)
	vpextrq	$1, %xmm10, %rdi
	movq	%rcx, -752(%rbp)
	addq	%r9, %r8
	movq	-752(%rbp), %rbx
	vmovq	%xmm10, %rcx
	addq	%r11, %r8
	xorl	%eax, %eax
	addq	%rcx, %rdi
	movq	%r10, -960(%rbp)
	movq	%rbx, -968(%rbp)
	movq	%rdi, %rcx
	vmovq	%xmm14, %rbx
	adcq	$0, %rax
	addq	%rbx, %rcx
	movq	%r8, -816(%rbp)
	movq	%rax, %rsi
	movq	-816(%rbp), %r10
	vpextrq	$1, %xmm14, %rdx
	movq	%rcx, %rbx
	vmovq	%xmm11, %r8
	movq	-304(%rbp), %r11
	adcq	$0, %rsi
	addq	%rdx, %rbx
	movq	%r10, -976(%rbp)
	vmovq	%xmm13, %r10
	adcq	$0, %rsi
	addq	%r8, %rbx
	vpextrq	$1, %xmm13, %rax
	adcq	$0, %rsi
	xorl	%edi, %edi
	addq	%r11, %r10
	movq	%rbx, -880(%rbp)
	adcq	$0, %rdi
	addq	%rax, %r10
	vmovq	%xmm15, %r8
	movq	-880(%rbp), %r9
	adcq	$0, %rdi
	movq	%r10, %rcx
	vpextrq	$1, %xmm15, %rdx
	movq	%rsi, -872(%rbp)
	addq	%r8, %rcx
	movq	%rdi, %rbx
	vextracti128	$0x1, %ymm2, %xmm10
	movq	%r9, -984(%rbp)
	adcq	$0, %rbx
	movq	%rcx, %rsi
	vmovq	%xmm2, %r9
	addq	%rdx, %rsi
	movq	%rbx, %rdi
	vpextrq	$1, %xmm2, %r10
	adcq	$0, %rdi
	vmovq	%xmm10, %rdx
	addq	%r9, %rsi
	adcq	$0, %rdi
	vextracti64x4	$0x0, %zmm17, %ymm14
	xorl	%ecx, %ecx
	addq	%r10, %rdx
	vmovq	%xmm14, %r8
	vpextrq	$1, %xmm10, %rax
	adcq	$0, %rcx
	movq	%rsi, -352(%rbp)
	addq	%rax, %rdx
	vpextrq	$1, %xmm14, %rbx
	vextracti128	$0x1, %ymm14, %xmm11
	movq	-352(%rbp), %r11
	adcq	$0, %rcx
	addq	%r8, %rdx
	vmovq	%xmm11, %r9
	movq	%rdi, -344(%rbp)
	adcq	$0, %rcx
	addq	%rbx, %rdx
	vextracti64x4	$0x1, %zmm17, %ymm13
	movq	%r11, -992(%rbp)
	adcq	$0, %rcx
	movq	%rdx, %rax
	vpextrq	$1, %xmm11, %rsi
	addq	%r9, %rax
	movq	%rcx, %rdx
	vmovq	%xmm13, %r11
	adcq	$0, %rdx
	movq	%rax, %r9
	vpextrq	$1, %xmm13, %r8
	addq	%rsi, %r9
	movq	%rdx, %r10
	vextracti128	$0x1, %ymm13, %xmm15
	adcq	$0, %r10
	xorl	%ecx, %ecx
	addq	%r11, %r8
	movq	%r9, -368(%rbp)
	vmovq	%xmm15, %rbx
	movq	%r8, %rax
	adcq	$0, %rcx
	movq	-368(%rbp), %rdi
	addq	%rbx, %rax
	vpextrq	$1, %xmm15, %rsi
	movq	%r10, -360(%rbp)
	vmovq	%xmm3, %r10
	adcq	$0, %rcx
	movq	%rax, %rdx
	movq	%rdi, -1000(%rbp)
	vpextrq	$1, %xmm3, %rdi
	addq	%rsi, %rdx
	movq	%rcx, %r9
	vextracti128	$0x1, %ymm3, %xmm10
	adcq	$0, %r9
	addq	%r10, %rdx
	vmovq	%xmm10, %r11
	adcq	$0, %r9
	addq	%rdi, %rdx
	vextracti64x4	$0x1, %zmm3, %ymm14
	adcq	$0, %r9
	movq	%rdx, %rax
	vpextrq	$1, %xmm10, %r8
	addq	%r11, %rax
	movq	%r9, %rdx
	vmovq	%xmm14, %rcx
	adcq	$0, %rdx
	movq	%rax, %r10
	vpextrq	$1, %xmm14, %r9
	addq	%r8, %r10
	movq	%rdx, %r11
	vextracti128	$0x1, %ymm14, %xmm11
	adcq	$0, %r11
	movq	%r10, -320(%rbp)
	xorl	%edi, %edi
	movq	-320(%rbp), %rbx
	addq	%rcx, %r9
	vmovq	%xmm11, %rsi
	vpextrq	$1, %xmm11, %rax
	movq	%r11, -312(%rbp)
	adcq	$0, %rdi
	movq	%r9, %rcx
	movq	%rbx, -896(%rbp)
	vmovq	%xmm1, %rdx
	addq	%rsi, %rcx
	movq	%rdi, %rbx
	vpextrq	$1, %xmm1, %r8
	adcq	$0, %rbx
	addq	%rax, %rcx
	vextracti128	$0x1, %ymm1, %xmm15
	adcq	$0, %rbx
	addq	%rdx, %rcx
	vmovq	%xmm15, %r10
	adcq	$0, %rbx
	addq	%r8, %rcx
	vextracti64x4	$0x1, %zmm1, %ymm2
	movq	%rcx, %rax
	adcq	$0, %rbx
	vpextrq	$1, %xmm15, %rdi
	addq	%r10, %rax
	movq	%rbx, %rdx
	vextracti128	$0x1, %ymm2, %xmm10
	adcq	$0, %rdx
	movq	%rax, -496(%rbp)
	xorl	%esi, %esi
	vpextrq	$1, %xmm2, %rbx
	movq	%rax, -560(%rbp)
	vmovq	%xmm2, %rax
	vmovq	%xmm10, %rcx
	vpextrq	$1, %xmm10, %r8
	addq	%rdi, %rax
	vmovq	%xmm7, %r10
	movq	-496(%rbp), %r9
	vextracti128	$0x1, %ymm7, %xmm11
	adcq	$0, %rsi
	addq	%rbx, %rax
	vpextrq	$1, %xmm7, %rdi
	movq	%rdx, -488(%rbp)
	adcq	$0, %rsi
	addq	%rcx, %rax
	vextracti64x4	$0x1, %zmm7, %ymm13
	movq	%r9, 64(%r13)
	adcq	$0, %rsi
	addq	%r8, %rax
	vmovq	%xmm11, %r8
	adcq	$0, %rsi
	addq	%r10, %rax
	vmovq	%xmm13, %rbx
	adcq	$0, %rsi
	addq	%rdi, %r8
	movq	%rax, -904(%rbp)
	vextracti128	$0x1, %ymm13, %xmm15
	movq	%rsi, -328(%rbp)
	vpextrq	$1, %xmm11, %rsi
	vpextrq	$1, %xmm13, %rcx
	vmovq	%xmm15, %r10
	addq	%rsi, %r8
	movq	%rax, -336(%rbp)
	vmovq	%xmm0, %rax
	vpextrq	$1, %xmm0, %rdx
	addq	%rbx, %r8
	vpextrq	$1, %xmm15, %rbx
	vextracti128	$0x1, %ymm0, %xmm10
	movq	-336(%rbp), %r9
	addq	%rcx, %r8
	xorl	%esi, %esi
	addq	%r10, %rbx
	movq	-432(%rbp), %r10
	adcq	$0, %rsi
	addq	%rax, %rbx
	vextracti64x4	$0x1, %zmm0, %ymm14
	movq	%r9, 72(%r13)
	adcq	$0, %rsi
	vmovq	%xmm10, %rdi
	addq	%rdx, %rbx
	movq	%r8, -928(%rbp)
	vpextrq	$1, %xmm10, %rax
	adcq	$0, %rsi
	vmovq	%xmm14, %rcx
	movq	%rbx, -624(%rbp)
	addq	%rdi, %rax
	movq	-624(%rbp), %r9
	vextracti128	$0x1, %ymm14, %xmm11
	movq	%rbx, -944(%rbp)
	addq	%rcx, %rax
	movq	-960(%rbp), %rcx
	leal	(%r10,%r12), %r12d
	movq	%r8, 80(%r13)
	movq	%rax, -688(%rbp)
	vmovq	%xmm11, %rbx
	movq	-968(%rbp), %r10
	vpextrq	$1, %xmm11, -272(%rbp)
	movq	%rax, -912(%rbp)
	movq	%rcx, %rax
	movq	-688(%rbp), %rdx
	shrq	$32, %rax
	movq	%rsi, -616(%rbp)
	vpextrq	$1, %xmm14, %rsi
	movq	-272(%rbp), %r11
	movq	%r9, 88(%r13)
	vmovq	%xmm5, %r9
	leaq	(%rbx,%rsi), %rdi
	vmovd	%r10d, %xmm8
	leal	(%rax,%r9), %ebx
	movl	%r9d, %esi
	movq	%rdx, 96(%r13)
	movq	%r10, %rdx
	movq	%rbx, %rax
	shrq	$32, %rdx
	movq	%r11, 112(%r13)
	movabsq	$-4294967296, %r11
	subq	%rsi, %rax
	leal	(%r12,%rdx), %r12d
	vmovq	%xmm8, %r10
	movq	%rdi, 104(%r13)
	shrq	$63, %rax
	salq	$32, %rax
	addq	%r9, %rax
	movl	%ecx, %r9d
	movq	%r12, %rcx
	subq	%r9, %rcx
	andq	%r11, %rax
	movq	-976(%rbp), %r9
	orq	%rbx, %rax
	shrq	$63, %rcx
	movl	-752(%rbp), %ebx
	addq	%rcx, %rax
	movq	%r9, %rdx
	shrq	$32, %rdx
	movq	%rax, 0(%r13)
	movq	-984(%rbp), %rax
	leal	(%rdx,%rbx), %esi
	movl	-816(%rbp), %ebx
	movq	%rax, %rcx
	movq	%rsi, %rdx
	vmovd	%eax, %xmm13
	shrq	$32, %rcx
	subq	%r10, %rdx
	movq	-1000(%rbp), %r10
	vmovq	%xmm13, %rax
	addl	%ecx, %ebx
	shrq	$63, %rdx
	movq	-992(%rbp), %rcx
	addq	%r12, %rdx
	movl	%r9d, %r12d
	vmovd	%r10d, %xmm9
	movq	%rbx, %r9
	subq	%r12, %r9
	salq	$32, %rdx
	movl	-352(%rbp), %r12d
	orq	%rsi, %rdx
	shrq	$63, %r9
	movq	%rcx, %rsi
	addq	%r9, %rdx
	shrq	$32, %rsi
	movq	%rdx, 8(%r13)
	movl	-880(%rbp), %edx
	leal	(%rsi,%rdx), %r9d
	movq	%r10, %rsi
	movq	%r9, %rdx
	shrq	$32, %rsi
	subq	%rax, %rdx
	addl	%esi, %r12d
	shrq	$63, %rdx
	addq	%rbx, %rdx
	movl	%ecx, %ebx
	movq	%r12, %rcx
	subq	%rbx, %rcx
	salq	$32, %rdx
	orq	%r9, %rdx
	shrq	$63, %rcx
	addq	%rcx, %rdx
	vmovq	%xmm9, %rcx
	movq	%rdx, 16(%r13)
	movq	-896(%rbp), %r9
	movl	-368(%rbp), %esi
	movq	-560(%rbp), %rbx
	movq	%r15, -1048(%rbp)
	movq	%r9, %rdx
	movl	-320(%rbp), %eax
	movq	%r14, -1056(%rbp)
	shrq	$32, %rdx
	shrq	$32, %rbx
	movq	%r13, -1064(%rbp)
	addl	%edx, %esi
	leal	(%rbx,%rax), %ebx
	movq	%r8, %rax
	movq	%rsi, %r10
	shrq	$32, %rax
	subq	%rcx, %r10
	movl	-336(%rbp), %ecx
	movq	$1, -336(%rbp)
	shrq	$63, %r10
	addq	%r12, %r10
	movl	%r9d, %r12d
	movq	%rbx, %r9
	addl	%eax, %ecx
	subq	%r12, %r9
	salq	$32, %r10
	movq	%r8, %r12
	orq	%rsi, %r10
	shrq	$63, %r9
	movl	-496(%rbp), %esi
	movl	%r12d, %r12d
	addq	%r9, %r10
	movl	-560(%rbp), %r9d
	movq	%r10, 24(%r13)
	movq	-904(%rbp), %r10
	movq	%r10, %rdx
	shrq	$32, %rdx
	addl	%esi, %edx
	movq	%rdx, %rax
	subq	%r9, %rax
	movq	-944(%rbp), %r9
	shrq	$63, %rax
	addq	%rbx, %rax
	movl	%r10d, %ebx
	movq	%rcx, %r10
	salq	$32, %rax
	subq	%rbx, %r10
	movq	-912(%rbp), %rbx
	orq	%rdx, %rax
	movq	%r9, %rdx
	shrq	$63, %r10
	shrq	$32, %rdx
	addq	%r10, %rax
	movq	%rbx, %rsi
	movl	%ebx, %ebx
	leal	(%rdx,%r8), %r10d
	movq	%rax, 32(%r13)
	shrq	$32, %rsi
	movq	%rdi, %rdx
	movq	%r10, %rax
	movl	-624(%rbp), %r8d
	subq	%r12, %rax
	movq	-272(%rbp), %r12
	movq	$1, -272(%rbp)
	shrq	$63, %rax
	addl	%esi, %r8d
	addq	%rcx, %rax
	movl	%r9d, %ecx
	movq	%r8, %r9
	movq	%r8, %rsi
	salq	$32, %rax
	movq	%r12, %r8
	orq	%r10, %rax
	movl	-688(%rbp), %r10d
	subq	%rcx, %r9
	shrq	$32, %rdx
	shrq	$63, %r9
	shrq	$32, %r8
	addl	%r10d, %edx
	addq	%r9, %rax
	addl	%edi, %r8d
	movl	%r12d, %r10d
	movq	%rdx, %rcx
	movq	%rax, 40(%r13)
	movl	%r8d, %eax
	movl	%edi, %edi
	subq	%rbx, %rcx
	leaq	56(%r13), %rbx
	shrq	$63, %rcx
	movq	%rbx, -992(%rbp)
	addq	%rsi, %rcx
	movq	%rax, %rsi
	salq	$32, %rcx
	subq	%rdi, %rsi
	orq	%rdx, %rcx
	movq	-304(%rbp), %rdx
	shrq	$63, %rsi
	addq	%rsi, %rcx
	shrq	$32, %rdx
	movq	%rcx, 48(%r13)
	leaq	112(%r13), %rcx
	leal	(%rdx,%r12), %r9d
	movq	%rcx, -1000(%rbp)
	movq	%r9, %r8
	subq	%r10, %r8
	shrq	$63, %r8
	addq	%r8, %rax
	salq	$32, %r8
	salq	$32, %rax
	orq	%r9, %rax
	subq	%r8, %rax
	andq	%r11, %rax
	orq	%r10, %rax
	movq	%rax, 56(%r13)
.L262:
	salq	-272(%rbp)
	movq	-272(%rbp), %r14
#APP
# 225 "../myutils.h" 1
	CPUID
	RDTSC
	mov %edx, %r15d
	mov %eax, %r11d
	
# 0 "" 2
#NO_APP
	salq	$32, %r15
	movl	%r11d, %eax
	orq	%rax, %r15
	movq	%r15, -984(%rbp)
	testq	%r14, %r14
	je	.L260
	vextracti64x4	$0x1, %zmm21, %ymm2
	movq	-1040(%rbp), %r8
	movl	%r14d, %r12d
	vextracti64x4	$0x0, %zmm22, %ymm12
	vextracti128	$0x1, %ymm2, %xmm14
	vmovq	%xmm2, %r9
	vpextrq	$1, %xmm2, %r10
	vmovq	%xmm14, %rbx
	addq	%r9, %r8
	vpextrq	$1, %xmm14, %rcx
	addq	%r10, %r8
	vmovq	%xmm12, %r15
	xorl	%r14d, %r14d
	addq	%rbx, %rcx
	vextracti128	$0x1, %ymm12, %xmm8
	vmovq	%xmm4, %rsi
	adcq	$0, %r14
	addq	%r15, %rcx
	vpextrq	$1, %xmm5, %rdi
	vpextrq	$1, %xmm12, %r11
	adcq	$0, %r14
	movq	%r8, -904(%rbp)
	addq	%r11, %rcx
	leaq	(%rdi,%rsi), %rdx
	vextracti64x4	$0x1, %zmm22, %ymm13
	movq	%rdi, -968(%rbp)
	vmovq	%xmm8, %rdi
	adcq	$0, %r14
	vpextrq	$1, %xmm8, %rsi
	movq	%rdx, -624(%rbp)
	vmovq	%xmm13, %r9
	xorl	%edx, %edx
	addq	%rdi, %rsi
	movq	%r14, -920(%rbp)
	vextracti128	$0x1, %ymm13, %xmm2
	vpextrq	$1, %xmm13, %r10
	adcq	$0, %rdx
	addq	%r9, %rsi
	vextracti64x4	$0x0, %zmm23, %ymm10
	vmovq	%xmm2, %rbx
	adcq	$0, %rdx
	vpextrq	$1, %xmm2, -496(%rbp)
	addq	%r10, %rsi
	movq	-496(%rbp), %r14
	vmovq	%xmm10, %r10
	vextracti128	$0x1, %ymm10, %xmm12
	adcq	$0, %rdx
	addq	%rbx, %rsi
	movq	%rcx, -928(%rbp)
	vpextrq	$1, %xmm10, %r15
	movq	-928(%rbp), %rax
	adcq	$0, %rdx
	addq	%r14, %r10
	vextracti64x4	$0x1, %zmm23, %ymm11
	vmovq	%xmm12, %r11
	addq	%r15, %r10
	vextracti128	$0x1, %ymm11, %xmm13
	movq	%rsi, -944(%rbp)
	movq	%rax, -1008(%rbp)
	addq	%r11, %r10
	vpextrq	$1, %xmm12, %rax
	movq	-944(%rbp), %rcx
	vmovq	%xmm11, %rdi
	vpextrq	$1, %xmm11, %rsi
	addq	%rax, %r10
	movq	%rdx, -936(%rbp)
	vmovq	%xmm13, %r9
	addq	%rdi, %r10
	xorl	%edx, %edx
	movq	%rcx, -1016(%rbp)
	vextracti64x4	$0x0, %zmm17, %ymm9
	addq	%rsi, %r9
	vpextrq	$1, %xmm13, %rbx
	movq	%r10, -912(%rbp)
	vmovq	%xmm9, %rcx
	adcq	$0, %rdx
	addq	%rbx, %r9
	vextracti128	$0x1, %ymm9, %xmm10
	vpextrq	$1, %xmm9, %r14
	adcq	$0, %rdx
	addq	%rcx, %r9
	vmovq	%xmm10, %r15
	adcq	$0, %rdx
	addq	%r14, %r9
	adcq	$0, %rdx
	vextracti64x4	$0x1, %zmm17, %ymm14
	addq	%r15, %r9
	vextracti128	$0x1, %ymm14, %xmm11
	vpextrq	$1, %xmm10, %r11
	adcq	$0, %rdx
	vmovq	%xmm14, %rdi
	addq	%r11, %r9
	vpextrq	$1, %xmm14, %r14
	adcq	$0, %rdx
	vmovq	%xmm11, %rsi
	xorl	%r15d, %r15d
	addq	%rdi, %r14
	adcq	$0, %r15
	movq	%r9, -960(%rbp)
	addq	%rsi, %r14
	vpextrq	$1, %xmm11, %r9
	adcq	$0, %r15
	addq	%r9, %r14
	movq	%rdx, -952(%rbp)
	vmovq	%xmm3, %rdx
	vextracti128	$0x1, %ymm3, %xmm9
	adcq	$0, %r15
	vpextrq	$1, %xmm3, %rbx
	addq	%rdx, %r14
	vmovq	%xmm9, %rcx
	adcq	$0, %r15
	addq	%rbx, %r14
	movq	-960(%rbp), %rax
	adcq	$0, %r15
	vextracti64x4	$0x1, %zmm3, %ymm2
	addq	%rcx, %r14
	vextracti128	$0x1, %ymm2, %xmm14
	vpextrq	$1, %xmm9, %r11
	adcq	$0, %r15
	movq	%rax, -1024(%rbp)
	addq	%r11, %r14
	vmovq	%xmm2, %rdi
	vpextrq	$1, %xmm2, %rsi
	adcq	$0, %r15
	vmovq	%xmm14, %rdx
	xorl	%r9d, %r9d
	addq	%rdi, %rsi
	adcq	$0, %r9
	addq	%rdx, %rsi
	vpextrq	$1, %xmm14, %rbx
	movq	%r14, -688(%rbp)
	adcq	$0, %r9
	vmovq	%xmm1, %rcx
	addq	%rbx, %rsi
	movq	-688(%rbp), %rax
	adcq	$0, %r9
	vextracti128	$0x1, %ymm1, %xmm13
	addq	%rcx, %rsi
	movq	%r15, -680(%rbp)
	adcq	$0, %r9
	vpextrq	$1, %xmm1, %r11
	vmovq	%xmm13, %r14
	movq	%rax, -976(%rbp)
	addq	%r11, %rsi
	vextracti64x4	$0x1, %zmm1, %ymm9
	vpextrq	$1, %xmm13, %rdi
	adcq	$0, %r9
	addq	%r14, %rsi
	vextracti128	$0x1, %ymm9, %xmm2
	adcq	$0, %r9
	movq	%rsi, -752(%rbp)
	xorl	%eax, %eax
	vmovq	%xmm9, %rsi
	addq	%rdi, %rsi
	movq	%r9, -744(%rbp)
	vpextrq	$1, %xmm9, %r9
	vmovq	%xmm2, %rdx
	adcq	$0, %rax
	addq	%r9, %rsi
	vpextrq	$1, %xmm2, %rbx
	movq	-752(%rbp), %r15
	adcq	$0, %rax
	addq	%rdx, %rsi
	vmovq	%xmm7, %rcx
	adcq	$0, %rax
	addq	%rbx, %rsi
	vextracti128	$0x1, %ymm7, %xmm12
	adcq	$0, %rax
	addq	%rcx, %rsi
	vpextrq	$1, %xmm7, %rdi
	movq	%rsi, -816(%rbp)
	adcq	$0, %rax
	vmovq	%xmm12, %rsi
	vextracti64x4	$0x1, %zmm7, %ymm11
	movq	%rax, -808(%rbp)
	vpextrq	$1, %xmm12, %r9
	xorl	%eax, %eax
	addq	%rdi, %rsi
	vmovq	%xmm11, %rdx
	adcq	$0, %rax
	addq	%r9, %rsi
	movq	-816(%rbp), %r14
	adcq	$0, %rax
	vpextrq	$1, %xmm11, %rbx
	addq	%rdx, %rsi
	vextracti128	$0x1, %ymm11, %xmm9
	adcq	$0, %rax
	addq	%rbx, %rsi
	movq	%r14, -880(%rbp)
	adcq	$0, %rax
	movq	%rsi, -352(%rbp)
	vmovq	%xmm9, %r14
	vpextrq	$1, %xmm9, %rsi
	movq	%rax, -344(%rbp)
	vmovq	%xmm0, %rdi
	xorl	%eax, %eax
	addq	%r14, %rsi
	adcq	$0, %rax
	vpextrq	$1, %xmm0, %r9
	addq	%rdi, %rsi
	movq	-352(%rbp), %r11
	adcq	$0, %rax
	vextracti128	$0x1, %ymm0, %xmm10
	addq	%r9, %rsi
	movq	%rsi, -368(%rbp)
	vextracti64x4	$0x1, %zmm0, %ymm14
	vmovq	%xmm10, %rcx
	vpextrq	$1, %xmm10, %rsi
	adcq	$0, %rax
	movq	%r11, -304(%rbp)
	xorl	%r11d, %r11d
	vmovq	%xmm14, %r14
	addq	%rcx, %rsi
	movq	-368(%rbp), %rbx
	vextracti128	$0x1, %ymm14, %xmm11
	vpextrq	$1, %xmm14, -560(%rbp)
	adcq	$0, %r11
	addq	%r14, %rsi
	movq	-560(%rbp), %r9
	vmovq	%xmm11, %rdx
	movq	%rsi, -896(%rbp)
	movq	-624(%rbp), %rsi
	adcq	$0, %r11
	movq	-896(%rbp), %rdi
	movq	%rbx, -320(%rbp)
	leaq	(%r9,%rdx), %r14
	vmovq	%xmm4, %r9
	movq	%rsi, %rbx
	movq	%r11, -888(%rbp)
	vmovq	%xmm5, %r11
	vmovd	%esi, %xmm6
	shrq	$32, %rbx
	movq	%rdi, -432(%rbp)
	movq	-968(%rbp), %rdi
	vmovd	%r11d, %xmm15
	addl	%r11d, %ebx
	movq	%rax, -360(%rbp)
	vpextrq	$1, %xmm11, %rax
	movl	%ebx, %ecx
	leal	(%rdi,%r9), %edx
	movq	%r8, %rbx
	movq	%rcx, -624(%rbp)
	movq	-624(%rbp), %r9
	vmovq	%xmm15, %rcx
	shrq	$32, %rbx
	leal	(%rdx,%rbx), %ebx
	vmovq	%xmm6, %rdx
	movq	-624(%rbp), %rdi
	subq	%rcx, %r9
	movq	%rbx, %rsi
	shrq	$63, %r9
	subq	%rdx, %rsi
	salq	$32, %r9
	movq	%rsi, %rcx
	addq	%r11, %r9
	shrq	$63, %rcx
	movabsq	$-4294967296, %r11
	andq	%r11, %r9
	movq	-1008(%rbp), %r11
	orq	%rdi, %r9
	addq	%r9, %rcx
	movq	%r11, %r9
	shrq	$32, %r9
	movq	%rcx, -968(%rbp)
	movl	-904(%rbp), %ecx
	leal	(%r9,%r8), %edi
	movq	-1016(%rbp), %r9
	movl	-928(%rbp), %r8d
	movq	%rdi, %rdx
	movq	%r9, %rsi
	subq	%rcx, %rdx
	movl	-944(%rbp), %ecx
	movl	%r9d, %r9d
	shrq	$32, %rsi
	shrq	$63, %rdx
	addl	%esi, %r8d
	addq	%rbx, %rdx
	movl	%r11d, %ebx
	movq	%r8, %rsi
	salq	$32, %rdx
	subq	%rbx, %rsi
	orq	%rdi, %rdx
	movq	-1024(%rbp), %rbx
	shrq	$63, %rsi
	leaq	(%rdx,%rsi), %r11
	movq	%r10, %rdx
	movq	%rbx, %rdi
	movl	%ebx, %ebx
	shrq	$32, %rdx
	shrq	$32, %rdi
	movq	%r11, -624(%rbp)
	movq	-976(%rbp), %r11
	addl	%edx, %ecx
	leal	(%rdi,%r10), %esi
	movl	-912(%rbp), %r10d
	movl	-688(%rbp), %edi
	movq	%rcx, %rdx
	subq	%r9, %rdx
	shrq	$63, %rdx
	addq	%r8, %rdx
	movq	%rsi, %r8
	salq	$32, %rdx
	subq	%r10, %r8
	movq	-880(%rbp), %r10
	orq	%rcx, %rdx
	shrq	$63, %r8
	movl	-960(%rbp), %ecx
	addq	%rdx, %r8
	movq	%r11, %rdx
	shrq	$32, %rdx
	movq	%r8, -904(%rbp)
	movq	%r10, %r8
	addl	%edx, %ecx
	movq	%r15, %rdx
	shrq	$32, %r8
	shrq	$32, %rdx
	leal	(%rdx,%rdi), %edi
	movq	%rcx, %rdx
	subq	%rbx, %rdx
	movq	%rdi, %r9
	shrq	$63, %rdx
	addq	%rsi, %rdx
	movl	%r11d, %esi
	subq	%rsi, %r9
	salq	$32, %rdx
	movl	%r15d, %esi
	orq	%rcx, %rdx
	shrq	$63, %r9
	addq	%rdx, %r9
	movq	%r9, -688(%rbp)
	movl	-752(%rbp), %ecx
	movq	-304(%rbp), %rdx
	movl	-816(%rbp), %r11d
	addl	%r8d, %ecx
	movl	-368(%rbp), %r8d
	shrq	$32, %rdx
	leal	(%rdx,%r11), %ebx
	movq	%rcx, %rdx
	movq	-432(%rbp), %r11
	subq	%rsi, %rdx
	movq	%rbx, %r9
	movl	-304(%rbp), %esi
	shrq	$63, %rdx
	addq	%rdi, %rdx
	movl	%r10d, %edi
	movq	-320(%rbp), %r10
	subq	%rdi, %r9
	salq	$32, %rdx
	orq	%rcx, %rdx
	shrq	$63, %r9
	movl	-352(%rbp), %ecx
	addq	%rdx, %r9
	movq	%r10, %rdx
	shrq	$32, %rdx
	movq	%r9, -752(%rbp)
	addl	%edx, %ecx
	movq	%r11, %rdx
	movl	%r11d, %r11d
	shrq	$32, %rdx
	leal	(%rdx,%r8), %edi
	movq	%rcx, %rdx
	movq	-560(%rbp), %r8
	subq	%rsi, %rdx
	movq	%rdi, %r9
	vmovq	%xmm11, %rsi
	shrq	$63, %rdx
	addq	%rbx, %rdx
	movl	%r10d, %ebx
	salq	$32, %rdx
	orq	%rcx, %rdx
	subq	%rbx, %r9
	movl	-896(%rbp), %ecx
	addl	%r8d, %esi
	shrq	$63, %r9
	leaq	(%rdx,%r9), %r10
	movq	%r14, %rdx
	shrq	$32, %rdx
	leal	(%rdx,%rcx), %r9d
	movq	%rax, %rdx
	movq	-496(%rbp), %rcx
	shrq	$32, %rdx
	leal	(%rsi,%rdx), %r8d
	movq	%r9, %rdx
	shrq	$32, %rcx
	subq	%r11, %rdx
	leal	(%rcx,%rax), %esi
	movq	%r8, %rbx
	xorl	%ecx, %ecx
	shrq	$63, %rdx
	movq	%rsi, %r11
	addq	%rdi, %rdx
	movl	%r14d, %edi
	salq	$32, %rdx
	subq	%rdi, %rbx
	orq	%r9, %rdx
	movl	%eax, %r9d
	shrq	$63, %rbx
	subq	%r9, %r11
	leaq	(%rdx,%rbx), %rdi
	movl	%r12d, %ebx
	shrq	$63, %r11
	leaq	(%r8,%r11), %r8
	salq	$32, %r11
	salq	$32, %r8
	orq	%r8, %rsi
	movabsq	$-4294967296, %r8
	movq	%rsi, %rdx
	subq	%r11, %rdx
	andq	%rdx, %r8
	andl	$7, %ebx
	je	.L421
	cmpl	$1, %ebx
	je	.L367
	cmpl	$2, %ebx
	je	.L368
	cmpl	$3, %ebx
	je	.L369
	cmpl	$4, %ebx
	je	.L370
	cmpl	$5, %ebx
	je	.L371
	cmpl	$6, %ebx
	je	.L372
	vmovdqa64	%zmm22, 64(%r13)
	movl	$1, %ecx
	movq	%rax, 112(%r13)
.L372:
	vmovdqa64	%zmm22, 64(%r13)
	addl	$1, %ecx
	movq	%rax, 112(%r13)
.L371:
	vmovdqa64	%zmm22, 64(%r13)
	addl	$1, %ecx
	movq	%rax, 112(%r13)
.L370:
	vmovdqa64	%zmm22, 64(%r13)
	addl	$1, %ecx
	movq	%rax, 112(%r13)
.L369:
	vmovdqa64	%zmm22, 64(%r13)
	addl	$1, %ecx
	movq	%rax, 112(%r13)
.L368:
	vmovdqa64	%zmm22, 64(%r13)
	addl	$1, %ecx
	movq	%rax, 112(%r13)
.L367:
	addl	$1, %ecx
	vmovdqa64	%zmm22, 64(%r13)
	movq	%rax, 112(%r13)
	cmpl	%r12d, %ecx
	je	.L412
.L421:
	movq	-304(%rbp), %rdx
	movq	-320(%rbp), %r11
	movq	-432(%rbp), %r9
.L261:
	addl	$8, %ecx
	vmovdqa64	%zmm22, 64(%r13)
	movq	%rax, 112(%r13)
	cmpl	%r12d, %ecx
	jne	.L261
	movq	%rdx, -304(%rbp)
	movq	%r11, -320(%rbp)
	movq	%r9, -432(%rbp)
.L412:
	movq	-1000(%rbp), %r12
	movq	-304(%rbp), %rbx
	movq	-320(%rbp), %rdx
	movq	-432(%rbp), %r11
	movq	(%r12), %rcx
	movq	-904(%rbp), %r9
	vmovdqa64	%zmm22, 64(%r13)
	movq	%r15, 64(%r13)
	movq	-880(%rbp), %r15
	movq	%r14, 104(%r13)
	movq	-688(%rbp), %r12
	movq	%r15, 72(%r13)
	movq	-968(%rbp), %r14
	movq	%rax, 112(%r13)
	movq	-752(%rbp), %r15
	movq	-624(%rbp), %rax
	movq	%r10, 40(%r13)
	movl	%ecx, %r10d
	movq	%rdi, 48(%r13)
	orq	%r8, %r10
	movq	%rbx, 80(%r13)
	movq	%rdx, 88(%r13)
	movq	%r11, 96(%r13)
	movq	%r14, 0(%r13)
	movq	%rax, 8(%r13)
	movq	%r9, 16(%r13)
	movq	%r12, 24(%r13)
	movq	%r15, 32(%r13)
	vmovdqa64	%zmm23, 128(%r13)
	vmovdqa64	%zmm17, 192(%r13)
	vmovdqa64	%zmm3, 256(%r13)
	vmovdqa64	%zmm1, 320(%r13)
	vmovdqa64	%zmm7, 384(%r13)
	vmovdqa64	%zmm0, 448(%r13)
	movq	%rsi, 56(%r13)
	movq	-992(%rbp), %rdi
	movq	-272(%rbp), %rsi
	addq	%rsi, -336(%rbp)
	movq	%r10, (%rdi)
.L260:
	vmovdqa64	%zmm0, -880(%rbp)
	vmovdqa64	%zmm7, -816(%rbp)
	vmovdqa64	%zmm1, -752(%rbp)
	vmovdqa64	%zmm3, -688(%rbp)
	vmovdqa64	%zmm17, -624(%rbp)
	vmovdqa64	%zmm23, -560(%rbp)
	vmovdqa64	%zmm22, -496(%rbp)
	vmovdqa64	%zmm21, -432(%rbp)
	vmovdqa	%xmm4, -320(%rbp)
	vmovdqa	%ymm5, -304(%rbp)
#APP
# 238 "../myutils.h" 1
	RDTSCP
	mov %edx, %r8d
	mov %eax, %r11d
	CPUID
	
# 0 "" 2
#NO_APP
	movq	%r8, %rbx
	movq	-984(%rbp), %rdx
	movl	%r11d, %ecx
	xorl	%eax, %eax
	salq	$32, %rbx
	movq	-272(%rbp), %rsi
	movl	$.LC21, %edi
	orq	%rcx, %rbx
	subq	%rdx, %rbx
	vzeroupper
	call	printf
	xorl	%eax, %eax
	movq	%rbx, %rsi
	movl	$.LC22, %edi
	call	printf
	cmpq	$699999999, %rbx
	vmovdqa	-304(%rbp), %ymm5
	vmovdqa	-320(%rbp), %xmm4
	vmovdqa64	-432(%rbp), %zmm21
	vmovdqa64	-496(%rbp), %zmm22
	vmovdqa64	-560(%rbp), %zmm23
	vmovdqa64	-624(%rbp), %zmm17
	vmovdqa64	-688(%rbp), %zmm3
	vmovdqa64	-752(%rbp), %zmm1
	vmovdqa64	-816(%rbp), %zmm7
	vmovdqa64	-880(%rbp), %zmm0
	jbe	.L262
	vxorpd	%xmm9, %xmm9, %xmm9
	movl	$.LC24, %edi
	movq	-1048(%rbp), %r15
	movq	-1056(%rbp), %r14
	vcvtusi2sdq	%rbx, %xmm9, %xmm2
	vmulsd	.LC23(%rip), %xmm2, %xmm8
	movq	-1064(%rbp), %r12
	vcvtsi2sdq	-272(%rbp), %xmm9, %xmm14
	vcvttsd2usi	%xmm8, %rax
	vcvtusi2sdq	%rax, %xmm9, %xmm10
	movl	$1, %eax
	vdivsd	%xmm14, %xmm10, %xmm0
	vzeroupper
	call	printf
	movq	-336(%rbp), %rsi
	movl	$.LC25, %edi
	xorl	%eax, %eax
	call	printf
#APP
# 354 "test4.c" 1
	mfence
# 0 "" 2
# 356 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	leaq	64(%r13), %rbx
	xorl	%r13d, %r13d
.L263:
	movq	(%r12), %rcx
	movslq	%r13d, %rdi
	movl	$.LC17, %edx
	xorl	%eax, %eax
	addq	%r14, %rdi
	movl	$17, %esi
	addq	$8, %r12
	addl	$16, %r13d
	call	snprintf
	cmpq	%r12, %rbx
	jne	.L263
	movslq	%r13d, %r9
	movb	$0, (%r14,%r9)
	cmpb	$48, (%r14)
	jne	.L264
.L265:
	addq	$1, %r14
	cmpb	$48, (%r14)
	je	.L265
.L264:
#APP
# 361 "test4.c" 1
	mfence
# 0 "" 2
# 363 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	leaq	-224(%rbp), %rdx
	leaq	-240(%rbp), %rsi
	movl	$1, %ebx
	leaq	-208(%rbp), %rdi
	leaq	-192(%rbp), %r13
	call	__gmpz_mul
.L267:
	movq	%r13, %rsi
	xorl	%edi, %edi
	addq	%rbx, %rbx
	xorl	%r12d, %r12d
	call	getrusage
	fildq	-192(%rbp)
	fmuls	.LC26(%rip)
	fildq	-184(%rbp)
	faddp	%st, %st(1)
	fisttpq	-272(%rbp)
	testq	%rbx, %rbx
	jle	.L269
	movq	%rbx, %r10
	andl	$6, %r10d
	je	.L266
	cmpq	$1, %r10
	je	.L374
	cmpq	$2, %r10
	je	.L375
	cmpq	$3, %r10
	je	.L376
	cmpq	$4, %r10
	je	.L377
	cmpq	$5, %r10
	je	.L378
	cmpq	$6, %r10
	je	.L379
	leaq	-224(%rbp), %rdx
	leaq	-240(%rbp), %rsi
	movl	$1, %r12d
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
.L379:
	leaq	-224(%rbp), %rdx
	leaq	-240(%rbp), %rsi
	addq	$1, %r12
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
.L378:
	leaq	-224(%rbp), %rdx
	leaq	-240(%rbp), %rsi
	addq	$1, %r12
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
.L377:
	leaq	-224(%rbp), %rdx
	leaq	-240(%rbp), %rsi
	addq	$1, %r12
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
.L376:
	leaq	-224(%rbp), %rdx
	leaq	-240(%rbp), %rsi
	addq	$1, %r12
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
.L375:
	leaq	-224(%rbp), %rdx
	leaq	-240(%rbp), %rsi
	addq	$1, %r12
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
.L374:
	leaq	-224(%rbp), %rdx
	leaq	-240(%rbp), %rsi
	addq	$1, %r12
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
	cmpq	%r12, %rbx
	je	.L269
.L266:
	leaq	-224(%rbp), %rdx
	leaq	-240(%rbp), %rsi
	addq	$8, %r12
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
	leaq	-224(%rbp), %rdx
	leaq	-240(%rbp), %rsi
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
	leaq	-224(%rbp), %rdx
	leaq	-240(%rbp), %rsi
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
	leaq	-224(%rbp), %rdx
	leaq	-240(%rbp), %rsi
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
	leaq	-224(%rbp), %rdx
	leaq	-240(%rbp), %rsi
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
	leaq	-224(%rbp), %rdx
	leaq	-240(%rbp), %rsi
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
	leaq	-224(%rbp), %rdx
	leaq	-240(%rbp), %rsi
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
	leaq	-224(%rbp), %rdx
	leaq	-240(%rbp), %rsi
	leaq	-208(%rbp), %rdi
	call	__gmpz_mul
	cmpq	%r12, %rbx
	jne	.L266
.L269:
	xorl	%edi, %edi
	movq	%r13, %rsi
	call	getrusage
	fildq	-192(%rbp)
	movq	%rbx, %rsi
	xorl	%eax, %eax
	fmuls	.LC26(%rip)
	movl	$.LC21, %edi
	fildq	-184(%rbp)
	faddp	%st, %st(1)
	fildq	-272(%rbp)
	fsubrp	%st, %st(1)
	fisttpq	-272(%rbp)
	movq	-272(%rbp), %r12
	call	printf
	xorl	%eax, %eax
	movl	$.LC22, %edi
	movq	%r12, %rsi
	call	printf
	cmpq	$249999, %r12
	jle	.L267
	movq	%rbx, %rsi
	movl	$.LC27, %edi
	xorl	%eax, %eax
	call	printf
	movq	%r12, %rsi
	movl	$.LC28, %edi
	xorl	%eax, %eax
	call	printf
	vxorpd	%xmm12, %xmm12, %xmm12
	movl	$.LC29, %edi
	movl	$1, %eax
	vcvtsi2sdq	%r12, %xmm12, %xmm11
	vcvtsi2sdq	%rbx, %xmm12, %xmm13
	vdivsd	%xmm13, %xmm11, %xmm0
	call	printf
#APP
# 369 "test4.c" 1
	mfence
# 0 "" 2
# 371 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	movq	%r15, %rdi
	xorl	%ebx, %ebx
	call	strlen
	movq	%rax, %rdi
	movq	%rax, %r8
	andl	$7, %edi
	je	.L270
	movzbl	(%r14), %esi
	cmpb	%sil, (%r15)
	jne	.L411
	movl	$1, %ebx
	cmpq	$1, %rdi
	je	.L270
	cmpq	$2, %rdi
	je	.L380
	cmpq	$3, %rdi
	je	.L381
	cmpq	$4, %rdi
	je	.L382
	cmpq	$5, %rdi
	je	.L383
	cmpq	$6, %rdi
	je	.L384
	movl	$2, %r11d
	movzbl	-1(%r14,%r11), %ecx
	cmpb	%cl, (%r15,%rbx)
	jne	.L411
	movq	%r11, %rbx
.L384:
	movzbl	(%r14,%rbx), %eax
	leaq	1(%rbx), %rdx
	cmpb	%al, (%r15,%rbx)
	jne	.L411
	movq	%rdx, %rbx
.L383:
	movzbl	(%r14,%rbx), %r13d
	leaq	1(%rbx), %r9
	cmpb	%r13b, (%r15,%rbx)
	jne	.L411
	movq	%r9, %rbx
.L382:
	movzbl	(%r14,%rbx), %r12d
	leaq	1(%rbx), %r10
	cmpb	%r12b, (%r15,%rbx)
	jne	.L411
	movq	%r10, %rbx
.L381:
	movzbl	(%r14,%rbx), %esi
	leaq	1(%rbx), %rdi
	cmpb	%sil, (%r15,%rbx)
	jne	.L411
	movq	%rdi, %rbx
.L380:
	movzbl	(%r14,%rbx), %ecx
	leaq	1(%rbx), %r11
	cmpb	%cl, (%r15,%rbx)
	jne	.L411
	movq	%r11, %rbx
	cmpq	%rbx, %r8
	je	.L424
.L271:
	movzbl	(%r14,%rbx), %eax
	leaq	1(%rbx), %rdx
	cmpb	%al, (%r15,%rbx)
	jne	.L411
	movzbl	(%r14,%rdx), %r13d
	movq	%rdx, %rbx
	leaq	1(%rdx), %r9
	cmpb	%r13b, (%r15,%rdx)
	jne	.L411
	movzbl	(%r14,%r9), %r10d
	movq	%r9, %rbx
	cmpb	%r10b, (%r15,%r9)
	jne	.L411
	movzbl	2(%r14,%rdx), %edi
	leaq	2(%rdx), %rbx
	leaq	3(%rdx), %r12
	cmpb	%dil, 2(%r15,%rdx)
	jne	.L411
	movzbl	3(%r14,%rdx), %esi
	movq	%r12, %rbx
	leaq	4(%rdx), %r11
	cmpb	%sil, 3(%r15,%rdx)
	jne	.L411
	movzbl	4(%r14,%rdx), %eax
	movq	%r11, %rbx
	leaq	5(%rdx), %rcx
	cmpb	%al, 4(%r15,%rdx)
	jne	.L411
	movzbl	5(%r14,%rdx), %r13d
	movq	%rcx, %rbx
	leaq	6(%rdx), %r9
	cmpb	%r13b, 5(%r15,%rdx)
	jne	.L411
	movzbl	6(%r14,%rdx), %r12d
	movq	%r9, %rbx
	leaq	7(%rdx), %r10
	cmpb	%r12b, 6(%r15,%rdx)
	jne	.L411
	movq	%r10, %rbx
.L270:
	cmpq	%rbx, %r8
	jne	.L271
.L424:
	movl	$.LC34, %esi
	movl	$.LC35, %edi
	xorl	%eax, %eax
	call	printf
	addq	$1024, %rsp
	popq	%rbx
	popq	%r8
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r8), %rsp
	.cfi_def_cfa 7, 8
	ret
.L411:
	.cfi_restore_state
	movl	$.LC30, %edi
	call	puts
	movsbl	(%r14,%rbx), %ecx
	movl	%ebx, %esi
	xorl	%eax, %eax
	movsbl	(%r15,%rbx), %edx
	movl	$.LC31, %edi
	call	printf
	movq	%r14, %rsi
	movl	$.LC32, %edi
	xorl	%eax, %eax
	call	printf
	movl	$.LC33, %edi
	movq	%r15, %rsi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6648:
	.size	test, .-test
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB6649:
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
.LFE6649:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC23:
	.long	1394455622
	.long	1060595063
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC26:
	.long	1232348160
	.ident	"GCC: (GNU) 14.2.1 20250110 (Red Hat 14.2.1-7)"
	.section	.note.GNU-stack,"",@progbits
