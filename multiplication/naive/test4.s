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
.LFB6646:
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
.LFE6646:
	.size	print_array, .-print_array
	.p2align 4
	.globl	generate_random_numbers
	.type	generate_random_numbers, @function
generate_random_numbers:
.LFB6647:
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
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	xorl	%r14d, %r14d
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$704, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	call	malloc
	movl	$32, %edi
	movq	%rax, %r13
	call	malloc
	movl	$65, %edi
	movq	%rax, -320(%rbp)
	call	malloc
	leaq	-288(%rbp), %rdi
	movq	%rax, -736(%rbp)
	call	__gmpz_init
	leaq	-272(%rbp), %rdi
	call	__gmpz_init
	leaq	-256(%rbp), %rdi
	call	__gmpz_init
	movl	$512, %edx
	movl	$64, %esi
	leaq	-296(%rbp), %rdi
	call	posix_memalign
	movq	-320(%rbp), %r11
	testl	%eax, %eax
	jne	.L256
	movq	-296(%rbp), %r14
.L256:
	xorl	%eax, %eax
	movl	$64, %ecx
	movq	%r14, %rdi
	movq	%r13, %r12
	rep stosq
	xorl	%edi, %edi
	movq	%r11, -320(%rbp)
	leaq	32(%r13), %rbx
	call	time
	movl	%eax, %edi
	call	srand
	movq	-320(%rbp), %r15
	.p2align 4
	.p2align 3
.L257:
	call	rand
	addq	$4, %r12
	movl	%eax, -4(%r12)
	cmpq	%r12, %rbx
	jne	.L257
	movq	%r15, %r12
	leaq	32(%r15), %rbx
	.p2align 4
	.p2align 3
.L258:
	call	rand
	addq	$4, %r12
	movl	%eax, -4(%r12)
	cmpq	%r12, %rbx
	jne	.L258
	movq	%r15, %r12
	xorl	%ebx, %ebx
