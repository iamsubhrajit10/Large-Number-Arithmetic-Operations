	.file	"sub_avx_64_aligned.c"
# GNU C17 (Ubuntu 11.4.0-1ubuntu1~22.04) version 11.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mavx512f -mtune=generic -march=x86-64 -O3 -funroll-all-loops -fopt-info-vec-optimized=explicit_vec_report.txt -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Error opening file for writing \n"
	.text
	.p2align 4
	.type	open_file.part.0, @function
open_file.part.0:
.LFB5802:
	.cfi_startproc
	pushq	%rax	#
	.cfi_def_cfa_offset 16
	popq	%rax	#
	.cfi_def_cfa_offset 8
# sub_avx_64_aligned.c:647:         perror("Error opening file for writing \n");
	leaq	.LC0(%rip), %rdi	#, tmp82
# sub_avx_64_aligned.c:641: FILE *open_file(char *filename)
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 16
# sub_avx_64_aligned.c:647:         perror("Error opening file for writing \n");
	call	perror@PLT	#
# sub_avx_64_aligned.c:648:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5802:
	.size	open_file.part.0, .-open_file.part.0
	.section	.rodata.str1.8
	.align 8
.LC1:
	.string	"Memory allocation failed for str\n"
	.text
	.p2align 4
	.type	convert_digits_to_string.part.0, @function
convert_digits_to_string.part.0:
.LFB5805:
	.cfi_startproc
	pushq	%rax	#
	.cfi_def_cfa_offset 16
	popq	%rax	#
	.cfi_def_cfa_offset 8
# sub_avx_64_aligned.c:858:         perror("Memory allocation failed for str\n");
	leaq	.LC1(%rip), %rdi	#, tmp82
# sub_avx_64_aligned.c:853: char *convert_digits_to_string(uint64_t *digits, int n)
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 16
# sub_avx_64_aligned.c:858:         perror("Memory allocation failed for str\n");
	call	perror@PLT	#
# sub_avx_64_aligned.c:859:         exit(0);
	xorl	%edi, %edi	#
	call	exit@PLT	#
	.cfi_endproc
.LFE5805:
	.size	convert_digits_to_string.part.0, .-convert_digits_to_string.part.0
	.p2align 4
	.globl	perf_event_open
	.type	perf_event_open, @function
perf_event_open:
.LFB5777:
	.cfi_startproc
	endbr64	
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 16
# sub_avx_64_aligned.c:123:     ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
	movq	%r8, %r9	# tmp95,
	xorl	%eax, %eax	#
	movl	%ecx, %r8d	# tmp94,
	movl	%edx, %ecx	# cpu,
	movl	%esi, %edx	# pid,
	movq	%rdi, %rsi	# hw_event,
	movl	$298, %edi	#,
	call	syscall@PLT	#
# sub_avx_64_aligned.c:125: }
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 8
# sub_avx_64_aligned.c:124:     return ret;
	cltq
# sub_avx_64_aligned.c:125: }
	ret	
	.cfi_endproc
.LFE5777:
	.size	perf_event_open, .-perf_event_open
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"/dev/urandom"
.LC3:
	.string	"Error opening /dev/urandom"
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Error reading from /dev/urandom"
	.text
	.p2align 4
	.globl	generate_seed
	.type	generate_seed, @function
generate_seed:
.LFB5778:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# sub_avx_64_aligned.c:131:     clock_gettime(CLOCK_MONOTONIC, &ts1);
	movl	$1, %edi	#,
# sub_avx_64_aligned.c:129: {
	subq	$64, %rsp	#,
	.cfi_def_cfa_offset 80
# sub_avx_64_aligned.c:129: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp116
	movq	%rax, 56(%rsp)	# tmp116, D.39376
	xorl	%eax, %eax	# tmp116
# sub_avx_64_aligned.c:131:     clock_gettime(CLOCK_MONOTONIC, &ts1);
	leaq	16(%rsp), %rsi	#, tmp98
	call	clock_gettime@PLT	#
# sub_avx_64_aligned.c:132:     clock_gettime(CLOCK_REALTIME, &ts2);
	xorl	%edi, %edi	#
	leaq	32(%rsp), %rsi	#, tmp99
	call	clock_gettime@PLT	#
# /usr/include/x86_64-linux-gnu/bits/fcntl2.h:53:       return __open_alias (__path, __oflag, __va_arg_pack ());
	xorl	%esi, %esi	#
	xorl	%eax, %eax	#
	leaq	.LC2(%rip), %rdi	#, tmp100
	call	open@PLT	#
# sub_avx_64_aligned.c:135:     if (urandom_fd == -1)
	cmpl	$-1, %eax	#, _28
	je	.L13	#,
# /usr/include/x86_64-linux-gnu/bits/unistd.h:38:   return __glibc_fortify (read, __nbytes, sizeof (char),
	leaq	8(%rsp), %rsi	#, tmp102
	movl	$8, %edx	#,
	movl	%eax, %edi	# _28,
	movl	%eax, %ebp	# tmp112, _28
	call	read@PLT	#
# sub_avx_64_aligned.c:143:     if (result != sizeof(urandom_value))
	cmpq	$8, %rax	#, tmp113
	jne	.L14	#,
# sub_avx_64_aligned.c:149:     close(urandom_fd);
	movl	%ebp, %edi	# _28,
	call	close@PLT	#
# sub_avx_64_aligned.c:151:     pid_t pid = getpid();
	call	getpid@PLT	#
# sub_avx_64_aligned.c:152:     pid_t tid = syscall(SYS_gettid);
	movl	$186, %edi	#,
# sub_avx_64_aligned.c:151:     pid_t pid = getpid();
	movslq	%eax, %rbp	# tmp114,
# sub_avx_64_aligned.c:152:     pid_t tid = syscall(SYS_gettid);
	xorl	%eax, %eax	#
	call	syscall@PLT	#
	movq	%rax, %r8	#, tmp115
# sub_avx_64_aligned.c:154:     return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
	movq	24(%rsp), %rax	# ts1.tv_nsec, ts1.tv_nsec
	xorq	40(%rsp), %rax	# ts2.tv_nsec, tmp104
# sub_avx_64_aligned.c:154:     return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
	xorq	8(%rsp), %rax	# urandom_value, tmp106
# sub_avx_64_aligned.c:154:     return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
	movslq	%r8d, %rdx	# tmp115, _1
# sub_avx_64_aligned.c:154:     return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
	xorq	%rbp, %rax	# pid, tmp108
# sub_avx_64_aligned.c:154:     return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
	xorq	%rdx, %rax	# _1, <retval>
# sub_avx_64_aligned.c:155: }
	movq	56(%rsp), %rdx	# D.39376, tmp117
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp117
	jne	.L15	#,
	addq	$64, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbp	#
	.cfi_def_cfa_offset 8
	ret	
.L13:
	.cfi_restore_state
# sub_avx_64_aligned.c:137:         perror("Error opening /dev/urandom");
	leaq	.LC3(%rip), %rdi	#, tmp101
	call	perror@PLT	#
# sub_avx_64_aligned.c:138:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L15:
# sub_avx_64_aligned.c:155: }
	call	__stack_chk_fail@PLT	#
.L14:
# sub_avx_64_aligned.c:145:         perror("Error reading from /dev/urandom");
	leaq	.LC4(%rip), %rdi	#, tmp103
	call	perror@PLT	#
# sub_avx_64_aligned.c:146:         close(urandom_fd);
	movl	%ebp, %edi	# _28,
	call	close@PLT	#
# sub_avx_64_aligned.c:147:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5778:
	.size	generate_seed, .-generate_seed
	.p2align 4
	.globl	left_shift
	.type	left_shift, @function
left_shift:
.LFB5780:
	.cfi_startproc
	endbr64	
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
# sub_avx_64_aligned.c:182:         memset(borrow_array, 0, n * sizeof(uint64_t)); // Clear the array if it's empty or has only one element
	movslq	%esi, %r12	# n, n
	salq	$3, %r12	#, _19
# sub_avx_64_aligned.c:180:     if (n <= 1)
	cmpl	$1, %esi	#, n
	jle	.L19	#,
# sub_avx_64_aligned.c:187:     memmove(borrow_array, borrow_array + 1, (n - 1) * sizeof(uint64_t));
	leaq	-8(%r12), %rdx	#, tmp97
# sub_avx_64_aligned.c:187:     memmove(borrow_array, borrow_array + 1, (n - 1) * sizeof(uint64_t));
	leaq	8(%rdi), %rsi	#, tmp98
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	call	memmove@PLT	#
# sub_avx_64_aligned.c:190:     borrow_array[n - 1] = 0;
	movq	$0, -8(%rax,%r12)	#, *_8
# sub_avx_64_aligned.c:191: }
	popq	%r12	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L19:
	.cfi_restore_state
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	%r12, %rdx	# _19,
	xorl	%esi, %esi	#
# sub_avx_64_aligned.c:191: }
	popq	%r12	#
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	jmp	memset@PLT	#
	.cfi_endproc
.LFE5780:
	.size	left_shift, .-left_shift
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"Memory could not be allocated for limbs"
	.text
	.p2align 4
	.globl	returnLimbs
	.type	returnLimbs, @function
returnLimbs:
.LFB5783:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	movq	%rdi, %r14	# tmp136, number
	pushq	%r13	#
	pushq	%r12	#
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	movq	%rsi, %r12	# tmp137, length
	pushq	%rbx	#
	andq	$-64, %rsp	#,
	subq	$64, %rsp	#,
	.cfi_offset 3, -56
# sub_avx_64_aligned.c:364:     int n = *length;
	movl	(%rsi), %r13d	# *length_25(D), n
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	movl	$64, %esi	#,
# sub_avx_64_aligned.c:362: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp139
	movq	%rax, 56(%rsp)	# tmp139, D.39421
	xorl	%eax, %eax	# tmp139
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	48(%rsp), %rdi	#, tmp114
# sub_avx_64_aligned.c:365:     int num_limbs = (n + LIMB_SIZE - 1) / LIMB_SIZE; // Calculate the number of limbs needed
	leal	18(%r13), %eax	#, tmp107
# sub_avx_64_aligned.c:365:     int num_limbs = (n + LIMB_SIZE - 1) / LIMB_SIZE; // Calculate the number of limbs needed
	movslq	%eax, %rbx	# tmp107, tmp108
	sarl	$31, %eax	#, tmp112
	imulq	$1808407283, %rbx, %rbx	#, tmp108, tmp109
	sarq	$35, %rbx	#, tmp111
	subl	%eax, %ebx	# tmp112, num_limbs
# sub_avx_64_aligned.c:366:     limbs = (aligned_uint64_ptr)_mm_malloc(num_limbs * sizeof(uint64_t), 64);
	movslq	%ebx, %r15	# num_limbs, num_limbs
	salq	$3, %r15	#, _3
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	movq	%r15, %rdx	# _3,
	call	posix_memalign@PLT	#
	testl	%eax, %eax	# tmp138
	je	.L33	#,
.L21:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC5(%rip), %rdi	#, tmp115
	call	puts@PLT	#
# sub_avx_64_aligned.c:370:         exit(1);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.p2align 4,,10
	.p2align 3
.L33:
	movq	48(%rsp), %r9	# D.39403, <retval>
# sub_avx_64_aligned.c:367:     if (limbs == NULL)
	testq	%r9, %r9	# <retval>
	je	.L21	#,
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	%r15, %rdx	# _3,
	xorl	%esi, %esi	#
	movq	%r9, %rdi	# <retval>,
	call	memset@PLT	#
# sub_avx_64_aligned.c:374:     int k = num_limbs - 1;
	leal	-1(%rbx), %r8d	#, k
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	%rax, %r15	#, <retval>
# sub_avx_64_aligned.c:375:     while (i >= 0)
	testl	%r13d, %r13d	# n
	jle	.L23	#,
	leal	-2(%r13), %edx	#, tmp120
# sub_avx_64_aligned.c:379:         for (int j = 0; j < LIMB_SIZE && i >= 0; j++, i--)
	xorl	%r11d, %r11d	# j
# sub_avx_64_aligned.c:378:         uint64_t power = 1;
	movl	$1, %r13d	#, power
# sub_avx_64_aligned.c:377:         aligned_uint64 limb = 0;
	xorl	%esi, %esi	# limb
	movslq	%edx, %rax	# tmp120, ivtmp.125
	jmp	.L24	#
	.p2align 4,,10
	.p2align 3
.L25:
	subq	$1, %rax	#, ivtmp.125
.L24:
# sub_avx_64_aligned.c:381:             limb += number[i] * power;
	movq	8(%r14,%rax,8), %rdi	# MEM[(uint64_t *)number_35(D) + 8B + ivtmp.125_92 * 8], tmp121
# sub_avx_64_aligned.c:379:         for (int j = 0; j < LIMB_SIZE && i >= 0; j++, i--)
	addl	$1, %r11d	#, j
	movl	%eax, %r10d	# ivtmp.125, i
# sub_avx_64_aligned.c:381:             limb += number[i] * power;
	imulq	%r13, %rdi	# power, tmp121
# sub_avx_64_aligned.c:382:             power *= 10;
	leaq	0(%r13,%r13,4), %r13	#, tmp124
	addq	%r13, %r13	# power
# sub_avx_64_aligned.c:381:             limb += number[i] * power;
	addq	%rdi, %rsi	# tmp121, limb
# sub_avx_64_aligned.c:379:         for (int j = 0; j < LIMB_SIZE && i >= 0; j++, i--)
	cmpl	$18, %r11d	#, j
	jg	.L28	#,
	testl	%eax, %eax	# ivtmp.125
	jns	.L25	#,
.L28:
# sub_avx_64_aligned.c:384:         limbs[k] = limb;
	movslq	%r8d, %rcx	# k, k
# sub_avx_64_aligned.c:384:         limbs[k] = limb;
	movq	%rsi, (%r15,%rcx,8)	# limb, MEM[(uint64_t *)_102]
# sub_avx_64_aligned.c:375:     while (i >= 0)
	testl	%r10d, %r10d	# i
	js	.L23	#,
# sub_avx_64_aligned.c:385:         k--;
	subl	$1, %r8d	#, k
# sub_avx_64_aligned.c:379:         for (int j = 0; j < LIMB_SIZE && i >= 0; j++, i--)
	xorl	%r11d, %r11d	# j
# sub_avx_64_aligned.c:378:         uint64_t power = 1;
	movl	$1, %r13d	#, power
# sub_avx_64_aligned.c:377:         aligned_uint64 limb = 0;
	xorl	%esi, %esi	# limb
	jmp	.L25	#
.L23:
# sub_avx_64_aligned.c:387:     *length = num_limbs;
	movl	%ebx, (%r12)	# num_limbs, *length_25(D)
# sub_avx_64_aligned.c:389: }
	movq	56(%rsp), %rax	# D.39421, tmp140
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp140
	jne	.L34	#,
	leaq	-40(%rbp), %rsp	#,
	movq	%r15, %rax	# <retval>,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
.L34:
	.cfi_restore_state
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE5783:
	.size	returnLimbs, .-returnLimbs
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"Memory allocation failed for result_str\n"
	.section	.rodata.str1.1
.LC7:
	.string	"%lu"
.LC8:
	.string	"%019lu"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Memory allocation failed for final_result\n"
	.text
	.p2align 4
	.globl	formatResult
	.type	formatResult, @function
formatResult:
.LFB5784:
	.cfi_startproc
	endbr64	
	pushq	%r14	#
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdi, %r14	# tmp180, result
	pushq	%r13	#
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %r13	# tmp181, result_length
	pushq	%r12	#
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp	#
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx	#
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$48, %rsp	#,
	.cfi_def_cfa_offset 96
# sub_avx_64_aligned.c:393:     char *result_str = (char *)calloc(*result_length * 25 + 1, sizeof(char)); // 25 digits + null terminator per number
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], *result_length_38(D)
	movq	%rax, 40(%rsp)	# *result_length_38(D), D.39462
	movl	(%rsi), %eax	# *result_length_38(D), *result_length_38(D)
# sub_avx_64_aligned.c:393:     char *result_str = (char *)calloc(*result_length * 25 + 1, sizeof(char)); // 25 digits + null terminator per number
	movl	$1, %esi	#,
# sub_avx_64_aligned.c:393:     char *result_str = (char *)calloc(*result_length * 25 + 1, sizeof(char)); // 25 digits + null terminator per number
	leal	(%rax,%rax,4), %edx	#, tmp120
# sub_avx_64_aligned.c:393:     char *result_str = (char *)calloc(*result_length * 25 + 1, sizeof(char)); // 25 digits + null terminator per number
	leal	1(%rdx,%rdx,4), %edi	#, tmp123
# sub_avx_64_aligned.c:393:     char *result_str = (char *)calloc(*result_length * 25 + 1, sizeof(char)); // 25 digits + null terminator per number
	movslq	%edi, %rdi	# tmp123, tmp124
	call	calloc@PLT	#
# sub_avx_64_aligned.c:394:     if (result_str == NULL)
	testq	%rax, %rax	# result_str
	je	.L92	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:38:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	(%r14), %r8	# *result_41(D),
	movq	%rax, %rdi	# result_str,
	movq	%rax, %rbp	# tmp182, result_str
	leaq	.LC7(%rip), %rcx	#, tmp127
	xorl	%eax, %eax	#
	movl	$1, %esi	#,
# sub_avx_64_aligned.c:421:     for (int i = 1; i < *result_length; i++)
	movl	$1, %r12d	#, ivtmp.158
	movq	%rsp, %rbx	#, tmp147
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:38:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	$-1, %rdx	#,
	call	__sprintf_chk@PLT	#
# sub_avx_64_aligned.c:421:     for (int i = 1; i < *result_length; i++)
	cmpl	$1, 0(%r13)	#, *result_length_38(D)
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC8(%rip), %r8	#, tmp149
# sub_avx_64_aligned.c:421:     for (int i = 1; i < *result_length; i++)
	jle	.L40	#,
.L37:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	movq	(%r14,%r12,8), %r9	# MEM[(uint64_t *)result_41(D) + ivtmp.158_89 * 8],
	movl	$25, %ecx	#,
	movl	$1, %edx	#,
	xorl	%eax, %eax	#
	movl	$25, %esi	#,
	movq	%rbx, %rdi	# tmp147,
	call	__snprintf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%rbx, %rsi	# tmp147,
	movq	%rbp, %rdi	# result_str,
	call	strcat@PLT	#
# sub_avx_64_aligned.c:421:     for (int i = 1; i < *result_length; i++)
	leaq	1(%r12), %rcx	#, tmp152
	cmpl	%ecx, 0(%r13)	# tmp152, *result_length_38(D)
	leaq	.LC8(%rip), %r8	#, tmp149
	jle	.L40	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	movq	(%r14,%rcx,8), %r9	# MEM[(uint64_t *)result_41(D) + ivtmp.158_89 * 8],
	movl	$1, %edx	#,
	movl	$25, %ecx	#,
	xorl	%eax, %eax	#
	movl	$25, %esi	#,
	movq	%rbx, %rdi	# tmp147,
	call	__snprintf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%rbx, %rsi	# tmp147,
	movq	%rbp, %rdi	# result_str,
	call	strcat@PLT	#
# sub_avx_64_aligned.c:421:     for (int i = 1; i < *result_length; i++)
	leaq	2(%r12), %rsi	#, ivtmp.158
	cmpl	%esi, 0(%r13)	# ivtmp.158, *result_length_38(D)
	jle	.L40	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	movq	(%r14,%rsi,8), %r9	# MEM[(uint64_t *)result_41(D) + ivtmp.158_89 * 8],
	leaq	.LC8(%rip), %r8	#, tmp149
	movq	%rbx, %rdi	# tmp147,
	xorl	%eax, %eax	#
	movl	$25, %ecx	#,
	movl	$1, %edx	#,
	movl	$25, %esi	#,
	call	__snprintf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%rbx, %rsi	# tmp147,
	movq	%rbp, %rdi	# result_str,
	call	strcat@PLT	#
# sub_avx_64_aligned.c:421:     for (int i = 1; i < *result_length; i++)
	leaq	3(%r12), %r8	#, ivtmp.158
	cmpl	%r8d, 0(%r13)	# ivtmp.158, *result_length_38(D)
	jle	.L40	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	movq	(%r14,%r8,8), %r9	# MEM[(uint64_t *)result_41(D) + ivtmp.158_89 * 8],
	movl	$25, %ecx	#,
	movl	$1, %edx	#,
	xorl	%eax, %eax	#
	leaq	.LC8(%rip), %r8	#, tmp149
	movl	$25, %esi	#,
	movq	%rbx, %rdi	# tmp147,
# sub_avx_64_aligned.c:421:     for (int i = 1; i < *result_length; i++)
	addq	$4, %r12	#, ivtmp.158
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	call	__snprintf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%rbx, %rsi	# tmp147,
	movq	%rbp, %rdi	# result_str,
	call	strcat@PLT	#
# sub_avx_64_aligned.c:421:     for (int i = 1; i < *result_length; i++)
	cmpl	%r12d, 0(%r13)	# ivtmp.158, *result_length_38(D)
	leaq	.LC8(%rip), %r8	#, tmp149
	jg	.L37	#,
	.p2align 4,,10
	.p2align 3
.L40:
# sub_avx_64_aligned.c:429:     while (result_str[i] == '0')
	xorl	%r12d, %r12d	# ivtmp.151
# sub_avx_64_aligned.c:428:     i = 0;
	xorl	%ebx, %ebx	#
# sub_avx_64_aligned.c:429:     while (result_str[i] == '0')
	cmpb	$48, 0(%rbp)	#, *result_str_40
	movl	$1, %r9d	#, ivtmp.151
	movq	%rbp, %r14	# result_str, _90
	jne	.L39	#,
.L38:
	cmpb	$48, 0(%rbp,%r9)	#, MEM[(char *)result_str_40 + -1B + ivtmp.151_94 * 1]
# sub_avx_64_aligned.c:431:         i++;
	movslq	%r9d, %rbx	# ivtmp.151,
# sub_avx_64_aligned.c:429:     while (result_str[i] == '0')
	leaq	1(%r9), %r10	#, tmp151
	movq	%r9, %r12	# ivtmp.151, ivtmp.151
	leaq	0(%rbp,%r9), %r14	#, _90
	jne	.L39	#,
	cmpb	$48, 1(%rbp,%r9)	#, MEM[(char *)result_str_40 + -1B + ivtmp.151_94 * 1]
# sub_avx_64_aligned.c:431:         i++;
	movslq	%r10d, %rbx	# tmp151,
# sub_avx_64_aligned.c:429:     while (result_str[i] == '0')
	leaq	2(%r9), %r11	#, ivtmp.151
	movq	%r10, %r12	# tmp151, ivtmp.151
	leaq	0(%rbp,%r10), %r14	#, _90
	jne	.L39	#,
	cmpb	$48, 2(%rbp,%r9)	#, MEM[(char *)result_str_40 + -1B + ivtmp.151_94 * 1]
# sub_avx_64_aligned.c:431:         i++;
	movslq	%r11d, %rbx	# ivtmp.151,
# sub_avx_64_aligned.c:429:     while (result_str[i] == '0')
	leaq	3(%r9), %rax	#, ivtmp.151
	movq	%r11, %r12	# ivtmp.151, ivtmp.151
	leaq	0(%rbp,%r11), %r14	#, _90
	jne	.L39	#,
	cmpb	$48, 3(%rbp,%r9)	#, MEM[(char *)result_str_40 + -1B + ivtmp.151_94 * 1]
# sub_avx_64_aligned.c:431:         i++;
	movslq	%eax, %rbx	# ivtmp.151,
# sub_avx_64_aligned.c:429:     while (result_str[i] == '0')
	leaq	4(%r9), %rdx	#, ivtmp.151
	movq	%rax, %r12	# ivtmp.151, ivtmp.151
	leaq	0(%rbp,%rax), %r14	#, _90
	jne	.L39	#,
	cmpb	$48, 4(%rbp,%r9)	#, MEM[(char *)result_str_40 + -1B + ivtmp.151_94 * 1]
# sub_avx_64_aligned.c:431:         i++;
	movslq	%edx, %rbx	# ivtmp.151,
# sub_avx_64_aligned.c:429:     while (result_str[i] == '0')
	leaq	5(%r9), %rdi	#, ivtmp.151
	movq	%rdx, %r12	# ivtmp.151, ivtmp.151
	leaq	0(%rbp,%rdx), %r14	#, _90
	jne	.L39	#,
	cmpb	$48, 5(%rbp,%r9)	#, MEM[(char *)result_str_40 + -1B + ivtmp.151_94 * 1]
# sub_avx_64_aligned.c:431:         i++;
	movslq	%edi, %rbx	# ivtmp.151,
# sub_avx_64_aligned.c:429:     while (result_str[i] == '0')
	leaq	6(%r9), %rcx	#, ivtmp.151
	movq	%rdi, %r12	# ivtmp.151, ivtmp.151
	leaq	0(%rbp,%rdi), %r14	#, _90
	jne	.L39	#,
	cmpb	$48, 6(%rbp,%r9)	#, MEM[(char *)result_str_40 + -1B + ivtmp.151_94 * 1]
# sub_avx_64_aligned.c:431:         i++;
	movslq	%ecx, %rbx	# ivtmp.151,
# sub_avx_64_aligned.c:429:     while (result_str[i] == '0')
	leaq	7(%r9), %rsi	#, ivtmp.151
	movq	%rcx, %r12	# ivtmp.151, ivtmp.151
	leaq	0(%rbp,%rcx), %r14	#, _90
	jne	.L39	#,
	addq	$8, %r9	#, ivtmp.151
# sub_avx_64_aligned.c:431:         i++;
	movslq	%esi, %rbx	# ivtmp.151,
	leaq	0(%rbp,%rsi), %r14	#, _90
	movq	%rsi, %r12	# ivtmp.151, ivtmp.151
# sub_avx_64_aligned.c:429:     while (result_str[i] == '0')
	cmpb	$48, -1(%rbp,%r9)	#, MEM[(char *)result_str_40 + -1B + ivtmp.151_94 * 1]
	je	.L38	#,
	.p2align 4,,10
	.p2align 3
.L39:
# sub_avx_64_aligned.c:433:     if (i == strlen(result_str))
	movq	%rbp, %rdi	# result_str,
	call	strlen@PLT	#
# sub_avx_64_aligned.c:433:     if (i == strlen(result_str))
	cmpq	%r12, %rax	# ivtmp.151, tmp132
	je	.L93	#,
# sub_avx_64_aligned.c:440:     char *final_result = (char *)calloc(strlen(result_str) - i + 1, sizeof(char));
	leaq	1(%rax), %rdi	#, tmp135
	movl	$1, %esi	#,
	subq	%r12, %rdi	# ivtmp.151, tmp136
	call	calloc@PLT	#
	movq	%rax, %r12	# tmp185, <retval>
# sub_avx_64_aligned.c:441:     if (final_result == NULL)
	testq	%rax, %rax	# <retval>
	je	.L43	#,
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	movzbl	(%r14), %r14d	# *prephitmp_96, _31
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	movl	$1, %r8d	#, ivtmp.143
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	addq	%rbp, %rbx	# result_str, tmp140
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	movq	%rax, %rdx	# <retval>, _104
	testb	%r14b, %r14b	# _31
	je	.L45	#,
.L44:
	leaq	1(%r8), %r9	#, tmp150
# sub_avx_64_aligned.c:449:         final_result[j] = result_str[i];
	movb	%r14b, -1(%r12,%r8)	# _31, MEM[(char *)final_result_43 + -1B + ivtmp.143_55 * 1]
# sub_avx_64_aligned.c:451:         j++;
	movslq	%r8d, %rdx	# ivtmp.143,
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	movzbl	-1(%rbx,%r9), %r10d	# MEM[(char *)_98 + -1B + ivtmp.143_54 * 1], _31
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	testb	%r10b, %r10b	# _31
	je	.L90	#,
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	movzbl	1(%r8,%rbx), %eax	# MEM[(char *)_98 + -1B + ivtmp.143_54 * 1], _31
# sub_avx_64_aligned.c:449:         final_result[j] = result_str[i];
	movb	%r10b, -1(%r12,%r9)	# _31, MEM[(char *)final_result_43 + -1B + ivtmp.143_55 * 1]
# sub_avx_64_aligned.c:451:         j++;
	movslq	%r9d, %rdx	# tmp150,
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	leaq	2(%r8), %r11	#, ivtmp.143
	testb	%al, %al	# _31
	je	.L90	#,
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	movzbl	2(%r8,%rbx), %ecx	# MEM[(char *)_98 + -1B + ivtmp.143_54 * 1], _31
# sub_avx_64_aligned.c:449:         final_result[j] = result_str[i];
	movb	%al, 1(%r12,%r8)	# _31, MEM[(char *)final_result_43 + -1B + ivtmp.143_55 * 1]
# sub_avx_64_aligned.c:451:         j++;
	movslq	%r11d, %rdx	# ivtmp.143,
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	leaq	3(%r8), %rdi	#, ivtmp.143
	testb	%cl, %cl	# _31
	je	.L90	#,
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	movzbl	3(%r8,%rbx), %esi	# MEM[(char *)_98 + -1B + ivtmp.143_54 * 1], _31
# sub_avx_64_aligned.c:449:         final_result[j] = result_str[i];
	movb	%cl, 2(%r12,%r8)	# _31, MEM[(char *)final_result_43 + -1B + ivtmp.143_55 * 1]
# sub_avx_64_aligned.c:451:         j++;
	movslq	%edi, %rdx	# ivtmp.143,
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	leaq	4(%r8), %r14	#, ivtmp.143
	testb	%sil, %sil	# _31
	je	.L90	#,
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	movzbl	4(%r8,%rbx), %r10d	# MEM[(char *)_98 + -1B + ivtmp.143_54 * 1], _31
# sub_avx_64_aligned.c:449:         final_result[j] = result_str[i];
	movb	%sil, 3(%r12,%r8)	# _31, MEM[(char *)final_result_43 + -1B + ivtmp.143_55 * 1]
# sub_avx_64_aligned.c:451:         j++;
	movslq	%r14d, %rdx	# ivtmp.143,
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	leaq	5(%r8), %r9	#, ivtmp.143
	testb	%r10b, %r10b	# _31
	je	.L90	#,
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	movzbl	5(%r8,%rbx), %eax	# MEM[(char *)_98 + -1B + ivtmp.143_54 * 1], _31
# sub_avx_64_aligned.c:449:         final_result[j] = result_str[i];
	movb	%r10b, 4(%r12,%r8)	# _31, MEM[(char *)final_result_43 + -1B + ivtmp.143_55 * 1]
# sub_avx_64_aligned.c:451:         j++;
	movslq	%r9d, %rdx	# ivtmp.143,
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	leaq	6(%r8), %r11	#, ivtmp.143
	testb	%al, %al	# _31
	je	.L90	#,
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	movzbl	6(%r8,%rbx), %ecx	# MEM[(char *)_98 + -1B + ivtmp.143_54 * 1], _31
# sub_avx_64_aligned.c:449:         final_result[j] = result_str[i];
	movb	%al, 5(%r12,%r8)	# _31, MEM[(char *)final_result_43 + -1B + ivtmp.143_55 * 1]
# sub_avx_64_aligned.c:451:         j++;
	movslq	%r11d, %rdx	# ivtmp.143,
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	leaq	7(%r8), %rdi	#, ivtmp.143
	testb	%cl, %cl	# _31
	je	.L90	#,
# sub_avx_64_aligned.c:449:         final_result[j] = result_str[i];
	movb	%cl, 6(%r12,%r8)	# _31, MEM[(char *)final_result_43 + -1B + ivtmp.143_55 * 1]
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	addq	$8, %r8	#, ivtmp.143
# sub_avx_64_aligned.c:451:         j++;
	movslq	%edi, %rdx	# ivtmp.143,
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	movzbl	-1(%rbx,%r8), %r14d	# MEM[(char *)_98 + -1B + ivtmp.143_54 * 1], _31
# sub_avx_64_aligned.c:447:     while (result_str[i] != '\0')
	testb	%r14b, %r14b	# _31
	jne	.L44	#,
	.p2align 4,,10
	.p2align 3
.L90:
# sub_avx_64_aligned.c:453:     final_result[j] = '\0';
	addq	%r12, %rdx	# <retval>, _104
.L45:
# sub_avx_64_aligned.c:453:     final_result[j] = '\0';
	movb	$0, (%rdx)	#, *prephitmp_105
# sub_avx_64_aligned.c:454:     free(result_str);
	movq	%rbp, %rdi	# result_str,
	call	free@PLT	#
# sub_avx_64_aligned.c:455:     *result_length = strlen(final_result);
	movq	%r12, %rdi	# <retval>,
	call	strlen@PLT	#
# sub_avx_64_aligned.c:455:     *result_length = strlen(final_result);
	movl	%eax, 0(%r13)	# tmp186, *result_length_38(D)
.L35:
# sub_avx_64_aligned.c:457: }
	movq	40(%rsp), %rax	# D.39462, tmp188
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp188
	jne	.L94	#,
	addq	$48, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movq	%r12, %rax	# <retval>,
	popq	%rbx	#
	.cfi_def_cfa_offset 40
	popq	%rbp	#
	.cfi_def_cfa_offset 32
	popq	%r12	#
	.cfi_def_cfa_offset 24
	popq	%r13	#
	.cfi_def_cfa_offset 16
	popq	%r14	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L93:
	.cfi_restore_state
# sub_avx_64_aligned.c:435:         char *temp = (char *)calloc(2, sizeof(char));
	movl	$1, %esi	#,
	movl	$2, %edi	#,
# sub_avx_64_aligned.c:436:         temp[0] = '0';
	movl	$48, %r13d	#,
# sub_avx_64_aligned.c:435:         char *temp = (char *)calloc(2, sizeof(char));
	call	calloc@PLT	#
