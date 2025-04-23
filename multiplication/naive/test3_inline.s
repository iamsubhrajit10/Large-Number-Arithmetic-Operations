	.file	"test3.c"
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
.LFB6650:
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
.LFE6650:
	.size	print_array, .-print_array
	.p2align 4
	.globl	generate_random_numbers
	.type	generate_random_numbers, @function
generate_random_numbers:
.LFB6651:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L203
	movslq	%esi, %rsi
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	-8(,%rsi,8), %rax
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	(%rdi,%rsi,8), %r12
	shrq	$3, %rax
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	addq	$1, %rax
	andl	$3, %eax
	je	.L184
	cmpq	$1, %rax
	je	.L195
	cmpq	$2, %rax
	je	.L196
	call	rand
	addq	$8, %rbx
	movl	%eax, %ebp
	call	rand
	salq	$32, %rbp
	cltq
	orq	%rax, %rbp
	movq	%rbp, -8(%rbx)
.L196:
	call	rand
	addq	$8, %rbx
	movl	%eax, %ebp
	call	rand
	salq	$32, %rbp
	cltq
	orq	%rax, %rbp
	movq	%rbp, -8(%rbx)
.L195:
	call	rand
	addq	$8, %rbx
	movl	%eax, %ebp
	call	rand
	salq	$32, %rbp
	cltq
	orq	%rax, %rbp
	movq	%rbp, -8(%rbx)
	cmpq	%r12, %rbx
	je	.L201
.L184:
	call	rand
	addq	$32, %rbx
	movl	%eax, %ebp
	call	rand
	salq	$32, %rbp
	cltq
	orq	%rax, %rbp
	movq	%rbp, -32(%rbx)
	call	rand
	movl	%eax, %ebp
	call	rand
	salq	$32, %rbp
	cltq
	orq	%rax, %rbp
	movq	%rbp, -24(%rbx)
	call	rand
	movl	%eax, %ebp
	call	rand
	salq	$32, %rbp
	cltq
	orq	%rax, %rbp
	movq	%rbp, -16(%rbx)
	call	rand
	movl	%eax, %ebp
	call	rand
	salq	$32, %rbp
	cltq
	orq	%rax, %rbp
	movq	%rbp, -8(%rbx)
	cmpq	%r12, %rbx
	jne	.L184
.L201:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L203:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.cfi_endproc
.LFE6651:
	.size	generate_random_numbers, .-generate_random_numbers
	.section	.rodata.str1.1
.LC17:
	.string	"%016lx"
	.text
	.p2align 4
	.globl	limb_get_str
	.type	limb_get_str, @function
limb_get_str:
.LFB6652:
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
	jle	.L212
	movslq	%esi, %rsi
	movq	%rdi, %rbx
	xorl	%r12d, %r12d
	leaq	-8(,%rsi,8), %rax
	leaq	(%rdi,%rsi,8), %r13
	shrq	$3, %rax
	addq	$1, %rax
	andl	$3, %eax
	je	.L208
	cmpq	$1, %rax
	je	.L225
	cmpq	$2, %rax
	je	.L226
	movq	(%rdi), %rcx
	movq	(%rdx), %rdi
	movl	$17, %esi
	movl	$.LC17, %edx
	xorl	%eax, %eax
	movl	$16, %r12d
	addq	$8, %rbx
	call	snprintf
.L226:
	movq	(%rbx), %rcx
	movslq	%r12d, %rdi
	movl	$.LC17, %edx
	addq	0(%rbp), %rdi
	movl	$17, %esi
	xorl	%eax, %eax
	addl	$16, %r12d
	addq	$8, %rbx
	call	snprintf
.L225:
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
	je	.L231
.L208:
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
	jne	.L208
.L231:
	movslq	%r12d, %r12
.L207:
	movq	0(%rbp), %rcx
	movb	$0, (%rcx,%r12)
	movq	0(%rbp), %r9
	cmpb	$48, (%r9)
	leaq	1(%r9), %r10
	jne	.L232
	.p2align 4
	.p2align 4
	.p2align 3
.L210:
	movq	%r10, 0(%rbp)
	addq	$1, %r10
	cmpb	$48, -1(%r10)
	je	.L210
.L232:
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
.L212:
	.cfi_restore_state
	xorl	%r12d, %r12d
	jmp	.L207
	.cfi_endproc
.LFE6652:
	.size	limb_get_str, .-limb_get_str
	.section	.rodata.str1.1
.LC18:
	.string	"*** Test Case %d ***\n"
.LC19:
	.string	"a"
.LC20:
	.string	"perf_output_test3.txt"
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"Time taken for multiplication: %f\n"
	.align 8
.LC22:
	.string	"Time taken for GMP multiplication: %f\n"
	.section	.rodata.str1.1
.LC23:
	.string	"Test failed"
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"i: %d, expected: %c, result: %c\n"
	.section	.rodata.str1.1
.LC25:
	.string	"result: %s\n"
.LC26:
	.string	"expected: %s\n"
.LC27:
	.string	"passed"
.LC28:
	.string	"Test %s\n"
	.text
	.p2align 4
	.globl	test
	.type	test, @function
test:
.LFB6653:
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
	movq	%rax, %rbx
	call	malloc
	movl	$513, %edi
	movq	%rax, -304(%rbp)
	call	malloc
	leaq	-160(%rbp), %rdi
	movq	$0, (%rax)
	movq	%rax, -200(%rbp)
	call	__gmpz_init
	leaq	-144(%rbp), %rdi
	call	__gmpz_init
	leaq	-128(%rbp), %rdi
	call	__gmpz_init
	movl	$512, %edx
	movl	$64, %esi
	leaq	-168(%rbp), %rdi
	call	posix_memalign
	testl	%eax, %eax
	jne	.L235
	movq	-168(%rbp), %r13
.L235:
	xorl	%eax, %eax
	movl	$64, %ecx
	movq	%r13, %rdi
	movl	$512, %edx
	rep stosq
	movl	$64, %esi
	leaq	-176(%rbp), %rdi
	xorl	%r15d, %r15d
	call	posix_memalign
	testl	%eax, %eax
	jne	.L236
	movq	-176(%rbp), %r15
.L236:
	xorl	%eax, %eax
	movl	$64, %ecx
	movq	%r15, %rdi
	movl	$512, %edx
	rep stosq
	movl	$64, %esi
	leaq	-184(%rbp), %rdi
	xorl	%r12d, %r12d
	call	posix_memalign
	testl	%eax, %eax
	jne	.L237
	movq	-184(%rbp), %r12
.L237:
	xorl	%eax, %eax
	movl	$64, %ecx
	movq	%r12, %rdi
	movq	%rbx, %r14
	rep stosq
	xorl	%edi, %edi
	call	time
	movl	%eax, %edi
	call	srand
	leaq	32(%rbx), %rdx
	movq	%r13, %rsi
	movq	%rbx, %r13
	movq	%rdx, -432(%rbp)
	movq	%rsi, %rbx
.L238:
	call	rand
	addq	$8, %r14
	movl	%eax, -368(%rbp)
	call	rand
	movq	-368(%rbp), %r9
	movslq	%eax, %r8
	salq	$32, %r9
	orq	%r8, %r9
	movq	%r9, -8(%r14)
	cmpq	%r14, -432(%rbp)
	jne	.L238
	movq	-304(%rbp), %rdi
	movq	%rdi, %r14
	addq	$32, %rdi
	movq	%rdi, -432(%rbp)
.L239:
	call	rand
	addq	$8, %r14
	movl	%eax, -368(%rbp)
	call	rand
	movslq	%eax, %rdx
	movq	-368(%rbp), %rax
	salq	$32, %rax
	orq	%rdx, %rax
	movq	%rax, -8(%r14)
	cmpq	%r14, -432(%rbp)
	jne	.L239
	movq	%rbx, %rsi
	xorl	%r14d, %r14d
	movq	%r13, %rbx
	movq	%rsi, %r13
