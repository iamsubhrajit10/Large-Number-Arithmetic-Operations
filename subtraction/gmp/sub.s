	.file	"sub.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Error opening file %s: %s\n"
	.text
	.p2align 4
	.type	open_gzfile.part.0, @function
open_gzfile.part.0:
.LFB5806:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	call	__errno_location@PLT
	movl	(%rax), %edi
	call	strerror@PLT
	movq	stderr(%rip), %rdi
	movq	%r12, %rcx
	leaq	.LC0(%rip), %rdx
	movq	%rax, %r8
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE5806:
	.size	open_gzfile.part.0, .-open_gzfile.part.0
	.p2align 4
	.globl	perf_event_open
	.type	perf_event_open, @function
perf_event_open:
.LFB5787:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%r8, %r9
	xorl	%eax, %eax
	movl	%ecx, %r8d
	movl	%edx, %ecx
	movl	%esi, %edx
	movq	%rdi, %rsi
	movl	$298, %edi
	call	syscall@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	cltq
	ret
	.cfi_endproc
.LFE5787:
	.size	perf_event_open, .-perf_event_open
	.section	.rodata.str1.1
.LC1:
	.string	"Error opening event %d: %s\n"
	.text
	.p2align 4
	.globl	initialize_perf
	.type	initialize_perf, @function
