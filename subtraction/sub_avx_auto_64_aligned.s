	.file	"sub_64_aligned.c"
# GNU C17 (Ubuntu 11.4.0-1ubuntu1~22.04) version 11.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mavx512f -mtune=generic -march=x86-64 -O3 -funroll-all-loops -fopt-info-vec-optimized=autovec_report.txt -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
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
# sub_64_aligned.c:608:         perror("Error opening file for writing \n");
	leaq	.LC0(%rip), %rdi	#, tmp82
# sub_64_aligned.c:602: FILE *open_file(char *filename)
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 16
# sub_64_aligned.c:608:         perror("Error opening file for writing \n");
	call	perror@PLT	#
# sub_64_aligned.c:609:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5802:
	.size	open_file.part.0, .-open_file.part.0
	.p2align 4
	.globl	perf_event_open
	.type	perf_event_open, @function
perf_event_open:
.LFB5777:
	.cfi_startproc
	endbr64	
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 16
# sub_64_aligned.c:118:     ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
	movq	%r8, %r9	# tmp95,
	xorl	%eax, %eax	#
	movl	%ecx, %r8d	# tmp94,
	movl	%edx, %ecx	# cpu,
	movl	%esi, %edx	# pid,
	movq	%rdi, %rsi	# hw_event,
	movl	$298, %edi	#,
	call	syscall@PLT	#
# sub_64_aligned.c:120: }
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 8
# sub_64_aligned.c:119:     return ret;
	cltq
# sub_64_aligned.c:120: }
	ret	
	.cfi_endproc
.LFE5777:
	.size	perf_event_open, .-perf_event_open
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"/dev/urandom"
.LC2:
	.string	"Error opening /dev/urandom"
	.section	.rodata.str1.8
	.align 8
.LC3:
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
# sub_64_aligned.c:126:     clock_gettime(CLOCK_MONOTONIC, &ts1);
	movl	$1, %edi	#,
# sub_64_aligned.c:124: {
	subq	$64, %rsp	#,
	.cfi_def_cfa_offset 80
# sub_64_aligned.c:124: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp116
	movq	%rax, 56(%rsp)	# tmp116, D.39273
	xorl	%eax, %eax	# tmp116
# sub_64_aligned.c:126:     clock_gettime(CLOCK_MONOTONIC, &ts1);
	leaq	16(%rsp), %rsi	#, tmp98
	call	clock_gettime@PLT	#
# sub_64_aligned.c:127:     clock_gettime(CLOCK_REALTIME, &ts2);
	xorl	%edi, %edi	#
	leaq	32(%rsp), %rsi	#, tmp99
	call	clock_gettime@PLT	#
# /usr/include/x86_64-linux-gnu/bits/fcntl2.h:53:       return __open_alias (__path, __oflag, __va_arg_pack ());
	xorl	%esi, %esi	#
	xorl	%eax, %eax	#
	leaq	.LC1(%rip), %rdi	#, tmp100
	call	open@PLT	#
# sub_64_aligned.c:130:     if (urandom_fd == -1)
	cmpl	$-1, %eax	#, _28
	je	.L11	#,
# /usr/include/x86_64-linux-gnu/bits/unistd.h:38:   return __glibc_fortify (read, __nbytes, sizeof (char),
	leaq	8(%rsp), %rsi	#, tmp102
	movl	$8, %edx	#,
	movl	%eax, %edi	# _28,
	movl	%eax, %ebp	# tmp112, _28
	call	read@PLT	#
# sub_64_aligned.c:138:     if (result != sizeof(urandom_value))
	cmpq	$8, %rax	#, tmp113
	jne	.L12	#,
# sub_64_aligned.c:144:     close(urandom_fd);
	movl	%ebp, %edi	# _28,
	call	close@PLT	#
# sub_64_aligned.c:146:     pid_t pid = getpid();
	call	getpid@PLT	#
# sub_64_aligned.c:147:     pid_t tid = syscall(SYS_gettid);
	movl	$186, %edi	#,
# sub_64_aligned.c:146:     pid_t pid = getpid();
	movslq	%eax, %rbp	# tmp114,
# sub_64_aligned.c:147:     pid_t tid = syscall(SYS_gettid);
	xorl	%eax, %eax	#
	call	syscall@PLT	#
	movq	%rax, %r8	#, tmp115
# sub_64_aligned.c:149:     return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
	movq	24(%rsp), %rax	# ts1.tv_nsec, ts1.tv_nsec
	xorq	40(%rsp), %rax	# ts2.tv_nsec, tmp104
# sub_64_aligned.c:149:     return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
	xorq	8(%rsp), %rax	# urandom_value, tmp106
# sub_64_aligned.c:149:     return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
	movslq	%r8d, %rdx	# tmp115, _1
# sub_64_aligned.c:149:     return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
	xorq	%rbp, %rax	# pid, tmp108
# sub_64_aligned.c:149:     return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
	xorq	%rdx, %rax	# _1, <retval>
# sub_64_aligned.c:150: }
	movq	56(%rsp), %rdx	# D.39273, tmp117
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp117
	jne	.L13	#,
	addq	$64, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbp	#
	.cfi_def_cfa_offset 8
	ret	
.L11:
	.cfi_restore_state
# sub_64_aligned.c:132:         perror("Error opening /dev/urandom");
	leaq	.LC2(%rip), %rdi	#, tmp101
	call	perror@PLT	#
# sub_64_aligned.c:133:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L13:
# sub_64_aligned.c:150: }
	call	__stack_chk_fail@PLT	#
.L12:
# sub_64_aligned.c:140:         perror("Error reading from /dev/urandom");
	leaq	.LC3(%rip), %rdi	#, tmp103
	call	perror@PLT	#
# sub_64_aligned.c:141:         close(urandom_fd);
	movl	%ebp, %edi	# _28,
	call	close@PLT	#
# sub_64_aligned.c:142:         exit(EXIT_FAILURE);
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
# sub_64_aligned.c:177:         memset(borrow_array, 0, n * sizeof(uint64_t)); // Clear the array if it's empty or has only one element
	movslq	%esi, %r12	# n, n
	salq	$3, %r12	#, _19
# sub_64_aligned.c:175:     if (n <= 1)
	cmpl	$1, %esi	#, n
	jle	.L17	#,
# sub_64_aligned.c:182:     memmove(borrow_array, borrow_array + 1, (n - 1) * sizeof(uint64_t));
	leaq	-8(%r12), %rdx	#, tmp97
# sub_64_aligned.c:182:     memmove(borrow_array, borrow_array + 1, (n - 1) * sizeof(uint64_t));
	leaq	8(%rdi), %rsi	#, tmp98
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	call	memmove@PLT	#
# sub_64_aligned.c:185:     borrow_array[n - 1] = 0;
	movq	$0, -8(%rax,%r12)	#, *_8
# sub_64_aligned.c:186: }
	popq	%r12	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L17:
	.cfi_restore_state
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	%r12, %rdx	# _19,
	xorl	%esi, %esi	#
# sub_64_aligned.c:186: }
	popq	%r12	#
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	jmp	memset@PLT	#
	.cfi_endproc
.LFE5780:
	.size	left_shift, .-left_shift
	.section	.rodata.str1.8
	.align 8
.LC4:
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
# sub_64_aligned.c:325:     int n = *length;
	movl	(%rsi), %r13d	# *length_25(D), n
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	movl	$64, %esi	#,
# sub_64_aligned.c:323: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp139
	movq	%rax, 56(%rsp)	# tmp139, D.39318
	xorl	%eax, %eax	# tmp139
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	48(%rsp), %rdi	#, tmp114
# sub_64_aligned.c:326:     int num_limbs = (n + LIMB_SIZE - 1) / LIMB_SIZE; // Calculate the number of limbs needed
	leal	18(%r13), %eax	#, tmp107
# sub_64_aligned.c:326:     int num_limbs = (n + LIMB_SIZE - 1) / LIMB_SIZE; // Calculate the number of limbs needed
	movslq	%eax, %rbx	# tmp107, tmp108
	sarl	$31, %eax	#, tmp112
	imulq	$1808407283, %rbx, %rbx	#, tmp108, tmp109
	sarq	$35, %rbx	#, tmp111
	subl	%eax, %ebx	# tmp112, num_limbs
# sub_64_aligned.c:327:     limbs = (aligned_uint64_ptr)_mm_malloc(num_limbs * sizeof(uint64_t), 64);
	movslq	%ebx, %r15	# num_limbs, num_limbs
	salq	$3, %r15	#, _3
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	movq	%r15, %rdx	# _3,
	call	posix_memalign@PLT	#
	testl	%eax, %eax	# tmp138
	je	.L31	#,
.L19:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC4(%rip), %rdi	#, tmp115
	call	puts@PLT	#
# sub_64_aligned.c:331:         exit(1);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.p2align 4,,10
	.p2align 3
.L31:
	movq	48(%rsp), %r9	# D.39300, <retval>
# sub_64_aligned.c:328:     if (limbs == NULL)
	testq	%r9, %r9	# <retval>
	je	.L19	#,
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	%r15, %rdx	# _3,
	xorl	%esi, %esi	#
	movq	%r9, %rdi	# <retval>,
	call	memset@PLT	#
# sub_64_aligned.c:335:     int k = num_limbs - 1;
	leal	-1(%rbx), %r8d	#, k
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	%rax, %r15	#, <retval>
# sub_64_aligned.c:336:     while (i >= 0)
	testl	%r13d, %r13d	# n
	jle	.L21	#,
	leal	-2(%r13), %edx	#, tmp120
# sub_64_aligned.c:340:         for (int j = 0; j < LIMB_SIZE && i >= 0; j++, i--)
	xorl	%r11d, %r11d	# j
# sub_64_aligned.c:339:         uint64_t power = 1;
	movl	$1, %r13d	#, power
# sub_64_aligned.c:338:         aligned_uint64 limb = 0;
	xorl	%esi, %esi	# limb
	movslq	%edx, %rax	# tmp120, ivtmp.109
	jmp	.L22	#
	.p2align 4,,10
	.p2align 3
.L23:
	subq	$1, %rax	#, ivtmp.109
.L22:
# sub_64_aligned.c:342:             limb += number[i] * power;
	movq	8(%r14,%rax,8), %rdi	# MEM[(uint64_t *)number_35(D) + 8B + ivtmp.109_92 * 8], tmp121
# sub_64_aligned.c:340:         for (int j = 0; j < LIMB_SIZE && i >= 0; j++, i--)
	addl	$1, %r11d	#, j
	movl	%eax, %r10d	# ivtmp.109, i
# sub_64_aligned.c:342:             limb += number[i] * power;
	imulq	%r13, %rdi	# power, tmp121
# sub_64_aligned.c:343:             power *= 10;
	leaq	0(%r13,%r13,4), %r13	#, tmp124
	addq	%r13, %r13	# power
# sub_64_aligned.c:342:             limb += number[i] * power;
	addq	%rdi, %rsi	# tmp121, limb
# sub_64_aligned.c:340:         for (int j = 0; j < LIMB_SIZE && i >= 0; j++, i--)
	cmpl	$18, %r11d	#, j
	jg	.L26	#,
	testl	%eax, %eax	# ivtmp.109
	jns	.L23	#,
.L26:
# sub_64_aligned.c:345:         limbs[k] = limb;
	movslq	%r8d, %rcx	# k, k
# sub_64_aligned.c:345:         limbs[k] = limb;
	movq	%rsi, (%r15,%rcx,8)	# limb, MEM[(uint64_t *)_102]
# sub_64_aligned.c:336:     while (i >= 0)
	testl	%r10d, %r10d	# i
	js	.L21	#,
# sub_64_aligned.c:346:         k--;
	subl	$1, %r8d	#, k
# sub_64_aligned.c:340:         for (int j = 0; j < LIMB_SIZE && i >= 0; j++, i--)
	xorl	%r11d, %r11d	# j
# sub_64_aligned.c:339:         uint64_t power = 1;
	movl	$1, %r13d	#, power
# sub_64_aligned.c:338:         aligned_uint64 limb = 0;
	xorl	%esi, %esi	# limb
	jmp	.L23	#
.L21:
# sub_64_aligned.c:348:     *length = num_limbs;
	movl	%ebx, (%r12)	# num_limbs, *length_25(D)
# sub_64_aligned.c:350: }
	movq	56(%rsp), %rax	# D.39318, tmp140
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp140
	jne	.L32	#,
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
.L32:
	.cfi_restore_state
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE5783:
	.size	returnLimbs, .-returnLimbs
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"Memory allocation failed for result_str\n"
	.section	.rodata.str1.1
.LC6:
	.string	"%lu"
.LC7:
	.string	"%019lu"
	.section	.rodata.str1.8
	.align 8
.LC8:
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
# sub_64_aligned.c:354:     char *result_str = (char *)calloc(*result_length * 25 + 1, sizeof(char)); // 25 digits + null terminator per number
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], *result_length_38(D)
	movq	%rax, 40(%rsp)	# *result_length_38(D), D.39359
	movl	(%rsi), %eax	# *result_length_38(D), *result_length_38(D)
# sub_64_aligned.c:354:     char *result_str = (char *)calloc(*result_length * 25 + 1, sizeof(char)); // 25 digits + null terminator per number
	movl	$1, %esi	#,
# sub_64_aligned.c:354:     char *result_str = (char *)calloc(*result_length * 25 + 1, sizeof(char)); // 25 digits + null terminator per number
	leal	(%rax,%rax,4), %edx	#, tmp120
# sub_64_aligned.c:354:     char *result_str = (char *)calloc(*result_length * 25 + 1, sizeof(char)); // 25 digits + null terminator per number
	leal	1(%rdx,%rdx,4), %edi	#, tmp123
# sub_64_aligned.c:354:     char *result_str = (char *)calloc(*result_length * 25 + 1, sizeof(char)); // 25 digits + null terminator per number
	movslq	%edi, %rdi	# tmp123, tmp124
	call	calloc@PLT	#
# sub_64_aligned.c:355:     if (result_str == NULL)
	testq	%rax, %rax	# result_str
	je	.L90	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:38:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	(%r14), %r8	# *result_41(D),
	movq	%rax, %rdi	# result_str,
	movq	%rax, %rbp	# tmp182, result_str
	leaq	.LC6(%rip), %rcx	#, tmp127
	xorl	%eax, %eax	#
	movl	$1, %esi	#,
# sub_64_aligned.c:382:     for (int i = 1; i < *result_length; i++)
	movl	$1, %r12d	#, ivtmp.142
	movq	%rsp, %rbx	#, tmp147
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:38:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	$-1, %rdx	#,
	call	__sprintf_chk@PLT	#
# sub_64_aligned.c:382:     for (int i = 1; i < *result_length; i++)
	cmpl	$1, 0(%r13)	#, *result_length_38(D)
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC7(%rip), %r8	#, tmp149
# sub_64_aligned.c:382:     for (int i = 1; i < *result_length; i++)
	jle	.L38	#,
.L35:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	movq	(%r14,%r12,8), %r9	# MEM[(uint64_t *)result_41(D) + ivtmp.142_89 * 8],
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
# sub_64_aligned.c:382:     for (int i = 1; i < *result_length; i++)
	leaq	1(%r12), %rcx	#, tmp152
	cmpl	%ecx, 0(%r13)	# tmp152, *result_length_38(D)
	leaq	.LC7(%rip), %r8	#, tmp149
	jle	.L38	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	movq	(%r14,%rcx,8), %r9	# MEM[(uint64_t *)result_41(D) + ivtmp.142_89 * 8],
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
# sub_64_aligned.c:382:     for (int i = 1; i < *result_length; i++)
	leaq	2(%r12), %rsi	#, ivtmp.142
	cmpl	%esi, 0(%r13)	# ivtmp.142, *result_length_38(D)
	jle	.L38	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	movq	(%r14,%rsi,8), %r9	# MEM[(uint64_t *)result_41(D) + ivtmp.142_89 * 8],
	leaq	.LC7(%rip), %r8	#, tmp149
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
# sub_64_aligned.c:382:     for (int i = 1; i < *result_length; i++)
	leaq	3(%r12), %r8	#, ivtmp.142
	cmpl	%r8d, 0(%r13)	# ivtmp.142, *result_length_38(D)
	jle	.L38	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	movq	(%r14,%r8,8), %r9	# MEM[(uint64_t *)result_41(D) + ivtmp.142_89 * 8],
	movl	$25, %ecx	#,
	movl	$1, %edx	#,
	xorl	%eax, %eax	#
	leaq	.LC7(%rip), %r8	#, tmp149
	movl	$25, %esi	#,
	movq	%rbx, %rdi	# tmp147,
# sub_64_aligned.c:382:     for (int i = 1; i < *result_length; i++)
	addq	$4, %r12	#, ivtmp.142
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	call	__snprintf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%rbx, %rsi	# tmp147,
	movq	%rbp, %rdi	# result_str,
	call	strcat@PLT	#
# sub_64_aligned.c:382:     for (int i = 1; i < *result_length; i++)
	cmpl	%r12d, 0(%r13)	# ivtmp.142, *result_length_38(D)
	leaq	.LC7(%rip), %r8	#, tmp149
	jg	.L35	#,
	.p2align 4,,10
	.p2align 3
.L38:
# sub_64_aligned.c:390:     while (result_str[i] == '0')
	xorl	%r12d, %r12d	# ivtmp.135
# sub_64_aligned.c:389:     i = 0;
	xorl	%ebx, %ebx	#
# sub_64_aligned.c:390:     while (result_str[i] == '0')
	cmpb	$48, 0(%rbp)	#, *result_str_40
	movl	$1, %r9d	#, ivtmp.135
	movq	%rbp, %r14	# result_str, _90
	jne	.L37	#,
.L36:
	cmpb	$48, 0(%rbp,%r9)	#, MEM[(char *)result_str_40 + -1B + ivtmp.135_94 * 1]
# sub_64_aligned.c:392:         i++;
	movslq	%r9d, %rbx	# ivtmp.135,
# sub_64_aligned.c:390:     while (result_str[i] == '0')
	leaq	1(%r9), %r10	#, tmp151
	movq	%r9, %r12	# ivtmp.135, ivtmp.135
	leaq	0(%rbp,%r9), %r14	#, _90
	jne	.L37	#,
	cmpb	$48, 1(%rbp,%r9)	#, MEM[(char *)result_str_40 + -1B + ivtmp.135_94 * 1]
# sub_64_aligned.c:392:         i++;
	movslq	%r10d, %rbx	# tmp151,
# sub_64_aligned.c:390:     while (result_str[i] == '0')
	leaq	2(%r9), %r11	#, ivtmp.135
	movq	%r10, %r12	# tmp151, ivtmp.135
	leaq	0(%rbp,%r10), %r14	#, _90
	jne	.L37	#,
	cmpb	$48, 2(%rbp,%r9)	#, MEM[(char *)result_str_40 + -1B + ivtmp.135_94 * 1]
# sub_64_aligned.c:392:         i++;
	movslq	%r11d, %rbx	# ivtmp.135,
# sub_64_aligned.c:390:     while (result_str[i] == '0')
	leaq	3(%r9), %rax	#, ivtmp.135
	movq	%r11, %r12	# ivtmp.135, ivtmp.135
	leaq	0(%rbp,%r11), %r14	#, _90
	jne	.L37	#,
	cmpb	$48, 3(%rbp,%r9)	#, MEM[(char *)result_str_40 + -1B + ivtmp.135_94 * 1]
# sub_64_aligned.c:392:         i++;
	movslq	%eax, %rbx	# ivtmp.135,
# sub_64_aligned.c:390:     while (result_str[i] == '0')
	leaq	4(%r9), %rdx	#, ivtmp.135
	movq	%rax, %r12	# ivtmp.135, ivtmp.135
	leaq	0(%rbp,%rax), %r14	#, _90
	jne	.L37	#,
	cmpb	$48, 4(%rbp,%r9)	#, MEM[(char *)result_str_40 + -1B + ivtmp.135_94 * 1]
# sub_64_aligned.c:392:         i++;
	movslq	%edx, %rbx	# ivtmp.135,
# sub_64_aligned.c:390:     while (result_str[i] == '0')
	leaq	5(%r9), %rdi	#, ivtmp.135
	movq	%rdx, %r12	# ivtmp.135, ivtmp.135
	leaq	0(%rbp,%rdx), %r14	#, _90
	jne	.L37	#,
	cmpb	$48, 5(%rbp,%r9)	#, MEM[(char *)result_str_40 + -1B + ivtmp.135_94 * 1]
# sub_64_aligned.c:392:         i++;
	movslq	%edi, %rbx	# ivtmp.135,
# sub_64_aligned.c:390:     while (result_str[i] == '0')
	leaq	6(%r9), %rcx	#, ivtmp.135
	movq	%rdi, %r12	# ivtmp.135, ivtmp.135
	leaq	0(%rbp,%rdi), %r14	#, _90
	jne	.L37	#,
	cmpb	$48, 6(%rbp,%r9)	#, MEM[(char *)result_str_40 + -1B + ivtmp.135_94 * 1]
# sub_64_aligned.c:392:         i++;
	movslq	%ecx, %rbx	# ivtmp.135,
# sub_64_aligned.c:390:     while (result_str[i] == '0')
	leaq	7(%r9), %rsi	#, ivtmp.135
	movq	%rcx, %r12	# ivtmp.135, ivtmp.135
	leaq	0(%rbp,%rcx), %r14	#, _90
	jne	.L37	#,
	addq	$8, %r9	#, ivtmp.135
# sub_64_aligned.c:392:         i++;
	movslq	%esi, %rbx	# ivtmp.135,
	leaq	0(%rbp,%rsi), %r14	#, _90
	movq	%rsi, %r12	# ivtmp.135, ivtmp.135
# sub_64_aligned.c:390:     while (result_str[i] == '0')
	cmpb	$48, -1(%rbp,%r9)	#, MEM[(char *)result_str_40 + -1B + ivtmp.135_94 * 1]
	je	.L36	#,
	.p2align 4,,10
	.p2align 3
.L37:
# sub_64_aligned.c:394:     if (i == strlen(result_str))
	movq	%rbp, %rdi	# result_str,
	call	strlen@PLT	#
# sub_64_aligned.c:394:     if (i == strlen(result_str))
	cmpq	%r12, %rax	# ivtmp.135, tmp132
	je	.L91	#,
# sub_64_aligned.c:401:     char *final_result = (char *)calloc(strlen(result_str) - i + 1, sizeof(char));
	leaq	1(%rax), %rdi	#, tmp135
	movl	$1, %esi	#,
	subq	%r12, %rdi	# ivtmp.135, tmp136
	call	calloc@PLT	#
	movq	%rax, %r12	# tmp185, <retval>
# sub_64_aligned.c:402:     if (final_result == NULL)
	testq	%rax, %rax	# <retval>
	je	.L41	#,
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	movzbl	(%r14), %r14d	# *prephitmp_96, _31
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	movl	$1, %r8d	#, ivtmp.127
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	addq	%rbp, %rbx	# result_str, tmp140
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	movq	%rax, %rdx	# <retval>, _104
	testb	%r14b, %r14b	# _31
	je	.L43	#,
.L42:
	leaq	1(%r8), %r9	#, tmp150
# sub_64_aligned.c:410:         final_result[j] = result_str[i];
	movb	%r14b, -1(%r12,%r8)	# _31, MEM[(char *)final_result_43 + -1B + ivtmp.127_55 * 1]
# sub_64_aligned.c:412:         j++;
	movslq	%r8d, %rdx	# ivtmp.127,
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	movzbl	-1(%rbx,%r9), %r10d	# MEM[(char *)_98 + -1B + ivtmp.127_54 * 1], _31
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	testb	%r10b, %r10b	# _31
	je	.L88	#,
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	movzbl	1(%r8,%rbx), %eax	# MEM[(char *)_98 + -1B + ivtmp.127_54 * 1], _31
# sub_64_aligned.c:410:         final_result[j] = result_str[i];
	movb	%r10b, -1(%r12,%r9)	# _31, MEM[(char *)final_result_43 + -1B + ivtmp.127_55 * 1]
# sub_64_aligned.c:412:         j++;
	movslq	%r9d, %rdx	# tmp150,
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	leaq	2(%r8), %r11	#, ivtmp.127
	testb	%al, %al	# _31
	je	.L88	#,
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	movzbl	2(%r8,%rbx), %ecx	# MEM[(char *)_98 + -1B + ivtmp.127_54 * 1], _31
# sub_64_aligned.c:410:         final_result[j] = result_str[i];
	movb	%al, 1(%r12,%r8)	# _31, MEM[(char *)final_result_43 + -1B + ivtmp.127_55 * 1]
# sub_64_aligned.c:412:         j++;
	movslq	%r11d, %rdx	# ivtmp.127,
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	leaq	3(%r8), %rdi	#, ivtmp.127
	testb	%cl, %cl	# _31
	je	.L88	#,
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	movzbl	3(%r8,%rbx), %esi	# MEM[(char *)_98 + -1B + ivtmp.127_54 * 1], _31
# sub_64_aligned.c:410:         final_result[j] = result_str[i];
	movb	%cl, 2(%r12,%r8)	# _31, MEM[(char *)final_result_43 + -1B + ivtmp.127_55 * 1]
# sub_64_aligned.c:412:         j++;
	movslq	%edi, %rdx	# ivtmp.127,
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	leaq	4(%r8), %r14	#, ivtmp.127
	testb	%sil, %sil	# _31
	je	.L88	#,
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	movzbl	4(%r8,%rbx), %r10d	# MEM[(char *)_98 + -1B + ivtmp.127_54 * 1], _31
# sub_64_aligned.c:410:         final_result[j] = result_str[i];
	movb	%sil, 3(%r12,%r8)	# _31, MEM[(char *)final_result_43 + -1B + ivtmp.127_55 * 1]
# sub_64_aligned.c:412:         j++;
	movslq	%r14d, %rdx	# ivtmp.127,
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	leaq	5(%r8), %r9	#, ivtmp.127
	testb	%r10b, %r10b	# _31
	je	.L88	#,
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	movzbl	5(%r8,%rbx), %eax	# MEM[(char *)_98 + -1B + ivtmp.127_54 * 1], _31
# sub_64_aligned.c:410:         final_result[j] = result_str[i];
	movb	%r10b, 4(%r12,%r8)	# _31, MEM[(char *)final_result_43 + -1B + ivtmp.127_55 * 1]
# sub_64_aligned.c:412:         j++;
	movslq	%r9d, %rdx	# ivtmp.127,
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	leaq	6(%r8), %r11	#, ivtmp.127
	testb	%al, %al	# _31
	je	.L88	#,
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	movzbl	6(%r8,%rbx), %ecx	# MEM[(char *)_98 + -1B + ivtmp.127_54 * 1], _31
# sub_64_aligned.c:410:         final_result[j] = result_str[i];
	movb	%al, 5(%r12,%r8)	# _31, MEM[(char *)final_result_43 + -1B + ivtmp.127_55 * 1]
# sub_64_aligned.c:412:         j++;
	movslq	%r11d, %rdx	# ivtmp.127,
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	leaq	7(%r8), %rdi	#, ivtmp.127
	testb	%cl, %cl	# _31
	je	.L88	#,
# sub_64_aligned.c:410:         final_result[j] = result_str[i];
	movb	%cl, 6(%r12,%r8)	# _31, MEM[(char *)final_result_43 + -1B + ivtmp.127_55 * 1]
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	addq	$8, %r8	#, ivtmp.127
# sub_64_aligned.c:412:         j++;
	movslq	%edi, %rdx	# ivtmp.127,
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	movzbl	-1(%rbx,%r8), %r14d	# MEM[(char *)_98 + -1B + ivtmp.127_54 * 1], _31
# sub_64_aligned.c:408:     while (result_str[i] != '\0')
	testb	%r14b, %r14b	# _31
	jne	.L42	#,
	.p2align 4,,10
	.p2align 3
.L88:
# sub_64_aligned.c:414:     final_result[j] = '\0';
	addq	%r12, %rdx	# <retval>, _104
.L43:
# sub_64_aligned.c:414:     final_result[j] = '\0';
	movb	$0, (%rdx)	#, *prephitmp_105
# sub_64_aligned.c:415:     free(result_str);
	movq	%rbp, %rdi	# result_str,
	call	free@PLT	#
# sub_64_aligned.c:416:     *result_length = strlen(final_result);
	movq	%r12, %rdi	# <retval>,
	call	strlen@PLT	#
# sub_64_aligned.c:416:     *result_length = strlen(final_result);
	movl	%eax, 0(%r13)	# tmp186, *result_length_38(D)
.L33:
# sub_64_aligned.c:418: }
	movq	40(%rsp), %rax	# D.39359, tmp188
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp188
	jne	.L92	#,
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
.L91:
	.cfi_restore_state
# sub_64_aligned.c:396:         char *temp = (char *)calloc(2, sizeof(char));
	movl	$1, %esi	#,
	movl	$2, %edi	#,
# sub_64_aligned.c:397:         temp[0] = '0';
	movl	$48, %r13d	#,
# sub_64_aligned.c:396:         char *temp = (char *)calloc(2, sizeof(char));
	call	calloc@PLT	#
# sub_64_aligned.c:397:         temp[0] = '0';
	movw	%r13w, (%rax)	#, MEM <vector(2) char> [(char *)temp_53]
# sub_64_aligned.c:396:         char *temp = (char *)calloc(2, sizeof(char));
	movq	%rax, %r12	# tmp184, <retval>
# sub_64_aligned.c:399:         return temp;
	jmp	.L33	#
.L90:
# sub_64_aligned.c:357:         perror("Memory allocation failed for result_str\n");
	leaq	.LC5(%rip), %rdi	#, tmp126
	call	perror@PLT	#
# sub_64_aligned.c:358:         exit(0);
	xorl	%edi, %edi	#
	call	exit@PLT	#
.L92:
# sub_64_aligned.c:418: }
	call	__stack_chk_fail@PLT	#
.L41:
# sub_64_aligned.c:404:         perror("Memory allocation failed for final_result\n");
	leaq	.LC8(%rip), %rdi	#, tmp138
	call	perror@PLT	#
# sub_64_aligned.c:405:         exit(0);
	xorl	%edi, %edi	#
	call	exit@PLT	#
	.cfi_endproc
.LFE5784:
	.size	formatResult, .-formatResult
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Memory allocation failed for temp\n"
	.align 8
.LC10:
	.string	"Memory reallocation failed for num2\n"
	.align 8
.LC11:
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
# sub_64_aligned.c:422:     if (*n_1 == *n_2)
	movl	(%rdx), %r15d	# *n_1_59(D), _1
# sub_64_aligned.c:422:     if (*n_1 == *n_2)
	movl	(%rcx), %r14d	# *n_2_60(D), _2
# sub_64_aligned.c:421: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp232
	movq	%rax, 56(%rsp)	# tmp232, D.39405
	xorl	%eax, %eax	# tmp232
# sub_64_aligned.c:422:     if (*n_1 == *n_2)
	cmpl	%r14d, %r15d	# _2, _1
	je	.L93	#,
	movq	%rcx, %rbx	# tmp227, n_2
# sub_64_aligned.c:428:     __builtin_assume_aligned(*num1_base, 64);
	movq	(%rdi), %r8	# *num1_base_61(D), _3
# sub_64_aligned.c:429:     __builtin_assume_aligned(*num2_base, 64);
	movq	(%rsi), %rcx	# *num2_base_62(D), _4
	movq	%rdi, %r13	# tmp224, num1_base
	movq	%rsi, %r12	# tmp225, num2_base
# sub_64_aligned.c:434:     if (n1 > n2)
	jg	.L125	#,
# sub_64_aligned.c:483:     else if (n2 > n1)
	jl	.L126	#,
.L93:
# sub_64_aligned.c:532: }
	movq	56(%rsp), %rax	# D.39405, tmp235
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp235
	jne	.L124	#,
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
.L125:
	.cfi_restore_state
# sub_64_aligned.c:438:         aligned_uint64_ptr temp = (aligned_uint64_ptr)_mm_malloc(n1 * sizeof(uint64_t), 64);
	movslq	%r15d, %r13	# _1, _1
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	24(%rsp), %rdi	#, tmp145
	movl	$64, %esi	#,
	movq	%rcx, 8(%rsp)	# _4, %sfp