.L240:
	leaq	-160(%rbp), %rsi
	movl	$64, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movq	(%rbx,%r14), %rdx
	leaq	-160(%rbp), %rsi
	movq	%rsi, %rdi
	call	__gmpz_add_ui
	leaq	-144(%rbp), %rsi
	movl	$64, %edx
	movq	%rsi, %rdi
	call	__gmpz_mul_2exp
	movq	-304(%rbp), %r8
	leaq	-144(%rbp), %rsi
	movq	%rsi, %rdi
	movq	(%r8,%r14), %rdx
	addq	$8, %r14
	call	__gmpz_add_ui
	cmpq	$32, %r14
	jne	.L240
	movl	$1, %esi
	movl	$.LC18, %edi
	xorl	%eax, %eax
	call	printf
	vmovdqu	(%rbx), %xmm1
	movq	%rsp, %r9
	xorl	%eax, %eax
	vmovdqu	16(%rbx), %xmm2
	subq	$32, %rsp
	vpsrlq	$32, %xmm1, %xmm0
	leaq	3(%rsp), %r11
	vpsrlq	$32, %xmm2, %xmm3
	vshufps	$136, %xmm2, %xmm1, %xmm13
	shrq	$2, %r11
	vshufps	$136, %xmm3, %xmm0, %xmm12
	vpsrldq	$4, %xmm12, %xmm15
	vpunpckldq	%xmm13, %xmm12, %xmm9
	vpunpckldq	%xmm12, %xmm13, %xmm10
	vpunpckldq	%xmm15, %xmm13, %xmm8
	vpunpckldq	%xmm12, %xmm12, %xmm4
	vpunpckldq	%xmm13, %xmm12, %xmm11
	vpunpcklqdq	%xmm9, %xmm8, %xmm7
	vpunpcklqdq	%xmm10, %xmm4, %xmm1
	vmovdqu	%xmm11, 0(,%r11,4)
	vpunpckhdq	%xmm13, %xmm12, %xmm5
	vinserti32x4	$0x1, %xmm7, %ymm1, %ymm2
	vpshufd	$78, %xmm11, %xmm3
	vpsrldq	$8, %xmm11, %xmm11
	vmovdqu	%xmm5, 16(,%r11,4)
	vpmovzxdq	%ymm2, %zmm0
	vpsrldq	$4, %xmm13, %xmm10
	vmovss	%xmm12, %xmm12, %xmm14
	vmovdqa64	%zmm0, (%r15)
	vpmovzxdq	%xmm3, %ymm6
	vpsrldq	$12, %xmm12, %xmm0
	vpsrldq	$8, %xmm12, %xmm3
	vpmovzxdq	%xmm11, %xmm5
	vpsrldq	$8, %xmm13, %xmm11
	vmovdqa	%ymm6, 64(%r15)
	vpunpckldq	%xmm3, %xmm10, %xmm6
	vpunpckldq	%xmm0, %xmm11, %xmm7
	vpunpckldq	%xmm14, %xmm11, %xmm1
	vpunpckldq	%xmm14, %xmm3, %xmm14
	vpsrldq	$12, %xmm13, %xmm13
	vmovdqa	%xmm5, 96(%r15)
	vpunpcklqdq	%xmm9, %xmm7, %xmm12
	vpunpcklqdq	%xmm1, %xmm6, %xmm5
	vpunpcklqdq	%xmm6, %xmm8, %xmm9
	vpunpcklqdq	%xmm8, %xmm14, %xmm2
	vinserti32x4	$0x1, %xmm12, %ymm9, %ymm4
	vpunpckldq	%xmm11, %xmm3, %xmm3
	vpunpckldq	%xmm15, %xmm13, %xmm12
	vinserti32x4	$0x1, %xmm5, %ymm2, %ymm14
	vpunpckldq	%xmm10, %xmm15, %xmm15
	vpunpckldq	%xmm13, %xmm0, %xmm2
	vpunpckldq	%xmm10, %xmm13, %xmm10
	vpunpckldq	%xmm0, %xmm13, %xmm0
	vpunpcklqdq	%xmm6, %xmm12, %xmm1
	vpunpcklqdq	%xmm3, %xmm15, %xmm11
	vpunpcklqdq	%xmm0, %xmm7, %xmm12
	vpunpcklqdq	%xmm8, %xmm2, %xmm8
	vpunpcklqdq	%xmm7, %xmm6, %xmm6
	vpunpcklqdq	%xmm2, %xmm3, %xmm2
	vpunpcklqdq	%xmm10, %xmm7, %xmm7
	vinserti32x4	$0x1, %xmm8, %ymm11, %ymm5
	vpmovzxdq	%xmm13, %xmm9
	vinserti32x4	$0x1, %xmm12, %ymm2, %ymm8
	vinserti32x4	$0x1, %xmm2, %ymm7, %ymm13
	vinserti32x4	$0x1, %xmm1, %ymm6, %ymm6
	vpmovzxdq	%ymm13, %zmm3
	vpmovzxdq	%ymm5, %zmm1
	vpmovzxdq	%ymm8, %zmm15
	vpmovzxdq	%ymm14, %zmm14
	vpmovzxdq	%ymm4, %zmm4
	vpmovzxdq	%ymm6, %zmm6
	vmovdqu64	%zmm1, 240(%r15)
	vpunpcklqdq	%xmm9, %xmm9, %xmm9
	vmovdqu64	%zmm14, 112(%r15)
	vmovdqu64	%zmm4, 176(%r15)
	vmovdqu64	%zmm6, 304(%r15)
	vmovdqu64	%zmm3, 368(%r15)
	vmovdqu64	%zmm15, 432(%r15)
	vmovdqa	%xmm9, 496(%r15)
	movq	-304(%rbp), %r10
	vmovdqu	(%r10), %xmm11
	vmovdqu	16(%r10), %xmm0
	vpsrlq	$32, %xmm11, %xmm5
	vpsrlq	$32, %xmm0, %xmm12
	vshufps	$136, %xmm0, %xmm11, %xmm0
	vpsrldq	$4, %xmm0, %xmm11
	vshufps	$136, %xmm12, %xmm5, %xmm5
	vpsrldq	$4, %xmm5, %xmm9
	vpunpckldq	%xmm5, %xmm0, %xmm12
	vpunpckldq	%xmm0, %xmm5, %xmm3
	vpunpckldq	%xmm9, %xmm11, %xmm10
	vpunpckldq	%xmm9, %xmm5, %xmm7
	vpunpckldq	%xmm0, %xmm5, %xmm2
	vpsrldq	$12, %xmm5, %xmm8
	vpunpcklqdq	%xmm7, %xmm3, %xmm15
	vpunpcklqdq	%xmm10, %xmm12, %xmm6
	vinsertps	$16, %xmm5, %xmm0, %xmm3
	vpsrldq	$8, %xmm0, %xmm14
	vinserti32x4	$0x1, %xmm6, %ymm15, %ymm6
	vpmovzxdq	%xmm3, %xmm15
	vpsrldq	$8, %xmm5, %xmm3
	vmovdqu	%xmm2, 0(,%r11,4)
	vpmovzxdq	%ymm6, %zmm7
	vpunpckldq	%xmm14, %xmm5, %xmm2
	vpunpckldq	%xmm0, %xmm9, %xmm6
	vmovdqa	%xmm15, 64(%r12)
	vmovdqa64	%zmm7, (%r12)
	vpunpckldq	%xmm3, %xmm14, %xmm15
	vpunpckldq	%xmm8, %xmm5, %xmm7
	vpunpckldq	%xmm11, %xmm3, %xmm3
	vpsrldq	$12, %xmm0, %xmm13
	vpunpcklqdq	%xmm3, %xmm2, %xmm11
	vpunpcklqdq	%xmm7, %xmm6, %xmm7
	vpunpcklqdq	%xmm6, %xmm3, %xmm6
	vpunpckldq	%xmm13, %xmm9, %xmm9
	vpunpckldq	%xmm14, %xmm8, %xmm14
	vinserti32x4	$0x1, %xmm11, %ymm6, %ymm6
	vpunpckldq	%xmm8, %xmm13, %xmm11
	vpunpckldq	%xmm13, %xmm0, %xmm13
	vpunpcklqdq	%xmm14, %xmm13, %xmm1
	vpunpckhdq	%xmm0, %xmm5, %xmm4
	vpunpcklqdq	%xmm10, %xmm15, %xmm10
	vpunpckhdq	%xmm5, %xmm0, %xmm5
	vpunpcklqdq	%xmm3, %xmm14, %xmm8
	vpunpcklqdq	%xmm11, %xmm12, %xmm12
	vmovdqu	%xmm4, 16(,%r11,4)
	vpunpcklqdq	%xmm9, %xmm3, %xmm3
	vpunpcklqdq	%xmm15, %xmm11, %xmm15
	vpshufd	$142, %xmm5, %xmm0
	vpsrldq	$8, %xmm4, %xmm4
	vinserti32x4	$0x1, %xmm3, %ymm1, %ymm11
	vinserti32x4	$0x1, %xmm10, %ymm12, %ymm2
	vinserti32x4	$0x1, %xmm10, %ymm7, %ymm7
	vinserti32x4	$0x1, %xmm15, %ymm8, %ymm10
	vpmovzxdq	%ymm2, %zmm12
	vpmovzxdq	%ymm6, %zmm6
	vpmovzxdq	%ymm7, %zmm7
	vpmovzxdq	%ymm11, %zmm2
	vpmovzxdq	%ymm10, %zmm15
	vmovdqu64	%zmm6, 80(%r12)
	vpmovzxdq	%xmm0, %ymm14
	vpmovzxdq	%xmm4, %xmm8
	vmovdqu64	%zmm7, 144(%r12)
	vmovdqu64	%zmm12, 208(%r12)
	vmovdqu64	%zmm12, 272(%r12)
	vmovdqu64	%zmm2, 336(%r12)
	vmovdqu64	%zmm15, 400(%r12)
	vmovdqu	%ymm14, 464(%r12)
	vmovdqa	%xmm8, 496(%r12)
	movq	%r9, %rsp
	vzeroupper
	call	initialize_perf
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movl	$-1, %edx
	xorl	%esi, %esi
	movl	$pe, %edi
	call	perf_event_open
#APP
# 341 "test3.c" 1
	mfence
# 0 "" 2
# 343 "test3.c" 1
	cpuid