# sub_avx_64_aligned.c:436:         temp[0] = '0';
	movw	%r13w, (%rax)	#, MEM <vector(2) char> [(char *)temp_53]
# sub_avx_64_aligned.c:435:         char *temp = (char *)calloc(2, sizeof(char));
	movq	%rax, %r12	# tmp184, <retval>
# sub_avx_64_aligned.c:438:         return temp;
	jmp	.L35	#
.L92:
# sub_avx_64_aligned.c:396:         perror("Memory allocation failed for result_str\n");
	leaq	.LC6(%rip), %rdi	#, tmp126
	call	perror@PLT	#
# sub_avx_64_aligned.c:397:         exit(0);
	xorl	%edi, %edi	#
	call	exit@PLT	#
.L94:
# sub_avx_64_aligned.c:457: }
	call	__stack_chk_fail@PLT	#
.L43:
# sub_avx_64_aligned.c:443:         perror("Memory allocation failed for final_result\n");
	leaq	.LC9(%rip), %rdi	#, tmp138
	call	perror@PLT	#
# sub_avx_64_aligned.c:444:         exit(0);
	xorl	%edi, %edi	#
	call	exit@PLT	#
	.cfi_endproc
.LFE5784:
	.size	formatResult, .-formatResult
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"Memory allocation failed for temp\n"
	.align 8
.LC11:
	.string	"Memory reallocation failed for num2\n"
	.align 8
.LC12:
	.string	"Memory reallocation failed for num1\n"
	.text
	.p2align 4
	.globl	make_equidistant
	.type	make_equidistant, @function
make_equidistant:
.LFB5785:
	.cfi_startproc
	endbr64	
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp	#,
	.cfi_def_cfa_offset 128
# sub_avx_64_aligned.c:461:     if (*n_1 == *n_2)
	movl	(%rdx), %r15d	# *n_1_59(D), _1
# sub_avx_64_aligned.c:461:     if (*n_1 == *n_2)
	movl	(%rcx), %r14d	# *n_2_60(D), _2
# sub_avx_64_aligned.c:460: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp232
	movq	%rax, 56(%rsp)	# tmp232, D.39508
	xorl	%eax, %eax	# tmp232
# sub_avx_64_aligned.c:461:     if (*n_1 == *n_2)
	cmpl	%r14d, %r15d	# _2, _1
	je	.L95	#,
	movq	%rcx, %rbx	# tmp227, n_2
# sub_avx_64_aligned.c:467:     __builtin_assume_aligned(*num1_base, 64);
	movq	(%rdi), %r8	# *num1_base_61(D), _3
# sub_avx_64_aligned.c:468:     __builtin_assume_aligned(*num2_base, 64);
	movq	(%rsi), %rcx	# *num2_base_62(D), _4
	movq	%rdi, %r13	# tmp224, num1_base
	movq	%rsi, %r12	# tmp225, num2_base
# sub_avx_64_aligned.c:473:     if (n1 > n2)
	jg	.L127	#,
# sub_avx_64_aligned.c:522:     else if (n2 > n1)
	jl	.L128	#,
.L95:
# sub_avx_64_aligned.c:571: }
	movq	56(%rsp), %rax	# D.39508, tmp235
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp235
	jne	.L126	#,
	addq	$72, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L127:
	.cfi_restore_state
# sub_avx_64_aligned.c:477:         aligned_uint64_ptr temp = (aligned_uint64_ptr)_mm_malloc(n1 * sizeof(uint64_t), 64);
	movslq	%r15d, %r13	# _1, _1
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	24(%rsp), %rdi	#, tmp145
	movl	$64, %esi	#,
	movq	%rcx, 8(%rsp)	# _4, %sfp
# sub_avx_64_aligned.c:477:         aligned_uint64_ptr temp = (aligned_uint64_ptr)_mm_malloc(n1 * sizeof(uint64_t), 64);
	movq	%r13, (%rsp)	# _1, %sfp
	leaq	0(,%r13,8), %r13	#, _6
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	movq	%r13, %rdx	# _6,
	call	posix_memalign@PLT	#
	movq	8(%rsp), %rcx	# %sfp, _4
	testl	%eax, %eax	# tmp228
	jne	.L99	#,
	movq	24(%rsp), %rbp	# D.39471, _105
# sub_avx_64_aligned.c:478:         if (temp == NULL)
	testq	%rbp, %rbp	# _105
	je	.L99	#,
# sub_avx_64_aligned.c:487:         for (int i = n2 - 1; i >= 0; i--)
	movl	%r14d, %eax	# _2, i
	subl	$1, %eax	#, i
	js	.L100	#,
# sub_avx_64_aligned.c:490:             temp[i + n1 - n2] = num2[i];
	movl	%eax, %r9d	# i, _146
	movq	(%rsp), %rsi	# %sfp, _1
	cltq
	movslq	%r14d, %r10	# _2, _2
	movq	%r9, %rdx	# _146, tmp149
	leaq	8(,%r9,8), %r11	#, tmp158
	negq	%rdx	# tmp149
	addq	%rax, %rsi	# _135, tmp151
	salq	$3, %rdx	#, tmp150
	subq	%r10, %rsi	# _2, tmp153
	leaq	(%rdx,%rsi,8), %rdi	#, tmp155
# sub_avx_64_aligned.c:490:             temp[i + n1 - n2] = num2[i];
	leaq	(%rdx,%rax,8), %r8	#, tmp160
# sub_avx_64_aligned.c:490:             temp[i + n1 - n2] = num2[i];
	movq	%r11, %rdx	# tmp158,
	addq	%rbp, %rdi	# _105, tmp156
# sub_avx_64_aligned.c:490:             temp[i + n1 - n2] = num2[i];
	leaq	(%rcx,%r8), %rsi	#, tmp161
# sub_avx_64_aligned.c:490:             temp[i + n1 - n2] = num2[i];
	call	memcpy@PLT	#
.L100:
# sub_avx_64_aligned.c:495:         for (int i = 0; i < n1 - n2; i++)
	movl	%r15d, %edi	# _1, tmp167
# sub_avx_64_aligned.c:497:             temp[i] = 0;
	xorl	%esi, %esi	#
# sub_avx_64_aligned.c:495:         for (int i = 0; i < n1 - n2; i++)
	subl	%r14d, %edi	# _2, tmp167
# sub_avx_64_aligned.c:497:             temp[i] = 0;
	movslq	%edi, %rdx	# tmp167, tmp168
	movq	%rbp, %rdi	# _105,
	salq	$3, %rdx	#, tmp169
	call	memset@PLT	#
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	32(%rsp), %rdi	#, tmp174
	movq	%r13, %rdx	# _6,
	movl	$64, %esi	#,
	call	posix_memalign@PLT	#
	testl	%eax, %eax	# tmp229
	je	.L129	#,
.L101:
# sub_avx_64_aligned.c:505:             perror("Memory reallocation failed for num2\n");
	leaq	.LC11(%rip), %rdi	#, tmp175
	call	perror@PLT	#
# sub_avx_64_aligned.c:506:             exit(0);
	xorl	%edi, %edi	#
	call	exit@PLT	#
	.p2align 4,,10
	.p2align 3
.L99:
# sub_avx_64_aligned.c:480:             perror("Memory allocation failed for temp\n");
	leaq	.LC10(%rip), %rdi	#, tmp146
	call	perror@PLT	#
# sub_avx_64_aligned.c:481:             exit(0);
	xorl	%edi, %edi	#
	call	exit@PLT	#
	.p2align 4,,10
	.p2align 3
.L128:
# sub_avx_64_aligned.c:526:         aligned_uint64_ptr temp = (aligned_uint64_ptr)_mm_malloc(n2 * sizeof(uint64_t), 64);
	movslq	%r14d, %rax	# _2, _2
	movq	%rdx, %rbp	# tmp226, n_1
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	40(%rsp), %rdi	#, tmp184
	movl	$64, %esi	#,
# sub_avx_64_aligned.c:526:         aligned_uint64_ptr temp = (aligned_uint64_ptr)_mm_malloc(n2 * sizeof(uint64_t), 64);
	leaq	0(,%rax,8), %r12	#, _26
	movq	%r8, 8(%rsp)	# _3, %sfp
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	movq	%r12, %rdx	# _26,
# sub_avx_64_aligned.c:526:         aligned_uint64_ptr temp = (aligned_uint64_ptr)_mm_malloc(n2 * sizeof(uint64_t), 64);
	movq	%rax, (%rsp)	# _2, %sfp
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	call	posix_memalign@PLT	#
	testl	%eax, %eax	# tmp230
	jne	.L99	#,
	movq	40(%rsp), %rbx	# D.39483, _129
# sub_avx_64_aligned.c:527:         if (temp == NULL)
	testq	%rbx, %rbx	# _129
	je	.L99	#,
# sub_avx_64_aligned.c:537:         for (int i = n1 - 1; i >= 0; i--)
	movl	%r15d, %eax	# _1, i
	subl	$1, %eax	#, i
	js	.L105	#,
# sub_avx_64_aligned.c:540:             temp[i + n2 - n1] = num1[i];
	movl	%eax, %r9d	# i, _112
	movq	(%rsp), %rsi	# %sfp, _2
# sub_avx_64_aligned.c:540:             temp[i + n2 - n1] = num1[i];
	movq	8(%rsp), %r8	# %sfp, _3
# sub_avx_64_aligned.c:540:             temp[i + n2 - n1] = num1[i];
	cltq
	movq	%r9, %rdx	# _112, tmp187
	leaq	8(,%r9,8), %r10	#, tmp194
	negq	%rdx	# tmp187
	salq	$3, %rdx	#, tmp188
	leaq	-8(%rdx,%rsi,8), %rdi	#, tmp191
# sub_avx_64_aligned.c:540:             temp[i + n2 - n1] = num1[i];
	leaq	(%rdx,%rax,8), %r11	#, tmp197
# sub_avx_64_aligned.c:540:             temp[i + n2 - n1] = num1[i];
	movq	%r10, %rdx	# tmp194,
	addq	%rbx, %rdi	# _129, tmp192
# sub_avx_64_aligned.c:540:             temp[i + n2 - n1] = num1[i];
	leaq	(%r8,%r11), %rsi	#, tmp198
# sub_avx_64_aligned.c:540:             temp[i + n2 - n1] = num1[i];
	call	memcpy@PLT	#
.L105:
# sub_avx_64_aligned.c:546:         for (int i = 0; i < n2 - n1; i++)
	movl	%r14d, %edi	# _2, tmp204
# sub_avx_64_aligned.c:548:             temp[i] = 0;
	xorl	%esi, %esi	#
# sub_avx_64_aligned.c:546:         for (int i = 0; i < n2 - n1; i++)
	subl	%r15d, %edi	# _1, tmp204
# sub_avx_64_aligned.c:548:             temp[i] = 0;
	movslq	%edi, %rdx	# tmp204, tmp205
	movq	%rbx, %rdi	# _129,
	salq	$3, %rdx	#, tmp206
	call	memset@PLT	#
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	48(%rsp), %rdi	#, tmp211
	movq	%r12, %rdx	# _26,
	movl	$64, %esi	#,
	call	posix_memalign@PLT	#
	testl	%eax, %eax	# tmp231
	je	.L130	#,
.L106:
# sub_avx_64_aligned.c:555:             perror("Memory reallocation failed for num1\n");
	leaq	.LC12(%rip), %rdi	#, tmp212
	call	perror@PLT	#
# sub_avx_64_aligned.c:556:             exit(0);
	xorl	%edi, %edi	#
	call	exit@PLT	#
	.p2align 4,,10
	.p2align 3
.L129:
	movq	32(%rsp), %r14	# D.39477, _117
# sub_avx_64_aligned.c:503:         if (num2 == NULL)
	testq	%r14, %r14	# _117
	je	.L101	#,
# sub_avx_64_aligned.c:512:         for (int i = 0; i < n1; i++)
	testl	%r15d, %r15d	# _1
	jle	.L103	#,
# sub_avx_64_aligned.c:514:             num2[i] = temp[i];
	movq	(%rsp), %rdx	# %sfp, _1
	movq	%rbp, %rsi	# _105,
	movq	%r14, %rdi	# _117,
	salq	$3, %rdx	#, _1
	call	memcpy@PLT	#
.L103:
# sub_avx_64_aligned.c:517:         *n_2 = n1;
	movl	%r15d, (%rbx)	# _1, *n_2_60(D)
# sub_avx_64_aligned.c:518:         *num2_base = num2;
	movq	%r14, (%r12)	# _117, *num2_base_62(D)
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:54:   free (__ptr);
	movq	56(%rsp), %rax	# D.39508, tmp233
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp233
	jne	.L126	#,
	movq	%rbp, %rdi	# _105,
.L125:
# sub_avx_64_aligned.c:571: }
	addq	$72, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:54:   free (__ptr);
	jmp	free@PLT	#
	.p2align 4,,10
	.p2align 3
.L130:
	.cfi_restore_state
	movq	48(%rsp), %r15	# D.39489, _141
# sub_avx_64_aligned.c:553:         if (num1 == NULL)
	testq	%r15, %r15	# _141
	je	.L106	#,
# sub_avx_64_aligned.c:562:         for (int i = 0; i < n2; i++)
	testl	%r14d, %r14d	# _2
	jle	.L108	#,
# sub_avx_64_aligned.c:564:             num1[i] = temp[i];
	movq	(%rsp), %rdx	# %sfp, _2
	movq	%rbx, %rsi	# _129,
	movq	%r15, %rdi	# _141,
	salq	$3, %rdx	#, _2
	call	memcpy@PLT	#
.L108:
# sub_avx_64_aligned.c:566:         *n_1 = n2;
	movl	%r14d, 0(%rbp)	# _2, *n_1_59(D)
# sub_avx_64_aligned.c:567:         *num1_base = num1;
	movq	%r15, 0(%r13)	# _141, *num1_base_61(D)
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:54:   free (__ptr);
	movq	56(%rsp), %rax	# D.39508, tmp234
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp234
	jne	.L126	#,
	movq	%rbx, %rdi	# _129,
	jmp	.L125	#
.L126:
# sub_avx_64_aligned.c:571: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE5785:
	.size	make_equidistant, .-make_equidistant
	.section	.rodata.str1.1
.LC13:
	.string	"Error opening event %d: %s\n"
	.text
	.p2align 4
	.globl	initialize_perf
	.type	initialize_perf, @function
initialize_perf:
.LFB5786:
	.cfi_startproc
	endbr64	
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movl	$96, %ecx	#, tmp116
	xorl	%eax, %eax	# tmp115
# sub_avx_64_aligned.c:618:     pe[3].type = PERF_TYPE_SOFTWARE;
	movabsq	$549755813889, %rdx	#, tmp181
# sub_avx_64_aligned.c:587: {
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	fd(%rip), %r12	#, tmp168
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	leaq	pe(%rip), %rbp	#, tmp167
# sub_avx_64_aligned.c:587: {
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	%rbp, %rdi	# tmp167, tmp114
# sub_avx_64_aligned.c:627:     pe[5].config = PERF_COUNT_HW_CACHE_L1D | (PERF_COUNT_HW_CACHE_OP_READ << 8) | (PERF_COUNT_HW_CACHE_RESULT_MISS << 16);
	xorl	%ebx, %ebx	# ivtmp.177
# sub_avx_64_aligned.c:587: {
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	rep stosq
# sub_avx_64_aligned.c:618:     pe[3].type = PERF_TYPE_SOFTWARE;
	movq	%rdx, 384+pe(%rip)	# tmp181, MEM <unsigned long> [(unsigned int *)&pe + 384B]
# sub_avx_64_aligned.c:622:     pe[4].type = PERF_TYPE_HW_CACHE;
	addq	$2, %rdx	#, tmp156
# sub_avx_64_aligned.c:592:         pe[i].size = sizeof(struct perf_event_attr);
	movl	$128, 4+pe(%rip)	#, pe[0].size
# sub_avx_64_aligned.c:593:         pe[i].disabled = 1;
	movb	$-59, 40+pe(%rip)	#, MEM <unsigned char> [(struct perf_event_attr *)&pe + 40B]
# sub_avx_64_aligned.c:592:         pe[i].size = sizeof(struct perf_event_attr);
	movl	$128, 132+pe(%rip)	#, pe[1].size
	movl	$128, 260+pe(%rip)	#, pe[2].size
# sub_avx_64_aligned.c:593:         pe[i].disabled = 1;
	movb	$-59, 424+pe(%rip)	#, MEM <unsigned char> [(struct perf_event_attr *)&pe + 424B]
	movb	$-59, 552+pe(%rip)	#, MEM <unsigned char> [(struct perf_event_attr *)&pe + 552B]
	movb	$-59, 680+pe(%rip)	#, MEM <unsigned char> [(struct perf_event_attr *)&pe + 680B]
# sub_avx_64_aligned.c:607:     pe[1].config = PERF_COUNT_HW_INSTRUCTIONS;
	movq	$1, 136+pe(%rip)	#, pe[1].config
# sub_avx_64_aligned.c:593:         pe[i].disabled = 1;
	movb	$-27, 168+pe(%rip)	#, MEM <unsigned char> [(struct perf_event_attr *)&pe + 168B]
# sub_avx_64_aligned.c:613:     pe[2].config = PERF_COUNT_HW_INSTRUCTIONS;
	movq	$1, 264+pe(%rip)	#, pe[2].config
# sub_avx_64_aligned.c:593:         pe[i].disabled = 1;
	movb	$-43, 296+pe(%rip)	#, MEM <unsigned char> [(struct perf_event_attr *)&pe + 296B]
# sub_avx_64_aligned.c:619:     pe[3].config = PERF_COUNT_SW_PAGE_FAULTS;
	movq	$2, 392+pe(%rip)	#, pe[3].config
# sub_avx_64_aligned.c:622:     pe[4].type = PERF_TYPE_HW_CACHE;
	movq	%rdx, 512+pe(%rip)	# tmp156, MEM <unsigned long> [(unsigned int *)&pe + 512B]
# sub_avx_64_aligned.c:626:     pe[5].type = PERF_TYPE_HW_CACHE;
	movq	%rdx, 640+pe(%rip)	# tmp156, MEM <unsigned long> [(unsigned int *)&pe + 640B]
# sub_avx_64_aligned.c:627:     pe[5].config = PERF_COUNT_HW_CACHE_L1D | (PERF_COUNT_HW_CACHE_OP_READ << 8) | (PERF_COUNT_HW_CACHE_RESULT_MISS << 16);
	movq	$65536, 648+pe(%rip)	#, pe[5].config
	.p2align 4,,10
	.p2align 3
.L133:
# sub_avx_64_aligned.c:123:     ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
	movq	%rbx, %rsi	# ivtmp.177, tmp161
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	xorl	%r9d, %r9d	#
	xorl	%edx, %edx	#
	salq	$7, %rsi	#, tmp161
	movl	$-1, %r8d	#,
	movl	$298, %edi	#,
	xorl	%eax, %eax	#
	addq	%rbp, %rsi	# tmp167, tmp162
	call	syscall@PLT	#
# sub_avx_64_aligned.c:632:         fd[i] = perf_event_open(&pe[i], 0, CORE_NO, -1, 0);
	movl	%eax, (%r12,%rbx,4)	# _36, MEM[(int *)&fd + ivtmp.177_52 * 4]
# sub_avx_64_aligned.c:633:         if (fd[i] == -1)
	cmpl	$-1, %eax	#, _36
	je	.L136	#,
# sub_avx_64_aligned.c:630:     for (int i = 0; i < MAX_EVENTS; i++)
	addq	$1, %rbx	#, ivtmp.177
	cmpq	$6, %rbx	#, ivtmp.177
	jne	.L133	#,
# sub_avx_64_aligned.c:639: }
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx	#
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
	ret	
.L136:
	.cfi_restore_state
# sub_avx_64_aligned.c:635:             fprintf(stderr, "Error opening event %d: %s\n", i, strerror(errno));
	call	__errno_location@PLT	#
# sub_avx_64_aligned.c:635:             fprintf(stderr, "Error opening event %d: %s\n", i, strerror(errno));
	movl	(%rax), %edi	# *_3,
	call	strerror@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	# stderr,
	movl	%ebx, %ecx	# i,
	leaq	.LC13(%rip), %rdx	#, tmp166
# sub_avx_64_aligned.c:635:             fprintf(stderr, "Error opening event %d: %s\n", i, strerror(errno));
	movq	%rax, %r8	#, tmp178
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$1, %esi	#,
	xorl	%eax, %eax	#
	call	__fprintf_chk@PLT	#
# sub_avx_64_aligned.c:636:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5786:
	.size	initialize_perf, .-initialize_perf
	.section	.rodata.str1.1
.LC14:
	.string	"w"
.LC15:
	.string	"%s,"
	.text
	.p2align 4
	.globl	open_file
	.type	open_file, @function
open_file:
.LFB5787:
	.cfi_startproc
	endbr64	
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
# sub_avx_64_aligned.c:643:     FILE *file = fopen(filename, "w");
	leaq	.LC14(%rip), %rsi	#, tmp88
# sub_avx_64_aligned.c:642: {
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
# sub_avx_64_aligned.c:643:     FILE *file = fopen(filename, "w");
	call	fopen@PLT	#
# sub_avx_64_aligned.c:645:     if (file == NULL)
	testq	%rax, %rax	# <retval>
	je	.L142	#,
	leaq	event_names(%rip), %rbx	#, ivtmp.193
	movq	%rax, %r12	# tmp94, <retval>
	leaq	.LC15(%rip), %rbp	#, tmp92
	leaq	48(%rbx), %r13	#, _18
	.p2align 4,,10
	.p2align 3
.L139:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rbx), %rcx	# MEM[(const char * *)_12],
	movq	%rbp, %rdx	# tmp92,
	movl	$1, %esi	#,
	movq	%r12, %rdi	# <retval>,
	xorl	%eax, %eax	#
# sub_avx_64_aligned.c:652:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$8, %rbx	#, ivtmp.193
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	__fprintf_chk@PLT	#
# sub_avx_64_aligned.c:652:     for (int j = 0; j < MAX_EVENTS; j++)
	cmpq	%r13, %rbx	# _18, ivtmp.193
	jne	.L139	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rsi	# <retval>,
	movl	$10, %edi	#,
	call	fputc@PLT	#
# sub_avx_64_aligned.c:658: }
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%r12, %rax	# <retval>,
	popq	%rbx	#
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
	ret	
.L142:
	.cfi_restore_state
	call	open_file.part.0	#
	.cfi_endproc
.LFE5787:
	.size	open_file, .-open_file
	.section	.rodata.str1.1
.LC16:
	.string	"Error reading counter value"
	.text
	.p2align 4
	.globl	read_perf
	.type	read_perf, @function
read_perf:
.LFB5788:
	.cfi_startproc
	endbr64	
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp	# tmp91, ivtmp.204
	pushq	%rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	fd(%rip), %rbx	#, ivtmp.203
	leaq	24(%rbx), %r12	#, _7
	.p2align 4,,10
	.p2align 3
.L145:
# /usr/include/x86_64-linux-gnu/bits/unistd.h:38:   return __glibc_fortify (read, __nbytes, sizeof (char),
	movl	(%rbx), %edi	# MEM[(int *)_13],
	movl	$8, %edx	#,
	movq	%rbp, %rsi	# ivtmp.204,
	call	read@PLT	#
# sub_avx_64_aligned.c:664:         if (read(fd[j], &values[j], sizeof(uint64_t)) == -1)
	cmpq	$-1, %rax	#, tmp92
	je	.L148	#,
# sub_avx_64_aligned.c:662:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$4, %rbx	#, ivtmp.203
	addq	$8, %rbp	#, ivtmp.204
	cmpq	%r12, %rbx	# _7, ivtmp.203
	jne	.L145	#,
# sub_avx_64_aligned.c:670: }
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
	ret	
.L148:
	.cfi_restore_state
# sub_avx_64_aligned.c:666:             perror("Error reading counter value");
	leaq	.LC16(%rip), %rdi	#, tmp90
	call	perror@PLT	#
# sub_avx_64_aligned.c:667:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5788:
	.size	read_perf, .-read_perf
	.section	.rodata.str1.1
.LC17:
	.string	"%llu,"
	.text
	.p2align 4
	.globl	write_perf
	.type	write_perf, @function
write_perf:
.LFB5789:
	.cfi_startproc
	endbr64	
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	48(%rsi), %r13	#, _20
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	.LC17(%rip), %r12	#, tmp89
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp	# tmp90, file
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rbx	# tmp91, ivtmp.214
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
	.p2align 4,,10
	.p2align 3
.L150:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rbx), %rcx	# MEM[(long long int *)_5],
	movq	%r12, %rdx	# tmp89,
	movl	$1, %esi	#,
	movq	%rbp, %rdi	# file,
	xorl	%eax, %eax	#
# sub_avx_64_aligned.c:674:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$8, %rbx	#, ivtmp.214
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	__fprintf_chk@PLT	#
# sub_avx_64_aligned.c:674:     for (int j = 0; j < MAX_EVENTS; j++)
	cmpq	%r13, %rbx	# _20, ivtmp.214
	jne	.L150	#,
# sub_avx_64_aligned.c:681: }
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 40
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rsi	# file,
	movl	$10, %edi	#,
# sub_avx_64_aligned.c:681: }
	popq	%rbx	#
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	fputc@PLT	#
	.cfi_endproc
.LFE5789:
	.size	write_perf, .-write_perf
	.p2align 4
	.globl	start_perf
	.type	start_perf, @function
start_perf:
.LFB5790:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	fd(%rip), %rbx	#, ivtmp.224
	leaq	24(%rbx), %rbp	#, _17
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L154:
# sub_avx_64_aligned.c:687:         ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
	movl	(%rbx), %edi	# MEM[(int *)_14],
	xorl	%edx, %edx	#
	movl	$9219, %esi	#,
	xorl	%eax, %eax	#
# sub_avx_64_aligned.c:685:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$4, %rbx	#, ivtmp.224
# sub_avx_64_aligned.c:687:         ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
	call	ioctl@PLT	#
# sub_avx_64_aligned.c:688:         ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
	movl	-4(%rbx), %edi	# MEM[(int *)_14],
	xorl	%edx, %edx	#
	movl	$9216, %esi	#,
	xorl	%eax, %eax	#
	call	ioctl@PLT	#
# sub_avx_64_aligned.c:685:     for (int j = 0; j < MAX_EVENTS; j++)
	cmpq	%rbp, %rbx	# _17, ivtmp.224
	jne	.L154	#,
# sub_avx_64_aligned.c:690: }
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 24
	popq	%rbx	#
	.cfi_def_cfa_offset 16
	popq	%rbp	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE5790:
	.size	start_perf, .-start_perf
	.section	.rodata.str1.1
.LC18:
	.string	"Error disabling counter"
	.text
	.p2align 4
	.globl	stop_perf
	.type	stop_perf, @function
stop_perf:
.LFB5791:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	fd(%rip), %rbx	#, ivtmp.234
	leaq	24(%rbx), %rbp	#, _17
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L159:
# sub_avx_64_aligned.c:696:         if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
	movl	(%rbx), %edi	# MEM[(int *)_15],
	xorl	%edx, %edx	#
	xorl	%eax, %eax	#
	movl	$9217, %esi	#,
	call	ioctl@PLT	#
# sub_avx_64_aligned.c:696:         if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
	cmpl	$-1, %eax	#, tmp88
	je	.L162	#,
# sub_avx_64_aligned.c:694:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$4, %rbx	#, ivtmp.234
	cmpq	%rbp, %rbx	# _17, ivtmp.234
	jne	.L159	#,
# sub_avx_64_aligned.c:702: }
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx	#
	.cfi_def_cfa_offset 16
	popq	%rbp	#
	.cfi_def_cfa_offset 8
	ret	
.L162:
	.cfi_restore_state
# sub_avx_64_aligned.c:698:             perror("Error disabling counter");
	leaq	.LC18(%rip), %rdi	#, tmp87
	call	perror@PLT	#
# sub_avx_64_aligned.c:699:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5791:
	.size	stop_perf, .-stop_perf
	.section	.rodata.str1.1
.LC19:
	.string	"Error getting start time"
	.text
	.p2align 4
	.globl	start_timespec
	.type	start_timespec, @function
start_timespec:
.LFB5792:
	.cfi_startproc
	endbr64	
# sub_avx_64_aligned.c:706:     start->tv_sec = 0;
	vpxor	%xmm0, %xmm0, %xmm0	# tmp84
# sub_avx_64_aligned.c:705: {
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 16
# sub_avx_64_aligned.c:705: {
	movq	%rdi, %rsi	# tmp86, start
# sub_avx_64_aligned.c:706:     start->tv_sec = 0;
	vmovdqu	%xmm0, (%rdi)	# tmp84, MEM <vector(2) long int> [(long int *)start_3(D)]
# sub_avx_64_aligned.c:708:     if (clock_gettime(CLOCK_MONOTONIC_RAW, start) == -1)
	movl	$4, %edi	#,
	call	clock_gettime@PLT	#
# sub_avx_64_aligned.c:708:     if (clock_gettime(CLOCK_MONOTONIC_RAW, start) == -1)
	cmpl	$-1, %eax	#, tmp87
	je	.L167	#,
# sub_avx_64_aligned.c:713: }
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L167:
	.cfi_restore_state
# sub_avx_64_aligned.c:710:         perror("Error getting start time");
	leaq	.LC19(%rip), %rdi	#, tmp85
	call	perror@PLT	#
# sub_avx_64_aligned.c:711:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5792:
	.size	start_timespec, .-start_timespec
	.section	.rodata.str1.1
.LC20:
	.string	"Error getting end time"
	.text
	.p2align 4
	.globl	stop_timespec
	.type	stop_timespec, @function
stop_timespec:
.LFB5793:
	.cfi_startproc
	endbr64	
# sub_avx_64_aligned.c:728:     end->tv_sec = 0;
	vpxor	%xmm0, %xmm0, %xmm0	# tmp84
# sub_avx_64_aligned.c:726: {
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 16
# sub_avx_64_aligned.c:726: {
	movq	%rdi, %rsi	# tmp86, end
# sub_avx_64_aligned.c:728:     end->tv_sec = 0;
	vmovdqu	%xmm0, (%rdi)	# tmp84, MEM <vector(2) long int> [(long int *)end_3(D)]
# sub_avx_64_aligned.c:730:     if (clock_gettime(CLOCK_MONOTONIC_RAW, end) == -1)
	movl	$4, %edi	#,
	call	clock_gettime@PLT	#
# sub_avx_64_aligned.c:730:     if (clock_gettime(CLOCK_MONOTONIC_RAW, end) == -1)
	cmpl	$-1, %eax	#, tmp87
	je	.L172	#,
# sub_avx_64_aligned.c:735: }
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L172:
	.cfi_restore_state
# sub_avx_64_aligned.c:732:         perror("Error getting end time");
	leaq	.LC20(%rip), %rdi	#, tmp85
	call	perror@PLT	#
# sub_avx_64_aligned.c:733:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5793:
	.size	stop_timespec, .-stop_timespec
	.p2align 4
	.globl	calculate_time
	.type	calculate_time, @function
calculate_time:
.LFB5794:
	.cfi_startproc
	endbr64	
# sub_avx_64_aligned.c:740:     long long seconds = end.tv_sec - start.tv_sec;
	subq	%rdi, %rdx	# tmp105, seconds
# sub_avx_64_aligned.c:744:     if (nanoseconds < 0)
	subq	%rsi, %rcx	# tmp106, nanoseconds
	jns	.L174	#,
# sub_avx_64_aligned.c:746:         seconds--;
	subq	$1, %rdx	#, seconds
# sub_avx_64_aligned.c:747:         nanoseconds += 1000000000; // 1 second in nanoseconds
	addq	$1000000000, %rcx	#, nanoseconds
.L174:
# sub_avx_64_aligned.c:751:     return (seconds * 1000000000LL) + nanoseconds;
	imulq	$1000000000, %rdx, %rdx	#, seconds, tmp97
# sub_avx_64_aligned.c:751:     return (seconds * 1000000000LL) + nanoseconds;
	vxorps	%xmm0, %xmm0, %xmm0	# tmp109
	addq	%rcx, %rdx	# nanoseconds, tmp98
	vcvtsi2sdq	%rdx, %xmm0, %xmm0	# tmp98, tmp109, tmp110
# sub_avx_64_aligned.c:752: }
	ret	
	.cfi_endproc
.LFE5794:
	.size	calculate_time, .-calculate_time
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"The two subs are not equal, lengths are different"
	.align 8
.LC22:
	.string	"Length of result = %d, length of result_gmp = %ld\n"
	.section	.rodata.str1.1
.LC23:
	.string	"result = %s\n result_gmp = %s\n"
.LC24:
	.string	"The two subs are not equal"
.LC25:
	.string	"Mismatch at index %d\n"
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"result[%d] = %c, result_gmp[%d] = %c\n"
	.section	.rodata.str1.1
.LC27:
	.string	"result = %s\nresult_gmp = %s\n"
	.text
	.p2align 4
	.globl	check_result
	.type	check_result, @function
check_result:
.LFB5795:
	.cfi_startproc
	endbr64	
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edx, %r14d	# tmp145, result_size
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13	# tmp143, result
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12	# tmp144, result_gmp
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 64
# sub_avx_64_aligned.c:757:     if (strlen(result) != strlen(result_gmp))
	call	strlen@PLT	#
# sub_avx_64_aligned.c:757:     if (strlen(result) != strlen(result_gmp))
	movq	%r12, %rdi	# result_gmp,
# sub_avx_64_aligned.c:757:     if (strlen(result) != strlen(result_gmp))
	movq	%rax, %rbx	# tmp146, tmp105
# sub_avx_64_aligned.c:757:     if (strlen(result) != strlen(result_gmp))
	call	strlen@PLT	#