# sub_64_aligned.c:438:         aligned_uint64_ptr temp = (aligned_uint64_ptr)_mm_malloc(n1 * sizeof(uint64_t), 64);
	movq	%r13, (%rsp)	# _1, %sfp
	leaq	0(,%r13,8), %r13	#, _6
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	movq	%r13, %rdx	# _6,
	call	posix_memalign@PLT	#
	movq	8(%rsp), %rcx	# %sfp, _4
	testl	%eax, %eax	# tmp228
	jne	.L97	#,
	movq	24(%rsp), %rbp	# D.39368, _105
# sub_64_aligned.c:439:         if (temp == NULL)
	testq	%rbp, %rbp	# _105
	je	.L97	#,
# sub_64_aligned.c:448:         for (int i = n2 - 1; i >= 0; i--)
	movl	%r14d, %eax	# _2, i
	subl	$1, %eax	#, i
	js	.L98	#,
# sub_64_aligned.c:451:             temp[i + n1 - n2] = num2[i];
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
# sub_64_aligned.c:451:             temp[i + n1 - n2] = num2[i];
	leaq	(%rdx,%rax,8), %r8	#, tmp160
# sub_64_aligned.c:451:             temp[i + n1 - n2] = num2[i];
	movq	%r11, %rdx	# tmp158,
	addq	%rbp, %rdi	# _105, tmp156
# sub_64_aligned.c:451:             temp[i + n1 - n2] = num2[i];
	leaq	(%rcx,%r8), %rsi	#, tmp161
# sub_64_aligned.c:451:             temp[i + n1 - n2] = num2[i];
	call	memcpy@PLT	#
.L98:
# sub_64_aligned.c:456:         for (int i = 0; i < n1 - n2; i++)
	movl	%r15d, %edi	# _1, tmp167
# sub_64_aligned.c:458:             temp[i] = 0;
	xorl	%esi, %esi	#
# sub_64_aligned.c:456:         for (int i = 0; i < n1 - n2; i++)
	subl	%r14d, %edi	# _2, tmp167
# sub_64_aligned.c:458:             temp[i] = 0;
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
	je	.L127	#,
.L99:
# sub_64_aligned.c:466:             perror("Memory reallocation failed for num2\n");
	leaq	.LC10(%rip), %rdi	#, tmp175
	call	perror@PLT	#
# sub_64_aligned.c:467:             exit(0);
	xorl	%edi, %edi	#
	call	exit@PLT	#
	.p2align 4,,10
	.p2align 3
.L97:
# sub_64_aligned.c:441:             perror("Memory allocation failed for temp\n");
	leaq	.LC9(%rip), %rdi	#, tmp146
	call	perror@PLT	#
# sub_64_aligned.c:442:             exit(0);
	xorl	%edi, %edi	#
	call	exit@PLT	#
	.p2align 4,,10
	.p2align 3
.L126:
# sub_64_aligned.c:487:         aligned_uint64_ptr temp = (aligned_uint64_ptr)_mm_malloc(n2 * sizeof(uint64_t), 64);
	movslq	%r14d, %rax	# _2, _2
	movq	%rdx, %rbp	# tmp226, n_1
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	40(%rsp), %rdi	#, tmp184
	movl	$64, %esi	#,
# sub_64_aligned.c:487:         aligned_uint64_ptr temp = (aligned_uint64_ptr)_mm_malloc(n2 * sizeof(uint64_t), 64);
	leaq	0(,%rax,8), %r12	#, _26
	movq	%r8, 8(%rsp)	# _3, %sfp
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	movq	%r12, %rdx	# _26,
# sub_64_aligned.c:487:         aligned_uint64_ptr temp = (aligned_uint64_ptr)_mm_malloc(n2 * sizeof(uint64_t), 64);
	movq	%rax, (%rsp)	# _2, %sfp
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	call	posix_memalign@PLT	#
	testl	%eax, %eax	# tmp230
	jne	.L97	#,
	movq	40(%rsp), %rbx	# D.39380, _129
# sub_64_aligned.c:488:         if (temp == NULL)
	testq	%rbx, %rbx	# _129
	je	.L97	#,
# sub_64_aligned.c:498:         for (int i = n1 - 1; i >= 0; i--)
	movl	%r15d, %eax	# _1, i
	subl	$1, %eax	#, i
	js	.L103	#,
# sub_64_aligned.c:501:             temp[i + n2 - n1] = num1[i];
	movl	%eax, %r9d	# i, _112
	movq	(%rsp), %rsi	# %sfp, _2
# sub_64_aligned.c:501:             temp[i + n2 - n1] = num1[i];
	movq	8(%rsp), %r8	# %sfp, _3
# sub_64_aligned.c:501:             temp[i + n2 - n1] = num1[i];
	cltq
	movq	%r9, %rdx	# _112, tmp187
	leaq	8(,%r9,8), %r10	#, tmp194
	negq	%rdx	# tmp187
	salq	$3, %rdx	#, tmp188
	leaq	-8(%rdx,%rsi,8), %rdi	#, tmp191
# sub_64_aligned.c:501:             temp[i + n2 - n1] = num1[i];
	leaq	(%rdx,%rax,8), %r11	#, tmp197
# sub_64_aligned.c:501:             temp[i + n2 - n1] = num1[i];
	movq	%r10, %rdx	# tmp194,
	addq	%rbx, %rdi	# _129, tmp192
# sub_64_aligned.c:501:             temp[i + n2 - n1] = num1[i];
	leaq	(%r8,%r11), %rsi	#, tmp198
# sub_64_aligned.c:501:             temp[i + n2 - n1] = num1[i];
	call	memcpy@PLT	#
.L103:
# sub_64_aligned.c:507:         for (int i = 0; i < n2 - n1; i++)
	movl	%r14d, %edi	# _2, tmp204
# sub_64_aligned.c:509:             temp[i] = 0;
	xorl	%esi, %esi	#
# sub_64_aligned.c:507:         for (int i = 0; i < n2 - n1; i++)
	subl	%r15d, %edi	# _1, tmp204
# sub_64_aligned.c:509:             temp[i] = 0;
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
	je	.L128	#,
.L104:
# sub_64_aligned.c:516:             perror("Memory reallocation failed for num1\n");
	leaq	.LC11(%rip), %rdi	#, tmp212
	call	perror@PLT	#
# sub_64_aligned.c:517:             exit(0);
	xorl	%edi, %edi	#
	call	exit@PLT	#
	.p2align 4,,10
	.p2align 3
.L127:
	movq	32(%rsp), %r14	# D.39374, _117
# sub_64_aligned.c:464:         if (num2 == NULL)
	testq	%r14, %r14	# _117
	je	.L99	#,
# sub_64_aligned.c:473:         for (int i = 0; i < n1; i++)
	testl	%r15d, %r15d	# _1
	jle	.L101	#,
# sub_64_aligned.c:475:             num2[i] = temp[i];
	movq	(%rsp), %rdx	# %sfp, _1
	movq	%rbp, %rsi	# _105,
	movq	%r14, %rdi	# _117,
	salq	$3, %rdx	#, _1
	call	memcpy@PLT	#
.L101:
# sub_64_aligned.c:478:         *n_2 = n1;
	movl	%r15d, (%rbx)	# _1, *n_2_60(D)
# sub_64_aligned.c:479:         *num2_base = num2;
	movq	%r14, (%r12)	# _117, *num2_base_62(D)
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:54:   free (__ptr);
	movq	56(%rsp), %rax	# D.39405, tmp233
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp233
	jne	.L124	#,
	movq	%rbp, %rdi	# _105,
.L123:
# sub_64_aligned.c:532: }
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
.L128:
	.cfi_restore_state
	movq	48(%rsp), %r15	# D.39386, _141
# sub_64_aligned.c:514:         if (num1 == NULL)
	testq	%r15, %r15	# _141
	je	.L104	#,
# sub_64_aligned.c:523:         for (int i = 0; i < n2; i++)
	testl	%r14d, %r14d	# _2
	jle	.L106	#,
# sub_64_aligned.c:525:             num1[i] = temp[i];
	movq	(%rsp), %rdx	# %sfp, _2
	movq	%rbx, %rsi	# _129,
	movq	%r15, %rdi	# _141,
	salq	$3, %rdx	#, _2
	call	memcpy@PLT	#
.L106:
# sub_64_aligned.c:527:         *n_1 = n2;
	movl	%r14d, 0(%rbp)	# _2, *n_1_59(D)
# sub_64_aligned.c:528:         *num1_base = num1;
	movq	%r15, 0(%r13)	# _141, *num1_base_61(D)
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:54:   free (__ptr);
	movq	56(%rsp), %rax	# D.39405, tmp234
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp234
	jne	.L124	#,
	movq	%rbx, %rdi	# _129,
	jmp	.L123	#
.L124:
# sub_64_aligned.c:532: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE5785:
	.size	make_equidistant, .-make_equidistant
	.section	.rodata.str1.1
.LC12:
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
# sub_64_aligned.c:579:     pe[3].type = PERF_TYPE_SOFTWARE;
	movabsq	$549755813889, %rdx	#, tmp181
# sub_64_aligned.c:548: {
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	fd(%rip), %r12	#, tmp168
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	leaq	pe(%rip), %rbp	#, tmp167
# sub_64_aligned.c:548: {
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	%rbp, %rdi	# tmp167, tmp114
# sub_64_aligned.c:588:     pe[5].config = PERF_COUNT_HW_CACHE_L1D | (PERF_COUNT_HW_CACHE_OP_READ << 8) | (PERF_COUNT_HW_CACHE_RESULT_MISS << 16);
	xorl	%ebx, %ebx	# ivtmp.161
# sub_64_aligned.c:548: {
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	rep stosq
# sub_64_aligned.c:579:     pe[3].type = PERF_TYPE_SOFTWARE;
	movq	%rdx, 384+pe(%rip)	# tmp181, MEM <unsigned long> [(unsigned int *)&pe + 384B]
# sub_64_aligned.c:583:     pe[4].type = PERF_TYPE_HW_CACHE;
	addq	$2, %rdx	#, tmp156
# sub_64_aligned.c:553:         pe[i].size = sizeof(struct perf_event_attr);
	movl	$128, 4+pe(%rip)	#, pe[0].size
# sub_64_aligned.c:554:         pe[i].disabled = 1;
	movb	$-59, 40+pe(%rip)	#, MEM <unsigned char> [(struct perf_event_attr *)&pe + 40B]
# sub_64_aligned.c:553:         pe[i].size = sizeof(struct perf_event_attr);
	movl	$128, 132+pe(%rip)	#, pe[1].size
	movl	$128, 260+pe(%rip)	#, pe[2].size
# sub_64_aligned.c:554:         pe[i].disabled = 1;
	movb	$-59, 424+pe(%rip)	#, MEM <unsigned char> [(struct perf_event_attr *)&pe + 424B]
	movb	$-59, 552+pe(%rip)	#, MEM <unsigned char> [(struct perf_event_attr *)&pe + 552B]
	movb	$-59, 680+pe(%rip)	#, MEM <unsigned char> [(struct perf_event_attr *)&pe + 680B]
# sub_64_aligned.c:568:     pe[1].config = PERF_COUNT_HW_INSTRUCTIONS;
	movq	$1, 136+pe(%rip)	#, pe[1].config
# sub_64_aligned.c:554:         pe[i].disabled = 1;
	movb	$-27, 168+pe(%rip)	#, MEM <unsigned char> [(struct perf_event_attr *)&pe + 168B]
# sub_64_aligned.c:574:     pe[2].config = PERF_COUNT_HW_INSTRUCTIONS;
	movq	$1, 264+pe(%rip)	#, pe[2].config
# sub_64_aligned.c:554:         pe[i].disabled = 1;
	movb	$-43, 296+pe(%rip)	#, MEM <unsigned char> [(struct perf_event_attr *)&pe + 296B]
# sub_64_aligned.c:580:     pe[3].config = PERF_COUNT_SW_PAGE_FAULTS;
	movq	$2, 392+pe(%rip)	#, pe[3].config
# sub_64_aligned.c:583:     pe[4].type = PERF_TYPE_HW_CACHE;
	movq	%rdx, 512+pe(%rip)	# tmp156, MEM <unsigned long> [(unsigned int *)&pe + 512B]
# sub_64_aligned.c:587:     pe[5].type = PERF_TYPE_HW_CACHE;
	movq	%rdx, 640+pe(%rip)	# tmp156, MEM <unsigned long> [(unsigned int *)&pe + 640B]
# sub_64_aligned.c:588:     pe[5].config = PERF_COUNT_HW_CACHE_L1D | (PERF_COUNT_HW_CACHE_OP_READ << 8) | (PERF_COUNT_HW_CACHE_RESULT_MISS << 16);
	movq	$65536, 648+pe(%rip)	#, pe[5].config
	.p2align 4,,10
	.p2align 3
.L131:
# sub_64_aligned.c:118:     ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
	movq	%rbx, %rsi	# ivtmp.161, tmp161
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	xorl	%r9d, %r9d	#
	xorl	%edx, %edx	#
	salq	$7, %rsi	#, tmp161
	movl	$-1, %r8d	#,
	movl	$298, %edi	#,
	xorl	%eax, %eax	#
	addq	%rbp, %rsi	# tmp167, tmp162
	call	syscall@PLT	#
# sub_64_aligned.c:593:         fd[i] = perf_event_open(&pe[i], 0, CORE_NO, -1, 0);
	movl	%eax, (%r12,%rbx,4)	# _36, MEM[(int *)&fd + ivtmp.161_52 * 4]
# sub_64_aligned.c:594:         if (fd[i] == -1)
	cmpl	$-1, %eax	#, _36
	je	.L134	#,
# sub_64_aligned.c:591:     for (int i = 0; i < MAX_EVENTS; i++)
	addq	$1, %rbx	#, ivtmp.161
	cmpq	$6, %rbx	#, ivtmp.161
	jne	.L131	#,
# sub_64_aligned.c:600: }
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
.L134:
	.cfi_restore_state
# sub_64_aligned.c:596:             fprintf(stderr, "Error opening event %d: %s\n", i, strerror(errno));
	call	__errno_location@PLT	#
# sub_64_aligned.c:596:             fprintf(stderr, "Error opening event %d: %s\n", i, strerror(errno));
	movl	(%rax), %edi	# *_3,
	call	strerror@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	# stderr,
	movl	%ebx, %ecx	# i,
	leaq	.LC12(%rip), %rdx	#, tmp166
# sub_64_aligned.c:596:             fprintf(stderr, "Error opening event %d: %s\n", i, strerror(errno));
	movq	%rax, %r8	#, tmp178
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$1, %esi	#,
	xorl	%eax, %eax	#
	call	__fprintf_chk@PLT	#
# sub_64_aligned.c:597:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5786:
	.size	initialize_perf, .-initialize_perf
	.section	.rodata.str1.1
.LC13:
	.string	"w"
.LC14:
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
# sub_64_aligned.c:604:     FILE *file = fopen(filename, "w");
	leaq	.LC13(%rip), %rsi	#, tmp88
# sub_64_aligned.c:603: {
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
# sub_64_aligned.c:604:     FILE *file = fopen(filename, "w");
	call	fopen@PLT	#
# sub_64_aligned.c:606:     if (file == NULL)
	testq	%rax, %rax	# <retval>
	je	.L140	#,
	leaq	event_names(%rip), %rbx	#, ivtmp.177
	movq	%rax, %r12	# tmp94, <retval>
	leaq	.LC14(%rip), %rbp	#, tmp92
	leaq	48(%rbx), %r13	#, _18
	.p2align 4,,10
	.p2align 3
.L137:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rbx), %rcx	# MEM[(const char * *)_12],
	movq	%rbp, %rdx	# tmp92,
	movl	$1, %esi	#,
	movq	%r12, %rdi	# <retval>,
	xorl	%eax, %eax	#
# sub_64_aligned.c:613:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$8, %rbx	#, ivtmp.177
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	__fprintf_chk@PLT	#
# sub_64_aligned.c:613:     for (int j = 0; j < MAX_EVENTS; j++)
	cmpq	%r13, %rbx	# _18, ivtmp.177
	jne	.L137	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rsi	# <retval>,
	movl	$10, %edi	#,
	call	fputc@PLT	#
# sub_64_aligned.c:619: }
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
.L140:
	.cfi_restore_state
	call	open_file.part.0	#
	.cfi_endproc
.LFE5787:
	.size	open_file, .-open_file
	.section	.rodata.str1.1
.LC15:
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
	movq	%rdi, %rbp	# tmp91, ivtmp.188
	pushq	%rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	fd(%rip), %rbx	#, ivtmp.187
	leaq	24(%rbx), %r12	#, _7
	.p2align 4,,10
	.p2align 3
.L143:
# /usr/include/x86_64-linux-gnu/bits/unistd.h:38:   return __glibc_fortify (read, __nbytes, sizeof (char),
	movl	(%rbx), %edi	# MEM[(int *)_13],
	movl	$8, %edx	#,
	movq	%rbp, %rsi	# ivtmp.188,
	call	read@PLT	#
# sub_64_aligned.c:625:         if (read(fd[j], &values[j], sizeof(uint64_t)) == -1)
	cmpq	$-1, %rax	#, tmp92
	je	.L146	#,
# sub_64_aligned.c:623:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$4, %rbx	#, ivtmp.187
	addq	$8, %rbp	#, ivtmp.188
	cmpq	%r12, %rbx	# _7, ivtmp.187
	jne	.L143	#,
# sub_64_aligned.c:631: }
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
	ret	
.L146:
	.cfi_restore_state
# sub_64_aligned.c:627:             perror("Error reading counter value");
	leaq	.LC15(%rip), %rdi	#, tmp90
	call	perror@PLT	#
# sub_64_aligned.c:628:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5788:
	.size	read_perf, .-read_perf
	.section	.rodata.str1.1
.LC16:
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
	leaq	.LC16(%rip), %r12	#, tmp89
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp	# tmp90, file
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rbx	# tmp91, ivtmp.198
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
	.p2align 4,,10
	.p2align 3
.L148:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rbx), %rcx	# MEM[(long long int *)_5],
	movq	%r12, %rdx	# tmp89,
	movl	$1, %esi	#,
	movq	%rbp, %rdi	# file,
	xorl	%eax, %eax	#
# sub_64_aligned.c:635:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$8, %rbx	#, ivtmp.198
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	__fprintf_chk@PLT	#
# sub_64_aligned.c:635:     for (int j = 0; j < MAX_EVENTS; j++)
	cmpq	%r13, %rbx	# _20, ivtmp.198
	jne	.L148	#,
# sub_64_aligned.c:642: }
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 40
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rsi	# file,
	movl	$10, %edi	#,
# sub_64_aligned.c:642: }
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
	leaq	fd(%rip), %rbx	#, ivtmp.208
	leaq	24(%rbx), %rbp	#, _17
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L152:
# sub_64_aligned.c:648:         ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
	movl	(%rbx), %edi	# MEM[(int *)_14],
	xorl	%edx, %edx	#
	movl	$9219, %esi	#,
	xorl	%eax, %eax	#
# sub_64_aligned.c:646:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$4, %rbx	#, ivtmp.208
# sub_64_aligned.c:648:         ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
	call	ioctl@PLT	#
# sub_64_aligned.c:649:         ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
	movl	-4(%rbx), %edi	# MEM[(int *)_14],
	xorl	%edx, %edx	#
	movl	$9216, %esi	#,
	xorl	%eax, %eax	#
	call	ioctl@PLT	#
# sub_64_aligned.c:646:     for (int j = 0; j < MAX_EVENTS; j++)
	cmpq	%rbp, %rbx	# _17, ivtmp.208
	jne	.L152	#,
# sub_64_aligned.c:651: }
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
.LC17:
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
	leaq	fd(%rip), %rbx	#, ivtmp.218
	leaq	24(%rbx), %rbp	#, _17
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L157:
# sub_64_aligned.c:657:         if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
	movl	(%rbx), %edi	# MEM[(int *)_15],
	xorl	%edx, %edx	#
	xorl	%eax, %eax	#
	movl	$9217, %esi	#,
	call	ioctl@PLT	#
# sub_64_aligned.c:657:         if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
	cmpl	$-1, %eax	#, tmp88
	je	.L160	#,
# sub_64_aligned.c:655:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$4, %rbx	#, ivtmp.218
	cmpq	%rbp, %rbx	# _17, ivtmp.218
	jne	.L157	#,
# sub_64_aligned.c:663: }
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx	#
	.cfi_def_cfa_offset 16
	popq	%rbp	#
	.cfi_def_cfa_offset 8
	ret	
.L160:
	.cfi_restore_state
# sub_64_aligned.c:659:             perror("Error disabling counter");
	leaq	.LC17(%rip), %rdi	#, tmp87
	call	perror@PLT	#
# sub_64_aligned.c:660:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5791:
	.size	stop_perf, .-stop_perf
	.section	.rodata.str1.1
.LC18:
	.string	"Error getting start time"
	.text
	.p2align 4
	.globl	start_timespec
	.type	start_timespec, @function
start_timespec:
.LFB5792:
	.cfi_startproc
	endbr64	
# sub_64_aligned.c:667:     start->tv_sec = 0;
	vpxor	%xmm0, %xmm0, %xmm0	# tmp84
# sub_64_aligned.c:666: {
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 16
# sub_64_aligned.c:666: {
	movq	%rdi, %rsi	# tmp86, start
# sub_64_aligned.c:667:     start->tv_sec = 0;
	vmovdqu	%xmm0, (%rdi)	# tmp84, MEM <vector(2) long int> [(long int *)start_3(D)]
# sub_64_aligned.c:669:     if (clock_gettime(CLOCK_MONOTONIC_RAW, start) == -1)
	movl	$4, %edi	#,
	call	clock_gettime@PLT	#
# sub_64_aligned.c:669:     if (clock_gettime(CLOCK_MONOTONIC_RAW, start) == -1)
	cmpl	$-1, %eax	#, tmp87
	je	.L165	#,
# sub_64_aligned.c:674: }
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L165:
	.cfi_restore_state
# sub_64_aligned.c:671:         perror("Error getting start time");
	leaq	.LC18(%rip), %rdi	#, tmp85
	call	perror@PLT	#
# sub_64_aligned.c:672:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5792:
	.size	start_timespec, .-start_timespec
	.section	.rodata.str1.1
.LC19:
	.string	"Error getting end time"
	.text
	.p2align 4
	.globl	stop_timespec
	.type	stop_timespec, @function
stop_timespec:
.LFB5793:
	.cfi_startproc
	endbr64	
# sub_64_aligned.c:689:     end->tv_sec = 0;
	vpxor	%xmm0, %xmm0, %xmm0	# tmp84
# sub_64_aligned.c:687: {
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 16
# sub_64_aligned.c:687: {
	movq	%rdi, %rsi	# tmp86, end
# sub_64_aligned.c:689:     end->tv_sec = 0;
	vmovdqu	%xmm0, (%rdi)	# tmp84, MEM <vector(2) long int> [(long int *)end_3(D)]
# sub_64_aligned.c:691:     if (clock_gettime(CLOCK_MONOTONIC_RAW, end) == -1)
	movl	$4, %edi	#,
	call	clock_gettime@PLT	#
# sub_64_aligned.c:691:     if (clock_gettime(CLOCK_MONOTONIC_RAW, end) == -1)
	cmpl	$-1, %eax	#, tmp87
	je	.L170	#,
# sub_64_aligned.c:696: }
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L170:
	.cfi_restore_state
# sub_64_aligned.c:693:         perror("Error getting end time");
	leaq	.LC19(%rip), %rdi	#, tmp85
	call	perror@PLT	#
# sub_64_aligned.c:694:         exit(EXIT_FAILURE);
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
# sub_64_aligned.c:701:     long long seconds = end.tv_sec - start.tv_sec;
	subq	%rdi, %rdx	# tmp105, seconds
# sub_64_aligned.c:705:     if (nanoseconds < 0)
	subq	%rsi, %rcx	# tmp106, nanoseconds
	jns	.L172	#,
# sub_64_aligned.c:707:         seconds--;
	subq	$1, %rdx	#, seconds
# sub_64_aligned.c:708:         nanoseconds += 1000000000; // 1 second in nanoseconds
	addq	$1000000000, %rcx	#, nanoseconds
.L172:
# sub_64_aligned.c:712:     return (seconds * 1000000000LL) + nanoseconds;
	imulq	$1000000000, %rdx, %rdx	#, seconds, tmp97
# sub_64_aligned.c:712:     return (seconds * 1000000000LL) + nanoseconds;
	vxorps	%xmm0, %xmm0, %xmm0	# tmp109
	addq	%rcx, %rdx	# nanoseconds, tmp98
	vcvtsi2sdq	%rdx, %xmm0, %xmm0	# tmp98, tmp109, tmp110
# sub_64_aligned.c:713: }
	ret	
	.cfi_endproc
.LFE5794:
	.size	calculate_time, .-calculate_time
	.p2align 4
	.globl	check_result
	.type	check_result, @function
check_result:
.LFB5795:
	.cfi_startproc
	endbr64	
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%edx, %r12d	# tmp128, result_size
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rsi, %rbp	# tmp127, result_gmp
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx	# tmp126, result
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
# sub_64_aligned.c:718:     if (strlen(result) != strlen(result_gmp))
	call	strlen@PLT	#
# sub_64_aligned.c:718:     if (strlen(result) != strlen(result_gmp))
	movq	%rbp, %rdi	# result_gmp,
# sub_64_aligned.c:718:     if (strlen(result) != strlen(result_gmp))
	movq	%rax, %r13	# tmp129, tmp93
# sub_64_aligned.c:718:     if (strlen(result) != strlen(result_gmp))
	call	strlen@PLT	#
	movq	%rax, %r8	#, tmp130
# sub_64_aligned.c:723:         return false;
	xorl	%eax, %eax	# <retval>
# sub_64_aligned.c:718:     if (strlen(result) != strlen(result_gmp))
	cmpq	%r8, %r13	# tmp130, tmp93
	jne	.L173	#,
# sub_64_aligned.c:725:     for (int i = 0; i < result_size; i++)
	testl	%r12d, %r12d	# result_size
	jle	.L177	#,
	movslq	%r12d, %rdx	# result_size, _20
	xorl	%r9d, %r9d	# ivtmp.237
	andl	$7, %r12d	#, tmp103
	je	.L175	#,
	cmpq	$1, %r12	#, tmp103
	je	.L201	#,
	cmpq	$2, %r12	#, tmp103
	je	.L202	#,
	cmpq	$3, %r12	#, tmp103
	je	.L203	#,
	cmpq	$4, %r12	#, tmp103
	je	.L204	#,
	cmpq	$5, %r12	#, tmp103
	je	.L205	#,
	cmpq	$6, %r12	#, tmp103
	je	.L206	#,
# sub_64_aligned.c:727:         if (result[i] != result_gmp[i])
	movzbl	0(%rbp), %eax	# MEM[(char *)result_gmp_12(D) + ivtmp.237_16 * 1], tmp134
	cmpb	%al, (%rbx)	# tmp134, MEM[(char *)result_11(D) + ivtmp.237_16 * 1]
	jne	.L178	#,
# sub_64_aligned.c:725:     for (int i = 0; i < result_size; i++)
	movl	$1, %r9d	#, ivtmp.237
.L206:
# sub_64_aligned.c:727:         if (result[i] != result_gmp[i])
	movzbl	0(%rbp,%r9), %edi	# MEM[(char *)result_gmp_12(D) + ivtmp.237_16 * 1], tmp135
	cmpb	%dil, (%rbx,%r9)	# tmp135, MEM[(char *)result_11(D) + ivtmp.237_16 * 1]
	jne	.L178	#,
# sub_64_aligned.c:725:     for (int i = 0; i < result_size; i++)
	addq	$1, %r9	#, ivtmp.237
.L205:
# sub_64_aligned.c:727:         if (result[i] != result_gmp[i])
	movzbl	0(%rbp,%r9), %ecx	# MEM[(char *)result_gmp_12(D) + ivtmp.237_16 * 1], tmp136
	cmpb	%cl, (%rbx,%r9)	# tmp136, MEM[(char *)result_11(D) + ivtmp.237_16 * 1]
	jne	.L178	#,
# sub_64_aligned.c:725:     for (int i = 0; i < result_size; i++)
	addq	$1, %r9	#, ivtmp.237
.L204:
# sub_64_aligned.c:727:         if (result[i] != result_gmp[i])
	movzbl	0(%rbp,%r9), %esi	# MEM[(char *)result_gmp_12(D) + ivtmp.237_16 * 1], tmp137
	cmpb	%sil, (%rbx,%r9)	# tmp137, MEM[(char *)result_11(D) + ivtmp.237_16 * 1]
	jne	.L178	#,
# sub_64_aligned.c:725:     for (int i = 0; i < result_size; i++)
	addq	$1, %r9	#, ivtmp.237
.L203:
# sub_64_aligned.c:727:         if (result[i] != result_gmp[i])
	movzbl	0(%rbp,%r9), %r10d	# MEM[(char *)result_gmp_12(D) + ivtmp.237_16 * 1], tmp138
	cmpb	%r10b, (%rbx,%r9)	# tmp138, MEM[(char *)result_11(D) + ivtmp.237_16 * 1]
	jne	.L178	#,
# sub_64_aligned.c:725:     for (int i = 0; i < result_size; i++)
	addq	$1, %r9	#, ivtmp.237
.L202:
# sub_64_aligned.c:727:         if (result[i] != result_gmp[i])
	movzbl	0(%rbp,%r9), %r11d	# MEM[(char *)result_gmp_12(D) + ivtmp.237_16 * 1], tmp139
	cmpb	%r11b, (%rbx,%r9)	# tmp139, MEM[(char *)result_11(D) + ivtmp.237_16 * 1]
	jne	.L178	#,
# sub_64_aligned.c:725:     for (int i = 0; i < result_size; i++)
	addq	$1, %r9	#, ivtmp.237
.L201:
# sub_64_aligned.c:727:         if (result[i] != result_gmp[i])
	movzbl	0(%rbp,%r9), %r12d	# MEM[(char *)result_gmp_12(D) + ivtmp.237_16 * 1], tmp140
	cmpb	%r12b, (%rbx,%r9)	# tmp140, MEM[(char *)result_11(D) + ivtmp.237_16 * 1]
	jne	.L178	#,
# sub_64_aligned.c:725:     for (int i = 0; i < result_size; i++)
	addq	$1, %r9	#, ivtmp.237
	cmpq	%rdx, %r9	# _20, ivtmp.237
	je	.L177	#,
.L175:
# sub_64_aligned.c:727:         if (result[i] != result_gmp[i])
	movzbl	0(%rbp,%r9), %r13d	# MEM[(char *)result_gmp_12(D) + ivtmp.237_16 * 1], tmp132
	cmpb	%r13b, (%rbx,%r9)	# tmp132, MEM[(char *)result_11(D) + ivtmp.237_16 * 1]
	jne	.L178	#,
# sub_64_aligned.c:727:         if (result[i] != result_gmp[i])
	movzbl	1(%rbp,%r9), %r8d	# MEM[(char *)result_gmp_12(D) + ivtmp.237_16 * 1], tmp133
	cmpb	%r8b, 1(%rbx,%r9)	# tmp133, MEM[(char *)result_11(D) + ivtmp.237_16 * 1]
	jne	.L178	#,