# 0 "" 2
#NO_APP
	xorl	%eax, %eax
	call	start_perf
	vmovdqa32	(%r12), %zmm10
	xorl	%edx, %edx
	vpmuldq	(%r15), %zmm10, %zmm13
	vextracti128	$0x1, %ymm13, %xmm8
	vpextrq	$1, %xmm13, %rcx
	vmovdqa32	256(%r12), %zmm12
	vmovdqa32	384(%r12), %zmm5
	vpmuldq	256(%r15), %zmm12, %zmm15
	vpextrq	$1, %xmm8, %rsi
	vpmuldq	384(%r15), %zmm5, %zmm12
	vmovdqa	%xmm13, %xmm5
	vextracti64x4	$0x1, %zmm13, %ymm13
	vmovdqa32	64(%r12), %zmm9
	vmovdqa32	128(%r12), %zmm3
	vpmuldq	128(%r15), %zmm3, %zmm7
	vmovq	%xmm13, %rax
	vextracti128	$0x1, %ymm13, %xmm3
	vpextrq	$1, %xmm13, %rbx
	vpmuldq	64(%r15), %zmm9, %zmm11
	addq	%rsi, %rax
	vmovq	%xmm3, %r9
	vmovq	%xmm11, %r11
	vmovdqa64	%zmm11, 64(%r13)
	adcq	$0, %rdx
	addq	%rbx, %rax
	vpextrq	$1, %xmm3, %rbx
	movq	%rcx, -752(%rbp)
	adcq	$0, %rdx
	xorl	%esi, %esi
	addq	%r9, %rbx
	movq	%rax, -688(%rbp)
	adcq	$0, %rsi
	vpextrq	$1, %xmm11, %r10
	addq	%r11, %rbx
	movq	-688(%rbp), %r8
	adcq	$0, %rsi
	addq	%r10, %rbx
	vmovq	%xmm8, %rdi
	movq	%rdx, -680(%rbp)
	adcq	$0, %rsi
	vextracti128	$0x1, %ymm11, %xmm4
	xorl	%eax, %eax
	movq	%r8, -848(%rbp)
	leaq	(%rdi,%rcx), %r14
	vextracti64x4	$0x1, %zmm11, %ymm11
	movq	%rsi, -232(%rbp)
	vmovq	%xmm4, %rdi
	vpextrq	$1, %xmm4, %rsi
	vmovq	%xmm11, %rdx
	vextracti128	$0x1, %ymm11, %xmm13
	movq	%rbx, -240(%rbp)
	addq	%rdi, %rsi
	vpextrq	$1, %xmm11, %r8
	movq	-240(%rbp), %rcx
	vmovq	%xmm13, %r9
	vmovdqa32	192(%r12), %zmm1
	adcq	$0, %rax
	addq	%rdx, %rsi
	vpmuldq	192(%r15), %zmm1, %zmm6
	adcq	$0, %rax
	addq	%r8, %rsi
	vmovdqa32	320(%r12), %zmm2
	vmovdqa32	448(%r12), %zmm0
	adcq	$0, %rax
	addq	%r9, %rsi
	vpmuldq	320(%r15), %zmm2, %zmm14
	vpmuldq	448(%r15), %zmm0, %zmm1
	movq	%rcx, -864(%rbp)
	movq	%rax, %r11
	vmovq	%xmm7, %r9
	vextracti128	$0x1, %ymm7, %xmm2
	vmovdqa64	%zmm7, 128(%r13)
	adcq	$0, %r11
	vpextrq	$1, %xmm7, %rcx
	vmovq	%xmm2, %rdi
	vmovdqa64	%zmm6, 192(%r13)
	vextracti128	$0x1, %ymm15, %xmm0
	vextracti64x4	$0x1, %zmm7, %ymm7
	vpextrq	$1, %xmm2, %rax
	vmovdqa64	%zmm15, 256(%r13)
	vmovq	%xmm7, %rdx
	vextracti128	$0x1, %ymm7, %xmm4
	vmovdqa64	%zmm14, 320(%r13)
	vmovdqa64	%zmm12, 384(%r13)
	vmovdqa64	%zmm1, 448(%r13)
	movq	%rsi, -704(%rbp)
	movq	-704(%rbp), %r10
	vpextrq	$1, %xmm13, -368(%rbp)
	vpextrq	$1, %xmm7, %rsi
	movq	-368(%rbp), %rbx
	movq	%r11, -696(%rbp)
	vextracti128	$0x1, %ymm6, %xmm13
	movq	%r10, -872(%rbp)
	xorl	%r10d, %r10d
	addq	%rbx, %r9
	vpextrq	$1, %xmm4, %rbx
	adcq	$0, %r10
	addq	%rcx, %r9
	vmovq	%xmm6, %rcx
	adcq	$0, %r10
	addq	%rdi, %r9
	vpextrq	$1, %xmm6, %rdi
	adcq	$0, %r10
	addq	%rax, %r9
	vmovq	%xmm13, %rax
	adcq	$0, %r10
	addq	%rdx, %r9
	vpextrq	$1, %xmm13, %rdx
	adcq	$0, %r10
	xorl	%r11d, %r11d
	movq	%r9, -720(%rbp)
	movq	-720(%rbp), %r8
	movq	%r10, -712(%rbp)
	vmovq	%xmm4, %r10
	vextracti64x4	$0x1, %zmm6, %ymm6
	vextracti128	$0x1, %ymm1, %xmm13
	addq	%rsi, %r10
	vextracti128	$0x1, %ymm6, %xmm3
	movq	%r8, -880(%rbp)
	vmovq	%xmm6, %r8
	adcq	$0, %r11
	addq	%rbx, %r10
	vpextrq	$1, %xmm6, %rsi
	adcq	$0, %r11
	addq	%rcx, %r10
	vmovq	%xmm3, %rbx
	adcq	$0, %r11
	addq	%rdi, %r10
	vpextrq	$1, %xmm3, %rcx
	adcq	$0, %r11
	addq	%rax, %r10
	vmovq	%xmm15, %rdi
	adcq	$0, %r11
	addq	%rdx, %r10
	vpextrq	$1, %xmm15, %rax
	adcq	$0, %r11
	movq	%r10, -736(%rbp)
	movq	-736(%rbp), %r9
	vmovq	%xmm0, %rdx
	vextracti64x4	$0x1, %zmm15, %ymm15
	movq	%r11, -728(%rbp)
	vpextrq	$1, %xmm0, %r10
	vextracti128	$0x1, %ymm14, %xmm6
	movq	%r9, -888(%rbp)
	xorl	%r9d, %r9d
	addq	%r8, %rsi
	vextracti128	$0x1, %ymm15, %xmm11
	adcq	$0, %r9
	addq	%rbx, %rsi
	vpextrq	$1, %xmm15, %rbx
	adcq	$0, %r9
	addq	%rcx, %rsi
	vmovq	%xmm11, %rcx
	adcq	$0, %r9
	addq	%rdi, %rsi
	vextracti128	$0x1, %ymm12, %xmm0
	adcq	$0, %r9
	addq	%rax, %rsi
	vpextrq	$1, %xmm11, %rax
	adcq	$0, %r9
	addq	%rdx, %rsi
	vmovq	%xmm14, %rdx
	movq	%rsi, %r11
	adcq	$0, %r9
	vmovq	%xmm15, %rsi
	addq	%r10, %r11
	vpextrq	$1, %xmm14, %r10
	vextracti64x4	$0x1, %zmm14, %ymm14
	adcq	$0, %r9
	xorl	%edi, %edi
	addq	%rsi, %rbx
	movq	%r11, -432(%rbp)
	adcq	$0, %rdi
	addq	%rcx, %rbx
	vmovq	%xmm6, %r11
	movq	-432(%rbp), %r8
	adcq	$0, %rdi
	addq	%rax, %rbx
	vpextrq	$1, %xmm6, %rsi
	movq	%r9, -424(%rbp)
	adcq	$0, %rdi
	addq	%rdx, %rbx
	vmovq	%xmm14, %rax
	movq	%r8, -768(%rbp)
	adcq	$0, %rdi
	addq	%r10, %rbx
	vextracti128	$0x1, %ymm14, %xmm3
	adcq	$0, %rdi
	addq	%r11, %rbx
	vmovq	%xmm3, %rcx
	adcq	$0, %rdi
	movq	%rbx, -224(%rbp)
	vpextrq	$1, %xmm3, %rdx
	movq	-224(%rbp), %r8
	movq	%rbx, -784(%rbp)
	xorl	%ebx, %ebx
	addq	%rsi, %rax
	vmovq	%xmm12, %r10
	adcq	$0, %rbx
	movq	%rdi, -216(%rbp)
	vpextrq	$1, %xmm14, %rdi
	vpextrq	$1, %xmm0, %rsi
	addq	%rdi, %rax
	movq	%r8, 64(%r13)
	vpextrq	$1, %xmm12, %r8
	vextracti64x4	$0x1, %zmm12, %ymm12
	adcq	$0, %rbx
	addq	%rcx, %rax
	vmovq	%xmm0, %rcx
	adcq	$0, %rbx
	addq	%rdx, %rax
	vmovq	%xmm12, %rdi
	adcq	$0, %rbx
	addq	%r10, %rax
	vextracti128	$0x1, %ymm12, %xmm4
	adcq	$0, %rbx
	addq	%r8, %rcx
	vpextrq	$1, %xmm12, %rdx
	movq	%rax, -560(%rbp)
	addq	%rsi, %rcx
	vmovq	%xmm4, %r10
	movq	%rax, -800(%rbp)
	vmovq	%xmm1, %rax
	addq	%rdi, %rcx
	movq	-560(%rbp), %r9
	vmovq	%xmm13, %r11
	movq	%rbx, -552(%rbp)
	movq	%rcx, %r8
	vpextrq	$1, %xmm4, %rcx
	vpextrq	$1, %xmm1, %rbx
	addq	%rdx, %r8
	addq	%r10, %rcx
	movq	%r9, 72(%r13)
	movq	%r14, %rdx
	addq	%rax, %rcx
	vmovq	%xmm5, %rdi
	movq	%r8, 80(%r13)
	movl	%r14d, %r14d
	vextracti64x4	$0x1, %zmm1, %ymm1
	vpextrq	$1, %xmm13, %rax
	movq	%rcx, %r10
	movq	%r8, -816(%rbp)
	addq	%rbx, %r10
	vmovq	%xmm1, %rsi
	xorl	%r9d, %r9d
	addq	%r11, %rax
	vextracti128	$0x1, %ymm1, %xmm14
	adcq	$0, %r9
	addq	%rsi, %rax
	movq	%r10, -832(%rbp)
	adcq	$0, %r9
	movq	%r10, 88(%r13)
	shrq	$32, %rdx
	vmovq	%xmm14, %rbx
	movq	%rax, -208(%rbp)
	vpextrq	$1, %xmm1, %r11
	addl	%edi, %edx
	movq	%rax, -624(%rbp)
	movq	-624(%rbp), %rcx
	vpextrq	$1, %xmm14, -304(%rbp)
	movq	-304(%rbp), %rsi
	movq	%r9, -616(%rbp)
	leaq	(%rbx,%r11), %r9
	vmovq	%xmm8, %rbx
	movq	%rcx, 96(%r13)
	movq	-848(%rbp), %rcx
	movq	%rsi, 112(%r13)
	movl	%edx, %esi
	movq	-752(%rbp), %rax
	movq	%r9, -496(%rbp)
	movq	%rsi, %rdx
	movq	%rcx, %r11
	movl	%ecx, %ecx
	movq	%r9, 104(%r13)
	movl	%edi, %r9d
	addl	%eax, %ebx
	shrq	$32, %r11
	subq	%r9, %rdx
	addl	%ebx, %r11d
	movl	-688(%rbp), %r9d
	shrq	$63, %rdx
	movl	%r11d, %eax
	movq	-864(%rbp), %r11
	salq	$32, %rdx
	movq	%rax, %rbx
	addq	%rdi, %rdx
	movabsq	$-4294967296, %rdi
	andq	%rdi, %rdx
	movl	-240(%rbp), %edi
	orq	%rsi, %rdx
	movq	%rax, %rsi
	movq	%r11, %rax
	subq	%r14, %rsi
	shrq	$32, %rax
	movl	%r11d, %r14d
	shrq	$63, %rsi
	addl	%eax, %r9d
	addq	%rsi, %rdx
	movq	-872(%rbp), %rsi
	movq	%r9, %rax
	movq	%rdx, 0(%r13)
	subq	%rcx, %rax
	movq	-888(%rbp), %rcx
	movq	%rsi, %rdx
	shrq	$63, %rax
	vmovd	%esi, %xmm5
	shrq	$32, %rdx
	addq	%rbx, %rax
	vmovq	%xmm5, %rsi
	addl	%edi, %edx
	salq	$32, %rax
	movl	-704(%rbp), %edi
	vmovd	%ecx, %xmm9
	movq	%rdx, -688(%rbp)
	movq	-688(%rbp), %r11
	orq	%r9, %rax
	movq	%r11, %r9
	subq	%r14, %r9
	movl	-720(%rbp), %r14d
	shrq	$63, %r9
	addq	%r9, %rax
	movq	%rcx, %r9
	vmovq	%xmm9, %rcx
	movq	%rax, 8(%r13)
	movq	-880(%rbp), %rax
	shrq	$32, %r9
	addl	%r9d, %r14d
	movq	-768(%rbp), %r9
	movq	%rax, %rdx
	vmovd	%eax, %xmm10
	shrq	$32, %rdx
	vmovq	%xmm10, %rax
	leal	(%rdx,%rdi), %ebx
	movq	%r14, %rdi
	movq	%rbx, %rdx
	subq	%rsi, %rdx
	movq	-784(%rbp), %rsi
	shrq	$63, %rdx
	addq	%r11, %rdx
	subq	%rax, %rdi
	movl	-736(%rbp), %r11d
	salq	$32, %rdx
	shrq	$63, %rdi
	orq	%rbx, %rdx
	movq	%r9, %rbx
	addq	%rdi, %rdx
	movl	-432(%rbp), %edi
	shrq	$32, %rbx
	movq	%rdx, 16(%r13)
	movq	%rsi, %rdx
	addl	%ebx, %r11d
	movl	-224(%rbp), %ebx
	shrq	$32, %rdx
	movl	%esi, %esi
	addl	%edi, %edx
	movq	%r8, %rdi
	movq	%rdx, -432(%rbp)
	movq	%r11, %rdx
	shrq	$32, %rdi
	movq	-432(%rbp), %rax
	subq	%rcx, %rdx
	shrq	$63, %rdx
	addq	%r14, %rdx
	movl	%r9d, %r14d
	movq	-800(%rbp), %r9
	subq	%r14, %rax
	salq	$32, %rdx
	orq	%r11, %rdx
	shrq	$63, %rax
	movq	%r8, %r11
	addq	%rax, %rdx
	movl	%r11d, %r11d
	movq	%rdx, 24(%r13)
	movq	%r9, %rdx
	movl	-560(%rbp), %ecx
	movl	%r9d, %r9d
	shrq	$32, %rdx
	movq	-432(%rbp), %rax
	addl	%ebx, %edx
	addl	%edi, %ecx
	movq	%r10, %rdi
	movq	%r10, %rbx
	movq	%rdx, %r14
	shrq	$32, %rdi
	subq	%rsi, %r14
	leal	(%rdi,%r8), %esi
	movq	-496(%rbp), %rdi
	shrq	$63, %r14
	addq	%rax, %r14
	movq	%rsi, %rax
	salq	$32, %r14
	orq	%rdx, %r14
	movq	%rcx, %rdx
	subq	%r9, %rdx
	shrq	$63, %rdx
	addq	%rdx, %r14
	movq	%rdi, %rdx
	movq	%r14, 32(%r13)
	movq	-208(%rbp), %r14
	movq	%r14, %r8
	movl	%r14d, %r14d
	shrq	$32, %r8
	subq	%r11, %rax
	shrq	$32, %rdx
	shrq	$63, %rax
	leal	(%r8,%r10), %r10d
	movq	-304(%rbp), %r8
	addq	%rcx, %rax
	movl	%ebx, %ecx
	movl	-624(%rbp), %ebx
	movq	%r10, %r9
	salq	$32, %rax
	subq	%rcx, %r9
	addl	%ebx, %edx
	orq	%rsi, %rax
	movq	%r8, %rsi
	shrq	$63, %r9
	shrq	$32, %rsi
	movq	%rdx, %r11
	addq	%r9, %rax
	addl	%edi, %esi
	subq	%r14, %r11
	movq	%rax, 40(%r13)
	leaq	112(%r13), %r14
	movl	%esi, %eax
	shrq	$63, %r11
	movq	%r14, -736(%rbp)
	leaq	-96(%rbp), %r14
	addq	%r10, %r11
	movq	%rax, %rcx
	movl	%edi, %r10d
	movl	%r8d, %edi
	subq	%r10, %rcx
	salq	$32, %r11
	shrq	$63, %rcx
	orq	%r11, %rdx
	movabsq	$-4294967296, %r11
	addq	%rcx, %rdx
	movq	%rdx, 48(%r13)
	movq	-368(%rbp), %rdx
	movq	%r13, -368(%rbp)
	shrq	$32, %rdx
	leal	(%rdx,%r8), %r9d
	leaq	56(%r13), %r8
	movq	%r9, %rsi
	movq	%r8, -720(%rbp)
	subq	%rdi, %rsi
	shrq	$63, %rsi
	addq	%rsi, %rax
	salq	$32, %rsi
	salq	$32, %rax
	orq	%r9, %rax
	subq	%rsi, %rax
	andq	%r11, %rax
	orq	%rdi, %rax
	movq	%rax, 56(%r13)
	xorl	%eax, %eax
	vzeroupper
	call	stop_perf
	movq	%r14, %rdi
	call	read_perf
	movl	$.LC19, %esi
	movl	$.LC20, %edi
	call	fopen
	movq	%r14, %rsi
	movq	%rax, %rdi
	movq	%rax, -304(%rbp)
	call	write_perf