# sub_avx_64_aligned.c:757:     if (strlen(result) != strlen(result_gmp))
	cmpq	%rax, %rbx	# tmp147, tmp105
	jne	.L176	#,
	movslq	%r14d, %rdx	# result_size, _43
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	xorl	%ebx, %ebx	# ivtmp.253
	testl	%r14d, %r14d	# result_size
	jle	.L235	#,
	movq	%rdx, %rax	# _43, tmp127
	andl	$7, %eax	#, tmp127
	je	.L180	#,
	cmpq	$1, %rax	#, tmp127
	je	.L219	#,
	cmpq	$2, %rax	#, tmp127
	je	.L220	#,
	cmpq	$3, %rax	#, tmp127
	je	.L221	#,
	cmpq	$4, %rax	#, tmp127
	je	.L222	#,
	cmpq	$5, %rax	#, tmp127
	je	.L223	#,
	cmpq	$6, %rax	#, tmp127
	je	.L224	#,
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	(%r12), %ecx	# MEM[(char *)result_gmp_21(D) + ivtmp.253_32 * 1], tmp153
	xorl	%r14d, %r14d	# i
	movq	%r13, %r15	# result, _34
	movq	%r12, %rbp	# result_gmp, _38
	cmpb	%cl, 0(%r13)	# tmp153, MEM[(char *)result_20(D) + ivtmp.253_32 * 1]
	jne	.L234	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	movl	$1, %ebx	#, ivtmp.253
.L224:
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	(%r12,%rbx), %esi	# MEM[(char *)result_gmp_21(D) + ivtmp.253_32 * 1], tmp154
	movl	%ebx, %r14d	# ivtmp.253, i
	leaq	0(%r13,%rbx), %r15	#, _34
	leaq	(%r12,%rbx), %rbp	#, _38
	cmpb	%sil, 0(%r13,%rbx)	# tmp154, MEM[(char *)result_20(D) + ivtmp.253_32 * 1]
	jne	.L234	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	addq	$1, %rbx	#, ivtmp.253
.L223:
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	(%r12,%rbx), %edi	# MEM[(char *)result_gmp_21(D) + ivtmp.253_32 * 1], tmp155
	movl	%ebx, %r14d	# ivtmp.253, i
	leaq	0(%r13,%rbx), %r15	#, _34
	leaq	(%r12,%rbx), %rbp	#, _38
	cmpb	%dil, 0(%r13,%rbx)	# tmp155, MEM[(char *)result_20(D) + ivtmp.253_32 * 1]
	jne	.L234	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	addq	$1, %rbx	#, ivtmp.253
.L222:
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	(%r12,%rbx), %r8d	# MEM[(char *)result_gmp_21(D) + ivtmp.253_32 * 1], tmp156
	movl	%ebx, %r14d	# ivtmp.253, i
	leaq	0(%r13,%rbx), %r15	#, _34
	leaq	(%r12,%rbx), %rbp	#, _38
	cmpb	%r8b, 0(%r13,%rbx)	# tmp156, MEM[(char *)result_20(D) + ivtmp.253_32 * 1]
	jne	.L234	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	addq	$1, %rbx	#, ivtmp.253
.L221:
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	(%r12,%rbx), %r9d	# MEM[(char *)result_gmp_21(D) + ivtmp.253_32 * 1], tmp157
	movl	%ebx, %r14d	# ivtmp.253, i
	leaq	0(%r13,%rbx), %r15	#, _34
	leaq	(%r12,%rbx), %rbp	#, _38
	cmpb	%r9b, 0(%r13,%rbx)	# tmp157, MEM[(char *)result_20(D) + ivtmp.253_32 * 1]
	jne	.L234	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	addq	$1, %rbx	#, ivtmp.253
.L220:
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	(%r12,%rbx), %r10d	# MEM[(char *)result_gmp_21(D) + ivtmp.253_32 * 1], tmp158
	movl	%ebx, %r14d	# ivtmp.253, i
	leaq	0(%r13,%rbx), %r15	#, _34
	leaq	(%r12,%rbx), %rbp	#, _38
	cmpb	%r10b, 0(%r13,%rbx)	# tmp158, MEM[(char *)result_20(D) + ivtmp.253_32 * 1]
	jne	.L234	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	addq	$1, %rbx	#, ivtmp.253
.L219:
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	(%r12,%rbx), %r11d	# MEM[(char *)result_gmp_21(D) + ivtmp.253_32 * 1], tmp159
	movl	%ebx, %r14d	# ivtmp.253, i
	leaq	0(%r13,%rbx), %r15	#, _34
	leaq	(%r12,%rbx), %rbp	#, _38
	cmpb	%r11b, 0(%r13,%rbx)	# tmp159, MEM[(char *)result_20(D) + ivtmp.253_32 * 1]
	jne	.L234	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	addq	$1, %rbx	#, ivtmp.253
	cmpq	%rdx, %rbx	# _43, ivtmp.253
	je	.L235	#,
.L180:
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	(%r12,%rbx), %eax	# MEM[(char *)result_gmp_21(D) + ivtmp.253_32 * 1], tmp151
	movl	%ebx, %r14d	# ivtmp.253, i
	leaq	0(%r13,%rbx), %r15	#, _34
	leaq	(%r12,%rbx), %rbp	#, _38
	cmpb	%al, 0(%r13,%rbx)	# tmp151, MEM[(char *)result_20(D) + ivtmp.253_32 * 1]
	jne	.L234	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	leaq	1(%rbx), %rdi	#, tmp128
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	(%r12,%rdi), %ecx	# MEM[(char *)result_gmp_21(D) + ivtmp.253_32 * 1], tmp152
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	movq	%rdi, %rbx	# tmp128, ivtmp.253
	movl	%edi, %r14d	# ivtmp.253, i
	leaq	0(%r13,%rdi), %r15	#, _34
	leaq	(%r12,%rdi), %rbp	#, _38
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	cmpb	%cl, 0(%r13,%rdi)	# tmp152, MEM[(char *)result_20(D) + ivtmp.253_32 * 1]
	jne	.L234	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	addq	$1, %rbx	#, ivtmp.253
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	(%r12,%rbx), %esi	# MEM[(char *)result_gmp_21(D) + ivtmp.253_32 * 1], tmp160
	movl	%ebx, %r14d	# ivtmp.253, i
	leaq	0(%r13,%rbx), %r15	#, _34
	leaq	(%r12,%rbx), %rbp	#, _38
	cmpb	%sil, 0(%r13,%rbx)	# tmp160, MEM[(char *)result_20(D) + ivtmp.253_32 * 1]
	jne	.L234	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	leaq	2(%rdi), %rbx	#, ivtmp.253
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	2(%r12,%rdi), %r8d	# MEM[(char *)result_gmp_21(D) + ivtmp.253_32 * 1], tmp161
	movl	%ebx, %r14d	# ivtmp.253, i
	leaq	0(%r13,%rbx), %r15	#, _34
	leaq	(%r12,%rbx), %rbp	#, _38
	cmpb	%r8b, 2(%r13,%rdi)	# tmp161, MEM[(char *)result_20(D) + ivtmp.253_32 * 1]
	jne	.L234	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	leaq	3(%rdi), %rbx	#, ivtmp.253
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	3(%r12,%rdi), %r9d	# MEM[(char *)result_gmp_21(D) + ivtmp.253_32 * 1], tmp162
	movl	%ebx, %r14d	# ivtmp.253, i
	leaq	0(%r13,%rbx), %r15	#, _34
	leaq	(%r12,%rbx), %rbp	#, _38
	cmpb	%r9b, 3(%r13,%rdi)	# tmp162, MEM[(char *)result_20(D) + ivtmp.253_32 * 1]
	jne	.L234	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	leaq	4(%rdi), %rbx	#, ivtmp.253
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	4(%r12,%rdi), %r10d	# MEM[(char *)result_gmp_21(D) + ivtmp.253_32 * 1], tmp163
	movl	%ebx, %r14d	# ivtmp.253, i
	leaq	0(%r13,%rbx), %r15	#, _34
	leaq	(%r12,%rbx), %rbp	#, _38
	cmpb	%r10b, 4(%r13,%rdi)	# tmp163, MEM[(char *)result_20(D) + ivtmp.253_32 * 1]
	jne	.L234	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	leaq	5(%rdi), %rbx	#, ivtmp.253
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	5(%r12,%rdi), %r11d	# MEM[(char *)result_gmp_21(D) + ivtmp.253_32 * 1], tmp164
	movl	%ebx, %r14d	# ivtmp.253, i
	leaq	0(%r13,%rbx), %r15	#, _34
	leaq	(%r12,%rbx), %rbp	#, _38
	cmpb	%r11b, 5(%r13,%rdi)	# tmp164, MEM[(char *)result_20(D) + ivtmp.253_32 * 1]
	jne	.L234	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	leaq	6(%rdi), %rbx	#, ivtmp.253
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	6(%r12,%rdi), %eax	# MEM[(char *)result_gmp_21(D) + ivtmp.253_32 * 1], tmp165
	movl	%ebx, %r14d	# ivtmp.253, i
	leaq	0(%r13,%rbx), %r15	#, _34
	leaq	(%r12,%rbx), %rbp	#, _38
	cmpb	%al, 6(%r13,%rdi)	# tmp165, MEM[(char *)result_20(D) + ivtmp.253_32 * 1]
	jne	.L234	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	leaq	7(%rdi), %rbx	#, ivtmp.253
	cmpq	%rdx, %rbx	# _43, ivtmp.253
	jne	.L180	#,
.L235:
# sub_avx_64_aligned.c:776: }
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
# sub_avx_64_aligned.c:775:     return true;
	movl	$1, %eax	#, <retval>
# sub_avx_64_aligned.c:776: }
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L234:
	.cfi_restore_state
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC24(%rip), %rdi	#, tmp117
	call	puts@PLT	#
	movl	%r14d, %edx	# i,
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	leaq	.LC25(%rip), %rsi	#, tmp118
	call	__printf_chk@PLT	#
# sub_avx_64_aligned.c:770:             printf("result[%d] = %c, result_gmp[%d] = %c\n", i, result[i], i, result_gmp[i]);
	movsbl	(%r15), %ecx	# *_34, *_34
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movsbl	0(%rbp), %r9d	# *_38,
	xorl	%eax, %eax	#
	movl	%ebx, %r8d	# ivtmp.253,
	movl	%r14d, %edx	# i,
	movl	$1, %edi	#,
	leaq	.LC26(%rip), %rsi	#, tmp121
	call	__printf_chk@PLT	#
	movq	%r12, %rcx	# result_gmp,
	movq	%r13, %rdx	# result,
	movl	$1, %edi	#,
	leaq	.LC27(%rip), %rsi	#, tmp122
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# sub_avx_64_aligned.c:776: }
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
# sub_avx_64_aligned.c:772:             return false;
	xorl	%eax, %eax	# <retval>
# sub_avx_64_aligned.c:776: }
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L176:
	.cfi_restore_state
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC21(%rip), %rdi	#, tmp110
	call	puts@PLT	#
# sub_avx_64_aligned.c:760:         printf("Length of result = %d, length of result_gmp = %ld\n", result_size, strlen(result_gmp));
	movq	%r12, %rdi	# result_gmp,
	call	strlen@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	%r14d, %edx	# result_size,
	movl	$1, %edi	#,
	leaq	.LC22(%rip), %rsi	#, tmp114
# sub_avx_64_aligned.c:760:         printf("Length of result = %d, length of result_gmp = %ld\n", result_size, strlen(result_gmp));
	movq	%rax, %rcx	# tmp148, tmp112
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	movq	%r12, %rcx	# result_gmp,
	movq	%r13, %rdx	# result,
	movl	$1, %edi	#,
	leaq	.LC23(%rip), %rsi	#, tmp115
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# sub_avx_64_aligned.c:776: }
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 56
# sub_avx_64_aligned.c:762:         return false;
	xorl	%eax, %eax	# <retval>
# sub_avx_64_aligned.c:776: }
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE5795:
	.size	check_result, .-check_result
	.section	.rodata.str1.8
	.align 8
.LC28:
	.string	"Memory allocation failed for a or b\n"
	.text
	.p2align 4
	.globl	generate_no_borrow_propagation
	.type	generate_no_borrow_propagation, @function
generate_no_borrow_propagation:
.LFB5796:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	movq	%rdi, %r14	# tmp309, a
	pushq	%r13	#
	pushq	%r12	#
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	movslq	%edx, %r12	# tmp311,
	pushq	%rbx	#
	movq	%r12, %r15	#,
# sub_avx_64_aligned.c:786:     *a = (uint64_t *)_mm_malloc(n * sizeof(uint64_t), 64);
	salq	$3, %r12	#, _2
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	movq	%r12, %rdx	# _2,
# sub_avx_64_aligned.c:784: {
	andq	$-64, %rsp	#,
	addq	$-128, %rsp	#,
	.cfi_offset 3, -56
# sub_avx_64_aligned.c:784: {
	movq	%rsi, 72(%rsp)	# tmp310, %sfp
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	112(%rsp), %rdi	#, tmp237
	movl	$64, %esi	#,
# sub_avx_64_aligned.c:784: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp320
	movq	%rax, 120(%rsp)	# tmp320, D.39701
	xorl	%eax, %eax	# tmp320
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	call	posix_memalign@PLT	#
	leaq	104(%rsp), %rdi	#, tmp238
	movq	%r12, %rdx	# _2,
	movl	$64, %esi	#,
	testl	%eax, %eax	# tmp312
	movl	$0, %eax	#, tmp307
	cmove	112(%rsp), %rax	# D.39666,, _82
# sub_avx_64_aligned.c:786:     *a = (uint64_t *)_mm_malloc(n * sizeof(uint64_t), 64);
	movq	%rax, (%r14)	# _82, *a_44(D)
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	call	posix_memalign@PLT	#
	testl	%eax, %eax	# tmp313
	je	.L299	#,
# sub_avx_64_aligned.c:787:     *b = (uint64_t *)_mm_malloc(n * sizeof(uint64_t), 64);
	movq	72(%rsp), %rdx	# %sfp, b
	movq	$0, (%rdx)	#, *b_47(D)
.L251:
# sub_avx_64_aligned.c:791:         perror("Memory allocation failed for a or b\n");
	leaq	.LC28(%rip), %rdi	#, tmp243
	call	perror@PLT	#
# sub_avx_64_aligned.c:792:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.p2align 4,,10
	.p2align 3
.L299:
	movq	104(%rsp), %rcx	# D.39660, _70
# sub_avx_64_aligned.c:787:     *b = (uint64_t *)_mm_malloc(n * sizeof(uint64_t), 64);
	movq	72(%rsp), %rbx	# %sfp, b
	movq	%rcx, (%rbx)	# _70, *b_47(D)
# sub_avx_64_aligned.c:789:     if (*a == NULL || *b == NULL)
	cmpq	$0, (%r14)	#, *a_44(D)
	je	.L251	#,
	testq	%rcx, %rcx	# _70
	je	.L251	#,
# sub_avx_64_aligned.c:796:     int seed = generate_seed();
	xorl	%eax, %eax	#
	call	generate_seed	#
# sub_avx_64_aligned.c:797:     srand(seed);
	movl	%eax, %edi	# tmp314, _6
	call	srand@PLT	#
# sub_avx_64_aligned.c:803:     for (int i = n - 1; i >= 0;)
	subl	$1, %r15d	#, _9
	js	.L237	#,
	.p2align 4,,10
	.p2align 3
.L242:
# sub_avx_64_aligned.c:806:         int group_size = (i >= 8) ? 9 : (i + 1);
	movl	$8, %ebx	#, tmp319
	movl	%r15d, 88(%rsp)	# _9, %sfp
	cmpl	%ebx, %r15d	# tmp319, _9
	cmovle	%r15d, %ebx	# _9,, tmp319
# sub_avx_64_aligned.c:806:         int group_size = (i >= 8) ? 9 : (i + 1);
	leal	1(%rbx), %esi	#, _91
# sub_avx_64_aligned.c:806:         int group_size = (i >= 8) ? 9 : (i + 1);
	movl	%ebx, 92(%rsp)	# _8, %sfp
	addl	$2, %ebx	#, tmp257
# sub_avx_64_aligned.c:807:         int start_index = i - group_size + 1;
	subl	%esi, %r15d	# _91, _9
# sub_avx_64_aligned.c:806:         int group_size = (i >= 8) ? 9 : (i + 1);
	movl	%esi, 80(%rsp)	# _91, %sfp
	movslq	%ebx, %rbx	# tmp257, tmp258
# sub_avx_64_aligned.c:807:         int start_index = i - group_size + 1;
	leal	1(%r15), %r12d	#, start_index
	movl	%r12d, 84(%rsp)	# start_index, %sfp
# sub_avx_64_aligned.c:811:         uint64_t start_value = rand() % 10;
	call	rand@PLT	#
	movslq	%r15d, %rdx	# _9, _9
# sub_avx_64_aligned.c:811:         uint64_t start_value = rand() % 10;
	movslq	%eax, %r8	# _10, _10
	movl	%eax, %r10d	# _10, tmp250
# sub_avx_64_aligned.c:811:         uint64_t start_value = rand() % 10;
	movl	%eax, %edi	# tmp315, _10
	movslq	%r12d, %rax	# start_index, start_index
# sub_avx_64_aligned.c:811:         uint64_t start_value = rand() % 10;
	imulq	$1717986919, %r8, %r9	#, _10, tmp247
	sarl	$31, %r10d	#, tmp250
	movq	%rax, 64(%rsp)	# start_index, %sfp
	addq	%rdx, %rbx	# _9, tmp260
	leaq	0(,%rax,8), %r12	#, ivtmp.286
	salq	$3, %rbx	#, _75
	movq	%r12, 56(%rsp)	# ivtmp.286, %sfp
	sarq	$34, %r9	#, tmp249
	subl	%r10d, %r9d	# tmp250, tmp245
	leal	(%r9,%r9,4), %r11d	#, tmp253
	addl	%r11d, %r11d	# tmp254
	subl	%r11d, %edi	# tmp254, tmp255
# sub_avx_64_aligned.c:811:         uint64_t start_value = rand() % 10;
	movslq	%edi, %r13	# tmp255, start_value
	.p2align 4,,10
	.p2align 3
.L244:
# sub_avx_64_aligned.c:814:             (*a)[start_index + j] = start_value;
	movq	(%r14), %rcx	# *a_44(D), *a_44(D)
	movq	%r13, (%rcx,%r12)	# start_value, *_16
# sub_avx_64_aligned.c:816:             if (rand() % 2 == 0 && start_value > 0)
	call	rand@PLT	#
# sub_avx_64_aligned.c:816:             if (rand() % 2 == 0 && start_value > 0)
	testb	$1, %al	#, tmp316
	jne	.L243	#,
# sub_avx_64_aligned.c:818:                 start_value--;
	cmpq	$1, %r13	#, start_value
	adcq	$-1, %r13	#, start_value
.L243:
# sub_avx_64_aligned.c:812:         for (int j = 0; j < group_size; j++)
	addq	$8, %r12	#, ivtmp.286
	cmpq	%r12, %rbx	# ivtmp.286, _75
	jne	.L244	#,
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	72(%rsp), %rsi	# %sfp, b
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movl	80(%rsp), %r12d	# %sfp, _91
	movslq	92(%rsp), %rdi	# %sfp,
	movslq	88(%rsp), %rbx	# %sfp, _114
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	(%rsi), %rdx	# *b_47(D), _27
	movl	%r12d, %esi	# _91, _89
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	(%r14), %r13	# *a_44(D), _20
	movq	%rsi, %r8	# _89, tmp267
	leaq	8(,%rbx,8), %rcx	#, _110
	subq	%rdi, %rbx	# _8, _106
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movl	84(%rsp), %eax	# %sfp, start_index
	negq	%r8	# tmp267
	addq	%rbx, %rsi	# _106, tmp271
	leaq	(%rdx,%rbx,8), %r9	#, _99
	movq	%rdi, %r11	#,
	leaq	(%rcx,%r8,8), %r8	#, tmp269
	leaq	(%rdx,%rsi,8), %rdi	#, tmp273
	addl	%r12d, %eax	# _91, start_index
	addq	%r13, %r8	# _20, tmp270
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	leal	-1(%rax), %r10d	#, _112
	cmpq	%rdi, %r8	# tmp273, tmp270
	leaq	0(%r13,%rcx), %r8	#, tmp276
	setnb	%sil	#, tmp275
	cmpq	%r8, %r9	# tmp276, _99
	setnb	%dil	#, tmp278
	orb	%sil, %dil	# tmp275, tmp321
	je	.L245	#,
	cmpl	$2, %r11d	#, _8
	jbe	.L245	#,
	cmpl	$6, %r11d	#, _8
	jbe	.L246	#,
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	vmovdqa64	.LC29(%rip), %zmm1	#, tmp350
	vpermq	-64(%r13,%rcx), %zmm1, %zmm2	# MEM <vector(8) long unsigned int> [(uint64_t *)vectp.267_154], tmp350, vect__32.269
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	vmovdqu64	%zmm2, (%r9)	# vect__32.269, MEM <vector(8) long unsigned int> [(uint64_t *)_99]
	cmpl	$8, %r12d	#, _91
	je	.L296	#,
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	subl	$9, %eax	#, tmp285
	movslq	%eax, %rbx	# tmp285, tmp286
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	leal	9(%r15), %eax	#, tmp287
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	0(%r13,%rbx,8), %rcx	# *_211, _217
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	cltq
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%rcx, (%rdx,%rax,8)	# _217,* _27
	vzeroupper
.L249:
# sub_avx_64_aligned.c:803:     for (int i = n - 1; i >= 0;)
	testl	%r15d, %r15d	# _9
	jns	.L242	#,
.L237:
# sub_avx_64_aligned.c:830: }
	movq	120(%rsp), %rax	# D.39701, tmp322
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp322
	jne	.L300	#,
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
.L246:
	.cfi_restore_state
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	vpermq	$27, -32(%r13,%rcx), %ymm0	#, MEM <vector(4) long unsigned int> [(uint64_t *)vectp.277_199], vect__141.279
	cmpl	$3, 92(%rsp)	#, %sfp
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	vmovdqu	%ymm0, (%rdx,%rbx,8)	# vect__141.279, MEM <vector(4) long unsigned int> [(uint64_t *)vectp.281_210]
	je	.L296	#,
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	leal	-5(%rax), %r12d	#, tmp289
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	leal	5(%r15), %ecx	#, tmp291
# sub_avx_64_aligned.c:823:         for (int j = 0; j < group_size; j++)
	movl	88(%rsp), %r9d	# %sfp, i
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movslq	%r12d, %r10	# tmp289, tmp290
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movslq	%ecx, %r11	# tmp291, tmp292
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	0(%r13,%r10,8), %rbx	# *_299, _304
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%rbx, (%rdx,%r11,8)	# _304, *_303
# sub_avx_64_aligned.c:823:         for (int j = 0; j < group_size; j++)
	cmpl	$4, %r9d	#, i
	jle	.L296	#,
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	leal	-6(%rax), %esi	#, tmp293
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	leal	6(%r15), %r12d	#, tmp295
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movslq	%esi, %r8	# tmp293, tmp294
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movslq	%r12d, %r10	# tmp295, tmp296
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	0(%r13,%r8,8), %rdi	# *_312, _317
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%rdi, (%rdx,%r10,8)	# _317, *_316
# sub_avx_64_aligned.c:823:         for (int j = 0; j < group_size; j++)
	cmpl	$5, %r9d	#, i
	jle	.L296	#,
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	subl	$7, %eax	#, tmp297
	cltq
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	0(%r13,%rax,8), %r13	# *_181, _186
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	leal	7(%r15), %eax	#, tmp299
	cltq
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%r13, (%rdx,%rax,8)	# _186,* _27
	vzeroupper
	jmp	.L249	#
	.p2align 4,,10
	.p2align 3
.L296:
	vzeroupper
	jmp	.L249	#
	.p2align 4,,10
	.p2align 3
.L245:
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movslq	%r10d, %r11	# _112, _112
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	64(%rsp), %r8	# %sfp, start_index
# sub_avx_64_aligned.c:823:         for (int j = 0; j < group_size; j++)
	movl	88(%rsp), %edi	# %sfp, i
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	0(%r13,%r11,8), %rsi	# *_28, _57
	leaq	0(,%r11,8), %r9	#, _26
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%rsi, (%rdx,%r8,8)	# _57, *_32
# sub_avx_64_aligned.c:823:         for (int j = 0; j < group_size; j++)
	testl	%edi, %edi	# i
	je	.L249	#,
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	-8(%r13,%r9), %r12	# *_139, _189
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	56(%rsp), %r10	# %sfp, ivtmp.286
	movq	%r12, 8(%rdx,%r10)	# _189, *_144
# sub_avx_64_aligned.c:823:         for (int j = 0; j < group_size; j++)
	cmpl	$1, %edi	#, i
	je	.L249	#,
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	-16(%r13,%r9), %rbx	# *_56, _226
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%rbx, 16(%rdx,%r10)	# _226, *_225
# sub_avx_64_aligned.c:823:         for (int j = 0; j < group_size; j++)
	cmpl	$2, %edi	#, i
	je	.L249	#,
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	-24(%r13,%r9), %rcx	# *_234, _239
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%rcx, 24(%rdx,%r10)	# _239, *_238
# sub_avx_64_aligned.c:823:         for (int j = 0; j < group_size; j++)
	cmpl	$3, %edi	#, i
	je	.L249	#,
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	-32(%r13,%r9), %rax	# *_247, _252
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%rax, 32(%rdx,%r10)	# _252, *_251
# sub_avx_64_aligned.c:823:         for (int j = 0; j < group_size; j++)
	cmpl	$4, %edi	#, i
	je	.L249	#,
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	-40(%r13,%r9), %r11	# *_260, _265
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%r11, 40(%rdx,%r10)	# _265, *_264
# sub_avx_64_aligned.c:823:         for (int j = 0; j < group_size; j++)
	cmpl	$5, %edi	#, i
	je	.L249	#,
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	-48(%r13,%r9), %rsi	# *_273, _278
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%rsi, 48(%rdx,%r10)	# _278, *_277
# sub_avx_64_aligned.c:823:         for (int j = 0; j < group_size; j++)
	cmpl	$6, %edi	#, i
	je	.L249	#,
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	-56(%r13,%r9), %r8	# *_286, _291
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%r8, 56(%rdx,%r10)	# _291, *_290
# sub_avx_64_aligned.c:823:         for (int j = 0; j < group_size; j++)
	cmpl	$7, %edi	#, i
	jle	.L249	#,
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	-64(%r13,%r9), %r13	# *_21, _124
# sub_avx_64_aligned.c:825:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%r13, 64(%rdx,%r10)	# _124, *_123
	jmp	.L249	#
.L300:
# sub_avx_64_aligned.c:830: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE5796:
	.size	generate_no_borrow_propagation, .-generate_no_borrow_propagation
	.section	.rodata.str1.1
.LC30:
	.string	"Time, RDTSC\n"
	.text
	.p2align 4
	.globl	open_time_file
	.type	open_time_file, @function
open_time_file:
.LFB5797:
	.cfi_startproc
	endbr64	
	pushq	%rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# sub_avx_64_aligned.c:833: {
	movq	%rsi, %rbx	# tmp90, file
# sub_avx_64_aligned.c:834:     *file = fopen(filename, "w");
	leaq	.LC14(%rip), %rsi	#, tmp85
	call	fopen@PLT	#
# sub_avx_64_aligned.c:834:     *file = fopen(filename, "w");
	movq	%rax, (%rbx)	# tmp86, *file_5(D)
# sub_avx_64_aligned.c:836:     if (*file == NULL)
	testq	%rax, %rax	# tmp86
	je	.L304	#,
	movq	%rax, %rcx	# tmp91, tmp86
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$12, %edx	#,
	movl	$1, %esi	#,
# sub_avx_64_aligned.c:845: }
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC30(%rip), %rdi	#, tmp88
	jmp	fwrite@PLT	#
.L304:
	.cfi_restore_state
# sub_avx_64_aligned.c:838:         perror("Error opening file for writing \n");
	leaq	.LC0(%rip), %rdi	#, tmp87
	call	perror@PLT	#
# sub_avx_64_aligned.c:839:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5797:
	.size	open_time_file, .-open_time_file
	.section	.rodata.str1.1
.LC31:
	.string	"%lf, %llu\n"
	.text
	.p2align 4
	.globl	write_time
	.type	write_time, @function
write_time:
.LFB5798:
	.cfi_startproc
	endbr64	
# sub_avx_64_aligned.c:848: {
	movq	%rsi, %rcx	# tmp88, rdtsc
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC31(%rip), %rdx	#, tmp85
	movl	$1, %esi	#,
	movl	$1, %eax	#,
	jmp	__fprintf_chk@PLT	#
	.cfi_endproc
.LFE5798:
	.size	write_time, .-write_time
	.p2align 4
	.globl	convert_digits_to_string
	.type	convert_digits_to_string, @function
convert_digits_to_string:
.LFB5799:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r12	#
	.cfi_offset 12, -24
	movq	%rdi, %r12	# tmp417, digits
	pushq	%rbx	#
	.cfi_offset 3, -32
	movslq	%esi, %rbx	# tmp418,
# sub_avx_64_aligned.c:855:     char *str = (char *)calloc(n + 1, sizeof(char));
	movl	$1, %esi	#,
# sub_avx_64_aligned.c:855:     char *str = (char *)calloc(n + 1, sizeof(char));
	leal	1(%rbx), %edi	#, tmp279
# sub_avx_64_aligned.c:855:     char *str = (char *)calloc(n + 1, sizeof(char));
	movslq	%edi, %rdi	# tmp279, tmp280
# sub_avx_64_aligned.c:854: {
	andq	$-32, %rsp	#,
# sub_avx_64_aligned.c:855:     char *str = (char *)calloc(n + 1, sizeof(char));
	call	calloc@PLT	#
# sub_avx_64_aligned.c:856:     if (str == NULL)
	testq	%rax, %rax	# <retval>
	je	.L307	#,
	movq	%rax, %r8	# tmp419, <retval>
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	testl	%ebx, %ebx	# n
	jle	.L309	#,
	leal	-1(%rbx), %eax	#, tmp282
	cmpl	$30, %eax	#, tmp282
	jbe	.L315	#,
	movl	%ebx, %ecx	# n, bnd.298
	movq	%r12, %rsi	# digits, ivtmp.342
	movq	%r8, %rdx	# <retval>, ivtmp.345
	vpbroadcastd	.LC38(%rip), %ymm2	#, tmp414
	vpbroadcastw	.LC39(%rip), %ymm3	#, tmp415
	shrl	$5, %ecx	#, bnd.298
	vpbroadcastb	.LC40(%rip), %ymm4	#, tmp416
	subl	$1, %ecx	#, tmp285
	salq	$8, %rcx	#, tmp286
	leaq	256(%r12,%rcx), %r9	#, _262
	.p2align 4,,10
	.p2align 3
.L311:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	vmovdqu	(%rsi), %ymm7	# MEM <vector(4) long unsigned int> [(uint64_t *)_138], tmp422
	vperm2i128	$32, 32(%rsi), %ymm7, %ymm1	#, MEM <vector(4) long unsigned int> [(uint64_t *)_138 + 32B], tmp422, tmp293
	addq	$256, %rsi	#, ivtmp.342
	addq	$32, %rdx	#, ivtmp.345
	vperm2i128	$49, -224(%rsi), %ymm7, %ymm0	#, MEM <vector(4) long unsigned int> [(uint64_t *)_138 + 32B], tmp423, tmp294
	vmovdqu	-192(%rsi), %ymm7	# MEM <vector(4) long unsigned int> [(uint64_t *)_138 + 64B], tmp424
	vperm2i128	$32, -160(%rsi), %ymm7, %ymm9	#, MEM <vector(4) long unsigned int> [(uint64_t *)_138 + 96B], tmp424, tmp301
	vperm2i128	$49, -160(%rsi), %ymm7, %ymm11	#, MEM <vector(4) long unsigned int> [(uint64_t *)_138 + 96B], tmp425, tmp302
	vpshufd	$216, %ymm1, %ymm5	#, tmp293, tmp291
	vpshufd	$216, %ymm0, %ymm6	#, tmp294, tmp292
	vmovdqu	-128(%rsi), %ymm7	# MEM <vector(4) long unsigned int> [(uint64_t *)_138 + 128B], tmp426
	vpshufd	$216, %ymm9, %ymm12	#, tmp301, tmp299
	vpshufd	$216, %ymm11, %ymm13	#, tmp302, tmp300
	vpunpcklqdq	%ymm6, %ymm5, %ymm8	# tmp292, tmp291, tmp295
	vpunpcklqdq	%ymm13, %ymm12, %ymm14	# tmp300, tmp299, tmp303
	vpand	%ymm8, %ymm2, %ymm15	# tmp295, tmp414, tmp305
	vperm2i128	$32, -96(%rsi), %ymm7, %ymm6	#, MEM <vector(4) long unsigned int> [(uint64_t *)_138 + 160B], tmp426, tmp315
	vpand	%ymm14, %ymm2, %ymm1	# tmp303, tmp414, tmp306
	vperm2i128	$49, -96(%rsi), %ymm7, %ymm9	#, MEM <vector(4) long unsigned int> [(uint64_t *)_138 + 160B], tmp427, tmp316
	vmovdqu	-64(%rsi), %ymm7	# MEM <vector(4) long unsigned int> [(uint64_t *)_138 + 192B], tmp428
	vpackusdw	%ymm1, %ymm15, %ymm0	# tmp306, tmp305, tmp308
	vperm2i128	$32, -32(%rsi), %ymm7, %ymm13	#, MEM <vector(4) long unsigned int> [(uint64_t *)_138 + 224B], tmp428, tmp323
	vperm2i128	$49, -32(%rsi), %ymm7, %ymm15	#, MEM <vector(4) long unsigned int> [(uint64_t *)_138 + 224B], tmp429, tmp324
	vpshufd	$216, %ymm6, %ymm10	#, tmp315, tmp313
	vpshufd	$216, %ymm9, %ymm11	#, tmp316, tmp314
	vpermq	$216, %ymm0, %ymm8	#, tmp308, tmp309
	vpshufd	$216, %ymm13, %ymm1	#, tmp323, tmp321
	vpshufd	$216, %ymm15, %ymm0	#, tmp324, tmp322
	vpunpcklqdq	%ymm11, %ymm10, %ymm12	# tmp314, tmp313, tmp317
	vpunpcklqdq	%ymm0, %ymm1, %ymm6	# tmp322, tmp321, tmp325
	vpand	%ymm12, %ymm2, %ymm9	# tmp317, tmp414, tmp327
	vpand	%ymm8, %ymm3, %ymm8	# tmp309, tmp415, tmp333
	vpand	%ymm6, %ymm2, %ymm5	# tmp325, tmp414, tmp328
	vpackusdw	%ymm5, %ymm9, %ymm10	# tmp328, tmp327, tmp330
	vpermq	$216, %ymm10, %ymm11	#, tmp330, tmp331
	vpand	%ymm11, %ymm3, %ymm12	# tmp331, tmp415, tmp334
	vpackuswb	%ymm12, %ymm8, %ymm7	# tmp334, tmp333, tmp336
	vpermq	$216, %ymm7, %ymm13	#, tmp336, tmp337
	vpaddb	%ymm13, %ymm4, %ymm14	# tmp337, tmp416, vect__8.314
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	vmovdqu	%ymm14, -32(%rdx)	# vect__8.314, MEM <vector(32) char> [(char *)_190]
	cmpq	%r9, %rsi	# _262, ivtmp.342
	jne	.L311	#,
	movl	%ebx, %r10d	# n, niters_vector_mult_vf.299
	andl	$-32, %r10d	#, niters_vector_mult_vf.299
	movl	%r10d, %r11d	# niters_vector_mult_vf.299, tmp.321
	cmpl	%r10d, %ebx	# niters_vector_mult_vf.299, n
	je	.L319	#,
	vzeroupper