# sub_64_aligned.c:727:         if (result[i] != result_gmp[i])
	movzbl	2(%rbp,%r9), %eax	# MEM[(char *)result_gmp_12(D) + ivtmp.237_16 * 1], tmp141
	cmpb	%al, 2(%rbx,%r9)	# tmp141, MEM[(char *)result_11(D) + ivtmp.237_16 * 1]
	jne	.L178	#,
	movzbl	3(%rbp,%r9), %edi	# MEM[(char *)result_gmp_12(D) + ivtmp.237_16 * 1], tmp142
	cmpb	%dil, 3(%rbx,%r9)	# tmp142, MEM[(char *)result_11(D) + ivtmp.237_16 * 1]
	jne	.L178	#,
	movzbl	4(%rbp,%r9), %ecx	# MEM[(char *)result_gmp_12(D) + ivtmp.237_16 * 1], tmp143
	cmpb	%cl, 4(%rbx,%r9)	# tmp143, MEM[(char *)result_11(D) + ivtmp.237_16 * 1]
	jne	.L178	#,
	movzbl	5(%rbp,%r9), %esi	# MEM[(char *)result_gmp_12(D) + ivtmp.237_16 * 1], tmp144
	cmpb	%sil, 5(%rbx,%r9)	# tmp144, MEM[(char *)result_11(D) + ivtmp.237_16 * 1]
	jne	.L178	#,
	movzbl	6(%rbp,%r9), %r10d	# MEM[(char *)result_gmp_12(D) + ivtmp.237_16 * 1], tmp145
	cmpb	%r10b, 6(%rbx,%r9)	# tmp145, MEM[(char *)result_11(D) + ivtmp.237_16 * 1]
	jne	.L178	#,
	movzbl	7(%rbp,%r9), %r11d	# MEM[(char *)result_gmp_12(D) + ivtmp.237_16 * 1], tmp146
	cmpb	%r11b, 7(%rbx,%r9)	# tmp146, MEM[(char *)result_11(D) + ivtmp.237_16 * 1]
	jne	.L178	#,
# sub_64_aligned.c:725:     for (int i = 0; i < result_size; i++)
	addq	$8, %r9	#, ivtmp.237
	cmpq	%rdx, %r9	# _20, ivtmp.237
	jne	.L175	#,
.L177:
# sub_64_aligned.c:736:     return true;
	movl	$1, %eax	#, <retval>
.L173:
# sub_64_aligned.c:737: }
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
	.p2align 4,,10
	.p2align 3
.L178:
	.cfi_restore_state
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 40
# sub_64_aligned.c:723:         return false;
	xorl	%eax, %eax	# <retval>
# sub_64_aligned.c:737: }
	popq	%rbx	#
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE5795:
	.size	check_result, .-check_result
	.section	.rodata.str1.8
	.align 8
.LC20:
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
# sub_64_aligned.c:747:     *a = (uint64_t *)_mm_malloc(n * sizeof(uint64_t), 64);
	salq	$3, %r12	#, _2
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	movq	%r12, %rdx	# _2,
# sub_64_aligned.c:745: {
	andq	$-64, %rsp	#,
	addq	$-128, %rsp	#,
	.cfi_offset 3, -56
# sub_64_aligned.c:745: {
	movq	%rsi, 72(%rsp)	# tmp310, %sfp
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	112(%rsp), %rdi	#, tmp237
	movl	$64, %esi	#,
# sub_64_aligned.c:745: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp320
	movq	%rax, 120(%rsp)	# tmp320, D.39591
	xorl	%eax, %eax	# tmp320
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	call	posix_memalign@PLT	#
	leaq	104(%rsp), %rdi	#, tmp238
	movq	%r12, %rdx	# _2,
	movl	$64, %esi	#,
	testl	%eax, %eax	# tmp312
	movl	$0, %eax	#, tmp307
	cmove	112(%rsp), %rax	# D.39556,, _82
# sub_64_aligned.c:747:     *a = (uint64_t *)_mm_malloc(n * sizeof(uint64_t), 64);
	movq	%rax, (%r14)	# _82, *a_44(D)
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	call	posix_memalign@PLT	#
	testl	%eax, %eax	# tmp313
	je	.L280	#,
# sub_64_aligned.c:748:     *b = (uint64_t *)_mm_malloc(n * sizeof(uint64_t), 64);
	movq	72(%rsp), %rdx	# %sfp, b
	movq	$0, (%rdx)	#, *b_47(D)
.L232:
# sub_64_aligned.c:752:         perror("Memory allocation failed for a or b\n");
	leaq	.LC20(%rip), %rdi	#, tmp243
	call	perror@PLT	#
# sub_64_aligned.c:753:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.p2align 4,,10
	.p2align 3
.L280:
	movq	104(%rsp), %rcx	# D.39550, _70
# sub_64_aligned.c:748:     *b = (uint64_t *)_mm_malloc(n * sizeof(uint64_t), 64);
	movq	72(%rsp), %rbx	# %sfp, b
	movq	%rcx, (%rbx)	# _70, *b_47(D)
# sub_64_aligned.c:750:     if (*a == NULL || *b == NULL)
	cmpq	$0, (%r14)	#, *a_44(D)
	je	.L232	#,
	testq	%rcx, %rcx	# _70
	je	.L232	#,
# sub_64_aligned.c:757:     int seed = generate_seed();
	xorl	%eax, %eax	#
	call	generate_seed	#
# sub_64_aligned.c:758:     srand(seed);
	movl	%eax, %edi	# tmp314, _6
	call	srand@PLT	#
# sub_64_aligned.c:764:     for (int i = n - 1; i >= 0;)
	subl	$1, %r15d	#, _9
	js	.L218	#,
	.p2align 4,,10
	.p2align 3
.L223:
# sub_64_aligned.c:767:         int group_size = (i >= 8) ? 9 : (i + 1);
	movl	$8, %ebx	#, tmp319
	movl	%r15d, 88(%rsp)	# _9, %sfp
	cmpl	%ebx, %r15d	# tmp319, _9
	cmovle	%r15d, %ebx	# _9,, tmp319
# sub_64_aligned.c:767:         int group_size = (i >= 8) ? 9 : (i + 1);
	leal	1(%rbx), %esi	#, _91
# sub_64_aligned.c:767:         int group_size = (i >= 8) ? 9 : (i + 1);
	movl	%ebx, 92(%rsp)	# _8, %sfp
	addl	$2, %ebx	#, tmp257
# sub_64_aligned.c:768:         int start_index = i - group_size + 1;
	subl	%esi, %r15d	# _91, _9
# sub_64_aligned.c:767:         int group_size = (i >= 8) ? 9 : (i + 1);
	movl	%esi, 80(%rsp)	# _91, %sfp
	movslq	%ebx, %rbx	# tmp257, tmp258
# sub_64_aligned.c:768:         int start_index = i - group_size + 1;
	leal	1(%r15), %r12d	#, start_index
	movl	%r12d, 84(%rsp)	# start_index, %sfp
# sub_64_aligned.c:772:         uint64_t start_value = rand() % 10;
	call	rand@PLT	#
	movslq	%r15d, %rdx	# _9, _9
# sub_64_aligned.c:772:         uint64_t start_value = rand() % 10;
	movslq	%eax, %r8	# _10, _10
	movl	%eax, %r10d	# _10, tmp250
# sub_64_aligned.c:772:         uint64_t start_value = rand() % 10;
	movl	%eax, %edi	# tmp315, _10
	movslq	%r12d, %rax	# start_index, start_index
# sub_64_aligned.c:772:         uint64_t start_value = rand() % 10;
	imulq	$1717986919, %r8, %r9	#, _10, tmp247
	sarl	$31, %r10d	#, tmp250
	movq	%rax, 64(%rsp)	# start_index, %sfp
	addq	%rdx, %rbx	# _9, tmp260
	leaq	0(,%rax,8), %r12	#, ivtmp.270
	salq	$3, %rbx	#, _75
	movq	%r12, 56(%rsp)	# ivtmp.270, %sfp
	sarq	$34, %r9	#, tmp249
	subl	%r10d, %r9d	# tmp250, tmp245
	leal	(%r9,%r9,4), %r11d	#, tmp253
	addl	%r11d, %r11d	# tmp254
	subl	%r11d, %edi	# tmp254, tmp255
# sub_64_aligned.c:772:         uint64_t start_value = rand() % 10;
	movslq	%edi, %r13	# tmp255, start_value
	.p2align 4,,10
	.p2align 3
.L225:
# sub_64_aligned.c:775:             (*a)[start_index + j] = start_value;
	movq	(%r14), %rcx	# *a_44(D), *a_44(D)
	movq	%r13, (%rcx,%r12)	# start_value, *_16
# sub_64_aligned.c:777:             if (rand() % 2 == 0 && start_value > 0)
	call	rand@PLT	#
# sub_64_aligned.c:777:             if (rand() % 2 == 0 && start_value > 0)
	testb	$1, %al	#, tmp316
	jne	.L224	#,
# sub_64_aligned.c:779:                 start_value--;
	cmpq	$1, %r13	#, start_value
	adcq	$-1, %r13	#, start_value
.L224:
# sub_64_aligned.c:773:         for (int j = 0; j < group_size; j++)
	addq	$8, %r12	#, ivtmp.270
	cmpq	%r12, %rbx	# ivtmp.270, _75
	jne	.L225	#,
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	72(%rsp), %rsi	# %sfp, b
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movl	80(%rsp), %r12d	# %sfp, _91
	movslq	92(%rsp), %rdi	# %sfp,
	movslq	88(%rsp), %rbx	# %sfp, _114
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	(%rsi), %rdx	# *b_47(D), _27
	movl	%r12d, %esi	# _91, _89
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	(%r14), %r13	# *a_44(D), _20
	movq	%rsi, %r8	# _89, tmp267
	leaq	8(,%rbx,8), %rcx	#, _110
	subq	%rdi, %rbx	# _8, _106
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movl	84(%rsp), %eax	# %sfp, start_index
	negq	%r8	# tmp267
	addq	%rbx, %rsi	# _106, tmp271
	leaq	(%rdx,%rbx,8), %r9	#, _99
	movq	%rdi, %r11	#,
	leaq	(%rcx,%r8,8), %r8	#, tmp269
	leaq	(%rdx,%rsi,8), %rdi	#, tmp273
	addl	%r12d, %eax	# _91, start_index
	addq	%r13, %r8	# _20, tmp270
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	leal	-1(%rax), %r10d	#, _112
	cmpq	%rdi, %r8	# tmp273, tmp270
	leaq	0(%r13,%rcx), %r8	#, tmp276
	setnb	%sil	#, tmp275
	cmpq	%r8, %r9	# tmp276, _99
	setnb	%dil	#, tmp278
	orb	%sil, %dil	# tmp275, tmp321
	je	.L226	#,
	cmpl	$2, %r11d	#, _8
	jbe	.L226	#,
	cmpl	$6, %r11d	#, _8
	jbe	.L227	#,
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	vmovdqa64	.LC21(%rip), %zmm1	#, tmp350
	vpermq	-64(%r13,%rcx), %zmm1, %zmm2	# MEM <vector(8) long unsigned int> [(uint64_t *)vectp.251_154], tmp350, vect__32.253
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	vmovdqu64	%zmm2, (%r9)	# vect__32.253, MEM <vector(8) long unsigned int> [(uint64_t *)_99]
	cmpl	$8, %r12d	#, _91
	je	.L277	#,
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	subl	$9, %eax	#, tmp285
	movslq	%eax, %rbx	# tmp285, tmp286
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	leal	9(%r15), %eax	#, tmp287
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	0(%r13,%rbx,8), %rcx	# *_211, _217
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	cltq
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%rcx, (%rdx,%rax,8)	# _217,* _27
	vzeroupper
.L230:
# sub_64_aligned.c:764:     for (int i = n - 1; i >= 0;)
	testl	%r15d, %r15d	# _9
	jns	.L223	#,
.L218:
# sub_64_aligned.c:791: }
	movq	120(%rsp), %rax	# D.39591, tmp322
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp322
	jne	.L281	#,
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
.L227:
	.cfi_restore_state
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	vpermq	$27, -32(%r13,%rcx), %ymm0	#, MEM <vector(4) long unsigned int> [(uint64_t *)vectp.261_199], vect__141.263
	cmpl	$3, 92(%rsp)	#, %sfp
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	vmovdqu	%ymm0, (%rdx,%rbx,8)	# vect__141.263, MEM <vector(4) long unsigned int> [(uint64_t *)vectp.265_210]
	je	.L277	#,
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	leal	-5(%rax), %r12d	#, tmp289
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	leal	5(%r15), %ecx	#, tmp291
# sub_64_aligned.c:784:         for (int j = 0; j < group_size; j++)
	movl	88(%rsp), %r9d	# %sfp, i
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movslq	%r12d, %r10	# tmp289, tmp290
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movslq	%ecx, %r11	# tmp291, tmp292
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	0(%r13,%r10,8), %rbx	# *_299, _304
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%rbx, (%rdx,%r11,8)	# _304, *_303
# sub_64_aligned.c:784:         for (int j = 0; j < group_size; j++)
	cmpl	$4, %r9d	#, i
	jle	.L277	#,
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	leal	-6(%rax), %esi	#, tmp293
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	leal	6(%r15), %r12d	#, tmp295
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movslq	%esi, %r8	# tmp293, tmp294
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movslq	%r12d, %r10	# tmp295, tmp296
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	0(%r13,%r8,8), %rdi	# *_312, _317
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%rdi, (%rdx,%r10,8)	# _317, *_316
# sub_64_aligned.c:784:         for (int j = 0; j < group_size; j++)
	cmpl	$5, %r9d	#, i
	jle	.L277	#,
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	subl	$7, %eax	#, tmp297
	cltq
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	0(%r13,%rax,8), %r13	# *_181, _186
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	leal	7(%r15), %eax	#, tmp299
	cltq
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%r13, (%rdx,%rax,8)	# _186,* _27
	vzeroupper
	jmp	.L230	#
	.p2align 4,,10
	.p2align 3
.L277:
	vzeroupper
	jmp	.L230	#
	.p2align 4,,10
	.p2align 3
.L226:
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movslq	%r10d, %r11	# _112, _112
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	64(%rsp), %r8	# %sfp, start_index
# sub_64_aligned.c:784:         for (int j = 0; j < group_size; j++)
	movl	88(%rsp), %edi	# %sfp, i
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	0(%r13,%r11,8), %rsi	# *_28, _57
	leaq	0(,%r11,8), %r9	#, _26
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%rsi, (%rdx,%r8,8)	# _57, *_32
# sub_64_aligned.c:784:         for (int j = 0; j < group_size; j++)
	testl	%edi, %edi	# i
	je	.L230	#,
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	-8(%r13,%r9), %r12	# *_139, _189
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	56(%rsp), %r10	# %sfp, ivtmp.270
	movq	%r12, 8(%rdx,%r10)	# _189, *_144
# sub_64_aligned.c:784:         for (int j = 0; j < group_size; j++)
	cmpl	$1, %edi	#, i
	je	.L230	#,
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	-16(%r13,%r9), %rbx	# *_56, _226
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%rbx, 16(%rdx,%r10)	# _226, *_225
# sub_64_aligned.c:784:         for (int j = 0; j < group_size; j++)
	cmpl	$2, %edi	#, i
	je	.L230	#,
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	-24(%r13,%r9), %rcx	# *_234, _239
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%rcx, 24(%rdx,%r10)	# _239, *_238
# sub_64_aligned.c:784:         for (int j = 0; j < group_size; j++)
	cmpl	$3, %edi	#, i
	je	.L230	#,
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	-32(%r13,%r9), %rax	# *_247, _252
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%rax, 32(%rdx,%r10)	# _252, *_251
# sub_64_aligned.c:784:         for (int j = 0; j < group_size; j++)
	cmpl	$4, %edi	#, i
	je	.L230	#,
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	-40(%r13,%r9), %r11	# *_260, _265
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%r11, 40(%rdx,%r10)	# _265, *_264
# sub_64_aligned.c:784:         for (int j = 0; j < group_size; j++)
	cmpl	$5, %edi	#, i
	je	.L230	#,
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	-48(%r13,%r9), %rsi	# *_273, _278
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%rsi, 48(%rdx,%r10)	# _278, *_277
# sub_64_aligned.c:784:         for (int j = 0; j < group_size; j++)
	cmpl	$6, %edi	#, i
	je	.L230	#,
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	-56(%r13,%r9), %r8	# *_286, _291
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%r8, 56(%rdx,%r10)	# _291, *_290
# sub_64_aligned.c:784:         for (int j = 0; j < group_size; j++)
	cmpl	$7, %edi	#, i
	jle	.L230	#,
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	-64(%r13,%r9), %r13	# *_21, _124
# sub_64_aligned.c:786:             (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
	movq	%r13, 64(%rdx,%r10)	# _124, *_123
	jmp	.L230	#
.L281:
# sub_64_aligned.c:791: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE5796:
	.size	generate_no_borrow_propagation, .-generate_no_borrow_propagation
	.section	.rodata.str1.1
.LC22:
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
# sub_64_aligned.c:794: {
	movq	%rsi, %rbx	# tmp90, file
# sub_64_aligned.c:795:     *file = fopen(filename, "w");
	leaq	.LC13(%rip), %rsi	#, tmp85
	call	fopen@PLT	#
# sub_64_aligned.c:795:     *file = fopen(filename, "w");
	movq	%rax, (%rbx)	# tmp86, *file_5(D)
# sub_64_aligned.c:797:     if (*file == NULL)
	testq	%rax, %rax	# tmp86
	je	.L285	#,
	movq	%rax, %rcx	# tmp91, tmp86
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$12, %edx	#,
	movl	$1, %esi	#,
# sub_64_aligned.c:806: }
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC22(%rip), %rdi	#, tmp88
	jmp	fwrite@PLT	#
.L285:
	.cfi_restore_state
# sub_64_aligned.c:799:         perror("Error opening file for writing \n");
	leaq	.LC0(%rip), %rdi	#, tmp87
	call	perror@PLT	#
# sub_64_aligned.c:800:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5797:
	.size	open_time_file, .-open_time_file
	.section	.rodata.str1.1
.LC23:
	.string	"%lf, %llu\n"
	.text
	.p2align 4
	.globl	write_time
	.type	write_time, @function
write_time:
.LFB5798:
	.cfi_startproc
	endbr64	
# sub_64_aligned.c:809: {
	movq	%rsi, %rcx	# tmp88, rdtsc
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC23(%rip), %rdx	#, tmp85
	movl	$1, %esi	#,
	movl	$1, %eax	#,
	jmp	__fprintf_chk@PLT	#
	.cfi_endproc
.LFE5798:
	.size	write_time, .-write_time
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"Memory allocation failed for str\n"
	.text
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
	movq	%rdi, %r12	# tmp418, digits
	pushq	%rbx	#
	.cfi_offset 3, -32
	movslq	%esi, %rbx	# tmp419,
# sub_64_aligned.c:816:     char *str = (char *)calloc(n + 1, sizeof(char));
	movl	$1, %esi	#,
# sub_64_aligned.c:816:     char *str = (char *)calloc(n + 1, sizeof(char));
	leal	1(%rbx), %edi	#, tmp279
# sub_64_aligned.c:816:     char *str = (char *)calloc(n + 1, sizeof(char));
	movslq	%edi, %rdi	# tmp279, tmp280
# sub_64_aligned.c:815: {
	andq	$-32, %rsp	#,
# sub_64_aligned.c:816:     char *str = (char *)calloc(n + 1, sizeof(char));
	call	calloc@PLT	#
# sub_64_aligned.c:817:     if (str == NULL)
	testq	%rax, %rax	# <retval>
	je	.L288	#,
	movq	%rax, %r8	# tmp420, <retval>
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	testl	%ebx, %ebx	# n
	jle	.L290	#,
	leal	-1(%rbx), %eax	#, tmp283
	cmpl	$30, %eax	#, tmp283
	jbe	.L296	#,
	movl	%ebx, %ecx	# n, bnd.282
	movq	%r12, %rsi	# digits, ivtmp.326
	movq	%r8, %rdx	# <retval>, ivtmp.329
	vpbroadcastd	.LC31(%rip), %ymm2	#, tmp415
	vpbroadcastw	.LC32(%rip), %ymm3	#, tmp416
	shrl	$5, %ecx	#, bnd.282
	vpbroadcastb	.LC33(%rip), %ymm4	#, tmp417
	subl	$1, %ecx	#, tmp286
	salq	$8, %rcx	#, tmp287
	leaq	256(%r12,%rcx), %r9	#, _264
	.p2align 4,,10
	.p2align 3
.L292:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	vmovdqu	(%rsi), %ymm7	# MEM <vector(4) long unsigned int> [(uint64_t *)_140], tmp423
	vperm2i128	$32, 32(%rsi), %ymm7, %ymm1	#, MEM <vector(4) long unsigned int> [(uint64_t *)_140 + 32B], tmp423, tmp294
	addq	$256, %rsi	#, ivtmp.326
	addq	$32, %rdx	#, ivtmp.329
	vperm2i128	$49, -224(%rsi), %ymm7, %ymm0	#, MEM <vector(4) long unsigned int> [(uint64_t *)_140 + 32B], tmp424, tmp295
	vmovdqu	-192(%rsi), %ymm7	# MEM <vector(4) long unsigned int> [(uint64_t *)_140 + 64B], tmp425
	vperm2i128	$32, -160(%rsi), %ymm7, %ymm9	#, MEM <vector(4) long unsigned int> [(uint64_t *)_140 + 96B], tmp425, tmp302
	vperm2i128	$49, -160(%rsi), %ymm7, %ymm11	#, MEM <vector(4) long unsigned int> [(uint64_t *)_140 + 96B], tmp426, tmp303
	vpshufd	$216, %ymm1, %ymm5	#, tmp294, tmp292
	vpshufd	$216, %ymm0, %ymm6	#, tmp295, tmp293
	vmovdqu	-128(%rsi), %ymm7	# MEM <vector(4) long unsigned int> [(uint64_t *)_140 + 128B], tmp427
	vpshufd	$216, %ymm9, %ymm12	#, tmp302, tmp300
	vpshufd	$216, %ymm11, %ymm13	#, tmp303, tmp301
	vpunpcklqdq	%ymm6, %ymm5, %ymm8	# tmp293, tmp292, tmp296
	vpunpcklqdq	%ymm13, %ymm12, %ymm14	# tmp301, tmp300, tmp304
	vpand	%ymm8, %ymm2, %ymm15	# tmp296, tmp415, tmp306
	vperm2i128	$32, -96(%rsi), %ymm7, %ymm6	#, MEM <vector(4) long unsigned int> [(uint64_t *)_140 + 160B], tmp427, tmp316
	vpand	%ymm14, %ymm2, %ymm1	# tmp304, tmp415, tmp307
	vperm2i128	$49, -96(%rsi), %ymm7, %ymm9	#, MEM <vector(4) long unsigned int> [(uint64_t *)_140 + 160B], tmp428, tmp317
	vmovdqu	-64(%rsi), %ymm7	# MEM <vector(4) long unsigned int> [(uint64_t *)_140 + 192B], tmp429
	vpackusdw	%ymm1, %ymm15, %ymm0	# tmp307, tmp306, tmp309
	vperm2i128	$32, -32(%rsi), %ymm7, %ymm13	#, MEM <vector(4) long unsigned int> [(uint64_t *)_140 + 224B], tmp429, tmp324
	vperm2i128	$49, -32(%rsi), %ymm7, %ymm15	#, MEM <vector(4) long unsigned int> [(uint64_t *)_140 + 224B], tmp430, tmp325
	vpshufd	$216, %ymm6, %ymm10	#, tmp316, tmp314
	vpshufd	$216, %ymm9, %ymm11	#, tmp317, tmp315
	vpermq	$216, %ymm0, %ymm8	#, tmp309, tmp310
	vpshufd	$216, %ymm13, %ymm1	#, tmp324, tmp322
	vpshufd	$216, %ymm15, %ymm0	#, tmp325, tmp323
	vpunpcklqdq	%ymm11, %ymm10, %ymm12	# tmp315, tmp314, tmp318
	vpunpcklqdq	%ymm0, %ymm1, %ymm6	# tmp323, tmp322, tmp326
	vpand	%ymm12, %ymm2, %ymm9	# tmp318, tmp415, tmp328
	vpand	%ymm8, %ymm3, %ymm8	# tmp310, tmp416, tmp334
	vpand	%ymm6, %ymm2, %ymm5	# tmp326, tmp415, tmp329
	vpackusdw	%ymm5, %ymm9, %ymm10	# tmp329, tmp328, tmp331
	vpermq	$216, %ymm10, %ymm11	#, tmp331, tmp332
	vpand	%ymm11, %ymm3, %ymm12	# tmp332, tmp416, tmp335
	vpackuswb	%ymm12, %ymm8, %ymm7	# tmp335, tmp334, tmp337
	vpermq	$216, %ymm7, %ymm13	#, tmp337, tmp338
	vpaddb	%ymm13, %ymm4, %ymm14	# tmp338, tmp417, vect__8.298
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	vmovdqu	%ymm14, -32(%rdx)	# vect__8.298, MEM <vector(32) char> [(char *)_192]
	cmpq	%r9, %rsi	# _264, ivtmp.326
	jne	.L292	#,
	movl	%ebx, %r10d	# n, niters_vector_mult_vf.283
	andl	$-32, %r10d	#, niters_vector_mult_vf.283
	movl	%r10d, %r11d	# niters_vector_mult_vf.283, tmp.305
	cmpl	%r10d, %ebx	# niters_vector_mult_vf.283, n
	je	.L300	#,
	vzeroupper
.L291:
	movl	%ebx, %edi	# n, niters.302
	subl	%r10d, %edi	# niters_vector_mult_vf.283, niters.302
	leal	-1(%rdi), %eax	#, tmp341
	cmpl	$14, %eax	#, tmp341
	jbe	.L294	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	vbroadcastss	.LC31(%rip), %xmm6	#, tmp352
	movl	%r10d, %esi	# niters_vector_mult_vf.283, _114
	movl	%edi, %ecx	# niters.302, niters_vector_mult_vf.304
	vpbroadcastw	.LC32(%rip), %xmm14	#, tmp366
	leaq	(%r12,%rsi,8), %rdx	#, vectp_digits.307
	andl	$-16, %ecx	#, niters_vector_mult_vf.304
	vmovdqu	(%rdx), %xmm2	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_digits.307_113], tmp433
	vmovdqu	32(%rdx), %xmm4	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_digits.307_113 + 32B], tmp434
	vshufps	$136, 16(%rdx), %xmm2, %xmm3	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_digits.307_113 + 16B], tmp433, vect__30.318
	vshufps	$136, 48(%rdx), %xmm4, %xmm15	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_digits.307_113 + 48B], tmp434, vect__30.318
	vpand	%xmm3, %xmm6, %xmm0	# vect__30.318, tmp352, tmp350
	vpand	%xmm15, %xmm6, %xmm1	# vect__30.318, tmp352, tmp351
	vmovdqu	64(%rdx), %xmm5	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_digits.307_113 + 64B], tmp435
	addl	%ecx, %r11d	# niters_vector_mult_vf.304, tmp.305
	vmovdqu	96(%rdx), %xmm11	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_digits.307_113 + 96B], tmp436
	vpackusdw	%xmm1, %xmm0, %xmm9	# tmp351, tmp350, vect__30.317
	vshufps	$136, 80(%rdx), %xmm5, %xmm10	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_digits.307_113 + 80B], tmp435, vect__30.318
	vshufps	$136, 112(%rdx), %xmm11, %xmm8	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_digits.307_113 + 112B], tmp436, vect__30.318
	vpand	%xmm10, %xmm6, %xmm12	# vect__30.318, tmp352, tmp360
	vpand	%xmm8, %xmm6, %xmm7	# vect__30.318, tmp352, tmp361
	vpand	%xmm9, %xmm14, %xmm3	# vect__30.317, tmp366, tmp364
	vpbroadcastb	.LC33(%rip), %xmm15	#, tmp368
	vpackusdw	%xmm7, %xmm12, %xmm13	# tmp361, tmp360, vect__30.317
	vpand	%xmm13, %xmm14, %xmm2	# vect__30.317, tmp366, tmp365
	vpackuswb	%xmm2, %xmm3, %xmm4	# tmp365, tmp364, vect__30.316
	vpaddb	%xmm15, %xmm4, %xmm6	# tmp368, vect__30.316, vect__26.319
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	vmovdqu	%xmm6, (%r8,%rsi)	# vect__26.319, MEM <vector(16) char> [(char *)vectp_str.322_143]
	cmpl	%ecx, %edi	# niters_vector_mult_vf.304, niters.302
	je	.L290	#,
.L294:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%r11d, %r9	# tmp.305, _4
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	1(%r11), %esi	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	(%r12,%r9,8), %edi	# *_6, tmp438
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	leaq	0(,%r9,8), %r10	#, _5
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	leal	48(%rdi), %eax	#, tmp370
	movb	%al, (%r8,%r9)	# tmp370, *_11
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%esi, %ebx	# i, n
	jle	.L290	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	8(%r12,%r10), %ecx	# *_26, tmp439
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%esi, %rdx	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	2(%r11), %edi	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	leal	48(%rcx), %r9d	#, tmp373
	movb	%r9b, (%r8,%rdx)	# tmp373, *_44
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%edi, %ebx	# i, n
	jle	.L290	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	16(%r12,%r10), %esi	# *_9, tmp440
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%edi, %rax	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	3(%r11), %ecx	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	leal	48(%rsi), %edx	#, tmp376
	movb	%dl, (%r8,%rax)	# tmp376, *_152
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%ecx, %ebx	# i, n
	jle	.L290	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	24(%r12,%r10), %edi	# *_160, tmp441
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%ecx, %r9	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	4(%r11), %esi	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	leal	48(%rdi), %eax	#, tmp379
	movb	%al, (%r8,%r9)	# tmp379, *_164
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%esi, %ebx	# i, n
	jle	.L290	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	32(%r12,%r10), %ecx	# *_172, tmp442
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%esi, %rdx	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	5(%r11), %edi	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	leal	48(%rcx), %r9d	#, tmp382
	movb	%r9b, (%r8,%rdx)	# tmp382, *_176
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%edi, %ebx	# i, n
	jle	.L290	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	40(%r12,%r10), %esi	# *_184, tmp443
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%edi, %rax	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	6(%r11), %ecx	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	leal	48(%rsi), %edx	#, tmp385
	movb	%dl, (%r8,%rax)	# tmp385, *_188
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%ecx, %ebx	# i, n
	jle	.L290	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	48(%r12,%r10), %edi	# *_196, tmp444
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%ecx, %r9	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	7(%r11), %esi	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	leal	48(%rdi), %eax	#, tmp388
	movb	%al, (%r8,%r9)	# tmp388, *_200
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%esi, %ebx	# i, n
	jle	.L290	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	56(%r12,%r10), %ecx	# *_208, tmp445
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%esi, %rdx	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	8(%r11), %edi	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	leal	48(%rcx), %r9d	#, tmp391
	movb	%r9b, (%r8,%rdx)	# tmp391, *_212
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%edi, %ebx	# i, n
	jle	.L290	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	64(%r12,%r10), %esi	# *_220, tmp446
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%edi, %rax	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	9(%r11), %ecx	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	leal	48(%rsi), %edx	#, tmp394
	movb	%dl, (%r8,%rax)	# tmp394, *_224
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%ecx, %ebx	# i, n
	jle	.L290	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	72(%r12,%r10), %edi	# *_232, tmp447
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%ecx, %r9	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	10(%r11), %esi	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	leal	48(%rdi), %eax	#, tmp397
	movb	%al, (%r8,%r9)	# tmp397, *_236
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%esi, %ebx	# i, n
	jle	.L290	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	80(%r12,%r10), %ecx	# *_244, tmp448
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%esi, %rdx	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	11(%r11), %edi	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	leal	48(%rcx), %r9d	#, tmp400
	movb	%r9b, (%r8,%rdx)	# tmp400, *_248
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%edi, %ebx	# i, n
	jle	.L290	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	88(%r12,%r10), %esi	# *_256, tmp449
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%edi, %rax	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	12(%r11), %ecx	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	leal	48(%rsi), %edx	#, tmp403
	movb	%dl, (%r8,%rax)	# tmp403, *_260
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%ecx, %ebx	# i, n
	jle	.L290	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	96(%r12,%r10), %edi	# *_268, tmp450
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%ecx, %r9	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	13(%r11), %esi	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	leal	48(%rdi), %eax	#, tmp406
	movb	%al, (%r8,%r9)	# tmp406, *_272
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%esi, %ebx	# i, n
	jle	.L290	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	104(%r12,%r10), %ecx	# *_280, tmp451
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%esi, %rdx	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	addl	$14, %r11d	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	leal	48(%rcx), %r9d	#, tmp409
	movb	%r9b, (%r8,%rdx)	# tmp409, *_284
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%r11d, %ebx	# i, n
	jle	.L290	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movq	112(%r12,%r10), %r12	# *_94, *_94
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%r11d, %r11	# i, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %r12d	#, tmp412
	movb	%r12b, (%r8,%r11)	# tmp412, *_98