#APP
# 359 "test3.c" 1
	mfence
# 0 "" 2
# 361 "test3.c" 1
	cpuid
# 0 "" 2
#NO_APP
	xorl	%eax, %eax
	call	start_perf
	leaq	-144(%rbp), %rdx
	leaq	-160(%rbp), %rsi
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
	xorl	%eax, %eax
	call	stop_perf
	movq	%r14, %rdi
	call	read_perf
	movq	-304(%rbp), %rdi
	movq	%r14, %rsi
	xorl	%r14d, %r14d
	call	write_perf
	leaq	64(%r13), %r10
	movq	-368(%rbp), %rbx
	movq	%r13, -304(%rbp)
	movq	%r10, %r13
.L241:
	movq	-200(%rbp), %rdx
	movq	(%rbx), %rcx
	movslq	%r14d, %rdi
	xorl	%eax, %eax
	movl	$17, %esi
	addq	$8, %rbx
	addl	$16, %r14d
	addq	%rdx, %rdi
	movl	$.LC17, %edx
	call	snprintf
	cmpq	%rbx, %r13
	jne	.L241
	movq	-200(%rbp), %rax
	movslq	%r14d, %rcx
	movq	-304(%rbp), %r13
	movb	$0, (%rax,%rcx)
	cmpb	$48, (%rax)
	jne	.L242
.L243:
	addq	$1, %rax
	cmpb	$48, (%rax)
	je	.L243
	movq	%rax, -200(%rbp)