.L310:
	movl	%ebx, %edi	# n, niters.318
	subl	%r10d, %edi	# niters_vector_mult_vf.299, niters.318
	leal	-1(%rdi), %eax	#, tmp340
	cmpl	$14, %eax	#, tmp340
	jbe	.L313	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	vbroadcastss	.LC38(%rip), %xmm6	#, tmp351
	movl	%r10d, %esi	# niters_vector_mult_vf.299, _112
	movl	%edi, %ecx	# niters.318, niters_vector_mult_vf.320
	vpbroadcastw	.LC39(%rip), %xmm14	#, tmp365
	leaq	(%r12,%rsi,8), %rdx	#, vectp_digits.323
	andl	$-16, %ecx	#, niters_vector_mult_vf.320
	vmovdqu	(%rdx), %xmm2	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_digits.323_111], tmp432
	vmovdqu	32(%rdx), %xmm4	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_digits.323_111 + 32B], tmp433
	vshufps	$136, 16(%rdx), %xmm2, %xmm3	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_digits.323_111 + 16B], tmp432, vect__28.334
	vshufps	$136, 48(%rdx), %xmm4, %xmm15	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_digits.323_111 + 48B], tmp433, vect__28.334
	vpand	%xmm3, %xmm6, %xmm0	# vect__28.334, tmp351, tmp349
	vpand	%xmm15, %xmm6, %xmm1	# vect__28.334, tmp351, tmp350
	vmovdqu	64(%rdx), %xmm5	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_digits.323_111 + 64B], tmp434
	addl	%ecx, %r11d	# niters_vector_mult_vf.320, tmp.321
	vmovdqu	96(%rdx), %xmm11	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_digits.323_111 + 96B], tmp435
	vpackusdw	%xmm1, %xmm0, %xmm9	# tmp350, tmp349, vect__28.333
	vshufps	$136, 80(%rdx), %xmm5, %xmm10	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_digits.323_111 + 80B], tmp434, vect__28.334
	vshufps	$136, 112(%rdx), %xmm11, %xmm8	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_digits.323_111 + 112B], tmp435, vect__28.334
	vpand	%xmm10, %xmm6, %xmm12	# vect__28.334, tmp351, tmp359
	vpand	%xmm8, %xmm6, %xmm7	# vect__28.334, tmp351, tmp360
	vpand	%xmm9, %xmm14, %xmm3	# vect__28.333, tmp365, tmp363
	vpbroadcastb	.LC40(%rip), %xmm15	#, tmp367
	vpackusdw	%xmm7, %xmm12, %xmm13	# tmp360, tmp359, vect__28.333
	vpand	%xmm13, %xmm14, %xmm2	# vect__28.333, tmp365, tmp364
	vpackuswb	%xmm2, %xmm3, %xmm4	# tmp364, tmp363, vect__28.332
	vpaddb	%xmm15, %xmm4, %xmm6	# tmp367, vect__28.332, vect__24.335
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	vmovdqu	%xmm6, (%r8,%rsi)	# vect__24.335, MEM <vector(16) char> [(char *)vectp_str.338_141]
	cmpl	%ecx, %edi	# niters_vector_mult_vf.320, niters.318
	je	.L309	#,
.L313:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%r11d, %r9	# tmp.321, _4
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	1(%r11), %esi	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	(%r12,%r9,8), %edi	# *_6, tmp437
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	leaq	0(,%r9,8), %r10	#, _5
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	leal	48(%rdi), %eax	#, tmp369
	movb	%al, (%r8,%r9)	# tmp369, *_11
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%esi, %ebx	# i, n
	jle	.L309	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	8(%r12,%r10), %ecx	# *_24, tmp438
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%esi, %rdx	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	2(%r11), %edi	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	leal	48(%rcx), %r9d	#, tmp372
	movb	%r9b, (%r8,%rdx)	# tmp372, *_42
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edi, %ebx	# i, n
	jle	.L309	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	16(%r12,%r10), %esi	# *_9, tmp439
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%edi, %rax	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	3(%r11), %ecx	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	leal	48(%rsi), %edx	#, tmp375
	movb	%dl, (%r8,%rax)	# tmp375, *_150
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%ecx, %ebx	# i, n
	jle	.L309	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	24(%r12,%r10), %edi	# *_158, tmp440
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%ecx, %r9	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	4(%r11), %esi	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	leal	48(%rdi), %eax	#, tmp378
	movb	%al, (%r8,%r9)	# tmp378, *_162
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%esi, %ebx	# i, n
	jle	.L309	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	32(%r12,%r10), %ecx	# *_170, tmp441
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%esi, %rdx	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	5(%r11), %edi	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	leal	48(%rcx), %r9d	#, tmp381
	movb	%r9b, (%r8,%rdx)	# tmp381, *_174
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edi, %ebx	# i, n
	jle	.L309	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	40(%r12,%r10), %esi	# *_182, tmp442
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%edi, %rax	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	6(%r11), %ecx	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	leal	48(%rsi), %edx	#, tmp384
	movb	%dl, (%r8,%rax)	# tmp384, *_186
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%ecx, %ebx	# i, n
	jle	.L309	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	48(%r12,%r10), %edi	# *_194, tmp443
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%ecx, %r9	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	7(%r11), %esi	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	leal	48(%rdi), %eax	#, tmp387
	movb	%al, (%r8,%r9)	# tmp387, *_198
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%esi, %ebx	# i, n
	jle	.L309	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	56(%r12,%r10), %ecx	# *_206, tmp444
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%esi, %rdx	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	8(%r11), %edi	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	leal	48(%rcx), %r9d	#, tmp390
	movb	%r9b, (%r8,%rdx)	# tmp390, *_210
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edi, %ebx	# i, n
	jle	.L309	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	64(%r12,%r10), %esi	# *_218, tmp445
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%edi, %rax	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	9(%r11), %ecx	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	leal	48(%rsi), %edx	#, tmp393
	movb	%dl, (%r8,%rax)	# tmp393, *_222
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%ecx, %ebx	# i, n
	jle	.L309	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	72(%r12,%r10), %edi	# *_230, tmp446
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%ecx, %r9	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	10(%r11), %esi	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	leal	48(%rdi), %eax	#, tmp396
	movb	%al, (%r8,%r9)	# tmp396, *_234
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%esi, %ebx	# i, n
	jle	.L309	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	80(%r12,%r10), %ecx	# *_242, tmp447
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%esi, %rdx	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	11(%r11), %edi	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	leal	48(%rcx), %r9d	#, tmp399
	movb	%r9b, (%r8,%rdx)	# tmp399, *_246
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edi, %ebx	# i, n
	jle	.L309	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	88(%r12,%r10), %esi	# *_254, tmp448
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%edi, %rax	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	12(%r11), %ecx	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	leal	48(%rsi), %edx	#, tmp402
	movb	%dl, (%r8,%rax)	# tmp402, *_258
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%ecx, %ebx	# i, n
	jle	.L309	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	96(%r12,%r10), %edi	# *_266, tmp449
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%ecx, %r9	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	13(%r11), %esi	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	leal	48(%rdi), %eax	#, tmp405
	movb	%al, (%r8,%r9)	# tmp405, *_270
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%esi, %ebx	# i, n
	jle	.L309	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	104(%r12,%r10), %ecx	# *_278, tmp450
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%esi, %rdx	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	addl	$14, %r11d	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	leal	48(%rcx), %r9d	#, tmp408
	movb	%r9b, (%r8,%rdx)	# tmp408, *_282
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%r11d, %ebx	# i, n
	jle	.L309	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movq	112(%r12,%r10), %r12	# *_92, *_92
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%r11d, %r11	# i, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %r12d	#, tmp411
	movb	%r12b, (%r8,%r11)	# tmp411, *_96
.L309:
# sub_avx_64_aligned.c:865:     str[n] = '\0';
	movb	$0, (%r8,%rbx)	#, *_13
# sub_avx_64_aligned.c:867: }
	leaq	-16(%rbp), %rsp	#,
	movq	%r8, %rax	# <retval>,
	popq	%rbx	#
	popq	%r12	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
.L315:
	.cfi_restore_state
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	xorl	%r10d, %r10d	# niters_vector_mult_vf.299
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	xorl	%r11d, %r11d	# tmp.321
	jmp	.L310	#
.L319:
	vzeroupper
	jmp	.L309	#
.L307:
	call	convert_digits_to_string.part.0	#
	.cfi_endproc
.LFE5799:
	.size	convert_digits_to_string, .-convert_digits_to_string
	.section	.rodata.str1.8
	.align 8
.LC41:
	.string	"experiments/sub_limb_avx_%d_%d.csv"
	.section	.rodata.str1.1
.LC42:
	.string	"experiments/GMP_%d_%d.csv"
.LC43:
	.string	"experiments/my_time_%d_%d.csv"
	.section	.rodata.str1.8
	.align 8
.LC44:
	.string	"experiments/gmp_time_%d_%d.csv"
	.section	.rodata.str1.1
.LC45:
	.string	"Number of bits = %d\n"
.LC46:
	.string	"Number of digits = %d\n"
.LC47:
	.string	"Running tests"
.LC48:
	.string	"Test 1: No Borrow-Propagation"
	.section	.rodata.str1.8
	.align 8
.LC49:
	.string	"Running test 1, with %d iterations\n"
	.section	.rodata.str1.1
.LC50:
	.string	"Error in rdtsc\n"
.LC51:
	.string	"Test 1 iteration %d passed\n"
	.section	.rodata.str1.8
	.align 8
.LC52:
	.string	"Test 1 failed, at iteration %d\n"
	.section	.rodata.str1.1
.LC53:
	.string	"Test 1 completed"
	.section	.rodata.str1.8
	.align 8
.LC54:
	.string	"rdtsc for test 1 = %llu, rdtsc for test 1 gmp = %llu\n"
	.section	.rodata.str1.1
.LC55:
	.string	"RDTSC Speedup: %f\n"
	.text
	.p2align 4
	.globl	run_tests
	.type	run_tests, @function
run_tests:
.LFB5800:
	.cfi_startproc
	endbr64	
	leaq	8(%rsp), %r10	#,
	.cfi_def_cfa 10, 0
	andq	$-64, %rsp	#,
	pushq	-8(%r10)	#
	pushq	%rbp	#
	movq	%rsp, %rbp	#,
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15	#
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
# sub_avx_64_aligned.c:643:     FILE *file = fopen(filename, "w");
	leaq	.LC14(%rip), %r15	#, tmp1157
# sub_avx_64_aligned.c:880: {
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%r10	#
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx	#
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-1088(%rbp), %rbx	#, _1132
# sub_avx_64_aligned.c:880: {
	subq	$1472, %rsp	#,
# sub_avx_64_aligned.c:880: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp1529
	movq	%rax, -56(%rbp)	# tmp1529, D.40064
	xorl	%eax, %eax	# tmp1529
# sub_avx_64_aligned.c:881:     initialize_perf();
	call	initialize_perf	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	movl	CORE_NO(%rip), %eax	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC41(%rip), %r8	#,
	movl	$256, %ecx	#,
	movl	$1, %edx	#,
	movq	%rbx, %rdi	# _1132,
	pushq	%rax	# CORE_NO
	movl	$256, %esi	#,
	xorl	%eax, %eax	#
	movq	%rbx, -1424(%rbp)	# _1132, %sfp
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %ecx	# CORE_NO, CORE_NO
	xorl	%eax, %eax	#
	leaq	-832(%rbp), %rdx	#, tmp1170
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	movq	%rdx, %rdi	# tmp1170, tmp1170
	movq	%rdx, -1376(%rbp)	# tmp1170, %sfp
	leaq	.LC42(%rip), %r8	#,
	movl	%ecx, (%rsp)	# CORE_NO,
	movl	$1, %edx	#,
	movl	$256, %ecx	#,
	movl	$256, %esi	#,
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %r8d	# CORE_NO, CORE_NO
	movl	$256, %ecx	#,
	xorl	%eax, %eax	#
	leaq	-576(%rbp), %rsi	#, tmp1164
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	movl	$1, %edx	#,
	movl	%r8d, (%rsp)	# CORE_NO,
	movq	%rsi, %rdi	# tmp1164, tmp1164
	leaq	.LC43(%rip), %r8	#,
	movq	%rsi, -1360(%rbp)	# tmp1164, %sfp
	movl	$256, %esi	#,
	call	__snprintf_chk@PLT	#
	leaq	-320(%rbp), %r9	#, tmp1161
	movl	$256, %ecx	#,
	xorl	%eax, %eax	#
	movl	CORE_NO(%rip), %r11d	# CORE_NO, CORE_NO
	movq	%r9, %rdi	# tmp1161, tmp1161
	movq	%r9, -1352(%rbp)	# tmp1161, %sfp
	movl	$1, %edx	#,
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC44(%rip), %r8	#,
	movl	$256, %esi	#,
	movl	%r11d, (%rsp)	# CORE_NO,
	call	__snprintf_chk@PLT	#
# sub_avx_64_aligned.c:643:     FILE *file = fopen(filename, "w");
	movq	%r15, %rsi	# tmp1157,
	movq	%rbx, %rdi	# _1132,
	call	fopen@PLT	#
# sub_avx_64_aligned.c:645:     if (file == NULL)
	popq	%rdx	#
	popq	%rcx	#
# sub_avx_64_aligned.c:643:     FILE *file = fopen(filename, "w");
	movq	%rax, -1368(%rbp)	# tmp1493, %sfp
# sub_avx_64_aligned.c:645:     if (file == NULL)
	testq	%rax, %rax	#
	je	.L323	#,
	leaq	event_names(%rip), %r12	#, ivtmp.584
	movq	-1368(%rbp), %rbx	# %sfp, file
	leaq	.LC15(%rip), %r14	#, tmp1158
	movq	%r12, -1384(%rbp)	# ivtmp.584, %sfp
	leaq	48(%r12), %r13	#, _1035
	.p2align 4,,10
	.p2align 3
.L322:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%r12), %rcx	# MEM[(const char * *)_1037],
	movq	%r14, %rdx	# tmp1158,
	movl	$1, %esi	#,
	movq	%rbx, %rdi	# file,
	xorl	%eax, %eax	#
# sub_avx_64_aligned.c:652:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$8, %r12	#, ivtmp.591
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	__fprintf_chk@PLT	#
# sub_avx_64_aligned.c:652:     for (int j = 0; j < MAX_EVENTS; j++)
	cmpq	%r12, %r13	# ivtmp.591, _1035
	jne	.L322	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	-1368(%rbp), %rsi	# %sfp,
	movl	$10, %edi	#,
	movq	-1384(%rbp), %r12	# %sfp, ivtmp.584
	call	fputc@PLT	#
# sub_avx_64_aligned.c:643:     FILE *file = fopen(filename, "w");
	movq	-1376(%rbp), %rdi	# %sfp,
	movq	%r15, %rsi	# tmp1157,
	call	fopen@PLT	#
	movq	%rax, -1376(%rbp)	# tmp1494, %sfp
# sub_avx_64_aligned.c:645:     if (file == NULL)
	testq	%rax, %rax	# file
	je	.L323	#,
	movq	%rax, %rbx	# file, file
	.p2align 4,,10
	.p2align 3
.L324:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%r12), %rcx	# MEM[(const char * *)_1043],
	movq	%r14, %rdx	# tmp1158,
	movl	$1, %esi	#,
	movq	%rbx, %rdi	# file,
	xorl	%eax, %eax	#
# sub_avx_64_aligned.c:652:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$8, %r12	#, ivtmp.584
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	__fprintf_chk@PLT	#
# sub_avx_64_aligned.c:652:     for (int j = 0; j < MAX_EVENTS; j++)
	cmpq	%r12, %r13	# ivtmp.584, _1035
	jne	.L324	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	-1376(%rbp), %rsi	# %sfp,
	movl	$10, %edi	#,
# sub_avx_64_aligned.c:903:     gmp_randinit_default(state);
	leaq	-1168(%rbp), %r13	#, tmp713
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	fputc@PLT	#
# sub_avx_64_aligned.c:893:     FILE *time_file = fopen(time_filename, "w");
	movq	-1360(%rbp), %rdi	# %sfp,
	movq	%r15, %rsi	# tmp1157,
	call	fopen@PLT	#
# sub_avx_64_aligned.c:894:     FILE *time_file_gmp = fopen(time_filename_gmp, "w");
	movq	-1352(%rbp), %rdi	# %sfp,
	movq	%r15, %rsi	# tmp1157,
# sub_avx_64_aligned.c:900:     mpz_init(sample_num);
	leaq	-1232(%rbp), %r15	#, tmp712
# sub_avx_64_aligned.c:894:     FILE *time_file_gmp = fopen(time_filename_gmp, "w");
	call	fopen@PLT	#
# sub_avx_64_aligned.c:900:     mpz_init(sample_num);
	movq	%r15, %rdi	# tmp712,
	call	__gmpz_init@PLT	#
# sub_avx_64_aligned.c:902:     unsigned long seed = generate_seed();
	xorl	%eax, %eax	#
	call	generate_seed	#
# sub_avx_64_aligned.c:903:     gmp_randinit_default(state);
	movq	%r13, %rdi	# tmp713,
# sub_avx_64_aligned.c:902:     unsigned long seed = generate_seed();
	movq	%rax, %r14	# tmp1495, seed
# sub_avx_64_aligned.c:903:     gmp_randinit_default(state);
	call	__gmp_randinit_default@PLT	#
# sub_avx_64_aligned.c:904:     gmp_randseed_ui(state, seed);
	movq	%r14, %rsi	# seed,
	movq	%r13, %rdi	# tmp713,
	call	__gmp_randseed_ui@PLT	#
# sub_avx_64_aligned.c:905:     mpz_urandomb(sample_num, state, NUM_BITS);
	movslq	NUM_BITS(%rip), %rdx	# NUM_BITS, NUM_BITS
	movq	%r13, %rsi	# tmp713,
	movq	%r15, %rdi	# tmp712,
	call	__gmpz_urandomb@PLT	#
# sub_avx_64_aligned.c:906:     char *sample_num_str = mpz_get_str(NULL, 10, sample_num);
	movq	%r15, %rdx	# tmp712,
	movl	$10, %esi	#,
	xorl	%edi, %edi	#
	call	__gmpz_get_str@PLT	#
	movq	%rax, %rdi	# tmp1496, sample_num_str
# sub_avx_64_aligned.c:907:     int n = strlen(sample_num_str);
	call	strlen@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	movl	$1, %edi	#,
	leaq	.LC45(%rip), %rsi	#, tmp724
# sub_avx_64_aligned.c:907:     int n = strlen(sample_num_str);
	movl	%eax, -1352(%rbp)	# _12, %sfp
	movl	%eax, %r12d	# tmp721, _12
	movl	%eax, -1344(%rbp)	# tmp721, n
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	movl	%r12d, %edx	# _12,
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	leaq	.LC46(%rip), %rsi	#, tmp725
	call	__printf_chk@PLT	#
	leaq	.LC47(%rip), %rdi	#, tmp726
	call	puts@PLT	#
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	sub_space(%rip), %rdi	# sub_space,
	movl	$1073741824, %edx	#,
	xorl	%esi, %esi	#
	call	memset@PLT	#
	movq	borrow_space(%rip), %rdi	# borrow_space,
	movl	$1073741824, %edx	#,
	xorl	%esi, %esi	#
# sub_avx_64_aligned.c:919:     sub_space_ptr = 0;
	movl	$0, sub_space_ptr(%rip)	#, sub_space_ptr
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	call	memset@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC48(%rip), %rdi	#, tmp737
# sub_avx_64_aligned.c:922:     borrow_space_ptr = 0;
	movl	$0, borrow_space_ptr(%rip)	#, borrow_space_ptr
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	puts@PLT	#
	movl	$1, %edi	#,
	movl	$100000, %edx	#,
	xorl	%eax, %eax	#
	leaq	.LC49(%rip), %rsi	#, tmp738
	call	__printf_chk@PLT	#
	leaq	-1264(%rbp), %rdi	#, tmp1166
	leaq	-1328(%rbp), %r10	#, tmp1165
# sub_avx_64_aligned.c:936:     for (int i = 0; i < ITERATIONS; i++)
	movl	$0, -1448(%rbp)	#, %sfp
# sub_avx_64_aligned.c:934:     unsigned long long test1_rdtsc = 0, test1_rdtsc_gmp = 0;
	movq	$0, -1472(%rbp)	#, %sfp
# sub_avx_64_aligned.c:934:     unsigned long long test1_rdtsc = 0, test1_rdtsc_gmp = 0;
	movq	$0, -1464(%rbp)	#, %sfp
	movq	%rdi, -1416(%rbp)	# tmp1166, %sfp
	movq	%r10, -1408(%rbp)	# tmp1165, %sfp
.L379:
# sub_avx_64_aligned.c:944:         generate_no_borrow_propagation(&a1_test1, &b1_test1, n);
	movl	-1352(%rbp), %r15d	# %sfp, _12
	movq	-1416(%rbp), %rsi	# %sfp,
	movq	-1408(%rbp), %rdi	# %sfp,
	movl	%r15d, %edx	# _12,
	call	generate_no_borrow_propagation	#
# sub_avx_64_aligned.c:855:     char *str = (char *)calloc(n + 1, sizeof(char));
	leal	1(%r15), %eax	#, tmp741
# sub_avx_64_aligned.c:855:     char *str = (char *)calloc(n + 1, sizeof(char));
	movl	$1, %esi	#,
# sub_avx_64_aligned.c:960:         char *a1_str_test1 = convert_digits_to_string(a1_test1, n);
	movq	-1328(%rbp), %rbx	# a1_test1, a1_test1.28_19
# sub_avx_64_aligned.c:855:     char *str = (char *)calloc(n + 1, sizeof(char));
	movslq	%eax, %r12	# tmp741, _369
	movq	%r12, %rdi	# _369,
	call	calloc@PLT	#
	movq	%rax, -1360(%rbp)	# str, %sfp
# sub_avx_64_aligned.c:856:     if (str == NULL)
	testq	%rax, %rax	# str
	je	.L325	#,
# sub_avx_64_aligned.c:865:     str[n] = '\0';
	movslq	%r15d, %r13	# _12, _602
	leaq	(%rax,%r13), %rsi	#, _603
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	testl	%r15d, %r15d	# _12
	jle	.L786	#,
	movl	-1352(%rbp), %ecx	# %sfp, _12
	leaq	0(,%r13,8), %r8	#, _662
	movq	%rax, %r11	# str, str
	leaq	(%rbx,%r8), %rdx	#, tmp744
	leal	-1(%rcx), %r10d	#, _658
	movl	%ecx, %r14d	# _12, niters.382
	cmpl	$14, %r10d	#, _658
	seta	%r9b	#, _659
	cmpq	%rdx, %rax	# tmp744, str
	setnb	%dil	#, tmp746
	cmpq	%rsi, %rbx	# _603, a1_test1.28_19
	setnb	%al	#, tmp749
	orb	%al, %dil	# tmp749, tmp1530
	je	.L328	#,
	testb	%r9b, %r9b	# _659
	je	.L328	#,
	cmpl	$30, %r10d	#, _658
	jbe	.L389	#,
	shrl	$5, %ecx	#, bnd.404
	movq	%rbx, %r15	# a1_test1.28_19, ivtmp.565
	movq	%r11, %rdi	# str, ivtmp.568
	subl	$1, %ecx	#, tmp753
	salq	$8, %rcx	#, tmp754
	leaq	256(%rbx,%rcx), %rcx	#, _1047
	.p2align 4,,10
	.p2align 3
.L330:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	vmovdqu	(%r15), %ymm5	# MEM <vector(4) long unsigned int> [(uint64_t *)_1061], tmp1668
	vmovdqu	64(%r15), %ymm7	# MEM <vector(4) long unsigned int> [(uint64_t *)_1061 + 64B], tmp1670
	addq	$32, %rdi	#, ivtmp.568
	addq	$256, %r15	#, ivtmp.565
	vperm2i128	$32, -224(%r15), %ymm5, %ymm0	#, MEM <vector(4) long unsigned int> [(uint64_t *)_1061 + 32B], tmp1668, tmp761
	vperm2i128	$49, -224(%r15), %ymm5, %ymm2	#, MEM <vector(4) long unsigned int> [(uint64_t *)_1061 + 32B], tmp1669, tmp762
	vperm2i128	$32, -160(%r15), %ymm7, %ymm6	#, MEM <vector(4) long unsigned int> [(uint64_t *)_1061 + 96B], tmp1670, tmp769
	vperm2i128	$49, -160(%r15), %ymm7, %ymm10	#, MEM <vector(4) long unsigned int> [(uint64_t *)_1061 + 96B], tmp1671, tmp770
	vpshufd	$216, %ymm0, %ymm3	#, tmp761, tmp759
	vpshufd	$216, %ymm2, %ymm4	#, tmp762, tmp760
	vmovdqu	-64(%r15), %ymm7	# MEM <vector(4) long unsigned int> [(uint64_t *)_1061 + 192B], tmp1674
	vpshufd	$216, %ymm6, %ymm11	#, tmp769, tmp767
	vpshufd	$216, %ymm10, %ymm12	#, tmp770, tmp768
	vpunpcklqdq	%ymm4, %ymm3, %ymm8	# tmp760, tmp759, tmp763
	vpunpcklqdq	%ymm12, %ymm11, %ymm13	# tmp768, tmp767, tmp771
	vpand	.LC32(%rip), %ymm8, %ymm14	#, tmp763, tmp773
	vpand	.LC32(%rip), %ymm13, %ymm15	#, tmp771, tmp774
	vperm2i128	$32, -32(%r15), %ymm7, %ymm6	#, MEM <vector(4) long unsigned int> [(uint64_t *)_1061 + 224B], tmp1674, tmp791
	vperm2i128	$49, -32(%r15), %ymm7, %ymm11	#, MEM <vector(4) long unsigned int> [(uint64_t *)_1061 + 224B], tmp1675, tmp792
	vpackusdw	%ymm15, %ymm14, %ymm5	# tmp774, tmp773, tmp776
	vpermq	$216, %ymm5, %ymm0	#, tmp776, tmp777
	vmovdqu	-128(%r15), %ymm5	# MEM <vector(4) long unsigned int> [(uint64_t *)_1061 + 128B], tmp1672
	vperm2i128	$32, -96(%r15), %ymm5, %ymm1	#, MEM <vector(4) long unsigned int> [(uint64_t *)_1061 + 160B], tmp1672, tmp783
	vpshufd	$216, %ymm6, %ymm12	#, tmp791, tmp789
	vperm2i128	$49, -96(%r15), %ymm5, %ymm3	#, MEM <vector(4) long unsigned int> [(uint64_t *)_1061 + 160B], tmp1673, tmp784
	vpshufd	$216, %ymm11, %ymm13	#, tmp792, tmp790
	vpand	.LC33(%rip), %ymm0, %ymm0	#, tmp777, tmp801
	vpshufd	$216, %ymm1, %ymm4	#, tmp783, tmp781
	vpunpcklqdq	%ymm13, %ymm12, %ymm14	# tmp790, tmp789, tmp793
	vpand	.LC32(%rip), %ymm14, %ymm5	#, tmp793, tmp796
	vpshufd	$216, %ymm3, %ymm8	#, tmp784, tmp782
	vpunpcklqdq	%ymm8, %ymm4, %ymm9	# tmp782, tmp781, tmp785
	vpand	.LC32(%rip), %ymm9, %ymm15	#, tmp785, tmp795
	vpackusdw	%ymm5, %ymm15, %ymm1	# tmp796, tmp795, tmp798
	vpermq	$216, %ymm1, %ymm2	#, tmp798, tmp799
	vpand	.LC33(%rip), %ymm2, %ymm3	#, tmp799, tmp802
	vpackuswb	%ymm3, %ymm0, %ymm4	# tmp802, tmp801, tmp804
	vpermq	$216, %ymm4, %ymm8	#, tmp804, tmp805
	vpaddb	.LC34(%rip), %ymm8, %ymm9	#, tmp805, vect__377.420
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	vmovdqu	%ymm9, -32(%rdi)	# vect__377.420, MEM <vector(32) char> [(char *)_1053]
	cmpq	%r15, %rcx	# ivtmp.565, _1047
	jne	.L330	#,
	movl	-1352(%rbp), %ecx	# %sfp, _12
	movl	%ecx, %r11d	# _12, niters_vector_mult_vf.405
	andl	$-32, %r11d	#,
	movl	%r11d, %eax	# niters_vector_mult_vf.405, tmp.427
	cmpl	%r11d, %ecx	# niters_vector_mult_vf.405, _12
	je	.L777	#,
	subl	%r11d, %ecx	# niters_vector_mult_vf.405, niters.424
	leal	-1(%rcx), %edx	#, tmp808
	cmpl	$14, %edx	#, tmp808
	jbe	.L787	#,
	vzeroupper
.L329:
	leaq	(%rbx,%r11,8), %r15	#, vectp_a1_test1.429
	movq	-1360(%rbp), %rdi	# %sfp, str
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	vmovdqu	(%r15), %xmm7	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_a1_test1.429_767], tmp1679
	vmovdqu	32(%r15), %xmm10	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_a1_test1.429_767 + 32B], tmp1680
	vshufps	$136, 16(%r15), %xmm7, %xmm6	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_a1_test1.429_767 + 16B], tmp1679, vect__692.440
	vshufps	$136, 48(%r15), %xmm10, %xmm11	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_a1_test1.429_767 + 48B], tmp1680, vect__692.440
	vpand	.LC35(%rip), %xmm6, %xmm12	#, vect__692.440, tmp817
	vmovdqu	64(%r15), %xmm15	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_a1_test1.429_767 + 64B], tmp1681
	vshufps	$136, 80(%r15), %xmm15, %xmm5	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_a1_test1.429_767 + 80B], tmp1681, vect__692.440
	vmovdqu	96(%r15), %xmm1	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_a1_test1.429_767 + 96B], tmp1682
	vpand	.LC35(%rip), %xmm11, %xmm13	#, vect__692.440, tmp818
	vshufps	$136, 112(%r15), %xmm1, %xmm2	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_a1_test1.429_767 + 112B], tmp1682, vect__692.440
	vpand	.LC35(%rip), %xmm5, %xmm0	#, vect__692.440, tmp827
	vpand	.LC35(%rip), %xmm2, %xmm3	#, vect__692.440, tmp828
	vpackusdw	%xmm13, %xmm12, %xmm14	# tmp818, tmp817, vect__692.439
	vpand	.LC36(%rip), %xmm14, %xmm8	#, vect__692.439, tmp831
	vpackusdw	%xmm3, %xmm0, %xmm4	# tmp828, tmp827, vect__692.439
	vpand	.LC36(%rip), %xmm4, %xmm9	#, vect__692.439, tmp832
	vpackuswb	%xmm9, %xmm8, %xmm7	# tmp832, tmp831, vect__692.438
	vpaddb	.LC37(%rip), %xmm7, %xmm6	#, vect__692.438, vect__693.441
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	vmovdqu	%xmm6, (%rdi,%r11)	# vect__693.441, MEM <vector(16) char> [(char *)vectp_str.444_797]
	movl	%ecx, %r11d	# niters.424, niters_vector_mult_vf.426
	andl	$-16, %r11d	#, niters_vector_mult_vf.426
	addl	%r11d, %eax	# niters_vector_mult_vf.426, tmp.427
	cmpl	%ecx, %r11d	# niters.424, niters_vector_mult_vf.426
	je	.L335	#,