.L290:
# sub_64_aligned.c:826:     str[n] = '\0';
	movb	$0, (%r8,%rbx)	#, *_13
# sub_64_aligned.c:828: }
	leaq	-16(%rbp), %rsp	#,
	movq	%r8, %rax	# <retval>,
	popq	%rbx	#
	popq	%r12	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
.L296:
	.cfi_restore_state
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	xorl	%r10d, %r10d	# niters_vector_mult_vf.283
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	xorl	%r11d, %r11d	# tmp.305
	jmp	.L291	#
.L300:
	vzeroupper
	jmp	.L290	#
.L288:
# sub_64_aligned.c:819:         perror("Memory allocation failed for str\n");
	leaq	.LC24(%rip), %rdi	#, tmp282
	call	perror@PLT	#
# sub_64_aligned.c:820:         exit(0);
	xorl	%edi, %edi	#
	call	exit@PLT	#
	.cfi_endproc
.LFE5799:
	.size	convert_digits_to_string, .-convert_digits_to_string
	.section	.rodata.str1.8
	.align 8
.LC34:
	.string	"experiments/sub_limb_avx_%d_%d.csv"
	.section	.rodata.str1.1
.LC35:
	.string	"experiments/GMP_%d_%d.csv"
.LC36:
	.string	"experiments/my_time_%d_%d.csv"
	.section	.rodata.str1.8
	.align 8
.LC37:
	.string	"experiments/gmp_time_%d_%d.csv"
	.section	.rodata.str1.1
.LC38:
	.string	"Number of bits = %d\n"
.LC39:
	.string	"Number of digits = %d\n"
.LC40:
	.string	"Running tests"
.LC41:
	.string	"Test 1: No Borrow-Propagation"
	.section	.rodata.str1.8
	.align 8
.LC42:
	.string	"Running test 1, with %d iterations\n"
	.section	.rodata.str1.1
.LC43:
	.string	"Error in rdtsc\n"
	.section	.rodata.str1.8
	.align 8
.LC44:
	.string	"Test 1 failed, at iteration %d\n"
	.section	.rodata.str1.1
.LC45:
	.string	"Test 1 iteration %d passed\n"
.LC46:
	.string	"Test 1 completed"
	.section	.rodata.str1.8
	.align 8
.LC47:
	.string	"rdtsc for test 1 = %llu, rdtsc for test 1 gmp = %llu\n"
	.section	.rodata.str1.1
.LC48:
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
	pushq	%r14	#
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
# sub_64_aligned.c:604:     FILE *file = fopen(filename, "w");
	leaq	.LC13(%rip), %r14	#, tmp1295
# sub_64_aligned.c:841: {
	pushq	%r13	#
	pushq	%r12	#
	pushq	%r10	#
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx	#
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-1088(%rbp), %rbx	#, _1157
# sub_64_aligned.c:841: {
	subq	$1472, %rsp	#,
# sub_64_aligned.c:841: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp1686
	movq	%rax, -56(%rbp)	# tmp1686, D.40029
	xorl	%eax, %eax	# tmp1686
# sub_64_aligned.c:842:     initialize_perf();
	call	initialize_perf	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	movl	CORE_NO(%rip), %eax	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC34(%rip), %r8	#,
	movl	$256, %ecx	#,
	movl	$1, %edx	#,
	movq	%rbx, %rdi	# _1157,
	pushq	%rax	# CORE_NO
	movl	$256, %esi	#,
	xorl	%eax, %eax	#
	movq	%rbx, -1440(%rbp)	# _1157, %sfp
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %ecx	# CORE_NO, CORE_NO
	xorl	%eax, %eax	#
	leaq	-832(%rbp), %rdx	#, tmp1299
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	movq	%rdx, %rdi	# tmp1299, tmp1299
	movq	%rdx, -1352(%rbp)	# tmp1299, %sfp
	leaq	.LC35(%rip), %r8	#,
	movl	%ecx, (%rsp)	# CORE_NO,
	movl	$1, %edx	#,
	movl	$256, %ecx	#,
	movl	$256, %esi	#,
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %r8d	# CORE_NO, CORE_NO
	movl	$256, %ecx	#,
	xorl	%eax, %eax	#
	leaq	-576(%rbp), %rsi	#, tmp1309
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	movl	$1, %edx	#,
	movl	%r8d, (%rsp)	# CORE_NO,
	movq	%rsi, %rdi	# tmp1309, tmp1309
	leaq	.LC36(%rip), %r8	#,
	movq	%rsi, -1368(%rbp)	# tmp1309, %sfp
	movl	$256, %esi	#,
	call	__snprintf_chk@PLT	#
	leaq	-320(%rbp), %r9	#, tmp1303
	movl	$256, %ecx	#,
	xorl	%eax, %eax	#
	movl	CORE_NO(%rip), %r11d	# CORE_NO, CORE_NO
	movq	%r9, %rdi	# tmp1303, tmp1303
	movq	%r9, -1360(%rbp)	# tmp1303, %sfp
	movl	$1, %edx	#,
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC37(%rip), %r8	#,
	movl	$256, %esi	#,
	movl	%r11d, (%rsp)	# CORE_NO,
	call	__snprintf_chk@PLT	#
# sub_64_aligned.c:604:     FILE *file = fopen(filename, "w");
	movq	%r14, %rsi	# tmp1295,
	movq	%rbx, %rdi	# _1157,
	call	fopen@PLT	#
# sub_64_aligned.c:606:     if (file == NULL)
	popq	%rdx	#
	popq	%rcx	#
# sub_64_aligned.c:604:     FILE *file = fopen(filename, "w");
	movq	%rax, -1408(%rbp)	# tmp1667, %sfp
# sub_64_aligned.c:606:     if (file == NULL)
	testq	%rax, %rax	#
	je	.L304	#,
	leaq	event_names(%rip), %rdi	#, ivtmp.627
	movq	-1408(%rbp), %rbx	# %sfp, file
	leaq	.LC14(%rip), %r13	#, tmp1296
	movq	%rdi, -1376(%rbp)	# ivtmp.627, %sfp
	leaq	48(%rdi), %r12	#, _21
	movq	%rdi, %r15	# ivtmp.627, ivtmp.634
	.p2align 4,,10
	.p2align 3
.L303:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%r15), %rcx	# MEM[(const char * *)_335],
	movq	%r13, %rdx	# tmp1296,
	movl	$1, %esi	#,
	movq	%rbx, %rdi	# file,
	xorl	%eax, %eax	#
# sub_64_aligned.c:613:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$8, %r15	#, ivtmp.634
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	__fprintf_chk@PLT	#
# sub_64_aligned.c:613:     for (int j = 0; j < MAX_EVENTS; j++)
	cmpq	%r15, %r12	# ivtmp.634, _21
	jne	.L303	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	-1408(%rbp), %rsi	# %sfp,
	movl	$10, %edi	#,
	movq	-1376(%rbp), %rbx	# %sfp, ivtmp.627
	call	fputc@PLT	#
# sub_64_aligned.c:604:     FILE *file = fopen(filename, "w");
	movq	-1352(%rbp), %rdi	# %sfp,
	movq	%r14, %rsi	# tmp1295,
	call	fopen@PLT	#
	movq	%rax, -1416(%rbp)	# tmp1668, %sfp
# sub_64_aligned.c:606:     if (file == NULL)
	testq	%rax, %rax	# file
	je	.L304	#,
	movq	%rax, %r15	# file, file
	.p2align 4,,10
	.p2align 3
.L305:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rbx), %rcx	# MEM[(const char * *)_377],
	movq	%r13, %rdx	# tmp1296,
	movl	$1, %esi	#,
	movq	%r15, %rdi	# file,
	xorl	%eax, %eax	#
# sub_64_aligned.c:613:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$8, %rbx	#, ivtmp.627
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	__fprintf_chk@PLT	#
# sub_64_aligned.c:613:     for (int j = 0; j < MAX_EVENTS; j++)
	cmpq	%rbx, %r12	# ivtmp.627, _21
	jne	.L305	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	-1416(%rbp), %rsi	# %sfp,
	movl	$10, %edi	#,
# sub_64_aligned.c:861:     mpz_init(sample_num);
	leaq	-1232(%rbp), %r12	#, tmp807
# sub_64_aligned.c:864:     gmp_randinit_default(state);
	leaq	-1168(%rbp), %r13	#, tmp808
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	fputc@PLT	#
# sub_64_aligned.c:854:     FILE *time_file = fopen(time_filename, "w");
	movq	-1368(%rbp), %rdi	# %sfp,
	movq	%r14, %rsi	# tmp1295,
	call	fopen@PLT	#
# sub_64_aligned.c:855:     FILE *time_file_gmp = fopen(time_filename_gmp, "w");
	movq	-1360(%rbp), %rdi	# %sfp,
	movq	%r14, %rsi	# tmp1295,
	call	fopen@PLT	#
# sub_64_aligned.c:861:     mpz_init(sample_num);
	movq	%r12, %rdi	# tmp807,
	call	__gmpz_init@PLT	#
# sub_64_aligned.c:863:     unsigned long seed = generate_seed();
	xorl	%eax, %eax	#
	call	generate_seed	#
# sub_64_aligned.c:864:     gmp_randinit_default(state);
	movq	%r13, %rdi	# tmp808,
# sub_64_aligned.c:863:     unsigned long seed = generate_seed();
	movq	%rax, %r14	# tmp1669, seed
# sub_64_aligned.c:864:     gmp_randinit_default(state);
	call	__gmp_randinit_default@PLT	#
# sub_64_aligned.c:865:     gmp_randseed_ui(state, seed);
	movq	%r14, %rsi	# seed,
	movq	%r13, %rdi	# tmp808,
	call	__gmp_randseed_ui@PLT	#
# sub_64_aligned.c:866:     mpz_urandomb(sample_num, state, NUM_BITS);
	movslq	NUM_BITS(%rip), %rdx	# NUM_BITS, NUM_BITS
	movq	%r13, %rsi	# tmp808,
	movq	%r12, %rdi	# tmp807,
	call	__gmpz_urandomb@PLT	#
# sub_64_aligned.c:867:     char *sample_num_str = mpz_get_str(NULL, 10, sample_num);
	movq	%r12, %rdx	# tmp807,
	movl	$10, %esi	#,
	xorl	%edi, %edi	#
	call	__gmpz_get_str@PLT	#
	movq	%rax, %rdi	# tmp1670, sample_num_str
# sub_64_aligned.c:868:     int n = strlen(sample_num_str);
	call	strlen@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	movl	$1, %edi	#,
	leaq	.LC38(%rip), %rsi	#, tmp819
# sub_64_aligned.c:868:     int n = strlen(sample_num_str);
	movl	%eax, %ebx	# tmp816, n.28_22
	movl	%eax, -1344(%rbp)	# tmp816, n
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	movl	%ebx, %edx	# n.28_22,
	leaq	.LC39(%rip), %rsi	#, tmp820
	xorl	%eax, %eax	#
	movl	$1, %edi	#,
	call	__printf_chk@PLT	#
	leaq	.LC40(%rip), %rdi	#, tmp821
	call	puts@PLT	#
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	sub_space(%rip), %rdi	# sub_space,
	movl	$1073741824, %edx	#,
	xorl	%esi, %esi	#
	call	memset@PLT	#
	movq	borrow_space(%rip), %rdi	# borrow_space,
	movl	$1073741824, %edx	#,
	xorl	%esi, %esi	#
# sub_64_aligned.c:880:     sub_space_ptr = 0;
	movl	$0, sub_space_ptr(%rip)	#, sub_space_ptr
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	call	memset@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC41(%rip), %rdi	#, tmp832
# sub_64_aligned.c:883:     borrow_space_ptr = 0;
	movl	$0, borrow_space_ptr(%rip)	#, borrow_space_ptr
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	puts@PLT	#
	movl	$100000, %edx	#,
	leaq	.LC42(%rip), %rsi	#, tmp833
	xorl	%eax, %eax	#
	movl	$1, %edi	#,
	call	__printf_chk@PLT	#
	leaq	-1264(%rbp), %r10	#, tmp1298
	leaq	-1328(%rbp), %rax	#, tmp1293
# sub_64_aligned.c:897:     for (int i = 0; i < ITERATIONS; i++)
	movl	$0, -1380(%rbp)	#, %sfp
# sub_64_aligned.c:895:     unsigned long long test1_rdtsc = 0, test1_rdtsc_gmp = 0;
	movq	$0, -1480(%rbp)	#, %sfp
# sub_64_aligned.c:895:     unsigned long long test1_rdtsc = 0, test1_rdtsc_gmp = 0;
	movq	$0, -1472(%rbp)	#, %sfp
	movq	%r10, -1432(%rbp)	# tmp1298, %sfp
	movq	%rax, -1424(%rbp)	# tmp1293, %sfp
	movl	%ebx, -1360(%rbp)	# n.28_22, %sfp
	.p2align 4,,10
	.p2align 3
.L366:
# sub_64_aligned.c:905:         generate_no_borrow_propagation(&a1_test1, &b1_test1, n);
	movl	-1360(%rbp), %r15d	# %sfp, n.28_22
	movq	-1432(%rbp), %rsi	# %sfp,
	movq	-1424(%rbp), %rdi	# %sfp,
	movl	%r15d, %edx	# n.28_22,
	call	generate_no_borrow_propagation	#
# sub_64_aligned.c:816:     char *str = (char *)calloc(n + 1, sizeof(char));
	leal	1(%r15), %edx	#, tmp836
# sub_64_aligned.c:816:     char *str = (char *)calloc(n + 1, sizeof(char));
	movl	$1, %esi	#,
# sub_64_aligned.c:921:         char *a1_str_test1 = convert_digits_to_string(a1_test1, n);
	movq	-1328(%rbp), %rbx	# a1_test1, a1_test1.25_19
# sub_64_aligned.c:816:     char *str = (char *)calloc(n + 1, sizeof(char));
	movslq	%edx, %r12	# tmp836, _275
	movq	%r12, %rdi	# _275,
	call	calloc@PLT	#
	movq	%rax, -1368(%rbp)	# str, %sfp
# sub_64_aligned.c:817:     if (str == NULL)
	testq	%rax, %rax	# str
	je	.L306	#,
# sub_64_aligned.c:826:     str[n] = '\0';
	movslq	%r15d, %r13	# n.28_22, _439
	leaq	(%rax,%r13), %rsi	#, _440
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	testl	%r15d, %r15d	# n.28_22
	jle	.L803	#,
	movl	-1360(%rbp), %ecx	# %sfp, n.28_22
	leaq	0(,%r13,8), %r8	#, _857
	movq	%rax, %r11	# str, str
	leaq	(%rbx,%r8), %rdi	#, tmp840
	leal	-1(%rcx), %r15d	#, _853
	movl	%ecx, %r14d	# n.28_22, niters.423
	cmpl	$14, %r15d	#, _853
	seta	%r9b	#, _854
	cmpq	%rdi, %rax	# tmp840, str
	setnb	%r10b	#, tmp842
	cmpq	%rsi, %rbx	# _440, a1_test1.25_19
	setnb	%al	#, tmp845
	orb	%al, %r10b	# tmp845, tmp1687
	je	.L309	#,
	testb	%r9b, %r9b	# _854
	je	.L309	#,
	cmpl	$30, %r15d	#, _853
	jbe	.L373	#,
	shrl	$5, %ecx	#, bnd.445
	movq	%rbx, %rdi	# a1_test1.25_19, ivtmp.608
	movq	%r11, %rdx	# str, ivtmp.611
	subl	$1, %ecx	#, tmp849
	salq	$8, %rcx	#, tmp850
	leaq	256(%rbx,%rcx), %rcx	#, _264
	.p2align 4,,10
	.p2align 3
.L311:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	vmovdqu	(%rdi), %ymm5	# MEM <vector(4) long unsigned int> [(uint64_t *)_649], tmp1831
	vmovdqu	64(%rdi), %ymm7	# MEM <vector(4) long unsigned int> [(uint64_t *)_649 + 64B], tmp1833
	addq	$32, %rdx	#, ivtmp.611
	addq	$256, %rdi	#, ivtmp.608
	vperm2i128	$32, -224(%rdi), %ymm5, %ymm0	#, MEM <vector(4) long unsigned int> [(uint64_t *)_649 + 32B], tmp1831, tmp857
	vperm2i128	$49, -224(%rdi), %ymm5, %ymm2	#, MEM <vector(4) long unsigned int> [(uint64_t *)_649 + 32B], tmp1832, tmp858
	vperm2i128	$32, -160(%rdi), %ymm7, %ymm6	#, MEM <vector(4) long unsigned int> [(uint64_t *)_649 + 96B], tmp1833, tmp865
	vperm2i128	$49, -160(%rdi), %ymm7, %ymm10	#, MEM <vector(4) long unsigned int> [(uint64_t *)_649 + 96B], tmp1834, tmp866
	vpshufd	$216, %ymm0, %ymm3	#, tmp857, tmp855
	vpshufd	$216, %ymm2, %ymm4	#, tmp858, tmp856
	vmovdqu	-64(%rdi), %ymm7	# MEM <vector(4) long unsigned int> [(uint64_t *)_649 + 192B], tmp1837
	vpshufd	$216, %ymm6, %ymm11	#, tmp865, tmp863
	vpshufd	$216, %ymm10, %ymm12	#, tmp866, tmp864
	vpunpcklqdq	%ymm4, %ymm3, %ymm8	# tmp856, tmp855, tmp859
	vpunpcklqdq	%ymm12, %ymm11, %ymm13	# tmp864, tmp863, tmp867
	vperm2i128	$32, -32(%rdi), %ymm7, %ymm6	#, MEM <vector(4) long unsigned int> [(uint64_t *)_649 + 224B], tmp1837, tmp887
	vperm2i128	$49, -32(%rdi), %ymm7, %ymm11	#, MEM <vector(4) long unsigned int> [(uint64_t *)_649 + 224B], tmp1838, tmp888
	vpand	.LC25(%rip), %ymm8, %ymm14	#, tmp859, tmp869
	vpand	.LC25(%rip), %ymm13, %ymm15	#, tmp867, tmp870
	vpshufd	$216, %ymm6, %ymm12	#, tmp887, tmp885
	vpshufd	$216, %ymm11, %ymm13	#, tmp888, tmp886
	vpackusdw	%ymm15, %ymm14, %ymm5	# tmp870, tmp869, tmp872
	vpunpcklqdq	%ymm13, %ymm12, %ymm14	# tmp886, tmp885, tmp889
	vpermq	$216, %ymm5, %ymm0	#, tmp872, tmp873
	vmovdqu	-128(%rdi), %ymm5	# MEM <vector(4) long unsigned int> [(uint64_t *)_649 + 128B], tmp1835
	vperm2i128	$32, -96(%rdi), %ymm5, %ymm1	#, MEM <vector(4) long unsigned int> [(uint64_t *)_649 + 160B], tmp1835, tmp879
	vperm2i128	$49, -96(%rdi), %ymm5, %ymm3	#, MEM <vector(4) long unsigned int> [(uint64_t *)_649 + 160B], tmp1836, tmp880
	vpand	.LC25(%rip), %ymm14, %ymm5	#, tmp889, tmp892
	vpshufd	$216, %ymm1, %ymm4	#, tmp879, tmp877
	vpand	.LC26(%rip), %ymm0, %ymm0	#, tmp873, tmp897
	vpshufd	$216, %ymm3, %ymm8	#, tmp880, tmp878
	vpunpcklqdq	%ymm8, %ymm4, %ymm9	# tmp878, tmp877, tmp881
	vpand	.LC25(%rip), %ymm9, %ymm15	#, tmp881, tmp891
	vpackusdw	%ymm5, %ymm15, %ymm1	# tmp892, tmp891, tmp894
	vpermq	$216, %ymm1, %ymm2	#, tmp894, tmp895
	vpand	.LC26(%rip), %ymm2, %ymm3	#, tmp895, tmp898
	vpackuswb	%ymm3, %ymm0, %ymm4	# tmp898, tmp897, tmp900
	vpermq	$216, %ymm4, %ymm8	#, tmp900, tmp901
	vpaddb	.LC27(%rip), %ymm8, %ymm9	#, tmp901, vect__283.461
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	vmovdqu	%ymm9, -32(%rdx)	# vect__283.461, MEM <vector(32) char> [(char *)_661]
	cmpq	%rdi, %rcx	# ivtmp.608, _264
	jne	.L311	#,
	movl	-1360(%rbp), %ecx	# %sfp, n.28_22
	movl	%ecx, %r11d	# n.28_22, niters_vector_mult_vf.446
	andl	$-32, %r11d	#,
	movl	%r11d, %eax	# niters_vector_mult_vf.446, tmp.468
	cmpl	%r11d, %ecx	# niters_vector_mult_vf.446, n.28_22
	je	.L791	#,
	subl	%r11d, %ecx	# niters_vector_mult_vf.446, niters.465
	leal	-1(%rcx), %r10d	#, tmp904
	cmpl	$14, %r10d	#, tmp904
	jbe	.L804	#,
	vzeroupper
.L310:
	leaq	(%rbx,%r11,8), %rdi	#, vectp_a1_test1.470
	movq	-1368(%rbp), %rdx	# %sfp, str
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	vmovdqu	(%rdi), %xmm7	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_a1_test1.470_962], tmp1842
	vmovdqu	32(%rdi), %xmm10	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_a1_test1.470_962 + 32B], tmp1843
	vshufps	$136, 16(%rdi), %xmm7, %xmm6	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_a1_test1.470_962 + 16B], tmp1842, vect__887.481
	vshufps	$136, 48(%rdi), %xmm10, %xmm11	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_a1_test1.470_962 + 48B], tmp1843, vect__887.481
	vpand	.LC28(%rip), %xmm6, %xmm12	#, vect__887.481, tmp913
	vmovdqu	64(%rdi), %xmm15	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_a1_test1.470_962 + 64B], tmp1844
	vshufps	$136, 80(%rdi), %xmm15, %xmm5	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_a1_test1.470_962 + 80B], tmp1844, vect__887.481
	vmovdqu	96(%rdi), %xmm1	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_a1_test1.470_962 + 96B], tmp1845
	vpand	.LC28(%rip), %xmm11, %xmm13	#, vect__887.481, tmp914
	vshufps	$136, 112(%rdi), %xmm1, %xmm2	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_a1_test1.470_962 + 112B], tmp1845, vect__887.481
	vpand	.LC28(%rip), %xmm5, %xmm0	#, vect__887.481, tmp923
	vpand	.LC28(%rip), %xmm2, %xmm3	#, vect__887.481, tmp924
	vpackusdw	%xmm13, %xmm12, %xmm14	# tmp914, tmp913, vect__887.480
	vpand	.LC29(%rip), %xmm14, %xmm8	#, vect__887.480, tmp927
	vpackusdw	%xmm3, %xmm0, %xmm4	# tmp924, tmp923, vect__887.480
	vpand	.LC29(%rip), %xmm4, %xmm9	#, vect__887.480, tmp928
	vpackuswb	%xmm9, %xmm8, %xmm7	# tmp928, tmp927, vect__887.479
	vpaddb	.LC30(%rip), %xmm7, %xmm6	#, vect__887.479, vect__888.482
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	vmovdqu	%xmm6, (%rdx,%r11)	# vect__888.482, MEM <vector(16) char> [(char *)vectp_str.485_992]
	movl	%ecx, %r11d	# niters.465, niters_vector_mult_vf.467
	andl	$-16, %r11d	#, niters_vector_mult_vf.467
	addl	%r11d, %eax	# niters_vector_mult_vf.467, tmp.468
	cmpl	%r11d, %ecx	# niters_vector_mult_vf.467, niters.465
	je	.L316	#,
.L313:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%eax, %r10	# tmp.468, _1099
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movq	-1368(%rbp), %r11	# %sfp, str
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	1(%rax), %edx	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%r10,8), %edi	# *_1101, tmp1848
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	leaq	0(,%r10,8), %rcx	#, _1100
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp933
	movb	%dil, (%r11,%r10)	# tmp933, *_1105
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	movl	-1360(%rbp), %r10d	# %sfp, n.28_22
	cmpl	%edx, %r10d	# i, n.28_22
	jle	.L316	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	8(%rbx,%rcx), %edi	# *_1113, tmp1851
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp936
	movb	%dil, (%r11,%rdx)	# tmp936, *_1117
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	2(%rax), %edx	#, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r10d	# i, n.28_22
	jle	.L316	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	16(%rbx,%rcx), %edi	# *_1125, tmp1854
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp939
	movb	%dil, (%r11,%rdx)	# tmp939, *_1129
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	3(%rax), %edx	#, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r10d	# i, n.28_22
	jle	.L316	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	24(%rbx,%rcx), %edi	# *_1137, tmp1857
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp942
	movb	%dil, (%r11,%rdx)	# tmp942, *_1141
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	4(%rax), %edx	#, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r10d	# i, n.28_22
	jle	.L316	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	32(%rbx,%rcx), %edi	# *_1149, tmp1860
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp945
	movb	%dil, (%r11,%rdx)	# tmp945, *_1153
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	5(%rax), %edx	#, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r10d	# i, n.28_22
	jle	.L316	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	40(%rbx,%rcx), %edi	# *_1161, tmp1863
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp948
	movb	%dil, (%r11,%rdx)	# tmp948, *_1165
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	6(%rax), %edx	#, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r10d	# i, n.28_22
	jle	.L316	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	48(%rbx,%rcx), %edi	# *_1173, tmp1866
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp951
	movb	%dil, (%r11,%rdx)	# tmp951, *_1177
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	7(%rax), %edx	#, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r10d	# i, n.28_22
	jle	.L316	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	56(%rbx,%rcx), %edi	# *_1185, tmp1869
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp954
	movb	%dil, (%r11,%rdx)	# tmp954, *_1189
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	8(%rax), %edx	#, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r10d	# i, n.28_22
	jle	.L316	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	64(%rbx,%rcx), %edi	# *_1197, tmp1872
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp957
	movb	%dil, (%r11,%rdx)	# tmp957, *_1201
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	9(%rax), %edx	#, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r10d	# i, n.28_22
	jle	.L316	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	72(%rbx,%rcx), %edi	# *_1209, tmp1875
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp960
	movb	%dil, (%r11,%rdx)	# tmp960, *_1213
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	10(%rax), %edx	#, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r10d	# i, n.28_22
	jle	.L316	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	80(%rbx,%rcx), %edi	# *_1221, tmp1878
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp963
	movb	%dil, (%r11,%rdx)	# tmp963, *_1225
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	11(%rax), %edx	#, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r10d	# i, n.28_22
	jle	.L316	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	88(%rbx,%rcx), %edi	# *_1233, tmp1881
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp966
	movb	%dil, (%r11,%rdx)	# tmp966, *_1237
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	12(%rax), %edx	#, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r10d	# i, n.28_22
	jle	.L316	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	96(%rbx,%rcx), %edi	# *_1245, tmp1884
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp969
	movb	%dil, (%r11,%rdx)	# tmp969, *_1249
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	13(%rax), %edx	#, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r10d	# i, n.28_22
	jle	.L316	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	104(%rbx,%rcx), %edi	# *_1257, tmp1887
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%edx, %rdx	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	addl	$14, %eax	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %edi	#, tmp972
	movb	%dil, (%r11,%rdx)	# tmp972, *_1261
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%eax, %r10d	# i, n.28_22
	jle	.L316	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movq	112(%rbx,%rcx), %rbx	# *_943, *_943
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	cltq
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %ebx	#, tmp975
	movb	%bl, (%r11,%rax)	# tmp975, *_947
	.p2align 4,,10
	.p2align 3
.L316:
# sub_64_aligned.c:826:     str[n] = '\0';
	movb	$0, (%rsi)	#, *_440
# sub_64_aligned.c:816:     char *str = (char *)calloc(n + 1, sizeof(char));
	movq	%r12, %rdi	# _275,
	movl	$1, %esi	#,
# sub_64_aligned.c:922:         char *b1_str_test1 = convert_digits_to_string(b1_test1, n);
	movq	-1264(%rbp), %rbx	# b1_test1, b1_test1.27_221
	movq	%r8, -1392(%rbp)	# _857, %sfp
	movb	%r9b, -1376(%rbp)	# _854, %sfp
# sub_64_aligned.c:816:     char *str = (char *)calloc(n + 1, sizeof(char));
	call	calloc@PLT	#
# sub_64_aligned.c:817:     if (str == NULL)
	movzbl	-1376(%rbp), %r12d	# %sfp, _854
	movq	-1392(%rbp), %rsi	# %sfp, _857
	testq	%rax, %rax	# str
# sub_64_aligned.c:816:     char *str = (char *)calloc(n + 1, sizeof(char));
	movq	%rax, -1352(%rbp)	# str, %sfp
# sub_64_aligned.c:817:     if (str == NULL)
	je	.L306	#,
	leaq	(%rbx,%rsi), %r8	#, tmp978
	movq	%rax, %r9	# str, str
	cmpq	%r8, %rax	# tmp978, str
	leaq	(%rax,%r13), %rax	#, tmp981
	setnb	%cl	#, tmp980
	cmpq	%rax, %rbx	# tmp981, b1_test1.27_221
	setnb	%r10b	#, tmp983
	orb	%r10b, %cl	# tmp983, tmp1688
	je	.L317	#,
	testb	%r12b, %r12b	# _854
	je	.L317	#,
	cmpl	$30, %r15d	#, _853
	jbe	.L374	#,
	movl	-1360(%rbp), %edx	# %sfp, bnd.403
	movq	%rbx, %r14	# b1_test1.27_221, ivtmp.593
	movq	%r9, %r15	# str, ivtmp.596
	shrl	$5, %edx	#, bnd.403
	subl	$1, %edx	#, tmp987
	salq	$8, %rdx	#, tmp988
	leaq	256(%rbx,%rdx), %rdi	#, _582
	.p2align 4,,10
	.p2align 3