.L242:
	xorl	%edi, %edi
	leaq	-128(%rbp), %rdx
	movl	$16, %esi
	call	__gmpz_get_str
	vmovdqa32	64(%r15), %zmm2
	vmovdqa32	(%r15), %zmm3
	xorl	%edi, %edi
	vpmuldq	(%r12), %zmm3, %zmm15
	movq	%rax, %rbx
	vpmuldq	64(%r12), %zmm2, %zmm0
	vmovdqa32	256(%r15), %zmm4
	vextracti128	$0x1, %ymm15, %xmm2
	vmovq	%xmm0, %rcx
	vpmuldq	256(%r12), %zmm4, %zmm8
	vextracti64x4	$0x1, %zmm15, %ymm4
	vmovq	%xmm4, %rsi
	vpextrq	$1, %xmm2, %r14
	vmovdqa32	128(%r15), %zmm7
	vmovdqa32	320(%r15), %zmm11
	vpextrq	$1, %xmm4, %r8
	movq	%r14, -944(%rbp)
	vpmuldq	128(%r12), %zmm7, %zmm10
	addq	%rsi, %r14
	movq	%rdi, -936(%rbp)
	adcq	$0, %rdi
	vpmuldq	320(%r12), %zmm11, %zmm7
	vextracti128	$0x1, %ymm4, %xmm11
	addq	%r8, %r14
	vmovq	%xmm11, %r11
	vpextrq	$1, %xmm11, %r10
	vmovdqa32	384(%r15), %zmm13
	adcq	$0, %rdi
	xorl	%edx, %edx
	addq	%r11, %r10
	vpmuldq	384(%r12), %zmm13, %zmm6
	vextracti128	$0x1, %ymm0, %xmm4
	adcq	$0, %rdx
	vpextrq	$1, %xmm0, %rax
	addq	%rcx, %r10
	vmovdqa32	448(%r15), %zmm1
	adcq	$0, %rdx
	vpmuldq	448(%r12), %zmm1, %zmm5
	addq	%rax, %r10
	vextracti64x4	$0x1, %zmm0, %ymm11
	movq	%r14, -704(%rbp)
	vmovdqa32	192(%r15), %zmm12
	vmovq	%xmm4, %r14
	adcq	$0, %rdx
	vmovq	%xmm11, %r8
	vpmuldq	192(%r12), %zmm12, %zmm9
	vpextrq	$1, %xmm15, %r15
	vmovq	%xmm2, %r12
	vpextrq	$1, %xmm4, %rsi
	movq	%rdi, -696(%rbp)
	xorl	%edi, %edi
	leaq	(%r12,%r15), %r9
	addq	%r14, %rsi
	vextracti128	$0x1, %ymm11, %xmm13
	movq	%r15, -688(%rbp)
	vpextrq	$1, %xmm11, %r11
	movq	-704(%rbp), %r15
	movq	%r10, -752(%rbp)
	adcq	$0, %rdi
	movq	%rdx, -744(%rbp)
	addq	%r8, %rsi
	vmovq	%xmm13, %r10
	vextracti128	$0x1, %ymm10, %xmm11
	movq	%r9, -872(%rbp)
	adcq	$0, %rdi
	addq	%r11, %rsi
	vpextrq	$1, %xmm10, %rax
	vmovdqa64	%zmm0, 64(%r13)
	adcq	$0, %rdi
	addq	%r10, %rsi
	vmovq	%xmm11, %r14
	vmovdqa64	%zmm10, 128(%r13)
	adcq	$0, %rdi
	xorl	%r10d, %r10d
	vpextrq	$1, %xmm11, %r8
	vmovdqa64	%zmm9, 192(%r13)
	vmovdqa64	%zmm8, 256(%r13)
	vmovdqa64	%zmm7, 320(%r13)
	vmovdqa64	%zmm6, 384(%r13)
	vmovdqa64	%zmm5, 448(%r13)
	movq	-752(%rbp), %r9
	vpextrq	$1, %xmm13, -304(%rbp)
	movq	-304(%rbp), %rcx
	vextracti64x4	$0x1, %zmm10, %ymm13
	movq	%rsi, -768(%rbp)
	movq	-768(%rbp), %rdx
	movq	%r9, -880(%rbp)
	vmovq	%xmm10, %r9
	vmovq	%xmm13, %r11
	vextracti128	$0x1, %ymm13, %xmm1
	addq	%rcx, %r9
	movq	%rdi, -760(%rbp)
	vpextrq	$1, %xmm13, %rdi
	vmovq	%xmm9, %rcx
	adcq	$0, %r10
	addq	%rax, %r9
	movq	%rdx, -888(%rbp)
	vpextrq	$1, %xmm1, %rdx
	adcq	$0, %r10
	addq	%r14, %r9
	vextracti128	$0x1, %ymm9, %xmm13
	adcq	$0, %r10
	addq	%r8, %r9
	vpextrq	$1, %xmm9, %rax
	adcq	$0, %r10
	addq	%r11, %r9
	vmovq	%xmm13, %r14
	adcq	$0, %r10
	xorl	%r11d, %r11d
	vpextrq	$1, %xmm13, %r8
	movq	%r9, -784(%rbp)
	movq	%r10, -776(%rbp)
	vmovq	%xmm1, %r10
	movq	-784(%rbp), %rsi
	vextracti64x4	$0x1, %zmm9, %ymm1
	addq	%rdi, %r10
	vextracti128	$0x1, %ymm1, %xmm4
	adcq	$0, %r11
	addq	%rdx, %r10
	movq	%rsi, -896(%rbp)
	vmovq	%xmm1, %rsi
	adcq	$0, %r11
	addq	%rcx, %r10
	vmovq	%xmm4, %rdi
	adcq	$0, %r11
	addq	%rax, %r10
	vpextrq	$1, %xmm4, %rdx
	adcq	$0, %r11
	addq	%r14, %r10
	vmovq	%xmm8, %rcx
	adcq	$0, %r11
	addq	%r8, %r10
	vpextrq	$1, %xmm1, %r8
	movq	%r10, -800(%rbp)
	adcq	$0, %r11
	movq	-800(%rbp), %r9
	vextracti128	$0x1, %ymm8, %xmm1
	vpextrq	$1, %xmm8, %rax
	vmovq	%xmm1, %r14
	vextracti64x4	$0x1, %zmm8, %ymm4
	movq	%r11, -792(%rbp)
	movq	%r9, -904(%rbp)
	xorl	%r9d, %r9d
	addq	%rsi, %r8
	vpextrq	$1, %xmm1, %r10
	adcq	$0, %r9
	addq	%rdi, %r8
	vextracti128	$0x1, %ymm4, %xmm11
	adcq	$0, %r9
	addq	%rdx, %r8
	vmovq	%xmm4, %rsi
	adcq	$0, %r9
	addq	%rcx, %r8
	vpextrq	$1, %xmm4, %rdi
	adcq	$0, %r9
	addq	%rax, %r8
	vmovq	%xmm11, %rcx
	adcq	$0, %r9
	addq	%r14, %r8
	vpextrq	$1, %xmm11, %rax
	adcq	$0, %r9
	addq	%r10, %r8
	vmovq	%xmm7, %r14
	adcq	$0, %r9
	xorl	%edx, %edx
	addq	%rsi, %rdi
	movq	%r8, -432(%rbp)
	adcq	$0, %rdx
	addq	%rcx, %rdi
	vextracti128	$0x1, %ymm7, %xmm4
	movq	-432(%rbp), %r11
	adcq	$0, %rdx
	addq	%rax, %rdi
	vpextrq	$1, %xmm7, %r10
	movq	%r9, -424(%rbp)
	adcq	$0, %rdx
	addq	%r14, %rdi
	vmovq	%xmm4, %r8
	movq	%r11, -816(%rbp)
	adcq	$0, %rdx
	addq	%r10, %rdi
	vextracti64x4	$0x1, %zmm7, %ymm11
	adcq	$0, %rdx
	addq	%r8, %rdi
	vmovq	%xmm11, %rax
	adcq	$0, %rdx
	vextracti128	$0x1, %ymm11, %xmm13
	movq	%rdi, -496(%rbp)
	xorl	%esi, %esi
	movq	%rdx, -488(%rbp)
	vpextrq	$1, %xmm4, %rdx
	vmovq	%xmm13, %rcx
	vpextrq	$1, %xmm13, %r14
	addq	%rdx, %rax
	movq	%rdi, -224(%rbp)
	vpextrq	$1, %xmm11, %rdi
	movq	-496(%rbp), %r11
	adcq	$0, %rsi
	addq	%rdi, %rax
	vmovq	%xmm6, %r10
	adcq	$0, %rsi
	addq	%rcx, %rax
	movq	%r11, 64(%r13)
	vextracti128	$0x1, %ymm6, %xmm11
	adcq	$0, %rsi
	addq	%r14, %rax
	vpextrq	$1, %xmm6, %rdx
	adcq	$0, %rsi
	addq	%r10, %rax
	vmovq	%xmm11, %r10
	movq	%rax, -560(%rbp)
	movq	-560(%rbp), %r11
	adcq	$0, %rsi
	vextracti64x4	$0x1, %zmm6, %ymm13
	movq	%rsi, -552(%rbp)
	vpextrq	$1, %xmm11, %rsi
	vmovq	%xmm13, %rdi
	vpextrq	$1, %xmm13, %rcx
	movq	%r11, 72(%r13)
	xorl	%r11d, %r11d
	addq	%rdx, %r10
	vextracti128	$0x1, %ymm13, %xmm1
	adcq	$0, %r11
	addq	%rsi, %r10
	movq	%rax, -832(%rbp)
	vmovq	%xmm1, %rdx
	adcq	$0, %r11
	addq	%rdi, %r10
	vmovq	%xmm5, %r9
	adcq	$0, %r11
	movq	%r10, %rsi
	vpextrq	$1, %xmm5, %r10
	addq	%rcx, %rsi
	movq	%r11, %rdi
	vextracti128	$0x1, %ymm5, %xmm13
	adcq	$0, %rdi
	movq	%rsi, -208(%rbp)
	xorl	%r8d, %r8d
	vmovq	%xmm15, %rcx
	movq	%rsi, -624(%rbp)
	movq	%rdi, -616(%rbp)
	movq	-624(%rbp), %rax
	vmovq	%xmm13, %rdi
	movq	-688(%rbp), %r11
	movq	%rax, 80(%r13)
	vpextrq	$1, %xmm1, %rax
	vextracti64x4	$0x1, %zmm5, %ymm1
	addq	%rdx, %rax
	vmovq	%xmm1, %r14
	vextracti128	$0x1, %ymm1, %xmm4
	adcq	$0, %r8
	addq	%r9, %rax
	vmovq	%xmm4, %rdx
	vpextrq	$1, %xmm4, -368(%rbp)
	adcq	$0, %r8
	addq	%r10, %rax
	movq	-368(%rbp), %r10
	vpextrq	$1, %xmm1, %r9
	movq	%rax, -240(%rbp)
	movq	-240(%rbp), %rsi
	adcq	$0, %r8
	movq	%r8, -232(%rbp)
	vpextrq	$1, %xmm13, %r8
	movq	%rsi, 88(%r13)
	movq	-872(%rbp), %rsi
	addq	%rdi, %r8
	movl	%ecx, %edi
	movq	%rax, -848(%rbp)
	addq	%r14, %r8
	addl	%r12d, %r11d
	movq	%r15, %r12
	movq	%rsi, %rax
	movq	%r10, 112(%r13)
	shrq	$32, %r12
	addq	%rdx, %r9
	shrq	$32, %rax
	movl	%esi, %edx
	movl	%r15d, %r15d
	movq	%r8, -864(%rbp)
	addl	%ecx, %eax
	movq	%r8, 96(%r13)
	movl	%eax, %r10d
	leal	(%r11,%r12), %eax
	movl	-752(%rbp), %r12d
	movq	%r9, 104(%r13)
	movabsq	$-4294967296, %r11
	movq	%r10, %r14
	subq	%rdi, %r14
	movl	-704(%rbp), %edi
	shrq	$63, %r14
	salq	$32, %r14
	addq	%rcx, %r14
	movq	%rax, %rcx
	andq	%r11, %r14
	subq	%rdx, %rcx
	orq	%r10, %r14
	shrq	$63, %rcx
	addq	%rcx, %r14
	movq	-888(%rbp), %rcx
	movq	%r14, 0(%r13)
	movq	-880(%rbp), %r14
	movq	%rcx, %r10
	movl	%ecx, %ecx
	movq	%r14, %rsi
	shrq	$32, %r10
	movl	%r14d, %r14d
	shrq	$32, %rsi
	addl	%r10d, %r12d
	addl	%esi, %edi
	movq	%r12, %rsi
	movq	%rdi, %rdx
	subq	%r14, %rsi
	subq	%r15, %rdx
	shrq	$63, %rsi
	movl	-784(%rbp), %r15d
	shrq	$63, %rdx
	addq	%rax, %rdx
	movq	-896(%rbp), %rax
	salq	$32, %rdx
	orq	%rdi, %rdx
	movq	%rax, %r10
	movl	-768(%rbp), %edi
	shrq	$32, %r10
	addq	%rsi, %rdx
	addl	%r10d, %edi
	movq	-904(%rbp), %r10
	movq	%rdx, 8(%r13)
	movq	%rdi, %rsi
	subq	%rcx, %rsi
	movq	%r10, %rdx
	movq	-816(%rbp), %rcx
	movl	%r10d, %r10d
	shrq	$32, %rdx
	shrq	$63, %rsi
	leal	(%rdx,%r15), %r14d
	addq	%r12, %rsi
	movl	%eax, %r12d
	movq	%rcx, %rdx
	salq	$32, %rsi
	movq	%r14, %rax
	shrq	$32, %rdx
	movq	-224(%rbp), %r15
	orq	%rdi, %rsi
	subq	%r12, %rax
	movl	-800(%rbp), %edi
	shrq	$63, %rax
	shrq	$32, %r15
	addl	%edx, %edi
	addq	%rax, %rsi
	movq	%rsi, 16(%r13)
	movq	%rdi, %r12
	movl	-432(%rbp), %esi
	subq	%r10, %r12
	leal	(%r15,%rsi), %r15d
	shrq	$63, %r12
	addq	%r14, %r12
	movq	%r15, %rax
	movl	%ecx, %r14d
	movq	-832(%rbp), %rcx
	subq	%r14, %rax
	salq	$32, %r12
	orq	%rdi, %r12
	shrq	$63, %rax
	movq	%rcx, %rdx
	addq	%rax, %r12
	shrq	$32, %rdx
	movq	%r12, 24(%r13)
	movl	-496(%rbp), %edi
	movq	-208(%rbp), %r10
	movl	-224(%rbp), %r14d
	movq	%rbx, -952(%rbp)
	addl	%edi, %edx
	movl	-560(%rbp), %esi
	movl	-624(%rbp), %edi
	movq	$1, -224(%rbp)
	vmovdqa	%ymm15, -1008(%rbp)
	movq	%r10, %r12
	movq	%rdx, %rax
	movl	%r10d, %r10d
	shrq	$32, %r12
	subq	%r14, %rax
	movq	-848(%rbp), %r14
	vmovdqa	%xmm2, -976(%rbp)
	addl	%r12d, %esi
	shrq	$63, %rax
	movq	%r8, %r12
	vmovdqa64	%zmm15, -1072(%rbp)
	addq	%r15, %rax
	movl	%ecx, %r15d
	movq	%rsi, %rcx
	movl	%r12d, %r12d
	subq	%r15, %rcx
	salq	$32, %rax
	orq	%rdx, %rax
	shrq	$63, %rcx
	movq	%r14, %rdx
	addq	%rcx, %rax
	shrq	$32, %rdx
	movl	-240(%rbp), %ecx
	movq	%rax, 32(%r13)
	movq	%r8, %rax
	addl	%edx, %edi
	movq	%r9, %rdx
	shrq	$32, %rax
	movq	%rdi, %r15
	addl	%eax, %ecx
	subq	%r10, %rdi
	shrq	$32, %rdx
	shrq	$63, %rdi
	addl	%r8d, %edx
	addq	%rsi, %rdi
	movq	%rdx, %r10
	movl	%r14d, %esi
	movq	%rcx, %r14
	salq	$32, %rdi
	subq	%r12, %r10
	subq	%rsi, %r14
	shrq	$63, %r10
	orq	%r15, %rdi
	movq	-368(%rbp), %r15
	shrq	$63, %r14
	addq	%rcx, %r10
	addq	%r14, %rdi
	movq	%r15, %r8
	salq	$32, %r10
	movq	%rdi, 40(%r13)
	movl	%r15d, %esi
	shrq	$32, %r8
	orq	%r10, %rdx
	addl	%r9d, %r8d
	movl	%r9d, %r9d
	movl	%r8d, %eax
	movq	-720(%rbp), %r8
	movq	%rax, %rcx
	subq	%r9, %rcx
	shrq	$63, %rcx
	addq	%rcx, %rdx
	movq	%rdx, 48(%r13)
	movq	-304(%rbp), %rdx
	shrq	$32, %rdx
	leal	(%rdx,%r15), %edi
	movq	%rdi, %r14
	subq	%rsi, %r14
	shrq	$63, %r14
	addq	%r14, %rax
	salq	$32, %r14
	salq	$32, %rax
	orq	%rdi, %rax
	movq	%rax, 56(%r13)
	subq	%r14, %rax
	andq	%r11, %rax
	movq	-736(%rbp), %r11
	movl	(%r11), %r15d
	orq	%r15, %rax
	movq	%rax, (%r8)