.L332:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%eax, %rdx	# tmp.427, _858
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movq	-1360(%rbp), %r11	# %sfp, str
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	1(%rax), %edi	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%rdx,8), %r15d	# *_860, tmp1685
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	leaq	0(,%rdx,8), %rcx	#, _859
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %r15d	#, tmp837
	movb	%r15b, (%r11,%rdx)	# tmp837, *_864
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	movl	-1352(%rbp), %r15d	# %sfp, _12
	cmpl	%edi, %r15d	# i, _12
	jle	.L335	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%edi, %rdx	# i, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	8(%rbx,%rcx), %edi	# *_872, tmp1688
	addl	$48, %edi	#, tmp840
	movb	%dil, (%r11,%rdx)	# tmp840, *_876
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	2(%rax), %edx	#, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r15d	# i, _12
	jle	.L335	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	16(%rbx,%rcx), %edi	# *_884, tmp1691
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp843
	movb	%dil, (%r11,%rdx)	# tmp843, *_888
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	3(%rax), %edx	#, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r15d	# i, _12
	jle	.L335	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	24(%rbx,%rcx), %edi	# *_896, tmp1694
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp846
	movb	%dil, (%r11,%rdx)	# tmp846, *_900
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	4(%rax), %edx	#, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r15d	# i, _12
	jle	.L335	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	32(%rbx,%rcx), %edi	# *_908, tmp1697
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp849
	movb	%dil, (%r11,%rdx)	# tmp849, *_912
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	5(%rax), %edx	#, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r15d	# i, _12
	jle	.L335	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	40(%rbx,%rcx), %edi	# *_920, tmp1700
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp852
	movb	%dil, (%r11,%rdx)	# tmp852, *_924
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	6(%rax), %edx	#, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r15d	# i, _12
	jle	.L335	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	48(%rbx,%rcx), %edi	# *_932, tmp1703
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp855
	movb	%dil, (%r11,%rdx)	# tmp855, *_936
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	7(%rax), %edx	#, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r15d	# i, _12
	jle	.L335	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	56(%rbx,%rcx), %edi	# *_944, tmp1706
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp858
	movb	%dil, (%r11,%rdx)	# tmp858, *_948
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	8(%rax), %edx	#, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r15d	# i, _12
	jle	.L335	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	64(%rbx,%rcx), %edi	# *_956, tmp1709
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp861
	movb	%dil, (%r11,%rdx)	# tmp861, *_960
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	9(%rax), %edx	#, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r15d	# i, _12
	jle	.L335	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	72(%rbx,%rcx), %edi	# *_968, tmp1712
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp864
	movb	%dil, (%r11,%rdx)	# tmp864, *_972
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	10(%rax), %edx	#, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r15d	# i, _12
	jle	.L335	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	80(%rbx,%rcx), %edi	# *_980, tmp1715
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp867
	movb	%dil, (%r11,%rdx)	# tmp867, *_984
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	11(%rax), %edx	#, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r15d	# i, _12
	jle	.L335	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	88(%rbx,%rcx), %edi	# *_992, tmp1718
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp870
	movb	%dil, (%r11,%rdx)	# tmp870, *_996
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	12(%rax), %edx	#, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r15d	# i, _12
	jle	.L335	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	96(%rbx,%rcx), %edi	# *_1004, tmp1721
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp873
	movb	%dil, (%r11,%rdx)	# tmp873, *_1008
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	13(%rax), %edx	#, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r15d	# i, _12
	jle	.L335	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	104(%rbx,%rcx), %edi	# *_1016, tmp1724
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	addl	$14, %eax	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp876
	movb	%dil, (%r11,%rdx)	# tmp876, *_1020
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%eax, %r15d	# i, _12
	jle	.L335	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movq	112(%rbx,%rcx), %rbx	# *_748, *_748
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	cltq
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %ebx	#, tmp879
	movb	%bl, (%r11,%rax)	# tmp879, *_752
	.p2align 4,,10
	.p2align 3
.L335:
# sub_avx_64_aligned.c:865:     str[n] = '\0';
	movb	$0, (%rsi)	#, *_603
# sub_avx_64_aligned.c:855:     char *str = (char *)calloc(n + 1, sizeof(char));
	movq	%r12, %rdi	# _369,
	movl	$1, %esi	#,
# sub_avx_64_aligned.c:961:         char *b1_str_test1 = convert_digits_to_string(b1_test1, n);
	movq	-1264(%rbp), %rbx	# b1_test1, b1_test1.30_366
	movl	%r10d, -1384(%rbp)	# _658, %sfp
	movq	%r8, -1400(%rbp)	# _662, %sfp
	movb	%r9b, -1392(%rbp)	# _659, %sfp
# sub_avx_64_aligned.c:855:     char *str = (char *)calloc(n + 1, sizeof(char));
	call	calloc@PLT	#
# sub_avx_64_aligned.c:856:     if (str == NULL)
	movl	-1384(%rbp), %r12d	# %sfp, _658
	movzbl	-1392(%rbp), %esi	# %sfp, _659
	testq	%rax, %rax	# str
	movq	-1400(%rbp), %r10	# %sfp, _662
# sub_avx_64_aligned.c:855:     char *str = (char *)calloc(n + 1, sizeof(char));
	movq	%rax, %r15	# tmp1508, str
# sub_avx_64_aligned.c:856:     if (str == NULL)
	je	.L325	#,
	leaq	(%r15,%r13), %r9	#, tmp882
	leaq	(%rbx,%r10), %rcx	#, tmp885
	cmpq	%r9, %rbx	# tmp882, b1_test1.30_366
	setnb	%r8b	#, tmp884
	cmpq	%rcx, %r15	# tmp885, str
	setnb	%al	#, tmp887
	orb	%al, %r8b	# tmp887, tmp1531
	je	.L336	#,
	testb	%sil, %sil	# _659
	je	.L336	#,
	cmpl	$30, %r12d	#, _658
	jbe	.L390	#,
	movl	-1352(%rbp), %edi	# %sfp, bnd.362
	movq	%r15, %r14	# str, ivtmp.553
	movq	%rbx, %rdx	# b1_test1.30_366, ivtmp.556
	shrl	$5, %edi	#,
	salq	$5, %rdi	#, tmp891
	addq	%r15, %rdi	# str, _1074
	.p2align 4,,10
	.p2align 3
.L338:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	vmovdqu	(%rdx), %ymm5	# MEM <vector(4) long unsigned int> [(uint64_t *)_1088], tmp1739
	vperm2i128	$32, 32(%rdx), %ymm5, %ymm10	#, MEM <vector(4) long unsigned int> [(uint64_t *)_1088 + 32B], tmp1739, tmp897
	addq	$32, %r14	#, ivtmp.553
	addq	$256, %rdx	#, ivtmp.556
	vperm2i128	$49, -224(%rdx), %ymm5, %ymm12	#, MEM <vector(4) long unsigned int> [(uint64_t *)_1088 + 32B], tmp1740, tmp898
	vmovdqu	-192(%rdx), %ymm7	# MEM <vector(4) long unsigned int> [(uint64_t *)_1088 + 64B], tmp1741
	vperm2i128	$32, -160(%rdx), %ymm7, %ymm1	#, MEM <vector(4) long unsigned int> [(uint64_t *)_1088 + 96B], tmp1741, tmp905
	vperm2i128	$49, -160(%rdx), %ymm7, %ymm0	#, MEM <vector(4) long unsigned int> [(uint64_t *)_1088 + 96B], tmp1742, tmp906
	vpshufd	$216, %ymm10, %ymm13	#, tmp897, tmp895
	vpshufd	$216, %ymm12, %ymm14	#, tmp898, tmp896
	vmovdqu	-64(%rdx), %ymm7	# MEM <vector(4) long unsigned int> [(uint64_t *)_1088 + 192B], tmp1745
	vperm2i128	$32, -32(%rdx), %ymm7, %ymm2	#, MEM <vector(4) long unsigned int> [(uint64_t *)_1088 + 224B], tmp1745, tmp927
	vpshufd	$216, %ymm1, %ymm3	#, tmp905, tmp903
	vpshufd	$216, %ymm0, %ymm4	#, tmp906, tmp904
	vpunpcklqdq	%ymm14, %ymm13, %ymm15	# tmp896, tmp895, tmp899
	vpunpcklqdq	%ymm4, %ymm3, %ymm8	# tmp904, tmp903, tmp907
	vperm2i128	$49, -32(%rdx), %ymm7, %ymm3	#, MEM <vector(4) long unsigned int> [(uint64_t *)_1088 + 224B], tmp1746, tmp928
	vpand	.LC32(%rip), %ymm15, %ymm9	#, tmp899, tmp909
	vpand	.LC32(%rip), %ymm8, %ymm6	#, tmp907, tmp910
	vpshufd	$216, %ymm2, %ymm4	#, tmp927, tmp925
	vpshufd	$216, %ymm3, %ymm8	#, tmp928, tmp926
	vpackusdw	%ymm6, %ymm9, %ymm5	# tmp910, tmp909, tmp912
	vpunpcklqdq	%ymm8, %ymm4, %ymm9	# tmp926, tmp925, tmp929
	vpermq	$216, %ymm5, %ymm10	#, tmp912, tmp913
	vmovdqu	-128(%rdx), %ymm5	# MEM <vector(4) long unsigned int> [(uint64_t *)_1088 + 128B], tmp1743
	vperm2i128	$32, -96(%rdx), %ymm5, %ymm11	#, MEM <vector(4) long unsigned int> [(uint64_t *)_1088 + 160B], tmp1743, tmp919
	vperm2i128	$49, -96(%rdx), %ymm5, %ymm13	#, MEM <vector(4) long unsigned int> [(uint64_t *)_1088 + 160B], tmp1744, tmp920
	vpand	.LC32(%rip), %ymm9, %ymm5	#, tmp929, tmp932
	vpshufd	$216, %ymm11, %ymm14	#, tmp919, tmp917
	vpand	.LC33(%rip), %ymm10, %ymm10	#, tmp913, tmp937
	vpshufd	$216, %ymm13, %ymm15	#, tmp920, tmp918
	vpunpcklqdq	%ymm15, %ymm14, %ymm1	# tmp918, tmp917, tmp921
	vpand	.LC32(%rip), %ymm1, %ymm6	#, tmp921, tmp931
	vpackusdw	%ymm5, %ymm6, %ymm11	# tmp932, tmp931, tmp934
	vpermq	$216, %ymm11, %ymm12	#, tmp934, tmp935
	vpand	.LC33(%rip), %ymm12, %ymm13	#, tmp935, tmp938
	vpackuswb	%ymm13, %ymm10, %ymm14	# tmp938, tmp937, tmp940
	vpermq	$216, %ymm14, %ymm15	#, tmp940, tmp941
	vpaddb	.LC34(%rip), %ymm15, %ymm1	#, tmp941, vect__362.378
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	vmovdqu	%ymm1, -32(%r14)	# vect__362.378, MEM <vector(32) char> [(char *)_1080]
	cmpq	%r14, %rdi	# ivtmp.553, _1074
	jne	.L338	#,
	movl	-1352(%rbp), %r11d	# %sfp, _12
	movl	%r11d, %r12d	# _12, niters_vector_mult_vf.363
	andl	$-32, %r12d	#, niters_vector_mult_vf.363
	movl	%r12d, %r10d	# niters_vector_mult_vf.363, tmp.385
	cmpl	%r11d, %r12d	# _12, niters_vector_mult_vf.363
	je	.L779	#,
	subl	%r12d, %r11d	# niters_vector_mult_vf.363, niters.382
	leal	-1(%r11), %esi	#, tmp944
	movl	%r11d, %r14d	# niters.382, niters.382
	cmpl	$14, %esi	#, tmp944
	jbe	.L788	#,
	vzeroupper
.L337:
	movl	%r12d, %r9d	# niters_vector_mult_vf.363, _617
	movl	%r14d, %ecx	# niters.382, niters_vector_mult_vf.384
	leaq	(%rbx,%r9,8), %r8	#, vectp_b1_test1.387
	andl	$-16, %ecx	#, niters_vector_mult_vf.384
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	vmovdqu	(%r8), %xmm7	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_b1_test1.387_616], tmp1750
	vmovdqu	32(%r8), %xmm0	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_b1_test1.387_616 + 32B], tmp1751
	vshufps	$136, 16(%r8), %xmm7, %xmm2	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_b1_test1.387_616 + 16B], tmp1750, vect__425.398
	vshufps	$136, 48(%r8), %xmm0, %xmm3	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_b1_test1.387_616 + 48B], tmp1751, vect__425.398
	vpand	.LC35(%rip), %xmm2, %xmm4	#, vect__425.398, tmp953
	vmovdqu	64(%r8), %xmm6	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_b1_test1.387_616 + 64B], tmp1752
	addl	%ecx, %r10d	# niters_vector_mult_vf.384, tmp.385
	vshufps	$136, 80(%r8), %xmm6, %xmm5	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_b1_test1.387_616 + 80B], tmp1752, vect__425.398
	vmovdqu	96(%r8), %xmm11	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_b1_test1.387_616 + 96B], tmp1753
	vpand	.LC35(%rip), %xmm3, %xmm8	#, vect__425.398, tmp954
	vshufps	$136, 112(%r8), %xmm11, %xmm12	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_b1_test1.387_616 + 112B], tmp1753, vect__425.398
	vpand	.LC35(%rip), %xmm5, %xmm10	#, vect__425.398, tmp963
	vpand	.LC35(%rip), %xmm12, %xmm13	#, vect__425.398, tmp964
	vpackusdw	%xmm8, %xmm4, %xmm9	# tmp954, tmp953, vect__425.397
	vpand	.LC36(%rip), %xmm9, %xmm15	#, vect__425.397, tmp967
	vpackusdw	%xmm13, %xmm10, %xmm14	# tmp964, tmp963, vect__425.397
	vpand	.LC36(%rip), %xmm14, %xmm1	#, vect__425.397, tmp968
	vpackuswb	%xmm1, %xmm15, %xmm7	# tmp968, tmp967, vect__425.396
	vpaddb	.LC37(%rip), %xmm7, %xmm2	#, vect__425.396, vect__422.399
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	vmovdqu	%xmm2, (%r15,%r9)	# vect__422.399, MEM <vector(16) char> [(char *)vectp_str.402_646]
	cmpl	%r14d, %ecx	# niters.382, niters_vector_mult_vf.384
	je	.L387	#,
.L340:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%r10d, %r14	# tmp.385, _373
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	movl	-1352(%rbp), %edi	# %sfp, _12
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	1(%r10), %r11d	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%r14,8), %edx	# *_375, tmp1755
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	leaq	0(,%r14,8), %rax	#, _374
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %edx	#, tmp973
	movb	%dl, (%r15,%r14)	# tmp973, *_379
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%r11d, %edi	# i, _12
	jle	.L387	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	8(%rbx,%rax), %esi	# *_693, tmp1757
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%r11d, %r12	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	2(%r10), %r9d	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %esi	#, tmp976
	movb	%sil, (%r15,%r12)	# tmp976, *_698
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edi, %r9d	# _12, i
	jge	.L387	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	16(%rbx,%rax), %ecx	# *_363, tmp1759
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%r9d, %r8	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	3(%r10), %r14d	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %ecx	#, tmp979
	movb	%cl, (%r15,%r8)	# tmp979, *_541
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edi, %r14d	# _12, i
	jge	.L387	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	24(%rbx,%rax), %r11d	# *_421, tmp1761
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%r14d, %rdx	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	4(%r10), %r12d	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %r11d	#, tmp982
	movb	%r11b, (%r15,%rdx)	# tmp982, *_286
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%r12d, %edi	# i, _12
	jle	.L387	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	32(%rbx,%rax), %esi	# *_463, tmp1763
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%r12d, %r9	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	5(%r10), %r8d	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %esi	#, tmp985
	movb	%sil, (%r15,%r9)	# tmp985, *_224
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edi, %r8d	# _12, i
	jge	.L387	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	40(%rbx,%rax), %r14d	# *_574, tmp1765
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%r8d, %rcx	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	6(%r10), %edx	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %r14d	#, tmp988
	movb	%r14b, (%r15,%rcx)	# tmp988, *_232
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edi, %edx	# _12, i
	jge	.L387	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	48(%rbx,%rax), %r12d	# *_323, tmp1767
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%edx, %r11	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	7(%r10), %r9d	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %r12d	#, tmp991
	movb	%r12b, (%r15,%r11)	# tmp991, *_513
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edi, %r9d	# _12, i
	jge	.L387	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	56(%rbx,%rax), %esi	# *_205, tmp1769
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%r9d, %r8	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	8(%r10), %ecx	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %esi	#, tmp994
	movb	%sil, (%r15,%r8)	# tmp994, *_209
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%edi, %ecx	# _12, i
	jge	.L387	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	64(%rbx,%rax), %edx	# *_656, tmp1771
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%ecx, %r14	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	9(%r10), %r11d	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %edx	#, tmp997
	movb	%dl, (%r15,%r14)	# tmp997, *_654
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%r11d, %edi	# i, _12
	jle	.L387	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	72(%rbx,%rax), %r9d	# *_573, tmp1773
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%r11d, %r12	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	10(%r10), %r8d	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %r9d	#, tmp1000
	movb	%r9b, (%r15,%r12)	# tmp1000, *_804
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%r8d, %edi	# i, _12
	jle	.L387	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	80(%rbx,%rax), %esi	# *_812, tmp1775
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%r8d, %rcx	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	11(%r10), %r14d	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %esi	#, tmp1003
	movb	%sil, (%r15,%rcx)	# tmp1003, *_816
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%r14d, %edi	# i, _12
	jle	.L387	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	88(%rbx,%rax), %r11d	# *_824, tmp1777
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%r14d, %rdx	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	12(%r10), %r12d	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %r11d	#, tmp1006
	movb	%r11b, (%r15,%rdx)	# tmp1006, *_828
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%r12d, %edi	# i, _12
	jle	.L387	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	96(%rbx,%rax), %r8d	# *_836, tmp1779
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%r12d, %r9	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	leal	13(%r10), %ecx	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %r8d	#, tmp1009
	movb	%r8b, (%r15,%r9)	# tmp1009, *_840
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%ecx, %edi	# i, _12
	jle	.L387	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	104(%rbx,%rax), %esi	# *_848, tmp1781
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%ecx, %r14	# i, i
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	addl	$14, %r10d	#, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %esi	#, tmp1012
	movb	%sil, (%r15,%r14)	# tmp1012, *_852
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	cmpl	%r10d, %edi	# i, _12
	jle	.L387	#,
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movq	112(%rbx,%rax), %rbx	# *_346, *_346
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movslq	%r10d, %r10	# i, i
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %ebx	#, tmp1015
	movb	%bl, (%r15,%r10)	# tmp1015, *_141
	.p2align 4,,10
	.p2align 3
.L387:
# sub_avx_64_aligned.c:865:     str[n] = '\0';
	movb	$0, (%r15,%r13)	#, *_367
# sub_avx_64_aligned.c:964:         make_equidistant(&a1_test1, &b1_test1, &n, &n);
	leaq	-1344(%rbp), %rdx	#, tmp1018
	movq	-1416(%rbp), %rsi	# %sfp,
	movq	-1408(%rbp), %rdi	# %sfp,
	movq	%rdx, %rcx	# tmp1018,
	call	make_equidistant	#
# sub_avx_64_aligned.c:967:         int n_limb = n;
	movl	-1344(%rbp), %r13d	# n, _12
# sub_avx_64_aligned.c:971:         aligned_uint64_ptr a1_limbs = returnLimbs(a1_test1, &n_limb);
	movq	-1328(%rbp), %rdi	# a1_test1,
	leaq	-1340(%rbp), %rsi	#, tmp1022
# sub_avx_64_aligned.c:967:         int n_limb = n;
	movl	%r13d, -1352(%rbp)	# _12, %sfp
	movl	%r13d, -1340(%rbp)	# _12, n_limb
# sub_avx_64_aligned.c:968:         int m_limb = n;
	movl	%r13d, -1336(%rbp)	# _12, m_limb
# sub_avx_64_aligned.c:971:         aligned_uint64_ptr a1_limbs = returnLimbs(a1_test1, &n_limb);
	call	returnLimbs	#
# sub_avx_64_aligned.c:973:         aligned_uint64_ptr b1_limbs = returnLimbs(b1_test1, &m_limb);
	movq	-1264(%rbp), %rdi	# b1_test1,
	leaq	-1336(%rbp), %rsi	#, tmp1024
# sub_avx_64_aligned.c:971:         aligned_uint64_ptr a1_limbs = returnLimbs(a1_test1, &n_limb);
	movq	%rax, %r12	# tmp1499, a1_limbs
# sub_avx_64_aligned.c:973:         aligned_uint64_ptr b1_limbs = returnLimbs(b1_test1, &m_limb);
	call	returnLimbs	#
# sub_avx_64_aligned.c:978:         int sub_size_test1 = n_limb;
	movl	-1340(%rbp), %r14d	# n_limb, n_limb.37_27
# sub_avx_64_aligned.c:973:         aligned_uint64_ptr b1_limbs = returnLimbs(b1_test1, &m_limb);
	movq	%rax, -1384(%rbp)	# tmp1500, %sfp
# sub_avx_64_aligned.c:979:         sub_space_ptr += (n_limb + 31) & ~31;
	leal	31(%r14), %ebx	#, tmp1026
# sub_avx_64_aligned.c:978:         int sub_size_test1 = n_limb;
	movl	%r14d, -1332(%rbp)	# n_limb.37_27, sub_size_test1
# sub_avx_64_aligned.c:979:         sub_space_ptr += (n_limb + 31) & ~31;
	andl	$-32, %ebx	#, _30
# sub_avx_64_aligned.c:979:         sub_space_ptr += (n_limb + 31) & ~31;
	addl	%ebx, sub_space_ptr(%rip)	# _30, sub_space_ptr
# sub_avx_64_aligned.c:980:         borrow_space_ptr += (n_limb + 31) & ~31;
	addl	%ebx, borrow_space_ptr(%rip)	# _30, borrow_space_ptr
# sub_avx_64_aligned.c:80:     asm volatile("CPUID\n\t"
#APP
# 80 "sub_avx_64_aligned.c" 1
	CPUID
	RDTSC
	mov %edx, %esi	# cycles_high
	mov %eax, %edi	# cycles_low
	
# 0 "" 2
# sub_avx_64_aligned.c:84:     asm volatile("RDTSCP\n\t"
# 84 "sub_avx_64_aligned.c" 1
	RDTSCP
	mov %edx, %esi	# cycles_high1
	mov %eax, %edi	# cycles_low1
	CPUID
	
# 0 "" 2
#NO_APP
	leaq	fd(%rip), %r13	#, ivtmp.465
	movq	%r13, %rbx	# ivtmp.465, ivtmp.541
	.p2align 4,,10
	.p2align 3
.L344:
# sub_avx_64_aligned.c:687:         ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
	movl	(%rbx), %edi	# MEM[(int *)_1104],
	xorl	%edx, %edx	#
	movl	$9219, %esi	#,
	xorl	%eax, %eax	#
# sub_avx_64_aligned.c:685:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$4, %rbx	#, ivtmp.541
# sub_avx_64_aligned.c:687:         ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
	call	ioctl@PLT	#
# sub_avx_64_aligned.c:688:         ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
	movl	-4(%rbx), %edi	# MEM[(int *)_1104],
	xorl	%edx, %edx	#
	movl	$9216, %esi	#,
	xorl	%eax, %eax	#
	call	ioctl@PLT	#
# sub_avx_64_aligned.c:685:     for (int j = 0; j < MAX_EVENTS; j++)
	leaq	24+fd(%rip), %rdi	#, tmp1796
	cmpq	%rbx, %rdi	# ivtmp.541, tmp1796
	jne	.L344	#,
# sub_avx_64_aligned.c:96:     asm volatile("CPUID\n\t"
#APP
# 96 "sub_avx_64_aligned.c" 1
	CPUID
	RDTSC
	mov %edx, %r8d	# cycles_high
	mov %eax, %esi	# cycles_low
	
# 0 "" 2
# sub_avx_64_aligned.c:199:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
#NO_APP
	movslq	sub_space_ptr(%rip), %r10	# sub_space_ptr, sub_space_ptr
# sub_avx_64_aligned.c:100:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	salq	$32, %r8	#, tmp1035
# sub_avx_64_aligned.c:100:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	movl	%esi, %ecx	# cycles_low, cycles_low
# sub_avx_64_aligned.c:201:     bool is_less = is_less_than(a, b, n);
	movslq	%r14d, %rax	# n_limb.37_27, _157
# sub_avx_64_aligned.c:199:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %rdx	# sub_space, sub_space
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	movq	-1384(%rbp), %r9	# %sfp, b1_limbs
# sub_avx_64_aligned.c:100:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	orq	%rcx, %r8	# cycles_low, tmp1035
	leaq	-1(%rax), %r11	#, tmp1210
	movq	%r8, -1440(%rbp)	# tmp1035, %sfp
	andl	$7, %r11d	#, tmp1212
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	movq	(%r9), %rdi	# MEM[(uint64_t *)b1_limbs_90 + ivtmp.530_1109 * 8], tmp1799
# sub_avx_64_aligned.c:199:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%rdx,%r10,8), %rbx	#, result
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	cmpq	%rdi, (%r12)	# tmp1799, MEM[(uint64_t *)a1_limbs_88 + ivtmp.530_1109 * 8]
	jb	.L391	#,
# sub_avx_64_aligned.c:168:         else if (*(a + i) > *(b + i))
	ja	.L392	#,
# sub_avx_64_aligned.c:173:     } while (unlikely(i < n));
	movl	$1, %ecx	#, ivtmp.530
	cmpq	$1, %rax	#, _157
	ja	.L789	#,
.L729:
# sub_avx_64_aligned.c:202:     if (is_less)
	cmpb	$0, -1441(%rbp)	#, %sfp
	jne	.L393	#,
	movq	-1384(%rbp), %r10	# %sfp, b
.L345:
# sub_avx_64_aligned.c:211:     aligned_uint64_ptr borrow_array = borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %r8	# borrow_space_ptr, borrow_space_ptr
# sub_avx_64_aligned.c:211:     aligned_uint64_ptr borrow_array = borrow_space + borrow_space_ptr;
	movq	borrow_space(%rip), %r11	# borrow_space, borrow_space
# sub_avx_64_aligned.c:182:         memset(borrow_array, 0, n * sizeof(uint64_t)); // Clear the array if it's empty or has only one element
	leaq	0(,%rax,8), %rcx	#, _601
# sub_avx_64_aligned.c:211:     aligned_uint64_ptr borrow_array = borrow_space + borrow_space_ptr;
	leaq	(%r11,%r8,8), %rdi	#, borrow_array