.L319:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	vmovdqu	(%r14), %ymm5	# MEM <vector(4) long unsigned int> [(uint64_t *)_535], tmp1904
	vmovdqu	64(%r14), %ymm7	# MEM <vector(4) long unsigned int> [(uint64_t *)_535 + 64B], tmp1906
	addq	$32, %r15	#, ivtmp.596
	addq	$256, %r14	#, ivtmp.593
	vperm2i128	$32, -224(%r14), %ymm5, %ymm10	#, MEM <vector(4) long unsigned int> [(uint64_t *)_535 + 32B], tmp1904, tmp995
	vperm2i128	$49, -224(%r14), %ymm5, %ymm12	#, MEM <vector(4) long unsigned int> [(uint64_t *)_535 + 32B], tmp1905, tmp996
	vperm2i128	$32, -160(%r14), %ymm7, %ymm1	#, MEM <vector(4) long unsigned int> [(uint64_t *)_535 + 96B], tmp1906, tmp1003
	vperm2i128	$49, -160(%r14), %ymm7, %ymm0	#, MEM <vector(4) long unsigned int> [(uint64_t *)_535 + 96B], tmp1907, tmp1004
	vpshufd	$216, %ymm10, %ymm13	#, tmp995, tmp993
	vpshufd	$216, %ymm12, %ymm14	#, tmp996, tmp994
	vmovdqu	-64(%r14), %ymm7	# MEM <vector(4) long unsigned int> [(uint64_t *)_535 + 192B], tmp1910
	vperm2i128	$32, -32(%r14), %ymm7, %ymm2	#, MEM <vector(4) long unsigned int> [(uint64_t *)_535 + 224B], tmp1910, tmp1025
	vpshufd	$216, %ymm1, %ymm3	#, tmp1003, tmp1001
	vpshufd	$216, %ymm0, %ymm4	#, tmp1004, tmp1002
	vpunpcklqdq	%ymm14, %ymm13, %ymm15	# tmp994, tmp993, tmp997
	vpunpcklqdq	%ymm4, %ymm3, %ymm8	# tmp1002, tmp1001, tmp1005
	vpand	.LC25(%rip), %ymm15, %ymm9	#, tmp997, tmp1007
	vpand	.LC25(%rip), %ymm8, %ymm6	#, tmp1005, tmp1008
	vperm2i128	$49, -32(%r14), %ymm7, %ymm3	#, MEM <vector(4) long unsigned int> [(uint64_t *)_535 + 224B], tmp1911, tmp1026
	vpshufd	$216, %ymm2, %ymm4	#, tmp1025, tmp1023
	vpackusdw	%ymm6, %ymm9, %ymm5	# tmp1008, tmp1007, tmp1010
	vpermq	$216, %ymm5, %ymm10	#, tmp1010, tmp1011
	vmovdqu	-128(%r14), %ymm5	# MEM <vector(4) long unsigned int> [(uint64_t *)_535 + 128B], tmp1908
	vperm2i128	$32, -96(%r14), %ymm5, %ymm11	#, MEM <vector(4) long unsigned int> [(uint64_t *)_535 + 160B], tmp1908, tmp1017
	vpshufd	$216, %ymm3, %ymm8	#, tmp1026, tmp1024
	vperm2i128	$49, -96(%r14), %ymm5, %ymm13	#, MEM <vector(4) long unsigned int> [(uint64_t *)_535 + 160B], tmp1909, tmp1018
	vpunpcklqdq	%ymm8, %ymm4, %ymm9	# tmp1024, tmp1023, tmp1027
	vpand	.LC25(%rip), %ymm9, %ymm5	#, tmp1027, tmp1030
	vpshufd	$216, %ymm11, %ymm14	#, tmp1017, tmp1015
	vpand	.LC26(%rip), %ymm10, %ymm10	#, tmp1011, tmp1035
	vpshufd	$216, %ymm13, %ymm15	#, tmp1018, tmp1016
	vpunpcklqdq	%ymm15, %ymm14, %ymm1	# tmp1016, tmp1015, tmp1019
	vpand	.LC25(%rip), %ymm1, %ymm6	#, tmp1019, tmp1029
	vpackusdw	%ymm5, %ymm6, %ymm11	# tmp1030, tmp1029, tmp1032
	vpermq	$216, %ymm11, %ymm12	#, tmp1032, tmp1033
	vpand	.LC26(%rip), %ymm12, %ymm13	#, tmp1033, tmp1036
	vpackuswb	%ymm13, %ymm10, %ymm14	# tmp1036, tmp1035, tmp1038
	vpermq	$216, %ymm14, %ymm15	#, tmp1038, tmp1039
	vpaddb	.LC27(%rip), %ymm15, %ymm1	#, tmp1039, vect__268.419
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	vmovdqu	%ymm1, -32(%r15)	# vect__268.419, MEM <vector(32) char> [(char *)_553]
	cmpq	%r14, %rdi	# ivtmp.593, _582
	jne	.L319	#,
	movl	-1360(%rbp), %r11d	# %sfp, n.28_22
	movl	%r11d, %r12d	# n.28_22, niters_vector_mult_vf.404
	andl	$-32, %r12d	#, niters_vector_mult_vf.404
	movl	%r12d, %r8d	# niters_vector_mult_vf.404, tmp.426
	cmpl	%r11d, %r12d	# n.28_22, niters_vector_mult_vf.404
	je	.L793	#,
	subl	%r12d, %r11d	# niters_vector_mult_vf.404, niters.423
	leal	-1(%r11), %esi	#, tmp1042
	movl	%r11d, %r14d	# niters.423, niters.423
	cmpl	$14, %esi	#, tmp1042
	jbe	.L805	#,
	vzeroupper
.L318:
	movl	%r12d, %r9d	# niters_vector_mult_vf.404, _812
	movq	-1352(%rbp), %rax	# %sfp, str
	movl	%r14d, %r10d	# niters.423, niters_vector_mult_vf.425
	leaq	(%rbx,%r9,8), %rcx	#, vectp_b1_test1.428
	andl	$-16, %r10d	#, niters_vector_mult_vf.425
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	vmovdqu	(%rcx), %xmm7	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_b1_test1.428_811], tmp1915
	vmovdqu	32(%rcx), %xmm0	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_b1_test1.428_811 + 32B], tmp1916
	vshufps	$136, 16(%rcx), %xmm7, %xmm2	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_b1_test1.428_811 + 16B], tmp1915, vect__731.439
	vshufps	$136, 48(%rcx), %xmm0, %xmm3	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_b1_test1.428_811 + 48B], tmp1916, vect__731.439
	vpand	.LC28(%rip), %xmm2, %xmm4	#, vect__731.439, tmp1051
	vmovdqu	64(%rcx), %xmm6	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_b1_test1.428_811 + 64B], tmp1917
	addl	%r10d, %r8d	# niters_vector_mult_vf.425, tmp.426
	vshufps	$136, 80(%rcx), %xmm6, %xmm5	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_b1_test1.428_811 + 80B], tmp1917, vect__731.439
	vmovdqu	96(%rcx), %xmm11	# MEM <vector(2) long unsigned int> [(uint64_t *)vectp_b1_test1.428_811 + 96B], tmp1918
	vpand	.LC28(%rip), %xmm3, %xmm8	#, vect__731.439, tmp1052
	vshufps	$136, 112(%rcx), %xmm11, %xmm12	#, MEM <vector(2) long unsigned int> [(uint64_t *)vectp_b1_test1.428_811 + 112B], tmp1918, vect__731.439
	vpand	.LC28(%rip), %xmm5, %xmm10	#, vect__731.439, tmp1061
	vpand	.LC28(%rip), %xmm12, %xmm13	#, vect__731.439, tmp1062
	vpackusdw	%xmm8, %xmm4, %xmm9	# tmp1052, tmp1051, vect__731.438
	vpand	.LC29(%rip), %xmm9, %xmm15	#, vect__731.438, tmp1065
	vpackusdw	%xmm13, %xmm10, %xmm14	# tmp1062, tmp1061, vect__731.438
	vpand	.LC29(%rip), %xmm14, %xmm1	#, vect__731.438, tmp1066
	vpackuswb	%xmm1, %xmm15, %xmm7	# tmp1066, tmp1065, vect__731.437
	vpaddb	.LC30(%rip), %xmm7, %xmm2	#, vect__731.437, vect__732.440
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	vmovdqu	%xmm2, (%rax,%r9)	# vect__732.440, MEM <vector(16) char> [(char *)vectp_str.443_841]
	cmpl	%r14d, %r10d	# niters.423, niters_vector_mult_vf.425
	je	.L370	#,
.L321:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%r8d, %r14	# tmp.426, _165
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movq	-1352(%rbp), %rdi	# %sfp, str
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	movl	-1360(%rbp), %r12d	# %sfp, n.28_22
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	1(%r8), %r11d	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%r14,8), %edx	# *_585, tmp1921
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	leaq	0(,%r14,8), %r15	#, _583
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %edx	#, tmp1071
	movb	%dl, (%rdi,%r14)	# tmp1071, *_589
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%r11d, %r12d	# i, n.28_22
	jle	.L370	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	8(%rbx,%r15), %esi	# *_167, tmp1924
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%r11d, %r9	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	2(%r8), %ecx	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %esi	#, tmp1074
	movb	%sil, (%rdi,%r9)	# tmp1074, *_171
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%r12d, %ecx	# n.28_22, i
	jge	.L370	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	16(%rbx,%r15), %r10d	# *_99, tmp1927
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%ecx, %rax	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	3(%r8), %r14d	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %r10d	#, tmp1077
	movb	%r10b, (%rdi,%rax)	# tmp1077, *_87
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%r14d, %r12d	# i, n.28_22
	jle	.L370	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	24(%rbx,%r15), %r11d	# *_723, tmp1930
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%r14d, %rdx	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	4(%r8), %r9d	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %r11d	#, tmp1080
	movb	%r11b, (%rdi,%rdx)	# tmp1080, *_454
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%r9d, %r12d	# i, n.28_22
	jle	.L370	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	32(%rbx,%r15), %esi	# *_386, tmp1933
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%r9d, %rcx	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	5(%r8), %eax	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %esi	#, tmp1083
	movb	%sil, (%rdi,%rcx)	# tmp1083, *_691
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%eax, %r12d	# i, n.28_22
	jle	.L370	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	40(%rbx,%r15), %r14d	# *_246, tmp1936
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%eax, %r10	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	6(%r8), %edx	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %r14d	#, tmp1086
	movb	%r14b, (%rdi,%r10)	# tmp1086, *_244
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%edx, %r12d	# i, n.28_22
	jle	.L370	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	48(%rbx,%r15), %r9d	# *_1005, tmp1939
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%edx, %r11	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	7(%r8), %ecx	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %r9d	#, tmp1089
	movb	%r9b, (%rdi,%r11)	# tmp1089, *_1009
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%ecx, %r12d	# i, n.28_22
	jle	.L370	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	56(%rbx,%r15), %esi	# *_1017, tmp1942
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%ecx, %rax	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	8(%r8), %r10d	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %esi	#, tmp1092
	movb	%sil, (%rdi,%rax)	# tmp1092, *_1021
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%r10d, %r12d	# i, n.28_22
	jle	.L370	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	64(%rbx,%r15), %edx	# *_1029, tmp1945
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%r10d, %r14	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	9(%r8), %r11d	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %edx	#, tmp1095
	movb	%dl, (%rdi,%r14)	# tmp1095, *_1033
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%r11d, %r12d	# i, n.28_22
	jle	.L370	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	72(%rbx,%r15), %ecx	# *_1041, tmp1948
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%r11d, %r9	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	10(%r8), %eax	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %ecx	#, tmp1098
	movb	%cl, (%rdi,%r9)	# tmp1098, *_1045
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%eax, %r12d	# i, n.28_22
	jle	.L370	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	80(%rbx,%r15), %esi	# *_1053, tmp1951
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%eax, %r10	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	11(%r8), %r14d	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %esi	#, tmp1101
	movb	%sil, (%rdi,%r10)	# tmp1101, *_1057
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%r14d, %r12d	# i, n.28_22
	jle	.L370	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	88(%rbx,%r15), %r11d	# *_1065, tmp1954
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%r14d, %rdx	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	12(%r8), %r9d	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %r11d	#, tmp1104
	movb	%r11b, (%rdi,%rdx)	# tmp1104, *_1069
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%r9d, %r12d	# i, n.28_22
	jle	.L370	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	96(%rbx,%r15), %eax	# *_1077, tmp1957
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%r9d, %rcx	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	leal	13(%r8), %r10d	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %eax	#, tmp1107
	movb	%al, (%rdi,%rcx)	# tmp1107, *_1081
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%r10d, %r12d	# i, n.28_22
	jle	.L370	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	104(%rbx,%r15), %esi	# *_1089, tmp1960
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%r10d, %r14	# i, i
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	addl	$14, %r8d	#, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %esi	#, tmp1110
	movb	%sil, (%rdi,%r14)	# tmp1110, *_1093
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	cmpl	%r8d, %r12d	# i, n.28_22
	jle	.L370	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movq	112(%rbx,%r15), %rbx	# *_790, *_790
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movslq	%r8d, %r8	# i, i
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %ebx	#, tmp1113
	movb	%bl, (%rdi,%r8)	# tmp1113, *_794
	.p2align 4,,10
	.p2align 3
.L370:
# sub_64_aligned.c:826:     str[n] = '\0';
	movq	-1352(%rbp), %rbx	# %sfp, str
# sub_64_aligned.c:925:         make_equidistant(&a1_test1, &b1_test1, &n, &n);
	leaq	-1344(%rbp), %rdx	#, tmp1116
	movq	-1432(%rbp), %rsi	# %sfp,
	movq	-1424(%rbp), %rdi	# %sfp,
	movq	%rdx, %rcx	# tmp1116,
# sub_64_aligned.c:826:     str[n] = '\0';
	movb	$0, (%rbx,%r13)	#, *_273
# sub_64_aligned.c:925:         make_equidistant(&a1_test1, &b1_test1, &n, &n);
	call	make_equidistant	#
# sub_64_aligned.c:928:         int n_limb = n;
	movl	-1344(%rbp), %r13d	# n, n.28_22
# sub_64_aligned.c:932:         aligned_uint64_ptr a1_limbs = returnLimbs(a1_test1, &n_limb);
	movq	-1328(%rbp), %rdi	# a1_test1,
	leaq	-1340(%rbp), %rsi	#, tmp1120
# sub_64_aligned.c:928:         int n_limb = n;
	movl	%r13d, -1360(%rbp)	# n.28_22, %sfp
	movl	%r13d, -1340(%rbp)	# n.28_22, n_limb
# sub_64_aligned.c:929:         int m_limb = n;
	movl	%r13d, -1336(%rbp)	# n.28_22, m_limb
# sub_64_aligned.c:932:         aligned_uint64_ptr a1_limbs = returnLimbs(a1_test1, &n_limb);
	call	returnLimbs	#
# sub_64_aligned.c:934:         aligned_uint64_ptr b1_limbs = returnLimbs(b1_test1, &m_limb);
	movq	-1264(%rbp), %rdi	# b1_test1,
	leaq	-1336(%rbp), %rsi	#, tmp1122
# sub_64_aligned.c:932:         aligned_uint64_ptr a1_limbs = returnLimbs(a1_test1, &n_limb);
	movq	%rax, %r12	# tmp1673, a1_limbs
# sub_64_aligned.c:934:         aligned_uint64_ptr b1_limbs = returnLimbs(b1_test1, &m_limb);
	call	returnLimbs	#
# sub_64_aligned.c:939:         int sub_size_test1 = n_limb;
	movl	-1340(%rbp), %r14d	# n_limb, prephitmp_382
# sub_64_aligned.c:934:         aligned_uint64_ptr b1_limbs = returnLimbs(b1_test1, &m_limb);
	movq	%rax, %r13	# tmp1674, b1_limbs
# sub_64_aligned.c:940:         sub_space_ptr += (n_limb + 31) & ~31;
	leal	31(%r14), %r15d	#, tmp1124
# sub_64_aligned.c:939:         int sub_size_test1 = n_limb;
	movl	%r14d, -1332(%rbp)	# prephitmp_382, sub_size_test1
# sub_64_aligned.c:940:         sub_space_ptr += (n_limb + 31) & ~31;
	andl	$-32, %r15d	#, _30
# sub_64_aligned.c:940:         sub_space_ptr += (n_limb + 31) & ~31;
	addl	%r15d, sub_space_ptr(%rip)	# _30, sub_space_ptr
# sub_64_aligned.c:941:         borrow_space_ptr += (n_limb + 31) & ~31;
	addl	%r15d, borrow_space_ptr(%rip)	# _30, borrow_space_ptr
# sub_64_aligned.c:75:     asm volatile("CPUID\n\t"
#APP
# 75 "sub_64_aligned.c" 1
	CPUID
	RDTSC
	mov %edx, %esi	# cycles_high
	mov %eax, %edi	# cycles_low
	
# 0 "" 2
# sub_64_aligned.c:79:     asm volatile("RDTSCP\n\t"
# 79 "sub_64_aligned.c" 1
	RDTSCP
	mov %edx, %esi	# cycles_high1
	mov %eax, %edi	# cycles_low1
	CPUID
	
# 0 "" 2
#NO_APP
	leaq	fd(%rip), %r15	#, ivtmp.506
	movq	%r15, %rbx	# ivtmp.506, ivtmp.584
	.p2align 4,,10
	.p2align 3
.L325:
# sub_64_aligned.c:648:         ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
	movl	(%rbx), %edi	# MEM[(int *)_735],
	xorl	%edx, %edx	#
	movl	$9219, %esi	#,
	xorl	%eax, %eax	#
# sub_64_aligned.c:646:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$4, %rbx	#, ivtmp.584
# sub_64_aligned.c:648:         ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
	call	ioctl@PLT	#
# sub_64_aligned.c:649:         ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
	movl	-4(%rbx), %edi	# MEM[(int *)_735],
	xorl	%edx, %edx	#
	movl	$9216, %esi	#,
	xorl	%eax, %eax	#
	call	ioctl@PLT	#
# sub_64_aligned.c:646:     for (int j = 0; j < MAX_EVENTS; j++)
	leaq	24+fd(%rip), %r9	#, tmp1978
	cmpq	%r9, %rbx	# tmp1978, ivtmp.584
	jne	.L325	#,
# sub_64_aligned.c:91:     asm volatile("CPUID\n\t"
#APP
# 91 "sub_64_aligned.c" 1
	CPUID
	RDTSC
	mov %edx, %edi	# cycles_high
	mov %eax, %r11d	# cycles_low
	
# 0 "" 2
# sub_64_aligned.c:95:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
#NO_APP
	movl	%r11d, %ecx	# cycles_low, cycles_low
# sub_64_aligned.c:95:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	salq	$32, %rdi	#, tmp1133
# sub_64_aligned.c:196:     bool is_less = is_less_than(a, b, n);
	movslq	%r14d, %r8	# prephitmp_382, _134
# sub_64_aligned.c:159:         if (*(a + i) < *(b + i))
	movq	0(%r13), %rsi	# MEM[(uint64_t *)b1_limbs_83 + ivtmp.573_163 * 8], tmp1984
# sub_64_aligned.c:194:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %rax	# sub_space_ptr, _131
	movq	sub_space(%rip), %r11	# sub_space, sub_space.42_129
# sub_64_aligned.c:95:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	orq	%rcx, %rdi	# cycles_low, tmp1133
	leaq	-1(%r8), %r10	#, tmp1357
	movq	%rdi, -1392(%rbp)	# tmp1133, %sfp
	andl	$7, %r10d	#, tmp1359
# sub_64_aligned.c:194:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	%rax, -1376(%rbp)	# _131, %sfp
	salq	$3, %rax	#, _132
	movq	%rax, -1400(%rbp)	# _132, %sfp
# sub_64_aligned.c:194:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%r11,%rax), %rbx	#, result
# sub_64_aligned.c:159:         if (*(a + i) < *(b + i))
	cmpq	%rsi, (%r12)	# tmp1984, MEM[(uint64_t *)a1_limbs_81 + ivtmp.573_163 * 8]
	jb	.L375	#,
# sub_64_aligned.c:163:         else if (*(a + i) > *(b + i))
	ja	.L376	#,
# sub_64_aligned.c:168:     } while (unlikely(i < n));
	movl	$1, %edx	#, ivtmp.573
	cmpq	$1, %r8	#, _134
	ja	.L806	#,
.L752:
# sub_64_aligned.c:197:     if (is_less)
	cmpb	$0, -1381(%rbp)	#, %sfp
	jne	.L377	#,
	movq	%r13, %r9	# b1_limbs, b
	movq	%r12, %r10	# a1_limbs, a
.L326:
# sub_64_aligned.c:206:     aligned_uint64_ptr borrow_array = borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %r12	# borrow_space_ptr, _150
	movq	borrow_space(%rip), %r13	# borrow_space, borrow_space.44_148
	leaq	0(,%r12,8), %rax	#, _151
	movq	%rax, -1448(%rbp)	# _151, %sfp
# sub_64_aligned.c:206:     aligned_uint64_ptr borrow_array = borrow_space + borrow_space_ptr;
	leaq	0(%r13,%rax), %rcx	#, borrow_array
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	testl	%r14d, %r14d	# prephitmp_382
	jle	.L328	#,
	leaq	8(%r10), %rdi	#, _538
	leaq	8(%r9), %rax	#, _546
	movl	%r14d, %edx	# prephitmp_382, niters.387
	vmovq	%rdi, %xmm3	# _538, _538
	vmovq	%rax, %xmm0	# _546, _546
	movq	%rcx, %rax	# borrow_array, tmp1139
	movq	-1400(%rbp), %rdi	# %sfp, _132
	leal	-1(%r14), %esi	#, _522
	leaq	8(%r11,%rdi), %rdi	#, tmp1138
	movl	%esi, -1456(%rbp)	# _522, %sfp
	subq	%rdi, %rax	# tmp1138, tmp1139
	cmpq	$48, %rax	#, tmp1139
	seta	%al	#, tmp1141
	cmpl	$2, %esi	#, _522
	vmovq	%xmm3, %rsi	# _538, _538
	seta	%dil	#, tmp1143
	andl	%edi, %eax	# tmp1143, tmp1144
	movq	%rbx, %rdi	# result, tmp1145
	subq	%rsi, %rdi	# _538, tmp1145
	vmovq	%xmm0, %rsi	# _546, _546
	cmpq	$48, %rdi	#, tmp1145
	seta	%dil	#, tmp1147
	andl	%edi, %eax	# tmp1147, tmp1148
	movq	%rbx, %rdi	# result, tmp1149
	subq	%rsi, %rdi	# _546, tmp1149
	vmovq	%xmm3, %rsi	# _538, _538
	cmpq	$48, %rdi	#, tmp1149
	seta	%dil	#, tmp1151
	andl	%edi, %eax	# tmp1151, tmp1152
	movq	%rcx, %rdi	# borrow_array, tmp1153
	subq	%rsi, %rdi	# _538, tmp1153
	cmpq	$48, %rdi	#, tmp1153
	seta	%dil	#, tmp1155
	testb	%dil, %al	# tmp1155, tmp1152
	je	.L329	#,
	movq	%rcx, %rax	# borrow_array, tmp1157
	vmovq	%xmm0, %rsi	# _546, _546
	subq	%rsi, %rax	# _546, tmp1157
	cmpq	$48, %rax	#, tmp1157
	jbe	.L329	#,
	cmpl	$6, -1456(%rbp)	#, %sfp
	jbe	.L378	#,
	movl	%r14d, %edi	# prephitmp_382, bnd.373
	xorl	%eax, %eax	# ivtmp.563
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	vpxor	%xmm8, %xmm8, %xmm8	# tmp1165
	shrl	$3, %edi	#,
	salq	$6, %rdi	#, _799
	leaq	-64(%rdi), %rdx	#, tmp1353
	shrq	$6, %rdx	#, tmp1351
	addq	$1, %rdx	#, tmp1354
	andl	$7, %edx	#, tmp1355
	je	.L331	#,
	cmpq	$1, %rdx	#, tmp1355
	je	.L619	#,
	cmpq	$2, %rdx	#, tmp1355
	je	.L620	#,
	cmpq	$3, %rdx	#, tmp1355
	je	.L621	#,
	cmpq	$4, %rdx	#, tmp1355
	je	.L622	#,
	cmpq	$5, %rdx	#, tmp1355
	je	.L623	#,
	cmpq	$6, %rdx	#, tmp1355
	je	.L624	#,
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	(%r10), %zmm4	# MEM <vector(8) long unsigned int> [(uint64_t *)a_156 + ivtmp.563_842 * 1], tmp2075
	vpsubq	(%r9), %zmm4, %zmm9	# MEM <vector(8) long unsigned int> [(uint64_t *)b_159 + ivtmp.563_842 * 1], tmp2075, vect__163.382
	movl	$64, %eax	#, ivtmp.563
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	%zmm9, (%rbx)	# vect__163.382, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.563_842 * 1]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	vmovdqu64	%zmm8, (%rcx)	# tmp1165, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.563_842 * 1]
.L624:
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	(%r10,%rax), %zmm6	# MEM <vector(8) long unsigned int> [(uint64_t *)a_156 + ivtmp.563_842 * 1], tmp2076
	vpsubq	(%r9,%rax), %zmm6, %zmm5	# MEM <vector(8) long unsigned int> [(uint64_t *)b_159 + ivtmp.563_842 * 1], tmp2076, vect__163.382
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	%zmm5, (%rbx,%rax)	# vect__163.382, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.563_842 * 1]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	vmovdqu64	%zmm8, (%rcx,%rax)	# tmp1165, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.563_842 * 1]
	addq	$64, %rax	#, ivtmp.563
.L623:
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	(%r10,%rax), %zmm11	# MEM <vector(8) long unsigned int> [(uint64_t *)a_156 + ivtmp.563_842 * 1], tmp2077
	vpsubq	(%r9,%rax), %zmm11, %zmm12	# MEM <vector(8) long unsigned int> [(uint64_t *)b_159 + ivtmp.563_842 * 1], tmp2077, vect__163.382
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	%zmm12, (%rbx,%rax)	# vect__163.382, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.563_842 * 1]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	vmovdqu64	%zmm8, (%rcx,%rax)	# tmp1165, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.563_842 * 1]
	addq	$64, %rax	#, ivtmp.563
.L622:
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	(%r10,%rax), %zmm10	# MEM <vector(8) long unsigned int> [(uint64_t *)a_156 + ivtmp.563_842 * 1], tmp2078
	vpsubq	(%r9,%rax), %zmm10, %zmm13	# MEM <vector(8) long unsigned int> [(uint64_t *)b_159 + ivtmp.563_842 * 1], tmp2078, vect__163.382
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	%zmm13, (%rbx,%rax)	# vect__163.382, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.563_842 * 1]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	vmovdqu64	%zmm8, (%rcx,%rax)	# tmp1165, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.563_842 * 1]
	addq	$64, %rax	#, ivtmp.563
.L621:
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	(%r10,%rax), %zmm14	# MEM <vector(8) long unsigned int> [(uint64_t *)a_156 + ivtmp.563_842 * 1], tmp2079
	vpsubq	(%r9,%rax), %zmm14, %zmm15	# MEM <vector(8) long unsigned int> [(uint64_t *)b_159 + ivtmp.563_842 * 1], tmp2079, vect__163.382
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	%zmm15, (%rbx,%rax)	# vect__163.382, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.563_842 * 1]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	vmovdqu64	%zmm8, (%rcx,%rax)	# tmp1165, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.563_842 * 1]
	addq	$64, %rax	#, ivtmp.563
.L620:
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	(%r10,%rax), %zmm1	# MEM <vector(8) long unsigned int> [(uint64_t *)a_156 + ivtmp.563_842 * 1], tmp2080
	vpsubq	(%r9,%rax), %zmm1, %zmm7	# MEM <vector(8) long unsigned int> [(uint64_t *)b_159 + ivtmp.563_842 * 1], tmp2080, vect__163.382
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	%zmm7, (%rbx,%rax)	# vect__163.382, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.563_842 * 1]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	vmovdqu64	%zmm8, (%rcx,%rax)	# tmp1165, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.563_842 * 1]
	addq	$64, %rax	#, ivtmp.563
.L619:
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	(%r10,%rax), %zmm2	# MEM <vector(8) long unsigned int> [(uint64_t *)a_156 + ivtmp.563_842 * 1], tmp2081
	vpsubq	(%r9,%rax), %zmm2, %zmm3	# MEM <vector(8) long unsigned int> [(uint64_t *)b_159 + ivtmp.563_842 * 1], tmp2081, vect__163.382
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	%zmm3, (%rbx,%rax)	# vect__163.382, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.563_842 * 1]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	vmovdqu64	%zmm8, (%rcx,%rax)	# tmp1165, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.563_842 * 1]
	addq	$64, %rax	#, ivtmp.563
	cmpq	%rax, %rdi	# ivtmp.563, _799
	je	.L751	#,
.L331:
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	(%r10,%rax), %zmm0	# MEM <vector(8) long unsigned int> [(uint64_t *)a_156 + ivtmp.563_842 * 1], tmp2003
	vpsubq	(%r9,%rax), %zmm0, %zmm4	# MEM <vector(8) long unsigned int> [(uint64_t *)b_159 + ivtmp.563_842 * 1], tmp2003, vect__163.382
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	%zmm4, (%rbx,%rax)	# vect__163.382, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.563_842 * 1]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	vmovdqu64	%zmm8, (%rcx,%rax)	# tmp1165, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.563_842 * 1]
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	64(%r10,%rax), %zmm9	# MEM <vector(8) long unsigned int> [(uint64_t *)a_156 + ivtmp.563_842 * 1], tmp2004
	vpsubq	64(%r9,%rax), %zmm9, %zmm6	# MEM <vector(8) long unsigned int> [(uint64_t *)b_159 + ivtmp.563_842 * 1], tmp2004, vect__163.382
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	%zmm6, 64(%rbx,%rax)	# vect__163.382, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.563_842 * 1]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	vmovdqu64	%zmm8, 64(%rcx,%rax)	# tmp1165, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.563_842 * 1]
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	128(%r10,%rax), %zmm5	# MEM <vector(8) long unsigned int> [(uint64_t *)a_156 + ivtmp.563_842 * 1], tmp2005
	vpsubq	128(%r9,%rax), %zmm5, %zmm11	# MEM <vector(8) long unsigned int> [(uint64_t *)b_159 + ivtmp.563_842 * 1], tmp2005, vect__163.382
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	%zmm11, 128(%rbx,%rax)	# vect__163.382, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.563_842 * 1]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	vmovdqu64	%zmm8, 128(%rcx,%rax)	# tmp1165, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.563_842 * 1]
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	192(%r10,%rax), %zmm12	# MEM <vector(8) long unsigned int> [(uint64_t *)a_156 + ivtmp.563_842 * 1], tmp2006
	vpsubq	192(%r9,%rax), %zmm12, %zmm10	# MEM <vector(8) long unsigned int> [(uint64_t *)b_159 + ivtmp.563_842 * 1], tmp2006, vect__163.382
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	%zmm10, 192(%rbx,%rax)	# vect__163.382, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.563_842 * 1]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	vmovdqu64	%zmm8, 192(%rcx,%rax)	# tmp1165, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.563_842 * 1]
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	256(%r10,%rax), %zmm13	# MEM <vector(8) long unsigned int> [(uint64_t *)a_156 + ivtmp.563_842 * 1], tmp2007
	vpsubq	256(%r9,%rax), %zmm13, %zmm14	# MEM <vector(8) long unsigned int> [(uint64_t *)b_159 + ivtmp.563_842 * 1], tmp2007, vect__163.382
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	%zmm14, 256(%rbx,%rax)	# vect__163.382, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.563_842 * 1]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	vmovdqu64	%zmm8, 256(%rcx,%rax)	# tmp1165, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.563_842 * 1]
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	320(%r10,%rax), %zmm15	# MEM <vector(8) long unsigned int> [(uint64_t *)a_156 + ivtmp.563_842 * 1], tmp2008
	vpsubq	320(%r9,%rax), %zmm15, %zmm1	# MEM <vector(8) long unsigned int> [(uint64_t *)b_159 + ivtmp.563_842 * 1], tmp2008, vect__163.382
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	%zmm1, 320(%rbx,%rax)	# vect__163.382, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.563_842 * 1]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	vmovdqu64	%zmm8, 320(%rcx,%rax)	# tmp1165, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.563_842 * 1]
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	384(%r10,%rax), %zmm7	# MEM <vector(8) long unsigned int> [(uint64_t *)a_156 + ivtmp.563_842 * 1], tmp2009
	vpsubq	384(%r9,%rax), %zmm7, %zmm2	# MEM <vector(8) long unsigned int> [(uint64_t *)b_159 + ivtmp.563_842 * 1], tmp2009, vect__163.382
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	%zmm2, 384(%rbx,%rax)	# vect__163.382, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.563_842 * 1]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	vmovdqu64	%zmm8, 384(%rcx,%rax)	# tmp1165, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.563_842 * 1]
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	448(%r10,%rax), %zmm3	# MEM <vector(8) long unsigned int> [(uint64_t *)a_156 + ivtmp.563_842 * 1], tmp2010
	vpsubq	448(%r9,%rax), %zmm3, %zmm0	# MEM <vector(8) long unsigned int> [(uint64_t *)b_159 + ivtmp.563_842 * 1], tmp2010, vect__163.382
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu64	%zmm0, 448(%rbx,%rax)	# vect__163.382, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.563_842 * 1]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	vmovdqu64	%zmm8, 448(%rcx,%rax)	# tmp1165, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.563_842 * 1]
	addq	$512, %rax	#, ivtmp.563
	cmpq	%rax, %rdi	# ivtmp.563, _799
	jne	.L331	#,