.L248:
	vmovdqa64	%zmm6, -688(%rbp)
	leaq	-112(%rbp), %rsi
	movl	$4, %edi
	vmovdqa64	%zmm8, -560(%rbp)
	vmovdqa64	%zmm9, -496(%rbp)
	vmovdqa64	%zmm10, -432(%rbp)
	vmovdqa64	%zmm0, -368(%rbp)
	vmovdqa64	%zmm5, -304(%rbp)
	salq	-224(%rbp)
	movq	-224(%rbp), %rbx
	vmovdqa64	%zmm7, -624(%rbp)
	vzeroupper
	call	clock_gettime
	movq	-112(%rbp), %rax
	movq	-104(%rbp), %r12
	vmovdqa64	-304(%rbp), %zmm5
	testq	%rbx, %rbx
	vmovdqa64	-368(%rbp), %zmm0
	movq	%rax, -888(%rbp)
	vmovdqa64	-432(%rbp), %zmm10
	movq	%r12, -872(%rbp)
	vmovdqa64	-496(%rbp), %zmm9
	vmovdqa64	-560(%rbp), %zmm8
	vmovdqa64	-624(%rbp), %zmm15
	vmovdqa64	-688(%rbp), %zmm6
	jle	.L244
	vmovdqa64	-1072(%rbp), %zmm3
	vmovq	%xmm0, %rax
	movq	-944(%rbp), %r14
	vextracti128	$0x1, %ymm0, %xmm4
	vmovdqa	-1008(%rbp), %xmm7
	vpextrq	$1, %xmm0, %r12
	vmovq	-976(%rbp), %xmm14
	vextracti128	$0x1, %ymm10, %xmm12
	vextracti64x4	$0x1, %zmm3, %ymm2
	vextracti64x4	$0x1, %zmm0, %ymm3
	vextracti128	$0x1, %ymm9, %xmm1
	vextracti128	$0x1, %ymm2, %xmm13
	vmovq	%xmm2, %rdi
	vpextrq	$1, %xmm2, %rsi
	vmovq	%xmm13, %r15
	addq	%rdi, %r14
	vpextrq	$1, %xmm13, %r8
	addq	%rsi, %r14
	xorl	%r11d, %r11d
	addq	%r15, %r8
	vmovq	%xmm14, %rcx
	vpextrq	$1, %xmm7, %r9
	adcq	$0, %r11
	addq	%rax, %r8
	leaq	(%r9,%rcx), %rdx
	adcq	$0, %r11
	addq	%r12, %r8
	movq	%r14, -208(%rbp)
	vmovq	%xmm4, %rcx
	vpextrq	$1, %xmm4, %rdi
	adcq	$0, %r11
	movq	%rdx, -704(%rbp)
	vextracti128	$0x1, %ymm3, %xmm11
	vmovq	%xmm3, %rdx
	addq	%rcx, %rdi
	movq	%r11, -840(%rbp)
	vpextrq	$1, %xmm3, %rsi
	addq	%rdx, %rdi
	vpextrq	$1, %xmm11, -560(%rbp)
	movq	-560(%rbp), %r11
	movq	%r8, -848(%rbp)
	vmovq	%xmm11, %r15
	addq	%rsi, %rdi
	vmovq	%xmm10, %r8
	addq	%r15, %rdi
	addq	%r11, %r8
	movq	-848(%rbp), %r10
	vpextrq	$1, %xmm10, %rax
	vextracti64x4	$0x1, %zmm10, %ymm4
	vmovq	%xmm12, %r12
	addq	%rax, %r8
	movq	%rdi, -904(%rbp)
	vextracti128	$0x1, %ymm4, %xmm2
	movq	%r10, -896(%rbp)
	addq	%r12, %r8
	vpextrq	$1, %xmm12, %r10
	vmovq	%xmm4, %rcx
	vpextrq	$1, %xmm4, %rsi
	addq	%r10, %r8
	vmovq	%xmm2, %r15
	addq	%rcx, %r8
	xorl	%edx, %edx
	vpextrq	$1, %xmm2, %r11
	addq	%rsi, %r15
	vmovq	%xmm9, %rax
	movq	%r8, -912(%rbp)
	adcq	$0, %rdx
	addq	%r11, %r15
	vpextrq	$1, %xmm9, %r12
	adcq	$0, %rdx
	addq	%rax, %r15
	vmovq	%xmm1, %r10
	adcq	$0, %rdx
	addq	%r12, %r15
	vpextrq	$1, %xmm1, %rcx
	adcq	$0, %rdx
	addq	%r10, %r15
	vextracti64x4	$0x1, %zmm9, %ymm4
	adcq	$0, %rdx
	addq	%rcx, %r15
	vextracti128	$0x1, %ymm4, %xmm3
	adcq	$0, %rdx
	movq	%r15, -864(%rbp)
	vpextrq	$1, %xmm4, %r11
	vmovq	%xmm4, %r15
	movq	%rdx, -856(%rbp)
	vmovq	%xmm3, %rax
	xorl	%edx, %edx
	addq	%r15, %r11
	adcq	$0, %rdx
	vpextrq	$1, %xmm3, %r12
	addq	%rax, %r11
	movq	-864(%rbp), %rsi
	adcq	$0, %rdx
	vmovq	%xmm8, %r10
	addq	%r12, %r11
	vextracti128	$0x1, %ymm8, %xmm13
	adcq	$0, %rdx
	vpextrq	$1, %xmm8, %rcx
	addq	%r10, %r11
	adcq	$0, %rdx
	addq	%rcx, %r11
	movq	%rsi, -920(%rbp)
	vmovq	%xmm13, %rsi
	adcq	$0, %rdx
	vpextrq	$1, %xmm13, %r15
	addq	%rsi, %r11
	adcq	$0, %rdx
	vextracti64x4	$0x1, %zmm8, %ymm1
	addq	%r15, %r11
	vextracti128	$0x1, %ymm1, %xmm12
	adcq	$0, %rdx
	vmovq	%xmm1, %r12
	movq	%r11, -688(%rbp)
	vpextrq	$1, %xmm1, %rax
	vmovq	%xmm12, %r10
	movq	%rdx, -680(%rbp)
	xorl	%edx, %edx
	addq	%r12, %rax
	vpextrq	$1, %xmm12, %rcx
	movq	-688(%rbp), %r11
	vmovq	%xmm15, %rsi
	adcq	$0, %rdx
	addq	%r10, %rax
	vextracti128	$0x1, %ymm15, %xmm11
	adcq	$0, %rdx
	addq	%rcx, %rax
	vpextrq	$1, %xmm15, %r15
	movq	%r11, -880(%rbp)
	adcq	$0, %rdx
	addq	%rsi, %rax
	vextracti64x4	$0x1, %zmm15, %ymm13
	vmovq	%xmm11, %r11
	adcq	$0, %rdx
	addq	%r15, %rax
	adcq	$0, %rdx
	vmovq	%xmm13, %rsi
	addq	%r11, %rax
	adcq	$0, %rdx
	vpextrq	$1, %xmm11, %r10
	vpextrq	$1, %xmm13, %rcx
	xorl	%r15d, %r15d
	vextracti128	$0x1, %ymm13, %xmm4
	addq	%r10, %rsi
	movq	%rax, -752(%rbp)
	vmovq	%xmm6, %rax
	adcq	$0, %r15
	vmovq	%xmm4, %r11
	addq	%rcx, %rsi
	movq	%rdx, -744(%rbp)
	adcq	$0, %r15
	addq	%r11, %rsi
	vpextrq	$1, %xmm4, %r12
	movq	-752(%rbp), %rdx
	adcq	$0, %r15
	addq	%r12, %rsi
	vextracti128	$0x1, %ymm6, %xmm2
	adcq	$0, %r15
	addq	%rax, %rsi
	vmovq	%xmm2, %r11
	movq	%rdx, -768(%rbp)
	adcq	$0, %r15
	xorl	%r12d, %r12d
	vpextrq	$1, %xmm2, %rcx
	movq	%rsi, -784(%rbp)
	movq	%r15, -776(%rbp)
	vpextrq	$1, %xmm6, %r15
	vextracti64x4	$0x1, %zmm6, %ymm11
	movq	-784(%rbp), %rsi
	addq	%r15, %r11
	vmovq	%xmm11, %rax
	vpextrq	$1, %xmm11, %r10
	adcq	$0, %r12
	addq	%rcx, %r11
	vextracti128	$0x1, %ymm11, %xmm1
	movq	%rsi, -368(%rbp)
	adcq	$0, %r12
	addq	%rax, %r11
	vmovq	%xmm5, %rcx
	adcq	$0, %r12
	addq	%r10, %r11
	vpextrq	$1, %xmm5, %r10
	adcq	$0, %r12
	movq	%r11, -800(%rbp)
	xorl	%eax, %eax
	vmovq	%xmm1, %r11
	movq	%r12, -792(%rbp)
	vpextrq	$1, %xmm1, %r12
	movq	-800(%rbp), %r15
	vextracti128	$0x1, %ymm5, %xmm12
	addq	%r11, %r12
	vextracti64x4	$0x1, %zmm5, %ymm2
	vmovq	%xmm12, %r11
	adcq	$0, %rax
	addq	%rcx, %r12
	movq	%r15, -304(%rbp)
	vmovq	%xmm2, %rcx
	adcq	$0, %rax
	addq	%r10, %r12
	movq	-704(%rbp), %r10
	vextracti128	$0x1, %ymm2, %xmm13
	movq	%r12, -816(%rbp)
	adcq	$0, %rax
	vpextrq	$1, %xmm12, %r12
	movq	-816(%rbp), %r15
	movq	%rax, -808(%rbp)
	xorl	%eax, %eax
	addq	%r11, %r12
	movq	%r10, %rsi
	adcq	$0, %rax
	addq	%rcx, %r12
	movq	%r15, -432(%rbp)
	vmovq	%xmm7, %rcx
	adcq	$0, %rax
	shrq	$32, %rsi
	movq	%r12, -832(%rbp)
	vpextrq	$1, %xmm2, -624(%rbp)
	movq	-832(%rbp), %rdx
	movq	-624(%rbp), %r15
	addl	%ecx, %esi
	vmovq	%xmm13, %r11
	vmovd	%ecx, %xmm7
	movq	%rax, -824(%rbp)
	vpextrq	$1, %xmm13, %rax
	leaq	(%r15,%r11), %r12
	movq	%rdx, -496(%rbp)
	movq	%r14, %r15
	movl	%esi, %edx
	movq	%rdx, -704(%rbp)
	shrq	$32, %r15
	movq	-704(%rbp), %rdx
	vmovq	%xmm14, %r11
	movq	%r15, -928(%rbp)
	vmovq	%xmm7, %r15
	leal	(%r9,%r11), %r9d
	vmovd	%r10d, %xmm14
	subq	%r15, %rdx
	movq	%r12, -240(%rbp)
	movq	-928(%rbp), %r12
	movq	%rdi, %r15
	shrq	$63, %rdx
	movq	-704(%rbp), %r11
	vmovq	%xmm14, %r10
	addl	%r9d, %r12d
	salq	$32, %rdx
	movl	%r12d, %esi
	addq	%rcx, %rdx
	movq	-896(%rbp), %r12
	movabsq	$-4294967296, %rcx
	andq	%rcx, %rdx
	movq	%rsi, %rcx
	subq	%r10, %rcx
	orq	%r11, %rdx
	movl	-848(%rbp), %r10d
	shrq	$63, %rcx
	leaq	(%rdx,%rcx), %r9
	movq	%r12, %rdx
	shrq	$32, %rdx
	movq	%r9, -704(%rbp)
	leal	(%rdx,%r14), %r11d
	movl	-208(%rbp), %r14d
	movq	%rdi, %rdx
	movq	%r11, %r9
	shrq	$32, %rdx
	subq	%r14, %r9
	addl	%edx, %r10d
	movq	%r8, %rdx
	shrq	$63, %r9
	movq	%r10, %rcx
	shrq	$32, %rdx
	addq	%rsi, %r9
	movl	%r12d, %esi
	leal	(%rdx,%rdi), %edi
	subq	%rsi, %rcx
	salq	$32, %r9
	orq	%r11, %r9
	shrq	$63, %rcx
	movq	%r8, %r11
	leaq	(%r9,%rcx), %r12
	movq	-880(%rbp), %r9
	movq	%r12, -848(%rbp)
	movq	-920(%rbp), %r12
	movq	%r12, %rdx
	shrq	$32, %rdx
	leal	(%rdx,%r8), %esi
	movl	%r15d, %r8d
	movq	%rdi, %rdx
	movl	%r9d, %r15d
	subq	%r8, %rdx
	movq	%rsi, %rcx
	movl	-688(%rbp), %r8d
	shrq	$63, %rdx
	addq	%r10, %rdx
	movl	%r11d, %r10d
	movl	%r12d, %r11d
	subq	%r10, %rcx
	salq	$32, %rdx
	orq	%rdi, %rdx
	shrq	$63, %rcx
	movq	-768(%rbp), %rdi
	leaq	(%rdx,%rcx), %r14
	movl	-864(%rbp), %ecx
	movq	%r9, %rdx
	shrq	$32, %rdx
	movl	%edi, %r10d
	addl	%edx, %ecx
	movq	%rdi, %rdx
	shrq	$32, %rdx
	addl	%edx, %r8d
	movq	%rcx, %rdx
	subq	%r11, %rdx
	movq	%r8, %r12
	movq	-368(%rbp), %r11
	shrq	$63, %rdx
	subq	%r15, %r12
	addq	%rsi, %rdx
	shrq	$63, %r12
	movl	%r11d, %r9d
	salq	$32, %rdx
	orq	%rcx, %rdx
	movl	-752(%rbp), %ecx
	addq	%rdx, %r12
	movq	%r11, %rdx
	shrq	$32, %rdx
	movq	%r12, -208(%rbp)
	addl	%edx, %ecx
	movq	-304(%rbp), %rdx
	movl	-784(%rbp), %esi
	movq	-432(%rbp), %r11
	movq	-496(%rbp), %r15
	shrq	$32, %rdx
	leal	(%rdx,%rsi), %r12d
	movq	%rcx, %rdx
	movl	-304(%rbp), %esi
	subq	%r10, %rdx
	movq	%r12, %rdi
	shrq	$63, %rdx
	subq	%r9, %rdi
	vmovq	%xmm13, %r9
	addq	%r8, %rdx
	shrq	$63, %rdi
	movl	-816(%rbp), %r8d
	salq	$32, %rdx
	orq	%rcx, %rdx
	movl	-800(%rbp), %ecx
	addq	%rdx, %rdi
	movq	%r11, %rdx
	shrq	$32, %rdx
	movq	%rdi, -688(%rbp)
	movq	-240(%rbp), %rdi
	addl	%edx, %ecx
	movq	%r15, %rdx
	movl	%r15d, %r15d
	shrq	$32, %rdx
	leal	(%rdx,%r8), %r8d
	movq	%rcx, %rdx
	subq	%rsi, %rdx
	movq	%r8, %r10
	movq	-624(%rbp), %rsi
	shrq	$63, %rdx
	addq	%r12, %rdx
	movl	%r11d, %r12d
	salq	$32, %rdx
	subq	%r12, %r10
	movq	%rax, %r12
	orq	%rcx, %rdx
	shrq	$63, %r10
	movl	-832(%rbp), %ecx
	addl	%r9d, %esi
	leaq	(%rdx,%r10), %r11
	movq	%rdi, %rdx
	shrq	$32, %r12
	movl	%eax, %r9d
	shrq	$32, %rdx
	leal	(%rsi,%r12), %r10d
	addl	%edx, %ecx
	movq	%rcx, %rdx
	subq	%r15, %rdx
	shrq	$63, %rdx
	addq	%r8, %rdx
	movl	%edi, %r8d
	movq	%r10, %rdi
	salq	$32, %rdx
	subq	%r8, %rdi
	orq	%rcx, %rdx
	movq	-560(%rbp), %rcx
	shrq	$63, %rdi
	leaq	(%rdx,%rdi), %r8
	movl	%ebx, %edi
	xorl	%edx, %edx
	shrq	$32, %rcx
	leal	(%rcx,%rax), %esi
	movq	%rsi, %r12
	subq	%r9, %r12
	shrq	$63, %r12
	leaq	(%r10,%r12), %r10
	salq	$32, %r12
	salq	$32, %r10
	orq	%r10, %rsi
	movabsq	$-4294967296, %r10
	movq	%rsi, %r15
	subq	%r12, %r15
	andq	%r15, %r10
	andl	$7, %edi
	je	.L400
	cmpl	$1, %edi
	je	.L348
	cmpl	$2, %edi
	je	.L349
	cmpl	$3, %edi
	je	.L350
	cmpl	$4, %edi
	je	.L351
	cmpl	$5, %edi
	je	.L352
	cmpl	$6, %edi
	je	.L353
	vmovdqa64	%zmm0, 64(%r13)
	movl	$1, %edx
	movq	%rax, 112(%r13)