# sub_avx_64_aligned.c:218:     for (i = 0; i < n; i += 8)
	testl	%r14d, %r14d	# n_limb.37_27
	jle	.L347	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r12), %zmm0	# MEM[(__m512i * {ref-all})a_179 + ivtmp.520_1112 * 8], tmp1803
	vpsubq	(%r10), %zmm0, %zmm3	# MEM[(__m512i * {ref-all})b_182 + ivtmp.520_1112 * 8], tmp1803, tmp1045
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:4201: 	 __builtin_ia32_pbroadcastq512_gpr_mask (__A,
	movl	$1, %r9d	#, tmp1057
	leal	-1(%r14), %esi	#, tmp1207
	shrl	$3, %esi	#, tmp1205
# sub_avx_64_aligned.c:218:     for (i = 0; i < n; i += 8)
	movl	$8, %eax	#, ivtmp.520
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k1	#, zeros, tmp1045, tmp1047
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm3, %zmm4	# tmp1045, tmp1045
	andl	$3, %esi	#, tmp1208
	vpaddq	limb_digits(%rip), %zmm3, %zmm4{%k1}	# limb_digits, tmp1045, tmp1045, tmp1047, tmp1045
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:4201: 	 __builtin_ia32_pbroadcastq512_gpr_mask (__A,
	vpbroadcastq	%r9, %zmm8{%k1}{z}	# tmp1057, tmp1056, tmp1047,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rdi)	# tmp1056, MEM[(__m512i * {ref-all})borrow_array_175 + ivtmp.520_1112 * 8]
	vmovdqa64	%zmm4, (%rbx)	# tmp1051, MEM[(__m512i * {ref-all})result_156 + ivtmp.520_1112 * 8]
# sub_avx_64_aligned.c:218:     for (i = 0; i < n; i += 8)
	cmpl	$8, %r14d	#, n_limb.37_27
	jle	.L706	#,
	testl	%esi, %esi	# tmp1208
	je	.L348	#,
	cmpl	$1, %esi	#, tmp1208
	je	.L641	#,
	cmpl	$2, %esi	#, tmp1208
	jne	.L790	#,
.L642:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r12,%rax,8), %zmm12	# MEM[(__m512i * {ref-all})a_179 + ivtmp.520_1112 * 8], tmp1872
	vpsubq	(%r10,%rax,8), %zmm12, %zmm1	# MEM[(__m512i * {ref-all})b_182 + ivtmp.520_1112 * 8], tmp1872, tmp1420
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm1, %k3	#, zeros, tmp1420, tmp1422
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm1, %zmm1{%k3}	# limb_digits, tmp1420, tmp1420, tmp1422, tmp1420
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:4201: 	 __builtin_ia32_pbroadcastq512_gpr_mask (__A,
	vpbroadcastq	%r9, %zmm13{%k3}{z}	# tmp1057, tmp1425, tmp1422,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rdi,%rax,8)	# tmp1425, MEM[(__m512i * {ref-all})borrow_array_175 + ivtmp.520_1112 * 8]
	vmovdqa64	%zmm1, (%rbx,%rax,8)	# tmp1424, MEM[(__m512i * {ref-all})result_156 + ivtmp.520_1112 * 8]
# sub_avx_64_aligned.c:218:     for (i = 0; i < n; i += 8)
	addq	$8, %rax	#, ivtmp.520
.L641:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r12,%rax,8), %zmm14	# MEM[(__m512i * {ref-all})a_179 + ivtmp.520_1112 * 8], tmp1874
	vpsubq	(%r10,%rax,8), %zmm14, %zmm15	# MEM[(__m512i * {ref-all})b_182 + ivtmp.520_1112 * 8], tmp1874, tmp1427
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k4	#, zeros, tmp1427, tmp1429
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm15, %zmm7	# tmp1427, tmp1427
	vpaddq	limb_digits(%rip), %zmm15, %zmm7{%k4}	# limb_digits, tmp1427, tmp1427, tmp1429, tmp1427
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:4201: 	 __builtin_ia32_pbroadcastq512_gpr_mask (__A,
	vpbroadcastq	%r9, %zmm2{%k4}{z}	# tmp1057, tmp1432, tmp1429,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, (%rdi,%rax,8)	# tmp1432, MEM[(__m512i * {ref-all})borrow_array_175 + ivtmp.520_1112 * 8]
	vmovdqa64	%zmm7, (%rbx,%rax,8)	# tmp1431, MEM[(__m512i * {ref-all})result_156 + ivtmp.520_1112 * 8]
# sub_avx_64_aligned.c:218:     for (i = 0; i < n; i += 8)
	addq	$8, %rax	#, ivtmp.520
	cmpl	%eax, %r14d	# ivtmp.520, n_limb.37_27
	jle	.L706	#,
.L348:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r12,%rax,8), %zmm0	# MEM[(__m512i * {ref-all})a_179 + ivtmp.520_1112 * 8], tmp1805
	vpsubq	(%r10,%rax,8), %zmm0, %zmm3	# MEM[(__m512i * {ref-all})b_182 + ivtmp.520_1112 * 8], tmp1805, tmp1277
# sub_avx_64_aligned.c:218:     for (i = 0; i < n; i += 8)
	leaq	8(%rax), %rdx	#, tmp1209
	leaq	16(%rax), %r8	#, ivtmp.520
	leaq	24(%rax), %r11	#, ivtmp.520
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k5	#, zeros, tmp1277, tmp1279
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm3, %zmm4	# tmp1277, tmp1277
	vpaddq	limb_digits(%rip), %zmm3, %zmm4{%k5}	# limb_digits, tmp1277, tmp1277, tmp1279, tmp1277
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:4201: 	 __builtin_ia32_pbroadcastq512_gpr_mask (__A,
	vpbroadcastq	%r9, %zmm8{%k5}{z}	# tmp1057, tmp1282, tmp1279,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rdi,%rax,8)	# tmp1282, MEM[(__m512i * {ref-all})borrow_array_175 + ivtmp.520_1112 * 8]
	vmovdqa64	%zmm4, (%rbx,%rax,8)	# tmp1281, MEM[(__m512i * {ref-all})result_156 + ivtmp.520_1112 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r12,%rdx,8), %zmm9	# MEM[(__m512i * {ref-all})a_179 + ivtmp.520_1112 * 8], tmp1807
# sub_avx_64_aligned.c:218:     for (i = 0; i < n; i += 8)
	addq	$32, %rax	#, ivtmp.520
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r10,%rdx,8), %zmm9, %zmm1	# MEM[(__m512i * {ref-all})b_182 + ivtmp.520_1112 * 8], tmp1807, tmp1285
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm1, %k6	#, zeros, tmp1285, tmp1287
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm1, %zmm1{%k6}	# limb_digits, tmp1285, tmp1285, tmp1287, tmp1285
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:4201: 	 __builtin_ia32_pbroadcastq512_gpr_mask (__A,
	vpbroadcastq	%r9, %zmm5{%k6}{z}	# tmp1057, tmp1290, tmp1287,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, (%rdi,%rdx,8)	# tmp1290, MEM[(__m512i * {ref-all})borrow_array_175 + ivtmp.520_1112 * 8]
	vmovdqa64	%zmm1, (%rbx,%rdx,8)	# tmp1289, MEM[(__m512i * {ref-all})result_156 + ivtmp.520_1112 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r12,%r8,8), %zmm11	# MEM[(__m512i * {ref-all})a_179 + ivtmp.520_1112 * 8], tmp1809
	vpsubq	(%r10,%r8,8), %zmm11, %zmm12	# MEM[(__m512i * {ref-all})b_182 + ivtmp.520_1112 * 8], tmp1809, tmp1293
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k7	#, zeros, tmp1293, tmp1295
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm12, %zmm10	# tmp1293, tmp1293
	vpaddq	limb_digits(%rip), %zmm12, %zmm10{%k7}	# limb_digits, tmp1293, tmp1293, tmp1295, tmp1293
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:4201: 	 __builtin_ia32_pbroadcastq512_gpr_mask (__A,
	vpbroadcastq	%r9, %zmm13{%k7}{z}	# tmp1057, tmp1298, tmp1295,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rdi,%r8,8)	# tmp1298, MEM[(__m512i * {ref-all})borrow_array_175 + ivtmp.520_1112 * 8]
	vmovdqa64	%zmm10, (%rbx,%r8,8)	# tmp1297, MEM[(__m512i * {ref-all})result_156 + ivtmp.520_1112 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r12,%r11,8), %zmm14	# MEM[(__m512i * {ref-all})a_179 + ivtmp.520_1112 * 8], tmp1811
	vpsubq	(%r10,%r11,8), %zmm14, %zmm1	# MEM[(__m512i * {ref-all})b_182 + ivtmp.520_1112 * 8], tmp1811, tmp1301
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm1, %k1	#, zeros, tmp1301, tmp1303
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm1, %zmm1{%k1}	# limb_digits, tmp1301, tmp1301, tmp1303, tmp1301
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:4201: 	 __builtin_ia32_pbroadcastq512_gpr_mask (__A,
	vpbroadcastq	%r9, %zmm7{%k1}{z}	# tmp1057, tmp1306, tmp1303,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm7, (%rdi,%r11,8)	# tmp1306, MEM[(__m512i * {ref-all})borrow_array_175 + ivtmp.520_1112 * 8]
	vmovdqa64	%zmm1, (%rbx,%r11,8)	# tmp1305, MEM[(__m512i * {ref-all})result_156 + ivtmp.520_1112 * 8]
# sub_avx_64_aligned.c:218:     for (i = 0; i < n; i += 8)
	cmpl	%eax, %r14d	# ivtmp.520, n_limb.37_27
	jg	.L348	#,
.L706:
# sub_avx_64_aligned.c:180:     if (n <= 1)
	cmpl	$1, %r14d	#, n_limb.37_27
	je	.L791	#,
# sub_avx_64_aligned.c:187:     memmove(borrow_array, borrow_array + 1, (n - 1) * sizeof(uint64_t));
	leaq	-8(%rcx), %rdx	#, tmp1066
# sub_avx_64_aligned.c:187:     memmove(borrow_array, borrow_array + 1, (n - 1) * sizeof(uint64_t));
	leaq	8(%rdi), %rsi	#, tmp1067
# sub_avx_64_aligned.c:187:     memmove(borrow_array, borrow_array + 1, (n - 1) * sizeof(uint64_t));
	movq	%rcx, -1384(%rbp)	# _601, %sfp
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	vzeroupper
	call	memmove@PLT	#
# sub_avx_64_aligned.c:190:     borrow_array[n - 1] = 0;
	movq	-1384(%rbp), %r10	# %sfp, _601
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	movq	%rax, %rdi	#, borrow_array
# sub_avx_64_aligned.c:190:     borrow_array[n - 1] = 0;
	movq	$0, -8(%rax,%r10)	#, *_391
.L382:
# sub_avx_64_aligned.c:218:     for (i = 0; i < n; i += 8)
	xorl	%r12d, %r12d	# ivtmp.513
	movl	$-1, %eax	#, last_borrow_block
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:4201: 	 __builtin_ia32_pbroadcastq512_gpr_mask (__A,
	vpxor	%xmm4, %xmm4, %xmm4	# tmp1178
	movl	$1, %r9d	#, tmp1179
	jmp	.L356	#
	.p2align 4,,10
	.p2align 3
.L352:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm4, (%rdi,%r12,8)	# tmp1178, MEM[(__m512i * {ref-all})borrow_array_175 + ivtmp.513_1116 * 8]
	vmovdqa64	%zmm0, (%rbx,%r12,8)	# tmp1068, MEM[(__m512i * {ref-all})result_156 + ivtmp.513_1116 * 8]
# sub_avx_64_aligned.c:255:     for (i = 0; i < n; i += 8)
	addq	$8, %r12	#, ivtmp.513
	cmpl	%r12d, %r14d	# ivtmp.513, n_limb.37_27
	jle	.L792	#,
.L356:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rbx,%r12,8), %zmm2	# MEM[(__m512i * {ref-all})result_156 + ivtmp.513_1116 * 8], tmp1813
	vpsubq	(%rdi,%r12,8), %zmm2, %zmm0	# MEM[(__m512i * {ref-all})borrow_array_175 + ivtmp.513_1116 * 8], tmp1813, tmp1068
	movl	%r12d, %edx	# ivtmp.513, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k2	#, zeros, tmp1068, tmp1070
# sub_avx_64_aligned.c:267:         if (unlikely(borrow_mask))
	kmovw	%k2, %esi	# tmp1070, tmp1070
	testb	%sil, %sil	# tmp1070
	je	.L352	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:4201: 	 __builtin_ia32_pbroadcastq512_gpr_mask (__A,
	vpbroadcastq	%r9, %zmm3{%k2}{z}	# tmp1179, tmp1074, tmp1070,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rdi,%r12,8)	# tmp1074, MEM[(__m512i * {ref-all})borrow_array_175 + ivtmp.513_1116 * 8]
	vmovdqa64	%zmm0, (%rbx,%r12,8)	# tmp1068, MEM[(__m512i * {ref-all})result_156 + ivtmp.513_1116 * 8]
# sub_avx_64_aligned.c:255:     for (i = 0; i < n; i += 8)
	addq	$8, %r12	#, ivtmp.513
	cmpl	%r12d, %r14d	# ivtmp.513, n_limb.37_27
	jle	.L354	#,
	movl	%edx, %eax	# i, last_borrow_block
	jmp	.L356	#
	.p2align 4,,10
	.p2align 3
.L792:
# sub_avx_64_aligned.c:282:     if (unlikely(last_borrow_block != -1))
	cmpl	$-1, %eax	#, last_borrow_block
	jne	.L793	#,
.L783:
	vzeroupper
.L357:
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	movq	(%rbx), %rax	# *result_156, _246
	leaq	8(%rbx), %r8	#, ivtmp.491
# sub_avx_64_aligned.c:303:     i = 0;
	xorl	%edx, %edx	# i
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	movq	%rbx, %r14	# result, _245
	testq	%rax, %rax	# _246
	jne	.L351	#,
.L362:
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	movq	(%r8), %rax	# MEM[(uint64_t *)_1121 + -8B], _246
# sub_avx_64_aligned.c:306:         i++;
	leal	1(%rdx), %ebx	#, tmp1200
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	leaq	8(%r8), %rdi	#, tmp1201
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	movq	%r8, %r14	# ivtmp.491, _245
# sub_avx_64_aligned.c:306:         i++;
	movl	%ebx, %edx	# tmp1200, i
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	testq	%rax, %rax	# _246
	jne	.L351	#,
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	movq	8(%r8), %rax	# MEM[(uint64_t *)_1121 + -8B], _246
# sub_avx_64_aligned.c:306:         i++;
	addl	$1, %edx	#, i
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	movq	%rdi, %r14	# tmp1201, _245
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	leaq	16(%r8), %r11	#, ivtmp.491
	testq	%rax, %rax	# _246
	jne	.L351	#,
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	movq	16(%r8), %rax	# MEM[(uint64_t *)_1121 + -8B], _246
# sub_avx_64_aligned.c:306:         i++;
	leal	2(%rbx), %edx	#, i
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	movq	%r11, %r14	# ivtmp.491, _245
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	leaq	24(%r8), %rcx	#, ivtmp.491
	testq	%rax, %rax	# _246
	jne	.L351	#,
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	movq	24(%r8), %rax	# MEM[(uint64_t *)_1121 + -8B], _246
# sub_avx_64_aligned.c:306:         i++;
	leal	3(%rbx), %edx	#, i
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	movq	%rcx, %r14	# ivtmp.491, _245
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	leaq	32(%r8), %r10	#, ivtmp.491
	testq	%rax, %rax	# _246
	jne	.L351	#,
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	movq	32(%r8), %rax	# MEM[(uint64_t *)_1121 + -8B], _246
# sub_avx_64_aligned.c:306:         i++;
	leal	4(%rbx), %edx	#, i
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	movq	%r10, %r14	# ivtmp.491, _245
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	leaq	40(%r8), %r12	#, ivtmp.491
	testq	%rax, %rax	# _246
	jne	.L351	#,
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	movq	40(%r8), %rax	# MEM[(uint64_t *)_1121 + -8B], _246
# sub_avx_64_aligned.c:306:         i++;
	leal	5(%rbx), %edx	#, i
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	movq	%r12, %r14	# ivtmp.491, _245
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	leaq	48(%r8), %r9	#, ivtmp.491
	testq	%rax, %rax	# _246
	jne	.L351	#,
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	movq	48(%r8), %rax	# MEM[(uint64_t *)_1121 + -8B], _246
# sub_avx_64_aligned.c:306:         i++;
	leal	6(%rbx), %edx	#, i
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	movq	%r9, %r14	# ivtmp.491, _245
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	leaq	56(%r8), %rsi	#, ivtmp.491
	testq	%rax, %rax	# _246
	jne	.L351	#,
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	movq	56(%r8), %rax	# MEM[(uint64_t *)_1121 + -8B], _246
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	addq	$64, %r8	#, ivtmp.491
# sub_avx_64_aligned.c:306:         i++;
	leal	7(%rbx), %edx	#, i
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	movq	%rsi, %r14	# ivtmp.491, _245
# sub_avx_64_aligned.c:304:     while (result[i] <= 0)
	testq	%rax, %rax	# _246
	je	.L362	#,
	.p2align 4,,10
	.p2align 3
.L351:
# sub_avx_64_aligned.c:309:     result[i] = (is_less) ? -result[i] : result[i];
	movq	%rax, %r8	# _246, tmp1175
	negq	%r8	# tmp1175
	cmpb	$0, -1441(%rbp)	#, %sfp
	cmove	%rax, %r8	# tmp1175,, _246, _246
# sub_avx_64_aligned.c:309:     result[i] = (is_less) ? -result[i] : result[i];
	movq	%r8, (%r14)	# _246, *_249
# sub_avx_64_aligned.c:312:     *result_size = *result_size - i;
	subl	%edx, -1332(%rbp)	# i, sub_size_test1
# sub_avx_64_aligned.c:109:     asm volatile("RDTSCP\n\t"
#APP
# 109 "sub_avx_64_aligned.c" 1
	RDTSCP
	mov %edx, %edi	# cycles_high
	mov %eax, %r11d	# cycles_low
	CPUID
	
# 0 "" 2
# sub_avx_64_aligned.c:114:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
#NO_APP
	salq	$32, %rdi	#, tmp1088
# sub_avx_64_aligned.c:114:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	movl	%r11d, %ebx	# cycles_low, cycles_low
# sub_avx_64_aligned.c:114:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	leaq	fd(%rip), %r12	#, ivtmp.486
	orq	%rbx, %rdi	# cycles_low, tmp1088
	movq	%rdi, -1432(%rbp)	# tmp1088, %sfp
	.p2align 4,,10
	.p2align 3
.L365:
# sub_avx_64_aligned.c:696:         if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
	movl	(%r12), %edi	# MEM[(int *)_1128],
	xorl	%edx, %edx	#
	xorl	%eax, %eax	#
	movl	$9217, %esi	#,
	call	ioctl@PLT	#
# sub_avx_64_aligned.c:696:         if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
	cmpl	$-1, %eax	#, tmp1501
	je	.L369	#,
# sub_avx_64_aligned.c:694:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$4, %r12	#, ivtmp.486
	leaq	24+fd(%rip), %rcx	#, tmp1820
	cmpq	%r12, %rcx	# ivtmp.486, tmp1820
	jne	.L365	#,
# sub_avx_64_aligned.c:1011:         read_perf(values);
	leaq	-1136(%rbp), %rdi	#, tmp1160
	movq	%rdi, -1384(%rbp)	# tmp1160, %sfp
	call	read_perf	#
# sub_avx_64_aligned.c:1013:         if (end_rdtsc < start_rdtsc)
	movq	-1440(%rbp), %r10	# %sfp, ticks
	cmpq	%r10, -1432(%rbp)	# ticks, %sfp
	jb	.L371	#,
	movq	-1384(%rbp), %r12	# %sfp, ivtmp.458
	movq	%r13, -1392(%rbp)	# ivtmp.465, %sfp
	movq	-1368(%rbp), %rbx	# %sfp, file
	movq	-1424(%rbp), %r13	# %sfp, _1132
	movq	%r12, -1400(%rbp)	# ivtmp.458, %sfp
	.p2align 4,,10
	.p2align 3
.L367:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%r12), %rcx	# MEM[(long long int *)_1134],
	leaq	.LC17(%rip), %rdx	#,
	movq	%rbx, %rdi	# file,
	xorl	%eax, %eax	#
	movl	$1, %esi	#,
# sub_avx_64_aligned.c:674:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$8, %r12	#, ivtmp.479
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	__fprintf_chk@PLT	#
# sub_avx_64_aligned.c:674:     for (int j = 0; j < MAX_EVENTS; j++)
	cmpq	%r12, %r13	# ivtmp.479, _1132
	jne	.L367	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	-1368(%rbp), %rsi	# %sfp,
	movl	$10, %edi	#,
# sub_avx_64_aligned.c:1027:         mpz_init(b1_test1_gmp);
	leaq	-1200(%rbp), %rbx	#, tmp1172
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	-1392(%rbp), %r13	# %sfp, ivtmp.465
	movq	-1400(%rbp), %r12	# %sfp, ivtmp.458
	call	fputc@PLT	#
# sub_avx_64_aligned.c:1026:         mpz_init(a1_test1_gmp);
	leaq	-1216(%rbp), %rdi	#, tmp1171
	movq	%rdi, -1392(%rbp)	# tmp1171, %sfp
	call	__gmpz_init@PLT	#
# sub_avx_64_aligned.c:1027:         mpz_init(b1_test1_gmp);
	movq	%rbx, %rdi	# tmp1172,
	movq	%rbx, -1456(%rbp)	# tmp1172, %sfp
	call	__gmpz_init@PLT	#
# sub_avx_64_aligned.c:1028:         mpz_init(sub_gmp_test1);
	leaq	-1184(%rbp), %rdi	#, tmp1173
	movq	%rdi, -1400(%rbp)	# tmp1173, %sfp
	call	__gmpz_init@PLT	#
# sub_avx_64_aligned.c:1029:         mpz_set_str(a1_test1_gmp, a1_str_test1, 10);
	movq	-1360(%rbp), %rsi	# %sfp,
	movl	$10, %edx	#,
	movq	-1392(%rbp), %rdi	# %sfp,
	call	__gmpz_set_str@PLT	#
# sub_avx_64_aligned.c:1030:         mpz_set_str(b1_test1_gmp, b1_str_test1, 10);
	movl	$10, %edx	#,
	movq	%r15, %rsi	# str,
	movq	%rbx, %rdi	# tmp1172,
	call	__gmpz_set_str@PLT	#
# sub_avx_64_aligned.c:80:     asm volatile("CPUID\n\t"
#APP
# 80 "sub_avx_64_aligned.c" 1
	CPUID
	RDTSC
	mov %edx, %esi	# cycles_high
	mov %eax, %edi	# cycles_low
	
# 0 "" 2
# sub_avx_64_aligned.c:84:     asm volatile("RDTSCP\n\t"
# 84 "sub_avx_64_aligned.c" 1
	RDTSCP
	mov %edx, %esi	# cycles_high1
	mov %eax, %edi	# cycles_low1
	CPUID
	
# 0 "" 2
#NO_APP
	leaq	fd(%rip), %r15	#, ivtmp.472
	.p2align 4,,10
	.p2align 3
.L368:
# sub_avx_64_aligned.c:687:         ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
	movl	(%r15), %edi	# MEM[(int *)_1141],
	xorl	%edx, %edx	#
	movl	$9219, %esi	#,
	xorl	%eax, %eax	#
# sub_avx_64_aligned.c:685:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$4, %r15	#, ivtmp.472
# sub_avx_64_aligned.c:687:         ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
	call	ioctl@PLT	#
# sub_avx_64_aligned.c:688:         ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
	movl	-4(%r15), %edi	# MEM[(int *)_1141],
	xorl	%edx, %edx	#
	movl	$9216, %esi	#,
	xorl	%eax, %eax	#
	call	ioctl@PLT	#
# sub_avx_64_aligned.c:685:     for (int j = 0; j < MAX_EVENTS; j++)
	leaq	24+fd(%rip), %r9	#, tmp1827
	cmpq	%r15, %r9	# ivtmp.472, tmp1827
	jne	.L368	#,
# sub_avx_64_aligned.c:96:     asm volatile("CPUID\n\t"
#APP
# 96 "sub_avx_64_aligned.c" 1
	CPUID
	RDTSC
	mov %edx, %r8d	# cycles_high
	mov %eax, %esi	# cycles_low
	
# 0 "" 2
# sub_avx_64_aligned.c:100:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
#NO_APP
	movl	%esi, %edx	# cycles_low, cycles_low
# sub_avx_64_aligned.c:100:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	salq	$32, %r8	#, tmp1106
# sub_avx_64_aligned.c:1049:         mpz_sub(sub_gmp_test1, a1_test1_gmp, b1_test1_gmp);
	movq	-1392(%rbp), %rsi	# %sfp,
	movq	-1400(%rbp), %rdi	# %sfp,
# sub_avx_64_aligned.c:100:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	orq	%rdx, %r8	# cycles_low, tmp1106
# sub_avx_64_aligned.c:1049:         mpz_sub(sub_gmp_test1, a1_test1_gmp, b1_test1_gmp);
	movq	-1456(%rbp), %rdx	# %sfp,
# sub_avx_64_aligned.c:100:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	movq	%r8, -1360(%rbp)	# tmp1106, %sfp
# sub_avx_64_aligned.c:1049:         mpz_sub(sub_gmp_test1, a1_test1_gmp, b1_test1_gmp);
	call	__gmpz_sub@PLT	#
# sub_avx_64_aligned.c:109:     asm volatile("RDTSCP\n\t"
#APP
# 109 "sub_avx_64_aligned.c" 1
	RDTSCP
	mov %edx, %r11d	# cycles_high
	mov %eax, %r10d	# cycles_low
	CPUID
	
# 0 "" 2
# sub_avx_64_aligned.c:114:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
#NO_APP
	movq	%r11, %rbx	# cycles_high, tmp1114
# sub_avx_64_aligned.c:114:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	movl	%r10d, %eax	# cycles_low, cycles_low
# sub_avx_64_aligned.c:114:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	salq	$32, %rbx	#, tmp1114
# sub_avx_64_aligned.c:114:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	orq	%rax, %rbx	# cycles_low, ticks
	.p2align 4,,10
	.p2align 3
.L370:
# sub_avx_64_aligned.c:696:         if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
	movl	0(%r13), %edi	# MEM[(int *)_1147],
	xorl	%edx, %edx	#
	xorl	%eax, %eax	#
	movl	$9217, %esi	#,
	call	ioctl@PLT	#
# sub_avx_64_aligned.c:696:         if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
	cmpl	$-1, %eax	#, tmp1502
	je	.L369	#,
# sub_avx_64_aligned.c:694:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$4, %r13	#, ivtmp.465
	leaq	24+fd(%rip), %rcx	#, tmp1830
	cmpq	%r13, %rcx	# ivtmp.465, tmp1830
	jne	.L370	#,
# sub_avx_64_aligned.c:1059:         read_perf(values);
	movq	-1384(%rbp), %rdi	# %sfp,
	call	read_perf	#
# sub_avx_64_aligned.c:1061:         if (end_rdtsc_gmp < start_rdtsc_gmp)
	cmpq	-1360(%rbp), %rbx	# %sfp, ticks
	jb	.L371	#,
	movq	-1376(%rbp), %r13	# %sfp, file
	movq	-1424(%rbp), %r15	# %sfp, _1132
	.p2align 4,,10
	.p2align 3
.L372:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%r12), %rcx	# MEM[(long long int *)_1153],
	leaq	.LC17(%rip), %rdx	#,
	movq	%r13, %rdi	# file,
	xorl	%eax, %eax	#
	movl	$1, %esi	#,
# sub_avx_64_aligned.c:674:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$8, %r12	#, ivtmp.458
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	__fprintf_chk@PLT	#
# sub_avx_64_aligned.c:674:     for (int j = 0; j < MAX_EVENTS; j++)
	cmpq	%r12, %r15	# ivtmp.458, _1132
	jne	.L372	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	-1376(%rbp), %rsi	# %sfp,
	movl	$10, %edi	#,
	call	fputc@PLT	#
# sub_avx_64_aligned.c:1073:         char *sub_str_test1 = formatResult(sub_test1, &sub_size_test1);
	movq	%r14, %rdi	# _245,
	leaq	-1332(%rbp), %rsi	#, tmp1118
	call	formatResult	#
# sub_avx_64_aligned.c:1076:         char *sub_gmp_str_test1 = mpz_get_str(NULL, 10, sub_gmp_test1);
	movq	-1400(%rbp), %rdx	# %sfp,
	xorl	%edi, %edi	#
	movl	$10, %esi	#,
# sub_avx_64_aligned.c:1073:         char *sub_str_test1 = formatResult(sub_test1, &sub_size_test1);
	movq	%rax, %r15	# tmp1503, sub_str_test1
# sub_avx_64_aligned.c:1076:         char *sub_gmp_str_test1 = mpz_get_str(NULL, 10, sub_gmp_test1);
	call	__gmpz_get_str@PLT	#
# sub_avx_64_aligned.c:757:     if (strlen(result) != strlen(result_gmp))
	movq	%r15, %rdi	# sub_str_test1,
# sub_avx_64_aligned.c:1079:         if (!check_result(sub_str_test1, sub_gmp_str_test1, sub_size_test1))
	movl	-1332(%rbp), %r14d	# sub_size_test1, sub_size_test1.44_42
# sub_avx_64_aligned.c:1076:         char *sub_gmp_str_test1 = mpz_get_str(NULL, 10, sub_gmp_test1);
	movq	%rax, %r13	# tmp1504, sub_gmp_str_test1
# sub_avx_64_aligned.c:757:     if (strlen(result) != strlen(result_gmp))
	call	strlen@PLT	#
# sub_avx_64_aligned.c:757:     if (strlen(result) != strlen(result_gmp))
	movq	%r13, %rdi	# sub_gmp_str_test1,
# sub_avx_64_aligned.c:757:     if (strlen(result) != strlen(result_gmp))
	movq	%rax, %r12	# tmp1505, tmp1121
# sub_avx_64_aligned.c:757:     if (strlen(result) != strlen(result_gmp))
	call	strlen@PLT	#
# sub_avx_64_aligned.c:757:     if (strlen(result) != strlen(result_gmp))
	cmpq	%rax, %r12	# tmp1506, tmp1121
	jne	.L373	#,
	movslq	%r14d, %r9	# sub_size_test1.44_42, _1157
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	xorl	%r12d, %r12d	# ivtmp.447
	testl	%r14d, %r14d	# sub_size_test1.44_42
	jle	.L375	#,
	movq	%r9, %rdi	# _1157, tmp1198
	andl	$7, %edi	#, tmp1198
	je	.L378	#,
	cmpq	$1, %rdi	#, tmp1198
	je	.L622	#,
	cmpq	$2, %rdi	#, tmp1198
	je	.L623	#,
	cmpq	$3, %rdi	#, tmp1198
	je	.L624	#,
	cmpq	$4, %rdi	#, tmp1198
	je	.L625	#,
	cmpq	$5, %rdi	#, tmp1198
	je	.L626	#,
	cmpq	$6, %rdi	#, tmp1198
	jne	.L794	#,
.L627:
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	0(%r13,%r12), %r11d	# MEM[(char *)sub_gmp_str_test1_113 + ivtmp.447_1169 * 1], tmp1843
	movl	%r12d, %edx	# ivtmp.447, i
	leaq	(%r15,%r12), %r8	#, _1164
	leaq	0(%r13,%r12), %rcx	#, _1161
	cmpb	%r11b, (%r15,%r12)	# tmp1843, MEM[(char *)sub_str_test1_111 + ivtmp.447_1169 * 1]
	jne	.L710	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	addq	$1, %r12	#, ivtmp.447
.L626:
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	0(%r13,%r12), %r10d	# MEM[(char *)sub_gmp_str_test1_113 + ivtmp.447_1169 * 1], tmp1844
	movl	%r12d, %edx	# ivtmp.447, i
	leaq	(%r15,%r12), %r8	#, _1164
	leaq	0(%r13,%r12), %rcx	#, _1161
	cmpb	%r10b, (%r15,%r12)	# tmp1844, MEM[(char *)sub_str_test1_111 + ivtmp.447_1169 * 1]
	jne	.L710	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	addq	$1, %r12	#, ivtmp.447
.L625:
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	0(%r13,%r12), %eax	# MEM[(char *)sub_gmp_str_test1_113 + ivtmp.447_1169 * 1], tmp1845
	movl	%r12d, %edx	# ivtmp.447, i
	leaq	(%r15,%r12), %r8	#, _1164
	leaq	0(%r13,%r12), %rcx	#, _1161
	cmpb	%al, (%r15,%r12)	# tmp1845, MEM[(char *)sub_str_test1_111 + ivtmp.447_1169 * 1]
	jne	.L710	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	addq	$1, %r12	#, ivtmp.447
.L624:
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	0(%r13,%r12), %r14d	# MEM[(char *)sub_gmp_str_test1_113 + ivtmp.447_1169 * 1], tmp1846
	movl	%r12d, %edx	# ivtmp.447, i
	leaq	(%r15,%r12), %r8	#, _1164
	leaq	0(%r13,%r12), %rcx	#, _1161
	cmpb	%r14b, (%r15,%r12)	# tmp1846, MEM[(char *)sub_str_test1_111 + ivtmp.447_1169 * 1]
	jne	.L710	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	addq	$1, %r12	#, ivtmp.447
.L623:
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	0(%r13,%r12), %edi	# MEM[(char *)sub_gmp_str_test1_113 + ivtmp.447_1169 * 1], tmp1847
	movl	%r12d, %edx	# ivtmp.447, i
	leaq	(%r15,%r12), %r8	#, _1164
	leaq	0(%r13,%r12), %rcx	#, _1161
	cmpb	%dil, (%r15,%r12)	# tmp1847, MEM[(char *)sub_str_test1_111 + ivtmp.447_1169 * 1]
	jne	.L710	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	addq	$1, %r12	#, ivtmp.447
.L622:
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	0(%r13,%r12), %esi	# MEM[(char *)sub_gmp_str_test1_113 + ivtmp.447_1169 * 1], tmp1848
	movl	%r12d, %edx	# ivtmp.447, i
	leaq	(%r15,%r12), %r8	#, _1164
	leaq	0(%r13,%r12), %rcx	#, _1161
	cmpb	%sil, (%r15,%r12)	# tmp1848, MEM[(char *)sub_str_test1_111 + ivtmp.447_1169 * 1]
	jne	.L710	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	addq	$1, %r12	#, ivtmp.447
	cmpq	%r12, %r9	# ivtmp.447, _1157
	je	.L375	#,
.L378:
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	0(%r13,%r12), %r11d	# MEM[(char *)sub_gmp_str_test1_113 + ivtmp.447_1169 * 1], tmp1833
	movl	%r12d, %edx	# ivtmp.447, i
	leaq	(%r15,%r12), %r8	#, _1164
	leaq	0(%r13,%r12), %rcx	#, _1161
	cmpb	%r11b, (%r15,%r12)	# tmp1833, MEM[(char *)sub_str_test1_111 + ivtmp.447_1169 * 1]
	jne	.L710	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	leaq	1(%r12), %r10	#, tmp1199
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	0(%r13,%r10), %eax	# MEM[(char *)sub_gmp_str_test1_113 + ivtmp.447_1169 * 1], tmp1834
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	movq	%r10, %r12	# tmp1199, ivtmp.447
	movl	%r10d, %edx	# ivtmp.447, i
	leaq	(%r15,%r10), %r8	#, _1164
	leaq	0(%r13,%r10), %rcx	#, _1161
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	cmpb	%al, (%r15,%r10)	# tmp1834, MEM[(char *)sub_str_test1_111 + ivtmp.447_1169 * 1]
	jne	.L710	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	addq	$1, %r12	#, ivtmp.447
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	0(%r13,%r12), %r14d	# MEM[(char *)sub_gmp_str_test1_113 + ivtmp.447_1169 * 1], tmp1849
	movl	%r12d, %edx	# ivtmp.447, i
	leaq	(%r15,%r12), %r8	#, _1164
	leaq	0(%r13,%r12), %rcx	#, _1161
	cmpb	%r14b, (%r15,%r12)	# tmp1849, MEM[(char *)sub_str_test1_111 + ivtmp.447_1169 * 1]
	jne	.L710	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	leaq	2(%r10), %r12	#, ivtmp.447
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	2(%r13,%r10), %edi	# MEM[(char *)sub_gmp_str_test1_113 + ivtmp.447_1169 * 1], tmp1850
	movl	%r12d, %edx	# ivtmp.447, i
	leaq	(%r15,%r12), %r8	#, _1164
	leaq	0(%r13,%r12), %rcx	#, _1161
	cmpb	%dil, 2(%r15,%r10)	# tmp1850, MEM[(char *)sub_str_test1_111 + ivtmp.447_1169 * 1]
	jne	.L710	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	leaq	3(%r10), %r12	#, ivtmp.447
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	3(%r13,%r10), %esi	# MEM[(char *)sub_gmp_str_test1_113 + ivtmp.447_1169 * 1], tmp1851
	movl	%r12d, %edx	# ivtmp.447, i
	leaq	(%r15,%r12), %r8	#, _1164
	leaq	0(%r13,%r12), %rcx	#, _1161
	cmpb	%sil, 3(%r15,%r10)	# tmp1851, MEM[(char *)sub_str_test1_111 + ivtmp.447_1169 * 1]
	jne	.L710	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	leaq	4(%r10), %r12	#, ivtmp.447
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	4(%r13,%r10), %r11d	# MEM[(char *)sub_gmp_str_test1_113 + ivtmp.447_1169 * 1], tmp1852
	movl	%r12d, %edx	# ivtmp.447, i
	leaq	(%r15,%r12), %r8	#, _1164
	leaq	0(%r13,%r12), %rcx	#, _1161
	cmpb	%r11b, 4(%r15,%r10)	# tmp1852, MEM[(char *)sub_str_test1_111 + ivtmp.447_1169 * 1]
	jne	.L710	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	leaq	5(%r10), %r12	#, ivtmp.447
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	5(%r13,%r10), %eax	# MEM[(char *)sub_gmp_str_test1_113 + ivtmp.447_1169 * 1], tmp1853
	movl	%r12d, %edx	# ivtmp.447, i
	leaq	(%r15,%r12), %r8	#, _1164
	leaq	0(%r13,%r12), %rcx	#, _1161
	cmpb	%al, 5(%r15,%r10)	# tmp1853, MEM[(char *)sub_str_test1_111 + ivtmp.447_1169 * 1]
	jne	.L710	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	leaq	6(%r10), %r12	#, ivtmp.447
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	6(%r13,%r10), %r14d	# MEM[(char *)sub_gmp_str_test1_113 + ivtmp.447_1169 * 1], tmp1854
	movl	%r12d, %edx	# ivtmp.447, i
	leaq	(%r15,%r12), %r8	#, _1164
	leaq	0(%r13,%r12), %rcx	#, _1161
	cmpb	%r14b, 6(%r15,%r10)	# tmp1854, MEM[(char *)sub_str_test1_111 + ivtmp.447_1169 * 1]
	jne	.L710	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	leaq	7(%r10), %r12	#, ivtmp.447
	cmpq	%r12, %r9	# ivtmp.447, _1157
	jne	.L378	#,
.L375:
# sub_avx_64_aligned.c:1070:         test1_rdtsc_gmp += (end_rdtsc_gmp - start_rdtsc_gmp);
	subq	-1360(%rbp), %rbx	# %sfp, tmp1140
# sub_avx_64_aligned.c:1070:         test1_rdtsc_gmp += (end_rdtsc_gmp - start_rdtsc_gmp);
	addq	%rbx, -1472(%rbp)	# tmp1140, %sfp
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	movl	-1448(%rbp), %ebx	# %sfp, i
	leaq	.LC51(%rip), %rsi	#,
# sub_avx_64_aligned.c:1022:         test1_rdtsc += (end_rdtsc - start_rdtsc);
	movq	-1432(%rbp), %r15	# %sfp, ticks
	subq	-1440(%rbp), %r15	# %sfp, ticks
# sub_avx_64_aligned.c:1022:         test1_rdtsc += (end_rdtsc - start_rdtsc);
	addq	%r15, -1464(%rbp)	# tmp1139, %sfp
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	%ebx, %edx	# i,
# sub_avx_64_aligned.c:936:     for (int i = 0; i < ITERATIONS; i++)
	addl	$1, %ebx	#, i
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	__printf_chk@PLT	#
# sub_avx_64_aligned.c:1085:         sleep(0.1);
	xorl	%edi, %edi	#
	call	sleep@PLT	#
# sub_avx_64_aligned.c:936:     for (int i = 0; i < ITERATIONS; i++)
	movl	%ebx, -1448(%rbp)	# i, %sfp
# sub_avx_64_aligned.c:936:     for (int i = 0; i < ITERATIONS; i++)
	cmpl	$100000, %ebx	#, i
	jne	.L379	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC53(%rip), %rdi	#, tmp1143
	call	puts@PLT	#
	movq	-1472(%rbp), %r13	# %sfp, test1_rdtsc_gmp
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	movq	-1464(%rbp), %r14	# %sfp, test1_rdtsc
	leaq	.LC54(%rip), %rsi	#, tmp1144
	movq	%r13, %rcx	# test1_rdtsc_gmp,
	movq	%r14, %rdx	# test1_rdtsc,
	call	__printf_chk@PLT	#
# sub_avx_64_aligned.c:1089:     printf("RDTSC Speedup: %f\n", (double)test1_rdtsc_gmp / test1_rdtsc);
	vxorps	%xmm8, %xmm8, %xmm8	# tmp1510
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	leaq	.LC55(%rip), %rsi	#, tmp1148
# sub_avx_64_aligned.c:1089:     printf("RDTSC Speedup: %f\n", (double)test1_rdtsc_gmp / test1_rdtsc);
	vcvtusi2sdq	%r13, %xmm8, %xmm9	# test1_rdtsc_gmp, tmp1510, tmp1511
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %eax	#,
# sub_avx_64_aligned.c:1089:     printf("RDTSC Speedup: %f\n", (double)test1_rdtsc_gmp / test1_rdtsc);
	vcvtusi2sdq	%r14, %xmm8, %xmm6	# test1_rdtsc, tmp1510, tmp1512
	vdivsd	%xmm6, %xmm9, %xmm0	# tmp1146, tmp1145, tmp1147
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	__printf_chk@PLT	#
	jmp	.L320	#
	.p2align 4,,10
	.p2align 3
.L393:
	movq	%r12, %r10	# a1_limbs, b
	movq	-1384(%rbp), %r12	# %sfp, a
	jmp	.L345	#
	.p2align 4,,10
	.p2align 3
.L790:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%r12), %zmm9	# MEM[(__m512i * {ref-all})a_179 + ivtmp.520_1112 * 8], tmp1870
	vpsubq	64(%r10), %zmm9, %zmm6	# MEM[(__m512i * {ref-all})b_182 + ivtmp.520_1112 * 8], tmp1870, tmp1413
# sub_avx_64_aligned.c:218:     for (i = 0; i < n; i += 8)
	movl	$16, %eax	#, ivtmp.520
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k2	#, zeros, tmp1413, tmp1415
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm6, %zmm5	# tmp1413, tmp1413
	vpaddq	limb_digits(%rip), %zmm6, %zmm5{%k2}	# limb_digits, tmp1413, tmp1413, tmp1415, tmp1413
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:4201: 	 __builtin_ia32_pbroadcastq512_gpr_mask (__A,
	vpbroadcastq	%r9, %zmm11{%k2}{z}	# tmp1057, tmp1418, tmp1415,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, 64(%rdi)	# tmp1418, MEM[(__m512i * {ref-all})borrow_array_175 + ivtmp.520_1112 * 8]
	vmovdqa64	%zmm5, 64(%rbx)	# tmp1417, MEM[(__m512i * {ref-all})result_156 + ivtmp.520_1112 * 8]
	jmp	.L642	#
	.p2align 4,,10
	.p2align 3
.L710:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC24(%rip), %rdi	#, tmp1133
	movq	%r8, -1368(%rbp)	# _1164, %sfp
	movq	%rcx, -1360(%rbp)	# _1161, %sfp
	movl	%edx, -1352(%rbp)	# i, %sfp
	call	puts@PLT	#
	movl	-1352(%rbp), %edx	# %sfp, i
	leaq	.LC25(%rip), %rsi	#, tmp1134
	xorl	%eax, %eax	#
	movl	$1, %edi	#,
	call	__printf_chk@PLT	#
	movl	-1352(%rbp), %edx	# %sfp, i
	movl	%r12d, %r8d	# ivtmp.447,
	xorl	%eax, %eax	#
# sub_avx_64_aligned.c:770:             printf("result[%d] = %c, result_gmp[%d] = %c\n", i, result[i], i, result_gmp[i]);
	movq	-1368(%rbp), %r10	# %sfp, _1164
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	-1360(%rbp), %rsi	# %sfp, _1161
# sub_avx_64_aligned.c:770:             printf("result[%d] = %c, result_gmp[%d] = %c\n", i, result[i], i, result_gmp[i]);
	movsbl	(%r10), %edi	# *_1164, *_1164
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movsbl	(%rsi), %r9d	# *_1161,
	leaq	.LC26(%rip), %rsi	#, tmp1137
	movl	%edi, %ecx	# *_1164,
	movl	$1, %edi	#,
	call	__printf_chk@PLT	#
	movq	%r13, %rcx	# sub_gmp_str_test1,
	movq	%r15, %rdx	# sub_str_test1,
	movl	$1, %edi	#,
	leaq	.LC27(%rip), %rsi	#, tmp1138
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
.L376:
	movl	-1448(%rbp), %edx	# %sfp,
	leaq	.LC52(%rip), %rsi	#, tmp1142
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
.L320:
# sub_avx_64_aligned.c:1090: }
	movq	-56(%rbp), %rax	# D.40064, tmp1532
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp1532
	jne	.L795	#,
	leaq	-48(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r11	#
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	leaq	-8(%r11), %rsp	#,
	.cfi_def_cfa 7, 8
	ret	
	.p2align 4,,10
	.p2align 3
.L373:
	.cfi_restore_state
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC21(%rip), %rdi	#, tmp1126
	call	puts@PLT	#
# sub_avx_64_aligned.c:760:         printf("Length of result = %d, length of result_gmp = %ld\n", result_size, strlen(result_gmp));
	movq	%r13, %rdi	# sub_gmp_str_test1,
	call	strlen@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	%r14d, %edx	# sub_size_test1.44_42,
	movl	$1, %edi	#,
	leaq	.LC22(%rip), %rsi	#, tmp1130
# sub_avx_64_aligned.c:760:         printf("Length of result = %d, length of result_gmp = %ld\n", result_size, strlen(result_gmp));
	movq	%rax, %rcx	# tmp1507, tmp1128
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	movq	%r13, %rcx	# sub_gmp_str_test1,
	movq	%r15, %rdx	# sub_str_test1,
	movl	$1, %edi	#,
	leaq	.LC23(%rip), %rsi	#, tmp1131
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	jmp	.L376	#
	.p2align 4,,10
	.p2align 3
.L791:
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	%rcx, %rdx	# _601,
	xorl	%esi, %esi	#
	vzeroupper
	call	memset@PLT	#
	movq	%rax, %rdi	#, borrow_array
	jmp	.L382	#
	.p2align 4,,10
	.p2align 3
.L336:
	movl	-1352(%rbp), %edi	# %sfp,
# sub_avx_64_aligned.c:856:     if (str == NULL)
	xorl	%r12d, %r12d	# ivtmp.543
	movq	%rdi, %r11	# _12, tmp1217
	andl	$7, %r11d	#, tmp1217
	je	.L342	#,
	cmpq	$1, %r11	#, tmp1217
	je	.L613	#,
	cmpq	$2, %r11	#, tmp1217
	je	.L614	#,
	cmpq	$3, %r11	#, tmp1217
	je	.L615	#,
	cmpq	$4, %r11	#, tmp1217
	je	.L616	#,
	cmpq	$5, %r11	#, tmp1217
	je	.L617	#,
	cmpq	$6, %r11	#, tmp1217
	jne	.L796	#,
.L618:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%r12,8), %r9d	# MEM[(uint64_t *)b1_test1.30_366 + ivtmp.543_1100 * 8], tmp1897
	leal	48(%r9), %r8d	#, tmp1468
	movb	%r8b, (%r15,%r12)	# tmp1468, MEM[(char *)str_441 + ivtmp.543_1100 * 1]
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	addq	$1, %r12	#, ivtmp.543
.L617:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%r12,8), %ecx	# MEM[(uint64_t *)b1_test1.30_366 + ivtmp.543_1100 * 8], tmp1898
	leal	48(%rcx), %r14d	#, tmp1470
	movb	%r14b, (%r15,%r12)	# tmp1470, MEM[(char *)str_441 + ivtmp.543_1100 * 1]
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	addq	$1, %r12	#, ivtmp.543
.L616:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%r12,8), %esi	# MEM[(uint64_t *)b1_test1.30_366 + ivtmp.543_1100 * 8], tmp1899
	leal	48(%rsi), %r10d	#, tmp1472
	movb	%r10b, (%r15,%r12)	# tmp1472, MEM[(char *)str_441 + ivtmp.543_1100 * 1]
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	addq	$1, %r12	#, ivtmp.543
.L615:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%r12,8), %edx	# MEM[(uint64_t *)b1_test1.30_366 + ivtmp.543_1100 * 8], tmp1900
	leal	48(%rdx), %r11d	#, tmp1474
	movb	%r11b, (%r15,%r12)	# tmp1474, MEM[(char *)str_441 + ivtmp.543_1100 * 1]
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	addq	$1, %r12	#, ivtmp.543
.L614:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%r12,8), %eax	# MEM[(uint64_t *)b1_test1.30_366 + ivtmp.543_1100 * 8], tmp1901
	leal	48(%rax), %r9d	#, tmp1476
	movb	%r9b, (%r15,%r12)	# tmp1476, MEM[(char *)str_441 + ivtmp.543_1100 * 1]
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	addq	$1, %r12	#, ivtmp.543
.L613:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%r12,8), %r8d	# MEM[(uint64_t *)b1_test1.30_366 + ivtmp.543_1100 * 8], tmp1902
	leal	48(%r8), %ecx	#, tmp1478
	movb	%cl, (%r15,%r12)	# tmp1478, MEM[(char *)str_441 + ivtmp.543_1100 * 1]
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	addq	$1, %r12	#, ivtmp.543
	cmpq	%r12, %rdi	# ivtmp.543, _1095
	je	.L387	#,