.L751:
	movl	%r14d, %eax	# prephitmp_382, niters_vector_mult_vf.374
	andl	$-8, %eax	#,
	movl	%eax, %esi	# niters_vector_mult_vf.374, tmp.390
	cmpl	%eax, %r14d	# niters_vector_mult_vf.374, prephitmp_382
	je	.L797	#,
	movl	%r14d, %edx	# prephitmp_382, niters.387
	subl	%eax, %edx	# niters_vector_mult_vf.374, niters.387
	leal	-1(%rdx), %edi	#, tmp1166
	cmpl	$2, %edi	#, tmp1166
	jbe	.L336	#,
.L330:
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	-1376(%rbp), %rdi	# %sfp, _131
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu	(%r10,%rax,8), %ymm8	# MEM <vector(4) long unsigned int> [(uint64_t *)vectp_a.392_658], tmp2013
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	vpxor	%xmm9, %xmm9, %xmm9	# tmp1172
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vpsubq	(%r9,%rax,8), %ymm8, %ymm4	# MEM <vector(4) long unsigned int> [(uint64_t *)vectp_b.395_664], tmp2013, vect__592.397
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	addq	%rax, %rdi	# _659, tmp1170
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	addq	%r12, %rax	# _150, tmp1171
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	vmovdqu	%ymm4, (%r11,%rdi,8)	# vect__592.397, MEM <vector(4) long unsigned int> [(uint64_t *)vectp.399_671]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	vmovdqu	%ymm9, 0(%r13,%rax,8)	# tmp1172, MEM <vector(4) long unsigned int> [(uint64_t *)vectp.401_680]
	movl	%edx, %eax	# niters.387, niters_vector_mult_vf.389
	andl	$-4, %eax	#, niters_vector_mult_vf.389
	addl	%eax, %esi	# niters_vector_mult_vf.389, tmp.390
	cmpl	%edx, %eax	# niters.387, niters_vector_mult_vf.389
	je	.L797	#,
.L336:
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movslq	%esi, %rdi	# tmp.390, tmp.390
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	(%r10,%rdi,8), %rax	# *_268, *_268
	subq	(%r9,%rdi,8), %rax	# *_270, tmp1176
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	leaq	0(,%rdi,8), %rdx	#, _267
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	%rax, (%rbx,%rdi,8)	# tmp1176, *_725
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	movq	$0, (%rcx,%rdi,8)	#, *_729
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	leal	1(%rsi), %edi	#, i
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	cmpl	%edi, %r14d	# i, prephitmp_382
	jle	.L797	#,
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	8(%r10,%rdx), %rax	# *_737, *_737
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	addl	$2, %esi	#, i
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	subq	8(%r9,%rdx), %rax	# *_411, tmp1181
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	%rax, 8(%rbx,%rdx)	# tmp1181, *_155
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	movq	$0, 8(%rcx,%rdx)	#, *_160
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	cmpl	%esi, %r14d	# i, prephitmp_382
	jle	.L797	#,
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	16(%r10,%rdx), %r10	# *_637, *_637
	subq	16(%r9,%rdx), %r10	# *_639, tmp1186
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	%r10, 16(%rbx,%rdx)	# tmp1186, *_641
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	movq	$0, 16(%rcx,%rdx)	#, *_644
	vzeroupper
.L339:
# sub_64_aligned.c:177:         memset(borrow_array, 0, n * sizeof(uint64_t)); // Clear the array if it's empty or has only one element
	salq	$3, %r8	#, _438
# sub_64_aligned.c:175:     if (n <= 1)
	cmpl	$1, %r14d	#, prephitmp_382
	jle	.L333	#,
.L742:
# sub_64_aligned.c:182:     memmove(borrow_array, borrow_array + 1, (n - 1) * sizeof(uint64_t));
	leaq	-8(%r8), %rdx	#, tmp1198
# sub_64_aligned.c:182:     memmove(borrow_array, borrow_array + 1, (n - 1) * sizeof(uint64_t));
	leaq	8(%rcx), %rsi	#, tmp1199
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	movq	%rcx, %rdi	# borrow_array,
	movq	%r11, -1464(%rbp)	# sub_space.42_129, %sfp
# sub_64_aligned.c:182:     memmove(borrow_array, borrow_array + 1, (n - 1) * sizeof(uint64_t));
	movq	%r8, -1456(%rbp)	# _438, %sfp
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	call	memmove@PLT	#
# sub_64_aligned.c:185:     borrow_array[n - 1] = 0;
	movq	-1456(%rbp), %r8	# %sfp, _438
	movq	-1448(%rbp), %r11	# %sfp, _151
	movq	-1400(%rbp), %rsi	# %sfp, _132
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	movq	%rax, %r9	#, borrow_array
# sub_64_aligned.c:185:     borrow_array[n - 1] = 0;
	movq	$0, -8(%rax,%r8)	#, *_297
	movq	-1464(%rbp), %r8	# %sfp, sub_space.42_129
	leaq	64(%r13,%r11), %rcx	#, tmp1201
	cmpq	%rcx, %rbx	# tmp1201, result
	leaq	64(%r8,%rsi), %rax	#, tmp1205
	setnb	%r10b	#, tmp1203
	cmpq	%rax, %r9	# tmp1205, borrow_array
	setnb	%dl	#, tmp1207
	orb	%dl, %r10b	# tmp1207, tmp1689
	je	.L379	#,
	cmpl	$3, %r14d	#, prephitmp_382
	jle	.L379	#,
	testl	%r14d, %r14d	# prephitmp_382
	movl	$1, %r11d	#, tmp1212
	cmovg	%r14d, %r11d	# prephitmp_382,, niters.342
	cmpl	$7, %r14d	#, prephitmp_382
	jle	.L380	#,
	movl	%r11d, %edi	# niters.342, bnd.343
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	vpxor	%xmm11, %xmm11, %xmm11	# tmp1218
# sub_64_aligned.c:185:     borrow_array[n - 1] = 0;
	xorl	%eax, %eax	# ivtmp.546
	shrl	$3, %edi	#,
	salq	$6, %rdi	#, _740
	leaq	-64(%rdi), %rsi	#, tmp1342
	shrq	$6, %rsi	#, tmp1340
	addq	$1, %rsi	#, tmp1343
	andl	$7, %esi	#, tmp1344
	je	.L345	#,
	cmpq	$1, %rsi	#, tmp1344
	je	.L631	#,
	cmpq	$2, %rsi	#, tmp1344
	je	.L632	#,
	cmpq	$3, %rsi	#, tmp1344
	je	.L633	#,
	cmpq	$4, %rsi	#, tmp1344
	je	.L634	#,
	cmpq	$5, %rsi	#, tmp1344
	je	.L635	#,
	cmpq	$6, %rsi	#, tmp1344
	je	.L636	#,
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	(%rbx), %zmm6	# MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1], tmp2068
	vpsubq	(%r9), %zmm6, %zmm5	# MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1], tmp2068, vect__173.352
	movl	$64, %eax	#, ivtmp.546
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	%zmm5, (%rbx)	# vect__173.352, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	vmovdqu64	%zmm11, (%r9)	# tmp1218, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1]
.L636:
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	(%rbx,%rax), %zmm12	# MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1], tmp2069
	vpsubq	(%r9,%rax), %zmm12, %zmm10	# MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1], tmp2069, vect__173.352
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	%zmm10, (%rbx,%rax)	# vect__173.352, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	vmovdqu64	%zmm11, (%r9,%rax)	# tmp1218, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1]
	addq	$64, %rax	#, ivtmp.546
.L635:
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	(%rbx,%rax), %zmm13	# MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1], tmp2070
	vpsubq	(%r9,%rax), %zmm13, %zmm14	# MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1], tmp2070, vect__173.352
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	%zmm14, (%rbx,%rax)	# vect__173.352, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	vmovdqu64	%zmm11, (%r9,%rax)	# tmp1218, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1]
	addq	$64, %rax	#, ivtmp.546
.L634:
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	(%rbx,%rax), %zmm15	# MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1], tmp2071
	vpsubq	(%r9,%rax), %zmm15, %zmm1	# MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1], tmp2071, vect__173.352
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	%zmm1, (%rbx,%rax)	# vect__173.352, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	vmovdqu64	%zmm11, (%r9,%rax)	# tmp1218, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1]
	addq	$64, %rax	#, ivtmp.546
.L633:
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	(%rbx,%rax), %zmm7	# MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1], tmp2072
	vpsubq	(%r9,%rax), %zmm7, %zmm2	# MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1], tmp2072, vect__173.352
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	%zmm2, (%rbx,%rax)	# vect__173.352, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	vmovdqu64	%zmm11, (%r9,%rax)	# tmp1218, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1]
	addq	$64, %rax	#, ivtmp.546
.L632:
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	(%rbx,%rax), %zmm3	# MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1], tmp2073
	vpsubq	(%r9,%rax), %zmm3, %zmm0	# MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1], tmp2073, vect__173.352
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	%zmm0, (%rbx,%rax)	# vect__173.352, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	vmovdqu64	%zmm11, (%r9,%rax)	# tmp1218, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1]
	addq	$64, %rax	#, ivtmp.546
.L631:
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	(%rbx,%rax), %zmm8	# MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1], tmp2074
	vpsubq	(%r9,%rax), %zmm8, %zmm4	# MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1], tmp2074, vect__173.352
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	%zmm4, (%rbx,%rax)	# vect__173.352, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	vmovdqu64	%zmm11, (%r9,%rax)	# tmp1218, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1]
	addq	$64, %rax	#, ivtmp.546
	cmpq	%rdi, %rax	# _740, ivtmp.546
	je	.L750	#,
.L345:
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	(%rbx,%rax), %zmm9	# MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1], tmp2020
	vpsubq	(%r9,%rax), %zmm9, %zmm6	# MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1], tmp2020, vect__173.352
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	%zmm6, (%rbx,%rax)	# vect__173.352, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	vmovdqu64	%zmm11, (%r9,%rax)	# tmp1218, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1]
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	64(%rbx,%rax), %zmm5	# MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1], tmp2021
	vpsubq	64(%r9,%rax), %zmm5, %zmm12	# MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1], tmp2021, vect__173.352
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	%zmm12, 64(%rbx,%rax)	# vect__173.352, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	vmovdqu64	%zmm11, 64(%r9,%rax)	# tmp1218, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1]
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	128(%rbx,%rax), %zmm10	# MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1], tmp2022
	vpsubq	128(%r9,%rax), %zmm10, %zmm13	# MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1], tmp2022, vect__173.352
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	%zmm13, 128(%rbx,%rax)	# vect__173.352, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	vmovdqu64	%zmm11, 128(%r9,%rax)	# tmp1218, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1]
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	192(%rbx,%rax), %zmm14	# MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1], tmp2023
	vpsubq	192(%r9,%rax), %zmm14, %zmm15	# MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1], tmp2023, vect__173.352
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	%zmm15, 192(%rbx,%rax)	# vect__173.352, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	vmovdqu64	%zmm11, 192(%r9,%rax)	# tmp1218, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1]
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	256(%rbx,%rax), %zmm1	# MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1], tmp2024
	vpsubq	256(%r9,%rax), %zmm1, %zmm7	# MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1], tmp2024, vect__173.352
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	%zmm7, 256(%rbx,%rax)	# vect__173.352, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	vmovdqu64	%zmm11, 256(%r9,%rax)	# tmp1218, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1]
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	320(%rbx,%rax), %zmm2	# MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1], tmp2025
	vpsubq	320(%r9,%rax), %zmm2, %zmm3	# MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1], tmp2025, vect__173.352
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	%zmm3, 320(%rbx,%rax)	# vect__173.352, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	vmovdqu64	%zmm11, 320(%r9,%rax)	# tmp1218, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1]
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	384(%rbx,%rax), %zmm0	# MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1], tmp2026
	vpsubq	384(%r9,%rax), %zmm0, %zmm8	# MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1], tmp2026, vect__173.352
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	%zmm8, 384(%rbx,%rax)	# vect__173.352, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	vmovdqu64	%zmm11, 384(%r9,%rax)	# tmp1218, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1]
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	448(%rbx,%rax), %zmm4	# MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1], tmp2027
	vpsubq	448(%r9,%rax), %zmm4, %zmm9	# MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1], tmp2027, vect__173.352
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu64	%zmm9, 448(%rbx,%rax)	# vect__173.352, MEM <vector(8) long unsigned int> [(uint64_t *)result_133 + ivtmp.546_701 * 1]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	vmovdqu64	%zmm11, 448(%r9,%rax)	# tmp1218, MEM <vector(8) long unsigned int> [(uint64_t *)borrow_array_152 + ivtmp.546_701 * 1]
	addq	$512, %rax	#, ivtmp.546
	cmpq	%rdi, %rax	# _740, ivtmp.546
	jne	.L345	#,
.L750:
	movl	%r11d, %ecx	# niters.342, niters_vector_mult_vf.344
	andl	$-8, %ecx	#,
	movl	%ecx, %r10d	# niters_vector_mult_vf.344, tmp.360
	cmpl	%r11d, %ecx	# niters.342, niters_vector_mult_vf.344
	je	.L800	#,
.L344:
	subl	%ecx, %r11d	# niters_vector_mult_vf.344, niters.357
	leal	-1(%r11), %edx	#, tmp1219
	cmpl	$2, %edx	#, tmp1219
	jbe	.L349	#,
	movq	-1376(%rbp), %rdi	# %sfp, _131
	vpxor	%xmm5, %xmm5, %xmm5	# tmp1227
	addq	%rcx, %rdi	# _484, _131
	addq	%r12, %rcx	# _150, tmp1222
	movl	%r11d, %r12d	# niters.357, niters_vector_mult_vf.359
	leaq	(%r8,%rdi,8), %r8	#, vectp.362
	leaq	0(%r13,%rcx,8), %r13	#, vectp.365
	andl	$-4, %r12d	#, niters_vector_mult_vf.359
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu	(%r8), %ymm11	# MEM <vector(4) long unsigned int> [(uint64_t *)vectp.362_482], tmp2030
	vpsubq	0(%r13), %ymm11, %ymm6	# MEM <vector(4) long unsigned int> [(uint64_t *)vectp.365_490], tmp2030, vect__87.367
	addl	%r12d, %r10d	# niters_vector_mult_vf.359, tmp.360
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	vmovdqu	%ymm6, (%r8)	# vect__87.367, MEM <vector(4) long unsigned int> [(uint64_t *)vectp.362_482]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	vmovdqu	%ymm5, 0(%r13)	# tmp1227, MEM <vector(4) long unsigned int> [(uint64_t *)vectp.365_490]
	cmpl	%r12d, %r11d	# niters_vector_mult_vf.359, niters.357
	je	.L800	#,
.L349:
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movslq	%r10d, %r11	# tmp.360, tmp.360
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	leal	1(%r10), %eax	#, i
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	salq	$3, %r11	#, _280
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	leaq	(%r9,%r11), %rcx	#, _283
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%rcx), %rsi	# *_283, *_283
	subq	%rsi, (%rbx,%r11)	# *_283, *_281
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%rcx)	#, *_283
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	cmpl	%eax, %r14d	# i, prephitmp_382
	jle	.L800	#,
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	leaq	8(%r11), %rdx	#, _887
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	addl	$2, %r10d	#, i
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	leaq	(%r9,%rdx), %rdi	#, _890
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%rdi), %r8	# *_890, *_890
	subq	%r8, (%rbx,%rdx)	# *_890, *_888
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%rdi)	#, *_890
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	cmpl	%r10d, %r14d	# i, prephitmp_382
	jle	.L800	#,
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	addq	$16, %r11	#, _461
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	addq	%r11, %r9	# _461, _464
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%r9), %r10	# *_464, *_464
	subq	%r10, (%rbx,%r11)	# *_464, *_462
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%r9)	#, *_464
	vzeroupper
.L347:
# sub_64_aligned.c:270:     while (result[i] <= 0)
	movq	(%rbx), %rax	# *result_133, iftmp.51_182
	leaq	8(%rbx), %r10	#, ivtmp.532
# sub_64_aligned.c:269:     i = 0;
	xorl	%edx, %edx	# i
# sub_64_aligned.c:270:     while (result[i] <= 0)
	testq	%rax, %rax	# iftmp.51_182
	jne	.L807	#,
.L352:
# sub_64_aligned.c:270:     while (result[i] <= 0)
	movq	(%r10), %rax	# MEM[(uint64_t *)_697 + -8B], iftmp.51_182
# sub_64_aligned.c:272:         i++;
	leal	1(%rdx), %ebx	#, tmp1334
# sub_64_aligned.c:270:     while (result[i] <= 0)
	leaq	8(%r10), %r8	#, tmp1335
# sub_64_aligned.c:270:     while (result[i] <= 0)
	movq	%r10, %rdi	# ivtmp.532, _145
# sub_64_aligned.c:272:         i++;
	movl	%ebx, %edx	# tmp1334, i
# sub_64_aligned.c:270:     while (result[i] <= 0)
	testq	%rax, %rax	# iftmp.51_182
	jne	.L768	#,
# sub_64_aligned.c:270:     while (result[i] <= 0)
	movq	8(%r10), %rax	# MEM[(uint64_t *)_697 + -8B], iftmp.51_182
# sub_64_aligned.c:272:         i++;
	addl	$1, %edx	#, i
# sub_64_aligned.c:270:     while (result[i] <= 0)
	movq	%r8, %rdi	# tmp1335, _145
# sub_64_aligned.c:270:     while (result[i] <= 0)
	leaq	16(%r10), %r13	#, ivtmp.532
	testq	%rax, %rax	# iftmp.51_182
	jne	.L768	#,
# sub_64_aligned.c:270:     while (result[i] <= 0)
	movq	16(%r10), %rax	# MEM[(uint64_t *)_697 + -8B], iftmp.51_182
# sub_64_aligned.c:272:         i++;
	leal	2(%rbx), %edx	#, i
# sub_64_aligned.c:270:     while (result[i] <= 0)
	movq	%r13, %rdi	# ivtmp.532, _145
# sub_64_aligned.c:270:     while (result[i] <= 0)
	leaq	24(%r10), %r12	#, ivtmp.532
	testq	%rax, %rax	# iftmp.51_182
	jne	.L768	#,
# sub_64_aligned.c:270:     while (result[i] <= 0)
	movq	24(%r10), %rax	# MEM[(uint64_t *)_697 + -8B], iftmp.51_182
# sub_64_aligned.c:272:         i++;
	leal	3(%rbx), %edx	#, i
# sub_64_aligned.c:270:     while (result[i] <= 0)
	movq	%r12, %rdi	# ivtmp.532, _145
# sub_64_aligned.c:270:     while (result[i] <= 0)
	leaq	32(%r10), %r11	#, ivtmp.532
	testq	%rax, %rax	# iftmp.51_182
	jne	.L768	#,
# sub_64_aligned.c:270:     while (result[i] <= 0)
	movq	32(%r10), %rax	# MEM[(uint64_t *)_697 + -8B], iftmp.51_182
# sub_64_aligned.c:272:         i++;
	leal	4(%rbx), %edx	#, i
# sub_64_aligned.c:270:     while (result[i] <= 0)
	movq	%r11, %rdi	# ivtmp.532, _145
# sub_64_aligned.c:270:     while (result[i] <= 0)
	leaq	40(%r10), %rsi	#, ivtmp.532
	testq	%rax, %rax	# iftmp.51_182
	jne	.L768	#,
# sub_64_aligned.c:270:     while (result[i] <= 0)
	movq	40(%r10), %rax	# MEM[(uint64_t *)_697 + -8B], iftmp.51_182
# sub_64_aligned.c:272:         i++;
	leal	5(%rbx), %edx	#, i
# sub_64_aligned.c:270:     while (result[i] <= 0)
	movq	%rsi, %rdi	# ivtmp.532, _145
# sub_64_aligned.c:270:     while (result[i] <= 0)
	leaq	48(%r10), %r9	#, ivtmp.532
	testq	%rax, %rax	# iftmp.51_182
	jne	.L768	#,
# sub_64_aligned.c:270:     while (result[i] <= 0)
	movq	48(%r10), %rax	# MEM[(uint64_t *)_697 + -8B], iftmp.51_182
# sub_64_aligned.c:272:         i++;
	leal	6(%rbx), %edx	#, i
# sub_64_aligned.c:270:     while (result[i] <= 0)
	movq	%r9, %rdi	# ivtmp.532, _145
# sub_64_aligned.c:270:     while (result[i] <= 0)
	leaq	56(%r10), %rcx	#, ivtmp.532
	testq	%rax, %rax	# iftmp.51_182
	jne	.L768	#,
# sub_64_aligned.c:270:     while (result[i] <= 0)
	movq	56(%r10), %rax	# MEM[(uint64_t *)_697 + -8B], iftmp.51_182
# sub_64_aligned.c:270:     while (result[i] <= 0)
	addq	$64, %r10	#, ivtmp.532
# sub_64_aligned.c:272:         i++;
	leal	7(%rbx), %edx	#, i
# sub_64_aligned.c:270:     while (result[i] <= 0)
	movq	%rcx, %rdi	# ivtmp.532, _145
# sub_64_aligned.c:270:     while (result[i] <= 0)
	testq	%rax, %rax	# iftmp.51_182
	je	.L352	#,
	.p2align 4,,10
	.p2align 3
.L768:
	movq	%rdi, -1400(%rbp)	# _145, %sfp
# sub_64_aligned.c:278:     *result_size = *result_size - i;
	subl	%edx, %r14d	# i, prephitmp_382
.L342:
# sub_64_aligned.c:275:     result[i] = (is_less) ? -result[i] : result[i];
	movq	%rax, %r10	# iftmp.51_182, tmp1311
# sub_64_aligned.c:275:     result[i] = (is_less) ? -result[i] : result[i];
	movq	-1400(%rbp), %rbx	# %sfp, _145
# sub_64_aligned.c:278:     *result_size = *result_size - i;
	movl	%r14d, -1332(%rbp)	# prephitmp_382, sub_size_test1
# sub_64_aligned.c:275:     result[i] = (is_less) ? -result[i] : result[i];
	negq	%r10	# tmp1311
	cmpb	$0, -1381(%rbp)	#, %sfp
	cmove	%rax, %r10	# tmp1311,, iftmp.51_182, iftmp.51_182
# sub_64_aligned.c:275:     result[i] = (is_less) ? -result[i] : result[i];
	movq	%r10, (%rbx)	# iftmp.51_182, *_145
# sub_64_aligned.c:104:     asm volatile("RDTSCP\n\t"
#APP
# 104 "sub_64_aligned.c" 1
	RDTSCP
	mov %edx, %r14d	# cycles_high
	mov %eax, %r8d	# cycles_low
	CPUID
	
# 0 "" 2
# sub_64_aligned.c:109:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
#NO_APP
	movq	%r14, %rbx	# cycles_high, tmp1238
# sub_64_aligned.c:109:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	movl	%r8d, %r13d	# cycles_low, cycles_low
# sub_64_aligned.c:109:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	leaq	fd(%rip), %r12	#, ivtmp.527
# sub_64_aligned.c:109:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	salq	$32, %rbx	#, tmp1238
# sub_64_aligned.c:109:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	orq	%r13, %rbx	# cycles_low, ticks
	.p2align 4,,10
	.p2align 3
.L355:
# sub_64_aligned.c:657:         if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
	movl	(%r12), %edi	# MEM[(int *)_1205],
	xorl	%edx, %edx	#
	xorl	%eax, %eax	#
	movl	$9217, %esi	#,
	call	ioctl@PLT	#
# sub_64_aligned.c:657:         if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
	cmpl	$-1, %eax	#, tmp1675
	je	.L359	#,
# sub_64_aligned.c:655:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$4, %r12	#, ivtmp.527
	leaq	24+fd(%rip), %r11	#, tmp2036
	cmpq	%r12, %r11	# ivtmp.527, tmp2036
	jne	.L355	#,
# sub_64_aligned.c:972:         read_perf(values);
	leaq	-1136(%rbp), %rdi	#, tmp1304
	movq	%rdi, -1376(%rbp)	# tmp1304, %sfp
	call	read_perf	#
# sub_64_aligned.c:974:         if (end_rdtsc < start_rdtsc)
	cmpq	-1392(%rbp), %rbx	# %sfp, ticks
	jb	.L361	#,
	movq	-1376(%rbp), %rsi	# %sfp, tmp1304
	movq	-1408(%rbp), %r14	# %sfp, file
	movq	%rbx, -1448(%rbp)	# ticks, %sfp
	movq	-1440(%rbp), %r13	# %sfp, _1157
	movq	%rsi, %r12	# tmp1304, ivtmp.499
	movq	%rsi, %rbx	# ivtmp.520, ivtmp.520
	.p2align 4,,10
	.p2align 3
.L357:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%rbx), %rcx	# MEM[(long long int *)_1133],
	leaq	.LC16(%rip), %rdx	#,
	movq	%r14, %rdi	# file,
	xorl	%eax, %eax	#
	movl	$1, %esi	#,
# sub_64_aligned.c:635:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$8, %rbx	#, ivtmp.520
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	__fprintf_chk@PLT	#
# sub_64_aligned.c:635:     for (int j = 0; j < MAX_EVENTS; j++)
	cmpq	%r13, %rbx	# _1157, ivtmp.520
	jne	.L357	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	-1408(%rbp), %rsi	# %sfp,
	movl	$10, %edi	#,
	movq	-1448(%rbp), %r14	# %sfp, ticks
# sub_64_aligned.c:988:         mpz_init(b1_test1_gmp);
	leaq	-1200(%rbp), %rbx	#, tmp1301
# sub_64_aligned.c:989:         mpz_init(sub_gmp_test1);
	leaq	-1184(%rbp), %r13	#, tmp1302
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	fputc@PLT	#
# sub_64_aligned.c:983:         test1_rdtsc += (end_rdtsc - start_rdtsc);
	subq	-1392(%rbp), %r14	# %sfp, tmp1244
# sub_64_aligned.c:983:         test1_rdtsc += (end_rdtsc - start_rdtsc);
	addq	%r14, -1472(%rbp)	# tmp1244, %sfp
# sub_64_aligned.c:987:         mpz_init(a1_test1_gmp);
	leaq	-1216(%rbp), %r14	#, tmp1300
	movq	%r14, %rdi	# tmp1300,
	call	__gmpz_init@PLT	#
# sub_64_aligned.c:988:         mpz_init(b1_test1_gmp);
	movq	%rbx, %rdi	# tmp1301,
	movq	%rbx, -1392(%rbp)	# tmp1301, %sfp
	call	__gmpz_init@PLT	#
# sub_64_aligned.c:989:         mpz_init(sub_gmp_test1);
	movq	%r13, %rdi	# tmp1302,
	call	__gmpz_init@PLT	#
# sub_64_aligned.c:990:         mpz_set_str(a1_test1_gmp, a1_str_test1, 10);
	movq	-1368(%rbp), %rsi	# %sfp,
	movq	%r14, %rdi	# tmp1300,
	movl	$10, %edx	#,
	call	__gmpz_set_str@PLT	#
# sub_64_aligned.c:991:         mpz_set_str(b1_test1_gmp, b1_str_test1, 10);
	movq	-1352(%rbp), %rsi	# %sfp,
	movl	$10, %edx	#,
	movq	%rbx, %rdi	# tmp1301,
	call	__gmpz_set_str@PLT	#
# sub_64_aligned.c:75:     asm volatile("CPUID\n\t"
#APP
# 75 "sub_64_aligned.c" 1
	CPUID
	RDTSC
	mov %edx, %esi	# cycles_high
	mov %eax, %edi	# cycles_low
	
# 0 "" 2
# sub_64_aligned.c:79:     asm volatile("RDTSCP\n\t"
# 79 "sub_64_aligned.c" 1
	RDTSCP
	mov %edx, %esi	# cycles_high1
	mov %eax, %edi	# cycles_low1
	CPUID
	
# 0 "" 2
#NO_APP
	leaq	fd(%rip), %rbx	#, ivtmp.513
	.p2align 4,,10
	.p2align 3
.L358:
# sub_64_aligned.c:648:         ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
	movl	(%rbx), %edi	# MEM[(int *)_965],
	xorl	%edx, %edx	#
	movl	$9219, %esi	#,
	xorl	%eax, %eax	#
# sub_64_aligned.c:646:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$4, %rbx	#, ivtmp.513
# sub_64_aligned.c:648:         ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
	call	ioctl@PLT	#
# sub_64_aligned.c:649:         ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
	movl	-4(%rbx), %edi	# MEM[(int *)_965],
	xorl	%edx, %edx	#
	movl	$9216, %esi	#,
	xorl	%eax, %eax	#
	call	ioctl@PLT	#
# sub_64_aligned.c:646:     for (int j = 0; j < MAX_EVENTS; j++)
	leaq	24+fd(%rip), %r9	#, tmp2041
	cmpq	%r9, %rbx	# tmp2041, ivtmp.513
	jne	.L358	#,
# sub_64_aligned.c:91:     asm volatile("CPUID\n\t"
#APP
# 91 "sub_64_aligned.c" 1
	CPUID
	RDTSC
	mov %edx, %r10d	# cycles_high
	mov %eax, %r8d	# cycles_low
	
# 0 "" 2
# sub_64_aligned.c:95:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
#NO_APP
	movl	%r8d, %ecx	# cycles_low, cycles_low
# sub_64_aligned.c:1010:         mpz_sub(sub_gmp_test1, a1_test1_gmp, b1_test1_gmp);
	movq	-1392(%rbp), %rdx	# %sfp,
	movq	%r14, %rsi	# tmp1300,
	movq	%r13, %rdi	# tmp1302,
# sub_64_aligned.c:95:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	salq	$32, %r10	#, tmp1257
# sub_64_aligned.c:95:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	orq	%rcx, %r10	# cycles_low, tmp1257
	movq	%r10, -1352(%rbp)	# tmp1257, %sfp
# sub_64_aligned.c:1010:         mpz_sub(sub_gmp_test1, a1_test1_gmp, b1_test1_gmp);
	call	__gmpz_sub@PLT	#
# sub_64_aligned.c:104:     asm volatile("RDTSCP\n\t"
#APP
# 104 "sub_64_aligned.c" 1
	RDTSCP
	mov %edx, %r11d	# cycles_high
	mov %eax, %edi	# cycles_low
	CPUID
	
# 0 "" 2
# sub_64_aligned.c:109:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
#NO_APP
	movq	%r11, %rbx	# cycles_high, tmp1265
# sub_64_aligned.c:109:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	movl	%edi, %edx	# cycles_low, cycles_low
# sub_64_aligned.c:109:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	salq	$32, %rbx	#, tmp1265
# sub_64_aligned.c:109:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	orq	%rdx, %rbx	# cycles_low, ticks
	.p2align 4,,10
	.p2align 3
.L360:
# sub_64_aligned.c:657:         if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
	movl	(%r15), %edi	# MEM[(int *)_903],
	xorl	%edx, %edx	#
	xorl	%eax, %eax	#
	movl	$9217, %esi	#,
	call	ioctl@PLT	#
# sub_64_aligned.c:657:         if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
	cmpl	$-1, %eax	#, tmp1676
	je	.L359	#,
# sub_64_aligned.c:655:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$4, %r15	#, ivtmp.506
	leaq	24+fd(%rip), %rax	#, tmp2044
	cmpq	%rax, %r15	# tmp2044, ivtmp.506
	jne	.L360	#,
# sub_64_aligned.c:1020:         read_perf(values);
	movq	-1376(%rbp), %rdi	# %sfp,
	call	read_perf	#
# sub_64_aligned.c:1022:         if (end_rdtsc_gmp < start_rdtsc_gmp)
	cmpq	-1352(%rbp), %rbx	# %sfp, ticks
	jb	.L361	#,
	movq	-1416(%rbp), %r14	# %sfp, file
	movq	-1440(%rbp), %r15	# %sfp, _1157
	.p2align 4,,10
	.p2align 3
.L362:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	(%r12), %rcx	# MEM[(long long int *)_860],
	leaq	.LC16(%rip), %rdx	#,
	movq	%r14, %rdi	# file,
	xorl	%eax, %eax	#
	movl	$1, %esi	#,