initialize_perf:
.LFB5789:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	$96, %ecx
	xorl	%eax, %eax
	movabsq	$549755813889, %rdx
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	fd(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	pe(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rbp, %rdi
	xorl	%ebx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	rep stosq
	movq	%rdx, 384+pe(%rip)
	addq	$2, %rdx
	movl	$128, 4+pe(%rip)
	movb	$-59, 40+pe(%rip)
	movl	$128, 132+pe(%rip)
	movl	$128, 260+pe(%rip)
	movb	$-59, 424+pe(%rip)
	movb	$-59, 552+pe(%rip)
	movb	$-59, 680+pe(%rip)
	movq	$1, 136+pe(%rip)
	movb	$-27, 168+pe(%rip)
	movq	$1, 264+pe(%rip)
	movb	$-43, 296+pe(%rip)
	movq	$2, 392+pe(%rip)
	movq	%rdx, 512+pe(%rip)
	movq	%rdx, 640+pe(%rip)
	movq	$65536, 648+pe(%rip)
	.p2align 4,,10
	.p2align 3
.L8:
	movq	%rbx, %rsi
	movl	CORE_NO(%rip), %ecx
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	salq	$7, %rsi
	movl	$-1, %r8d
	movl	$298, %edi
	xorl	%eax, %eax
	addq	%rbp, %rsi
	call	syscall@PLT
	movl	%eax, (%r12,%rbx,4)
	cmpl	$-1, %eax
	je	.L11
	addq	$1, %rbx
	cmpq	$6, %rbx
	jne	.L8
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
.L11:
	.cfi_restore_state
	call	__errno_location@PLT
	movl	(%rax), %edi
	call	strerror@PLT
	movq	stderr(%rip), %rdi
	movl	%ebx, %ecx
	leaq	.LC1(%rip), %rdx
	movq	%rax, %r8
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE5789:
	.size	initialize_perf, .-initialize_perf
	.section	.rodata.str1.1
.LC2:
	.string	"Error reading counter value"
	.text
	.p2align 4
	.globl	read_perf
	.type	read_perf, @function
read_perf:
.LFB5790:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	fd(%rip), %rbx
	leaq	24(%rbx), %r12
	.p2align 4,,10
	.p2align 3
.L14:
	movl	(%rbx), %edi
	movl	$8, %edx
	movq	%rbp, %rsi
	call	read@PLT
	cmpq	$-1, %rax
	je	.L17
	addq	$4, %rbx
	addq	$8, %rbp
	cmpq	%r12, %rbx
	jne	.L14
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L17:
	.cfi_restore_state
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE5790:
	.size	read_perf, .-read_perf
	.section	.rodata.str1.1
.LC3:
	.string	"%lu,"
.LC4:
	.string	"Error writing to gzFile: %s\n"
.LC5:
	.string	"\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"Error writing newline to gzFile: %s\n"
	.text
	.p2align 4
	.globl	write_perf
	.type	write_perf, @function
write_perf:
.LFB5791:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	48(%rsi), %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	.LC3(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L20:
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	gzprintf@PLT
	testl	%eax, %eax
	jle	.L27
	addq	$8, %rbx
	cmpq	%r13, %rbx
	jne	.L20
	xorl	%eax, %eax
	leaq	.LC5(%rip), %rsi
	movq	%rbp, %rdi
	call	gzprintf@PLT
	testl	%eax, %eax
	jle	.L28
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L29
	addq	$24, %rsp
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
.L27:
	.cfi_restore_state
	leaq	4(%rsp), %rsi
	movq	%rbp, %rdi
	call	gzerror@PLT
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
.L26:
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L29:
	call	__stack_chk_fail@PLT
.L28:
	leaq	4(%rsp), %rsi
	movq	%rbp, %rdi
	call	gzerror@PLT
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rcx
	jmp	.L26
	.cfi_endproc
.LFE5791:
	.size	write_perf, .-write_perf
	.p2align 4
	.globl	start_perf
	.type	start_perf, @function
start_perf:
.LFB5792:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	fd(%rip), %rbx
	leaq	24(%rbx), %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L31:
	movl	(%rbx), %edi
	xorl	%edx, %edx
	movl	$9219, %esi
	xorl	%eax, %eax
	addq	$4, %rbx
	call	ioctl@PLT
	movl	-4(%rbx), %edi
	xorl	%edx, %edx
	movl	$9216, %esi
	xorl	%eax, %eax
	call	ioctl@PLT
	cmpq	%rbp, %rbx
	jne	.L31
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5792:
	.size	start_perf, .-start_perf
	.section	.rodata.str1.1
.LC7:
	.string	"Error disabling counter"
	.text
	.p2align 4
	.globl	stop_perf
	.type	stop_perf, @function
stop_perf:
.LFB5793:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	fd(%rip), %rbx
	leaq	24(%rbx), %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L36:
	movl	(%rbx), %edi
	xorl	%edx, %edx
	xorl	%eax, %eax
	movl	$9217, %esi
	call	ioctl@PLT
	cmpl	$-1, %eax
	je	.L39
	addq	$4, %rbx
	cmpq	%rbp, %rbx
	jne	.L36
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L39:
	.cfi_restore_state
	leaq	.LC7(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE5793:
	.size	stop_perf, .-stop_perf
	.p2align 4
	.globl	trim_leading_zeros_and_whitespace
	.type	trim_leading_zeros_and_whitespace, @function
trim_leading_zeros_and_whitespace:
.LFB5794:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	jmp	.L41
	.p2align 4,,10
	.p2align 3
.L42:
	addq	$1, %r12
.L41:
	movsbq	(%r12), %rbx
	cmpb	$48, %bl
	je	.L42
	call	__ctype_b_loc@PLT
	movq	(%rax), %rax
	testb	$32, 1(%rax,%rbx,2)
	jne	.L42
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5794:
	.size	trim_leading_zeros_and_whitespace, .-trim_leading_zeros_and_whitespace
	.p2align 4
	.globl	trim_trailing_newline
	.type	trim_trailing_newline, @function
trim_trailing_newline:
.LFB5795:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	strlen@PLT
	testq	%rax, %rax
	je	.L52
	leaq	-1(%rbx,%rax), %rax
	cmpb	$10, (%rax)
	je	.L54
.L52:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L54:
	.cfi_restore_state
	movb	$0, (%rax)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5795:
	.size	trim_trailing_newline, .-trim_trailing_newline
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"The two subs are not equal, lengths are different"
	.align 8
.LC9:
	.string	"Length of result = %ld, length of result_gmp = %ld\n"
	.section	.rodata.str1.1
.LC10:
	.string	"result = %s\n result_gmp = %s\n"
.LC11:
	.string	"The two subs are not equal"
.LC12:
	.string	"Mismatch at index %ld\n"
	.section	.rodata.str1.8
	.align 8
.LC13:
	.string	"result[%ld] = %c, result_gmp[%ld] = %c\n"
	.section	.rodata.str1.1
.LC14:
	.string	"result = %s\nresult_gmp = %s\n"
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"The two subs are not equal, one is negative and the other is not"
	.text
	.p2align 4
	.globl	check_result
	.type	check_result, @function
check_result:
.LFB5796:
	.cfi_startproc
	endbr64
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movzbl	(%rdi), %ebx
	movzbl	(%rsi), %ebp
	cmpb	$45, %bl
	sete	%al
	xorl	%edx, %edx
	cmpb	$45, %bpl
	sete	%dl
	leaq	(%rdi,%rax), %r12
	leaq	(%rsi,%rdx), %r13
	call	__ctype_b_loc@PLT
	movq	(%rax), %r10
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L59:
	addq	$1, %r12
.L58:
	movsbq	(%r12), %rcx
	cmpb	$48, %cl
	je	.L59
	testb	$32, 1(%r10,%rcx,2)
	jne	.L59
	movsbq	0(%r13), %rsi
	cmpb	$48, %sil
	jne	.L133
	.p2align 4,,10
	.p2align 3
.L61:
	movsbq	1(%r13), %rsi
	addq	$1, %r13
	cmpb	$48, %sil
	je	.L61
.L133:
	testb	$32, 1(%r10,%rsi,2)
	jne	.L61
	movq	%r12, %rdi
	call	strlen@PLT
	testq	%rax, %rax
	je	.L62
	leaq	-1(%r12,%rax), %rdi
	cmpb	$10, (%rdi)
	je	.L134
.L62:
	movq	%r13, %rdi
	call	strlen@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.L135
.L63:
	movq	%r12, %rdi
	call	strlen@PLT
	testq	%rax, %rax
	je	.L67
.L65:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	movq	%r13, %rdi
	call	strlen@PLT
	movq	%r12, %rdi
	movq	%rax, %r15
	call	strlen@PLT
	movq	%r15, %rcx
	movl	$1, %edi
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%r13, %rcx
	movq	%r12, %rdx
	movl	$1, %edi
	leaq	.LC10(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
.L55:
	addq	$24, %rsp
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
.L135:
	.cfi_restore_state
	leaq	-1(%r13,%rax), %r8
	cmpb	$10, (%r8)
	je	.L136
.L64:
	movq	%r12, %rdi
	call	strlen@PLT
	cmpq	%r15, %rax
	jne	.L65
	testq	%r15, %r15
	je	.L67
	xorl	%r14d, %r14d
	andl	$7, %r15d
	je	.L66
	cmpq	$1, %r15
	je	.L114
	cmpq	$2, %r15
	je	.L115
	cmpq	$3, %r15
	je	.L116
	cmpq	$4, %r15
	je	.L117
	cmpq	$5, %r15
	je	.L118
	cmpq	$6, %r15
	je	.L119
	movzbl	0(%r13), %r9d
	movq	%r12, %rcx
	movq	%r13, %r15
	cmpb	%r9b, (%r12)
	jne	.L131
	movl	$1, %r14d
.L119:
	movzbl	0(%r13,%r14), %r10d
	leaq	(%r12,%r14), %rcx
	leaq	0(%r13,%r14), %r15
	cmpb	%r10b, (%r12,%r14)
	jne	.L131
	addq	$1, %r14
.L118:
	movzbl	0(%r13,%r14), %r11d
	leaq	(%r12,%r14), %rcx
	leaq	0(%r13,%r14), %r15
	cmpb	%r11b, (%r12,%r14)
	jne	.L131
	addq	$1, %r14
.L117:
	movzbl	0(%r13,%r14), %edx
	leaq	(%r12,%r14), %rcx
	leaq	0(%r13,%r14), %r15
	cmpb	%dl, (%r12,%r14)
	jne	.L131
	addq	$1, %r14
.L116:
	movzbl	0(%r13,%r14), %esi
	leaq	(%r12,%r14), %rcx
	leaq	0(%r13,%r14), %r15
	cmpb	%sil, (%r12,%r14)
	jne	.L131
	addq	$1, %r14
.L115:
	movzbl	0(%r13,%r14), %edi
	leaq	(%r12,%r14), %rcx
	leaq	0(%r13,%r14), %r15
	cmpb	%dil, (%r12,%r14)
	jne	.L131
	addq	$1, %r14
.L114:
	movzbl	0(%r13,%r14), %r8d
	leaq	(%r12,%r14), %rcx
	leaq	0(%r13,%r14), %r15
	cmpb	%r8b, (%r12,%r14)
	jne	.L131
	addq	$1, %r14
	cmpq	%r14, %rax
	je	.L67
.L66:
	movzbl	0(%r13,%r14), %r9d
	leaq	(%r12,%r14), %rcx
	leaq	0(%r13,%r14), %r15
	cmpb	%r9b, (%r12,%r14)
	jne	.L131
	leaq	1(%r14), %r10
	movzbl	0(%r13,%r10), %r11d
	movq	%r10, %r14
	leaq	(%r12,%r10), %rcx
	leaq	0(%r13,%r10), %r15
	cmpb	%r11b, (%r12,%r10)
	jne	.L131
	addq	$1, %r14
	movzbl	0(%r13,%r14), %edx
	leaq	(%r12,%r14), %rcx
	leaq	0(%r13,%r14), %r15
	cmpb	%dl, (%r12,%r14)
	jne	.L131
	leaq	2(%r10), %r14
	movzbl	2(%r13,%r10), %esi
	leaq	(%r12,%r14), %rcx
	leaq	0(%r13,%r14), %r15
	cmpb	%sil, 2(%r12,%r10)
	jne	.L131
	leaq	3(%r10), %r14
	movzbl	3(%r13,%r10), %edi
	leaq	(%r12,%r14), %rcx
	leaq	0(%r13,%r14), %r15
	cmpb	%dil, 3(%r12,%r10)
	jne	.L131
	leaq	4(%r10), %r14
	movzbl	4(%r13,%r10), %r8d
	leaq	(%r12,%r14), %rcx
	leaq	0(%r13,%r14), %r15
	cmpb	%r8b, 4(%r12,%r10)
	jne	.L131
	leaq	5(%r10), %r14
	movzbl	5(%r13,%r10), %r9d
	leaq	(%r12,%r14), %rcx
	leaq	0(%r13,%r14), %r15
	cmpb	%r9b, 5(%r12,%r10)
	jne	.L131
	leaq	6(%r10), %r14
	movzbl	6(%r13,%r10), %r11d
	leaq	(%r12,%r14), %rcx
	leaq	0(%r13,%r14), %r15
	cmpb	%r11b, 6(%r12,%r10)
	jne	.L131
	leaq	7(%r10), %r14
	cmpq	%r14, %rax
	jne	.L66
.L67:
	cmpb	$45, %bl
	movl	$1, %eax
	sete	%bl
	cmpb	$45, %bpl
	sete	%bpl
	cmpb	%bpl, %bl
	je	.L55
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
.L131:
	.cfi_restore_state
	leaq	.LC11(%rip), %rdi
	movq	%rcx, 8(%rsp)
	call	puts@PLT
	movq	%r14, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC12(%rip), %rsi
	call	__printf_chk@PLT
	movq	8(%rsp), %rax
	movq	%r14, %r8
	movq	%r14, %rdx
	movsbl	(%r15), %r9d
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	movsbl	(%rax), %ecx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%r13, %rcx
	movq	%r12, %rdx
	movl	$1, %edi
	leaq	.LC14(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
.L136:
	.cfi_restore_state
	movb	$0, (%r8)
	movq	%r13, %rdi
	call	strlen@PLT
	movq	%rax, %r15
	jmp	.L64
	.p2align 4,,10
	.p2align 3
.L134:
	movb	$0, (%rdi)
	movq	%r13, %rdi
	call	strlen@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L63
	jmp	.L135
	.cfi_endproc
.LFE5796:
	.size	check_result, .-check_result
	.section	.rodata.str1.8
	.align 8
.LC16:
	.string	"Error creating directory %s: %s\n"
	.text
	.p2align 4
	.globl	create_directory
	.type	create_directory, @function
create_directory:
.LFB5797:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	strdup@PLT
	movq	%rax, %rdi
	movq	%rax, %rbp
	call	dirname@PLT
	movzbl	(%rax), %edx
	cmpl	$46, %edx
	jne	.L142
	cmpb	$0, 1(%rax)
	jne	.L142
.L139:
	movq	%rbp, %rdi
	call	free@PLT
	movl	$511, %esi
	movq	%r12, %rdi
	call	mkdir@PLT
	testl	%eax, %eax
	je	.L156
	call	__errno_location@PLT
	movl	(%rax), %edi
	cmpl	$17, %edi
	jne	.L158
.L156:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L142:
	.cfi_restore_state
	cmpl	$47, %edx
	je	.L159
.L143:
	movq	%rax, %rdi
	call	create_directory
	jmp	.L139
	.p2align 4,,10
	.p2align 3
.L159:
	cmpb	$0, 1(%rax)
	je	.L139
	jmp	.L143
.L158:
	call	strerror@PLT
	movq	stderr(%rip), %rdi
	movq	%r12, %rcx
	leaq	.LC16(%rip), %rdx
	movq	%rax, %r8
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE5797:
	.size	create_directory, .-create_directory
	.p2align 4
	.globl	open_gzfile
	.type	open_gzfile, @function
open_gzfile:
.LFB5798:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	call	gzopen@PLT
	testq	%rax, %rax
	je	.L163
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L163:
	.cfi_restore_state
	movq	%rbp, %rdi
	call	open_gzfile.part.0
	.cfi_endproc
.LFE5798:
	.size	open_gzfile, .-open_gzfile
	.section	.rodata.str1.1
.LC17:
	.string	"Error reading header line"
	.text
	.p2align 4
	.globl	skip_first_line
	.type	skip_first_line, @function
skip_first_line:
.LFB5799:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	-65536(%rsp), %r11
	.cfi_def_cfa 11, 65552
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$16, %rsp
	.cfi_def_cfa_offset 65568
	movl	$65536, %edx
	movq	%fs:40, %rax
	movq	%rax, 65544(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rsi
	movq	%rdi, %rbp
	call	gzgets@PLT
	testq	%rax, %rax
	je	.L169
	movq	65544(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L170
	addq	$65552, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L169:
	.cfi_restore_state
	leaq	.LC17(%rip), %rdi
	call	perror@PLT
	movq	%rbp, %rdi
	call	gzclose@PLT
	movl	$1, %edi
	call	exit@PLT
.L170:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5799:
	.size	skip_first_line, .-skip_first_line
	.section	.rodata.str1.1
.LC18:
	.string	"%llu\n"
	.text
	.p2align 4
	.globl	write_rdtsc
	.type	write_rdtsc, @function
write_rdtsc:
.LFB5800:
	.cfi_startproc
	endbr64
	movq	%rsi, %rdx
	xorl	%eax, %eax
	leaq	.LC18(%rip), %rsi
	jmp	gzprintf@PLT
	.cfi_endproc
.LFE5800:
	.size	write_rdtsc, .-write_rdtsc
	.section	.rodata.str1.1
.LC19:
	.string	"experiments/results"
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"Running the tests without any measurements"
	.align 8
.LC21:
	.string	"experiments/results/without_measurements"
	.align 8
.LC22:
	.string	"Running the tests with RDTSC measurements"
	.align 8
.LC23:
	.string	"experiments/results/rdtsc_measurements"
	.align 8
.LC24:
	.string	"Running the tests with perf measurements"
	.align 8
.LC25:
	.string	"experiments/results/perf_measurements"
	.align 8
.LC26:
	.string	"Running the tests with timespec measurements"
	.align 8
.LC27:
	.string	"experiments/results/timespec_measurements"
	.section	.rodata.str1.1
.LC28:
	.string	"Invalid measure type"
	.section	.rodata.str1.8
	.align 8
.LC29:
	.string	"Running random test cases for bit-size %d on core %d\n"
	.align 8
.LC30:
	.string	"../test/cases/%d/random.csv.gz"
	.align 8
.LC31:
	.string	"experiments/results/rdtsc_measurements/equal_%d_%d.csv.gz"
	.section	.rodata.str1.1
.LC32:
	.string	"wb"
	.section	.rodata.str1.8
	.align 8
.LC33:
	.string	"experiments/results/perf_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC34:
	.string	"experiments/results/timespec_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC35:
	.string	"experiments/results/rdtsc_measurements/greater_%d_%d.csv.gz"
	.align 8
.LC36:
	.string	"experiments/results/perf_measurements/greater_%d_%d.csv.gz"
	.align 8
.LC37:
	.string	"experiments/results/timespec_measurements/greater_%d_%d.csv.gz"
	.align 8
.LC38:
	.string	"experiments/results/rdtsc_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC39:
	.string	"experiments/results/perf_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC40:
	.string	"experiments/results/timespec_measurements/smaller_%d_%d.csv.gz"
	.section	.rodata.str1.1
.LC41:
	.string	"Invalid test case"
.LC42:
	.string	"rb"
.LC43:
	.string	"Error reading line"
.LC44:
	.string	","
.LC45:
	.string	"Error parsing line: %s\n"
	.section	.rodata.str1.8
	.align 8
.LC46:
	.string	"Error: Failed to set mpz_t from string a_str"
	.align 8
.LC47:
	.string	"Error: Failed to set mpz_t from string b_str"
	.align 8
.LC48:
	.string	"Error: RDTSC end time is less than start time\n"
	.section	.rodata.str1.1
.LC49:
	.string	"%lld\n"
	.section	.rodata.str1.8
	.align 8
.LC50:
	.string	"Test case failed, at iteration %d\n"
	.section	.rodata.str1.1
.LC51:
	.string	"a = %s, b = %s, result = %s\n"
.LC52:
	.string	"Subtraction result = %s\n"
.LC53:
	.string	"Random test cases completed"
.LC54:
	.string	"Equal test cases completed"
.LC55:
	.string	"Greater test cases completed"
.LC56:
	.string	"Smaller test cases completed"
	.section	.rodata.str1.8
	.align 8
.LC57:
	.string	"experiments/results/perf_measurements/random_%d_%d.csv.gz"
	.align 8
.LC58:
	.string	"Running equal test cases for bit-size %d on core %d\n"
	.section	.rodata.str1.1
.LC59:
	.string	"../test/cases/%d/equal.csv.gz"
	.section	.rodata.str1.8
	.align 8
.LC60:
	.string	"experiments/results/timespec_measurements/random_%d_%d.csv.gz"
	.align 8
.LC61:
	.string	"experiments/results/rdtsc_measurements/random_%d_%d.csv.gz"
	.align 8
.LC62:
	.string	"Running smaller test cases for bit-size %d on core %d\n"
	.align 8
.LC63:
	.string	"../test/cases/%d/smaller.csv.gz"
	.align 8
.LC64:
	.string	"Running greater test cases for bit-size %d on core %d\n"
	.align 8
.LC65:
	.string	"../test/cases/%d/greater.csv.gz"
	.text
	.p2align 4
	.globl	run_tests
	.type	run_tests, @function
run_tests:
.LFB5801:
	.cfi_startproc
	endbr64
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	-65536(%rsp), %r11
	.cfi_def_cfa 11, 65592
.LPSRL1:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL1
	.cfi_def_cfa_register 7
	subq	$680, %rsp
	.cfi_def_cfa_offset 66272
	movl	%edi, 40(%rsp)
	movl	%esi, %ebx
	leaq	.LC19(%rip), %rdi
	movl	%esi, 48(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 66200(%rsp)
	xorl	%eax, %eax
	call	create_directory
	cmpl	$2, %ebx
	je	.L173
	jg	.L174
	testl	%ebx, %ebx
	je	.L175
	cmpl	$1, %ebx
	jne	.L177
	leaq	.LC22(%rip), %rdi
	call	puts@PLT
	leaq	.LC23(%rip), %rdi
	call	create_directory
	movl	40(%rsp), %r14d
	cmpl	$2, %r14d
	je	.L185
	jg	.L186
	testl	%r14d, %r14d
	je	.L187
	cmpl	$1, %r14d
	jne	.L182
.L188:
	movl	CORE_NO(%rip), %ecx
	movl	NUM_BITS(%rip), %edx
	leaq	.LC58(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	432(%rsp), %r15
	call	__printf_chk@PLT
	movl	$100, %ecx
	xorl	%eax, %eax
	movq	%r15, %rdi
	movl	NUM_BITS(%rip), %r9d
	movl	$1, %edx
	movl	$100, %esi
	leaq	.LC59(%rip), %r8
	call	__snprintf_chk@PLT
	cmpl	$1, 48(%rsp)
	movl	CORE_NO(%rip), %ecx
	movl	NUM_BITS(%rip), %r9d
	jne	.L599
	leaq	320(%rsp), %r12
	subq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 66280
	leaq	.LC31(%rip), %r8
	pushq	%rcx
	.cfi_def_cfa_offset 66288
	jmp	.L585
	.p2align 4,,10
	.p2align 3
.L174:
	.cfi_restore_state
	cmpl	$3, 48(%rsp)
	jne	.L177
	leaq	.LC26(%rip), %rdi
	call	puts@PLT
	leaq	.LC27(%rip), %rdi
	call	create_directory
	cmpl	$1, 40(%rsp)
	je	.L188
	jle	.L600
	movl	40(%rsp), %ebp
	cmpl	$2, %ebp
	je	.L185
	cmpl	$3, %ebp
	jne	.L182
.L189:
	movl	CORE_NO(%rip), %ecx
	movl	NUM_BITS(%rip), %edx
	leaq	.LC62(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	432(%rsp), %r15
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movl	$100, %ecx
	movq	%r15, %rdi
	movl	NUM_BITS(%rip), %r9d
	movl	$1, %edx
	movl	$100, %esi
	leaq	.LC63(%rip), %r8
	call	__snprintf_chk@PLT
	cmpl	$1, 48(%rsp)
	movl	CORE_NO(%rip), %eax
	movl	NUM_BITS(%rip), %r9d
	jne	.L601
	leaq	320(%rsp), %r12
	subq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 66280
	leaq	.LC38(%rip), %r8
	pushq	%rax
	.cfi_def_cfa_offset 66288
	jmp	.L585
.L186:
	.cfi_restore_state
	cmpl	$3, 40(%rsp)
	je	.L189
.L182:
	leaq	.LC41(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
	.p2align 4,,10
	.p2align 3
.L600:
	movl	40(%rsp), %r10d
	testl	%r10d, %r10d
	jne	.L182
	movl	CORE_NO(%rip), %ecx
	movl	NUM_BITS(%rip), %edx
	leaq	.LC29(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	432(%rsp), %r15
	leaq	544(%rsp), %r12
	call	__printf_chk@PLT
	movl	$100, %ecx
	movq	%r15, %rdi
	xorl	%eax, %eax
	movl	NUM_BITS(%rip), %r9d
	movl	$1, %edx
	movl	$100, %esi
	leaq	.LC30(%rip), %r8
	call	__snprintf_chk@PLT
	movl	CORE_NO(%rip), %r8d
	subq	$8, %rsp
	.cfi_def_cfa_offset 66280
	movl	NUM_BITS(%rip), %r9d
	pushq	%r8
	.cfi_def_cfa_offset 66288
	leaq	.LC60(%rip), %r8
.L589:
	movl	$100, %ecx
	movl	$1, %edx
	movq	%r12, %rdi
	xorl	%eax, %eax
	movl	$100, %esi
	call	__snprintf_chk@PLT
	leaq	.LC32(%rip), %rsi
	movq	%r12, %rdi
	call	gzopen@PLT
	movq	%rax, 96(%rsp)
	popq	%r8
	.cfi_def_cfa_offset 66280
	popq	%r9
	.cfi_def_cfa_offset 66272
	testq	%rax, %rax
	je	.L201
.L198:
	leaq	.LC42(%rip), %rsi
	movq	%r15, %rdi
	call	gzopen@PLT
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L602
	leaq	656(%rsp), %rsi
	movq	%rax, %rdi
	movl	$65536, %edx
	movq	%rsi, 32(%rsp)
	call	gzgets@PLT
	testq	%rax, %rax
	je	.L603
	movl	$0, 52(%rsp)
.L247:
	movq	32(%rsp), %rsi
	movq	24(%rsp), %rdi
	movl	$65536, %edx
	call	gzgets@PLT
	testq	%rax, %rax
	je	.L604
	movq	32(%rsp), %rdi
	leaq	.LC44(%rip), %rsi
	call	strtok@PLT
	xorl	%edi, %edi
	leaq	.LC44(%rip), %rsi
	movq	%rax, (%rsp)
	call	strtok@PLT
	xorl	%edi, %edi
	leaq	.LC44(%rip), %rsi
	movq	%rax, 8(%rsp)
	call	strtok@PLT
	cmpq	$0, (%rsp)
	sete	%r12b
	cmpq	$0, 8(%rsp)
	movq	%rax, 16(%rsp)
	sete	%dil
	orb	%dil, %r12b
	jne	.L274
	cmpq	$0, 16(%rsp)
	je	.L274
	leaq	112(%rsp), %r13
	leaq	128(%rsp), %r14
	movq	%r13, %rdi
	call	__gmpz_init@PLT
	movq	%r14, %rdi
	call	__gmpz_init@PLT
	movq	(%rsp), %rsi
	movl	$10, %edx
	movq	%r13, %rdi
	call	__gmpz_set_str@PLT
	testl	%eax, %eax
	jne	.L605
	movq	8(%rsp), %rsi
	movl	$10, %edx
	movq	%r14, %rdi
	call	__gmpz_set_str@PLT
	testl	%eax, %eax
	jne	.L606
	vmovd	116(%rsp), %xmm0
	movq	120(%rsp), %r8
	vmovd	132(%rsp), %xmm2
	vpabsd	%xmm0, %xmm1
	vpabsd	%xmm2, %xmm3
	vmovd	%xmm1, %ebp
	vmovd	%xmm3, %r10d
	movslq	%ebp, %rbp
	movslq	%r10d, %r12
	salq	$3, %r12
	salq	$3, %rbp
	je	.L213
	leaq	-1(%rbp), %rbx
	shrq	$6, %rbx
	andl	$7, %ebx
	clflush	(%r8)
	movl	$64, %r9d
	cmpq	$64, %rbp
	jbe	.L213
	testq	%rbx, %rbx
	je	.L210
	cmpq	$1, %rbx
	je	.L484
	cmpq	$2, %rbx
	je	.L485
	cmpq	$3, %rbx
	je	.L486
	cmpq	$4, %rbx
	je	.L487
	cmpq	$5, %rbx
	je	.L488
	cmpq	$6, %rbx
	jne	.L607
.L489:
	clflush	(%r8,%r9)
	addq	$64, %r9
.L488:
	clflush	(%r8,%r9)
	addq	$64, %r9
.L487:
	clflush	(%r8,%r9)
	addq	$64, %r9
.L486:
	clflush	(%r8,%r9)
	addq	$64, %r9
.L485:
	clflush	(%r8,%r9)
	addq	$64, %r9
.L484:
	clflush	(%r8,%r9)
	addq	$64, %r9
	cmpq	%r9, %rbp
	jbe	.L213
.L210:
	clflush	(%r8,%r9)
	clflush	64(%r8,%r9)
	clflush	128(%r8,%r9)
	clflush	192(%r8,%r9)
	clflush	256(%r8,%r9)
	clflush	320(%r8,%r9)
	clflush	384(%r8,%r9)
	clflush	448(%r8,%r9)
	addq	$512, %r9
	cmpq	%r9, %rbp
	ja	.L210
.L213:
	movq	136(%rsp), %r15
	testq	%r12, %r12
	je	.L212
	leaq	-1(%r12), %r11
	shrq	$6, %r11
	andl	$7, %r11d
	clflush	(%r15)
	movl	$64, %eax
	cmpq	$64, %r12
	jbe	.L212
	testq	%r11, %r11
	je	.L211
	cmpq	$1, %r11
	je	.L478
	cmpq	$2, %r11
	je	.L479
	cmpq	$3, %r11
	je	.L480
	cmpq	$4, %r11
	je	.L481
	cmpq	$5, %r11
	je	.L482
	cmpq	$6, %r11
	jne	.L608
.L483:
	clflush	(%r15,%rax)
	addq	$64, %rax
.L482:
	clflush	(%r15,%rax)
	addq	$64, %rax
.L481:
	clflush	(%r15,%rax)
	addq	$64, %rax
.L480:
	clflush	(%r15,%rax)
	addq	$64, %rax
.L479:
	clflush	(%r15,%rax)
	addq	$64, %rax
.L478:
	clflush	(%r15,%rax)
	addq	$64, %rax
	cmpq	%rax, %r12
	jbe	.L212
.L211:
	clflush	(%r15,%rax)
	clflush	64(%r15,%rax)
	clflush	128(%r15,%rax)
	clflush	192(%r15,%rax)
	clflush	256(%r15,%rax)
	clflush	320(%r15,%rax)
	clflush	384(%r15,%rax)
	clflush	448(%r15,%rax)
	addq	$512, %rax
	cmpq	%rax, %r12
	ja	.L211
.L212:
	mfence
	xorl	%eax, %eax
#APP
# 713 "sub.c" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movl	48(%rsp), %edx
	cmpl	$2, %edx
	je	.L214
	cmpl	$3, %edx
	je	.L215
	cmpl	$1, %edx
	je	.L609
	leaq	144(%rsp), %r15
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	__gmpz_sub@PLT
.L224:
	movq	%r15, %rdx
	xorl	%edi, %edi
	movl	$10, %esi
	xorl	%r14d, %r14d
	call	__gmpz_get_str@PLT
	movq	16(%rsp), %rdx
	movzbl	(%rax), %r15d
	movq	%rax, %r13
	movzbl	(%rdx), %r10d
	cmpb	$45, %r15b
	sete	%r14b
	xorl	%ebx, %ebx
	movb	%r10b, 56(%rsp)
	addq	%rax, %r14
	cmpb	$45, %r10b
	sete	%bl
	leaq	(%rdx,%rbx), %rbx
	call	__ctype_b_loc@PLT
	movq	(%rax), %rax
	jmp	.L230
	.p2align 4,,10
	.p2align 3
.L231:
	addq	$1, %r14
.L230:
	movsbq	(%r14), %r8
	cmpb	$48, %r8b
	je	.L231
	testb	$32, 1(%rax,%r8,2)
	jne	.L231
	movsbq	(%rbx), %r9
	cmpb	$48, %r9b
	jne	.L610
	.p2align 4,,10
	.p2align 3
.L233:
	movsbq	1(%rbx), %r9
	addq	$1, %rbx
	cmpb	$48, %r9b
	je	.L233
.L610:
	testb	$32, 1(%rax,%r9,2)
	jne	.L233
	movq	%r14, %rdi
	call	strlen@PLT
	testq	%rax, %rax
	je	.L234
	leaq	-1(%r14,%rax), %r11
	cmpb	$10, (%r11)
	jne	.L234
	movb	$0, (%r11)
	.p2align 4,,10
	.p2align 3
.L234:
	movq	%rbx, %rdi
	call	strlen@PLT
	testq	%rax, %rax
	je	.L235
	leaq	-1(%rbx,%rax), %rsi
	cmpb	$10, (%rsi)
	jne	.L236
	movb	$0, (%rsi)
	movq	%rbx, %rdi
	call	strlen@PLT
.L236:
	movq	%r14, %rdi
	movq	%rax, 64(%rsp)
	call	strlen@PLT
	movq	64(%rsp), %rcx
	cmpq	%rcx, %rax
	jne	.L237
	testq	%rcx, %rcx
	je	.L239
	xorl	%edx, %edx
	andl	$7, %ecx
	je	.L238
	cmpq	$1, %rcx
	je	.L456
	cmpq	$2, %rcx
	je	.L457
	cmpq	$3, %rcx
	je	.L458
	cmpq	$4, %rcx
	je	.L459
	cmpq	$5, %rcx
	je	.L460
	cmpq	$6, %rcx
	je	.L461
	movzbl	(%rbx), %edi
	movq	%r14, %r8
	movq	%rbx, %rcx
	cmpb	%dil, (%r14)
	jne	.L577
	movl	$1, %edx
.L461:
	movzbl	(%rbx,%rdx), %r10d
	leaq	(%r14,%rdx), %r8
	leaq	(%rbx,%rdx), %rcx
	cmpb	%r10b, (%r14,%rdx)
	jne	.L577
	addq	$1, %rdx
.L460:
	movzbl	(%rbx,%rdx), %r9d
	leaq	(%r14,%rdx), %r8
	leaq	(%rbx,%rdx), %rcx
	cmpb	%r9b, (%r14,%rdx)
	jne	.L577
	addq	$1, %rdx
.L459:
	movzbl	(%rbx,%rdx), %r11d
	leaq	(%r14,%rdx), %r8
	leaq	(%rbx,%rdx), %rcx
	cmpb	%r11b, (%r14,%rdx)
	jne	.L577
	addq	$1, %rdx
.L458:
	movzbl	(%rbx,%rdx), %esi
	leaq	(%r14,%rdx), %r8
	leaq	(%rbx,%rdx), %rcx
	cmpb	%sil, (%r14,%rdx)
	jne	.L577
	addq	$1, %rdx
.L457:
	movzbl	(%rbx,%rdx), %edi
	leaq	(%r14,%rdx), %r8
	leaq	(%rbx,%rdx), %rcx
	cmpb	%dil, (%r14,%rdx)
	jne	.L577
	addq	$1, %rdx
.L456:
	movzbl	(%rbx,%rdx), %r10d
	leaq	(%r14,%rdx), %r8
	leaq	(%rbx,%rdx), %rcx
	cmpb	%r10b, (%r14,%rdx)
	jne	.L577
	addq	$1, %rdx
	cmpq	%rdx, %rax
	je	.L239
.L238:
	movzbl	(%rbx,%rdx), %r9d
	leaq	(%r14,%rdx), %r8
	leaq	(%rbx,%rdx), %rcx
	cmpb	%r9b, (%r14,%rdx)
	jne	.L577
	leaq	1(%rdx), %r11
	movzbl	(%rbx,%r11), %esi
	movq	%r11, %rdx
	leaq	(%r14,%r11), %r8
	leaq	(%rbx,%r11), %rcx
	cmpb	%sil, (%r14,%r11)
	jne	.L577
	addq	$1, %rdx
	movzbl	(%rbx,%rdx), %edi
	leaq	(%r14,%rdx), %r8
	leaq	(%rbx,%rdx), %rcx
	cmpb	%dil, (%r14,%rdx)
	jne	.L577
	leaq	2(%r11), %rdx
	movzbl	2(%rbx,%r11), %r10d
	leaq	(%r14,%rdx), %r8
	leaq	(%rbx,%rdx), %rcx
	cmpb	%r10b, 2(%r14,%r11)
	jne	.L577
	leaq	3(%r11), %rdx
	movzbl	3(%rbx,%r11), %r9d
	leaq	(%r14,%rdx), %r8
	leaq	(%rbx,%rdx), %rcx
	cmpb	%r9b, 3(%r14,%r11)
	jne	.L577
	leaq	4(%r11), %rdx
	movzbl	4(%rbx,%r11), %esi
	leaq	(%r14,%rdx), %r8
	leaq	(%rbx,%rdx), %rcx
	cmpb	%sil, 4(%r14,%r11)
	jne	.L577
	leaq	5(%r11), %rdx
	movzbl	5(%rbx,%r11), %edi
	leaq	(%r14,%rdx), %r8
	leaq	(%rbx,%rdx), %rcx
	cmpb	%dil, 5(%r14,%r11)
	jne	.L577
	leaq	6(%r11), %rdx
	movzbl	6(%rbx,%r11), %r10d
	leaq	(%r14,%rdx), %r8
	leaq	(%rbx,%rdx), %rcx
	cmpb	%r10b, 6(%r14,%r11)
	jne	.L577
	leaq	7(%r11), %rdx
	cmpq	%rdx, %rax
	jne	.L238
.L239:
	cmpb	$45, %r15b
	sete	%r14b
	cmpb	$45, 56(%rsp)
	sete	%r15b
	cmpb	%r15b, %r14b
	jne	.L242
	movq	120(%rsp), %r13
	testq	%rbp, %rbp
	je	.L246
	leaq	-1(%rbp), %rbx
	shrq	$6, %rbx
	andl	$7, %ebx
	clflush	0(%r13)
	movl	$64, %eax
	cmpq	$64, %rbp
	jbe	.L246
	testq	%rbx, %rbx
	je	.L243
	cmpq	$1, %rbx
	je	.L472
	cmpq	$2, %rbx
	je	.L473
	cmpq	$3, %rbx
	je	.L474
	cmpq	$4, %rbx
	je	.L475
	cmpq	$5, %rbx
	je	.L476
	cmpq	$6, %rbx
	jne	.L611
.L477:
	clflush	0(%r13,%rax)
	addq	$64, %rax
.L476:
	clflush	0(%r13,%rax)
	addq	$64, %rax
.L475:
	clflush	0(%r13,%rax)
	addq	$64, %rax
.L474:
	clflush	0(%r13,%rax)
	addq	$64, %rax
.L473:
	clflush	0(%r13,%rax)
	addq	$64, %rax
.L472:
	clflush	0(%r13,%rax)
	addq	$64, %rax
	cmpq	%rax, %rbp
	jbe	.L246
.L243:
	clflush	0(%r13,%rax)
	clflush	64(%r13,%rax)
	clflush	128(%r13,%rax)
	clflush	192(%r13,%rax)
	clflush	256(%r13,%rax)
	clflush	320(%r13,%rax)
	clflush	384(%r13,%rax)
	clflush	448(%r13,%rax)
	addq	$512, %rax
	cmpq	%rax, %rbp
	ja	.L243
.L246:
	movq	136(%rsp), %rbp
	testq	%r12, %r12
	je	.L245
	leaq	-1(%r12), %r11
	shrq	$6, %r11
	andl	$7, %r11d
	clflush	0(%rbp)
	movl	$64, %r9d
	cmpq	$64, %r12
	jbe	.L245
	testq	%r11, %r11
	je	.L244
	cmpq	$1, %r11
	je	.L466
	cmpq	$2, %r11
	je	.L467
	cmpq	$3, %r11
	je	.L468
	cmpq	$4, %r11
	je	.L469
	cmpq	$5, %r11
	je	.L470
	cmpq	$6, %r11
	jne	.L612
.L471:
	clflush	0(%rbp,%r9)
	addq	$64, %r9
.L470:
	clflush	0(%rbp,%r9)
	addq	$64, %r9
.L469:
	clflush	0(%rbp,%r9)
	addq	$64, %r9
.L468:
	clflush	0(%rbp,%r9)
	addq	$64, %r9
.L467:
	clflush	0(%rbp,%r9)
	addq	$64, %r9
.L466:
	clflush	0(%rbp,%r9)
	addq	$64, %r9
	cmpq	%r9, %r12
	jbe	.L245
.L244:
	clflush	0(%rbp,%r9)
	clflush	64(%rbp,%r9)
	clflush	128(%rbp,%r9)
	clflush	192(%rbp,%r9)
	clflush	256(%rbp,%r9)
	clflush	320(%rbp,%r9)
	clflush	384(%rbp,%r9)
	clflush	448(%rbp,%r9)
	addq	$512, %r9
	cmpq	%r9, %r12
	ja	.L244
.L245:
	addl	$1, 52(%rsp)
	movl	52(%rsp), %esi
	cmpl	$100000, %esi
	jne	.L247
.L248:
	movl	40(%rsp), %r11d
	cmpl	$2, %r11d
	je	.L249
	cmpl	$3, %r11d
	je	.L250
	cmpl	$1, %r11d
	je	.L251
	leaq	.LC53(%rip), %rdi
	call	puts@PLT
.L252:
	movq	24(%rsp), %rdi
	call	gzclose@PLT
	cmpl	$1, 48(%rsp)
	je	.L613
	cmpl	$2, 48(%rsp)
	je	.L614
	cmpl	$3, 48(%rsp)
	je	.L615
.L172:
	movq	66200(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L616
	addq	$66216, %rsp
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
.L235:
	.cfi_restore_state
	movq	%r14, %rdi
	call	strlen@PLT
	testq	%rax, %rax
	je	.L239
.L237:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	strlen@PLT
	movq	%r14, %rdi
	movq	%rax, %r12
	call	strlen@PLT
	movq	%r12, %rcx
	movl	$1, %edi
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%rbx, %rcx
	movq	%r14, %rdx
	movl	$1, %edi
	leaq	.LC10(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L240:
	movl	52(%rsp), %edx
	leaq	.LC50(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	16(%rsp), %r8
	movq	(%rsp), %rdx
	xorl	%eax, %eax
	movq	8(%rsp), %rcx
	leaq	.LC51(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$1, %edi
	movq	%r13, %rdx
	xorl	%eax, %eax
	leaq	.LC52(%rip), %rsi
	call	__printf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
	.p2align 4,,10
	.p2align 3
.L577:
	leaq	.LC11(%rip), %rdi
	movq	%r8, 40(%rsp)
	movq	%rcx, 32(%rsp)
	movq	%rdx, 24(%rsp)
	call	puts@PLT
	movq	24(%rsp), %rdx
	leaq	.LC12(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	40(%rsp), %r8
	xorl	%eax, %eax
	movq	32(%rsp), %rcx
	movq	24(%rsp), %rdx
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	movsbl	(%r8), %r10d
	movsbl	(%rcx), %r9d
	movq	%rdx, %r8
	movl	%r10d, %ecx
	call	__printf_chk@PLT
	movq	%rbx, %rcx
	movq	%r14, %rdx
	movl	$1, %edi
	leaq	.LC14(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L240
	.p2align 4,,10
	.p2align 3
.L215:
	leaq	96(%rsp), %rdi
	leaq	144(%rsp), %r15
	movq	%rdi, %rsi
	movq	%rdi, 56(%rsp)
	movl	$4, %edi
	call	clock_gettime@PLT
	movq	96(%rsp), %r10
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	movq	104(%rsp), %rbx
	movq	%r10, 64(%rsp)
	call	__gmpz_sub@PLT
	movq	56(%rsp), %rsi
	movl	$4, %edi
	call	clock_gettime@PLT
	movq	104(%rsp), %r9
	movq	96(%rsp), %r8
	movq	%r9, %r11
	subq	%rbx, %r11
	js	.L617
	subq	64(%rsp), %r8
.L227:
	imulq	$1000000000, %r8, %rdx
	movq	80(%rsp), %rdi
	leaq	.LC49(%rip), %rsi
	xorl	%eax, %eax
	addq	%r11, %rdx
	call	gzprintf@PLT
	jmp	.L224
	.p2align 4,,10
	.p2align 3
.L214:
	leaq	fd(%rip), %rbx
	movq	%rbx, %r15
	.p2align 4,,10
	.p2align 3
.L220:
	movl	(%r15), %edi
	xorl	%edx, %edx
	movl	$9219, %esi
	xorl	%eax, %eax
	addq	$4, %r15
	call	ioctl@PLT
	movl	-4(%r15), %edi
	xorl	%edx, %edx
	movl	$9216, %esi
	xorl	%eax, %eax
	call	ioctl@PLT
	leaq	24+fd(%rip), %rcx
	cmpq	%r15, %rcx
	jne	.L220
	leaq	144(%rsp), %r15
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	__gmpz_sub@PLT
	.p2align 4,,10
	.p2align 3
.L226:
	movl	(%rbx), %edi
	xorl	%edx, %edx
	xorl	%eax, %eax
	movl	$9217, %esi
	call	ioctl@PLT
	cmpl	$-1, %eax
	je	.L618
	addq	$4, %rbx
	leaq	24+fd(%rip), %rsi
	cmpq	%rbx, %rsi
	jne	.L226
	leaq	160(%rsp), %r13
	movq	%r13, %rdi
	call	read_perf
	movq	72(%rsp), %rdi
	movq	%r13, %rsi
	call	write_perf
	jmp	.L224
	.p2align 4,,10
	.p2align 3
.L609:
#APP
# 67 "sub.c" 1
	CPUID
	RDTSC
	mov %edx, %esi
	mov %eax, %edi
	
# 0 "" 2
# 71 "sub.c" 1
	RDTSCP
	mov %edx, %esi
	mov %eax, %edi
	CPUID
	
# 0 "" 2
# 83 "sub.c" 1
	CPUID
	RDTSC
	mov %edx, %r15d
	mov %eax, %esi
	
# 0 "" 2
#NO_APP
	movl	%esi, %eax
	salq	$32, %r15
	movq	%r14, %rdx
	movq	%r13, %rsi
	orq	%rax, %r15
	movq	%r15, 56(%rsp)
	leaq	144(%rsp), %r15
	movq	%r15, %rdi
	call	__gmpz_sub@PLT
#APP
# 96 "sub.c" 1
	RDTSCP
	mov %edx, %r14d
	mov %eax, %r13d
	CPUID
	
# 0 "" 2
#NO_APP
	movq	%r14, %rdx
	movl	%r13d, %ecx
	movq	56(%rsp), %rdi
	salq	$32, %rdx
	orq	%rcx, %rdx
	cmpq	%rdx, %rdi
	ja	.L619
	subq	%rdi, %rdx
	movq	88(%rsp), %rdi
	leaq	.LC18(%rip), %rsi
	xorl	%eax, %eax
	call	gzprintf@PLT
	jmp	.L224
	.p2align 4,,10
	.p2align 3
.L173:
	leaq	.LC24(%rip), %rdi
	call	puts@PLT
	leaq	.LC25(%rip), %rdi
	call	create_directory
	movl	40(%rsp), %eax
	cmpl	$2, %eax
	je	.L190
	jg	.L191
	testl	%eax, %eax
	je	.L192
	cmpl	$1, %eax
	jne	.L182
	movl	CORE_NO(%rip), %ecx
	movl	NUM_BITS(%rip), %edx
	leaq	.LC58(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	432(%rsp), %r15
	leaq	208(%rsp), %r12
	call	__printf_chk@PLT
	movq	%r15, %rdi
	movl	$100, %ecx
	xorl	%eax, %eax
	movl	NUM_BITS(%rip), %r9d
	movl	$1, %edx
	movl	$100, %esi
	leaq	.LC59(%rip), %r8
	call	__snprintf_chk@PLT
	movl	CORE_NO(%rip), %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 66280
	movl	NUM_BITS(%rip), %r9d
	leaq	.LC33(%rip), %r8
	pushq	%rdi
	.cfi_def_cfa_offset 66288
.L596:
	movl	$100, %ecx
	movl	$1, %edx
	movq	%r12, %rdi
	xorl	%eax, %eax
	movl	$100, %esi
	call	__snprintf_chk@PLT
	leaq	.LC32(%rip), %rsi
	movq	%r12, %rdi
	call	gzopen@PLT
	movq	%rax, 88(%rsp)
	popq	%rdx
	.cfi_def_cfa_offset 66280
	popq	%rcx
	.cfi_def_cfa_offset 66272
	testq	%rax, %rax
	je	.L201
	xorl	%eax, %eax
	call	initialize_perf
	jmp	.L198
.L191:
	cmpl	$3, 40(%rsp)
	jne	.L182
	movl	CORE_NO(%rip), %ecx
	movl	NUM_BITS(%rip), %edx
	leaq	.LC62(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	432(%rsp), %r15
	leaq	208(%rsp), %r12
	call	__printf_chk@PLT
	movl	$100, %ecx
	movq	%r15, %rdi
	xorl	%eax, %eax
	movl	NUM_BITS(%rip), %r9d
	movl	$1, %edx
	movl	$100, %esi
	leaq	.LC63(%rip), %r8
	call	__snprintf_chk@PLT
	movl	CORE_NO(%rip), %ecx
	subq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 66280
	movl	NUM_BITS(%rip), %r9d
	leaq	.LC39(%rip), %r8
	pushq	%rcx
	.cfi_def_cfa_offset 66288
	jmp	.L596
	.p2align 4,,10
	.p2align 3
.L175:
	.cfi_restore_state
	leaq	.LC20(%rip), %rdi
	call	puts@PLT
	leaq	.LC21(%rip), %rdi
	call	create_directory
	cmpl	$1, 40(%rsp)
	je	.L179
	jle	.L620
	movl	40(%rsp), %r9d
	cmpl	$2, %r9d
	je	.L183
	cmpl	$3, %r9d
	jne	.L182
	movl	CORE_NO(%rip), %ecx
	movl	NUM_BITS(%rip), %edx
	leaq	.LC62(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	432(%rsp), %r15
	call	__printf_chk@PLT
	movl	NUM_BITS(%rip), %r9d
	leaq	.LC63(%rip), %r8
.L593:
	movl	$100, %ecx
	movl	$1, %edx
	movq	%r15, %rdi
	xorl	%eax, %eax
	movl	$100, %esi
	call	__snprintf_chk@PLT
	jmp	.L198
.L620:
	movl	40(%rsp), %r13d
	testl	%r13d, %r13d
	jne	.L182
	movl	CORE_NO(%rip), %ecx
	movl	NUM_BITS(%rip), %edx
	leaq	.LC29(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	432(%rsp), %r15
	call	__printf_chk@PLT
	movl	NUM_BITS(%rip), %r9d
	leaq	.LC30(%rip), %r8
	jmp	.L593
.L617:
	subq	64(%rsp), %r8
	leaq	1000000000(%r9), %r11
	subq	$1, %r8
	subq	%rbx, %r11
	jmp	.L227
.L179:
	movl	CORE_NO(%rip), %ecx
	movl	NUM_BITS(%rip), %edx
	leaq	.LC58(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	432(%rsp), %r15
	call	__printf_chk@PLT
	movl	NUM_BITS(%rip), %r9d
	leaq	.LC59(%rip), %r8
	jmp	.L593
.L183:
	movl	CORE_NO(%rip), %ecx
	movl	NUM_BITS(%rip), %edx
	leaq	.LC64(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	432(%rsp), %r15
	call	__printf_chk@PLT
	movl	NUM_BITS(%rip), %r9d
	leaq	.LC65(%rip), %r8
	jmp	.L593
	.p2align 4,,10
	.p2align 3
.L185:
	movl	CORE_NO(%rip), %ecx
	movl	NUM_BITS(%rip), %edx
	leaq	.LC64(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	432(%rsp), %r15
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movl	$100, %ecx
	movq	%r15, %rdi
	movl	NUM_BITS(%rip), %r9d
	movl	$1, %edx
	movl	$100, %esi
	leaq	.LC65(%rip), %r8
	call	__snprintf_chk@PLT
	cmpl	$1, 48(%rsp)
	movl	CORE_NO(%rip), %r11d
	movl	NUM_BITS(%rip), %r9d
	je	.L621
	leaq	544(%rsp), %r12
	subq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 66280
	leaq	.LC37(%rip), %r8
	pushq	%r11
	.cfi_def_cfa_offset 66288
	jmp	.L589
.L608:
	.cfi_restore_state
	clflush	64(%r15)
	movl	$128, %eax
	jmp	.L483
.L607:
	clflush	(%r8,%r9)
	addq	$64, %r9
	jmp	.L489
.L190:
	movl	CORE_NO(%rip), %ecx
	movl	NUM_BITS(%rip), %edx
	leaq	.LC64(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	432(%rsp), %r15
	leaq	208(%rsp), %r12
	call	__printf_chk@PLT
	movl	$1, %edx
	movq	%r15, %rdi
	xorl	%eax, %eax
	movl	NUM_BITS(%rip), %r9d
	movl	$100, %ecx
	movl	$100, %esi
	leaq	.LC65(%rip), %r8
	call	__snprintf_chk@PLT
	movl	CORE_NO(%rip), %edx
	subq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 66280
	movl	NUM_BITS(%rip), %r9d
	leaq	.LC36(%rip), %r8
	pushq	%rdx
	.cfi_def_cfa_offset 66288
	jmp	.L596
.L242:
	.cfi_restore_state
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	jmp	.L240
.L601:
	leaq	544(%rsp), %r12
	subq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 66280
	leaq	.LC40(%rip), %r8
	pushq	%rax
	.cfi_def_cfa_offset 66288
	jmp	.L589
.L599:
	.cfi_restore_state
	leaq	544(%rsp), %r12
	subq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 66280
	leaq	.LC34(%rip), %r8
	pushq	%rcx
	.cfi_def_cfa_offset 66288
	jmp	.L589
.L192:
	.cfi_restore_state
	movl	CORE_NO(%rip), %ecx
	movl	NUM_BITS(%rip), %edx
	leaq	.LC29(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	432(%rsp), %r15
	leaq	208(%rsp), %r12
	call	__printf_chk@PLT
	movl	$100, %esi
	movq	%r15, %rdi
	xorl	%eax, %eax
	movl	NUM_BITS(%rip), %r9d
	movl	$100, %ecx
	movl	$1, %edx
	leaq	.LC30(%rip), %r8
	call	__snprintf_chk@PLT
	movl	CORE_NO(%rip), %esi
	subq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 66280
	movl	NUM_BITS(%rip), %r9d
	leaq	.LC57(%rip), %r8
	pushq	%rsi
	.cfi_def_cfa_offset 66288
	jmp	.L596
.L187:
	.cfi_restore_state
	movl	CORE_NO(%rip), %ecx
	movl	NUM_BITS(%rip), %edx
	leaq	.LC29(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	432(%rsp), %r15
	leaq	320(%rsp), %r12
	call	__printf_chk@PLT
	movl	$1, %edx
	movq	%r15, %rdi
	xorl	%eax, %eax
	movl	NUM_BITS(%rip), %r9d
	movl	$100, %ecx
	movl	$100, %esi
	leaq	.LC30(%rip), %r8
	call	__snprintf_chk@PLT
	movl	CORE_NO(%rip), %edx
	subq	$8, %rsp
	.cfi_def_cfa_offset 66280
	movl	NUM_BITS(%rip), %r9d
	leaq	.LC61(%rip), %r8
	pushq	%rdx
	.cfi_def_cfa_offset 66288
.L585:
	movl	$100, %ecx
	movl	$1, %edx
	movq	%r12, %rdi
	xorl	%eax, %eax
	movl	$100, %esi
	call	__snprintf_chk@PLT
	leaq	.LC32(%rip), %rsi
	movq	%r12, %rdi
	call	gzopen@PLT
	movq	%rax, 104(%rsp)
	popq	%rsi
	.cfi_def_cfa_offset 66280
	popq	%rdi
	.cfi_def_cfa_offset 66272
	testq	%rax, %rax
	jne	.L198
.L201:
	movq	%r12, %rdi
	call	open_gzfile.part.0
	.p2align 4,,10
	.p2align 3
.L611:
	clflush	0(%r13,%rax)
	addq	$64, %rax
	jmp	.L477
.L612:
	clflush	64(%rbp)
	movl	$128, %r9d
	jmp	.L471
.L621:
	leaq	320(%rsp), %r12
	subq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 66280
	leaq	.LC35(%rip), %r8
	pushq	%r11
	.cfi_def_cfa_offset 66288
	jmp	.L585
.L604:
	.cfi_restore_state
	movq	24(%rsp), %rdi
	call	gzeof@PLT
	testl	%eax, %eax
	jne	.L248
	leaq	.LC43(%rip), %rdi
.L594:
	call	perror@PLT
	movq	24(%rsp), %rdi
	call	gzclose@PLT
	movl	$1, %edi
	call	exit@PLT
	.p2align 4,,10
	.p2align 3
.L251:
	leaq	.LC54(%rip), %rdi
	call	puts@PLT
	jmp	.L252
.L250:
	leaq	.LC56(%rip), %rdi
	call	puts@PLT
	jmp	.L252
.L249:
	leaq	.LC55(%rip), %rdi
	call	puts@PLT
	jmp	.L252
.L613:
	movq	88(%rsp), %rdi
	call	gzclose@PLT
	jmp	.L172
.L614:
	movq	72(%rsp), %rdi
	call	gzclose@PLT
	jmp	.L172
.L615:
	movq	80(%rsp), %rdi
	call	gzclose@PLT
	jmp	.L172
.L274:
	movq	32(%rsp), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC45(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movq	24(%rsp), %rdi
	call	gzclose@PLT
	movl	$1, %edi
	call	exit@PLT
.L616:
	call	__stack_chk_fail@PLT
.L603:
	leaq	.LC17(%rip), %rdi
	jmp	.L594
.L602:
	movq	%r15, %rdi
	call	open_gzfile.part.0
.L619:
	leaq	.LC48(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L618:
	leaq	.LC7(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L177:
	leaq	.LC28(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L605:
	leaq	.LC46(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L606:
	leaq	.LC47(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE5801:
	.size	run_tests, .-run_tests
	.section	.rodata.str1.8
	.align 8
.LC66:
	.string	"Usage: %s <number of bits> <core number> <test-case number> <measure_type>\n"
	.section	.rodata.str1.1
.LC67:
	.string	"sub.c"
.LC68:
	.string	"atoi(argv[1]) > 0"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB5788:
	.cfi_startproc
	endbr64
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
	je	.L623
	movq	(%rsi), %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC66(%rip), %rsi
	call	__printf_chk@PLT
	movl	$1, %eax
.L622:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L623:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	testl	%eax, %eax
	jle	.L627
	movq	8(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	%eax, NUM_BITS(%rip)
	call	strtol@PLT
	movq	24(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	%eax, CORE_NO(%rip)
	call	strtol@PLT
	movq	32(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, %rbp
	call	strtol@PLT
	movl	%ebp, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
	call	run_tests
	xorl	%eax, %eax
	jmp	.L622
.L627:
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$160, %edx
	leaq	.LC67(%rip), %rsi
	leaq	.LC68(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE5788:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 5
__PRETTY_FUNCTION__.0:
	.string	"main"
	.globl	event_names
	.section	.rodata.str1.1
.LC69:
	.string	"PERF_COUNT_HW_CPU_CYCLES"
	.section	.rodata.str1.8
	.align 8
.LC70:
	.string	"PERF_COUNT_HW_USER_INSTRUCTIONS"
	.align 8
.LC71:
	.string	"PERF_COUNT_HW_KERNEL_INSTRUCTIONS"
	.section	.rodata.str1.1
.LC72:
	.string	"PERF_COUNT_SW_PAGE_FAULTS"
.LC73:
	.string	"PERF_COUNT_L1D_CACHE_READS"
	.section	.rodata.str1.8
	.align 8
.LC74:
	.string	"PERF_COUNT_L1D_CACHE_READ_MISSES"
	.section	.data.rel.local,"aw"
	.align 32
	.type	event_names, @object
	.size	event_names, 48
event_names:
	.quad	.LC69
	.quad	.LC70
	.quad	.LC71
	.quad	.LC72
	.quad	.LC73
	.quad	.LC74
	.globl	count
	.bss
	.align 8
	.type	count, @object
	.size	count, 8
count:
	.zero	8
	.globl	fd
	.align 16
	.type	fd, @object
	.size	fd, 24
fd:
	.zero	24
	.globl	pe
	.align 32
	.type	pe, @object
	.size	pe, 768
pe:
	.zero	768
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
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