.L342:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%r12,8), %r14d	# MEM[(uint64_t *)b1_test1.30_366 + ivtmp.543_1100 * 8], tmp1785
	leal	48(%r14), %esi	#, tmp1017
	movb	%sil, (%r15,%r12)	# tmp1017, MEM[(char *)str_441 + ivtmp.543_1100 * 1]
	movzbl	8(%rbx,%r12,8), %r10d	# MEM[(uint64_t *)b1_test1.30_366 + ivtmp.543_1100 * 8], tmp1786
	leal	48(%r10), %edx	#, tmp1250
	movb	%dl, 1(%r15,%r12)	# tmp1250, MEM[(char *)str_441 + ivtmp.543_1100 * 1]
	movzbl	16(%rbx,%r12,8), %r11d	# MEM[(uint64_t *)b1_test1.30_366 + ivtmp.543_1100 * 8], tmp1787
	leal	48(%r11), %eax	#, tmp1253
	movb	%al, 2(%r15,%r12)	# tmp1253, MEM[(char *)str_441 + ivtmp.543_1100 * 1]
	movzbl	24(%rbx,%r12,8), %r9d	# MEM[(uint64_t *)b1_test1.30_366 + ivtmp.543_1100 * 8], tmp1788
	leal	48(%r9), %r8d	#, tmp1256
	movb	%r8b, 3(%r15,%r12)	# tmp1256, MEM[(char *)str_441 + ivtmp.543_1100 * 1]
	movzbl	32(%rbx,%r12,8), %ecx	# MEM[(uint64_t *)b1_test1.30_366 + ivtmp.543_1100 * 8], tmp1789
	leal	48(%rcx), %r14d	#, tmp1259
	movb	%r14b, 4(%r15,%r12)	# tmp1259, MEM[(char *)str_441 + ivtmp.543_1100 * 1]
	movzbl	40(%rbx,%r12,8), %esi	# MEM[(uint64_t *)b1_test1.30_366 + ivtmp.543_1100 * 8], tmp1790
	leal	48(%rsi), %r10d	#, tmp1262
	movb	%r10b, 5(%r15,%r12)	# tmp1262, MEM[(char *)str_441 + ivtmp.543_1100 * 1]
	movzbl	48(%rbx,%r12,8), %edx	# MEM[(uint64_t *)b1_test1.30_366 + ivtmp.543_1100 * 8], tmp1791
	leal	48(%rdx), %r11d	#, tmp1265
	movb	%r11b, 6(%r15,%r12)	# tmp1265, MEM[(char *)str_441 + ivtmp.543_1100 * 1]
	movzbl	56(%rbx,%r12,8), %eax	# MEM[(uint64_t *)b1_test1.30_366 + ivtmp.543_1100 * 8], tmp1792
	leal	48(%rax), %r9d	#, tmp1268
	movb	%r9b, 7(%r15,%r12)	# tmp1268, MEM[(char *)str_441 + ivtmp.543_1100 * 1]
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	addq	$8, %r12	#, ivtmp.543
	cmpq	%r12, %rdi	# ivtmp.543, _1095
	jne	.L342	#,
	jmp	.L387	#
	.p2align 4,,10
	.p2align 3
.L328:
	movl	-1352(%rbp), %ecx	# %sfp,
	xorl	%eax, %eax	# ivtmp.558
	movq	%rcx, %r11	#,
	andl	$7, %r11d	#, tmp1222
	je	.L730	#,
	cmpq	$1, %r11	#, tmp1222
	je	.L607	#,
	cmpq	$2, %r11	#, tmp1222
	je	.L608	#,
	cmpq	$3, %r11	#, tmp1222
	je	.L609	#,
	cmpq	$4, %r11	#, tmp1222
	je	.L610	#,
	cmpq	$5, %r11	#, tmp1222
	je	.L611	#,
	cmpq	$6, %r11	#, tmp1222
	jne	.L797	#,
.L612:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%rax,8), %edx	# MEM[(uint64_t *)a1_test1.28_19 + ivtmp.558_1073 * 8], tmp1905
	movq	-1360(%rbp), %rdi	# %sfp, str
	addl	$48, %edx	#, tmp1482
	movb	%dl, (%rdi,%rax)	# tmp1482, MEM[(char *)str_370 + ivtmp.558_1073 * 1]
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	addq	$1, %rax	#, ivtmp.558
.L611:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%rax,8), %r11d	# MEM[(uint64_t *)a1_test1.28_19 + ivtmp.558_1073 * 8], tmp1907
	movq	-1360(%rbp), %r15	# %sfp, str
	addl	$48, %r11d	#, tmp1484
	movb	%r11b, (%r15,%rax)	# tmp1484, MEM[(char *)str_370 + ivtmp.558_1073 * 1]
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	addq	$1, %rax	#, ivtmp.558
.L610:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%rax,8), %edx	# MEM[(uint64_t *)a1_test1.28_19 + ivtmp.558_1073 * 8], tmp1909
	movq	-1360(%rbp), %rdi	# %sfp, str
	addl	$48, %edx	#, tmp1486
	movb	%dl, (%rdi,%rax)	# tmp1486, MEM[(char *)str_370 + ivtmp.558_1073 * 1]
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	addq	$1, %rax	#, ivtmp.558
.L609:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%rax,8), %r11d	# MEM[(uint64_t *)a1_test1.28_19 + ivtmp.558_1073 * 8], tmp1911
	movq	-1360(%rbp), %r15	# %sfp, str
	addl	$48, %r11d	#, tmp1488
	movb	%r11b, (%r15,%rax)	# tmp1488, MEM[(char *)str_370 + ivtmp.558_1073 * 1]
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	addq	$1, %rax	#, ivtmp.558
.L608:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%rax,8), %edx	# MEM[(uint64_t *)a1_test1.28_19 + ivtmp.558_1073 * 8], tmp1913
	movq	-1360(%rbp), %rdi	# %sfp, str
	addl	$48, %edx	#, tmp1490
	movb	%dl, (%rdi,%rax)	# tmp1490, MEM[(char *)str_370 + ivtmp.558_1073 * 1]
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	addq	$1, %rax	#, ivtmp.558
.L607:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%rax,8), %r11d	# MEM[(uint64_t *)a1_test1.28_19 + ivtmp.558_1073 * 8], tmp1915
	movq	-1360(%rbp), %rdx	# %sfp, str
	addl	$48, %r11d	#, tmp1492
	movq	%rdx, %r15	# str, str
	movb	%r11b, (%rdx,%rax)	# tmp1492, MEM[(char *)str_370 + ivtmp.558_1073 * 1]
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	addq	$1, %rax	#, ivtmp.558
	cmpq	%rax, %rcx	# ivtmp.558, _1068
	je	.L335	#,
.L334:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%rax,8), %edi	# MEM[(uint64_t *)a1_test1.28_19 + ivtmp.558_1073 * 8], tmp1730
	addl	$48, %edi	#, tmp881
	movb	%dil, (%r15,%rax)	# tmp881, MEM[(char *)str_370 + ivtmp.558_1073 * 1]
	movzbl	8(%rbx,%rax,8), %r11d	# MEM[(uint64_t *)a1_test1.28_19 + ivtmp.558_1073 * 8], tmp1731
	addl	$48, %r11d	#, tmp1226
	movb	%r11b, 1(%r15,%rax)	# tmp1226, MEM[(char *)str_370 + ivtmp.558_1073 * 1]
	movzbl	16(%rbx,%rax,8), %edx	# MEM[(uint64_t *)a1_test1.28_19 + ivtmp.558_1073 * 8], tmp1732
	addl	$48, %edx	#, tmp1229
	movb	%dl, 2(%r15,%rax)	# tmp1229, MEM[(char *)str_370 + ivtmp.558_1073 * 1]
	movzbl	24(%rbx,%rax,8), %edi	# MEM[(uint64_t *)a1_test1.28_19 + ivtmp.558_1073 * 8], tmp1733
	addl	$48, %edi	#, tmp1232
	movb	%dil, 3(%r15,%rax)	# tmp1232, MEM[(char *)str_370 + ivtmp.558_1073 * 1]
	movzbl	32(%rbx,%rax,8), %r11d	# MEM[(uint64_t *)a1_test1.28_19 + ivtmp.558_1073 * 8], tmp1734
	addl	$48, %r11d	#, tmp1235
	movb	%r11b, 4(%r15,%rax)	# tmp1235, MEM[(char *)str_370 + ivtmp.558_1073 * 1]
	movzbl	40(%rbx,%rax,8), %edx	# MEM[(uint64_t *)a1_test1.28_19 + ivtmp.558_1073 * 8], tmp1735
	addl	$48, %edx	#, tmp1238
	movb	%dl, 5(%r15,%rax)	# tmp1238, MEM[(char *)str_370 + ivtmp.558_1073 * 1]
	movzbl	48(%rbx,%rax,8), %edi	# MEM[(uint64_t *)a1_test1.28_19 + ivtmp.558_1073 * 8], tmp1736
	addl	$48, %edi	#, tmp1241
	movb	%dil, 6(%r15,%rax)	# tmp1241, MEM[(char *)str_370 + ivtmp.558_1073 * 1]
	movzbl	56(%rbx,%rax,8), %r11d	# MEM[(uint64_t *)a1_test1.28_19 + ivtmp.558_1073 * 8], tmp1737
	addl	$48, %r11d	#, tmp1244
	movb	%r11b, 7(%r15,%rax)	# tmp1244, MEM[(char *)str_370 + ivtmp.558_1073 * 1]
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	addq	$8, %rax	#, ivtmp.558
	cmpq	%rax, %rcx	# ivtmp.558, _1068
	jne	.L334	#,
	jmp	.L335	#
.L794:
# sub_avx_64_aligned.c:766:         if (result[i] != result_gmp[i])
	movzbl	0(%r13), %esi	# MEM[(char *)sub_gmp_str_test1_113 + ivtmp.447_1169 * 1], tmp1842
	xorl	%edx, %edx	# i
	movq	%r15, %r8	# sub_str_test1, _1164
	movq	%r13, %rcx	# sub_gmp_str_test1, _1161
	cmpb	%sil, (%r15)	# tmp1842, MEM[(char *)sub_str_test1_111 + ivtmp.447_1169 * 1]
	jne	.L710	#,
# sub_avx_64_aligned.c:764:     for (int i = 0; i < result_size; i++)
	movl	$1, %r12d	#, ivtmp.447
	jmp	.L627	#
	.p2align 4,,10
	.p2align 3
.L786:
# sub_avx_64_aligned.c:865:     str[n] = '\0';
	movb	$0, (%rsi)	#, *_603
# sub_avx_64_aligned.c:855:     char *str = (char *)calloc(n + 1, sizeof(char));
	movq	%r12, %rdi	# _369,
	movl	$1, %esi	#,
	call	calloc@PLT	#
	movq	%rax, %r15	# tmp1509, str
# sub_avx_64_aligned.c:856:     if (str == NULL)
	testq	%rax, %rax	# str
	jne	.L387	#,
.L325:
	call	convert_digits_to_string.part.0	#
	.p2align 4,,10
	.p2align 3
.L793:
	movl	%eax, %edx	# last_borrow_block, i
	.p2align 4,,10
	.p2align 3
.L354:
# sub_avx_64_aligned.c:285:         i = (last_borrow_block + 15);
	addl	$15, %edx	#, i
# sub_avx_64_aligned.c:286:         i = (i > n - 1) ? (n - 1) : i;
	cmpl	%edx, %r14d	# i, n_limb.37_27
	jg	.L358	#,
# sub_avx_64_aligned.c:288:         for (; i >= 1; i--)
	movl	%r14d, %edx	# n_limb.37_27, n_limb.37_27
	subl	$1, %edx	#, n_limb.37_27
	je	.L783	#,
.L358:
	movslq	%edx, %rax	# i, ivtmp.499
	subl	$1, %edx	#, tmp1202
	andl	$7, %edx	#, tmp1203
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
	je	.L481	#,
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	(%rbx,%rax,8), %r14	# MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8], _558
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	LIMB_DIGITS(%rip), %rcx	# LIMB_DIGITS, LIMB_DIGITS.53_557
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	%r14, %rcx	# _558, LIMB_DIGITS.53_557
	jb	.L798	#,
.L481:
# sub_avx_64_aligned.c:288:         for (; i >= 1; i--)
	subq	$1, %rax	#, ivtmp.499
	testl	%eax, %eax	# ivtmp.499
	jle	.L783	#,
	testl	%edx, %edx	# tmp1203
	je	.L361	#,
	cmpl	$1, %edx	#, tmp1203
	je	.L635	#,
	cmpl	$2, %edx	#, tmp1203
	je	.L636	#,
	cmpl	$3, %edx	#, tmp1203
	je	.L637	#,
	cmpl	$4, %edx	#, tmp1203
	je	.L638	#,
	cmpl	$5, %edx	#, tmp1203
	je	.L639	#,
	cmpl	$6, %edx	#, tmp1203
	je	.L640	#,
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
	je	.L484	#,
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	(%rbx,%rax,8), %r11	# MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8], _558
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	LIMB_DIGITS(%rip), %r10	# LIMB_DIGITS, LIMB_DIGITS.53_557
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	%r11, %r10	# _558, LIMB_DIGITS.53_557
	jnb	.L484	#,
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	-8(%rbx,%rax,8), %r12	# MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8], tmp1856
# sub_avx_64_aligned.c:292:                 result[i] = result[i] + LIMB_DIGITS;
	addq	%r11, %r10	# _558, tmp1338
	movq	%r10, (%rbx,%rax,8)	# tmp1338, MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	leaq	-1(%r12), %r9	#, _551
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	%r9, -8(%rbx,%rax,8)	# _551, MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:295:                 if (unlikely(result[i - 1] > LIMB_DIGITS))
	cmpq	%r9, LIMB_DIGITS(%rip)	# _551, LIMB_DIGITS
	jb	.L715	#,
.L485:
# sub_avx_64_aligned.c:299:                 borrow_array[i] = 0;
	movq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
.L484:
# sub_avx_64_aligned.c:288:         for (; i >= 1; i--)
	subq	$1, %rax	#, ivtmp.499
.L640:
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
	je	.L488	#,
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	(%rbx,%rax,8), %rsi	# MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8], _558
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	LIMB_DIGITS(%rip), %rdx	# LIMB_DIGITS, LIMB_DIGITS.53_557
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	%rsi, %rdx	# _558, LIMB_DIGITS.53_557
	jnb	.L488	#,
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	-8(%rbx,%rax,8), %r14	# MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8], tmp1857
# sub_avx_64_aligned.c:292:                 result[i] = result[i] + LIMB_DIGITS;
	addq	%rsi, %rdx	# _558, tmp1343
	movq	%rdx, (%rbx,%rax,8)	# tmp1343, MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	leaq	-1(%r14), %rcx	#, _551
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	%rcx, -8(%rbx,%rax,8)	# _551, MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:295:                 if (unlikely(result[i - 1] > LIMB_DIGITS))
	cmpq	%rcx, LIMB_DIGITS(%rip)	# _551, LIMB_DIGITS
	jb	.L716	#,
.L489:
# sub_avx_64_aligned.c:299:                 borrow_array[i] = 0;
	movq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
.L488:
# sub_avx_64_aligned.c:288:         for (; i >= 1; i--)
	subq	$1, %rax	#, ivtmp.499
.L639:
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
	je	.L492	#,
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	(%rbx,%rax,8), %r8	# MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8], _558
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	LIMB_DIGITS(%rip), %r11	# LIMB_DIGITS, LIMB_DIGITS.53_557
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	%r8, %r11	# _558, LIMB_DIGITS.53_557
	jnb	.L492	#,
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	-8(%rbx,%rax,8), %r10	# MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8], tmp1858
# sub_avx_64_aligned.c:292:                 result[i] = result[i] + LIMB_DIGITS;
	addq	%r8, %r11	# _558, tmp1348
	movq	%r11, (%rbx,%rax,8)	# tmp1348, MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	leaq	-1(%r10), %r12	#, _551
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	%r12, -8(%rbx,%rax,8)	# _551, MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:295:                 if (unlikely(result[i - 1] > LIMB_DIGITS))
	cmpq	%r12, LIMB_DIGITS(%rip)	# _551, LIMB_DIGITS
	jb	.L717	#,
.L493:
# sub_avx_64_aligned.c:299:                 borrow_array[i] = 0;
	movq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
.L492:
# sub_avx_64_aligned.c:288:         for (; i >= 1; i--)
	subq	$1, %rax	#, ivtmp.499
.L638:
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
	je	.L496	#,
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	(%rbx,%rax,8), %r9	# MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8], _558
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	LIMB_DIGITS(%rip), %rsi	# LIMB_DIGITS, LIMB_DIGITS.53_557
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	%r9, %rsi	# _558, LIMB_DIGITS.53_557
	jnb	.L496	#,
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	-8(%rbx,%rax,8), %rdx	# MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8], tmp1859
# sub_avx_64_aligned.c:292:                 result[i] = result[i] + LIMB_DIGITS;
	addq	%r9, %rsi	# _558, tmp1353
	movq	%rsi, (%rbx,%rax,8)	# tmp1353, MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	leaq	-1(%rdx), %r14	#, _551
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	%r14, -8(%rbx,%rax,8)	# _551, MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:295:                 if (unlikely(result[i - 1] > LIMB_DIGITS))
	cmpq	%r14, LIMB_DIGITS(%rip)	# _551, LIMB_DIGITS
	jb	.L718	#,
.L497:
# sub_avx_64_aligned.c:299:                 borrow_array[i] = 0;
	movq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
.L496:
# sub_avx_64_aligned.c:288:         for (; i >= 1; i--)
	subq	$1, %rax	#, ivtmp.499
.L637:
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
	je	.L500	#,
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	(%rbx,%rax,8), %rcx	# MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8], _558
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	LIMB_DIGITS(%rip), %r8	# LIMB_DIGITS, LIMB_DIGITS.53_557
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	%rcx, %r8	# _558, LIMB_DIGITS.53_557
	jnb	.L500	#,
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	-8(%rbx,%rax,8), %r11	# MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8], tmp1860
# sub_avx_64_aligned.c:292:                 result[i] = result[i] + LIMB_DIGITS;
	addq	%rcx, %r8	# _558, tmp1358
	movq	%r8, (%rbx,%rax,8)	# tmp1358, MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	leaq	-1(%r11), %r10	#, _551
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	%r10, -8(%rbx,%rax,8)	# _551, MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:295:                 if (unlikely(result[i - 1] > LIMB_DIGITS))
	cmpq	%r10, LIMB_DIGITS(%rip)	# _551, LIMB_DIGITS
	jb	.L719	#,
.L501:
# sub_avx_64_aligned.c:299:                 borrow_array[i] = 0;
	movq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
.L500:
# sub_avx_64_aligned.c:288:         for (; i >= 1; i--)
	subq	$1, %rax	#, ivtmp.499
.L636:
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
	je	.L504	#,
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	(%rbx,%rax,8), %r12	# MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8], _558
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	LIMB_DIGITS(%rip), %r9	# LIMB_DIGITS, LIMB_DIGITS.53_557
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	%r12, %r9	# _558, LIMB_DIGITS.53_557
	jnb	.L504	#,
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	-8(%rbx,%rax,8), %rsi	# MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8], tmp1861
# sub_avx_64_aligned.c:292:                 result[i] = result[i] + LIMB_DIGITS;
	addq	%r12, %r9	# _558, tmp1363
	movq	%r9, (%rbx,%rax,8)	# tmp1363, MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	leaq	-1(%rsi), %rdx	#, _551
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	%rdx, -8(%rbx,%rax,8)	# _551, MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:295:                 if (unlikely(result[i - 1] > LIMB_DIGITS))
	cmpq	%rdx, LIMB_DIGITS(%rip)	# _551, LIMB_DIGITS
	jb	.L720	#,
.L505:
# sub_avx_64_aligned.c:299:                 borrow_array[i] = 0;
	movq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
.L504:
# sub_avx_64_aligned.c:288:         for (; i >= 1; i--)
	subq	$1, %rax	#, ivtmp.499
.L635:
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
	je	.L508	#,
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	(%rbx,%rax,8), %r14	# MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8], _558
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	LIMB_DIGITS(%rip), %rcx	# LIMB_DIGITS, LIMB_DIGITS.53_557
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	%r14, %rcx	# _558, LIMB_DIGITS.53_557
	jnb	.L508	#,
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	-8(%rbx,%rax,8), %r8	# MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8], tmp1862
# sub_avx_64_aligned.c:292:                 result[i] = result[i] + LIMB_DIGITS;
	addq	%r14, %rcx	# _558, tmp1368
	movq	%rcx, (%rbx,%rax,8)	# tmp1368, MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	leaq	-1(%r8), %r11	#, _551
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	%r11, -8(%rbx,%rax,8)	# _551, MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:295:                 if (unlikely(result[i - 1] > LIMB_DIGITS))
	cmpq	%r11, LIMB_DIGITS(%rip)	# _551, LIMB_DIGITS
	jb	.L721	#,
.L509:
# sub_avx_64_aligned.c:299:                 borrow_array[i] = 0;
	movq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
.L508:
# sub_avx_64_aligned.c:288:         for (; i >= 1; i--)
	subq	$1, %rax	#, ivtmp.499
	testl	%eax, %eax	# ivtmp.499
	jle	.L783	#,
.L361:
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
	je	.L359	#,
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	(%rbx,%rax,8), %r10	# MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8], _558
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	LIMB_DIGITS(%rip), %r12	# LIMB_DIGITS, LIMB_DIGITS.53_557
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	%r10, %r12	# _558, LIMB_DIGITS.53_557
	jnb	.L359	#,
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	-8(%rbx,%rax,8), %r9	# MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8], tmp1816
# sub_avx_64_aligned.c:292:                 result[i] = result[i] + LIMB_DIGITS;
	addq	%r10, %r12	# _558, tmp1083
	movq	%r12, (%rbx,%rax,8)	# tmp1083, MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	leaq	-1(%r9), %rsi	#, _551
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	%rsi, -8(%rbx,%rax,8)	# _551, MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:295:                 if (unlikely(result[i - 1] > LIMB_DIGITS))
	cmpq	%rsi, LIMB_DIGITS(%rip)	# _551, LIMB_DIGITS
	jb	.L799	#,
.L360:
# sub_avx_64_aligned.c:299:                 borrow_array[i] = 0;
	movq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