# sub_64_aligned.c:635:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$8, %r12	#, ivtmp.499
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	__fprintf_chk@PLT	#
# sub_64_aligned.c:635:     for (int j = 0; j < MAX_EVENTS; j++)
	cmpq	%r15, %r12	# _1157, ivtmp.499
	jne	.L362	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	-1416(%rbp), %rsi	# %sfp,
	movl	$10, %edi	#,
	call	fputc@PLT	#
# sub_64_aligned.c:1034:         char *sub_str_test1 = formatResult(sub_test1, &sub_size_test1);
	movq	-1400(%rbp), %rdi	# %sfp,
	leaq	-1332(%rbp), %rsi	#, tmp1270
# sub_64_aligned.c:1031:         test1_rdtsc_gmp += (end_rdtsc_gmp - start_rdtsc_gmp);
	subq	-1352(%rbp), %rbx	# %sfp, tmp1269
# sub_64_aligned.c:1031:         test1_rdtsc_gmp += (end_rdtsc_gmp - start_rdtsc_gmp);
	addq	%rbx, -1480(%rbp)	# tmp1269, %sfp
# sub_64_aligned.c:1034:         char *sub_str_test1 = formatResult(sub_test1, &sub_size_test1);
	call	formatResult	#
# sub_64_aligned.c:1037:         char *sub_gmp_str_test1 = mpz_get_str(NULL, 10, sub_gmp_test1);
	movq	%r13, %rdx	# tmp1302,
	xorl	%edi, %edi	#
	movl	$10, %esi	#,
# sub_64_aligned.c:1034:         char *sub_str_test1 = formatResult(sub_test1, &sub_size_test1);
	movq	%rax, %r12	# tmp1677, sub_str_test1
# sub_64_aligned.c:1037:         char *sub_gmp_str_test1 = mpz_get_str(NULL, 10, sub_gmp_test1);
	call	__gmpz_get_str@PLT	#
# sub_64_aligned.c:718:     if (strlen(result) != strlen(result_gmp))
	movq	%r12, %rdi	# sub_str_test1,
# sub_64_aligned.c:1040:         if (!check_result(sub_str_test1, sub_gmp_str_test1, sub_size_test1))
	movl	-1332(%rbp), %r14d	# sub_size_test1, sub_size_test1.41_36
# sub_64_aligned.c:1037:         char *sub_gmp_str_test1 = mpz_get_str(NULL, 10, sub_gmp_test1);
	movq	%rax, %r13	# tmp1678, sub_gmp_str_test1
# sub_64_aligned.c:718:     if (strlen(result) != strlen(result_gmp))
	call	strlen@PLT	#
# sub_64_aligned.c:718:     if (strlen(result) != strlen(result_gmp))
	movq	%r13, %rdi	# sub_gmp_str_test1,
# sub_64_aligned.c:718:     if (strlen(result) != strlen(result_gmp))
	movq	%rax, %rbx	# tmp1679, tmp1273
# sub_64_aligned.c:718:     if (strlen(result) != strlen(result_gmp))
	call	strlen@PLT	#
# sub_64_aligned.c:718:     if (strlen(result) != strlen(result_gmp))
	cmpq	%rax, %rbx	# tmp1680, tmp1273
	jne	.L363	#,
# sub_64_aligned.c:725:     for (int i = 0; i < result_size; i++)
	testl	%r14d, %r14d	# sub_size_test1.41_36
	jle	.L364	#,
	movslq	%r14d, %r9	# sub_size_test1.41_36, _584
	xorl	%r10d, %r10d	# ivtmp.488
	andl	$7, %r14d	#, tmp1332
	je	.L365	#,
	cmpq	$1, %r14	#, tmp1332
	je	.L639	#,
	cmpq	$2, %r14	#, tmp1332
	je	.L640	#,
	cmpq	$3, %r14	#, tmp1332
	je	.L641	#,
	cmpq	$4, %r14	#, tmp1332
	je	.L642	#,
	cmpq	$5, %r14	#, tmp1332
	je	.L643	#,
	cmpq	$6, %r14	#, tmp1332
	je	.L644	#,
# sub_64_aligned.c:727:         if (result[i] != result_gmp[i])
	movzbl	0(%r13), %esi	# MEM[(char *)sub_gmp_str_test1_106 + ivtmp.488_1098 * 1], tmp2055
	cmpb	%sil, (%r12)	# tmp2055, MEM[(char *)sub_str_test1_104 + ivtmp.488_1098 * 1]
	jne	.L363	#,
# sub_64_aligned.c:725:     for (int i = 0; i < result_size; i++)
	movl	$1, %r10d	#, ivtmp.488
.L644:
# sub_64_aligned.c:727:         if (result[i] != result_gmp[i])
	movzbl	0(%r13,%r10), %r8d	# MEM[(char *)sub_gmp_str_test1_106 + ivtmp.488_1098 * 1], tmp2056
	cmpb	%r8b, (%r12,%r10)	# tmp2056, MEM[(char *)sub_str_test1_104 + ivtmp.488_1098 * 1]
	jne	.L363	#,
# sub_64_aligned.c:725:     for (int i = 0; i < result_size; i++)
	addq	$1, %r10	#, ivtmp.488
.L643:
# sub_64_aligned.c:727:         if (result[i] != result_gmp[i])
	movzbl	0(%r13,%r10), %ecx	# MEM[(char *)sub_gmp_str_test1_106 + ivtmp.488_1098 * 1], tmp2057
	cmpb	%cl, (%r12,%r10)	# tmp2057, MEM[(char *)sub_str_test1_104 + ivtmp.488_1098 * 1]
	jne	.L363	#,
# sub_64_aligned.c:725:     for (int i = 0; i < result_size; i++)
	addq	$1, %r10	#, ivtmp.488
.L642:
# sub_64_aligned.c:727:         if (result[i] != result_gmp[i])
	movzbl	0(%r13,%r10), %r11d	# MEM[(char *)sub_gmp_str_test1_106 + ivtmp.488_1098 * 1], tmp2058
	cmpb	%r11b, (%r12,%r10)	# tmp2058, MEM[(char *)sub_str_test1_104 + ivtmp.488_1098 * 1]
	jne	.L363	#,
# sub_64_aligned.c:725:     for (int i = 0; i < result_size; i++)
	addq	$1, %r10	#, ivtmp.488
.L641:
# sub_64_aligned.c:727:         if (result[i] != result_gmp[i])
	movzbl	0(%r13,%r10), %edi	# MEM[(char *)sub_gmp_str_test1_106 + ivtmp.488_1098 * 1], tmp2059
	cmpb	%dil, (%r12,%r10)	# tmp2059, MEM[(char *)sub_str_test1_104 + ivtmp.488_1098 * 1]
	jne	.L363	#,
# sub_64_aligned.c:725:     for (int i = 0; i < result_size; i++)
	addq	$1, %r10	#, ivtmp.488
.L640:
# sub_64_aligned.c:727:         if (result[i] != result_gmp[i])
	movzbl	0(%r13,%r10), %edx	# MEM[(char *)sub_gmp_str_test1_106 + ivtmp.488_1098 * 1], tmp2060
	cmpb	%dl, (%r12,%r10)	# tmp2060, MEM[(char *)sub_str_test1_104 + ivtmp.488_1098 * 1]
	jne	.L363	#,
# sub_64_aligned.c:725:     for (int i = 0; i < result_size; i++)
	addq	$1, %r10	#, ivtmp.488
.L639:
# sub_64_aligned.c:727:         if (result[i] != result_gmp[i])
	movzbl	0(%r13,%r10), %eax	# MEM[(char *)sub_gmp_str_test1_106 + ivtmp.488_1098 * 1], tmp2061
	cmpb	%al, (%r12,%r10)	# tmp2061, MEM[(char *)sub_str_test1_104 + ivtmp.488_1098 * 1]
	jne	.L363	#,
# sub_64_aligned.c:725:     for (int i = 0; i < result_size; i++)
	addq	$1, %r10	#, ivtmp.488
	cmpq	%r10, %r9	# ivtmp.488, _584
	je	.L364	#,
.L365:
# sub_64_aligned.c:727:         if (result[i] != result_gmp[i])
	movzbl	0(%r13,%r10), %r15d	# MEM[(char *)sub_gmp_str_test1_106 + ivtmp.488_1098 * 1], tmp2047
	cmpb	%r15b, (%r12,%r10)	# tmp2047, MEM[(char *)sub_str_test1_104 + ivtmp.488_1098 * 1]
	jne	.L363	#,
	movzbl	1(%r13,%r10), %r14d	# MEM[(char *)sub_gmp_str_test1_106 + ivtmp.488_1098 * 1], tmp2048
	cmpb	%r14b, 1(%r12,%r10)	# tmp2048, MEM[(char *)sub_str_test1_104 + ivtmp.488_1098 * 1]
	jne	.L363	#,
	movzbl	2(%r13,%r10), %ebx	# MEM[(char *)sub_gmp_str_test1_106 + ivtmp.488_1098 * 1], tmp2062
	cmpb	%bl, 2(%r12,%r10)	# tmp2062, MEM[(char *)sub_str_test1_104 + ivtmp.488_1098 * 1]
	jne	.L363	#,
	movzbl	3(%r13,%r10), %esi	# MEM[(char *)sub_gmp_str_test1_106 + ivtmp.488_1098 * 1], tmp2063
	cmpb	%sil, 3(%r12,%r10)	# tmp2063, MEM[(char *)sub_str_test1_104 + ivtmp.488_1098 * 1]
	jne	.L363	#,
	movzbl	4(%r13,%r10), %r8d	# MEM[(char *)sub_gmp_str_test1_106 + ivtmp.488_1098 * 1], tmp2064
	cmpb	%r8b, 4(%r12,%r10)	# tmp2064, MEM[(char *)sub_str_test1_104 + ivtmp.488_1098 * 1]
	jne	.L363	#,
	movzbl	5(%r13,%r10), %ecx	# MEM[(char *)sub_gmp_str_test1_106 + ivtmp.488_1098 * 1], tmp2065
	cmpb	%cl, 5(%r12,%r10)	# tmp2065, MEM[(char *)sub_str_test1_104 + ivtmp.488_1098 * 1]
	jne	.L363	#,
	movzbl	6(%r13,%r10), %r11d	# MEM[(char *)sub_gmp_str_test1_106 + ivtmp.488_1098 * 1], tmp2066
	cmpb	%r11b, 6(%r12,%r10)	# tmp2066, MEM[(char *)sub_str_test1_104 + ivtmp.488_1098 * 1]
	jne	.L363	#,
	movzbl	7(%r13,%r10), %edi	# MEM[(char *)sub_gmp_str_test1_106 + ivtmp.488_1098 * 1], tmp2067
	cmpb	%dil, 7(%r12,%r10)	# tmp2067, MEM[(char *)sub_str_test1_104 + ivtmp.488_1098 * 1]
	jne	.L363	#,
# sub_64_aligned.c:725:     for (int i = 0; i < result_size; i++)
	addq	$8, %r10	#, ivtmp.488
	cmpq	%r10, %r9	# ivtmp.488, _584
	jne	.L365	#,
.L364:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	-1380(%rbp), %edx	# %sfp,
	leaq	.LC45(%rip), %rsi	#,
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	.p2align 4,,10
	.p2align 3
.L367:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	-1380(%rbp), %r12d	# %sfp, i
	leaq	.LC45(%rip), %rsi	#,
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	movl	%r12d, %edx	# i,
# sub_64_aligned.c:897:     for (int i = 0; i < ITERATIONS; i++)
	movl	%r12d, %r13d	# i, i
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	__printf_chk@PLT	#
# sub_64_aligned.c:897:     for (int i = 0; i < ITERATIONS; i++)
	addl	$1, %r13d	#, i
# sub_64_aligned.c:1051:         sleep(0.1);
	xorl	%edi, %edi	#
	call	sleep@PLT	#
# sub_64_aligned.c:897:     for (int i = 0; i < ITERATIONS; i++)
	movl	%r13d, -1380(%rbp)	# i, %sfp
# sub_64_aligned.c:897:     for (int i = 0; i < ITERATIONS; i++)
	cmpl	$100000, %r13d	#, i
	jne	.L366	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC46(%rip), %rdi	#, tmp1281
	call	puts@PLT	#
	movq	-1480(%rbp), %r15	# %sfp, test1_rdtsc_gmp
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	movq	-1472(%rbp), %r14	# %sfp, test1_rdtsc
	leaq	.LC47(%rip), %rsi	#, tmp1282
	movq	%r15, %rcx	# test1_rdtsc_gmp,
	movq	%r14, %rdx	# test1_rdtsc,
	call	__printf_chk@PLT	#
# sub_64_aligned.c:1055:     printf("RDTSC Speedup: %f\n", (double)test1_rdtsc_gmp / test1_rdtsc);
	vxorps	%xmm12, %xmm12, %xmm12	# tmp1683
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	leaq	.LC48(%rip), %rsi	#, tmp1286
# sub_64_aligned.c:1055:     printf("RDTSC Speedup: %f\n", (double)test1_rdtsc_gmp / test1_rdtsc);
	vcvtusi2sdq	%r15, %xmm12, %xmm10	# test1_rdtsc_gmp, tmp1683, tmp1684
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %eax	#,
# sub_64_aligned.c:1055:     printf("RDTSC Speedup: %f\n", (double)test1_rdtsc_gmp / test1_rdtsc);
	vcvtusi2sdq	%r14, %xmm12, %xmm13	# test1_rdtsc, tmp1683, tmp1685
	vdivsd	%xmm13, %xmm10, %xmm0	# tmp1284, tmp1283, tmp1285
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	__printf_chk@PLT	#
# sub_64_aligned.c:1056: }
	movq	-56(%rbp), %rax	# D.40029, tmp1690
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp1690
	jne	.L808	#,
	leaq	-48(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r10	#
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	leaq	-8(%r10), %rsp	#,
	.cfi_def_cfa 7, 8
	ret	
	.p2align 4,,10
	.p2align 3
.L363:
	.cfi_restore_state
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	-1380(%rbp), %edx	# %sfp,
	leaq	.LC44(%rip), %rsi	#,
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	jmp	.L367	#
	.p2align 4,,10
	.p2align 3
.L800:
	vzeroupper
# sub_64_aligned.c:270:     while (result[i] <= 0)
	movq	(%rbx), %rax	# *result_133, iftmp.51_182
	leaq	8(%rbx), %r10	#, ivtmp.532
# sub_64_aligned.c:269:     i = 0;
	xorl	%edx, %edx	# i
# sub_64_aligned.c:270:     while (result[i] <= 0)
	testq	%rax, %rax	# iftmp.51_182
	je	.L352	#,
.L807:
	movq	%rbx, -1400(%rbp)	# result, %sfp
	jmp	.L342	#
	.p2align 4,,10
	.p2align 3
.L797:
	vzeroupper
# sub_64_aligned.c:177:         memset(borrow_array, 0, n * sizeof(uint64_t)); // Clear the array if it's empty or has only one element
	salq	$3, %r8	#, _438
# sub_64_aligned.c:175:     if (n <= 1)
	cmpl	$1, %r14d	#, prephitmp_382
	jg	.L742	#,
.L333:
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	xorl	%esi, %esi	#
	movq	%r8, %rdx	# _438,
	movq	%rcx, %rdi	# borrow_array,
	call	memset@PLT	#
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	cmpl	$1, %r14d	#, prephitmp_382
	jne	.L347	#,
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%rax), %rcx	# MEM[(uint64_t *)borrow_array_152], MEM[(uint64_t *)borrow_array_152]
	subq	%rcx, (%rbx)	# MEM[(uint64_t *)borrow_array_152], MEM[(uint64_t *)result_133]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%rax)	#, MEM[(uint64_t *)borrow_array_152]
	jmp	.L347	#
	.p2align 4,,10
	.p2align 3
.L377:
	movq	%r12, %r9	# a1_limbs, b
	movq	%r13, %r10	# b1_limbs, a
	jmp	.L326	#
	.p2align 4,,10
	.p2align 3
.L329:
	movq	%r14, %rdx	# prephitmp_382, tmp1349
	movl	%r14d, %esi	# prephitmp_382, _838
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	xorl	%eax, %eax	# ivtmp.552
	andl	$7, %edx	#, tmp1349
	je	.L338	#,
	cmpq	$1, %rdx	#, tmp1349
	je	.L625	#,
	cmpq	$2, %rdx	#, tmp1349
	je	.L626	#,
	cmpq	$3, %rdx	#, tmp1349
	je	.L627	#,
	cmpq	$4, %rdx	#, tmp1349
	je	.L628	#,
	cmpq	$5, %rdx	#, tmp1349
	je	.L629	#,
	cmpq	$6, %rdx	#, tmp1349
	je	.L630	#,
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	(%r10), %rdi	# MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8], MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8]
	subq	(%r9), %rdi	# MEM[(uint64_t *)b_159 + ivtmp.552_774 * 8], tmp1573
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	movl	$1, %eax	#, ivtmp.552
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	%rdi, (%rbx)	# tmp1573, MEM[(uint64_t *)result_133 + ivtmp.552_774 * 8]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	movq	$0, (%rcx)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.552_774 * 8]
.L630:
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	(%r10,%rax,8), %rdx	# MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8], MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8]
	subq	(%r9,%rax,8), %rdx	# MEM[(uint64_t *)b_159 + ivtmp.552_774 * 8], tmp1575
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	%rdx, (%rbx,%rax,8)	# tmp1575, MEM[(uint64_t *)result_133 + ivtmp.552_774 * 8]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	movq	$0, (%rcx,%rax,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.552_774 * 8]
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	addq	$1, %rax	#, ivtmp.552
.L629:
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	(%r10,%rax,8), %rdi	# MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8], MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8]
	subq	(%r9,%rax,8), %rdi	# MEM[(uint64_t *)b_159 + ivtmp.552_774 * 8], tmp1577
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	%rdi, (%rbx,%rax,8)	# tmp1577, MEM[(uint64_t *)result_133 + ivtmp.552_774 * 8]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	movq	$0, (%rcx,%rax,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.552_774 * 8]
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	addq	$1, %rax	#, ivtmp.552
.L628:
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	(%r10,%rax,8), %rdx	# MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8], MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8]
	subq	(%r9,%rax,8), %rdx	# MEM[(uint64_t *)b_159 + ivtmp.552_774 * 8], tmp1579
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	%rdx, (%rbx,%rax,8)	# tmp1579, MEM[(uint64_t *)result_133 + ivtmp.552_774 * 8]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	movq	$0, (%rcx,%rax,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.552_774 * 8]
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	addq	$1, %rax	#, ivtmp.552
.L627:
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	(%r10,%rax,8), %rdi	# MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8], MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8]
	subq	(%r9,%rax,8), %rdi	# MEM[(uint64_t *)b_159 + ivtmp.552_774 * 8], tmp1581
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	%rdi, (%rbx,%rax,8)	# tmp1581, MEM[(uint64_t *)result_133 + ivtmp.552_774 * 8]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	movq	$0, (%rcx,%rax,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.552_774 * 8]
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	addq	$1, %rax	#, ivtmp.552
.L626:
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	(%r10,%rax,8), %rdx	# MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8], MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8]
	subq	(%r9,%rax,8), %rdx	# MEM[(uint64_t *)b_159 + ivtmp.552_774 * 8], tmp1583
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	%rdx, (%rbx,%rax,8)	# tmp1583, MEM[(uint64_t *)result_133 + ivtmp.552_774 * 8]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	movq	$0, (%rcx,%rax,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.552_774 * 8]
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	addq	$1, %rax	#, ivtmp.552
.L625:
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	(%r10,%rax,8), %rdi	# MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8], MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8]
	subq	(%r9,%rax,8), %rdi	# MEM[(uint64_t *)b_159 + ivtmp.552_774 * 8], tmp1585
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	%rdi, (%rbx,%rax,8)	# tmp1585, MEM[(uint64_t *)result_133 + ivtmp.552_774 * 8]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	movq	$0, (%rcx,%rax,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.552_774 * 8]
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	addq	$1, %rax	#, ivtmp.552
	cmpq	%rsi, %rax	# _838, ivtmp.552
	je	.L339	#,
.L338:
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	(%r10,%rax,8), %rdx	# MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8], MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8]
	subq	(%r9,%rax,8), %rdx	# MEM[(uint64_t *)b_159 + ivtmp.552_774 * 8], tmp1190
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	%rdx, (%rbx,%rax,8)	# tmp1190, MEM[(uint64_t *)result_133 + ivtmp.552_774 * 8]
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	leaq	1(%rax), %rdx	#, tmp1350
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	movq	$0, (%rcx,%rax,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.552_774 * 8]
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	(%r10,%rdx,8), %rdi	# MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8], MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8]
	subq	(%r9,%rdx,8), %rdi	# MEM[(uint64_t *)b_159 + ivtmp.552_774 * 8], tmp1452
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	%rdi, (%rbx,%rdx,8)	# tmp1452, MEM[(uint64_t *)result_133 + ivtmp.552_774 * 8]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	movq	$0, (%rcx,%rdx,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.552_774 * 8]
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	leaq	2(%rax), %rdx	#, ivtmp.552
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	(%r10,%rdx,8), %rdi	# MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8], MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8]
	subq	(%r9,%rdx,8), %rdi	# MEM[(uint64_t *)b_159 + ivtmp.552_774 * 8], tmp1455
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	%rdi, (%rbx,%rdx,8)	# tmp1455, MEM[(uint64_t *)result_133 + ivtmp.552_774 * 8]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	movq	$0, (%rcx,%rdx,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.552_774 * 8]
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	leaq	3(%rax), %rdx	#, ivtmp.552
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	(%r10,%rdx,8), %rdi	# MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8], MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8]
	subq	(%r9,%rdx,8), %rdi	# MEM[(uint64_t *)b_159 + ivtmp.552_774 * 8], tmp1458
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	%rdi, (%rbx,%rdx,8)	# tmp1458, MEM[(uint64_t *)result_133 + ivtmp.552_774 * 8]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	movq	$0, (%rcx,%rdx,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.552_774 * 8]
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	leaq	4(%rax), %rdx	#, ivtmp.552
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	(%r10,%rdx,8), %rdi	# MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8], MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8]
	subq	(%r9,%rdx,8), %rdi	# MEM[(uint64_t *)b_159 + ivtmp.552_774 * 8], tmp1461
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	%rdi, (%rbx,%rdx,8)	# tmp1461, MEM[(uint64_t *)result_133 + ivtmp.552_774 * 8]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	movq	$0, (%rcx,%rdx,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.552_774 * 8]
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	leaq	5(%rax), %rdx	#, ivtmp.552
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	(%r10,%rdx,8), %rdi	# MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8], MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8]
	subq	(%r9,%rdx,8), %rdi	# MEM[(uint64_t *)b_159 + ivtmp.552_774 * 8], tmp1464
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	%rdi, (%rbx,%rdx,8)	# tmp1464, MEM[(uint64_t *)result_133 + ivtmp.552_774 * 8]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	movq	$0, (%rcx,%rdx,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.552_774 * 8]
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	leaq	6(%rax), %rdx	#, ivtmp.552
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	(%r10,%rdx,8), %rdi	# MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8], MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8]
	subq	(%r9,%rdx,8), %rdi	# MEM[(uint64_t *)b_159 + ivtmp.552_774 * 8], tmp1467
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	%rdi, (%rbx,%rdx,8)	# tmp1467, MEM[(uint64_t *)result_133 + ivtmp.552_774 * 8]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	movq	$0, (%rcx,%rdx,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.552_774 * 8]
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	leaq	7(%rax), %rdx	#, ivtmp.552
	addq	$8, %rax	#, ivtmp.552
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	(%r10,%rdx,8), %rdi	# MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8], MEM[(uint64_t *)a_156 + ivtmp.552_774 * 8]
	subq	(%r9,%rdx,8), %rdi	# MEM[(uint64_t *)b_159 + ivtmp.552_774 * 8], tmp1470
# sub_64_aligned.c:215:         result[i] = a[i] - b[i];
	movq	%rdi, (%rbx,%rdx,8)	# tmp1470, MEM[(uint64_t *)result_133 + ivtmp.552_774 * 8]
# sub_64_aligned.c:224:             borrow_array[i] = 0;
	movq	$0, (%rcx,%rdx,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.552_774 * 8]
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	cmpq	%rsi, %rax	# _838, ivtmp.552
	jne	.L338	#,
	jmp	.L339	#
	.p2align 4,,10
	.p2align 3
.L317:
	movl	-1360(%rbp), %r15d	# %sfp,
# sub_64_aligned.c:817:     if (str == NULL)
	xorl	%r9d, %r9d	# ivtmp.586
	movq	%r15, %rdi	# n.28_22, tmp1364
	andl	$7, %edi	#, tmp1364
	je	.L754	#,
	cmpq	$1, %rdi	#, tmp1364
	je	.L613	#,
	cmpq	$2, %rdi	#, tmp1364
	je	.L614	#,
	cmpq	$3, %rdi	#, tmp1364
	je	.L615	#,
	cmpq	$4, %rdi	#, tmp1364
	je	.L616	#,
	cmpq	$5, %rdi	#, tmp1364
	je	.L617	#,
	cmpq	$6, %rdi	#, tmp1364
	je	.L618	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	(%rbx), %r12d	# MEM[(uint64_t *)b1_test1.27_221 + ivtmp.586_1037 * 8], tmp2095
	movq	-1352(%rbp), %r11	# %sfp, str
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	movl	$1, %r9d	#, ivtmp.586
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	addl	$48, %r12d	#, tmp1640
	movb	%r12b, (%r11)	# tmp1640, MEM[(char *)str_400 + ivtmp.586_1037 * 1]
.L618:
	movzbl	(%rbx,%r9,8), %ecx	# MEM[(uint64_t *)b1_test1.27_221 + ivtmp.586_1037 * 8], tmp2097
	movq	-1352(%rbp), %r10	# %sfp, str
	leal	48(%rcx), %eax	#, tmp1642
	movb	%al, (%r10,%r9)	# tmp1642, MEM[(char *)str_400 + ivtmp.586_1037 * 1]
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	addq	$1, %r9	#, ivtmp.586
.L617:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%r9,8), %r14d	# MEM[(uint64_t *)b1_test1.27_221 + ivtmp.586_1037 * 8], tmp2099
	movq	-1352(%rbp), %rsi	# %sfp, str
	leal	48(%r14), %r8d	#, tmp1644
	movb	%r8b, (%rsi,%r9)	# tmp1644, MEM[(char *)str_400 + ivtmp.586_1037 * 1]
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	addq	$1, %r9	#, ivtmp.586
.L616:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%r9,8), %edx	# MEM[(uint64_t *)b1_test1.27_221 + ivtmp.586_1037 * 8], tmp2101
	movq	-1352(%rbp), %r12	# %sfp, str
	leal	48(%rdx), %edi	#, tmp1646
	movb	%dil, (%r12,%r9)	# tmp1646, MEM[(char *)str_400 + ivtmp.586_1037 * 1]
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	addq	$1, %r9	#, ivtmp.586
.L615:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%r9,8), %r11d	# MEM[(uint64_t *)b1_test1.27_221 + ivtmp.586_1037 * 8], tmp2103
	movq	-1352(%rbp), %rax	# %sfp, str
	leal	48(%r11), %ecx	#, tmp1648
	movb	%cl, (%rax,%r9)	# tmp1648, MEM[(char *)str_400 + ivtmp.586_1037 * 1]
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	addq	$1, %r9	#, ivtmp.586
.L614:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%r9,8), %r10d	# MEM[(uint64_t *)b1_test1.27_221 + ivtmp.586_1037 * 8], tmp2105
	movq	-1352(%rbp), %r8	# %sfp, str
	leal	48(%r10), %r14d	#, tmp1650
	movb	%r14b, (%r8,%r9)	# tmp1650, MEM[(char *)str_400 + ivtmp.586_1037 * 1]
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	addq	$1, %r9	#, ivtmp.586
.L613:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%r9,8), %esi	# MEM[(uint64_t *)b1_test1.27_221 + ivtmp.586_1037 * 8], tmp2107
	movq	-1352(%rbp), %rdi	# %sfp, str
	leal	48(%rsi), %edx	#, tmp1652
	movq	%rdi, %r12	# str, str
	movb	%dl, (%rdi,%r9)	# tmp1652, MEM[(char *)str_400 + ivtmp.586_1037 * 1]
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	addq	$1, %r9	#, ivtmp.586
	cmpq	%r9, %r15	# ivtmp.586, _786
	je	.L370	#,
.L323:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%r9,8), %r11d	# MEM[(uint64_t *)b1_test1.27_221 + ivtmp.586_1037 * 8], tmp1966
	addl	$48, %r11d	#, tmp1115
	movb	%r11b, (%r12,%r9)	# tmp1115, MEM[(char *)str_400 + ivtmp.586_1037 * 1]
	movzbl	8(%rbx,%r9,8), %ecx	# MEM[(uint64_t *)b1_test1.27_221 + ivtmp.586_1037 * 8], tmp1967
	addl	$48, %ecx	#, tmp1397
	movb	%cl, 1(%r12,%r9)	# tmp1397, MEM[(char *)str_400 + ivtmp.586_1037 * 1]
	movzbl	16(%rbx,%r9,8), %eax	# MEM[(uint64_t *)b1_test1.27_221 + ivtmp.586_1037 * 8], tmp1968
	addl	$48, %eax	#, tmp1400
	movb	%al, 2(%r12,%r9)	# tmp1400, MEM[(char *)str_400 + ivtmp.586_1037 * 1]
	movzbl	24(%rbx,%r9,8), %r10d	# MEM[(uint64_t *)b1_test1.27_221 + ivtmp.586_1037 * 8], tmp1969
	addl	$48, %r10d	#, tmp1403
	movb	%r10b, 3(%r12,%r9)	# tmp1403, MEM[(char *)str_400 + ivtmp.586_1037 * 1]
	movzbl	32(%rbx,%r9,8), %r14d	# MEM[(uint64_t *)b1_test1.27_221 + ivtmp.586_1037 * 8], tmp1970
	addl	$48, %r14d	#, tmp1406
	movb	%r14b, 4(%r12,%r9)	# tmp1406, MEM[(char *)str_400 + ivtmp.586_1037 * 1]
	movzbl	40(%rbx,%r9,8), %r8d	# MEM[(uint64_t *)b1_test1.27_221 + ivtmp.586_1037 * 8], tmp1971
	addl	$48, %r8d	#, tmp1409
	movb	%r8b, 5(%r12,%r9)	# tmp1409, MEM[(char *)str_400 + ivtmp.586_1037 * 1]
	movzbl	48(%rbx,%r9,8), %esi	# MEM[(uint64_t *)b1_test1.27_221 + ivtmp.586_1037 * 8], tmp1972
	addl	$48, %esi	#, tmp1412
	movb	%sil, 6(%r12,%r9)	# tmp1412, MEM[(char *)str_400 + ivtmp.586_1037 * 1]
	movzbl	56(%rbx,%r9,8), %edx	# MEM[(uint64_t *)b1_test1.27_221 + ivtmp.586_1037 * 8], tmp1973
	addl	$48, %edx	#, tmp1415
	movb	%dl, 7(%r12,%r9)	# tmp1415, MEM[(char *)str_400 + ivtmp.586_1037 * 1]
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	addq	$8, %r9	#, ivtmp.586
	cmpq	%r9, %r15	# ivtmp.586, _786
	jne	.L323	#,
	jmp	.L370	#
	.p2align 4,,10
	.p2align 3