.L259:
	leaq	-288(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	0(%r13,%rbx), %edx
	leaq	-288(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	leaq	-272(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	(%r12,%rbx), %edx
	leaq	-272(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	leaq	-288(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	4(%r13,%rbx), %edx
	leaq	-288(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	leaq	-272(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	4(%r12,%rbx), %edx
	leaq	-272(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	leaq	-288(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	8(%r13,%rbx), %edx
	leaq	-288(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	leaq	-272(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	8(%r12,%rbx), %edx
	leaq	-272(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	leaq	-288(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	12(%r13,%rbx), %edx
	leaq	-288(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	leaq	-272(%rbp), %rsi
	movl	$32, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movl	12(%r12,%rbx), %edx
	addq	$16, %rbx
	leaq	-272(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	cmpq	$32, %rbx
	jne	.L259
	movl	$1, %esi
	movl	$.LC18, %edi
	xorl	%eax, %eax
	movq	%r12, -320(%rbp)
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
	prefetcht0	0(%r13)
	call	start_perf
	vmovd	0(%r13), %xmm15
	xorl	%edi, %edi
	vmovd	4(%r13), %xmm1
	vmovd	8(%r13), %xmm2
	movq	-320(%rbp), %rdx
	vpunpcklqdq	%xmm1, %xmm15, %xmm12
	vpunpcklqdq	%xmm15, %xmm1, %xmm4
	vpunpcklqdq	%xmm15, %xmm15, %xmm0
	vpunpcklqdq	%xmm2, %xmm1, %xmm13
	vmovd	(%rdx), %xmm10
	vinserti32x4	$0x1, %xmm4, %ymm0, %ymm5
	vmovd	4(%rdx), %xmm6
	vinserti32x4	$0x1, %xmm12, %ymm13, %ymm3
	vmovd	12(%rdx), %xmm7
	vmovd	12(%r13), %xmm0
	prefetcht0	(%rdx)
	vinserti32x8	$0x1, %ymm3, %zmm5, %zmm16
	vmovd	8(%rdx), %xmm5
	vpunpcklqdq	%xmm6, %xmm10, %xmm14
	vpunpcklqdq	%xmm10, %xmm6, %xmm3
	vmovq	%xmm0, %rsi
	movq	%rdx, -640(%rbp)
	vpunpcklqdq	%xmm5, %xmm10, %xmm11
	vpunpcklqdq	%xmm5, %xmm7, %xmm8
	vinserti32x4	$0x1, %xmm11, %ymm14, %ymm1
	vmovd	16(%r13), %xmm11
	vinserti32x4	$0x1, %xmm8, %ymm3, %ymm9
	vmovdqa	%xmm8, -320(%rbp)
	vinserti32x8	$0x1, %ymm9, %zmm1, %zmm4
	vpunpcklqdq	%xmm0, %xmm2, %xmm1
	vpunpcklqdq	%xmm15, %xmm11, %xmm8
	vinserti32x4	$0x1, %xmm12, %ymm1, %ymm14
	vinserti32x4	$0x1, %xmm1, %ymm12, %ymm12
	vinserti32x4	$0x1, %xmm8, %ymm1, %ymm9
	vpmuldq	%zmm4, %zmm16, %zmm21
	vpunpcklqdq	%xmm6, %xmm5, %xmm8
	vinserti32x8	$0x1, %ymm9, %zmm14, %zmm17
	vmovd	20(%rdx), %xmm14
	vmovdqa	%xmm8, -336(%rbp)
	vpunpcklqdq	%xmm14, %xmm10, %xmm4
	vinserti32x4	$0x1, %xmm4, %ymm8, %ymm0
	vmovd	16(%rdx), %xmm8
	vpunpcklqdq	%xmm7, %xmm8, %xmm7
	vpunpcklqdq	%xmm8, %xmm14, %xmm8
	vinserti32x4	$0x1, %xmm7, %ymm3, %ymm9
	vinserti32x8	$0x1, %ymm0, %zmm9, %zmm4
	vmovq	%rsi, %xmm9
	vpmuldq	%zmm4, %zmm17, %zmm22
	vmovd	20(%r13), %xmm4
	vpunpcklqdq	%xmm11, %xmm9, %xmm9
	vpunpcklqdq	%xmm15, %xmm4, %xmm15
	vinserti32x4	$0x1, %xmm13, %ymm15, %ymm0
	vmovd	24(%rdx), %xmm15
	vinserti32x4	$0x1, %xmm9, %ymm13, %ymm13
	vinserti32x8	$0x1, %ymm0, %zmm13, %zmm19
	vmovdqa	%xmm8, %xmm0
	vpunpcklqdq	%xmm15, %xmm10, %xmm10
	vmovdqa64	%zmm22, 64(%r14)
	vinserti32x4	$0x1, %xmm8, %ymm10, %ymm10
	vinserti32x4	$0x1, -336(%rbp), %ymm7, %ymm8
	vmovdqa	%xmm0, -336(%rbp)
	vinserti32x8	$0x1, %ymm10, %zmm8, %zmm10
	vpmuldq	%zmm10, %zmm19, %zmm23
	vmovd	28(%rdx), %xmm10
	vpunpcklqdq	%xmm15, %xmm10, %xmm8
	vpunpcklqdq	%xmm10, %xmm6, %xmm6
	vpunpcklqdq	%xmm10, %xmm5, %xmm5
	vmovdqa	%xmm8, -352(%rbp)
	vinserti32x4	$0x1, %xmm0, %ymm8, %ymm8
	vmovdqa	-320(%rbp), %xmm0
	vinserti32x4	$0x1, %xmm3, %ymm0, %ymm3
	vmovdqa64	%zmm23, 128(%r14)
	vinserti32x8	$0x1, %ymm8, %zmm3, %zmm20
	vmovd	24(%r13), %xmm8
	vpunpcklqdq	%xmm8, %xmm4, %xmm1
	vpunpcklqdq	%xmm4, %xmm11, %xmm4
	vinserti32x4	$0x1, %xmm1, %ymm9, %ymm9
	vmovdqa	%xmm1, %xmm0
	vinserti32x8	$0x1, %ymm12, %zmm9, %zmm3
	vmovd	28(%r13), %xmm12
	vpmuldq	%zmm20, %zmm3, %zmm18
	vpunpcklqdq	%xmm12, %xmm8, %xmm1
	vpunpcklqdq	%xmm2, %xmm12, %xmm2
	vpunpcklqdq	%xmm8, %xmm12, %xmm8
	vinserti32x4	$0x1, %xmm1, %ymm4, %ymm11
	vinserti32x8	$0x1, %ymm13, %zmm11, %zmm13
	vmovdqa	%xmm0, %xmm11
	vinserti32x4	$0x1, %xmm2, %ymm0, %ymm0
	vinserti32x8	$0x1, %ymm9, %zmm0, %zmm2
	vpunpcklqdq	%xmm14, %xmm15, %xmm9
	vmovdqa	-320(%rbp), %xmm0
	vpunpcklqdq	%xmm10, %xmm15, %xmm15
	vpmuldq	%zmm20, %zmm13, %zmm3
	vinserti32x4	$0x1, %xmm7, %ymm9, %ymm13
	vmovdqa64	%zmm18, 192(%r14)
	vinserti32x4	$0x1, %xmm9, %ymm5, %ymm9
	vinserti32x4	$0x1, %xmm6, %ymm0, %ymm6
	vmovq	%rsi, %xmm0
	vpunpcklqdq	%xmm10, %xmm14, %xmm14
	vinserti32x8	$0x1, %ymm13, %zmm6, %zmm13
	vinserti32x4	$0x1, %xmm4, %ymm1, %ymm6
	vinserti32x4	$0x1, %xmm11, %ymm1, %ymm1
	vpmuldq	%zmm13, %zmm2, %zmm2
	vpunpcklqdq	%xmm0, %xmm12, %xmm13
	vinserti32x4	$0x1, %xmm15, %ymm14, %ymm10
	vinserti32x4	$0x1, %xmm4, %ymm13, %ymm4
	vextracti64x4	$0x0, %zmm22, %ymm15
	vextracti64x4	$0x0, %zmm18, %ymm14
	vmovdqa64	%zmm3, 256(%r14)
	vinserti32x8	$0x1, %ymm6, %zmm4, %zmm6
	vpunpcklqdq	%xmm12, %xmm12, %xmm4
	vmovq	%xmm15, %rdx
	vinserti32x4	$0x1, %xmm4, %ymm8, %ymm12
	vinserti32x8	$0x1, %ymm12, %zmm1, %zmm11
	vextracti64x4	$0x1, %zmm21, %ymm12
	vextracti64x4	$0x1, %zmm23, %ymm1
	vmovdqa64	%zmm2, 320(%r14)
	vmovq	%xmm12, %r11
	vmovdqa	-352(%rbp), %xmm13
	vpextrq	$1, %xmm12, %rcx
	vinserti32x4	$0x1, %xmm13, %ymm7, %ymm7
	vinserti32x8	$0x1, %ymm7, %zmm9, %zmm0
	vpmuldq	%zmm0, %zmm6, %zmm5
	vextracti64x4	$0x0, %zmm21, %ymm0
	vmovdqa	-336(%rbp), %xmm6
	vextracti128	$0x1, %ymm0, %xmm8
	vmovdqa	%xmm0, %xmm4
	vpextrq	$1, %xmm0, %r8
	vinserti32x4	$0x1, %xmm13, %ymm6, %ymm13
	vpextrq	$1, %xmm8, %r10
	vextracti64x4	$0x1, %zmm22, %ymm6
	vinserti32x8	$0x1, %ymm10, %zmm13, %zmm7
	addq	%r10, %r11
	vpextrq	$1, %xmm15, %r10
	vpmuldq	%zmm7, %zmm11, %zmm9
	vextracti128	$0x1, %ymm12, %xmm11
	adcq	$0, %rdi
	addq	%rcx, %r11
	vmovq	%xmm11, %rbx
	vpextrq	$1, %xmm11, %r12
	adcq	$0, %rdi
	xorl	%esi, %esi
	addq	%rbx, %r12
	movq	%r11, -432(%rbp)
	vextracti128	$0x1, %ymm15, %xmm10
	movq	-432(%rbp), %rax
	adcq	$0, %rsi
	addq	%rdx, %r12
	movq	%rdi, -424(%rbp)
	vmovq	%xmm10, %rcx
	movq	%r12, %r11
	adcq	$0, %rsi
	movq	%rax, -560(%rbp)
	vmovq	%xmm6, %rax
	addq	%r10, %r11
	vextracti128	$0x1, %ymm6, %xmm7
	vpextrq	$1, %xmm6, %rbx
	vmovdqa64	%zmm5, 384(%r14)
	adcq	$0, %rsi
	movq	%r11, -448(%rbp)
	movq	-448(%rbp), %rdi
	vextracti64x4	$0x0, %zmm23, %ymm0
	movq	%rsi, -440(%rbp)
	vpextrq	$1, %xmm10, %rsi
	vpextrq	$1, %xmm7, -320(%rbp)
	vmovq	%xmm7, %r12
	movq	%rdi, -576(%rbp)
	xorl	%edi, %edi
	addq	%rcx, %rsi
	movq	-320(%rbp), %r10
	adcq	$0, %rdi
	addq	%rax, %rsi
	vmovq	%xmm0, %r11
	vmovdqa64	%zmm9, 448(%r14)
	adcq	$0, %rdi
	addq	%rbx, %rsi
	vextracti128	$0x1, %ymm0, %xmm12
	adcq	$0, %rdi
	addq	%r12, %rsi
	vpextrq	$1, %xmm0, %rcx
	adcq	$0, %rdi
	xorl	%r12d, %r12d
	addq	%r10, %r11
	movq	%rsi, -464(%rbp)
	vmovq	%xmm12, %rax
	adcq	$0, %r12
	addq	%rcx, %r11
	movq	-464(%rbp), %rdx
	adcq	$0, %r12
	vpextrq	$1, %xmm12, %rbx
	addq	%rax, %r11
	movq	%rdi, -456(%rbp)
	vextracti128	$0x1, %ymm1, %xmm15
	vmovq	%xmm1, %rsi
	adcq	$0, %r12
	addq	%rbx, %r11
	adcq	$0, %r12
	vmovq	%xmm15, %rax
	addq	%rsi, %r11
	movq	%rdx, -592(%rbp)
	adcq	$0, %r12
	vpextrq	$1, %xmm1, %r10
	movq	%r11, -480(%rbp)
	xorl	%r11d, %r11d
	vpextrq	$1, %xmm15, %rdx
	addq	%r10, %rax
	vmovq	%xmm14, %rcx
	movq	%r12, -472(%rbp)
	adcq	$0, %r11
	addq	%rdx, %rax
	vextracti128	$0x1, %ymm14, %xmm6
	movq	-480(%rbp), %rdi
	adcq	$0, %r11
	addq	%rcx, %rax
	vpextrq	$1, %xmm14, %rbx
	vmovq	%xmm6, %rsi
	adcq	$0, %r11
	addq	%rbx, %rax
	movq	%rdi, -608(%rbp)
	adcq	$0, %r11
	vextracti64x4	$0x1, %zmm18, %ymm13
	addq	%rsi, %rax
	vextracti128	$0x1, %ymm13, %xmm0
	vpextrq	$1, %xmm6, %r12
	adcq	$0, %r11
	vmovq	%xmm13, %r10
	addq	%r12, %rax
	vpextrq	$1, %xmm13, %rbx
	vmovq	%xmm0, %rcx
	adcq	$0, %r11
	xorl	%edx, %edx
	addq	%r10, %rbx
	adcq	$0, %rdx
	vpextrq	$1, %xmm0, %rsi
	addq	%rcx, %rbx
	movq	%rax, -496(%rbp)
	vmovq	%xmm3, %r12
	adcq	$0, %rdx
	addq	%rsi, %rbx
	movq	-496(%rbp), %rdi
	vextracti128	$0x1, %ymm3, %xmm1
	vpextrq	$1, %xmm3, %rax
	adcq	$0, %rdx
	addq	%r12, %rbx
	adcq	$0, %rdx
	addq	%rax, %rbx
	movq	%r11, -488(%rbp)
	vmovq	%xmm1, %r11
	adcq	$0, %rdx
	movq	%rdi, -624(%rbp)
	addq	%r11, %rbx
	vpextrq	$1, %xmm1, %rdi
	adcq	$0, %rdx
	addq	%rdi, %rbx
	vextracti64x4	$0x1, %zmm3, %ymm3
	adcq	$0, %rdx
	movq	%rbx, -336(%rbp)
	vextracti128	$0x1, %ymm3, %xmm15
	vmovq	%xmm3, %rsi
	movq	%rdx, -328(%rbp)
	movq	-336(%rbp), %rdx
	vpextrq	$1, %xmm3, %rcx
	vmovq	%xmm15, %r12
	vpextrq	$1, %xmm15, %rax
	vmovq	%xmm2, %r11
	vextracti128	$0x1, %ymm2, %xmm6
	movq	%rdx, -512(%rbp)
	xorl	%edx, %edx
	addq	%rsi, %rcx
	vpextrq	$1, %xmm2, %rdi
	adcq	$0, %rdx
	addq	%r12, %rcx
	vextracti64x4	$0x1, %zmm2, %ymm2
	adcq	$0, %rdx
	addq	%rax, %rcx
	vmovq	%xmm6, %r10
	adcq	$0, %rdx
	addq	%r11, %rcx
	vpextrq	$1, %xmm6, %r12
	adcq	$0, %rdx
	addq	%rdi, %rcx
	vmovq	%xmm2, %rax
	adcq	$0, %rdx
	addq	%r10, %rcx
	vextracti128	$0x1, %ymm2, %xmm7
	adcq	$0, %rdx
	xorl	%r11d, %r11d
	vpextrq	$1, %xmm2, %rdi
	addq	%r12, %rax
	vmovq	%xmm7, %r10
	adcq	$0, %r11
	addq	%rdi, %rax
	movq	%rcx, %rbx
	adcq	$0, %r11
	movq	%rcx, -352(%rbp)
	addq	%r10, %rax
	vpextrq	$1, %xmm7, %rcx
	adcq	$0, %r11
	movq	%rdx, -344(%rbp)
	addq	%rcx, %rax
	vmovq	%xmm5, %rdx
	adcq	$0, %r11
	addq	%rdx, %rax
	vextracti128	$0x1, %ymm5, %xmm12
	movq	-352(%rbp), %rsi
	adcq	$0, %r11
	movq	%rax, -368(%rbp)
	vpextrq	$1, %xmm12, %r10
	xorl	%edi, %edi
	vextracti128	$0x1, %ymm9, %xmm14
	movq	%rsi, 64(%r14)
	vmovq	%xmm8, %r15
	movq	-368(%rbp), %r12
	movq	%rax, -528(%rbp)
	vmovq	%xmm12, %rax
	leaq	(%r15,%r8), %r9
	movq	%r11, -360(%rbp)
	vpextrq	$1, %xmm5, %r11
	vextracti64x4	$0x1, %zmm5, %ymm5
	addq	%r11, %rax
	vmovq	%xmm5, %rcx
	vextracti128	$0x1, %ymm5, %xmm3
	movq	%r12, 72(%r14)
	adcq	$0, %rdi
	addq	%r10, %rax
	vpextrq	$1, %xmm5, %rdx
	adcq	$0, %rdi
	addq	%rcx, %rax
	vmovq	%xmm3, %r11
	vpextrq	$1, %xmm3, %r10
	adcq	$0, %rdi
	addq	%rdx, %rax
	adcq	$0, %rdi
	vmovq	%xmm9, %rdx
	xorl	%ecx, %ecx
	addq	%r11, %r10
	movq	%rax, -384(%rbp)
	adcq	$0, %rcx
	addq	%rdx, %r10
	movq	-384(%rbp), %r12
	movq	%rax, -544(%rbp)
	vpextrq	$1, %xmm9, %rax
	adcq	$0, %rcx
	vmovq	%xmm14, %r11
	addq	%rax, %r10
	movq	%r12, 80(%r14)
	vextracti64x4	$0x1, %zmm9, %ymm9
	movq	%r10, -400(%rbp)
	movq	%r10, %r12
	adcq	$0, %rcx
	vpextrq	$1, %xmm14, %r10
	movq	-400(%rbp), %rsi
	xorl	%edx, %edx
	addq	%r11, %r10
	vmovq	%xmm9, %rax
	adcq	$0, %rdx
	movq	%rdi, -376(%rbp)
	vextracti128	$0x1, %ymm9, %xmm6
	movq	%rsi, 88(%r14)
	movq	%r10, %rsi
	movq	%rdx, %rdi
	movq	%r9, %rdx
	addq	%rax, %rsi
	movq	%rcx, -392(%rbp)
	vmovq	%xmm6, %r11
	movl	%r9d, %r9d
	movq	%rsi, -416(%rbp)
	adcq	$0, %rdi
	movq	-416(%rbp), %rcx
	shrq	$32, %rdx
	movq	%rdi, -408(%rbp)
	vmovq	%xmm4, %rdi
	movq	%rsi, %r10
	vpextrq	$1, %xmm9, %rsi
	movq	%rcx, 96(%r14)
	movq	-560(%rbp), %rcx
	addl	%edi, %edx
	addq	%r11, %rsi
	movl	%edx, %r11d
	addl	%r15d, %r8d
	movl	%edi, %r15d
	movq	%rsi, 104(%r14)
	movq	%rcx, %rdx
	vmovd	%ecx, %xmm4
	vpextrq	$1, %xmm6, %rax
	shrq	$32, %rdx
	vmovq	%xmm4, %rcx
	movq	%rax, 112(%r14)
	addl	%edx, %r8d
	movq	%r11, %rdx
	subq	%r15, %rdx
	movl	%r8d, %r8d
	shrq	$63, %rdx
	movq	%r8, %r15
	salq	$32, %rdx
	subq	%r9, %r15
	addq	%rdi, %rdx
	shrq	$63, %r15
	movabsq	$-4294967296, %rdi
	andq	%rdi, %rdx
	orq	%r11, %rdx
	movq	-576(%rbp), %r11
	addq	%r15, %rdx
	movq	-592(%rbp), %r15
	movq	%rdx, (%r14)
	movq	%r11, %r9
	movl	-432(%rbp), %edx
	movl	%r11d, %r11d
	shrq	$32, %r9
	movq	%r15, %rdi
	vmovd	%r15d, %xmm2
	addl	%edx, %r9d
	movl	-448(%rbp), %edx
	shrq	$32, %rdi
	vmovq	%xmm2, %r15
	addl	%edx, %edi
	movq	%r9, %rdx
	subq	%rcx, %rdx
	movq	-608(%rbp), %rcx
	shrq	$63, %rdx
	addq	%r8, %rdx
	movq	%rdi, %r8
	subq	%r11, %r8
	salq	$32, %rdx
	movq	-624(%rbp), %r11
	orq	%r9, %rdx
	shrq	$63, %r8
	movl	-464(%rbp), %r9d
	addq	%r8, %rdx
	movq	%rcx, %r8
	vmovd	%r11d, %xmm13
	movl	%ecx, %ecx
	shrq	$32, %r8
	movq	%rdx, 8(%r14)
	movl	-480(%rbp), %edx
	addl	%r9d, %r8d
	movq	%r11, %r9
	shrq	$32, %r9
	addl	%edx, %r9d
	movq	%r8, %rdx
	subq	%r15, %rdx
	movl	-336(%rbp), %r15d
	shrq	$63, %rdx
	addq	%rdi, %rdx
	movq	%r9, %rdi
	subq	%rcx, %rdi
	salq	$32, %rdx
	movq	-512(%rbp), %rcx
	orq	%r8, %rdx
	shrq	$63, %rdi
	addq	%rdi, %rdx
	movq	%rcx, %r8
	movq	%rbx, %rdi
	movl	%ebx, %ebx
	movq	%rdx, 16(%r14)
	movl	-496(%rbp), %edx
	shrq	$32, %r8
	shrq	$32, %rdi
	addl	%r15d, %edi
	movl	-368(%rbp), %r15d
	addl	%edx, %r8d
	vmovq	%xmm13, %rdx
	movq	%r8, %r11
	subq	%rdx, %r11
	shrq	$63, %r11
	addq	%r9, %r11
	movl	%ecx, %r9d
	movq	%rdi, %rcx
	subq	%r9, %rcx
	salq	$32, %r11
	movq	-528(%rbp), %r9
	orq	%r8, %r11
	shrq	$63, %rcx
	addq	%rcx, %r11
	movq	%r9, %r8
	movl	-352(%rbp), %ecx
	shrq	$32, %r8
	movq	%r11, 24(%r14)
	movq	-544(%rbp), %r11
	addl	%r8d, %ecx
	movq	%rcx, %rdx
	movq	%r11, %r8
	movl	%r11d, %r11d
	subq	%rbx, %rdx
	shrq	$32, %r8
	movl	-400(%rbp), %ebx
	shrq	$63, %rdx
	addl	%r15d, %r8d
	movq	%r10, %r15
	movl	%r10d, %r10d
	addq	%rdi, %rdx
	movl	%r9d, %edi
	movl	-384(%rbp), %r9d
	salq	$32, %rdx
	orq	%rcx, %rdx
	movq	%r8, %rcx
	subq	%rdi, %rcx
	movq	%rax, %rdi
	shrq	$63, %rcx
	addq	%rcx, %rdx
	movq	%r12, %rcx
	movl	%r12d, %r12d
	shrq	$32, %rcx
	movq	%rdx, 32(%r14)
	shrq	$32, %r15
	addl	%r9d, %ecx
	addl	%ebx, %r15d
	shrq	$32, %rdi
	movq	%rcx, %rdx
	addl	%esi, %edi
	subq	%r11, %rdx
	movl	%edi, %r11d
	leaq	56(%r14), %rdi
	shrq	$63, %rdx
	movq	%rdi, -496(%rbp)
	addq	%r8, %rdx
	movl	-416(%rbp), %r8d
	salq	$32, %rdx
	orq	%rcx, %rdx
	movq	%r15, %rcx
	subq	%r12, %rcx
	shrq	$63, %rcx
	addq	%rcx, %rdx
	movq	%rsi, %rcx
	movl	%esi, %esi
	shrq	$32, %rcx
	movq	%rdx, 40(%r14)
	movl	%eax, %edx
	addl	%r8d, %ecx
	movq	%rcx, %r9
	subq	%r10, %r9
	movabsq	$-4294967296, %r10
	shrq	$63, %r9
	addq	%r15, %r9
	movq	-320(%rbp), %r15
	salq	$32, %r9
	shrq	$32, %r15
	orq	%rcx, %r9
	movq	%r11, %rcx
	leal	(%r15,%rax), %ebx
	subq	%rsi, %rcx
	movq	%rbx, %r8
	shrq	$63, %rcx
	subq	%rdx, %r8
	addq	%r9, %rcx
	shrq	$63, %r8
	movq	%rcx, 48(%r14)
	leaq	(%r11,%r8), %rax
	salq	$32, %r8
	leaq	112(%r14), %r11
	salq	$32, %rax
	movq	%r11, -448(%rbp)
	orq	%rbx, %rax
	subq	%r8, %rax
	andq	%r10, %rax
	orq	%rdx, %rax
	movq	%rax, 56(%r14)
	xorl	%eax, %eax
	vzeroupper
	call	stop_perf
	movl	$.LC19, %esi
	movl	$.LC20, %edi
	call	fopen
	leaq	-240(%rbp), %rsi
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
	leaq	-272(%rbp), %rdx
	leaq	-288(%rbp), %rsi
	leaq	-256(%rbp), %rdi
	call	__gmpz_mul
	leaq	-256(%rbp), %rdx
	movl	$16, %esi
	xorl	%edi, %edi
	call	__gmpz_get_str
	movq	%rax, -744(%rbp)
#APP
# 336 "test4.c" 1
	mfence
# 0 "" 2
# 338 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	vmovd	0(%r13), %xmm15
	vmovd	4(%r13), %xmm7
	prefetcht0	0(%r13)
	vmovd	8(%r13), %xmm0
	movq	-640(%rbp), %r11
	vpunpcklqdq	%xmm7, %xmm15, %xmm14
	vpunpcklqdq	%xmm15, %xmm7, %xmm12
	vpunpcklqdq	%xmm15, %xmm15, %xmm5
	vpunpcklqdq	%xmm0, %xmm7, %xmm10
	vmovd	(%r11), %xmm6
	vinserti32x4	$0x1, %xmm12, %ymm5, %ymm1
	vmovd	8(%r11), %xmm3
	vinserti32x4	$0x1, %xmm14, %ymm10, %ymm8
	vmovd	4(%r11), %xmm4
	prefetcht0	(%r11)
	movq	%r11, %r12
	vinserti32x8	$0x1, %ymm8, %zmm1, %zmm24
	vmovd	12(%r11), %xmm8
	vmovd	12(%r13), %xmm7
	vpunpcklqdq	%xmm3, %xmm6, %xmm12
	vpunpcklqdq	%xmm6, %xmm4, %xmm9
	vpunpcklqdq	%xmm4, %xmm6, %xmm5
	vmovq	%xmm3, %r9
	vpunpcklqdq	%xmm3, %xmm8, %xmm11
	vinserti32x4	$0x1, %xmm12, %ymm5, %ymm1
	vmovq	%xmm7, %rcx
	vinserti32x4	$0x1, %xmm11, %ymm9, %ymm2
	vmovdqa	%xmm11, %xmm13
	vmovd	16(%r13), %xmm11
	vinserti32x8	$0x1, %ymm2, %zmm1, %zmm3
	vpunpcklqdq	%xmm7, %xmm0, %xmm1
	vmovd	20(%r11), %xmm7
	vpunpcklqdq	%xmm15, %xmm11, %xmm2
	vpmuldq	%zmm3, %zmm24, %zmm25
	vmovq	%r9, %xmm3
	vmovq	%xmm11, %rsi
	vinserti32x4	$0x1, %xmm2, %ymm1, %ymm12
	vinserti32x4	$0x1, %xmm14, %ymm1, %ymm5
	vpunpcklqdq	%xmm7, %xmm6, %xmm2
	vpunpcklqdq	%xmm4, %xmm3, %xmm11
	vinserti32x8	$0x1, %ymm12, %zmm5, %zmm26
	vinserti32x4	$0x1, %xmm2, %ymm11, %ymm12
	vmovd	16(%r11), %xmm2
	vinserti32x4	$0x1, %xmm1, %ymm14, %ymm1
	vpunpcklqdq	%xmm8, %xmm2, %xmm5
	vpunpcklqdq	%xmm2, %xmm7, %xmm2
	vinserti32x4	$0x1, %xmm5, %ymm9, %ymm8
	vinserti32x4	$0x1, %xmm11, %ymm5, %ymm11
	vinserti32x8	$0x1, %ymm12, %zmm8, %zmm3
	vmovd	20(%r13), %xmm8
	vmovq	%rsi, %xmm12
	vpmuldq	%zmm3, %zmm26, %zmm27
	vmovq	%rcx, %xmm3
	vpunpcklqdq	%xmm12, %xmm3, %xmm12
	vpunpcklqdq	%xmm15, %xmm8, %xmm15
	vinserti32x4	$0x1, %xmm10, %ymm15, %ymm15
	vinserti32x4	$0x1, %xmm12, %ymm10, %ymm10
	vinserti32x8	$0x1, %ymm15, %zmm10, %zmm28
	vmovd	24(%r11), %xmm15
	vpunpcklqdq	%xmm15, %xmm6, %xmm6
	vmovdqa64	%zmm27, 64(%r14)
	vinserti32x4	$0x1, %xmm2, %ymm6, %ymm3
	vinserti32x8	$0x1, %ymm3, %zmm11, %zmm6
	vpmuldq	%zmm6, %zmm28, %zmm29
	vmovd	28(%r11), %xmm6
	vpunpcklqdq	%xmm15, %xmm6, %xmm3
	vpunpcklqdq	%xmm6, %xmm4, %xmm4
	vinserti32x4	$0x1, %xmm2, %ymm3, %ymm11
	vmovdqa	%xmm3, -320(%rbp)
	vmovdqa	%xmm13, %xmm3
	vinserti32x4	$0x1, %xmm9, %ymm13, %ymm13
	vmovd	24(%r13), %xmm9
	vinserti32x8	$0x1, %ymm11, %zmm13, %zmm30
	vmovdqa64	%zmm29, 128(%r14)
	vpunpcklqdq	%xmm9, %xmm8, %xmm14
	vinserti32x4	$0x1, %xmm14, %ymm12, %ymm12
	vmovdqa	%xmm14, %xmm13
	vinserti32x8	$0x1, %ymm1, %zmm12, %zmm11
	vmovq	%rsi, %xmm1
	vmovdqa	%xmm13, -336(%rbp)
	vpmuldq	%zmm30, %zmm11, %zmm31
	vmovd	28(%r13), %xmm11
	vpunpcklqdq	%xmm8, %xmm1, %xmm8
	vpunpcklqdq	%xmm11, %xmm9, %xmm14
	vpunpcklqdq	%xmm0, %xmm11, %xmm0
	vpunpcklqdq	%xmm9, %xmm11, %xmm9
	vinserti32x4	$0x1, %xmm14, %ymm8, %ymm1
	vinserti32x8	$0x1, %ymm10, %zmm1, %zmm10
	vmovdqa64	%zmm31, 192(%r14)
	vpmuldq	%zmm30, %zmm10, %zmm1
	vinserti32x4	$0x1, %xmm0, %ymm13, %ymm10
	vinserti32x4	$0x1, %xmm4, %ymm3, %ymm13
	vinserti32x8	$0x1, %ymm12, %zmm10, %zmm0
	vpunpcklqdq	%xmm7, %xmm15, %xmm10
	vmovq	%rcx, %xmm3
	vinserti32x4	$0x1, %xmm5, %ymm10, %ymm12
	vinserti32x4	$0x1, %xmm8, %ymm14, %ymm4
	vpunpcklqdq	%xmm6, %xmm15, %xmm15
	vinserti32x8	$0x1, %ymm12, %zmm13, %zmm12
	vpunpcklqdq	%xmm3, %xmm11, %xmm13
	vmovq	%r9, %xmm3
	vpmuldq	%zmm12, %zmm0, %zmm0
	vinserti32x4	$0x1, %xmm8, %ymm13, %ymm8
	vmovdqa	-320(%rbp), %xmm12
	vpunpcklqdq	%xmm6, %xmm3, %xmm13
	vinserti32x4	$0x1, %xmm10, %ymm13, %ymm10
	vpunpcklqdq	%xmm11, %xmm11, %xmm3
	vinserti32x4	$0x1, -336(%rbp), %ymm14, %ymm14
	vmovdqa64	%zmm1, 256(%r14)
	vinserti32x4	$0x1, %xmm12, %ymm5, %ymm5
	vpunpcklqdq	%xmm6, %xmm7, %xmm7
	vinserti32x4	$0x1, %xmm3, %ymm9, %ymm11
	vinserti32x4	$0x1, %xmm15, %ymm7, %ymm6
	vinserti32x8	$0x1, %ymm4, %zmm8, %zmm4
	vinserti32x4	$0x1, %xmm12, %ymm2, %ymm2
	vinserti32x8	$0x1, %ymm5, %zmm10, %zmm8
	vextracti64x4	$0x0, %zmm25, %ymm10
	vinserti32x8	$0x1, %ymm6, %zmm2, %zmm12
	vpmuldq	%zmm8, %zmm4, %zmm5
	vextracti128	$0x1, %ymm10, %xmm8
	vinserti32x8	$0x1, %ymm11, %zmm14, %zmm4
	vmovdqa64	%zmm0, 320(%r14)
	vextracti64x4	$0x1, %zmm25, %ymm9
	vpmuldq	%zmm12, %zmm4, %zmm13
	vpextrq	$1, %xmm8, %rbx
	vextracti128	$0x1, %ymm9, %xmm14
	vmovq	%xmm9, %r9
	vextracti64x4	$0x0, %zmm27, %ymm4
	vpextrq	$1, %xmm10, %rdi
	vmovq	%xmm8, %r8
	vpextrq	$1, %xmm9, %rdx
	addq	%rbx, %r9
	vmovq	%xmm14, %r10
	vpextrq	$1, %xmm14, %rax
	addq	%rdx, %r9
	xorl	%esi, %esi
	leaq	(%rdi,%r8), %r15
	addq	%r10, %rax
	vmovq	%xmm4, %rcx
	movq	%r9, -480(%rbp)
	adcq	$0, %rsi
	addq	%rcx, %rax
	movq	%r15, -656(%rbp)
	vpextrq	$1, %xmm4, %r15
	adcq	$0, %rsi
	addq	%r15, %rax
	vextracti128	$0x1, %ymm4, %xmm7
	vmovdqa64	%zmm5, 384(%r14)
	vmovq	%xmm7, %r10
	vextracti64x4	$0x1, %zmm27, %ymm2
	vmovdqa64	%zmm13, 448(%r14)
	vpextrq	$1, %xmm7, %rcx
	adcq	$0, %rsi
	movq	%rax, -512(%rbp)
	movq	-512(%rbp), %rbx
	vmovq	%xmm2, %rdx
	vextracti128	$0x1, %ymm2, %xmm12
	vpextrq	$1, %xmm2, %rax
	movq	%rsi, -504(%rbp)
	vmovdqa	%xmm10, %xmm3
	movq	%rbx, -672(%rbp)
	xorl	%ebx, %ebx
	addq	%r10, %rcx
	vmovq	%xmm12, %rsi
	adcq	$0, %rbx
	addq	%rdx, %rcx
	vextracti64x4	$0x0, %zmm29, %ymm10
	vpextrq	$1, %xmm12, -320(%rbp)
	adcq	$0, %rbx
	addq	%rax, %rcx
	movq	-320(%rbp), %r10
	vextracti128	$0x1, %ymm10, %xmm9
	adcq	$0, %rbx
	addq	%rsi, %rcx
	vmovq	%xmm9, %rax
	adcq	$0, %rbx
	movq	%rcx, -528(%rbp)
	xorl	%edx, %edx
	vpextrq	$1, %xmm10, %rcx
	movq	%rbx, -520(%rbp)
	vmovq	%xmm10, %rbx
	movq	-528(%rbp), %r15
	vextracti64x4	$0x1, %zmm29, %ymm11
	addq	%r10, %rbx
	vmovq	%xmm11, %r10
	vextracti128	$0x1, %ymm11, %xmm4
	adcq	$0, %rdx
	addq	%rcx, %rbx
	movq	%r15, -688(%rbp)
	vpextrq	$1, %xmm9, %r15
	movq	%rbx, %rcx
	adcq	$0, %rdx
	vextracti64x4	$0x0, %zmm31, %ymm15
	addq	%rax, %rcx
	movq	%rdx, %rsi
	vpextrq	$1, %xmm11, %rax
	movq	%rcx, %rbx
	adcq	$0, %rsi
	vextracti128	$0x1, %ymm15, %xmm2
	addq	%r15, %rbx
	vpextrq	$1, %xmm4, %r15
	vextracti64x4	$0x1, %zmm31, %ymm12
	adcq	$0, %rsi
	addq	%r10, %rbx
	vmovq	%xmm15, %r10
	adcq	$0, %rsi
	movq	%rbx, -544(%rbp)
	xorl	%ecx, %ecx
	movq	-544(%rbp), %rdx
	movq	%rsi, -536(%rbp)
	vpextrq	$1, %xmm15, %rsi
	vmovq	%xmm2, %rbx
	vextracti128	$0x1, %ymm12, %xmm10
	movq	%rdx, -696(%rbp)
	vmovq	%xmm4, %rdx
	vextracti128	$0x1, %ymm1, %xmm11
	vextracti128	$0x1, %ymm5, %xmm9
	addq	%rax, %rdx
	vextracti128	$0x1, %ymm13, %xmm15
	adcq	$0, %rcx
	addq	%r15, %rdx
	vpextrq	$1, %xmm10, %r15
	adcq	$0, %rcx
	addq	%r10, %rdx
	adcq	$0, %rcx
	addq	%rsi, %rdx
	vmovq	%xmm12, %rsi
	adcq	$0, %rcx
	movq	%rdx, %rax
	addq	%rbx, %rax
	movq	%rcx, %rdx
	vpextrq	$1, %xmm2, %rcx
	adcq	$0, %rdx
	addq	%rcx, %rax
	vpextrq	$1, %xmm12, %rcx
	adcq	$0, %rdx
	xorl	%ebx, %ebx
	addq	%rsi, %rcx
	movq	%rax, -560(%rbp)
	adcq	$0, %rbx
	movq	%rdx, -552(%rbp)
	vmovq	%xmm10, %rdx
	movq	-560(%rbp), %r10
	addq	%rdx, %rcx
	vmovq	%xmm1, %rax
	vmovq	%xmm11, %rsi
	adcq	$0, %rbx
	addq	%r15, %rcx
	movq	%r10, -576(%rbp)
	vpextrq	$1, %xmm1, %r10
	adcq	$0, %rbx
	addq	%rax, %rcx
	vpextrq	$1, %xmm11, %rdx
	adcq	$0, %rbx
	addq	%r10, %rcx
	vextracti64x4	$0x1, %zmm1, %ymm1
	adcq	$0, %rbx
	addq	%rsi, %rcx
	vmovq	%xmm1, %r10
	movq	%rcx, %r15
	adcq	$0, %rbx
	vextracti128	$0x1, %ymm1, %xmm4
	addq	%rdx, %r15
	vmovq	%xmm4, %rax
	vpextrq	$1, %xmm4, %rsi
	movq	%r15, -336(%rbp)
	movq	-336(%rbp), %rcx
	adcq	$0, %rbx
	vmovq	%xmm0, %r15
	movq	%rbx, -328(%rbp)
	xorl	%ebx, %ebx
	vextracti128	$0x1, %ymm0, %xmm2
	vpextrq	$1, %xmm0, %rdx
	movq	%rcx, -592(%rbp)
	vpextrq	$1, %xmm1, %rcx
	vextracti64x4	$0x1, %zmm0, %ymm0
	addq	%r10, %rcx
	vmovq	%xmm2, %r10
	vextracti128	$0x1, %ymm0, %xmm6
	adcq	$0, %rbx
	addq	%rax, %rcx
	adcq	$0, %rbx
	addq	%rsi, %rcx
	vpextrq	$1, %xmm2, %rsi
	adcq	$0, %rbx
	addq	%r15, %rcx
	vpextrq	$1, %xmm0, %r15
	adcq	$0, %rbx
	addq	%rdx, %rcx
	vmovq	%xmm6, %rdx
	adcq	$0, %rbx
	addq	%r10, %rcx
	vpextrq	$1, %xmm6, %r10
	movq	%rcx, -352(%rbp)
	adcq	$0, %rbx
	movq	-352(%rbp), %rax
	movq	%rcx, -368(%rbp)
	vmovq	%xmm0, %rcx
	movq	%rbx, -344(%rbp)
	xorl	%ebx, %ebx
	addq	%rsi, %rcx
	adcq	$0, %rbx
	addq	%r15, %rcx
	movq	%rax, 64(%r14)
	vmovq	%xmm5, %rax
	adcq	$0, %rbx
	addq	%rdx, %rcx
	adcq	$0, %rbx
	addq	%r10, %rcx
	vpextrq	$1, %xmm5, %r10
	adcq	$0, %rbx
	movq	%rcx, %rsi
	vmovq	%xmm9, %rcx
	addq	%rax, %rsi
	movq	%rbx, %rdx
	vextracti64x4	$0x1, %zmm5, %ymm5
	adcq	$0, %rdx
	movq	%rsi, -384(%rbp)
	vpextrq	$1, %xmm9, %rax
	movq	-384(%rbp), %r15
	movq	%rsi, -608(%rbp)
	xorl	%esi, %esi
	addq	%r10, %rcx
	vextracti128	$0x1, %ymm5, %xmm1
	adcq	$0, %rsi
	addq	%rax, %rcx
	movq	%rdx, -376(%rbp)
	vmovq	%xmm5, %rdx
	adcq	$0, %rsi
	addq	%rdx, %rcx
	movq	%r15, 72(%r14)
	vpextrq	$1, %xmm5, %r15
	adcq	$0, %rsi
	movq	%rcx, %rax
	vpextrq	$1, %xmm1, %rbx
	addq	%r15, %rax
	movq	%rsi, %rdx
	vmovq	%xmm1, %rcx
	adcq	$0, %rdx
	vmovq	%xmm13, %r15
	xorl	%esi, %esi
	addq	%rcx, %rbx
	movq	%rax, -416(%rbp)
	adcq	$0, %rsi
	addq	%r15, %rbx
	vmovq	%xmm15, %rcx
	movq	%rax, -400(%rbp)
	vpextrq	$1, %xmm13, %rax
	adcq	$0, %rsi
	vextracti64x4	$0x1, %zmm13, %ymm13
	addq	%rax, %rbx
	vpextrq	$1, %xmm15, %r15
	movq	-400(%rbp), %r10
	movq	%rdx, -392(%rbp)
	adcq	$0, %rsi
	movq	%rbx, -432(%rbp)
	xorl	%eax, %eax
	addq	%rcx, %r15
	adcq	$0, %rax
	movq	%r10, 80(%r14)
	movq	-432(%rbp), %r10
	vextracti128	$0x1, %ymm13, %xmm2
	movq	%rbx, -624(%rbp)
	vmovq	%xmm13, %rbx
	addq	%rbx, %r15
	movq	-656(%rbp), %rbx
	movq	%r10, 88(%r14)
	vmovq	%xmm3, %r10
	movq	%r15, -464(%rbp)
	adcq	$0, %rax
	addl	%r8d, %edi
	movq	-464(%rbp), %rcx
	movq	%rbx, %rdx
	movq	%r15, -640(%rbp)
	vmovq	%xmm2, %r15
	movl	%ebx, %ebx
	shrq	$32, %rdx
	movq	%rcx, 96(%r14)
	vpextrq	$1, %xmm13, %rcx
	vmovd	%r10d, %xmm3
	addl	%r10d, %edx
	addq	%r15, %rcx
	movq	%rsi, -424(%rbp)
	vmovq	%xmm3, %rsi
	movl	%edx, %r15d
	movq	%r9, %rdx
	movq	%rax, -456(%rbp)
	vpextrq	$1, %xmm2, %rax
	shrq	$32, %rdx
	movq	%rcx, 104(%r14)
	addl	%edx, %edi
	movq	%r15, %rdx
	movq	%rax, 112(%r14)
	subq	%rsi, %rdx
	movl	%edi, %edi
	shrq	$63, %rdx
	salq	$32, %rdx
	addq	%r10, %rdx
	movabsq	$-4294967296, %r10
	andq	%r10, %rdx
	movq	-688(%rbp), %r10
	orq	%r15, %rdx
	movq	%rdi, %r15
	subq	%rbx, %r15
	movq	-672(%rbp), %rbx
	movq	%r10, %rsi
	movl	%r10d, %r10d
	shrq	$63, %r15
	shrq	$32, %rsi
	movq	%rbx, %r8
	addq	%r15, %rdx
	movl	-480(%rbp), %r15d
	movl	%ebx, %ebx
	shrq	$32, %r8
	movq	%rdx, (%r14)
	addl	%r9d, %r8d
	movl	-512(%rbp), %r9d
	movq	%r8, %rdx
	subq	%r15, %rdx
	addl	%r9d, %esi
	movl	-544(%rbp), %r9d
	shrq	$63, %rdx
	addq	%rdi, %rdx
	movq	%rsi, %rdi
	subq	%rbx, %rdi
	salq	$32, %rdx
	movq	-696(%rbp), %rbx
	orq	%r8, %rdx
	shrq	$63, %rdi
	movl	-528(%rbp), %r8d
	addq	%rdi, %rdx
	movq	%rbx, %rdi
	shrq	$32, %rdi
	movq	%rdx, 8(%r14)
	addl	%r8d, %edi
	movq	-576(%rbp), %r8
	movq	%rdi, %r15
	shrq	$32, %r8
	addl	%r9d, %r8d
	subq	%r10, %r15
	movq	-592(%rbp), %r10
	movl	-560(%rbp), %r9d
	shrq	$63, %r15
	movq	%r8, %rdx
	addq	%rsi, %r15
	movl	%ebx, %esi
	subq	%rsi, %rdx
	salq	$32, %r15
	movq	-368(%rbp), %rsi
	orq	%rdi, %r15
	movq	%rdx, %rbx
	movq	%r10, %rdi
	shrq	$63, %rbx
	shrq	$32, %rdi
	addl	%r9d, %edi
	addq	%rbx, %r15
	movl	-576(%rbp), %ebx
	shrq	$32, %rsi
	movq	%r15, 16(%r14)
	movq	%rdi, %rdx
	movl	-336(%rbp), %r15d
	subq	%rbx, %rdx
	addl	%r15d, %esi
	shrq	$63, %rdx
	addq	%r8, %rdx
	movl	%r10d, %r8d
	movq	%rsi, %r10
	subq	%r8, %r10
	salq	$32, %rdx
	orq	%rdi, %rdx
	shrq	$63, %r10
	addq	%r10, %rdx
	movq	%rdx, 24(%r14)
	movq	-608(%rbp), %rbx
	movl	-352(%rbp), %r9d
	movl	-368(%rbp), %r10d
	movq	$1, -512(%rbp)
	movq	%rbx, %rdi
	movq	-416(%rbp), %r8
	movl	-384(%rbp), %r15d
	movq	%r14, -752(%rbp)
	shrq	$32, %rdi
	addl	%r9d, %edi
	shrq	$32, %r8
	movl	-400(%rbp), %r9d
	movq	%rdi, %rdx
	addl	%r15d, %r8d
	movl	-432(%rbp), %r15d
	subq	%r10, %rdx
	movq	-624(%rbp), %r10
	shrq	$63, %rdx
	addq	%rsi, %rdx
	movl	%ebx, %esi
	movq	%r8, %rbx
	subq	%rsi, %rbx
	salq	$32, %rdx
	movq	%r10, %rsi
	orq	%rdi, %rdx
	movq	%rbx, %rdi
	movq	-640(%rbp), %rbx
	shrq	$63, %rdi
	addq	%rdi, %rdx
	shrq	$32, %rsi
	movq	%rbx, %rdi
	movl	%ebx, %ebx
	addl	%r9d, %esi
	movl	-416(%rbp), %r9d
	movq	%rdx, 32(%r14)
	shrq	$32, %rdi
	movq	%rsi, %rdx
	addl	%r15d, %edi
	movq	%rax, %r15
	subq	%r9, %rdx
	shrq	$32, %r15
	shrq	$63, %rdx
	addl	%ecx, %r15d
	addq	%r8, %rdx
	movl	%r10d, %r8d
	movl	-464(%rbp), %r10d
	salq	$32, %rdx
	orq	%rsi, %rdx
	movq	%rdi, %rsi
	subq	%r8, %rsi
	shrq	$63, %rsi
	addq	%rsi, %rdx
	movq	%rcx, %rsi
	movl	%ecx, %ecx
	shrq	$32, %rsi
	movq	%rdx, 40(%r14)
	movl	%r15d, %edx
	movl	%eax, %r15d
	addl	%r10d, %esi
	movq	%rsi, %r9
	subq	%rbx, %r9
	shrq	$63, %r9
	addq	%rdi, %r9
	movq	%rdx, %rdi
	salq	$32, %r9
	subq	%rcx, %rdi
	orq	%rsi, %r9
	movq	-320(%rbp), %rsi
	shrq	$63, %rdi
	movq	%rdi, %r8
	shrq	$32, %rsi
	addq	%r9, %r8
	movabsq	$-4294967296, %r9
	leal	(%rsi,%rax), %r10d
	movl	%eax, %eax
	movq	%r8, 48(%r14)
	movq	%r10, %rbx
	subq	%r15, %rbx
	shrq	$63, %rbx
	addq	%rbx, %rdx
	salq	$32, %rbx
	salq	$32, %rdx
	orq	%r10, %rdx
	subq	%rbx, %rdx
	andq	%r9, %rdx
	orq	%rdx, %rax
	movq	%rax, 56(%r14)
	.p2align 4
	.p2align 3
.L261:
	salq	-512(%rbp)
	movq	-512(%rbp), %r11
#APP
# 225 "../myutils.h" 1
	CPUID
	RDTSC
	mov %edx, %edi
	mov %eax, %r8d
	
# 0 "" 2
#NO_APP
	salq	$32, %rdi
	movl	%r8d, %edx
	orq	%rdx, %rdi
	movq	%rdi, -704(%rbp)
	testq	%r11, %r11
	je	.L264
	vmovd	0(%r13), %xmm15
	vmovd	4(%r13), %xmm0
	xorl	%eax, %eax
	movl	$0, -696(%rbp)
	vmovd	8(%r13), %xmm1
	vmovd	8(%r12), %xmm5
	vpunpcklqdq	%xmm0, %xmm15, %xmm12
	vpunpcklqdq	%xmm15, %xmm0, %xmm10
	vpunpcklqdq	%xmm15, %xmm15, %xmm8
	vmovd	12(%r12), %xmm7
	vpunpcklqdq	%xmm1, %xmm0, %xmm13
	vinserti32x4	$0x1, %xmm10, %ymm8, %ymm9
	vmovd	(%r12), %xmm10
	movl	-512(%rbp), %ecx
	vinserti32x4	$0x1, %xmm12, %ymm13, %ymm6
	vpunpcklqdq	%xmm5, %xmm7, %xmm11
	vinserti32x8	$0x1, %ymm6, %zmm9, %zmm16
	vmovd	4(%r12), %xmm6
	vpunpcklqdq	%xmm5, %xmm10, %xmm4
	vmovdqa	%xmm11, -320(%rbp)
	movl	%ecx, -464(%rbp)
	vpunpcklqdq	%xmm10, %xmm6, %xmm3
	vpunpcklqdq	%xmm6, %xmm10, %xmm2
	vinserti32x4	$0x1, %xmm11, %ymm3, %ymm14
	vinserti32x4	$0x1, %xmm4, %ymm2, %ymm0
	vmovd	16(%r13), %xmm11
	vinserti32x8	$0x1, %ymm14, %zmm0, %zmm8
	vmovd	12(%r13), %xmm14
	vpunpcklqdq	%xmm15, %xmm11, %xmm9
	vpmuldq	%zmm8, %zmm16, %zmm21
	vpunpcklqdq	%xmm14, %xmm1, %xmm2
	vmovq	%xmm14, %rsi
	vmovd	20(%r12), %xmm14
	vinserti32x4	$0x1, %xmm9, %ymm2, %ymm0
	vinserti32x4	$0x1, %xmm12, %ymm2, %ymm4
	vpunpcklqdq	%xmm6, %xmm5, %xmm9
	vpunpcklqdq	%xmm14, %xmm10, %xmm8
	vinserti32x8	$0x1, %ymm0, %zmm4, %zmm17
	vmovdqa	%xmm9, -336(%rbp)
	vinserti32x4	$0x1, %xmm2, %ymm12, %ymm2
	vinserti32x4	$0x1, %xmm8, %ymm9, %ymm0
	vmovd	16(%r12), %xmm8
	vpunpcklqdq	%xmm7, %xmm8, %xmm7
	vpunpcklqdq	%xmm8, %xmm14, %xmm8
	vinserti32x4	$0x1, %xmm7, %ymm3, %ymm4
	vinserti32x8	$0x1, %ymm0, %zmm4, %zmm9
	vmovd	20(%r13), %xmm0
	vpmuldq	%zmm9, %zmm17, %zmm20
	vmovq	%rsi, %xmm9
	vpunpcklqdq	%xmm15, %xmm0, %xmm15
	vpunpcklqdq	%xmm11, %xmm9, %xmm9
	vmovq	%xmm0, %r10
	vinserti32x4	$0x1, %xmm13, %ymm15, %ymm4
	vmovd	24(%r12), %xmm15
	vinserti32x4	$0x1, %xmm9, %ymm13, %ymm13
	vmovdqa	%xmm8, %xmm0
	vinserti32x8	$0x1, %ymm4, %zmm13, %zmm22
	vpunpcklqdq	%xmm15, %xmm10, %xmm10
	vinserti32x4	$0x1, %xmm8, %ymm10, %ymm4
	vinserti32x4	$0x1, -336(%rbp), %ymm7, %ymm8
	vmovdqa	%xmm0, -336(%rbp)
	vinserti32x8	$0x1, %ymm4, %zmm8, %zmm10
	vpmuldq	%zmm10, %zmm22, %zmm19
	vmovd	28(%r12), %xmm10
	vpunpcklqdq	%xmm15, %xmm10, %xmm4
	vpunpcklqdq	%xmm10, %xmm6, %xmm6
	vpunpcklqdq	%xmm10, %xmm5, %xmm5
	vinserti32x4	$0x1, %xmm0, %ymm4, %ymm8
	vmovdqa	-320(%rbp), %xmm0
	vmovdqa	%xmm4, -352(%rbp)
	vmovd	24(%r13), %xmm4
	vinserti32x4	$0x1, %xmm3, %ymm0, %ymm3
	vinserti32x4	$0x1, %xmm6, %ymm0, %ymm0
	vmovq	%rsi, %xmm6
	vinserti32x8	$0x1, %ymm8, %zmm3, %zmm23
	vmovq	%r10, %xmm3
	vpunpcklqdq	%xmm4, %xmm3, %xmm12
	vpunpcklqdq	%xmm3, %xmm11, %xmm11
	vinserti32x4	$0x1, %xmm12, %ymm9, %ymm9
	vinserti32x8	$0x1, %ymm2, %zmm9, %zmm8
	vpmuldq	%zmm23, %zmm8, %zmm18
	vmovd	28(%r13), %xmm8
	vpunpcklqdq	%xmm8, %xmm4, %xmm2
	vpunpcklqdq	%xmm1, %xmm8, %xmm1
	vpunpcklqdq	%xmm4, %xmm8, %xmm4
	vinserti32x4	$0x1, %xmm2, %ymm11, %ymm3
	vinserti32x8	$0x1, %ymm13, %zmm3, %zmm13
	vpmuldq	%zmm23, %zmm13, %zmm3
	vinserti32x4	$0x1, %xmm1, %ymm12, %ymm13
	vinserti32x4	$0x1, %xmm12, %ymm2, %ymm12
	vinserti32x8	$0x1, %ymm9, %zmm13, %zmm1
	vpunpcklqdq	%xmm14, %xmm15, %xmm9
	vpunpcklqdq	%xmm10, %xmm15, %xmm15
	vinserti32x4	$0x1, %xmm7, %ymm9, %ymm13
	vinserti32x4	$0x1, %xmm9, %ymm5, %ymm9
	vpunpcklqdq	%xmm10, %xmm14, %xmm14
	vinserti32x8	$0x1, %ymm13, %zmm0, %zmm13
	vpunpcklqdq	%xmm6, %xmm8, %xmm0
	vmovdqa	-352(%rbp), %xmm6
	vinserti32x4	$0x1, %xmm15, %ymm14, %ymm10
	vpmuldq	%zmm13, %zmm1, %zmm1
	vmovdqa	%xmm11, %xmm13
	vinserti32x4	$0x1, %xmm11, %ymm2, %ymm11
	vinserti32x4	$0x1, %xmm13, %ymm0, %ymm13
	vinserti32x4	$0x1, %xmm6, %ymm7, %ymm7
	vextracti64x4	$0x0, %zmm20, %ymm15
	vinserti32x8	$0x1, %ymm11, %zmm13, %zmm11
	vinserti32x8	$0x1, %ymm7, %zmm9, %zmm0
	vpunpcklqdq	%xmm8, %xmm8, %xmm13
	vpmuldq	%zmm0, %zmm11, %zmm0
	vinserti32x4	$0x1, %xmm13, %ymm4, %ymm8
	vmovdqa	-336(%rbp), %xmm11
	vextracti64x4	$0x0, %zmm21, %ymm9
	vinserti32x8	$0x1, %ymm8, %zmm12, %zmm2
	vextracti128	$0x1, %ymm9, %xmm13
	vextracti64x4	$0x1, %zmm21, %ymm8
	vinserti32x4	$0x1, %xmm6, %ymm11, %ymm6
	vpextrq	$1, %xmm13, %r15
	vmovq	%xmm8, %rbx
	vinserti32x8	$0x1, %ymm10, %zmm6, %zmm7
	addq	%r15, %rbx
	vpextrq	$1, %xmm8, %r11
	vpmuldq	%zmm7, %zmm2, %zmm4
	vextracti128	$0x1, %ymm8, %xmm2
	adcq	$0, %rax
	addq	%r11, %rbx
	vmovq	%xmm2, %rdi
	adcq	$0, %rax
	xorl	%edx, %edx
	movq	%rbx, -624(%rbp)
	vpextrq	$1, %xmm2, %r10
	vmovq	%xmm15, %rcx
	vpextrq	$1, %xmm15, %r15
	movq	%rax, -616(%rbp)
	addq	%rdi, %r10
	vextracti128	$0x1, %ymm15, %xmm10
	vextracti64x4	$0x1, %zmm20, %ymm11
	movq	-624(%rbp), %r11
	adcq	$0, %rdx
	addq	%rcx, %r10
	vextracti128	$0x1, %ymm11, %xmm7
	adcq	$0, %rdx
	addq	%r15, %r10
	vpextrq	$1, %xmm10, %r15
	adcq	$0, %rdx
	movq	%r10, -640(%rbp)
	xorl	%ebx, %ebx
	vmovq	%xmm10, %r10
	addq	%r10, %r15
	movq	%rdx, -632(%rbp)
	vmovq	%xmm11, %rdx
	vpextrq	$1, %xmm11, %rcx
	adcq	$0, %rbx
	addq	%rdx, %r15
	vmovq	%xmm7, %rax
	movq	-640(%rbp), %rdi
	adcq	$0, %rbx
	addq	%rcx, %r15
	vpextrq	$1, %xmm9, %r8
	vpextrq	$1, %xmm7, -432(%rbp)
	adcq	$0, %rbx
	addq	%rax, %r15
	vmovdqa	%xmm9, %xmm5
	movq	%rdi, -712(%rbp)
	vextracti64x4	$0x0, %zmm19, %ymm9
	movq	%r15, -656(%rbp)
	movq	-432(%rbp), %r15
	adcq	$0, %rbx
	vmovq	%xmm9, %rax
	vextracti128	$0x1, %ymm9, %xmm8
	vpextrq	$1, %xmm9, %rcx
	xorl	%edx, %edx
	addq	%r15, %rax
	movq	-656(%rbp), %r10
	vmovq	%xmm8, %rdi
	vextracti64x4	$0x1, %zmm19, %ymm12
	adcq	$0, %rdx
	addq	%rcx, %rax
	movq	%rbx, -648(%rbp)
	vpextrq	$1, %xmm8, %rbx
	adcq	$0, %rdx
	addq	%rdi, %rax
	vextracti128	$0x1, %ymm12, %xmm15
	movq	%r10, -720(%rbp)
	adcq	$0, %rdx
	vmovq	%xmm12, %r10
	addq	%rbx, %rax
	adcq	$0, %rdx
	vmovq	%xmm15, %rdi
	addq	%r10, %rax
	vpextrq	$1, %xmm12, %rcx
	adcq	$0, %rdx
	xorl	%ebx, %ebx
	movq	%rax, -672(%rbp)
	vextracti64x4	$0x0, %zmm18, %ymm14
	addq	%rcx, %rdi
	vpextrq	$1, %xmm15, %r10
	movq	%rdx, -664(%rbp)
	vmovq	%xmm14, %r15
	movq	-672(%rbp), %rdx
	adcq	$0, %rbx
	addq	%r10, %rdi
	vextracti128	$0x1, %ymm14, %xmm11
	vpextrq	$1, %xmm14, %rax
	adcq	$0, %rbx
	addq	%r15, %rdi
	adcq	$0, %rbx
	addq	%rax, %rdi
	movq	%rdx, -728(%rbp)
	vmovq	%xmm11, %rdx
	adcq	$0, %rbx
	vextracti64x4	$0x1, %zmm18, %ymm7
	addq	%rdx, %rdi
	vextracti128	$0x1, %ymm7, %xmm9
	vpextrq	$1, %xmm11, %rcx
	adcq	$0, %rbx
	vmovq	%xmm7, %r10
	addq	%rcx, %rdi
	vpextrq	$1, %xmm7, %r15
	adcq	$0, %rbx
	vmovq	%xmm9, %rdx
	xorl	%eax, %eax
	addq	%r10, %r15
	adcq	$0, %rax
	vpextrq	$1, %xmm9, %rcx
	addq	%rdx, %r15
	movq	%rbx, -680(%rbp)
	adcq	$0, %rax
	vmovq	%xmm3, %rbx
	addq	%rcx, %r15
	movq	%rdi, -688(%rbp)
	adcq	$0, %rax
	vextracti128	$0x1, %ymm3, %xmm12
	addq	%rbx, %r15
	movq	-688(%rbp), %rdi
	adcq	$0, %rax
	vpextrq	$1, %xmm3, %r10
	vmovq	%xmm12, %rdx
	addq	%r10, %r15
	vpextrq	$1, %xmm12, %rcx
	vextracti64x4	$0x1, %zmm3, %ymm2
	adcq	$0, %rax
	addq	%rdx, %r15
	vmovq	%xmm2, %rbx
	adcq	$0, %rax
	addq	%rcx, %r15
	vextracti128	$0x1, %ymm2, %xmm14
	adcq	$0, %rax
	vmovq	%xmm14, %rcx
	xorl	%edx, %edx
	movq	%r15, -608(%rbp)
	movq	%rax, -600(%rbp)
	vpextrq	$1, %xmm2, %rax
	vpextrq	$1, %xmm14, %r15
	vextracti128	$0x1, %ymm1, %xmm7
	addq	%rbx, %rax
	vmovq	%xmm1, %rbx
	vextracti64x4	$0x1, %zmm1, %ymm9
	movq	-608(%rbp), %r10
	adcq	$0, %rdx
	addq	%rcx, %rax
	vpextrq	$1, %xmm1, %rcx
	adcq	$0, %rdx
	addq	%r15, %rax
	vmovq	%xmm7, %r15
	adcq	$0, %rdx
	addq	%rbx, %rax
	vpextrq	$1, %xmm7, %rbx
	adcq	$0, %rdx
	addq	%rcx, %rax
	vmovq	%xmm13, %rsi
	adcq	$0, %rdx
	addq	%r15, %rax
	leaq	(%r8,%rsi), %r9
	adcq	$0, %rdx
	vmovq	%xmm9, %r15
	movq	%rax, -528(%rbp)
	movq	-528(%rbp), %rax
	vextracti128	$0x1, %ymm9, %xmm13
	vextracti128	$0x1, %ymm0, %xmm2
	vpextrq	$1, %xmm9, %rcx
	movq	%rdx, -520(%rbp)
	xorl	%edx, %edx
	addq	%rbx, %r15
	leal	(%r8,%rsi), %esi
	movq	%rax, -368(%rbp)
	adcq	$0, %rdx
	vmovq	%xmm13, %rax
	addq	%rcx, %r15
	adcq	$0, %rdx
	addq	%rax, %r15
	vpextrq	$1, %xmm13, %rbx
	adcq	$0, %rdx
	vmovq	%xmm0, %rcx
	addq	%rbx, %r15
	adcq	$0, %rdx
	addq	%rcx, %r15
	vpextrq	$1, %xmm0, %rbx
	adcq	$0, %rdx
	movq	%r15, -544(%rbp)
	vmovq	%xmm2, %rax
	movq	-544(%rbp), %r15
	vpextrq	$1, %xmm2, %rcx
	vextracti64x4	$0x1, %zmm0, %ymm15
	movq	%rdx, -536(%rbp)
	xorl	%edx, %edx
	addq	%rbx, %rax
	movq	%r15, -384(%rbp)
	vmovq	%xmm15, %r15
	vpextrq	$1, %xmm15, %rbx
	adcq	$0, %rdx
	addq	%rcx, %rax
	vextracti128	$0x1, %ymm15, %xmm10
	adcq	$0, %rdx
	addq	%r15, %rax
	vmovq	%xmm10, %rcx
	adcq	$0, %rdx
	addq	%rbx, %rax
	vpextrq	$1, %xmm10, %r15
	adcq	$0, %rdx
	movq	%rax, -560(%rbp)
	movq	-560(%rbp), %rax
	vmovq	%xmm4, %rbx
	movq	%rdx, -552(%rbp)
	xorl	%edx, %edx
	addq	%rcx, %r15
	vextracti128	$0x1, %ymm4, %xmm9
	movq	%rax, -336(%rbp)
	adcq	$0, %rdx
	vpextrq	$1, %xmm4, %rax
	addq	%rbx, %r15
	adcq	$0, %rdx
	addq	%rax, %r15
	vextracti64x4	$0x1, %zmm4, %ymm13
	adcq	$0, %rdx
	movq	%r15, -576(%rbp)
	vpextrq	$1, %xmm9, %rbx
	vmovq	%xmm9, %r15
	movq	%rdx, -568(%rbp)
	vmovq	%xmm13, %rax
	xorl	%edx, %edx
	addq	%r15, %rbx
	movq	-576(%rbp), %rcx
	vextracti128	$0x1, %ymm13, %xmm8
	adcq	$0, %rdx
	vpextrq	$1, %xmm13, -480(%rbp)
	addq	%rax, %rbx
	movq	-480(%rbp), %r15
	movq	%r9, %rax
	movl	%r9d, %r9d
	adcq	$0, %rdx
	movq	%rbx, -592(%rbp)
	vmovq	%xmm8, %rbx
	shrq	$32, %rax
	addq	%rbx, %r15
	movq	%rdx, -584(%rbp)
	vmovq	%xmm5, %rdx
	vpextrq	$1, %xmm8, %rbx
	movq	%r15, -320(%rbp)
	leal	(%rax,%rdx), %r15d
	movq	%r11, %rax
	movl	%edx, %r8d
	shrq	$32, %rax
	movq	%rcx, -352(%rbp)
	movl	%r11d, %r11d
	movq	-592(%rbp), %rcx
	addl	%eax, %esi
	movq	%r15, %rax
	vmovd	%ebx, %xmm2
	subq	%r8, %rax
	movq	%rcx, -400(%rbp)
	movl	%esi, %ecx
	movq	-712(%rbp), %r8
	shrq	$63, %rax
	salq	$32, %rax
	addq	%rdx, %rax
	movabsq	$-4294967296, %rdx
	andq	%rdx, %rax
	movq	%rcx, %rdx
	subq	%r9, %rdx
	orq	%r15, %rax
	movq	-720(%rbp), %r15
	movl	-640(%rbp), %r9d
	shrq	$63, %rdx
	leaq	(%rax,%rdx), %rsi
	movl	-624(%rbp), %eax
	movq	%r8, %rdx
	shrq	$32, %rdx
	movq	%rsi, -416(%rbp)
	movq	%r15, %rsi
	movl	%r15d, %r15d
	addl	%eax, %edx
	shrq	$32, %rsi
	movq	%rdx, %rax
	addl	%r9d, %esi
	subq	%r11, %rax
	movq	-728(%rbp), %r11
	shrq	$63, %rax
	leaq	(%rax,%rcx), %r9
	movl	%r8d, %ecx
	movl	-656(%rbp), %r8d
	movq	%rsi, %rax
	salq	$32, %r9
	subq	%rcx, %rax
	movq	%rdi, %rcx
	movl	%edi, %edi
	shrq	$63, %rax
	orq	%rdx, %r9
	movq	%r11, %rdx
	shrq	$32, %rcx
	shrq	$32, %rdx
	addq	%rax, %r9
	movl	-672(%rbp), %eax
	movl	%r11d, %r11d
	addl	%r8d, %edx
	movq	%rdx, %r8
	addl	%eax, %ecx
	subq	%r15, %r8
	movq	%rcx, %rax
	movl	-608(%rbp), %r15d
	shrq	$63, %r8
	leaq	(%r8,%rsi), %r8
	movl	-688(%rbp), %esi
	salq	$32, %r8
	orq	%rdx, %r8
	movq	%r10, %rdx
	subq	%r11, %rax
	movq	-368(%rbp), %r11
	shrq	$32, %rdx
	shrq	$63, %rax
	movl	%r10d, %r10d
	addl	%esi, %edx
	addq	%rax, %r8
	movq	%r11, %rsi
	movq	%rdx, %rax
	shrq	$32, %rsi
	subq	%rdi, %rax
	addl	%r15d, %esi
	movq	-384(%rbp), %r15
	shrq	$63, %rax
	leaq	(%rax,%rcx), %rdi
	movl	-528(%rbp), %ecx
	movq	%rsi, %rax
	salq	$32, %rdi
	subq	%r10, %rax
	movl	-544(%rbp), %r10d
	orq	%rdx, %rdi
	movq	%r15, %rdx
	shrq	$63, %rax
	movl	%r15d, %r15d
	shrq	$32, %rdx
	addq	%rax, %rdi
	movl	%r11d, %eax
	addl	%ecx, %edx
	movq	-336(%rbp), %rcx
	movq	%rdx, %r11
	subq	%rax, %r11
	shrq	$32, %rcx
	shrq	$63, %r11
	addl	%r10d, %ecx
	movq	-352(%rbp), %r10
	addq	%r11, %rsi
	movq	%rcx, %rax
	movl	-576(%rbp), %r11d
	salq	$32, %rsi
	subq	%r15, %rax
	movq	-400(%rbp), %r15
	shrq	$32, %r10
	orq	%rdx, %rsi
	movl	-560(%rbp), %edx
	shrq	$63, %rax
	addq	%rax, %rsi
	vmovd	%r15d, %xmm5
	addl	%edx, %r10d
	movq	%r15, %rdx
	vmovq	%xmm5, %r15
	shrq	$32, %rdx
	movq	%r10, %rax
	addl	%r11d, %edx
	movl	-336(%rbp), %r11d
	subq	%r11, %rax
	movq	-320(%rbp), %r11
	shrq	$63, %rax
	addq	%rax, %rcx
	movq	%rdx, %rax
	shrq	$32, %r11
	salq	$32, %rcx
	orq	%r10, %rcx
	movl	-352(%rbp), %r10d
	subq	%r10, %rax
	movl	-592(%rbp), %r10d
	shrq	$63, %rax
	addl	%r10d, %r11d
	movq	-480(%rbp), %r10
	addq	%rax, %rcx
	vmovq	%xmm8, %rax
	addl	%eax, %r10d
	movq	%rbx, %rax
	shrq	$32, %rax
	addl	%eax, %r10d
	movq	%r11, %rax
	subq	%r15, %rax
	movl	%r10d, %r10d
	movq	-432(%rbp), %r15
	shrq	$63, %rax
	addq	%rax, %rdx
	movq	%r10, %rax
	shrq	$32, %r15
	salq	$32, %rdx
	orq	%r11, %rdx
	movl	-320(%rbp), %r11d
	subq	%r11, %rax
	leal	(%r15,%rbx), %r11d
	vmovq	%xmm2, %r15
	shrq	$63, %rax
	addq	%rax, %rdx
	movq	%r11, %rax
	subq	%r15, %rax
	shrq	$63, %rax
	addq	%rax, %r10
	salq	$32, %rax
	salq	$32, %r10
	orq	%r11, %r10
	movq	%r10, %r11
	subq	%rax, %r11
	movq	%r11, -480(%rbp)
	testb	$1, -464(%rbp)
	jne	.L377
	movq	%rdx, -432(%rbp)
	movq	%rbx, %r11
	xorl	%r15d, %r15d
	movq	%r10, %rbx
	.p2align 4
	.p2align 3
.L263:
	movq	-368(%rbp), %rdx
	movq	-384(%rbp), %r10
	addl	$2, %r15d
	prefetcht0	0(%r13)
	prefetcht0	(%r12)
	movq	-336(%rbp), %rax
	vmovdqa64	%zmm20, 64(%r14)
	prefetcht0	0(%r13)
	movq	%rdx, 64(%r14)
	movq	-352(%rbp), %rdx
	prefetcht0	(%r12)
	movq	%r10, 72(%r14)
	movq	-400(%rbp), %r10
	movq	%rax, 80(%r14)
	movq	-320(%rbp), %rax
	movq	%rdx, 88(%r14)
	movq	-416(%rbp), %rdx
	movq	%r10, 96(%r14)
	movq	-432(%rbp), %r10
	movq	%rax, 104(%r14)
	movabsq	$-4294967296, %rax
	movq	%rdx, (%r14)
	movq	%r10, 48(%r14)
	movq	%r11, 112(%r14)
	movq	%r9, 8(%r14)
	movq	%r8, 16(%r14)
	movq	%rdi, 24(%r14)
	movq	%rsi, 32(%r14)
	movq	%rcx, 40(%r14)
	movq	%rbx, 56(%r14)
	vmovdqa64	%zmm19, 128(%r14)
	vmovdqa64	%zmm18, 192(%r14)
	vmovdqa64	%zmm3, 256(%r14)
	vmovdqa64	%zmm1, 320(%r14)
	vmovdqa64	%zmm0, 384(%r14)
	vmovdqa64	%zmm4, 448(%r14)
	andq	-480(%rbp), %rax
	movq	-448(%rbp), %rdx
	movl	(%rdx), %r10d
	movq	-496(%rbp), %rdx
	orq	%rax, %r10
	movq	%r10, (%rdx)
	movq	-368(%rbp), %r10
	vmovdqa64	%zmm20, 64(%r14)
	movq	%r10, 64(%r14)
	movq	-384(%rbp), %r10
	movq	%r11, 112(%r14)
	movq	%r10, 72(%r14)
	movq	-336(%rbp), %r10
	movq	%r9, 8(%r14)
	movq	%r10, 80(%r14)
	movq	-352(%rbp), %r10
	movq	%r8, 16(%r14)
	movq	%r10, 88(%r14)
	movq	-400(%rbp), %r10
	movq	%rdi, 24(%r14)
	movq	%r10, 96(%r14)
	movq	-320(%rbp), %r10
	vmovdqa64	%zmm19, 128(%r14)
	movq	%r10, 104(%r14)
	movq	-416(%rbp), %r10
	vmovdqa64	%zmm18, 192(%r14)
	movq	%r10, (%r14)
	vmovdqa64	%zmm3, 256(%r14)
	vmovdqa64	%zmm1, 320(%r14)
	vmovdqa64	%zmm0, 384(%r14)
	vmovdqa64	%zmm4, 448(%r14)
	movq	%rsi, 32(%r14)
	movq	-432(%rbp), %r10
	movq	%rcx, 40(%r14)
	movq	%r10, 48(%r14)
	movq	-448(%rbp), %r10
	movq	%rbx, 56(%r14)
	movl	(%r10), %r10d
	orq	%r10, %rax
	movq	%rax, (%rdx)
	movl	-464(%rbp), %eax
	cmpl	%eax, %r15d
	jne	.L263
.L264:
#APP
# 238 "../myutils.h" 1
	RDTSCP
	mov %edx, %esi
	mov %eax, %edi
	CPUID
	
# 0 "" 2
#NO_APP
	movq	%rsi, %r15
	movl	%edi, %ecx
	movq	-704(%rbp), %r8
	xorl	%eax, %eax
	salq	$32, %r15
	movl	$.LC21, %edi
	orq	%rcx, %r15
	subq	%r8, %r15
	movq	%r15, %rsi
	vzeroupper
	call	printf
	cmpq	$699999999, %r15
	jbe	.L261
	vxorpd	%xmm15, %xmm15, %xmm15
	movl	$.LC23, %edi
	movl	$1, %eax
	movq	-752(%rbp), %r12
	vcvtusi2sdq	%r15, %xmm15, %xmm14
	vmulsd	.LC22(%rip), %xmm14, %xmm10
	vcvtsi2sdq	-512(%rbp), %xmm15, %xmm7
	vcvttsd2usi	%xmm10, %r9
	vcvtusi2sdq	%r9, %xmm15, %xmm11
	vdivsd	%xmm7, %xmm11, %xmm0
	call	printf
#APP
# 347 "test4.c" 1
	mfence
# 0 "" 2
# 349 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	movq	-736(%rbp), %r13
	leaq	64(%r14), %r14
	xorl	%ebx, %ebx
	.p2align 4
	.p2align 3
.L265:
	movq	(%r12), %rcx
	movslq	%ebx, %rdi
	movl	$.LC17, %edx
	xorl	%eax, %eax
	addq	%r13, %rdi
	movl	$17, %esi
	addq	$8, %r12
	addl	$16, %ebx
	call	snprintf
	cmpq	%r12, %r14
	jne	.L265
	movq	-736(%rbp), %rdx
	movslq	%ebx, %r11
	movb	$0, (%rdx,%r11)
	cmpb	$48, (%rdx)
	jne	.L266
	.p2align 4
	.p2align 4
	.p2align 3
.L267:
	addq	$1, %rdx
	cmpb	$48, (%rdx)
	je	.L267
	movq	%rdx, -736(%rbp)
.L266:
#APP
# 354 "test4.c" 1
	mfence
# 0 "" 2
# 356 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	leaq	-272(%rbp), %rdx
	leaq	-288(%rbp), %rsi
	movl	$1, %r15d
	leaq	-256(%rbp), %rdi
	leaq	-192(%rbp), %r12
	call	__gmpz_mul
	.p2align 4
	.p2align 3
.L269:
	movq	%r12, %rsi
	xorl	%edi, %edi
	addq	%r15, %r15
	xorl	%r14d, %r14d
	call	getrusage
	fildq	-192(%rbp)
	fmuls	.LC24(%rip)
	fildq	-184(%rbp)
	faddp	%st, %st(1)
	fisttpq	-320(%rbp)
	testq	%r15, %r15
	jle	.L271
	movq	%r15, %r10
	andl	$6, %r10d
	je	.L268
	cmpq	$1, %r10
	je	.L350
	cmpq	$2, %r10
	je	.L351
	cmpq	$3, %r10
	je	.L352
	cmpq	$4, %r10
	je	.L353
	cmpq	$5, %r10
	je	.L354
	cmpq	$6, %r10
	je	.L355
	leaq	-272(%rbp), %rdx
	leaq	-288(%rbp), %rsi
	movl	$1, %r14d
	leaq	-256(%rbp), %rdi
	call	__gmpz_mul
.L355:
	leaq	-272(%rbp), %rdx
	leaq	-288(%rbp), %rsi
	addq	$1, %r14
	leaq	-256(%rbp), %rdi
	call	__gmpz_mul
.L354:
	leaq	-272(%rbp), %rdx
	leaq	-288(%rbp), %rsi
	addq	$1, %r14
	leaq	-256(%rbp), %rdi
	call	__gmpz_mul
.L353:
	leaq	-272(%rbp), %rdx
	leaq	-288(%rbp), %rsi
	addq	$1, %r14
	leaq	-256(%rbp), %rdi
	call	__gmpz_mul
.L352:
	leaq	-272(%rbp), %rdx
	leaq	-288(%rbp), %rsi
	addq	$1, %r14
	leaq	-256(%rbp), %rdi
	call	__gmpz_mul
.L351:
	leaq	-272(%rbp), %rdx
	leaq	-288(%rbp), %rsi
	addq	$1, %r14
	leaq	-256(%rbp), %rdi
	call	__gmpz_mul
.L350:
	leaq	-272(%rbp), %rdx
	leaq	-288(%rbp), %rsi
	addq	$1, %r14
	leaq	-256(%rbp), %rdi
	call	__gmpz_mul
	cmpq	%r14, %r15
	je	.L271
.L268:
	leaq	-272(%rbp), %rdx
	leaq	-288(%rbp), %rsi
	addq	$8, %r14
	leaq	-256(%rbp), %rdi
	call	__gmpz_mul
	leaq	-272(%rbp), %rdx
	leaq	-288(%rbp), %rsi
	leaq	-256(%rbp), %rdi
	call	__gmpz_mul
	leaq	-272(%rbp), %rdx
	leaq	-288(%rbp), %rsi
	leaq	-256(%rbp), %rdi
	call	__gmpz_mul
	leaq	-272(%rbp), %rdx
	leaq	-288(%rbp), %rsi
	leaq	-256(%rbp), %rdi
	call	__gmpz_mul
	leaq	-272(%rbp), %rdx
	leaq	-288(%rbp), %rsi
	leaq	-256(%rbp), %rdi
	call	__gmpz_mul
	leaq	-272(%rbp), %rdx
	leaq	-288(%rbp), %rsi
	leaq	-256(%rbp), %rdi
	call	__gmpz_mul
	leaq	-272(%rbp), %rdx
	leaq	-288(%rbp), %rsi
	leaq	-256(%rbp), %rdi
	call	__gmpz_mul
	leaq	-272(%rbp), %rdx
	leaq	-288(%rbp), %rsi
	leaq	-256(%rbp), %rdi
	call	__gmpz_mul
	cmpq	%r14, %r15
	jne	.L268
.L271:
	movq	%r12, %rsi
	xorl	%edi, %edi
	call	getrusage
	fildq	-192(%rbp)
	fmuls	.LC24(%rip)
	fildq	-184(%rbp)
	faddp	%st, %st(1)
	fildq	-320(%rbp)
	fsubrp	%st, %st(1)
	fisttpq	-320(%rbp)
	movq	-320(%rbp), %rax
	cmpq	$249999, %rax
	jle	.L269
	vxorpd	%xmm9, %xmm9, %xmm9
	movl	$.LC25, %edi
	vcvtsi2sdq	%rax, %xmm9, %xmm13
	movl	$1, %eax
	vcvtsi2sdq	%r15, %xmm9, %xmm6
	vdivsd	%xmm6, %xmm13, %xmm0
	call	printf
#APP
# 362 "test4.c" 1
	mfence
# 0 "" 2
# 364 "test4.c" 1
	cpuid
# 0 "" 2
#NO_APP
	movq	-744(%rbp), %rdi
	xorl	%ebx, %ebx
	call	strlen
	movq	%rax, %r9
	movq	%rax, %r8
	andl	$7, %r9d
	je	.L382
	movq	-736(%rbp), %rsi
	movq	-744(%rbp), %rdi
	movzbl	(%rsi), %ecx
	cmpb	%cl, (%rdi)
	jne	.L381
	movl	$1, %ebx
	cmpq	$1, %r9
	je	.L382
	cmpq	$2, %r9
	je	.L356
	cmpq	$3, %r9
	je	.L357
	cmpq	$4, %r9
	je	.L358
	cmpq	$5, %r9
	je	.L359
	cmpq	$6, %r9
	jne	.L393
.L360:
	movq	-736(%rbp), %r12
	movq	-744(%rbp), %r15
	leaq	1(%rbx), %rdx
	movzbl	(%r12,%rbx), %r10d
	cmpb	%r10b, (%r15,%rbx)
	jne	.L381
	movq	%rdx, %rbx
.L359:
	movq	-736(%rbp), %r9
	movq	-744(%rbp), %rax
	leaq	1(%rbx), %r14
	movzbl	(%r9,%rbx), %edi
	cmpb	%dil, (%rax,%rbx)
	jne	.L381
	movq	%r14, %rbx
.L358:
	movq	-736(%rbp), %rsi
	movq	-744(%rbp), %r13
	leaq	1(%rbx), %rcx
	movzbl	(%rsi,%rbx), %r11d
	cmpb	%r11b, 0(%r13,%rbx)
	jne	.L381
	movq	%rcx, %rbx
.L357:
	movq	-736(%rbp), %r12
	movq	-744(%rbp), %r15
	leaq	1(%rbx), %rdx
	movzbl	(%r12,%rbx), %r10d
	cmpb	%r10b, (%r15,%rbx)
	jne	.L381
	movq	%rdx, %rbx
.L356:
	movq	-736(%rbp), %rcx
	movq	-744(%rbp), %r9
	leaq	1(%rbx), %r14
	movzbl	(%rcx,%rbx), %eax
	cmpb	%al, (%r9,%rbx)
	jne	.L381
	movq	%r14, %rbx
	jmp	.L272
	.p2align 4,,10
	.p2align 3
.L273:
	movzbl	(%rcx,%rbx), %edi
	leaq	1(%rbx), %r13
	cmpb	%dil, (%r9,%rbx)
	jne	.L381
	movzbl	(%rcx,%r13), %r11d
	movq	%r13, %rbx
	leaq	1(%r13), %rsi
	cmpb	%r11b, (%r9,%r13)
	jne	.L381
	movzbl	(%rcx,%rsi), %edx
	movq	%rsi, %rbx
	cmpb	%dl, (%r9,%rsi)
	jne	.L381
	movzbl	2(%rcx,%r13), %r15d
	leaq	2(%r13), %rbx
	leaq	3(%r13), %r12
	cmpb	%r15b, 2(%r9,%r13)
	jne	.L381
	movzbl	3(%rcx,%r13), %r14d
	movq	%r12, %rbx
	leaq	4(%r13), %r10
	cmpb	%r14b, 3(%r9,%r13)
	jne	.L381
	movzbl	4(%rcx,%r13), %edi
	movq	%r10, %rbx
	leaq	5(%r13), %rax
	cmpb	%dil, 4(%r9,%r13)
	jne	.L381
	movzbl	5(%rcx,%r13), %r11d
	movq	%rax, %rbx
	leaq	6(%r13), %rsi
	cmpb	%r11b, 5(%r9,%r13)
	jne	.L381
	movzbl	6(%rcx,%r13), %r12d
	movq	%rsi, %rbx
	leaq	7(%r13), %rdx
	cmpb	%r12b, 6(%r9,%r13)
	jne	.L381
	movq	%rdx, %rbx
.L272:
	cmpq	%rbx, %r8
	jne	.L273
	movl	$.LC30, %esi
	movl	$.LC31, %edi
	xorl	%eax, %eax
	call	printf
	addq	$704, %rsp
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
	.p2align 4,,10
	.p2align 3
.L377:
	.cfi_restore_state
	movq	-528(%rbp), %rax
	prefetcht0	0(%r13)
	prefetcht0	(%r12)
	movq	-544(%rbp), %r15
	vmovdqa64	%zmm20, 64(%r14)
	movq	-560(%rbp), %r11
	movq	%rax, 64(%r14)
	movq	-576(%rbp), %rax
	movq	%r15, 72(%r14)
	movq	-592(%rbp), %r15
	movq	%r11, 80(%r14)
	movq	-320(%rbp), %r11
	movq	%rax, 88(%r14)
	movq	-416(%rbp), %rax
	movq	%r11, 104(%r14)
	movq	%rax, (%r14)
	movabsq	$-4294967296, %rax
	andq	-480(%rbp), %rax
	movq	%r15, 96(%r14)
	movq	%rbx, 112(%r14)
	movq	%r9, 8(%r14)
	movq	%r8, 16(%r14)
	movq	%rdi, 24(%r14)
	movq	%rsi, 32(%r14)
	movq	%rcx, 40(%r14)
	movq	%rdx, 48(%r14)
	movq	%r10, 56(%r14)
	vmovdqa64	%zmm19, 128(%r14)
	vmovdqa64	%zmm18, 192(%r14)
	vmovdqa64	%zmm3, 256(%r14)
	vmovdqa64	%zmm1, 320(%r14)
	vmovdqa64	%zmm0, 384(%r14)
	vmovdqa64	%zmm4, 448(%r14)
	movq	-448(%rbp), %r15
	movl	(%r15), %r11d
	movq	-496(%rbp), %r15
	orq	%r11, %rax
	movl	$1, %r11d
	movq	%rax, (%r15)
	movl	-464(%rbp), %eax
	movl	%r11d, -696(%rbp)
	cmpl	%eax, %r11d
	je	.L264
	movq	%rbx, %r11
	movq	%rdx, -432(%rbp)
	movq	%r10, %rbx
	movl	-696(%rbp), %r15d
	jmp	.L263
.L382:
	movq	-744(%rbp), %r9
	movq	-736(%rbp), %rcx
	jmp	.L272
.L393:
	movl	$2, %r13d
	movzbl	-1(%rsi,%r13), %r11d
	cmpb	%r11b, (%rdi,%rbx)
	jne	.L381
	movq	%r13, %rbx
	jmp	.L360
.L381:
	movl	$.LC26, %edi
	call	puts
	movq	-736(%rbp), %r13
	movl	%ebx, %esi
	xorl	%eax, %eax
	movq	-744(%rbp), %r15
	movl	$.LC27, %edi
	movsbl	0(%r13,%rbx), %ecx
	movsbl	(%r15,%rbx), %edx
	call	printf
	movq	%r13, %rsi
	movl	$.LC28, %edi
	xorl	%eax, %eax
	call	printf
	movl	$.LC29, %edi
	movq	%r15, %rsi
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