.L353:
	vmovdqa64	%zmm0, 64(%r13)
	addl	$1, %edx
	movq	%rax, 112(%r13)
.L352:
	vmovdqa64	%zmm0, 64(%r13)
	addl	$1, %edx
	movq	%rax, 112(%r13)
.L351:
	vmovdqa64	%zmm0, 64(%r13)
	addl	$1, %edx
	movq	%rax, 112(%r13)
.L350:
	vmovdqa64	%zmm0, 64(%r13)
	addl	$1, %edx
	movq	%rax, 112(%r13)
.L349:
	vmovdqa64	%zmm0, 64(%r13)
	addl	$1, %edx
	movq	%rax, 112(%r13)
.L348:
	addl	$1, %edx
	vmovdqa64	%zmm0, 64(%r13)
	movq	%rax, 112(%r13)
	cmpl	%ebx, %edx
	je	.L391
.L400:
	movq	-368(%rbp), %rcx
	movq	-304(%rbp), %r12
	movq	-432(%rbp), %r9
	movq	-496(%rbp), %r15
.L245:
	addl	$8, %edx
	vmovdqa64	%zmm0, 64(%r13)
	movq	%rax, 112(%r13)
	cmpl	%ebx, %edx
	jne	.L245
	movq	%rcx, -368(%rbp)
	movq	%r12, -304(%rbp)
	movq	%r9, -432(%rbp)
	movq	%r15, -496(%rbp)
.L391:
	movq	-736(%rbp), %rbx
	movq	-768(%rbp), %rdx
	movq	-368(%rbp), %rcx
	movq	-304(%rbp), %r12
	movq	(%rbx), %rdi
	movq	-432(%rbp), %r9
	movq	%r14, 16(%r13)
	vmovdqa64	%zmm0, 64(%r13)
	movq	-496(%rbp), %r15
	movq	-240(%rbp), %rbx
	movq	%rdx, 64(%r13)
	movq	-208(%rbp), %r14
	movq	%rcx, 72(%r13)
	movq	-848(%rbp), %rdx
	movq	%rax, 112(%r13)
	movq	-688(%rbp), %rcx
	movq	-704(%rbp), %rax
	movq	%r11, 40(%r13)
	movl	%edi, %r11d
	movq	%r12, 80(%r13)
	orq	%r10, %r11
	movq	%r9, 88(%r13)
	movq	%r15, 96(%r13)
	movq	%rbx, 104(%r13)
	movq	%rax, 0(%r13)
	movq	%rdx, 8(%r13)
	movq	%r14, 24(%r13)
	movq	%rcx, 32(%r13)
	vmovdqa64	%zmm10, 128(%r13)
	vmovdqa64	%zmm9, 192(%r13)
	vmovdqa64	%zmm8, 256(%r13)
	vmovdqa64	%zmm15, 320(%r13)
	vmovdqa64	%zmm6, 384(%r13)
	vmovdqa64	%zmm5, 448(%r13)
	movq	%r8, 48(%r13)
	movq	-720(%rbp), %r8
	movq	%rsi, 56(%r13)
	movq	%r11, (%r8)