.L309:
	movl	-1360(%rbp), %ecx	# %sfp,
	xorl	%eax, %eax	# ivtmp.601
	movq	%rcx, %r11	#,
	andl	$7, %r11d	#, tmp1369
	je	.L753	#,
	cmpq	$1, %r11	#, tmp1369
	je	.L607	#,
	cmpq	$2, %r11	#, tmp1369
	je	.L608	#,
	cmpq	$3, %r11	#, tmp1369
	je	.L609	#,
	cmpq	$4, %r11	#, tmp1369
	je	.L610	#,
	cmpq	$5, %r11	#, tmp1369
	je	.L611	#,
	cmpq	$6, %r11	#, tmp1369
	je	.L612	#,
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	(%rbx), %eax	# MEM[(uint64_t *)a1_test1.25_19 + ivtmp.601_598 * 8], tmp2109
	movq	-1368(%rbp), %r10	# %sfp, str
	addl	$48, %eax	#, tmp1654
	movb	%al, (%r10)	# tmp1654, MEM[(char *)str_276 + ivtmp.601_598 * 1]
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	movl	$1, %eax	#, ivtmp.601
.L612:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%rax,8), %edx	# MEM[(uint64_t *)a1_test1.25_19 + ivtmp.601_598 * 8], tmp2111
	movq	-1368(%rbp), %rdi	# %sfp, str
	addl	$48, %edx	#, tmp1656
	movb	%dl, (%rdi,%rax)	# tmp1656, MEM[(char *)str_276 + ivtmp.601_598 * 1]
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	addq	$1, %rax	#, ivtmp.601
.L611:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%rax,8), %r11d	# MEM[(uint64_t *)a1_test1.25_19 + ivtmp.601_598 * 8], tmp2113
	movq	-1368(%rbp), %r10	# %sfp, str
	addl	$48, %r11d	#, tmp1658
	movb	%r11b, (%r10,%rax)	# tmp1658, MEM[(char *)str_276 + ivtmp.601_598 * 1]
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	addq	$1, %rax	#, ivtmp.601
.L610:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%rax,8), %edx	# MEM[(uint64_t *)a1_test1.25_19 + ivtmp.601_598 * 8], tmp2115
	movq	-1368(%rbp), %rdi	# %sfp, str
	addl	$48, %edx	#, tmp1660
	movb	%dl, (%rdi,%rax)	# tmp1660, MEM[(char *)str_276 + ivtmp.601_598 * 1]
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	addq	$1, %rax	#, ivtmp.601
.L609:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%rax,8), %r11d	# MEM[(uint64_t *)a1_test1.25_19 + ivtmp.601_598 * 8], tmp2117
	movq	-1368(%rbp), %r10	# %sfp, str
	addl	$48, %r11d	#, tmp1662
	movb	%r11b, (%r10,%rax)	# tmp1662, MEM[(char *)str_276 + ivtmp.601_598 * 1]
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	addq	$1, %rax	#, ivtmp.601
.L608:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%rax,8), %edx	# MEM[(uint64_t *)a1_test1.25_19 + ivtmp.601_598 * 8], tmp2119
	movq	-1368(%rbp), %rdi	# %sfp, str
	addl	$48, %edx	#, tmp1664
	movb	%dl, (%rdi,%rax)	# tmp1664, MEM[(char *)str_276 + ivtmp.601_598 * 1]
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	addq	$1, %rax	#, ivtmp.601
.L607:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%rax,8), %r11d	# MEM[(uint64_t *)a1_test1.25_19 + ivtmp.601_598 * 8], tmp2121
	movq	-1368(%rbp), %rdx	# %sfp, str
	addl	$48, %r11d	#, tmp1666
	movq	%rdx, %r10	# str, str
	movb	%r11b, (%rdx,%rax)	# tmp1666, MEM[(char *)str_276 + ivtmp.601_598 * 1]
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	addq	$1, %rax	#, ivtmp.601
	cmpq	%rcx, %rax	# _621, ivtmp.601
	je	.L316	#,
.L315:
# sub_64_aligned.c:824:         str[i] = digits[i] + '0';
	movzbl	(%rbx,%rax,8), %edi	# MEM[(uint64_t *)a1_test1.25_19 + ivtmp.601_598 * 8], tmp1893
	addl	$48, %edi	#, tmp977
	movb	%dil, (%r10,%rax)	# tmp977, MEM[(char *)str_276 + ivtmp.601_598 * 1]
	movzbl	8(%rbx,%rax,8), %r11d	# MEM[(uint64_t *)a1_test1.25_19 + ivtmp.601_598 * 8], tmp1894
	addl	$48, %r11d	#, tmp1373
	movb	%r11b, 1(%r10,%rax)	# tmp1373, MEM[(char *)str_276 + ivtmp.601_598 * 1]
	movzbl	16(%rbx,%rax,8), %edx	# MEM[(uint64_t *)a1_test1.25_19 + ivtmp.601_598 * 8], tmp1895
	addl	$48, %edx	#, tmp1376
	movb	%dl, 2(%r10,%rax)	# tmp1376, MEM[(char *)str_276 + ivtmp.601_598 * 1]
	movzbl	24(%rbx,%rax,8), %edi	# MEM[(uint64_t *)a1_test1.25_19 + ivtmp.601_598 * 8], tmp1896
	addl	$48, %edi	#, tmp1379
	movb	%dil, 3(%r10,%rax)	# tmp1379, MEM[(char *)str_276 + ivtmp.601_598 * 1]
	movzbl	32(%rbx,%rax,8), %r11d	# MEM[(uint64_t *)a1_test1.25_19 + ivtmp.601_598 * 8], tmp1897
	addl	$48, %r11d	#, tmp1382
	movb	%r11b, 4(%r10,%rax)	# tmp1382, MEM[(char *)str_276 + ivtmp.601_598 * 1]
	movzbl	40(%rbx,%rax,8), %edx	# MEM[(uint64_t *)a1_test1.25_19 + ivtmp.601_598 * 8], tmp1898
	addl	$48, %edx	#, tmp1385
	movb	%dl, 5(%r10,%rax)	# tmp1385, MEM[(char *)str_276 + ivtmp.601_598 * 1]
	movzbl	48(%rbx,%rax,8), %edi	# MEM[(uint64_t *)a1_test1.25_19 + ivtmp.601_598 * 8], tmp1899
	addl	$48, %edi	#, tmp1388
	movb	%dil, 6(%r10,%rax)	# tmp1388, MEM[(char *)str_276 + ivtmp.601_598 * 1]
	movzbl	56(%rbx,%rax,8), %r11d	# MEM[(uint64_t *)a1_test1.25_19 + ivtmp.601_598 * 8], tmp1900
	addl	$48, %r11d	#, tmp1391
	movb	%r11b, 7(%r10,%rax)	# tmp1391, MEM[(char *)str_276 + ivtmp.601_598 * 1]
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	addq	$8, %rax	#, ivtmp.601
	cmpq	%rcx, %rax	# _621, ivtmp.601
	jne	.L315	#,
	jmp	.L316	#
	.p2align 4,,10
	.p2align 3
.L803:
# sub_64_aligned.c:826:     str[n] = '\0';
	movb	$0, (%rsi)	#, *_440
# sub_64_aligned.c:816:     char *str = (char *)calloc(n + 1, sizeof(char));
	movq	%r12, %rdi	# _275,
	movl	$1, %esi	#,
	call	calloc@PLT	#
	movq	%rax, -1352(%rbp)	# str, %sfp
# sub_64_aligned.c:817:     if (str == NULL)
	testq	%rax, %rax	# str
	jne	.L370	#,
.L306:
# sub_64_aligned.c:819:         perror("Memory allocation failed for str\n");
	leaq	.LC24(%rip), %rdi	#, tmp838
	call	perror@PLT	#
# sub_64_aligned.c:820:         exit(0);
	xorl	%edi, %edi	#
	call	exit@PLT	#
	.p2align 4,,10
	.p2align 3
.L328:
# sub_64_aligned.c:177:         memset(borrow_array, 0, n * sizeof(uint64_t)); // Clear the array if it's empty or has only one element
	salq	$3, %r8	#, _438
	jmp	.L333	#
	.p2align 4,,10
	.p2align 3
.L806:
	testq	%r10, %r10	# tmp1359
	je	.L327	#,
	cmpq	$1, %r10	#, tmp1359
	je	.L658	#,
	cmpq	$2, %r10	#, tmp1359
	je	.L659	#,
	cmpq	$3, %r10	#, tmp1359
	je	.L660	#,
	cmpq	$4, %r10	#, tmp1359
	je	.L661	#,
	cmpq	$5, %r10	#, tmp1359
	je	.L662	#,
	cmpq	$6, %r10	#, tmp1359
	je	.L663	#,
# sub_64_aligned.c:159:         if (*(a + i) < *(b + i))
	movq	8(%r13), %r9	# MEM[(uint64_t *)b1_limbs_83 + ivtmp.573_163 * 8], tmp2082
	cmpq	%r9, 8(%r12)	# tmp2082, MEM[(uint64_t *)a1_limbs_81 + ivtmp.573_163 * 8]
	jb	.L375	#,
# sub_64_aligned.c:163:         else if (*(a + i) > *(b + i))
	ja	.L376	#,
# sub_64_aligned.c:168:     } while (unlikely(i < n));
	addq	$1, %rdx	#, ivtmp.573
.L663:
# sub_64_aligned.c:159:         if (*(a + i) < *(b + i))
	movq	0(%r13,%rdx,8), %rdi	# MEM[(uint64_t *)b1_limbs_83 + ivtmp.573_163 * 8], tmp2083
	cmpq	%rdi, (%r12,%rdx,8)	# tmp2083, MEM[(uint64_t *)a1_limbs_81 + ivtmp.573_163 * 8]
	jb	.L375	#,
# sub_64_aligned.c:163:         else if (*(a + i) > *(b + i))
	ja	.L376	#,
# sub_64_aligned.c:168:     } while (unlikely(i < n));
	addq	$1, %rdx	#, ivtmp.573
.L662:
# sub_64_aligned.c:159:         if (*(a + i) < *(b + i))
	movq	0(%r13,%rdx,8), %rcx	# MEM[(uint64_t *)b1_limbs_83 + ivtmp.573_163 * 8], tmp2084
	cmpq	%rcx, (%r12,%rdx,8)	# tmp2084, MEM[(uint64_t *)a1_limbs_81 + ivtmp.573_163 * 8]
	jb	.L375	#,
# sub_64_aligned.c:163:         else if (*(a + i) > *(b + i))
	ja	.L376	#,
# sub_64_aligned.c:168:     } while (unlikely(i < n));
	addq	$1, %rdx	#, ivtmp.573
.L661:
# sub_64_aligned.c:159:         if (*(a + i) < *(b + i))
	movq	0(%r13,%rdx,8), %rax	# MEM[(uint64_t *)b1_limbs_83 + ivtmp.573_163 * 8], tmp2085
	cmpq	%rax, (%r12,%rdx,8)	# tmp2085, MEM[(uint64_t *)a1_limbs_81 + ivtmp.573_163 * 8]
	jb	.L375	#,
# sub_64_aligned.c:163:         else if (*(a + i) > *(b + i))
	ja	.L376	#,
# sub_64_aligned.c:168:     } while (unlikely(i < n));
	addq	$1, %rdx	#, ivtmp.573
.L660:
# sub_64_aligned.c:159:         if (*(a + i) < *(b + i))
	movq	0(%r13,%rdx,8), %r10	# MEM[(uint64_t *)b1_limbs_83 + ivtmp.573_163 * 8], tmp2086
	cmpq	%r10, (%r12,%rdx,8)	# tmp2086, MEM[(uint64_t *)a1_limbs_81 + ivtmp.573_163 * 8]
	jb	.L375	#,
# sub_64_aligned.c:163:         else if (*(a + i) > *(b + i))
	ja	.L376	#,
# sub_64_aligned.c:168:     } while (unlikely(i < n));
	addq	$1, %rdx	#, ivtmp.573
.L659:
# sub_64_aligned.c:159:         if (*(a + i) < *(b + i))
	movq	0(%r13,%rdx,8), %rsi	# MEM[(uint64_t *)b1_limbs_83 + ivtmp.573_163 * 8], tmp2087
	cmpq	%rsi, (%r12,%rdx,8)	# tmp2087, MEM[(uint64_t *)a1_limbs_81 + ivtmp.573_163 * 8]
	jb	.L375	#,
# sub_64_aligned.c:163:         else if (*(a + i) > *(b + i))
	ja	.L376	#,
# sub_64_aligned.c:168:     } while (unlikely(i < n));
	addq	$1, %rdx	#, ivtmp.573
.L658:
# sub_64_aligned.c:159:         if (*(a + i) < *(b + i))
	movq	0(%r13,%rdx,8), %r9	# MEM[(uint64_t *)b1_limbs_83 + ivtmp.573_163 * 8], tmp2088
	cmpq	%r9, (%r12,%rdx,8)	# tmp2088, MEM[(uint64_t *)a1_limbs_81 + ivtmp.573_163 * 8]
	jb	.L375	#,
# sub_64_aligned.c:163:         else if (*(a + i) > *(b + i))
	ja	.L376	#,
# sub_64_aligned.c:168:     } while (unlikely(i < n));
	addq	$1, %rdx	#, ivtmp.573
	cmpq	%rdx, %r8	# ivtmp.573, _134
	jbe	.L752	#,
.L327:
# sub_64_aligned.c:159:         if (*(a + i) < *(b + i))
	movq	0(%r13,%rdx,8), %rdi	# MEM[(uint64_t *)b1_limbs_83 + ivtmp.573_163 * 8], tmp1985
	cmpq	%rdi, (%r12,%rdx,8)	# tmp1985, MEM[(uint64_t *)a1_limbs_81 + ivtmp.573_163 * 8]
	jb	.L375	#,
# sub_64_aligned.c:163:         else if (*(a + i) > *(b + i))
	ja	.L376	#,
# sub_64_aligned.c:159:         if (*(a + i) < *(b + i))
	movq	8(%r13,%rdx,8), %rcx	# MEM[(uint64_t *)b1_limbs_83 + ivtmp.573_163 * 8], tmp1986
# sub_64_aligned.c:168:     } while (unlikely(i < n));
	leaq	1(%rdx), %rax	#, tmp1360
# sub_64_aligned.c:159:         if (*(a + i) < *(b + i))
	cmpq	%rcx, 8(%r12,%rdx,8)	# tmp1986, MEM[(uint64_t *)a1_limbs_81 + ivtmp.573_163 * 8]
	jb	.L375	#,
# sub_64_aligned.c:163:         else if (*(a + i) > *(b + i))
	ja	.L376	#,
# sub_64_aligned.c:159:         if (*(a + i) < *(b + i))
	movq	16(%r13,%rdx,8), %r10	# MEM[(uint64_t *)b1_limbs_83 + ivtmp.573_163 * 8], tmp2089
	cmpq	%r10, 16(%r12,%rdx,8)	# tmp2089, MEM[(uint64_t *)a1_limbs_81 + ivtmp.573_163 * 8]
	jb	.L375	#,
# sub_64_aligned.c:163:         else if (*(a + i) > *(b + i))
	ja	.L376	#,
# sub_64_aligned.c:159:         if (*(a + i) < *(b + i))
	movq	24(%r13,%rdx,8), %rsi	# MEM[(uint64_t *)b1_limbs_83 + ivtmp.573_163 * 8], tmp2090
	cmpq	%rsi, 24(%r12,%rdx,8)	# tmp2090, MEM[(uint64_t *)a1_limbs_81 + ivtmp.573_163 * 8]
	jb	.L375	#,
# sub_64_aligned.c:163:         else if (*(a + i) > *(b + i))
	ja	.L376	#,
# sub_64_aligned.c:159:         if (*(a + i) < *(b + i))
	movq	32(%r13,%rdx,8), %r9	# MEM[(uint64_t *)b1_limbs_83 + ivtmp.573_163 * 8], tmp2091
	cmpq	%r9, 32(%r12,%rdx,8)	# tmp2091, MEM[(uint64_t *)a1_limbs_81 + ivtmp.573_163 * 8]
	jb	.L375	#,
# sub_64_aligned.c:163:         else if (*(a + i) > *(b + i))
	ja	.L376	#,
# sub_64_aligned.c:159:         if (*(a + i) < *(b + i))
	movq	32(%r13,%rax,8), %rdx	# MEM[(uint64_t *)b1_limbs_83 + ivtmp.573_163 * 8], tmp2092
	cmpq	%rdx, 32(%r12,%rax,8)	# tmp2092, MEM[(uint64_t *)a1_limbs_81 + ivtmp.573_163 * 8]
	jb	.L375	#,
# sub_64_aligned.c:163:         else if (*(a + i) > *(b + i))
	ja	.L376	#,
# sub_64_aligned.c:159:         if (*(a + i) < *(b + i))
	movq	40(%r13,%rax,8), %rdi	# MEM[(uint64_t *)b1_limbs_83 + ivtmp.573_163 * 8], tmp2093
	cmpq	%rdi, 40(%r12,%rax,8)	# tmp2093, MEM[(uint64_t *)a1_limbs_81 + ivtmp.573_163 * 8]
	jb	.L375	#,
# sub_64_aligned.c:163:         else if (*(a + i) > *(b + i))
	ja	.L376	#,
# sub_64_aligned.c:159:         if (*(a + i) < *(b + i))
	movq	48(%r13,%rax,8), %rcx	# MEM[(uint64_t *)b1_limbs_83 + ivtmp.573_163 * 8], tmp2094
	cmpq	%rcx, 48(%r12,%rax,8)	# tmp2094, MEM[(uint64_t *)a1_limbs_81 + ivtmp.573_163 * 8]
	jb	.L375	#,
# sub_64_aligned.c:163:         else if (*(a + i) > *(b + i))
	ja	.L376	#,
# sub_64_aligned.c:168:     } while (unlikely(i < n));
	leaq	7(%rax), %rdx	#, ivtmp.573
	cmpq	%rdx, %r8	# ivtmp.573, _134
	jbe	.L752	#,
	jmp	.L327	#
	.p2align 4,,10
	.p2align 3
.L380:
# sub_64_aligned.c:185:     borrow_array[n - 1] = 0;
	xorl	%ecx, %ecx	#
	xorl	%r10d, %r10d	# tmp.360
	jmp	.L344	#
.L373:
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	xorl	%r11d, %r11d	#
# sub_64_aligned.c:822:     for (int i = 0; i < n; i++)
	xorl	%eax, %eax	# tmp.468
	jmp	.L310	#
.L378:
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	xorl	%eax, %eax	#
# sub_64_aligned.c:212:     for (i = 0; i < n; i++)
	xorl	%esi, %esi	# tmp.390
	jmp	.L330	#
.L374:
# sub_64_aligned.c:817:     if (str == NULL)
	xorl	%r12d, %r12d	# niters_vector_mult_vf.404
	xorl	%r8d, %r8d	# tmp.426
	jmp	.L318	#
.L804:
	vzeroupper
	jmp	.L313	#
.L805:
	vzeroupper
	jmp	.L321	#
.L375:
# sub_64_aligned.c:161:             return true;
	movb	$1, -1381(%rbp)	#, %sfp
	movq	%r12, %r9	# a1_limbs, b
	movq	%r13, %r10	# b1_limbs, a
	jmp	.L326	#
.L376:
# sub_64_aligned.c:165:             return false;
	movb	$0, -1381(%rbp)	#, %sfp
	movq	%r13, %r9	# b1_limbs, b
	movq	%r12, %r10	# a1_limbs, a
	jmp	.L326	#
.L379:
	leal	-1(%r14), %r13d	#, tmp1336
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%r9), %r12	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	movl	$1, %ecx	#, ivtmp.537
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	subq	%r12, (%rbx)	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)result_133 + ivtmp.537_698 * 8]
	andl	$7, %r13d	#, tmp1338
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%r9)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	cmpl	$1, %r14d	#, prephitmp_382
	jle	.L347	#,
	testl	%r13d, %r13d	# tmp1338
	je	.L343	#,
	cmpl	$1, %r13d	#, tmp1338
	je	.L651	#,
	cmpl	$2, %r13d	#, tmp1338
	je	.L652	#,
	cmpl	$3, %r13d	#, tmp1338
	je	.L653	#,
	cmpl	$4, %r13d	#, tmp1338
	je	.L654	#,
	cmpl	$5, %r13d	#, tmp1338
	je	.L655	#,
	cmpl	$6, %r13d	#, tmp1338
	je	.L656	#,
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	8(%r9), %r11	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
	subq	%r11, 8(%rbx)	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)result_133 + ivtmp.537_698 * 8]
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	movl	$2, %ecx	#, ivtmp.537
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, 8(%r9)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
.L656:
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%r9,%rcx,8), %rsi	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
	subq	%rsi, (%rbx,%rcx,8)	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)result_133 + ivtmp.537_698 * 8]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%r9,%rcx,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	addq	$1, %rcx	#, ivtmp.537
.L655:
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%r9,%rcx,8), %rax	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
	subq	%rax, (%rbx,%rcx,8)	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)result_133 + ivtmp.537_698 * 8]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%r9,%rcx,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	addq	$1, %rcx	#, ivtmp.537
.L654:
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%r9,%rcx,8), %rdx	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
	subq	%rdx, (%rbx,%rcx,8)	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)result_133 + ivtmp.537_698 * 8]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%r9,%rcx,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	addq	$1, %rcx	#, ivtmp.537
.L653:
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%r9,%rcx,8), %rdi	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
	subq	%rdi, (%rbx,%rcx,8)	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)result_133 + ivtmp.537_698 * 8]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%r9,%rcx,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	addq	$1, %rcx	#, ivtmp.537
.L652:
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%r9,%rcx,8), %r8	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
	subq	%r8, (%rbx,%rcx,8)	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)result_133 + ivtmp.537_698 * 8]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%r9,%rcx,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	addq	$1, %rcx	#, ivtmp.537
.L651:
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%r9,%rcx,8), %r10	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
	subq	%r10, (%rbx,%rcx,8)	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)result_133 + ivtmp.537_698 * 8]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%r9,%rcx,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	addq	$1, %rcx	#, ivtmp.537
	cmpl	%ecx, %r14d	# ivtmp.537, prephitmp_382
	jle	.L347	#,
	.p2align 4,,10
	.p2align 3
.L343:
	leaq	1(%rcx), %r12	#, tmp1339
	leaq	2(%rcx), %rax	#, ivtmp.537
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%r9,%rcx,8), %r13	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
	subq	%r13, (%rbx,%rcx,8)	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)result_133 + ivtmp.537_698 * 8]
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	leaq	3(%rcx), %rdx	#, ivtmp.537
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%r9,%rcx,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	leaq	4(%rcx), %r8	#, ivtmp.537
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%r9,%r12,8), %r11	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	leaq	5(%rcx), %r13	#, ivtmp.537
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	subq	%r11, (%rbx,%r12,8)	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)result_133 + ivtmp.537_698 * 8]
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	leaq	6(%rcx), %r11	#, ivtmp.537
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%r9,%r12,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%r9,%rax,8), %rsi	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
	subq	%rsi, (%rbx,%rax,8)	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)result_133 + ivtmp.537_698 * 8]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%r9,%rax,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%r9,%rdx,8), %rdi	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
	subq	%rdi, (%rbx,%rdx,8)	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)result_133 + ivtmp.537_698 * 8]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%r9,%rdx,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	leaq	7(%rcx), %rdx	#, ivtmp.537
	addq	$8, %rcx	#, ivtmp.537
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%r9,%r8,8), %r10	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
	subq	%r10, (%rbx,%r8,8)	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)result_133 + ivtmp.537_698 * 8]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%r9,%r8,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%r9,%r13,8), %r12	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
	subq	%r12, (%rbx,%r13,8)	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)result_133 + ivtmp.537_698 * 8]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%r9,%r13,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%r9,%r11,8), %rax	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
	subq	%rax, (%rbx,%r11,8)	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)result_133 + ivtmp.537_698 * 8]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%r9,%r11,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
# sub_64_aligned.c:236:         result[i] = result[i] - borrow_array[i];
	movq	(%r9,%rdx,8), %rsi	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
	subq	%rsi, (%rbx,%rdx,8)	# MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8], MEM[(uint64_t *)result_133 + ivtmp.537_698 * 8]
# sub_64_aligned.c:244:             borrow_array[i] = 0;
	movq	$0, (%r9,%rdx,8)	#, MEM[(uint64_t *)borrow_array_152 + ivtmp.537_698 * 8]
# sub_64_aligned.c:234:     for (i = 0; i < n; i++)
	cmpl	%ecx, %r14d	# ivtmp.537, prephitmp_382
	jg	.L343	#,
	jmp	.L347	#
.L753:
	movq	-1368(%rbp), %r10	# %sfp, str
	jmp	.L315	#
.L754:
	movq	-1352(%rbp), %r12	# %sfp, str
	jmp	.L323	#
.L793:
	vzeroupper
	jmp	.L370	#
.L791:
	vzeroupper
	jmp	.L316	#
.L359:
# sub_64_aligned.c:659:             perror("Error disabling counter");
	leaq	.LC17(%rip), %rdi	#, tmp1240
	call	perror@PLT	#
# sub_64_aligned.c:660:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L361:
# sub_64_aligned.c:976:             perror("Error in rdtsc\n");
	leaq	.LC43(%rip), %rdi	#, tmp1242
	call	perror@PLT	#
# sub_64_aligned.c:977:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L808:
# sub_64_aligned.c:1056: }
	call	__stack_chk_fail@PLT	#
.L304:
	call	open_file.part.0	#
	.cfi_endproc
.LFE5800:
	.size	run_tests, .-run_tests
	.section	.rodata.str1.8
	.align 8
.LC49:
	.string	"Usage: %s <number of bits> <core number>\n"
	.section	.rodata.str1.1
.LC50:
	.string	"sub_64_aligned.c"
.LC51:
	.string	"atoi(argv[1]) > 0"
	.section	.rodata.str1.8
	.align 8
.LC52:
	.string	"Memory allocation failed for sub_space or borrow_space\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB5782:
	.cfi_startproc
	endbr64	
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rbx	# tmp131, argv
	subq	$40, %rsp	#,
	.cfi_def_cfa_offset 80
# sub_64_aligned.c:283: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp138
	movq	%rax, 24(%rsp)	# tmp138, D.40087
	xorl	%eax, %eax	# tmp138
# sub_64_aligned.c:284:     if (argc != 3)
	cmpl	$3, %edi	#, tmp130
	je	.L810	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	(%rsi), %rdx	# *argv_11(D),
	movl	$1, %edi	#,
	leaq	.LC49(%rip), %rsi	#, tmp104
# sub_64_aligned.c:287:         return 1;
	movl	$1, %r12d	#, <retval>
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	__printf_chk@PLT	#
.L809:
# sub_64_aligned.c:318: }
	movq	24(%rsp), %rax	# D.40087, tmp139
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp139
	jne	.L821	#,
	addq	$40, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%r12d, %eax	# <retval>,
	popq	%rbx	#
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
	ret	
.L810:
	.cfi_restore_state
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	8(%rsi), %rdi	# MEM[(char * *)argv_11(D) + 8B], MEM[(char * *)argv_11(D) + 8B]
	movl	$10, %edx	#,
	xorl	%esi, %esi	#
	call	strtol@PLT	#
# sub_64_aligned.c:290:     assert(atoi(argv[1]) > 0);
	testl	%eax, %eax	# tmp132
	jle	.L822	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	8(%rbx), %rdi	# MEM[(char * *)argv_11(D) + 8B], MEM[(char * *)argv_11(D) + 8B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
	call	strtol@PLT	#
	movq	16(%rbx), %rdi	# MEM[(char * *)argv_11(D) + 16B], MEM[(char * *)argv_11(D) + 16B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movl	%eax, NUM_BITS(%rip)	# tmp133, NUM_BITS
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	call	strtol@PLT	#
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	16(%rsp), %rdi	#, tmp111
	movl	$1073741824, %edx	#,
	movl	$64, %esi	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movl	%eax, CORE_NO(%rip)	# tmp134, CORE_NO
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	call	posix_memalign@PLT	#
	testl	%eax, %eax	# tmp135
	jne	.L813	#,
	movq	16(%rsp), %r13	# D.40077, _57
	leaq	8(%rsp), %rdi	#, tmp112
	movl	$1073741824, %edx	#,
	movl	$64, %esi	#,
# sub_64_aligned.c:298:     sub_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	%r13, sub_space(%rip)	# _57, sub_space
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	call	posix_memalign@PLT	#
	movl	%eax, %r12d	# tmp136, <retval>
	testl	%eax, %eax	# <retval>
	jne	.L814	#,
	movq	8(%rsp), %rbp	# D.40071, _45
# sub_64_aligned.c:299:     borrow_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	%rbp, borrow_space(%rip)	# _45, borrow_space
# sub_64_aligned.c:301:     if (sub_space == NULL || borrow_space == NULL)
	testq	%r13, %r13	# _57
	je	.L817	#,
	testq	%rbp, %rbp	# _45
	je	.L817	#,
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	xorl	%esi, %esi	#
	movq	%r13, %rdi	# _57,
	movl	$1073741824, %edx	#,
# sub_64_aligned.c:308:     sub_space_ptr = 0;
	movl	$0, sub_space_ptr(%rip)	#, sub_space_ptr
# sub_64_aligned.c:309:     borrow_space_ptr = 0;
	movl	$0, borrow_space_ptr(%rip)	#, borrow_space_ptr
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	call	memset@PLT	#
	movl	$1073741824, %edx	#,
	xorl	%esi, %esi	#
	movq	%rbp, %rdi	# _45,
	call	memset@PLT	#
# sub_64_aligned.c:315:     run_tests();
	xorl	%eax, %eax	#
	call	run_tests	#
# sub_64_aligned.c:317:     return 0;
	jmp	.L809	#
.L813:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	8(%rsp), %rdi	#, tmp128
	movl	$1073741824, %edx	#,
	movl	$64, %esi	#,
# sub_64_aligned.c:298:     sub_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	$0, sub_space(%rip)	#, sub_space
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	call	posix_memalign@PLT	#
	testl	%eax, %eax	# tmp137
	je	.L823	#,
.L814:
# sub_64_aligned.c:299:     borrow_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	$0, borrow_space(%rip)	#, borrow_space
.L817:
# sub_64_aligned.c:303:         perror("Memory allocation failed for sub_space or borrow_space\n");
	leaq	.LC52(%rip), %rdi	#, tmp117
	call	perror@PLT	#
# sub_64_aligned.c:304:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L822:
# sub_64_aligned.c:290:     assert(atoi(argv[1]) > 0);
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	#, tmp106
	movl	$290, %edx	#,
	leaq	.LC50(%rip), %rsi	#, tmp107
	leaq	.LC51(%rip), %rdi	#, tmp108
	call	__assert_fail@PLT	#
.L821:
# sub_64_aligned.c:318: }
	call	__stack_chk_fail@PLT	#
.L823:
# sub_64_aligned.c:299:     borrow_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	8(%rsp), %rax	# D.40071, D.40071
	movq	%rax, borrow_space(%rip)	# D.40071, borrow_space
	jmp	.L817	#
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
.LC53:
	.string	"PERF_COUNT_HW_CPU_CYCLES"
	.section	.rodata.str1.8
	.align 8
.LC54:
	.string	"PERF_COUNT_HW_USER_INSTRUCTIONS"
	.align 8
.LC55:
	.string	"PERF_COUNT_HW_KERNEL_INSTRUCTIONS"
	.section	.rodata.str1.1
.LC56:
	.string	"PERF_COUNT_SW_PAGE_FAULTS"
.LC57:
	.string	"PERF_COUNT_L1D_CACHE_READS"
	.section	.rodata.str1.8
	.align 8
.LC58:
	.string	"PERF_COUNT_L1D_CACHE_READ_MISSES"
	.section	.data.rel.local,"aw"
	.align 32
	.type	event_names, @object
	.size	event_names, 48
event_names:
	.quad	.LC53
	.quad	.LC54
	.quad	.LC55
	.quad	.LC56
	.quad	.LC57
	.quad	.LC58
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
.LC21:
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
.LC25:
	.long	65535
	.long	65535
	.long	65535
	.long	65535
	.long	65535
	.long	65535
	.long	65535
	.long	65535
	.align 32
.LC26:
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
.LC27:
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
	.set	.LC28,.LC25
	.set	.LC29,.LC26
	.set	.LC30,.LC27
	.set	.LC31,.LC25
	.set	.LC32,.LC26
	.set	.LC33,.LC27
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