.L359:
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	$0, -8(%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:288:         for (; i >= 1; i--)
	leaq	-1(%rax), %rdx	#, tmp1204
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	je	.L512	#,
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	(%rbx,%rdx,8), %r14	# MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8], _558
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	LIMB_DIGITS(%rip), %rax	# LIMB_DIGITS, LIMB_DIGITS.53_557
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	%r14, %rax	# _558, LIMB_DIGITS.53_557
	jnb	.L512	#,
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	-8(%rbx,%rdx,8), %rcx	# MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8], tmp1863
# sub_avx_64_aligned.c:292:                 result[i] = result[i] + LIMB_DIGITS;
	addq	%r14, %rax	# _558, tmp1373
	movq	%rax, (%rbx,%rdx,8)	# tmp1373, MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	subq	$1, %rcx	#, _551
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	%rcx, -8(%rbx,%rdx,8)	# _551, MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:295:                 if (unlikely(result[i - 1] > LIMB_DIGITS))
	cmpq	%rcx, LIMB_DIGITS(%rip)	# _551, LIMB_DIGITS
	jb	.L722	#,
.L513:
# sub_avx_64_aligned.c:299:                 borrow_array[i] = 0;
	movq	$0, (%rdi,%rdx,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
.L512:
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	$0, -8(%rdi,%rdx,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:288:         for (; i >= 1; i--)
	leaq	-1(%rdx), %r8	#, ivtmp.499
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	je	.L515	#,
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	(%rbx,%r8,8), %r11	# MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8], _558
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	LIMB_DIGITS(%rip), %r10	# LIMB_DIGITS, LIMB_DIGITS.53_557
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	%r11, %r10	# _558, LIMB_DIGITS.53_557
	jnb	.L515	#,
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	-8(%rbx,%r8,8), %r12	# MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8], tmp1864
# sub_avx_64_aligned.c:292:                 result[i] = result[i] + LIMB_DIGITS;
	addq	%r11, %r10	# _558, tmp1379
	movq	%r10, (%rbx,%r8,8)	# tmp1379, MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	subq	$1, %r12	#, _551
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	%r12, -8(%rbx,%r8,8)	# _551, MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:295:                 if (unlikely(result[i - 1] > LIMB_DIGITS))
	cmpq	%r12, LIMB_DIGITS(%rip)	# _551, LIMB_DIGITS
	jb	.L723	#,
.L516:
# sub_avx_64_aligned.c:299:                 borrow_array[i] = 0;
	movq	$0, (%rdi,%r8,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
.L515:
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	$0, -16(%rdi,%rdx,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:288:         for (; i >= 1; i--)
	leaq	-2(%rdx), %r9	#, ivtmp.499
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	je	.L518	#,
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	(%rbx,%r9,8), %rsi	# MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8], _558
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	LIMB_DIGITS(%rip), %r14	# LIMB_DIGITS, LIMB_DIGITS.53_557
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	%rsi, %r14	# _558, LIMB_DIGITS.53_557
	jnb	.L518	#,
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	-8(%rbx,%r9,8), %rax	# MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8], tmp1865
# sub_avx_64_aligned.c:292:                 result[i] = result[i] + LIMB_DIGITS;
	addq	%rsi, %r14	# _558, tmp1385
	movq	%r14, (%rbx,%r9,8)	# tmp1385, MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	subq	$1, %rax	#, _551
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	%rax, -8(%rbx,%r9,8)	# _551, MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:295:                 if (unlikely(result[i - 1] > LIMB_DIGITS))
	cmpq	%rax, LIMB_DIGITS(%rip)	# _551, LIMB_DIGITS
	jb	.L724	#,
.L519:
# sub_avx_64_aligned.c:299:                 borrow_array[i] = 0;
	movq	$0, (%rdi,%r9,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
.L518:
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	$0, -24(%rdi,%rdx,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:288:         for (; i >= 1; i--)
	leaq	-3(%rdx), %r8	#, ivtmp.499
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	je	.L521	#,
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	(%rbx,%r8,8), %r11	# MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8], _558
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	LIMB_DIGITS(%rip), %rcx	# LIMB_DIGITS, LIMB_DIGITS.53_557
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	%r11, %rcx	# _558, LIMB_DIGITS.53_557
	jnb	.L521	#,
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	-8(%rbx,%r8,8), %r10	# MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8], tmp1866
# sub_avx_64_aligned.c:292:                 result[i] = result[i] + LIMB_DIGITS;
	addq	%r11, %rcx	# _558, tmp1391
	movq	%rcx, (%rbx,%r8,8)	# tmp1391, MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	subq	$1, %r10	#, _551
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	%r10, -8(%rbx,%r8,8)	# _551, MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:295:                 if (unlikely(result[i - 1] > LIMB_DIGITS))
	cmpq	%r10, LIMB_DIGITS(%rip)	# _551, LIMB_DIGITS
	jb	.L725	#,
.L522:
# sub_avx_64_aligned.c:299:                 borrow_array[i] = 0;
	movq	$0, (%rdi,%r8,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
.L521:
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	$0, -32(%rdi,%rdx,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:288:         for (; i >= 1; i--)
	leaq	-4(%rdx), %r12	#, ivtmp.499
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	je	.L524	#,
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	(%rbx,%r12,8), %r9	# MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8], _558
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	LIMB_DIGITS(%rip), %rsi	# LIMB_DIGITS, LIMB_DIGITS.53_557
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	%r9, %rsi	# _558, LIMB_DIGITS.53_557
	jnb	.L524	#,
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	-8(%rbx,%r12,8), %r14	# MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8], tmp1867
# sub_avx_64_aligned.c:292:                 result[i] = result[i] + LIMB_DIGITS;
	addq	%r9, %rsi	# _558, tmp1397
	movq	%rsi, (%rbx,%r12,8)	# tmp1397, MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	subq	$1, %r14	#, _551
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	%r14, -8(%rbx,%r12,8)	# _551, MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:295:                 if (unlikely(result[i - 1] > LIMB_DIGITS))
	cmpq	%r14, LIMB_DIGITS(%rip)	# _551, LIMB_DIGITS
	jb	.L726	#,
.L525:
# sub_avx_64_aligned.c:299:                 borrow_array[i] = 0;
	movq	$0, (%rdi,%r12,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
.L524:
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	$0, -40(%rdi,%rdx,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:288:         for (; i >= 1; i--)
	leaq	-5(%rdx), %rax	#, ivtmp.499
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	je	.L527	#,
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	(%rbx,%rax,8), %r8	# MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8], _558
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	LIMB_DIGITS(%rip), %r11	# LIMB_DIGITS, LIMB_DIGITS.53_557
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	%r8, %r11	# _558, LIMB_DIGITS.53_557
	jnb	.L527	#,
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	-8(%rbx,%rax,8), %rcx	# MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8], tmp1868
# sub_avx_64_aligned.c:292:                 result[i] = result[i] + LIMB_DIGITS;
	addq	%r8, %r11	# _558, tmp1403
	movq	%r11, (%rbx,%rax,8)	# tmp1403, MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	subq	$1, %rcx	#, _551
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	%rcx, -8(%rbx,%rax,8)	# _551, MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:295:                 if (unlikely(result[i - 1] > LIMB_DIGITS))
	cmpq	%rcx, LIMB_DIGITS(%rip)	# _551, LIMB_DIGITS
	jb	.L727	#,
.L528:
# sub_avx_64_aligned.c:299:                 borrow_array[i] = 0;
	movq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
.L527:
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	$0, -48(%rdi,%rdx,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:288:         for (; i >= 1; i--)
	leaq	-6(%rdx), %r10	#, ivtmp.499
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	je	.L530	#,
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	(%rbx,%r10,8), %r12	# MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8], _558
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	movq	LIMB_DIGITS(%rip), %r9	# LIMB_DIGITS, LIMB_DIGITS.53_557
# sub_avx_64_aligned.c:290:             if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
	cmpq	%r12, %r9	# _558, LIMB_DIGITS.53_557
	jnb	.L530	#,
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	-8(%rbx,%r10,8), %rsi	# MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8], tmp1869
# sub_avx_64_aligned.c:292:                 result[i] = result[i] + LIMB_DIGITS;
	addq	%r12, %r9	# _558, tmp1409
	movq	%r9, (%rbx,%r10,8)	# tmp1409, MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	subq	$1, %rsi	#, _551
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	%rsi, -8(%rbx,%r10,8)	# _551, MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:295:                 if (unlikely(result[i - 1] > LIMB_DIGITS))
	cmpq	%rsi, LIMB_DIGITS(%rip)	# _551, LIMB_DIGITS
	jb	.L728	#,
.L531:
# sub_avx_64_aligned.c:299:                 borrow_array[i] = 0;
	movq	$0, (%rdi,%r10,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
.L530:
# sub_avx_64_aligned.c:288:         for (; i >= 1; i--)
	leaq	-7(%rdx), %rax	#, ivtmp.499
	testl	%eax, %eax	# ivtmp.499
	jg	.L361	#,
	jmp	.L783	#
	.p2align 4,,10
	.p2align 3
.L789:
	testq	%r11, %r11	# tmp1212
	je	.L760	#,
	cmpq	$1, %r11	#, tmp1212
	je	.L644	#,
	cmpq	$2, %r11	#, tmp1212
	je	.L645	#,
	cmpq	$3, %r11	#, tmp1212
	je	.L646	#,
	cmpq	$4, %r11	#, tmp1212
	je	.L647	#,
	cmpq	$5, %r11	#, tmp1212
	je	.L648	#,
	cmpq	$6, %r11	#, tmp1212
	je	.L649	#,
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	movq	-1384(%rbp), %r8	# %sfp, b1_limbs
	movq	8(%r8), %rsi	# MEM[(uint64_t *)b1_limbs_90 + ivtmp.530_1109 * 8], tmp1877
	cmpq	%rsi, 8(%r12)	# tmp1877, MEM[(uint64_t *)a1_limbs_88 + ivtmp.530_1109 * 8]
	jb	.L391	#,
# sub_avx_64_aligned.c:168:         else if (*(a + i) > *(b + i))
	ja	.L392	#,
# sub_avx_64_aligned.c:173:     } while (unlikely(i < n));
	addq	$1, %rcx	#, ivtmp.530
.L649:
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	movq	-1384(%rbp), %r10	# %sfp, b1_limbs
	movq	(%r10,%rcx,8), %rdx	# MEM[(uint64_t *)b1_limbs_90 + ivtmp.530_1109 * 8], tmp1879
	cmpq	%rdx, (%r12,%rcx,8)	# tmp1879, MEM[(uint64_t *)a1_limbs_88 + ivtmp.530_1109 * 8]
	jb	.L391	#,
# sub_avx_64_aligned.c:168:         else if (*(a + i) > *(b + i))
	ja	.L392	#,
# sub_avx_64_aligned.c:173:     } while (unlikely(i < n));
	addq	$1, %rcx	#, ivtmp.530
.L648:
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	movq	-1384(%rbp), %r11	# %sfp, b1_limbs
	movq	(%r11,%rcx,8), %r9	# MEM[(uint64_t *)b1_limbs_90 + ivtmp.530_1109 * 8], tmp1881
	cmpq	%r9, (%r12,%rcx,8)	# tmp1881, MEM[(uint64_t *)a1_limbs_88 + ivtmp.530_1109 * 8]
	jb	.L391	#,
# sub_avx_64_aligned.c:168:         else if (*(a + i) > *(b + i))
	ja	.L392	#,
# sub_avx_64_aligned.c:173:     } while (unlikely(i < n));
	addq	$1, %rcx	#, ivtmp.530
.L647:
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	movq	-1384(%rbp), %rdi	# %sfp, b1_limbs
	movq	(%rdi,%rcx,8), %r8	# MEM[(uint64_t *)b1_limbs_90 + ivtmp.530_1109 * 8], tmp1883
	cmpq	%r8, (%r12,%rcx,8)	# tmp1883, MEM[(uint64_t *)a1_limbs_88 + ivtmp.530_1109 * 8]
	jb	.L391	#,
# sub_avx_64_aligned.c:168:         else if (*(a + i) > *(b + i))
	ja	.L392	#,
# sub_avx_64_aligned.c:173:     } while (unlikely(i < n));
	addq	$1, %rcx	#, ivtmp.530
.L646:
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	movq	-1384(%rbp), %rsi	# %sfp, b1_limbs
	movq	(%rsi,%rcx,8), %r10	# MEM[(uint64_t *)b1_limbs_90 + ivtmp.530_1109 * 8], tmp1885
	cmpq	%r10, (%r12,%rcx,8)	# tmp1885, MEM[(uint64_t *)a1_limbs_88 + ivtmp.530_1109 * 8]
	jb	.L391	#,
# sub_avx_64_aligned.c:168:         else if (*(a + i) > *(b + i))
	ja	.L392	#,
# sub_avx_64_aligned.c:173:     } while (unlikely(i < n));
	addq	$1, %rcx	#, ivtmp.530
.L645:
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	movq	-1384(%rbp), %rdx	# %sfp, b1_limbs
	movq	(%rdx,%rcx,8), %r11	# MEM[(uint64_t *)b1_limbs_90 + ivtmp.530_1109 * 8], tmp1887
	cmpq	%r11, (%r12,%rcx,8)	# tmp1887, MEM[(uint64_t *)a1_limbs_88 + ivtmp.530_1109 * 8]
	jb	.L391	#,
# sub_avx_64_aligned.c:168:         else if (*(a + i) > *(b + i))
	ja	.L392	#,
# sub_avx_64_aligned.c:173:     } while (unlikely(i < n));
	addq	$1, %rcx	#, ivtmp.530
.L644:
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	movq	-1384(%rbp), %r9	# %sfp, b1_limbs
	movq	(%r9,%rcx,8), %rdi	# MEM[(uint64_t *)b1_limbs_90 + ivtmp.530_1109 * 8], tmp1889
	cmpq	%rdi, (%r12,%rcx,8)	# tmp1889, MEM[(uint64_t *)a1_limbs_88 + ivtmp.530_1109 * 8]
	jb	.L391	#,
# sub_avx_64_aligned.c:168:         else if (*(a + i) > *(b + i))
	ja	.L392	#,
# sub_avx_64_aligned.c:173:     } while (unlikely(i < n));
	addq	$1, %rcx	#, ivtmp.530
	cmpq	%rcx, %rax	# ivtmp.530, _157
	jbe	.L729	#,
.L760:
	movq	-1384(%rbp), %r8	# %sfp, b1_limbs
.L346:
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	movq	(%r8,%rcx,8), %rsi	# MEM[(uint64_t *)b1_limbs_90 + ivtmp.530_1109 * 8], tmp1800
	cmpq	%rsi, (%r12,%rcx,8)	# tmp1800, MEM[(uint64_t *)a1_limbs_88 + ivtmp.530_1109 * 8]
	jb	.L391	#,
# sub_avx_64_aligned.c:168:         else if (*(a + i) > *(b + i))
	ja	.L392	#,
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	movq	8(%r8,%rcx,8), %rdx	# MEM[(uint64_t *)b1_limbs_90 + ivtmp.530_1109 * 8], tmp1801
# sub_avx_64_aligned.c:173:     } while (unlikely(i < n));
	leaq	1(%rcx), %r10	#, tmp1213
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	cmpq	%rdx, 8(%r12,%rcx,8)	# tmp1801, MEM[(uint64_t *)a1_limbs_88 + ivtmp.530_1109 * 8]
	jb	.L391	#,
# sub_avx_64_aligned.c:168:         else if (*(a + i) > *(b + i))
	ja	.L392	#,
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	movq	16(%r8,%rcx,8), %r11	# MEM[(uint64_t *)b1_limbs_90 + ivtmp.530_1109 * 8], tmp1890
	cmpq	%r11, 16(%r12,%rcx,8)	# tmp1890, MEM[(uint64_t *)a1_limbs_88 + ivtmp.530_1109 * 8]
	jb	.L391	#,
# sub_avx_64_aligned.c:168:         else if (*(a + i) > *(b + i))
	ja	.L392	#,
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	movq	24(%r8,%rcx,8), %r9	# MEM[(uint64_t *)b1_limbs_90 + ivtmp.530_1109 * 8], tmp1891
	cmpq	%r9, 24(%r12,%rcx,8)	# tmp1891, MEM[(uint64_t *)a1_limbs_88 + ivtmp.530_1109 * 8]
	jb	.L391	#,
# sub_avx_64_aligned.c:168:         else if (*(a + i) > *(b + i))
	ja	.L392	#,
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	movq	32(%r8,%rcx,8), %rdi	# MEM[(uint64_t *)b1_limbs_90 + ivtmp.530_1109 * 8], tmp1892
	cmpq	%rdi, 32(%r12,%rcx,8)	# tmp1892, MEM[(uint64_t *)a1_limbs_88 + ivtmp.530_1109 * 8]
	jb	.L391	#,
# sub_avx_64_aligned.c:168:         else if (*(a + i) > *(b + i))
	ja	.L392	#,
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	movq	32(%r8,%r10,8), %rcx	# MEM[(uint64_t *)b1_limbs_90 + ivtmp.530_1109 * 8], tmp1893
	cmpq	%rcx, 32(%r12,%r10,8)	# tmp1893, MEM[(uint64_t *)a1_limbs_88 + ivtmp.530_1109 * 8]
	jb	.L391	#,
# sub_avx_64_aligned.c:168:         else if (*(a + i) > *(b + i))
	ja	.L392	#,
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	movq	40(%r8,%r10,8), %rsi	# MEM[(uint64_t *)b1_limbs_90 + ivtmp.530_1109 * 8], tmp1894
	cmpq	%rsi, 40(%r12,%r10,8)	# tmp1894, MEM[(uint64_t *)a1_limbs_88 + ivtmp.530_1109 * 8]
	jb	.L391	#,
# sub_avx_64_aligned.c:168:         else if (*(a + i) > *(b + i))
	ja	.L392	#,
# sub_avx_64_aligned.c:164:         if (*(a + i) < *(b + i))
	movq	48(%r8,%r10,8), %rdx	# MEM[(uint64_t *)b1_limbs_90 + ivtmp.530_1109 * 8], tmp1895
	cmpq	%rdx, 48(%r12,%r10,8)	# tmp1895, MEM[(uint64_t *)a1_limbs_88 + ivtmp.530_1109 * 8]
	jb	.L391	#,
# sub_avx_64_aligned.c:168:         else if (*(a + i) > *(b + i))
	ja	.L392	#,
# sub_avx_64_aligned.c:173:     } while (unlikely(i < n));
	leaq	7(%r10), %rcx	#, ivtmp.530
	cmpq	%rcx, %rax	# ivtmp.530, _157
	jbe	.L729	#,
	jmp	.L346	#
	.p2align 4,,10
	.p2align 3
.L390:
# sub_avx_64_aligned.c:856:     if (str == NULL)
	xorl	%r10d, %r10d	# tmp.385
	xorl	%r12d, %r12d	# niters_vector_mult_vf.363
	jmp	.L337	#
.L389:
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	xorl	%r11d, %r11d	#
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	xorl	%eax, %eax	# tmp.427
	jmp	.L329	#
.L788:
	vzeroupper
	jmp	.L340	#
.L787:
	vzeroupper
	jmp	.L332	#
.L391:
	movq	%r12, %r10	# a1_limbs, b
# sub_avx_64_aligned.c:166:             return true;
	movb	$1, -1441(%rbp)	#, %sfp
	movq	-1384(%rbp), %r12	# %sfp, a
	jmp	.L345	#
.L392:
# sub_avx_64_aligned.c:170:             return false;
	movb	$0, -1441(%rbp)	#, %sfp
	movq	-1384(%rbp), %r10	# %sfp, b
	jmp	.L345	#
.L796:
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	movzbl	(%rbx), %eax	# MEM[(uint64_t *)b1_test1.30_366 + ivtmp.543_1100 * 8], tmp1896
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	movl	$1, %r12d	#, ivtmp.543
# sub_avx_64_aligned.c:863:         str[i] = digits[i] + '0';
	addl	$48, %eax	#, tmp1466
	movb	%al, (%r15)	# tmp1466, MEM[(char *)str_441 + ivtmp.543_1100 * 1]
	jmp	.L618	#
.L797:
	movzbl	(%rbx), %eax	# MEM[(uint64_t *)a1_test1.28_19 + ivtmp.558_1073 * 8], tmp1903
	movq	-1360(%rbp), %r15	# %sfp, str
	addl	$48, %eax	#, tmp1480
	movb	%al, (%r15)	# tmp1480, MEM[(char *)str_370 + ivtmp.558_1073 * 1]
# sub_avx_64_aligned.c:861:     for (int i = 0; i < n; i++)
	movl	$1, %eax	#, ivtmp.558
	jmp	.L612	#
.L798:
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	-8(%rbx,%rax,8), %r8	# MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8], tmp1855
# sub_avx_64_aligned.c:292:                 result[i] = result[i] + LIMB_DIGITS;
	addq	%r14, %rcx	# _558, tmp1333
	movq	%rcx, (%rbx,%rax,8)	# tmp1333, MEM[(uint64_t *)result_156 + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	subq	$1, %r8	#, _551
# sub_avx_64_aligned.c:293:                 result[i - 1] = result[i - 1] - 1;
	movq	%r8, -8(%rbx,%rax,8)	# _551, MEM[(uint64_t *)result_156 + -8B + ivtmp.499_1120 * 8]
# sub_avx_64_aligned.c:295:                 if (unlikely(result[i - 1] > LIMB_DIGITS))
	cmpq	%r8, LIMB_DIGITS(%rip)	# _551, LIMB_DIGITS
	jb	.L714	#,
.L482:
# sub_avx_64_aligned.c:299:                 borrow_array[i] = 0;
	movq	$0, (%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + ivtmp.499_1120 * 8]
	jmp	.L481	#
	.p2align 4,,10
	.p2align 3
.L347:
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	%rcx, %rdx	# _601,
	xorl	%esi, %esi	#
	call	memset@PLT	#
	jmp	.L357	#
.L730:
	movq	-1360(%rbp), %r15	# %sfp, str
	jmp	.L334	#
.L779:
	vzeroupper
	jmp	.L387	#
.L777:
	vzeroupper
	jmp	.L335	#
.L369:
# sub_avx_64_aligned.c:698:             perror("Error disabling counter");
	leaq	.LC18(%rip), %rdi	#, tmp1090
	call	perror@PLT	#
# sub_avx_64_aligned.c:699:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L721:
# sub_avx_64_aligned.c:297:                     borrow_array[i - 1] = 1;
	movq	$1, -8(%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + -8B + ivtmp.499_1120 * 8]
	jmp	.L509	#
.L722:
	movq	$1, -8(%rdi,%rdx,8)	#, MEM[(uint64_t *)borrow_array_175 + -8B + ivtmp.499_1120 * 8]
	jmp	.L513	#
.L799:
	movq	$1, -8(%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + -8B + ivtmp.499_1120 * 8]
	jmp	.L360	#
.L723:
	movq	$1, -8(%rdi,%r8,8)	#, MEM[(uint64_t *)borrow_array_175 + -8B + ivtmp.499_1120 * 8]
	jmp	.L516	#
.L725:
	movq	$1, -8(%rdi,%r8,8)	#, MEM[(uint64_t *)borrow_array_175 + -8B + ivtmp.499_1120 * 8]
	jmp	.L522	#
.L724:
	movq	$1, -8(%rdi,%r9,8)	#, MEM[(uint64_t *)borrow_array_175 + -8B + ivtmp.499_1120 * 8]
	jmp	.L519	#
.L720:
	movq	$1, -8(%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + -8B + ivtmp.499_1120 * 8]
	jmp	.L505	#
.L714:
	movq	$1, -8(%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + -8B + ivtmp.499_1120 * 8]
	jmp	.L482	#
.L728:
	movq	$1, -8(%rdi,%r10,8)	#, MEM[(uint64_t *)borrow_array_175 + -8B + ivtmp.499_1120 * 8]
	jmp	.L531	#
.L727:
	movq	$1, -8(%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + -8B + ivtmp.499_1120 * 8]
	jmp	.L528	#
.L726:
	movq	$1, -8(%rdi,%r12,8)	#, MEM[(uint64_t *)borrow_array_175 + -8B + ivtmp.499_1120 * 8]
	jmp	.L525	#
.L718:
	movq	$1, -8(%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + -8B + ivtmp.499_1120 * 8]
	jmp	.L497	#
.L716:
	movq	$1, -8(%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + -8B + ivtmp.499_1120 * 8]
	jmp	.L489	#
.L717:
	movq	$1, -8(%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + -8B + ivtmp.499_1120 * 8]
	jmp	.L493	#
.L719:
	movq	$1, -8(%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + -8B + ivtmp.499_1120 * 8]
	jmp	.L501	#
.L323:
	call	open_file.part.0	#
.L371:
# sub_avx_64_aligned.c:1015:             perror("Error in rdtsc\n");
	leaq	.LC50(%rip), %rdi	#, tmp1092
	call	perror@PLT	#
# sub_avx_64_aligned.c:1016:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L715:
# sub_avx_64_aligned.c:297:                     borrow_array[i - 1] = 1;
	movq	$1, -8(%rdi,%rax,8)	#, MEM[(uint64_t *)borrow_array_175 + -8B + ivtmp.499_1120 * 8]
	jmp	.L485	#
.L795:
# sub_avx_64_aligned.c:1090: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE5800:
	.size	run_tests, .-run_tests
	.section	.rodata.str1.8
	.align 8
.LC56:
	.string	"Usage: %s <number of bits> <core number>\n"
	.section	.rodata.str1.1
.LC57:
	.string	"sub_avx_64_aligned.c"
.LC58:
	.string	"atoi(argv[1]) > 0"
	.section	.rodata.str1.8
	.align 8
.LC59:
	.string	"Memory allocation failed for sub_space or borrow_space\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB5782:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	movq	%rsi, %rbx	# tmp140, argv
	andq	$-64, %rsp	#,
	subq	$64, %rsp	#,
# sub_avx_64_aligned.c:317: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp147
	movq	%rax, 56(%rsp)	# tmp147, D.40124
	xorl	%eax, %eax	# tmp147
# sub_avx_64_aligned.c:318:     if (argc != 3)
	cmpl	$3, %edi	#, tmp139
	je	.L801	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	(%rsi), %rdx	# *argv_15(D),
	movl	$1, %edi	#,
	leaq	.LC56(%rip), %rsi	#, tmp110
# sub_avx_64_aligned.c:321:         return 1;
	movl	$1, %r12d	#, <retval>
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	__printf_chk@PLT	#
.L800:
# sub_avx_64_aligned.c:357: }
	movq	56(%rsp), %rax	# D.40124, tmp148
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp148
	jne	.L812	#,
	leaq	-32(%rbp), %rsp	#,
	movl	%r12d, %eax	# <retval>,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
.L801:
	.cfi_restore_state
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	8(%rsi), %rdi	# MEM[(char * *)argv_15(D) + 8B], MEM[(char * *)argv_15(D) + 8B]
	movl	$10, %edx	#,
	xorl	%esi, %esi	#
	call	strtol@PLT	#
# sub_avx_64_aligned.c:324:     assert(atoi(argv[1]) > 0);
	testl	%eax, %eax	# tmp141
	jle	.L813	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	8(%rbx), %rdi	# MEM[(char * *)argv_15(D) + 8B], MEM[(char * *)argv_15(D) + 8B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
	call	strtol@PLT	#
	movq	16(%rbx), %rdi	# MEM[(char * *)argv_15(D) + 16B], MEM[(char * *)argv_15(D) + 16B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movl	%eax, NUM_BITS(%rip)	# tmp142, NUM_BITS
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	call	strtol@PLT	#
# sub_avx_64_aligned.c:331:     zeros = _mm512_set1_epi64(0);
	vpxor	%xmm2, %xmm2, %xmm2	# tmp119
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	48(%rsp), %rdi	#, tmp120
	movl	$1073741824, %edx	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movl	%eax, CORE_NO(%rip)	# tmp143, CORE_NO
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	movl	$64, %esi	#,
# sub_avx_64_aligned.c:329:     limb_digits = _mm512_set1_epi64(LIMB_DIGITS);
	movq	LIMB_DIGITS(%rip), %rax	# LIMB_DIGITS, LIMB_DIGITS.3_5
# sub_avx_64_aligned.c:331:     zeros = _mm512_set1_epi64(0);
	vmovdqa64	%zmm2, zeros(%rip)	# tmp119, zeros
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:4185:   return (__m512i)(__v8di) { __A, __A, __A, __A, __A, __A, __A, __A };
	vpbroadcastq	%rax, %zmm0	# LIMB_DIGITS.3_5, tmp117
# sub_avx_64_aligned.c:330:     minus_limb_digits = _mm512_set1_epi64(-LIMB_DIGITS);
	negq	%rax	# _8
# sub_avx_64_aligned.c:329:     limb_digits = _mm512_set1_epi64(LIMB_DIGITS);
	vmovdqa64	%zmm0, limb_digits(%rip)	# tmp117, limb_digits
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:4185:   return (__m512i)(__v8di) { __A, __A, __A, __A, __A, __A, __A, __A };
	vpbroadcastq	%rax, %zmm1	# _8, tmp118
# sub_avx_64_aligned.c:330:     minus_limb_digits = _mm512_set1_epi64(-LIMB_DIGITS);
	vmovdqa64	%zmm1, minus_limb_digits(%rip)	# tmp118, minus_limb_digits
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	vzeroupper
	call	posix_memalign@PLT	#
	testl	%eax, %eax	# tmp144
	jne	.L804	#,
	movq	48(%rsp), %r14	# D.40114, _66
	leaq	40(%rsp), %rdi	#, tmp121
	movl	$1073741824, %edx	#,
	movl	$64, %esi	#,
# sub_avx_64_aligned.c:337:     sub_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	%r14, sub_space(%rip)	# _66, sub_space
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	call	posix_memalign@PLT	#
	movl	%eax, %r12d	# tmp145, <retval>
	testl	%eax, %eax	# <retval>
	jne	.L805	#,
	movq	40(%rsp), %r13	# D.40108, _54
# sub_avx_64_aligned.c:338:     borrow_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	%r13, borrow_space(%rip)	# _54, borrow_space
# sub_avx_64_aligned.c:340:     if (sub_space == NULL || borrow_space == NULL)
	testq	%r14, %r14	# _66
	je	.L808	#,
	testq	%r13, %r13	# _54
	je	.L808	#,
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	xorl	%esi, %esi	#
	movq	%r14, %rdi	# _66,
	movl	$1073741824, %edx	#,
# sub_avx_64_aligned.c:347:     sub_space_ptr = 0;
	movl	$0, sub_space_ptr(%rip)	#, sub_space_ptr
# sub_avx_64_aligned.c:348:     borrow_space_ptr = 0;
	movl	$0, borrow_space_ptr(%rip)	#, borrow_space_ptr
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	call	memset@PLT	#
	movl	$1073741824, %edx	#,
	xorl	%esi, %esi	#
	movq	%r13, %rdi	# _54,
	call	memset@PLT	#
# sub_avx_64_aligned.c:354:     run_tests();
	xorl	%eax, %eax	#
	call	run_tests	#
# sub_avx_64_aligned.c:356:     return 0;
	jmp	.L800	#
.L804:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	40(%rsp), %rdi	#, tmp137
	movl	$1073741824, %edx	#,
	movl	$64, %esi	#,
# sub_avx_64_aligned.c:337:     sub_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	$0, sub_space(%rip)	#, sub_space
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	call	posix_memalign@PLT	#
	testl	%eax, %eax	# tmp146
	je	.L814	#,
.L805:
# sub_avx_64_aligned.c:338:     borrow_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	$0, borrow_space(%rip)	#, borrow_space
.L808:
# sub_avx_64_aligned.c:342:         perror("Memory allocation failed for sub_space or borrow_space\n");
	leaq	.LC59(%rip), %rdi	#, tmp126
	call	perror@PLT	#
# sub_avx_64_aligned.c:343:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L813:
# sub_avx_64_aligned.c:324:     assert(atoi(argv[1]) > 0);
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	#, tmp112
	movl	$324, %edx	#,
	leaq	.LC57(%rip), %rsi	#, tmp113
	leaq	.LC58(%rip), %rdi	#, tmp114
	call	__assert_fail@PLT	#
.L812:
# sub_avx_64_aligned.c:357: }
	call	__stack_chk_fail@PLT	#
.L814:
# sub_avx_64_aligned.c:338:     borrow_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	40(%rsp), %rdx	# D.40108, D.40108
	movq	%rdx, borrow_space(%rip)	# D.40108, borrow_space
	jmp	.L808	#
	.cfi_endproc
.LFE5782:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 5
__PRETTY_FUNCTION__.0:
	.string	"main"
	.globl	event_names
	.section	.rodata.str1.1
.LC60:
	.string	"PERF_COUNT_HW_CPU_CYCLES"
	.section	.rodata.str1.8
	.align 8
.LC61:
	.string	"PERF_COUNT_HW_USER_INSTRUCTIONS"
	.align 8
.LC62:
	.string	"PERF_COUNT_HW_KERNEL_INSTRUCTIONS"
	.section	.rodata.str1.1
.LC63:
	.string	"PERF_COUNT_SW_PAGE_FAULTS"
.LC64:
	.string	"PERF_COUNT_L1D_CACHE_READS"
	.section	.rodata.str1.8
	.align 8
.LC65:
	.string	"PERF_COUNT_L1D_CACHE_READ_MISSES"
	.section	.data.rel.local,"aw"
	.align 32
	.type	event_names, @object
	.size	event_names, 48
event_names:
	.quad	.LC60
	.quad	.LC61
	.quad	.LC62
	.quad	.LC63
	.quad	.LC64
	.quad	.LC65
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
	.globl	zeros
	.align 64
	.type	zeros, @object
	.size	zeros, 64
zeros:
	.zero	64
	.globl	minus_limb_digits
	.align 64
	.type	minus_limb_digits, @object
	.size	minus_limb_digits, 64
minus_limb_digits:
	.zero	64
	.globl	limb_digits
	.align 64
	.type	limb_digits, @object
	.size	limb_digits, 64
limb_digits:
	.zero	64
	.globl	CORE_NO
	.align 4
	.type	CORE_NO, @object
	.size	CORE_NO, 4
CORE_NO:
	.zero	4
	.globl	LIMB_DIGITS
	.data
	.align 64
	.type	LIMB_DIGITS, @object
	.size	LIMB_DIGITS, 8
LIMB_DIGITS:
	.quad	-8446744073709551616
	.globl	borrow_space_ptr
	.bss
	.align 4
	.type	borrow_space_ptr, @object
	.size	borrow_space_ptr, 4
borrow_space_ptr:
	.zero	4
	.globl	sub_space_ptr
	.align 4
	.type	sub_space_ptr, @object
	.size	sub_space_ptr, 4
sub_space_ptr:
	.zero	4
	.globl	borrow_space
	.align 64
	.type	borrow_space, @object
	.size	borrow_space, 8
borrow_space:
	.zero	8
	.globl	sub_space
	.align 64
	.type	sub_space, @object
	.size	sub_space, 8
sub_space:
	.zero	8
	.section	.rodata
	.align 64
.LC29:
	.quad	7
	.quad	6
	.quad	5
	.quad	4
	.quad	3
	.quad	2
	.quad	1
	.quad	0
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC32:
	.long	65535
	.long	65535
	.long	65535
	.long	65535
	.long	65535
	.long	65535
	.long	65535
	.long	65535
	.align 32
.LC33:
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.align 32
.LC34:
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.set	.LC35,.LC32
	.set	.LC36,.LC33
	.set	.LC37,.LC34
	.set	.LC38,.LC32
	.set	.LC39,.LC33
	.set	.LC40,.LC34
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