.L244:
	vmovdqa64	%zmm6, -688(%rbp)
	leaq	-112(%rbp), %rsi
	movl	$4, %edi
	vmovdqa64	%zmm8, -560(%rbp)
	vmovdqa64	%zmm9, -496(%rbp)
	vmovdqa64	%zmm10, -432(%rbp)
	vmovdqa64	%zmm0, -368(%rbp)
	vmovdqa64	%zmm5, -304(%rbp)
	vmovdqa64	%zmm15, -624(%rbp)
	vzeroupper
	call	clock_gettime
	movq	-104(%rbp), %rsi
	movq	-112(%rbp), %r10
	movq	-888(%rbp), %rdi
	movq	-872(%rbp), %r12
	vmovdqa64	-304(%rbp), %zmm5
	movq	%rsi, %r9
	vmovdqa64	-368(%rbp), %zmm0
	vmovdqa64	-432(%rbp), %zmm10
	subq	%rdi, %r10
	subq	%r12, %r9
	vmovdqa64	-496(%rbp), %zmm9
	vmovdqa64	-560(%rbp), %zmm8
	vmovdqa64	-624(%rbp), %zmm7
	vmovdqa64	-688(%rbp), %zmm6
	jns	.L247
	addq	$1000000000, %rsi
	subq	$1, %r10
	movq	%rsi, %r9
	subq	%r12, %r9
.L247:
	imulq	$1000000000, %r10, %r15
	addq	%r15, %r9
	cmpq	$249999999, %r9
	jle	.L248
	movabsq	$2361183241434822607, %rax
	vxorpd	%xmm15, %xmm15, %xmm15
	movl	$.LC21, %edi
	movq	-952(%rbp), %rbx
	imulq	%r9
	sarq	$63, %r9
	movl	$1, %eax
	movl	$1, %r12d
	vcvtsi2sdq	-224(%rbp), %xmm15, %xmm1
	sarq	$7, %rdx
	subq	%r9, %rdx
	vcvtsi2sdq	%rdx, %xmm15, %xmm3
	vdivsd	%xmm1, %xmm3, %xmm0
	vzeroupper
	call	printf
	leaq	-144(%rbp), %rdx
	leaq	-160(%rbp), %rsi
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
.L254:
	leaq	-112(%rbp), %rsi
	movl	$4, %edi
	addq	%r12, %r12
	xorl	%r13d, %r13d
	call	clock_gettime
	movq	-112(%rbp), %r15
	movq	-104(%rbp), %r14
	testq	%r12, %r12
	jle	.L253
	movq	%r12, %rcx
	andl	$6, %ecx
	je	.L252
	cmpq	$1, %rcx
	je	.L355
	cmpq	$2, %rcx
	je	.L356
	cmpq	$3, %rcx
	je	.L357
	cmpq	$4, %rcx
	je	.L358
	cmpq	$5, %rcx
	je	.L359
	cmpq	$6, %rcx
	je	.L360
	leaq	-144(%rbp), %rdx
	leaq	-128(%rbp), %rdi
	movl	$1, %r13d
	leaq	-160(%rbp), %rsi
	call	__gmpz_mul
.L360:
	leaq	-144(%rbp), %rdx
	leaq	-160(%rbp), %rsi
	addq	$1, %r13
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
.L359:
	leaq	-144(%rbp), %rdx
	leaq	-160(%rbp), %rsi
	addq	$1, %r13
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
.L358:
	leaq	-144(%rbp), %rdx
	leaq	-160(%rbp), %rsi
	addq	$1, %r13
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
.L357:
	leaq	-144(%rbp), %rdx
	leaq	-160(%rbp), %rsi
	addq	$1, %r13
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
.L356:
	leaq	-144(%rbp), %rdx
	leaq	-160(%rbp), %rsi
	addq	$1, %r13
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
.L355:
	leaq	-144(%rbp), %rdx
	leaq	-160(%rbp), %rsi
	addq	$1, %r13
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
	cmpq	%r13, %r12
	je	.L253
.L252:
	leaq	-144(%rbp), %rdx
	leaq	-160(%rbp), %rsi
	addq	$8, %r13
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
	leaq	-144(%rbp), %rdx
	leaq	-160(%rbp), %rsi
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
	leaq	-144(%rbp), %rdx
	leaq	-160(%rbp), %rsi
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
	leaq	-144(%rbp), %rdx
	leaq	-160(%rbp), %rsi
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
	leaq	-144(%rbp), %rdx
	leaq	-160(%rbp), %rsi
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
	leaq	-144(%rbp), %rdx
	leaq	-160(%rbp), %rsi
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
	leaq	-144(%rbp), %rdx
	leaq	-160(%rbp), %rsi
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
	leaq	-144(%rbp), %rdx
	leaq	-160(%rbp), %rsi
	leaq	-128(%rbp), %rdi
	call	__gmpz_mul
	cmpq	%r13, %r12
	jne	.L252
.L253:
	leaq	-112(%rbp), %rsi
	movl	$4, %edi
	call	clock_gettime
	movq	-104(%rbp), %r11
	movq	-112(%rbp), %r8
	movq	%r11, %rsi
	subq	%r15, %r8
	subq	%r14, %rsi
	jns	.L251
	addq	$1000000000, %r11
	subq	$1, %r8
	movq	%r11, %rsi
	subq	%r14, %rsi
.L251:
	imulq	$1000000000, %r8, %r10
	addq	%r10, %rsi
	cmpq	$249999999, %rsi
	jle	.L254
	movabsq	$2361183241434822607, %rax
	vxorpd	%xmm12, %xmm12, %xmm12
	movl	$.LC22, %edi
	imulq	%rsi
	sarq	$63, %rsi
	movl	$1, %eax
	vcvtsi2sdq	%r12, %xmm12, %xmm11
	xorl	%r12d, %r12d
	sarq	$7, %rdx
	subq	%rsi, %rdx
	vcvtsi2sdq	%rdx, %xmm12, %xmm2
	vdivsd	%xmm11, %xmm2, %xmm0
	call	printf
	movq	%rbx, %rdi
	call	strlen
	movq	%rax, %r15
	movq	%rax, %r9
	andl	$7, %r15d
	je	.L393
	movq	-200(%rbp), %rdi
	movzbl	(%rdi), %r14d
	cmpb	%r14b, (%rbx)
	jne	.L390
	movl	$1, %r12d
	cmpq	$1, %r15
	je	.L393
	cmpq	$2, %r15
	je	.L361
	cmpq	$3, %r15
	je	.L362
	cmpq	$4, %r15
	je	.L363
	cmpq	$5, %r15
	je	.L364
	cmpq	$6, %r15
	je	.L365
	movl	$2, %ecx
	movzbl	-1(%rdi,%rcx), %r13d
	cmpb	%r13b, (%rbx,%r12)
	jne	.L390
	movq	%rcx, %r12
.L365:
	movq	-200(%rbp), %r8
	leaq	1(%r12), %r11
	movzbl	(%r8,%r12), %esi
	cmpb	%sil, (%rbx,%r12)
	jne	.L390
	movq	%r11, %r12
.L364:
	movq	-200(%rbp), %rax
	leaq	1(%r12), %r10
	movzbl	(%rax,%r12), %edx
	cmpb	%dl, (%rbx,%r12)
	jne	.L390
	movq	%r10, %r12
.L363:
	movq	-200(%rbp), %rdi
	leaq	1(%r12), %r15
	movzbl	(%rdi,%r12), %r14d
	cmpb	%r14b, (%rbx,%r12)
	jne	.L390
	movq	%r15, %r12
.L362:
	movq	-200(%rbp), %r13
	leaq	1(%r12), %rcx
	movzbl	0(%r13,%r12), %r11d
	cmpb	%r11b, (%rbx,%r12)
	jne	.L390
	movq	%rcx, %r12
.L361:
	movq	-200(%rbp), %r10
	leaq	1(%r12), %r8
	movzbl	(%r10,%r12), %esi
	cmpb	%sil, (%rbx,%r12)
	jne	.L390
	movq	%r8, %r12
	jmp	.L255
.L256:
	movzbl	(%r10,%r12), %edx
	leaq	1(%r12), %rax
	cmpb	%dl, (%rbx,%r12)
	jne	.L390
	movzbl	(%r10,%rax), %edi
	movq	%rax, %r12
	leaq	1(%rax), %r15
	cmpb	%dil, (%rbx,%rax)
	jne	.L390
	movzbl	(%r10,%r15), %r14d
	movq	%r15, %r12
	cmpb	%r14b, (%rbx,%r15)
	jne	.L390
	movzbl	2(%r10,%rax), %r13d
	leaq	2(%rax), %r12
	leaq	3(%rax), %rcx
	cmpb	%r13b, 2(%rbx,%rax)
	jne	.L390
	movzbl	3(%r10,%rax), %r8d
	movq	%rcx, %r12
	leaq	4(%rax), %r11
	cmpb	%r8b, 3(%rbx,%rax)
	jne	.L390
	movzbl	4(%r10,%rax), %edx
	movq	%r11, %r12
	leaq	5(%rax), %rsi
	cmpb	%dl, 4(%rbx,%rax)
	jne	.L390
	movzbl	5(%r10,%rax), %edi
	movq	%rsi, %r12
	leaq	6(%rax), %r15
	cmpb	%dil, 5(%rbx,%rax)
	jne	.L390
	movzbl	6(%r10,%rax), %ecx
	movq	%r15, %r12
	leaq	7(%rax), %r14
	cmpb	%cl, 6(%rbx,%rax)
	jne	.L390
	movq	%r14, %r12
.L255:
	cmpq	%r12, %r9
	jne	.L256
	movl	$.LC27, %esi
	movl	$.LC28, %edi
	xorl	%eax, %eax
	call	printf
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%r9
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r9), %rsp
	.cfi_def_cfa 7, 8
	ret
.L393:
	.cfi_restore_state
	movq	-200(%rbp), %r10
	jmp	.L255
.L390:
	movl	$.LC23, %edi
	call	puts
	movsbl	(%rbx,%r12), %edx
	movl	%r12d, %esi
	xorl	%eax, %eax
	movq	-200(%rbp), %r13
	movl	$.LC24, %edi
	movsbl	0(%r13,%r12), %ecx
	call	printf
	movq	%r13, %rsi
	movl	$.LC25, %edi
	xorl	%eax, %eax
	call	printf
	movl	$.LC26, %edi
	movq	%rbx, %rsi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE6653:
	.size	test, .-test
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB6654:
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
.LFE6654:
	.size	main, .-main
	.ident	"GCC: (GNU) 14.2.1 20250110 (Red Hat 14.2.1-7)"
	.section	.note.GNU-stack,"",@progbits
