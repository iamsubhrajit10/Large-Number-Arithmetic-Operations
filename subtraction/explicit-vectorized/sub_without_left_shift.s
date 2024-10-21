	.file	"sub.c"
# GNU C17 (Ubuntu 11.4.0-1ubuntu1~22.04) version 11.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=skylake-avx512 -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mbmi -mbmi2 -maes -mpclmul -mavx512vl -mavx512bw -mavx512dq -mavx512cd -mno-avx512er -mno-avx512pf -mno-avx512vbmi -mno-avx512ifma -mno-avx5124vnniw -mno-avx5124fmaps -mno-avx512vpopcntdq -mno-avx512vbmi2 -mno-gfni -mno-vpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mhle -msahf -mno-lwp -mlzcnt -mmovbe -mno-movdir64b -mno-movdiri -mno-mwaitx -mno-pconfig -mpku -mno-prefetchwt1 -mprfchw -mno-ptwrite -mno-rdpid -mrdrnd -mrdseed -mrtm -mno-serialize -mno-sgx -mno-sha -mno-shstk -mno-tbm -mno-tsxldtrk -mno-vaes -mno-waitpkg -mno-wbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -mno-uintr -mno-hreset -mno-kl -mno-widekl -mno-avxvnni --param=l1-cache-size=32 --param=l1-cache-line-size=64 --param=l2-cache-size=22528 -mtune=skylake-avx512 -mavx512f -O3 -funroll-all-loops -ffast-math -fomit-frame-pointer -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Error opening file %s: %s\n"
	.text
	.p2align 4
	.type	open_gzfile.part.0, @function
open_gzfile.part.0:
.LFB5810:
	.cfi_startproc
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
# sub.c:734: gzFile open_gzfile(const char *filename, const char *mode)
	movq	%rdi, %r12	# tmp89, filename
# sub.c:739:         fprintf(stderr, "Error opening file %s: %s\n", filename, strerror(errno));
	call	__errno_location@PLT	#
# sub.c:739:         fprintf(stderr, "Error opening file %s: %s\n", filename, strerror(errno));
	movl	(%rax), %edi	# *_1,
	call	strerror@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	# stderr,
# sub.c:739:         fprintf(stderr, "Error opening file %s: %s\n", filename, strerror(errno));
	movq	%rax, %r8	#, tmp91
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rcx	# filename,
	leaq	.LC0(%rip), %rdx	#, tmp88
	movl	$1, %esi	#,
	xorl	%eax, %eax	#
	call	__fprintf_chk@PLT	#
# sub.c:740:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5810:
	.size	open_gzfile.part.0, .-open_gzfile.part.0
	.section	.rodata.str1.1
.LC1:
	.string	"Error reading header line"
	.text
	.p2align 4
	.type	skip_first_line.part.0, @function
skip_first_line.part.0:
.LFB5811:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# sub.c:745: void skip_first_line(gzFile file)
	movq	%rdi, %rbp	# tmp84, file
# sub.c:750:         perror("Error reading header line");
	leaq	.LC1(%rip), %rdi	#, tmp83
	call	perror@PLT	#
# sub.c:751:         gzclose(file);
	movq	%rbp, %rdi	# file,
	call	gzclose@PLT	#
# sub.c:752:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5811:
	.size	skip_first_line.part.0, .-skip_first_line.part.0
	.p2align 4
	.globl	perf_event_open
	.type	perf_event_open, @function
perf_event_open:
.LFB5780:
	.cfi_startproc
	endbr64	
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
# sub.c:100:     ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
	movq	%r8, %r9	# tmp95,
	xorl	%eax, %eax	#
	movl	%ecx, %r8d	# tmp94,
	movl	%edx, %ecx	# cpu,
	movl	%esi, %edx	# pid,
	movq	%rdi, %rsi	# hw_event,
	movl	$298, %edi	#,
	call	syscall@PLT	#
# sub.c:101:     return ret;
	cltq
# sub.c:102: }
	popq	%r12	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE5780:
	.size	perf_event_open, .-perf_event_open
	.section	.rodata.str1.1
.LC2:
	.string	"/dev/urandom"
.LC3:
	.string	"Error opening /dev/urandom"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"Error reading from /dev/urandom"
	.text
	.p2align 4
	.globl	generate_seed
	.type	generate_seed, @function
generate_seed:
.LFB5781:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# sub.c:108:     clock_gettime(CLOCK_MONOTONIC, &ts1);
	movl	$1, %edi	#,
# sub.c:106: {
	subq	$64, %rsp	#,
	.cfi_def_cfa_offset 80
# sub.c:108:     clock_gettime(CLOCK_MONOTONIC, &ts1);
	leaq	16(%rsp), %rsi	#, tmp98
# sub.c:106: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp116
	movq	%rax, 56(%rsp)	# tmp116, D.40630
	xorl	%eax, %eax	# tmp116
# sub.c:108:     clock_gettime(CLOCK_MONOTONIC, &ts1);
	call	clock_gettime@PLT	#
# sub.c:109:     clock_gettime(CLOCK_REALTIME, &ts2);
	xorl	%edi, %edi	#
	leaq	32(%rsp), %rsi	#, tmp99
	call	clock_gettime@PLT	#
# /usr/include/x86_64-linux-gnu/bits/fcntl2.h:53:       return __open_alias (__path, __oflag, __va_arg_pack ());
	xorl	%esi, %esi	#
	xorl	%eax, %eax	#
	leaq	.LC2(%rip), %rdi	#, tmp100
	call	open@PLT	#
# sub.c:112:     if (urandom_fd == -1)
	cmpl	$-1, %eax	#, _28
	je	.L13	#,
# /usr/include/x86_64-linux-gnu/bits/unistd.h:38:   return __glibc_fortify (read, __nbytes, sizeof (char),
	leaq	8(%rsp), %rsi	#, tmp102
	movl	$8, %edx	#,
	movl	%eax, %edi	# _28,
	movl	%eax, %ebp	# tmp112, _28
	call	read@PLT	#
# sub.c:120:     if (result != sizeof(urandom_value))
	cmpq	$8, %rax	#, tmp113
	jne	.L14	#,
# sub.c:126:     close(urandom_fd);
	movl	%ebp, %edi	# _28,
	call	close@PLT	#
# sub.c:128:     pid_t pid = getpid();
	call	getpid@PLT	#
	movslq	%eax, %rbp	# tmp114,
# sub.c:129:     pid_t tid = syscall(SYS_gettid);
	movl	$186, %edi	#,
	xorl	%eax, %eax	#
	call	syscall@PLT	#
	movq	%rax, %r8	#, tmp115
# sub.c:131:     return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
	movq	24(%rsp), %rax	# ts1.tv_nsec, ts1.tv_nsec
# sub.c:131:     return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
	movslq	%r8d, %rdx	# tmp115, _1
# sub.c:131:     return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
	xorq	40(%rsp), %rax	# ts2.tv_nsec, tmp104
# sub.c:131:     return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
	xorq	8(%rsp), %rax	# urandom_value, tmp106
# sub.c:131:     return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
	xorq	%rbp, %rax	# pid, tmp108
# sub.c:131:     return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
	xorq	%rdx, %rax	# _1, <retval>
# sub.c:132: }
	movq	56(%rsp), %rdx	# D.40630, tmp117
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
# sub.c:114:         perror("Error opening /dev/urandom");
	leaq	.LC3(%rip), %rdi	#, tmp101
	call	perror@PLT	#
# sub.c:115:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L15:
# sub.c:132: }
	call	__stack_chk_fail@PLT	#
.L14:
# sub.c:122:         perror("Error reading from /dev/urandom");
	leaq	.LC4(%rip), %rdi	#, tmp103
	call	perror@PLT	#
# sub.c:123:         close(urandom_fd);
	movl	%ebp, %edi	# _28,
	call	close@PLT	#
# sub.c:124:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5781:
	.size	generate_seed, .-generate_seed
	.p2align 4
	.globl	left_shift
	.type	left_shift, @function
left_shift:
.LFB5783:
	.cfi_startproc
	endbr64	
# sub.c:155: {
	movq	%rdi, %rdx	# tmp177, borrow_mask
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decl	%esi	# i
	js	.L56	#,
	movslq	%esi, %rdi	# i, ivtmp.243
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rdi), %eax	# MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1],
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movl	%edi, %r9d	# ivtmp.243, tmp179
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movl	%eax, %ecx	#,
	andl	$7, %esi	#, tmp99
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	addl	%eax, %eax	# tmp96
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %cl	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decl	%r9d	# tmp179
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%al, (%rdx,%rdi)	# tmp96, MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-1(%rdi), %r10	#, ivtmp.243
	js	.L57	#,
	testl	%esi, %esi	# tmp99
	je	.L18	#,
	cmpl	$1, %esi	#, tmp99
	je	.L43	#,
	cmpl	$2, %esi	#, tmp99
	je	.L44	#,
	cmpl	$3, %esi	#, tmp99
	je	.L45	#,
	cmpl	$4, %esi	#, tmp99
	je	.L46	#,
	cmpl	$5, %esi	#, tmp99
	je	.L47	#,
	cmpl	$6, %esi	#, tmp99
	je	.L48	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%r10), %r8d	# MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %esi	#, tmp151
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%esi, %ecx	# tmp151, tmp152
	movb	%cl, (%rdx,%r10)	# tmp152, MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %ecx	# temp, temp
	shrb	$7, %cl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-2(%rdi), %r10	#, ivtmp.243
.L48:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%r10), %edi	# MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rdi,%rdi), %r11d	#, tmp155
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r11d, %ecx	# tmp155, tmp156
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%cl, (%rdx,%r10)	# tmp156, MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%edi, %ecx	# temp, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%r10	# ivtmp.243
.L47:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%r10), %eax	# MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rax,%rax), %r9d	#, tmp159
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %ecx	# tmp159, tmp160
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %al	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%cl, (%rdx,%r10)	# tmp160, MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%eax, %ecx	# temp, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%r10	# ivtmp.243
.L46:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%r10), %edi	# MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rdi,%rdi), %r8d	#, tmp163
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %ecx	# tmp163, tmp164
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%cl, (%rdx,%r10)	# tmp164, MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%edi, %ecx	# temp, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%r10	# ivtmp.243
.L45:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%r10), %eax	# MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rax,%rax), %esi	#, tmp167
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%esi, %ecx	# tmp167, tmp168
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %al	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%cl, (%rdx,%r10)	# tmp168, MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%eax, %ecx	# temp, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%r10	# ivtmp.243
.L44:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%r10), %edi	# MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rdi,%rdi), %r11d	#, tmp171
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r11d, %ecx	# tmp171, tmp172
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%cl, (%rdx,%r10)	# tmp172, MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%edi, %ecx	# temp, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%r10	# ivtmp.243
.L43:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%r10), %eax	# MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rax,%rax), %r9d	#, tmp175
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %ecx	# tmp175, tmp176
	movb	%cl, (%rdx,%r10)	# tmp176, MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1]
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %al	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%r10	# ivtmp.243
# sub.c:161:         carry = temp >> 7;
	movl	%eax, %ecx	# temp, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%r10d, %r10d	# ivtmp.243
	js	.L58	#,
.L18:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%r10), %r8d	# MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %esi	#, tmp105
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%esi, %ecx	# tmp105, tmp106
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-1(%rdx,%r10), %esi	# MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%cl, (%rdx,%r10)	# tmp106, MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1]
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %edi	#, tmp111
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, temp
	movl	%esi, %eax	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-2(%rdx,%r10), %esi	# MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r8b	#, carry
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r11d	#, tmp117
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r11d, %eax	# tmp117, tmp118
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%al, -2(%rdx,%r10)	# tmp118, MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %eax	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-3(%rdx,%r10), %esi	# MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %r8d	# tmp111, tmp112
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp123
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %eax	# tmp123, tmp124
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%al, -3(%rdx,%r10)	# tmp124, MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %eax	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-4(%rdx,%r10), %esi	# MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r8b, -1(%rdx,%r10)	# tmp112, MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1]
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %ecx	#, tmp129
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%ecx, %eax	# tmp129, tmp130
	movb	%al, -4(%rdx,%r10)	# tmp130, MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %eax	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-5(%rdx,%r10), %esi	# MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %al	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r8d	#, tmp135
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %eax	# tmp135, tmp136
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%al, -5(%rdx,%r10)	# tmp136, MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %eax	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-6(%rdx,%r10), %esi	# MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1], temp
	movzbl	-7(%rdx,%r10), %ecx	# MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %edi	#, tmp141
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %eax	# tmp141, tmp142
	movb	%al, -6(%rdx,%r10)	# tmp142, MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %eax	# temp, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rcx,%rcx), %r11d	#, tmp147
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %al	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r11d, %eax	# tmp147, tmp148
	movb	%al, -7(%rdx,%r10)	# tmp148, MEM[(__mmask8 *)borrow_mask_15(D) + ivtmp.243_32 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	subq	$8, %r10	#, ivtmp.243
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %cl	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%r10d, %r10d	# ivtmp.243
	jns	.L18	#,
.L56:
# sub.c:163: }
	ret	
.L58:
	ret	
	.p2align 4,,10
	.p2align 3
.L57:
	ret	
	.cfi_endproc
.LFE5783:
	.size	left_shift, .-left_shift
	.p2align 4
	.globl	aligned_realloc
	.type	aligned_realloc, @function
aligned_realloc:
.LFB5786:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r13	#
	.cfi_offset 13, -24
	movq	%rsi, %r13	# tmp106, old_size
	pushq	%r12	#
	.cfi_offset 12, -32
	movq	%rdi, %r12	# tmp105, ptr
	pushq	%rbx	#
	andq	$-64, %rsp	#,
	subq	$64, %rsp	#,
	.cfi_offset 3, -40
# sub.c:338: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp111
	movq	%rax, 56(%rsp)	# tmp111, D.40660
	xorl	%eax, %eax	# tmp111
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:41:   if (__alignment == 1)
	cmpq	$1, %rcx	#, alignment
	je	.L69	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:43:   if (__alignment == 2 || (sizeof (void *) == 8 && __alignment == 4))
	leaq	-2(%rcx), %rax	#, tmp93
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:44:     __alignment = sizeof (void *);
	testq	$-3, %rax	#, tmp93
	movl	$8, %esi	#, tmp103
	cmovne	%rcx, %rsi	# alignment,, tmp103
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	48(%rsp), %rdi	#, tmp95
	call	posix_memalign@PLT	#
	movl	%eax, %r8d	#, tmp110
# sub.c:342:         return NULL;
	xorl	%eax, %eax	# <retval>
	testl	%r8d, %r8d	# tmp110
	jne	.L59	#,
	movq	48(%rsp), %rbx	# D.40652, _19
.L61:
# sub.c:340:     if (new_ptr == NULL)
	testq	%rbx, %rbx	# _19
	je	.L67	#,
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:29:   return __builtin___memcpy_chk (__dest, __src, __len,
	movq	%r13, %rdx	# old_size,
	movq	%r12, %rsi	# ptr,
	movq	%rbx, %rdi	# _19,
	call	memcpy@PLT	#
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:54:   free (__ptr);
	movq	%r12, %rdi	# ptr,
	call	free@PLT	#
# sub.c:346:     return new_ptr;
	movq	%rbx, %rax	# _19, <retval>
.L59:
# sub.c:347: }
	movq	56(%rsp), %rdx	# D.40660, tmp112
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp112
	jne	.L70	#,
	leaq	-24(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
	.p2align 4,,10
	.p2align 3
.L69:
	.cfi_restore_state
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:42:     return malloc (__size);
	movq	%rdx, %rdi	# new_size,
	call	malloc@PLT	#
	movq	%rax, %rbx	# tmp109, _19
	jmp	.L61	#
	.p2align 4,,10
	.p2align 3
.L67:
# sub.c:342:         return NULL;
	xorl	%eax, %eax	# <retval>
	jmp	.L59	#
.L70:
# sub.c:347: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE5786:
	.size	aligned_realloc, .-aligned_realloc
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"Memory allocation failed for temp\n"
	.align 8
.LC6:
	.string	"Memory allocation failed for result_str\n"
	.section	.rodata.str1.1
.LC7:
	.string	"%ld"
.LC8:
	.string	"%lu"
.LC9:
	.string	"%018lu"
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"Memory allocation failed for final_result\n"
	.text
	.p2align 4
	.globl	limb_get_str
	.type	limb_get_str, @function
limb_get_str:
.LFB5787:
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
	movq	%rsi, %rbp	# tmp172, result_length
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 64
# sub.c:353:     while (i < *result_length && result[i] == 0)
	movq	(%rsi), %rsi	# *result_length_39(D), _102
# sub.c:353:     while (i < *result_length && result[i] == 0)
	testq	%rsi, %rsi	# _102
	je	.L73	#,
	movq	%rsi, %r8	# _102, tmp146
	movq	%rdi, %rax	# result, ivtmp.272
	xorl	%ecx, %ecx	# i
	andl	$7, %r8d	#, tmp146
	je	.L74	#,
	cmpq	$1, %r8	#, tmp146
	je	.L147	#,
	cmpq	$2, %r8	#, tmp146
	je	.L148	#,
	cmpq	$3, %r8	#, tmp146
	je	.L149	#,
	cmpq	$4, %r8	#, tmp146
	je	.L150	#,
	cmpq	$5, %r8	#, tmp146
	je	.L151	#,
	cmpq	$6, %r8	#, tmp146
	jne	.L178	#,
.L152:
	cmpq	$0, (%rax)	#, MEM[(uint64_t *)_3]
# sub.c:353:     while (i < *result_length && result[i] == 0)
	movq	%rax, %r15	# ivtmp.272, _3
# sub.c:353:     while (i < *result_length && result[i] == 0)
	jne	.L75	#,
# sub.c:355:         i++;
	incq	%rcx	# i
# sub.c:353:     while (i < *result_length && result[i] == 0)
	addq	$8, %rax	#, ivtmp.272
.L151:
	cmpq	$0, (%rax)	#, MEM[(uint64_t *)_3]
# sub.c:353:     while (i < *result_length && result[i] == 0)
	movq	%rax, %r15	# ivtmp.272, _3
# sub.c:353:     while (i < *result_length && result[i] == 0)
	jne	.L75	#,
# sub.c:355:         i++;
	incq	%rcx	# i
# sub.c:353:     while (i < *result_length && result[i] == 0)
	addq	$8, %rax	#, ivtmp.272
.L150:
	cmpq	$0, (%rax)	#, MEM[(uint64_t *)_3]
# sub.c:353:     while (i < *result_length && result[i] == 0)
	movq	%rax, %r15	# ivtmp.272, _3
# sub.c:353:     while (i < *result_length && result[i] == 0)
	jne	.L75	#,
# sub.c:355:         i++;
	incq	%rcx	# i
# sub.c:353:     while (i < *result_length && result[i] == 0)
	addq	$8, %rax	#, ivtmp.272
.L149:
	cmpq	$0, (%rax)	#, MEM[(uint64_t *)_3]
# sub.c:353:     while (i < *result_length && result[i] == 0)
	movq	%rax, %r15	# ivtmp.272, _3
# sub.c:353:     while (i < *result_length && result[i] == 0)
	jne	.L75	#,
# sub.c:355:         i++;
	incq	%rcx	# i
# sub.c:353:     while (i < *result_length && result[i] == 0)
	addq	$8, %rax	#, ivtmp.272
.L148:
	cmpq	$0, (%rax)	#, MEM[(uint64_t *)_3]
# sub.c:353:     while (i < *result_length && result[i] == 0)
	movq	%rax, %r15	# ivtmp.272, _3
# sub.c:353:     while (i < *result_length && result[i] == 0)
	jne	.L75	#,
# sub.c:355:         i++;
	incq	%rcx	# i
# sub.c:353:     while (i < *result_length && result[i] == 0)
	addq	$8, %rax	#, ivtmp.272
.L147:
	cmpq	$0, (%rax)	#, MEM[(uint64_t *)_3]
# sub.c:353:     while (i < *result_length && result[i] == 0)
	movq	%rax, %r15	# ivtmp.272, _3
# sub.c:353:     while (i < *result_length && result[i] == 0)
	jne	.L75	#,
# sub.c:355:         i++;
	incq	%rcx	# i
# sub.c:353:     while (i < *result_length && result[i] == 0)
	addq	$8, %rax	#, ivtmp.272
	cmpq	%rsi, %rcx	# _102, i
	je	.L174	#,
.L74:
# sub.c:353:     while (i < *result_length && result[i] == 0)
	cmpq	$0, (%rax)	#, MEM[(uint64_t *)_3]
# sub.c:353:     while (i < *result_length && result[i] == 0)
	movq	%rax, %r15	# ivtmp.272, _3
# sub.c:353:     while (i < *result_length && result[i] == 0)
	jne	.L75	#,
# sub.c:355:         i++;
	leaq	1(%rcx), %rbx	#, tmp147
# sub.c:353:     while (i < *result_length && result[i] == 0)
	cmpq	$0, 8(%rax)	#, MEM[(uint64_t *)_3]
# sub.c:355:         i++;
	movq	%rbx, %rcx	# tmp147, i
# sub.c:353:     while (i < *result_length && result[i] == 0)
	leaq	8(%rax), %r15	#, _3
# sub.c:353:     while (i < *result_length && result[i] == 0)
	jne	.L75	#,
# sub.c:355:         i++;
	incq	%rcx	# i
# sub.c:353:     while (i < *result_length && result[i] == 0)
	cmpq	$0, 16(%rax)	#, MEM[(uint64_t *)_3]
# sub.c:353:     while (i < *result_length && result[i] == 0)
	leaq	16(%rax), %r15	#, _3
# sub.c:353:     while (i < *result_length && result[i] == 0)
	jne	.L75	#,
	cmpq	$0, 24(%rax)	#, MEM[(uint64_t *)_3]
# sub.c:355:         i++;
	leaq	2(%rbx), %rcx	#, i
# sub.c:353:     while (i < *result_length && result[i] == 0)
	leaq	24(%rax), %r15	#, _3
# sub.c:353:     while (i < *result_length && result[i] == 0)
	jne	.L75	#,
	cmpq	$0, 32(%rax)	#, MEM[(uint64_t *)_3]
# sub.c:355:         i++;
	leaq	3(%rbx), %rcx	#, i
# sub.c:353:     while (i < *result_length && result[i] == 0)
	leaq	32(%rax), %r15	#, _3
# sub.c:353:     while (i < *result_length && result[i] == 0)
	jne	.L75	#,
	cmpq	$0, 40(%rax)	#, MEM[(uint64_t *)_3]
# sub.c:355:         i++;
	leaq	4(%rbx), %rcx	#, i
# sub.c:353:     while (i < *result_length && result[i] == 0)
	leaq	40(%rax), %r15	#, _3
# sub.c:353:     while (i < *result_length && result[i] == 0)
	jne	.L75	#,
	cmpq	$0, 48(%rax)	#, MEM[(uint64_t *)_3]
# sub.c:355:         i++;
	leaq	5(%rbx), %rcx	#, i
# sub.c:353:     while (i < *result_length && result[i] == 0)
	leaq	48(%rax), %r15	#, _3
# sub.c:353:     while (i < *result_length && result[i] == 0)
	jne	.L75	#,
	cmpq	$0, 56(%rax)	#, MEM[(uint64_t *)_3]
# sub.c:355:         i++;
	leaq	6(%rbx), %rcx	#, i
# sub.c:353:     while (i < *result_length && result[i] == 0)
	leaq	56(%rax), %r15	#, _3
# sub.c:353:     while (i < *result_length && result[i] == 0)
	jne	.L75	#,
# sub.c:355:         i++;
	leaq	7(%rbx), %rcx	#, i
# sub.c:353:     while (i < *result_length && result[i] == 0)
	addq	$64, %rax	#, ivtmp.272
	cmpq	%rsi, %rcx	# _102, i
	jne	.L74	#,
.L174:
# sub.c:359:     result += i;
	leaq	(%rdi,%rcx,8), %r15	#, _3
.L75:
# sub.c:358:     *result_length -= i;
	subq	%rcx, %rsi	# i, _6
	movq	%rsi, 0(%rbp)	# _6, *result_length_39(D)
# sub.c:361:     if (*result_length == 0)
	je	.L73	#,
# sub.c:375:     if (sign)
	testb	%dl, %dl	# sign
	jne	.L179	#,
.L80:
# sub.c:381:     size_t alloc_size = (*result_length) * 20 + 2; // 20 digits per number + sign + null terminator
	leaq	(%rsi,%rsi,4), %rdx	#, tmp121
# sub.c:381:     size_t alloc_size = (*result_length) * 20 + 2; // 20 digits per number + sign + null terminator
	leaq	2(,%rdx,4), %rdi	#, alloc_size
# sub.c:382:     char *result_str = (char *)calloc(alloc_size, sizeof(char));
	movl	$1, %esi	#,
	call	calloc@PLT	#
	movq	%rax, %r14	# tmp175, result_str
# sub.c:383:     if (result_str == NULL)
	testq	%rax, %rax	# result_str
	je	.L180	#,
# sub.c:391:     if (result[0] > LIMB_DIGITS)
	movq	(%r15), %r8	# *prephitmp_92, _13
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:38:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC8(%rip), %rcx	#, tmp128
# sub.c:391:     if (result[0] > LIMB_DIGITS)
	cmpq	LIMB_DIGITS(%rip), %r8	# LIMB_DIGITS, _13
	ja	.L181	#,
.L176:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:38:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	xorl	%eax, %eax	#
	movq	$-1, %rdx	#,
	movl	$1, %esi	#,
	movq	%r14, %rdi	# result_str,
	call	__sprintf_chk@PLT	#
# sub.c:393:         ptr += sprintf(ptr, "%" PRId64, (int64_t)result[0]); // Print as signed
	movslq	%eax, %rbx	# tmp176, _78
# sub.c:393:         ptr += sprintf(ptr, "%" PRId64, (int64_t)result[0]); // Print as signed
	addq	%r14, %rbx	# result_str, ptr
# sub.c:401:     for (size_t j = 1; j < *result_length; j++)
	cmpq	$1, 0(%rbp)	#, *result_length_39(D)
	movl	$1, %r12d	#, j
	leaq	.LC9(%rip), %r13	#, tmp140
	jbe	.L87	#,
.L83:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:38:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	(%r15,%r12,8), %r8	# MEM[(uint64_t *)prephitmp_92 + j_99 * 8],
	movq	%rbx, %rdi	# ptr,
	movq	%r13, %rcx	# tmp140,
	movq	$-1, %rdx	#,
	movl	$1, %esi	#,
	xorl	%eax, %eax	#
	call	__sprintf_chk@PLT	#
# sub.c:403:         ptr += sprintf(ptr, "%018" PRIu64, result[j]); // Print with leading zeros
	cltq
# sub.c:401:     for (size_t j = 1; j < *result_length; j++)
	leaq	1(%r12), %rdi	#, tmp142
# sub.c:403:         ptr += sprintf(ptr, "%018" PRIu64, result[j]); // Print with leading zeros
	addq	%rax, %rbx	# _82, ptr
# sub.c:401:     for (size_t j = 1; j < *result_length; j++)
	cmpq	%rdi, 0(%rbp)	# tmp142, *result_length_39(D)
	jbe	.L87	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:38:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	(%r15,%rdi,8), %r8	# MEM[(uint64_t *)prephitmp_92 + j_99 * 8],
	movq	%r13, %rcx	# tmp140,
	movq	%rbx, %rdi	# ptr,
	movq	$-1, %rdx	#,
	movl	$1, %esi	#,
	xorl	%eax, %eax	#
	call	__sprintf_chk@PLT	#
# sub.c:403:         ptr += sprintf(ptr, "%018" PRIu64, result[j]); // Print with leading zeros
	cltq
# sub.c:401:     for (size_t j = 1; j < *result_length; j++)
	leaq	2(%r12), %r9	#, j
# sub.c:403:         ptr += sprintf(ptr, "%018" PRIu64, result[j]); // Print with leading zeros
	addq	%rax, %rbx	# _82, ptr
# sub.c:401:     for (size_t j = 1; j < *result_length; j++)
	cmpq	%r9, 0(%rbp)	# j, *result_length_39(D)
	jbe	.L87	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:38:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	(%r15,%r9,8), %r8	# MEM[(uint64_t *)prephitmp_92 + j_99 * 8],
	movq	%rbx, %rdi	# ptr,
	movq	%r13, %rcx	# tmp140,
	movq	$-1, %rdx	#,
	movl	$1, %esi	#,
	xorl	%eax, %eax	#
	call	__sprintf_chk@PLT	#
# sub.c:403:         ptr += sprintf(ptr, "%018" PRIu64, result[j]); // Print with leading zeros
	cltq
# sub.c:401:     for (size_t j = 1; j < *result_length; j++)
	leaq	3(%r12), %r10	#, j
# sub.c:403:         ptr += sprintf(ptr, "%018" PRIu64, result[j]); // Print with leading zeros
	addq	%rax, %rbx	# _82, ptr
# sub.c:401:     for (size_t j = 1; j < *result_length; j++)
	cmpq	%r10, 0(%rbp)	# j, *result_length_39(D)
	jbe	.L87	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:38:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	(%r15,%r10,8), %r8	# MEM[(uint64_t *)prephitmp_92 + j_99 * 8],
	movq	%rbx, %rdi	# ptr,
	movq	%r13, %rcx	# tmp140,
	movq	$-1, %rdx	#,
	movl	$1, %esi	#,
	xorl	%eax, %eax	#
	call	__sprintf_chk@PLT	#
# sub.c:403:         ptr += sprintf(ptr, "%018" PRIu64, result[j]); // Print with leading zeros
	cltq
# sub.c:401:     for (size_t j = 1; j < *result_length; j++)
	addq	$4, %r12	#, j
# sub.c:403:         ptr += sprintf(ptr, "%018" PRIu64, result[j]); // Print with leading zeros
	addq	%rax, %rbx	# _82, ptr
# sub.c:401:     for (size_t j = 1; j < *result_length; j++)
	cmpq	%r12, 0(%rbp)	# j, *result_length_39(D)
	ja	.L83	#,
	.p2align 4,,10
	.p2align 3
.L87:
# sub.c:408:     while (*ptr == '0')
	movzbl	(%r14), %r8d	# *result_str_48, _25
# sub.c:408:     while (*ptr == '0')
	movq	%r14, %rdi	# result_str, ptr
	cmpb	$48, %r8b	#, _25
	jne	.L85	#,
.L84:
# sub.c:408:     while (*ptr == '0')
	movzbl	1(%rdi), %r8d	# MEM[(char *)ptr_65], _25
# sub.c:410:         ptr++;
	leaq	1(%rdi), %r11	#, tmp141
	movq	%r11, %rdi	# tmp141, ptr
# sub.c:408:     while (*ptr == '0')
	cmpb	$48, %r8b	#, _25
	jne	.L85	#,
# sub.c:408:     while (*ptr == '0')
	movzbl	1(%rdi), %r8d	# MEM[(char *)ptr_65], _25
# sub.c:410:         ptr++;
	incq	%rdi	# ptr
# sub.c:408:     while (*ptr == '0')
	cmpb	$48, %r8b	#, _25
	jne	.L85	#,
# sub.c:408:     while (*ptr == '0')
	movzbl	2(%r11), %r8d	# MEM[(char *)ptr_65], _25
# sub.c:410:         ptr++;
	leaq	2(%r11), %rdi	#, ptr
# sub.c:408:     while (*ptr == '0')
	cmpb	$48, %r8b	#, _25
	jne	.L85	#,
# sub.c:408:     while (*ptr == '0')
	movzbl	3(%r11), %r8d	# MEM[(char *)ptr_65], _25
# sub.c:410:         ptr++;
	leaq	3(%r11), %rdi	#, ptr
# sub.c:408:     while (*ptr == '0')
	cmpb	$48, %r8b	#, _25
	jne	.L85	#,
# sub.c:408:     while (*ptr == '0')
	movzbl	4(%r11), %r8d	# MEM[(char *)ptr_65], _25
# sub.c:410:         ptr++;
	leaq	4(%r11), %rdi	#, ptr
# sub.c:408:     while (*ptr == '0')
	cmpb	$48, %r8b	#, _25
	jne	.L85	#,
# sub.c:408:     while (*ptr == '0')
	movzbl	5(%r11), %r8d	# MEM[(char *)ptr_65], _25
# sub.c:410:         ptr++;
	leaq	5(%r11), %rdi	#, ptr
# sub.c:408:     while (*ptr == '0')
	cmpb	$48, %r8b	#, _25
	jne	.L85	#,
# sub.c:408:     while (*ptr == '0')
	movzbl	6(%r11), %r8d	# MEM[(char *)ptr_65], _25
# sub.c:410:         ptr++;
	leaq	6(%r11), %rdi	#, ptr
# sub.c:408:     while (*ptr == '0')
	cmpb	$48, %r8b	#, _25
	jne	.L85	#,
# sub.c:408:     while (*ptr == '0')
	movzbl	7(%r11), %r8d	# MEM[(char *)ptr_65], _25
# sub.c:410:         ptr++;
	leaq	7(%r11), %rdi	#, ptr
# sub.c:408:     while (*ptr == '0')
	cmpb	$48, %r8b	#, _25
	je	.L84	#,
	.p2align 4,,10
	.p2align 3
.L85:
# sub.c:413:     if (*ptr == '\0')
	testb	%r8b, %r8b	# _25
	je	.L182	#,
# sub.c:428:     char *final_result = strdup(ptr);
	call	strdup@PLT	#
	movq	%rax, %r15	# tmp180, <retval>
# sub.c:429:     if (final_result == NULL)
	testq	%rax, %rax	# <retval>
	je	.L183	#,
# sub.c:435:     free(result_str);
	movq	%r14, %rdi	# result_str,
	call	free@PLT	#
# sub.c:436:     *result_length = strlen(final_result);
	movq	%r15, %rdi	# <retval>,
	call	strlen@PLT	#
# sub.c:437:     return final_result;
	jmp	.L79	#
	.p2align 4,,10
	.p2align 3
.L182:
# sub.c:415:         free(result_str);
	movq	%r14, %rdi	# result_str,
	call	free@PLT	#
.L73:
# sub.c:363:         char *temp = (char *)calloc(2, sizeof(char));
	movl	$1, %esi	#,
	movl	$2, %edi	#,
	call	calloc@PLT	#
	movq	%rax, %r15	# tmp174, <retval>
# sub.c:364:         if (temp == NULL)
	testq	%rax, %rax	# <retval>
	je	.L184	#,
# sub.c:422:         temp[0] = '0';
	movl	$48, %eax	#,
	movw	%ax, (%r15)	#,* <retval>
# sub.c:425:         return temp;
	movl	$1, %eax	#, _27
.L79:
# sub.c:371:         *result_length = 1;
	movq	%rax, 0(%rbp)	# _27, *result_length_39(D)
# sub.c:438: }
	addq	$8, %rsp	#,
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
	movq	%r15, %rax	# <retval>,
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L181:
	.cfi_restore_state
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:38:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC7(%rip), %rcx	#, tmp126
	jmp	.L176	#
	.p2align 4,,10
	.p2align 3
.L179:
# sub.c:377:         result[0] = -result[0];
	negq	(%r15)	# *prephitmp_92
# sub.c:381:     size_t alloc_size = (*result_length) * 20 + 2; // 20 digits per number + sign + null terminator
	movq	0(%rbp), %rsi	# *result_length_39(D), _6
	jmp	.L80	#
	.p2align 4,,10
	.p2align 3
.L178:
# sub.c:353:     while (i < *result_length && result[i] == 0)
	cmpq	$0, (%rdi)	#, MEM[(uint64_t *)_3]
# sub.c:353:     while (i < *result_length && result[i] == 0)
	movq	%rdi, %r15	# result, _3
# sub.c:353:     while (i < *result_length && result[i] == 0)
	jne	.L75	#,
# sub.c:355:         i++;
	movl	$1, %ecx	#, i
# sub.c:353:     while (i < *result_length && result[i] == 0)
	leaq	8(%rdi), %rax	#, ivtmp.272
	jmp	.L152	#
.L180:
# sub.c:385:         perror("Memory allocation failed for result_str\n");
	leaq	.LC6(%rip), %rdi	#, tmp125
	call	perror@PLT	#
# sub.c:386:         exit(0);
	xorl	%edi, %edi	#
	call	exit@PLT	#
.L183:
# sub.c:431:         perror("Memory allocation failed for final_result\n");
	leaq	.LC10(%rip), %rdi	#, tmp135
	call	perror@PLT	#
# sub.c:432:         exit(0);
	xorl	%edi, %edi	#
	call	exit@PLT	#
.L184:
# sub.c:366:             perror("Memory allocation failed for temp\n");
	leaq	.LC5(%rip), %rdi	#, tmp118
	call	perror@PLT	#
# sub.c:367:             exit(0);
	xorl	%edi, %edi	#
	call	exit@PLT	#
	.cfi_endproc
.LFE5787:
	.size	limb_get_str, .-limb_get_str
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"Memory allocation failed for limbs"
	.text
	.p2align 4
	.globl	limb_set_str
	.type	limb_set_str, @function
limb_set_str:
.LFB5788:
	.cfi_startproc
	endbr64	
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%r9, %r14	# tmp410, n_2
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12	# tmp406, str2
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r8, %rbx	# tmp409, n_1
	subq	$120, %rsp	#,
	.cfi_def_cfa_offset 176
# sub.c:441: {
	movq	%rdx, 24(%rsp)	# tmp407, %sfp
	movq	%rcx, 32(%rsp)	# tmp408, %sfp
	movq	%r8, 40(%rsp)	# n_1, %sfp
	movq	%r9, 48(%rsp)	# n_2, %sfp
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp421
	movq	%rax, 104(%rsp)	# tmp421, D.40762
	xorl	%eax, %eax	# tmp421
# sub.c:442:     int len1 = strlen(str1);
	movq	%rdi, 56(%rsp)	# str1, %sfp
	call	strlen@PLT	#
# sub.c:443:     int len2 = strlen(str2);
	movq	%r12, %rdi	# str2,
# sub.c:442:     int len1 = strlen(str1);
	movq	%rax, %r15	# tmp411, tmp178
# sub.c:443:     int len2 = strlen(str2);
	call	strlen@PLT	#
	movq	%rax, %r13	# tmp412, tmp181
# sub.c:445:     *n_1 = len1;
	movl	%r15d, (%rbx)	# tmp178, *n_1_57(D)
# sub.c:450:     int num_limbs_2 = (len2 + LIMB_SIZE - 1) / LIMB_SIZE;
	leal	17(%r13), %edx	#, tmp189
# sub.c:446:     *n_2 = len2;
	movl	%eax, (%r14)	# tmp181, *n_2_59(D)
# sub.c:449:     int num_limbs_1 = (len1 + LIMB_SIZE - 1) / LIMB_SIZE;
	leal	17(%r15), %eax	#, tmp183
# sub.c:450:     int num_limbs_2 = (len2 + LIMB_SIZE - 1) / LIMB_SIZE;
	movslq	%edx, %rcx	# tmp189, tmp190
# sub.c:449:     int num_limbs_1 = (len1 + LIMB_SIZE - 1) / LIMB_SIZE;
	movslq	%eax, %rbp	# tmp183, tmp184
# sub.c:450:     int num_limbs_2 = (len2 + LIMB_SIZE - 1) / LIMB_SIZE;
	imulq	$954437177, %rcx, %rbx	#, tmp190, tmp191
# sub.c:449:     int num_limbs_1 = (len1 + LIMB_SIZE - 1) / LIMB_SIZE;
	imulq	$954437177, %rbp, %rbp	#, tmp184, tmp185
	sarl	$31, %eax	#, tmp188
# sub.c:450:     int num_limbs_2 = (len2 + LIMB_SIZE - 1) / LIMB_SIZE;
	sarl	$31, %edx	#, tmp194
# sub.c:449:     int num_limbs_1 = (len1 + LIMB_SIZE - 1) / LIMB_SIZE;
	sarq	$34, %rbp	#, tmp187
# sub.c:450:     int num_limbs_2 = (len2 + LIMB_SIZE - 1) / LIMB_SIZE;
	sarq	$34, %rbx	#, tmp193
# sub.c:449:     int num_limbs_1 = (len1 + LIMB_SIZE - 1) / LIMB_SIZE;
	subl	%eax, %ebp	# tmp188, num_limbs_1
# sub.c:450:     int num_limbs_2 = (len2 + LIMB_SIZE - 1) / LIMB_SIZE;
	subl	%edx, %ebx	# tmp194, num_limbs_2
# sub.c:451:     int max_limbs = num_limbs_1 > num_limbs_2 ? num_limbs_1 : num_limbs_2;
	cmpl	%ebx, %ebp	# num_limbs_2, num_limbs_1
	movl	%ebx, %esi	# num_limbs_2, max_limbs
	cmovge	%ebp, %esi	# num_limbs_1,, max_limbs
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	96(%rsp), %rdi	#, tmp196
# sub.c:454:     aligned_uint64_ptr limbs1 = (aligned_uint64_ptr)_mm_malloc(max_limbs * sizeof(uint64_t), 64);
	movslq	%esi, %rdx	# max_limbs, max_limbs
	salq	$3, %rdx	#, _6
# sub.c:451:     int max_limbs = num_limbs_1 > num_limbs_2 ? num_limbs_1 : num_limbs_2;
	movl	%esi, 20(%rsp)	# max_limbs, %sfp
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	movl	$64, %esi	#,
	movq	%rdx, 8(%rsp)	# _6, %sfp
	call	posix_memalign@PLT	#
	testl	%eax, %eax	# tmp413
	movq	8(%rsp), %rdx	# %sfp, _6
	jne	.L186	#,
	movq	96(%rsp), %rdi	# D.40718, _116
	movl	$64, %esi	#,
	movq	%rdi, 8(%rsp)	# _116, %sfp
	leaq	88(%rsp), %rdi	#, tmp197
	movq	%rdx, 64(%rsp)	# _6, %sfp
	call	posix_memalign@PLT	#
	testl	%eax, %eax	# tmp414
	jne	.L187	#,
# sub.c:457:     if (limbs1 == NULL || limbs2 == NULL)
	cmpq	$0, 8(%rsp)	#, %sfp
	movq	88(%rsp), %r14	# D.40712, _104
	je	.L187	#,
	testq	%r14, %r14	# _104
	movq	64(%rsp), %rdx	# %sfp, _6
	movq	56(%rsp), %r10	# %sfp, str1
	je	.L187	#,
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	8(%rsp), %rdi	# %sfp,
	xorl	%esi, %esi	#
	movq	%r10, 64(%rsp)	# str1, %sfp
	movq	%rdx, 56(%rsp)	# _6, %sfp
	call	memset@PLT	#
	movq	56(%rsp), %rdx	# %sfp, _6
	xorl	%esi, %esi	#
	movq	%r14, %rdi	# _104,
	call	memset@PLT	#
# sub.c:468:     int limbs_offset_1 = max_limbs - num_limbs_1;
	movl	20(%rsp), %r8d	# %sfp, max_limbs
	movl	%r8d, %r11d	# max_limbs, limbs_offset_1
# sub.c:469:     int limbs_offset_2 = max_limbs - num_limbs_2;
	subl	%ebx, %r8d	# num_limbs_2, limbs_offset_2
	movl	%r8d, 56(%rsp)	# limbs_offset_2, %sfp
# sub.c:468:     int limbs_offset_1 = max_limbs - num_limbs_1;
	subl	%ebp, %r11d	# num_limbs_1, limbs_offset_1
# sub.c:472:     for (i = len1 - 1, k = num_limbs_1 - 1; k >= 0; k--)
	leal	-1(%r15), %r8d	#, i
# sub.c:472:     for (i = len1 - 1, k = num_limbs_1 - 1; k >= 0; k--)
	testl	%r15d, %r15d	# tmp178
	jle	.L190	#,
	movslq	%r11d, %r15	# limbs_offset_1, _165
	movq	8(%rsp), %rax	# %sfp, _116
	movq	%r15, 72(%rsp)	# _165, %sfp
	leal	-2(%rbp), %r9d	#, tmp211
	movq	64(%rsp), %r10	# %sfp, str1
	movslq	%r9d, %r9	# tmp211, ivtmp.305
	leaq	(%rax,%r15,8), %r11	#, _160
	.p2align 4,,10
	.p2align 3
.L203:
# sub.c:476:         int digits_in_limb = LIMB_SIZE < (i + 1) ? LIMB_SIZE : (i + 1);
	movl	$17, %esi	#, tmp420
	cmpl	%esi, %r8d	# tmp420, i
	cmovle	%r8d, %esi	# i,, _14
# sub.c:477:         for (int j = 0; j < digits_in_limb; j++, i--)
	testl	%r8d, %r8d	# i
	js	.L191	#,
	movslq	%r8d, %rbp	# i, i
	addq	%r10, %rbp	# str1, ivtmp.302
# sub.c:479:             limb += (str1[i] - '0') * power;
	movsbl	0(%rbp), %eax	# MEM[(char *)_149], MEM[(char *)_149]
	movl	%esi, %r15d	# _14, tmp272
# sub.c:479:             limb += (str1[i] - '0') * power;
	subl	$48, %eax	#, tmp215
	andl	$3, %r15d	#, tmp272
# sub.c:479:             limb += (str1[i] - '0') * power;
	cltq
	movl	$10, %edx	#, power
# sub.c:477:         for (int j = 0; j < digits_in_limb; j++, i--)
	movl	$1, %edi	#, j
# sub.c:477:         for (int j = 0; j < digits_in_limb; j++, i--)
	leaq	-1(%rbp), %rcx	#, ivtmp.302
	cmpl	$1, %esi	#, _14
	jl	.L239	#,
	testl	%r15d, %r15d	# tmp272
	je	.L192	#,
	cmpl	$1, %r15d	#, tmp272
	je	.L231	#,
	cmpl	$2, %r15d	#, tmp272
	je	.L232	#,
# sub.c:479:             limb += (str1[i] - '0') * power;
	movsbl	-1(%rbp), %edx	# MEM[(char *)_149], MEM[(char *)_149]
# sub.c:479:             limb += (str1[i] - '0') * power;
	subl	$48, %edx	#, tmp385
	movslq	%edx, %rdi	# tmp385, tmp386
# sub.c:479:             limb += (str1[i] - '0') * power;
	imulq	$10, %rdi, %rcx	#, tmp386, tmp387
	movl	$100, %edx	#, power
# sub.c:477:         for (int j = 0; j < digits_in_limb; j++, i--)
	movl	$2, %edi	#, j
# sub.c:479:             limb += (str1[i] - '0') * power;
	addq	%rcx, %rax	# tmp387, limb
# sub.c:477:         for (int j = 0; j < digits_in_limb; j++, i--)
	leaq	-2(%rbp), %rcx	#, ivtmp.302
.L232:
# sub.c:479:             limb += (str1[i] - '0') * power;
	movsbl	(%rcx), %ebp	# MEM[(char *)_149], MEM[(char *)_149]
# sub.c:477:         for (int j = 0; j < digits_in_limb; j++, i--)
	incl	%edi	# j
# sub.c:479:             limb += (str1[i] - '0') * power;
	subl	$48, %ebp	#, tmp392
	movslq	%ebp, %r15	# tmp392, tmp393
# sub.c:479:             limb += (str1[i] - '0') * power;
	imulq	%rdx, %r15	# power, tmp394
	leaq	(%rdx,%rdx,4), %rdx	#, tmp396
	addq	%rdx, %rdx	# power
# sub.c:479:             limb += (str1[i] - '0') * power;
	addq	%r15, %rax	# tmp394, limb
# sub.c:477:         for (int j = 0; j < digits_in_limb; j++, i--)
	decq	%rcx	# ivtmp.302
.L231:
# sub.c:479:             limb += (str1[i] - '0') * power;
	movsbl	(%rcx), %ebp	# MEM[(char *)_149], MEM[(char *)_149]
# sub.c:477:         for (int j = 0; j < digits_in_limb; j++, i--)
	incl	%edi	# j
# sub.c:479:             limb += (str1[i] - '0') * power;
	subl	$48, %ebp	#, tmp399
	movslq	%ebp, %r15	# tmp399, tmp400
# sub.c:479:             limb += (str1[i] - '0') * power;
	imulq	%rdx, %r15	# power, tmp401
	leaq	(%rdx,%rdx,4), %rdx	#, tmp403
	addq	%rdx, %rdx	# power
# sub.c:479:             limb += (str1[i] - '0') * power;
	addq	%r15, %rax	# tmp401, limb
# sub.c:477:         for (int j = 0; j < digits_in_limb; j++, i--)
	decq	%rcx	# ivtmp.302
	cmpl	%edi, %esi	# j, _14
	jl	.L239	#,
.L192:
# sub.c:479:             limb += (str1[i] - '0') * power;
	movsbl	(%rcx), %ebp	# MEM[(char *)_149], MEM[(char *)_149]
# sub.c:477:         for (int j = 0; j < digits_in_limb; j++, i--)
	addl	$4, %edi	#, j
# sub.c:479:             limb += (str1[i] - '0') * power;
	subl	$48, %ebp	#, tmp280
	movslq	%ebp, %r15	# tmp280, tmp281
# sub.c:479:             limb += (str1[i] - '0') * power;
	imulq	%rdx, %r15	# power, tmp282
	leaq	(%rdx,%rdx,4), %rbp	#, tmp285
	leaq	(%rbp,%rbp), %rdx	#, tmp286
# sub.c:479:             limb += (str1[i] - '0') * power;
	addq	%r15, %rax	# tmp282, limb
# sub.c:479:             limb += (str1[i] - '0') * power;
	movsbl	-1(%rcx), %r15d	# MEM[(char *)_149], MEM[(char *)_149]
	leaq	(%rdx,%rbp,8), %rbp	#, tmp296
# sub.c:479:             limb += (str1[i] - '0') * power;
	subl	$48, %r15d	#, tmp291
	movslq	%r15d, %r15	# tmp291, tmp292
# sub.c:479:             limb += (str1[i] - '0') * power;
	imulq	%rdx, %r15	# tmp286, tmp293
	leaq	(%rbp,%rbp), %rdx	#, tmp297
	leaq	(%rdx,%rbp,8), %rbp	#, tmp307
# sub.c:479:             limb += (str1[i] - '0') * power;
	addq	%r15, %rax	# tmp293, limb
# sub.c:479:             limb += (str1[i] - '0') * power;
	movsbl	-2(%rcx), %r15d	# MEM[(char *)_149], MEM[(char *)_149]
# sub.c:477:         for (int j = 0; j < digits_in_limb; j++, i--)
	subq	$4, %rcx	#, ivtmp.302
# sub.c:479:             limb += (str1[i] - '0') * power;
	subl	$48, %r15d	#, tmp302
	movslq	%r15d, %r15	# tmp302, tmp303
# sub.c:479:             limb += (str1[i] - '0') * power;
	imulq	%rdx, %r15	# tmp297, tmp304
	leaq	(%rbp,%rbp), %rdx	#, tmp308
# sub.c:479:             limb += (str1[i] - '0') * power;
	addq	%rax, %r15	# limb, limb
# sub.c:479:             limb += (str1[i] - '0') * power;
	movsbl	1(%rcx), %eax	# MEM[(char *)_149], MEM[(char *)_149]
# sub.c:479:             limb += (str1[i] - '0') * power;
	subl	$48, %eax	#, tmp313
	cltq
# sub.c:479:             limb += (str1[i] - '0') * power;
	imulq	%rdx, %rax	# tmp308, tmp315
	leaq	(%rdx,%rbp,8), %rdx	#, tmp317
	addq	%rdx, %rdx	# power
# sub.c:479:             limb += (str1[i] - '0') * power;
	addq	%r15, %rax	# limb, limb
# sub.c:477:         for (int j = 0; j < digits_in_limb; j++, i--)
	cmpl	%edi, %esi	# j, _14
	jge	.L192	#,
.L239:
	decl	%r8d	# _172
# sub.c:477:         for (int j = 0; j < digits_in_limb; j++, i--)
	xorl	%edi, %edi	# tmp419
	testl	%esi, %esi	# _14
	cmovns	%esi, %edi	# _14,, tmp222
# sub.c:482:         limbs1[limbs_offset_1 + k] = limb;
	movq	%rax, 8(%r11,%r9,8)	# limb, MEM[(uint64_t *)_160 + 8B + ivtmp.305_148 * 8]
# sub.c:477:         for (int j = 0; j < digits_in_limb; j++, i--)
	subl	%edi, %r8d	# tmp222, i
# sub.c:472:     for (i = len1 - 1, k = num_limbs_1 - 1; k >= 0; k--)
	testl	%r9d, %r9d	# ivtmp.305
	js	.L190	#,
	decq	%r9	# ivtmp.305
	jmp	.L203	#
	.p2align 4,,10
	.p2align 3
.L191:
# sub.c:482:         limbs1[limbs_offset_1 + k] = limb;
	movq	$0, 8(%r11,%r9,8)	#, MEM[(uint64_t *)_160 + 8B + ivtmp.305_148 * 8]
# sub.c:472:     for (i = len1 - 1, k = num_limbs_1 - 1; k >= 0; k--)
	testl	%r9d, %r9d	# ivtmp.305
	jns	.L248	#,
.L190:
# sub.c:486:     for (i = len2 - 1, k = num_limbs_2 - 1; k >= 0; k--)
	leal	-1(%r13), %r8d	#, i
# sub.c:486:     for (i = len2 - 1, k = num_limbs_2 - 1; k >= 0; k--)
	testl	%r13d, %r13d	# tmp181
	jle	.L194	#,
	movslq	56(%rsp), %r11	# %sfp, _133
	leal	-2(%rbx), %ebx	#, tmp223
	movslq	%ebx, %r9	# tmp223, ivtmp.290
	leaq	(%r14,%r11,8), %r10	#, _141
	.p2align 4,,10
	.p2align 3
.L198:
# sub.c:490:         int digits_in_limb = LIMB_SIZE < (i + 1) ? LIMB_SIZE : (i + 1);
	movl	$17, %esi	#, tmp418
	cmpl	%esi, %r8d	# tmp418, i
	cmovle	%r8d, %esi	# i,, _26
# sub.c:491:         for (int j = 0; j < digits_in_limb; j++, i--)
	testl	%r8d, %r8d	# i
	js	.L195	#,
	movslq	%r8d, %r15	# i, i
	addq	%r12, %r15	# str2, ivtmp.287
# sub.c:493:             limb += (str2[i] - '0') * power;
	movsbl	(%r15), %eax	# MEM[(char *)_179], MEM[(char *)_179]
	movl	%esi, %ebp	# _26, tmp268
# sub.c:493:             limb += (str2[i] - '0') * power;
	subl	$48, %eax	#, tmp227
	andl	$3, %ebp	#, tmp268
# sub.c:493:             limb += (str2[i] - '0') * power;
	cltq
	movl	$10, %edx	#, power
# sub.c:491:         for (int j = 0; j < digits_in_limb; j++, i--)
	movl	$1, %r13d	#, j
# sub.c:491:         for (int j = 0; j < digits_in_limb; j++, i--)
	leaq	-1(%r15), %rcx	#, ivtmp.287
	cmpl	$1, %esi	#, _26
	jl	.L240	#,
	testl	%ebp, %ebp	# tmp268
	je	.L196	#,
	cmpl	$1, %ebp	#, tmp268
	je	.L229	#,
	cmpl	$2, %ebp	#, tmp268
	je	.L230	#,
# sub.c:493:             limb += (str2[i] - '0') * power;
	movsbl	-1(%r15), %ecx	# MEM[(char *)_179], MEM[(char *)_179]
# sub.c:491:         for (int j = 0; j < digits_in_limb; j++, i--)
	movl	$2, %r13d	#, j
# sub.c:493:             limb += (str2[i] - '0') * power;
	subl	$48, %ecx	#, tmp364
	movslq	%ecx, %rdx	# tmp364, tmp365
# sub.c:493:             limb += (str2[i] - '0') * power;
	imulq	$10, %rdx, %rdi	#, tmp365, tmp366
# sub.c:491:         for (int j = 0; j < digits_in_limb; j++, i--)
	leaq	-2(%r15), %rcx	#, ivtmp.287
	movl	$100, %edx	#, power
# sub.c:493:             limb += (str2[i] - '0') * power;
	addq	%rdi, %rax	# tmp366, limb
.L230:
# sub.c:493:             limb += (str2[i] - '0') * power;
	movsbl	(%rcx), %ebx	# MEM[(char *)_179], MEM[(char *)_179]
# sub.c:491:         for (int j = 0; j < digits_in_limb; j++, i--)
	incl	%r13d	# j
# sub.c:493:             limb += (str2[i] - '0') * power;
	subl	$48, %ebx	#, tmp371
	movslq	%ebx, %r15	# tmp371, tmp372
# sub.c:493:             limb += (str2[i] - '0') * power;
	imulq	%rdx, %r15	# power, tmp373
	leaq	(%rdx,%rdx,4), %rdx	#, tmp375
	addq	%rdx, %rdx	# power
# sub.c:493:             limb += (str2[i] - '0') * power;
	addq	%r15, %rax	# tmp373, limb
# sub.c:491:         for (int j = 0; j < digits_in_limb; j++, i--)
	decq	%rcx	# ivtmp.287
.L229:
# sub.c:493:             limb += (str2[i] - '0') * power;
	movsbl	(%rcx), %ebp	# MEM[(char *)_179], MEM[(char *)_179]
# sub.c:491:         for (int j = 0; j < digits_in_limb; j++, i--)
	incl	%r13d	# j
# sub.c:493:             limb += (str2[i] - '0') * power;
	subl	$48, %ebp	#, tmp378
	movslq	%ebp, %rdi	# tmp378, tmp379
# sub.c:493:             limb += (str2[i] - '0') * power;
	imulq	%rdx, %rdi	# power, tmp380
	leaq	(%rdx,%rdx,4), %rdx	#, tmp382
	addq	%rdx, %rdx	# power
# sub.c:493:             limb += (str2[i] - '0') * power;
	addq	%rdi, %rax	# tmp380, limb
# sub.c:491:         for (int j = 0; j < digits_in_limb; j++, i--)
	decq	%rcx	# ivtmp.287
	cmpl	%r13d, %esi	# j, _26
	jl	.L240	#,
.L196:
# sub.c:493:             limb += (str2[i] - '0') * power;
	movsbl	(%rcx), %ebx	# MEM[(char *)_179], MEM[(char *)_179]
	leaq	(%rdx,%rdx,4), %rbp	#, tmp329
# sub.c:493:             limb += (str2[i] - '0') * power;
	subl	$48, %ebx	#, tmp324
	movslq	%ebx, %r15	# tmp324, tmp325
# sub.c:493:             limb += (str2[i] - '0') * power;
	imulq	%rdx, %r15	# power, tmp326
	leaq	(%rbp,%rbp), %rdi	#, tmp330
# sub.c:493:             limb += (str2[i] - '0') * power;
	movsbl	-1(%rcx), %edx	# MEM[(char *)_179], MEM[(char *)_179]
# sub.c:493:             limb += (str2[i] - '0') * power;
	addq	%r15, %rax	# tmp326, limb
	leaq	(%rdi,%rbp,8), %r15	#, tmp340
# sub.c:493:             limb += (str2[i] - '0') * power;
	movsbl	-2(%rcx), %ebp	# MEM[(char *)_179], MEM[(char *)_179]
# sub.c:493:             limb += (str2[i] - '0') * power;
	subl	$48, %edx	#, tmp335
	movslq	%edx, %rbx	# tmp335, tmp336
	subl	$48, %ebp	#, tmp346
# sub.c:493:             limb += (str2[i] - '0') * power;
	imulq	%rdi, %rbx	# tmp330, tmp337
# sub.c:493:             limb += (str2[i] - '0') * power;
	movslq	%ebp, %rbp	# tmp346, tmp347
	leaq	(%r15,%r15), %rdi	#, tmp341
# sub.c:493:             limb += (str2[i] - '0') * power;
	imulq	%rdi, %rbp	# tmp341, tmp348
# sub.c:493:             limb += (str2[i] - '0') * power;
	addq	%rbx, %rax	# tmp337, limb
	leaq	(%rdi,%r15,8), %rbx	#, tmp351
	addq	%rax, %rbp	# limb, limb
# sub.c:493:             limb += (str2[i] - '0') * power;
	movsbl	-3(%rcx), %eax	# MEM[(char *)_179], MEM[(char *)_179]
	leaq	(%rbx,%rbx), %rdx	#, tmp352
# sub.c:493:             limb += (str2[i] - '0') * power;
	subl	$48, %eax	#, tmp357
	cltq
# sub.c:493:             limb += (str2[i] - '0') * power;
	imulq	%rdx, %rax	# tmp352, tmp359
# sub.c:491:         for (int j = 0; j < digits_in_limb; j++, i--)
	addl	$4, %r13d	#, j
	leaq	(%rdx,%rbx,8), %rdx	#, tmp361
# sub.c:493:             limb += (str2[i] - '0') * power;
	addq	%rbp, %rax	# limb, limb
	addq	%rdx, %rdx	# power
# sub.c:491:         for (int j = 0; j < digits_in_limb; j++, i--)
	subq	$4, %rcx	#, ivtmp.287
	cmpl	%r13d, %esi	# j, _26
	jge	.L196	#,
.L240:
	decl	%r8d	# _132
# sub.c:491:         for (int j = 0; j < digits_in_limb; j++, i--)
	xorl	%r13d, %r13d	# tmp417
	testl	%esi, %esi	# _26
	cmovns	%esi, %r13d	# _26,, tmp234
# sub.c:496:         limbs2[limbs_offset_2 + k] = limb;
	movq	%rax, 8(%r10,%r9,8)	# limb, MEM[(uint64_t *)_141 + 8B + ivtmp.290_12 * 8]
# sub.c:491:         for (int j = 0; j < digits_in_limb; j++, i--)
	subl	%r13d, %r8d	# tmp234, i
# sub.c:486:     for (i = len2 - 1, k = num_limbs_2 - 1; k >= 0; k--)
	testl	%r9d, %r9d	# ivtmp.290
	js	.L194	#,
	decq	%r9	# ivtmp.290
	jmp	.L198	#
	.p2align 4,,10
	.p2align 3
.L195:
# sub.c:496:         limbs2[limbs_offset_2 + k] = limb;
	movq	$0, 8(%r10,%r9,8)	#, MEM[(uint64_t *)_141 + 8B + ivtmp.290_12 * 8]
# sub.c:486:     for (i = len2 - 1, k = num_limbs_2 - 1; k >= 0; k--)
	testl	%r9d, %r9d	# ivtmp.290
	js	.L194	#,
# sub.c:496:         limbs2[limbs_offset_2 + k] = limb;
	movl	$0, %eax	#, tmp416
	cmovns	%r9d, %eax	# ivtmp.290,, tmp236
	movslq	%r9d, %r13	# ivtmp.290, k
	cltq
	addq	%r11, %r13	# _133, tmp240
	leaq	8(,%rax,8), %r12	#, tmp238
	subq	%rax, %r13	# _135, tmp244
	leaq	(%r14,%r13,8), %rdi	#, tmp246
	movq	%r12, %rdx	# tmp238,
	xorl	%esi, %esi	#
	call	memset@PLT	#
.L194:
# sub.c:499:     *limbs1_base = limbs1;
	movq	24(%rsp), %r12	# %sfp, limbs1_base
	movq	8(%rsp), %rcx	# %sfp, _116
# sub.c:500:     *limbs2_base = limbs2;
	movq	32(%rsp), %rsi	# %sfp, limbs2_base
# sub.c:499:     *limbs1_base = limbs1;
	movq	%rcx, (%r12)	# _116, *limbs1_base_74(D)
# sub.c:501:     *n_1 = max_limbs;
	movl	20(%rsp), %r8d	# %sfp, max_limbs
# sub.c:500:     *limbs2_base = limbs2;
	movq	%r14, (%rsi)	# _104, *limbs2_base_76(D)
# sub.c:502:     *n_2 = max_limbs;
	movq	48(%rsp), %r9	# %sfp, n_2
# sub.c:501:     *n_1 = max_limbs;
	movq	40(%rsp), %r14	# %sfp, n_1
	movl	%r8d, (%r14)	# max_limbs, *n_1_57(D)
# sub.c:502:     *n_2 = max_limbs;
	movl	%r8d, (%r9)	# max_limbs, *n_2_59(D)
# sub.c:503: }
	movq	104(%rsp), %rax	# D.40762, tmp422
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp422
	jne	.L249	#,
	addq	$120, %rsp	#,
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
.L186:
	.cfi_restore_state
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	88(%rsp), %rdi	#, tmp235
	movl	$64, %esi	#,
	call	posix_memalign@PLT	#
.L187:
# sub.c:459:         perror("Memory allocation failed for limbs");
	leaq	.LC11(%rip), %rdi	#, tmp202
	call	perror@PLT	#
# sub.c:460:         exit(1);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L248:
# sub.c:482:         limbs1[limbs_offset_1 + k] = limb;
	movl	$0, %eax	#, tmp415
	cmovns	%r9d, %eax	# ivtmp.305,, tmp251
	movslq	%r9d, %rbp	# ivtmp.305, k
	cltq
	imulq	$-8, %rax, %rcx	#, _43, tmp257
	addq	72(%rsp), %rbp	# %sfp, tmp255
	leaq	8(,%rax,8), %rdx	#, tmp253
	leaq	(%rcx,%rbp,8), %rdi	#, tmp258
	addq	8(%rsp), %rdi	# %sfp, tmp259
	xorl	%esi, %esi	#
	call	memset@PLT	#
	jmp	.L190	#
.L249:
# sub.c:503: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE5788:
	.size	limb_set_str, .-limb_set_str
	.section	.rodata.str1.1
.LC12:
	.string	"Error opening event %d: %s\n"
	.text
	.p2align 4
	.globl	initialize_perf
	.type	initialize_perf, @function
initialize_perf:
.LFB5789:
	.cfi_startproc
	endbr64	
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movl	$768, %edx	#,
	xorl	%esi, %esi	#
# sub.c:519: {
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	fd(%rip), %r12	#, ivtmp.319
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	leaq	pe(%rip), %rbp	#, tmp181
	movq	%rbp, %rdi	# tmp181,
# sub.c:519: {
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
# sub.c:559:     pe[5].config = PERF_COUNT_HW_CACHE_L1D | (PERF_COUNT_HW_CACHE_OP_READ << 8) | (PERF_COUNT_HW_CACHE_RESULT_MISS << 16);
	xorl	%ebx, %ebx	# ivtmp.322
# sub.c:519: {
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	call	memset@PLT	#
# sub.c:550:     pe[3].type = PERF_TYPE_SOFTWARE;
	movabsq	$549755813889, %rax	#, tmp193
	movq	%rax, 384+pe(%rip)	# tmp193, MEM <unsigned long> [(unsigned int *)&pe + 384B]
# sub.c:554:     pe[4].type = PERF_TYPE_HW_CACHE;
	addq	$2, %rax	#, tmp166
# sub.c:524:         pe[i].size = sizeof(struct perf_event_attr);
	movl	$128, 4+pe(%rip)	#, pe[0].size
# sub.c:525:         pe[i].disabled = 1;
	movb	$-59, 40+pe(%rip)	#, MEM <unsigned char> [(struct perf_event_attr *)&pe + 40B]
# sub.c:524:         pe[i].size = sizeof(struct perf_event_attr);
	movl	$128, 132+pe(%rip)	#, pe[1].size
	movl	$128, 260+pe(%rip)	#, pe[2].size
# sub.c:525:         pe[i].disabled = 1;
	movb	$-59, 424+pe(%rip)	#, MEM <unsigned char> [(struct perf_event_attr *)&pe + 424B]
	movb	$-59, 552+pe(%rip)	#, MEM <unsigned char> [(struct perf_event_attr *)&pe + 552B]
	movb	$-59, 680+pe(%rip)	#, MEM <unsigned char> [(struct perf_event_attr *)&pe + 680B]
# sub.c:539:     pe[1].config = PERF_COUNT_HW_INSTRUCTIONS;
	movq	$1, 136+pe(%rip)	#, pe[1].config
# sub.c:525:         pe[i].disabled = 1;
	movb	$-27, 168+pe(%rip)	#, MEM <unsigned char> [(struct perf_event_attr *)&pe + 168B]
# sub.c:545:     pe[2].config = PERF_COUNT_HW_INSTRUCTIONS;
	movq	$1, 264+pe(%rip)	#, pe[2].config
# sub.c:525:         pe[i].disabled = 1;
	movb	$-43, 296+pe(%rip)	#, MEM <unsigned char> [(struct perf_event_attr *)&pe + 296B]
# sub.c:551:     pe[3].config = PERF_COUNT_SW_PAGE_FAULTS;
	movq	$2, 392+pe(%rip)	#, pe[3].config
# sub.c:554:     pe[4].type = PERF_TYPE_HW_CACHE;
	movq	%rax, 512+pe(%rip)	# tmp166, MEM <unsigned long> [(unsigned int *)&pe + 512B]
# sub.c:558:     pe[5].type = PERF_TYPE_HW_CACHE;
	movq	%rax, 640+pe(%rip)	# tmp166, MEM <unsigned long> [(unsigned int *)&pe + 640B]
# sub.c:559:     pe[5].config = PERF_COUNT_HW_CACHE_L1D | (PERF_COUNT_HW_CACHE_OP_READ << 8) | (PERF_COUNT_HW_CACHE_RESULT_MISS << 16);
	movq	$65536, 648+pe(%rip)	#, pe[5].config
	.p2align 4,,10
	.p2align 3
.L254:
# sub.c:100:     ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
	movq	%rbx, %rsi	# ivtmp.322, tmp171
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	salq	$7, %rsi	#, tmp171
	addq	%rbp, %rsi	# tmp181, tmp172
	xorl	%r9d, %r9d	#
	movl	$-1, %r8d	#,
	xorl	%edx, %edx	#
	movl	$298, %edi	#,
	xorl	%eax, %eax	#
	call	syscall@PLT	#
# sub.c:564:         fd[i] = perf_event_open(&pe[i], 0, CORE_NO, -1, 0);
	movl	%eax, (%r12,%rbx,4)	# _41, MEM[(int *)&fd + ivtmp.322_88 * 4]
	movl	%ebx, %r13d	# ivtmp.322, _97
# sub.c:565:         if (fd[i] == -1)
	cmpl	$-1, %eax	#, _41
	je	.L261	#,
# sub.c:562:     for (int i = 0; i < MAX_EVENTS; i++)
	incq	%rbx	# ivtmp.322
	cmpq	$6, %rbx	#, ivtmp.322
	jne	.L254	#,
# sub.c:576: }
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
.L261:
	.cfi_restore_state
# sub.c:567:             fprintf(stderr, "Error opening event %d: %s\n", i, strerror(errno));
	call	__errno_location@PLT	#
# sub.c:567:             fprintf(stderr, "Error opening event %d: %s\n", i, strerror(errno));
	movl	(%rax), %edi	# *_3,
	call	strerror@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	# stderr,
# sub.c:567:             fprintf(stderr, "Error opening event %d: %s\n", i, strerror(errno));
	movq	%rax, %r8	#, tmp191
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	# _97,
	xorl	%eax, %eax	#
	leaq	.LC12(%rip), %rdx	#, tmp176
	movl	$1, %esi	#,
	call	__fprintf_chk@PLT	#
# sub.c:569:             for (int j = 0; j < i; j++)
	testl	%ebx, %ebx	# _97
	je	.L252	#,
	leaq	fd(%rip), %rbx	#, ivtmp.319
	leal	-1(%r13), %edx	#, tmp178
	leaq	4(%rbx), %rcx	#, tmp180
	leaq	(%rcx,%rdx,4), %rbp	#, _87
.L253:
# sub.c:571:                 close(fd[j]);
	movl	(%rbx), %edi	# MEM[(int *)_64],
# sub.c:569:             for (int j = 0; j < i; j++)
	addq	$4, %rbx	#, ivtmp.319
# sub.c:571:                 close(fd[j]);
	call	close@PLT	#
# sub.c:569:             for (int j = 0; j < i; j++)
	cmpq	%rbp, %rbx	# _87, ivtmp.319
	jne	.L253	#,
.L252:
# sub.c:573:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5789:
	.size	initialize_perf, .-initialize_perf
	.section	.rodata.str1.1
.LC13:
	.string	"Error reading counter value"
	.text
	.p2align 4
	.globl	read_perf
	.type	read_perf, @function
read_perf:
.LFB5790:
	.cfi_startproc
	endbr64	
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp	# tmp91, ivtmp.339
	pushq	%rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	fd(%rip), %rbx	#, ivtmp.338
	leaq	24(%rbx), %r12	#, _24
	.p2align 4,,10
	.p2align 3
.L264:
# /usr/include/x86_64-linux-gnu/bits/unistd.h:38:   return __glibc_fortify (read, __nbytes, sizeof (char),
	movl	(%rbx), %edi	# MEM[(int *)_14],
	movl	$8, %edx	#,
	movq	%rbp, %rsi	# ivtmp.339,
	call	read@PLT	#
# sub.c:582:         if (read(fd[j], &values[j], sizeof(uint64_t)) == -1)
	cmpq	$-1, %rax	#, tmp92
	je	.L267	#,
# sub.c:580:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$4, %rbx	#, ivtmp.338
	addq	$8, %rbp	#, ivtmp.339
	cmpq	%r12, %rbx	# _24, ivtmp.338
	jne	.L264	#,
# sub.c:588: }
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
	ret	
.L267:
	.cfi_restore_state
# sub.c:584:             perror("Error reading counter value");
	leaq	.LC13(%rip), %rdi	#, tmp90
	call	perror@PLT	#
# sub.c:585:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5790:
	.size	read_perf, .-read_perf
	.section	.rodata.str1.1
.LC14:
	.string	"%lu,"
.LC15:
	.string	"Error writing to gzFile: %s\n"
.LC16:
	.string	"\n"
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Error writing newline to gzFile: %s\n"
	.text
	.p2align 4
	.globl	write_perf
	.type	write_perf, @function
write_perf:
.LFB5791:
	.cfi_startproc
	endbr64	
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	48(%rsi), %r13	#, _32
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	.LC14(%rip), %r12	#, tmp104
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp	# tmp105, file
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rbx	# tmp106, ivtmp.349
	subq	$24, %rsp	#,
	.cfi_def_cfa_offset 64
# sub.c:591: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp111
	movq	%rax, 8(%rsp)	# tmp111, D.40817
	xorl	%eax, %eax	# tmp111
	.p2align 4,,10
	.p2align 3
.L270:
# sub.c:594:         if (gzprintf(file, "%" PRIu64 ",", values[j]) <= 0)
	movq	(%rbx), %rdx	# MEM[(uint64_t *)_9],
	xorl	%eax, %eax	#
	movq	%r12, %rsi	# tmp104,
	movq	%rbp, %rdi	# file,
	call	gzprintf@PLT	#
# sub.c:594:         if (gzprintf(file, "%" PRIu64 ",", values[j]) <= 0)
	testl	%eax, %eax	# tmp107
	jle	.L277	#,
# sub.c:592:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$8, %rbx	#, ivtmp.349
	cmpq	%r13, %rbx	# _32, ivtmp.349
	jne	.L270	#,
# sub.c:602:     if (gzprintf(file, "\n") <= 0)
	xorl	%eax, %eax	#
	leaq	.LC16(%rip), %rsi	#, tmp99
	movq	%rbp, %rdi	# file,
	call	gzprintf@PLT	#
# sub.c:602:     if (gzprintf(file, "\n") <= 0)
	testl	%eax, %eax	# tmp109
	jle	.L278	#,
# sub.c:609: }
	movq	8(%rsp), %rax	# D.40817, tmp112
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp112
	jne	.L279	#,
	addq	$24, %rsp	#,
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
.L277:
	.cfi_restore_state
# sub.c:597:             const char *errmsg = gzerror(file, &errnum);
	leaq	4(%rsp), %rsi	#, tmp96
	movq	%rbp, %rdi	# file,
	call	gzerror@PLT	#
	movq	%rax, %rcx	# tmp108, errmsg
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC15(%rip), %rdx	#, tmp98
.L276:
	movq	stderr(%rip), %rdi	# stderr,
	movl	$1, %esi	#,
	xorl	%eax, %eax	#
	call	__fprintf_chk@PLT	#
# sub.c:607:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L279:
# sub.c:609: }
	call	__stack_chk_fail@PLT	#
.L278:
# sub.c:605:         const char *errmsg = gzerror(file, &errnum);
	leaq	4(%rsp), %rsi	#, tmp100
	movq	%rbp, %rdi	# file,
	call	gzerror@PLT	#
	movq	%rax, %rcx	# tmp110, errmsg
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC17(%rip), %rdx	#, tmp102
	jmp	.L276	#
	.cfi_endproc
.LFE5791:
	.size	write_perf, .-write_perf
	.section	.rodata.str1.1
.LC18:
	.string	"Error resetting perf event"
.LC19:
	.string	"Error enabling perf event"
	.text
	.p2align 4
	.globl	start_perf
	.type	start_perf, @function
start_perf:
.LFB5792:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	fd(%rip), %rbx	#, ivtmp.359
	leaq	24(%rbx), %rbp	#, _23
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L283:
# sub.c:615:         if (ioctl(fd[j], PERF_EVENT_IOC_RESET, 0) == -1)
	movl	(%rbx), %edi	# MEM[(int *)_20],
	xorl	%edx, %edx	#
	xorl	%eax, %eax	#
	movl	$9219, %esi	#,
	call	ioctl@PLT	#
# sub.c:615:         if (ioctl(fd[j], PERF_EVENT_IOC_RESET, 0) == -1)
	cmpl	$-1, %eax	#, tmp91
	je	.L286	#,
# sub.c:620:         if (ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0) == -1)
	movl	(%rbx), %edi	# MEM[(int *)_20],
	xorl	%edx, %edx	#
	xorl	%eax, %eax	#
	movl	$9216, %esi	#,
	call	ioctl@PLT	#
# sub.c:620:         if (ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0) == -1)
	cmpl	$-1, %eax	#, tmp92
	je	.L287	#,
# sub.c:613:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$4, %rbx	#, ivtmp.359
	cmpq	%rbp, %rbx	# _23, ivtmp.359
	jne	.L283	#,
# sub.c:626: }
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx	#
	.cfi_def_cfa_offset 16
	popq	%rbp	#
	.cfi_def_cfa_offset 8
	ret	
.L286:
	.cfi_restore_state
# sub.c:617:             perror("Error resetting perf event");
	leaq	.LC18(%rip), %rdi	#, tmp89
	call	perror@PLT	#
# sub.c:618:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L287:
# sub.c:622:             perror("Error enabling perf event");
	leaq	.LC19(%rip), %rdi	#, tmp90
	call	perror@PLT	#
# sub.c:623:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5792:
	.size	start_perf, .-start_perf
	.section	.rodata.str1.1
.LC20:
	.string	"Error disabling counter"
	.text
	.p2align 4
	.globl	stop_perf
	.type	stop_perf, @function
stop_perf:
.LFB5793:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	fd(%rip), %rbx	#, ivtmp.369
	leaq	24(%rbx), %rbp	#, _17
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L290:
# sub.c:631:         if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
	movl	(%rbx), %edi	# MEM[(int *)_15],
	xorl	%edx, %edx	#
	xorl	%eax, %eax	#
	movl	$9217, %esi	#,
	call	ioctl@PLT	#
# sub.c:631:         if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
	cmpl	$-1, %eax	#, tmp88
	je	.L293	#,
# sub.c:629:     for (int j = 0; j < MAX_EVENTS; j++)
	addq	$4, %rbx	#, ivtmp.369
	cmpq	%rbp, %rbx	# _17, ivtmp.369
	jne	.L290	#,
# sub.c:637: }
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx	#
	.cfi_def_cfa_offset 16
	popq	%rbp	#
	.cfi_def_cfa_offset 8
	ret	
.L293:
	.cfi_restore_state
# sub.c:633:             perror("Error disabling counter");
	leaq	.LC20(%rip), %rdi	#, tmp87
	call	perror@PLT	#
# sub.c:634:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
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
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12	# tmp97, str
	pushq	%rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 32
# sub.c:642:     while (*str == '0' || isspace(*str))
	jmp	.L295	#
	.p2align 4,,10
	.p2align 3
.L296:
# sub.c:644:         str++;
	incq	%r12	# str
.L295:
# sub.c:642:     while (*str == '0' || isspace(*str))
	movsbq	(%r12), %rbx	# MEM[(char *)str_9],
# sub.c:642:     while (*str == '0' || isspace(*str))
	cmpb	$48, %bl	#, _1
	je	.L296	#,
# sub.c:642:     while (*str == '0' || isspace(*str))
	call	__ctype_b_loc@PLT	#
	movq	(%rax), %rax	# *_27, *_27
# sub.c:642:     while (*str == '0' || isspace(*str))
	testb	$32, 1(%rax,%rbx,2)	#, *_7
	jne	.L296	#,
# sub.c:647: }
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 24
	popq	%rbx	#
	.cfi_def_cfa_offset 16
	movq	%r12, %rax	# str,
	popq	%r12	#
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
	pushq	%rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# sub.c:651: {
	movq	%rdi, %rbx	# tmp92, str
# sub.c:652:     size_t len = strlen(str);
	call	strlen@PLT	#
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	testq	%rax, %rax	# tmp88
	je	.L306	#,
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	leaq	-1(%rbx,%rax), %rax	#, _2
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	cmpb	$10, (%rax)	#, *_2
	je	.L308	#,
.L306:
# sub.c:657: }
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L308:
	.cfi_restore_state
# sub.c:655:         str[len - 1] = '\0';
	movb	$0, (%rax)	#, *_2
# sub.c:657: }
	popq	%rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE5795:
	.size	trim_trailing_newline, .-trim_trailing_newline
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"The two subs are not equal, lengths are different"
	.section	.rodata.str1.1
.LC22:
	.string	"The two subs are not equal"
.LC23:
	.string	"Mismatch at index %ld\n"
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"result[%ld] = %c, result_gmp[%ld] = %c\n"
	.section	.rodata.str1.1
.LC25:
	.string	"result = %s\nresult_gmp = %s\n"
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"The two subs are not equal, one is negative and the other is not"
	.text
	.p2align 4
	.globl	check_result
	.type	check_result, @function
check_result:
.LFB5796:
	.cfi_startproc
	endbr64	
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
# sub.c:669:         result++;
	xorl	%eax, %eax	# tmp164
# sub.c:661: {
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12	# tmp193, result_gmp
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp	# tmp192, result
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp	#,
	.cfi_def_cfa_offset 80
# sub.c:664:     bool result_negative = (result[0] == '-');
	movzbl	(%rdi), %ebx	# *result_22(D), _1
# sub.c:665:     bool result_gmp_negative = (result_gmp[0] == '-');
	movzbl	(%rsi), %r13d	# *result_gmp_24(D), _2
# sub.c:669:         result++;
	cmpb	$45, %bl	#, _1
	sete	%al	#, tmp164
	addq	%rax, %rbp	# tmp164, result
# sub.c:671:         result_gmp++;
	xorl	%edx, %edx	# tmp167
	cmpb	$45, %r13b	#, _2
	sete	%dl	#, tmp167
	addq	%rdx, %r12	# tmp167, result_gmp
# sub.c:642:     while (*str == '0' || isspace(*str))
	call	__ctype_b_loc@PLT	#
	movq	(%rax), %rax	# *_118, pretmp_120
	jmp	.L312	#
	.p2align 4,,10
	.p2align 3
.L313:
# sub.c:644:         str++;
	incq	%rbp	# result
.L312:
# sub.c:642:     while (*str == '0' || isspace(*str))
	movsbq	0(%rbp), %rcx	# MEM[(char *)str_58],
# sub.c:642:     while (*str == '0' || isspace(*str))
	cmpb	$48, %cl	#, _60
	je	.L313	#,
	testb	$32, 1(%rax,%rcx,2)	#, *_65
	jne	.L313	#,
# sub.c:642:     while (*str == '0' || isspace(*str))
	movsbq	(%r12), %rsi	# MEM[(char *)str_47],
# sub.c:642:     while (*str == '0' || isspace(*str))
	cmpb	$48, %sil	#, _49
	jne	.L387	#,
	.p2align 4,,10
	.p2align 3
.L315:
# sub.c:642:     while (*str == '0' || isspace(*str))
	movsbq	1(%r12), %rsi	# MEM[(char *)str_47],
# sub.c:644:         str++;
	incq	%r12	# result_gmp
# sub.c:642:     while (*str == '0' || isspace(*str))
	cmpb	$48, %sil	#, _49
	je	.L315	#,
.L387:
	testb	$32, 1(%rax,%rsi,2)	#, *_54
	jne	.L315	#,
# sub.c:652:     size_t len = strlen(str);
	movq	%rbp, %rdi	# result,
	call	strlen@PLT	#
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	testq	%rax, %rax	# tmp134
	je	.L316	#,
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	leaq	-1(%rbp,%rax), %rdi	#, _45
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	cmpb	$10, (%rdi)	#, *_45
	je	.L388	#,
.L316:
# sub.c:652:     size_t len = strlen(str);
	movq	%r12, %rdi	# result_gmp,
	call	strlen@PLT	#
	movq	%rax, %r15	# tmp196, len
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	testq	%rax, %rax	# len
	jne	.L389	#,
.L317:
# sub.c:682:     if (strlen(result) != strlen(result_gmp))
	movq	%rbp, %rdi	# result,
	call	strlen@PLT	#
# sub.c:682:     if (strlen(result) != strlen(result_gmp))
	testq	%rax, %rax	# tmp199
	je	.L321	#,
.L319:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC21(%rip), %rdi	#, tmp147
	call	puts@PLT	#
# sub.c:685:         return false;
	xorl	%eax, %eax	# <retval>
.L309:
# sub.c:709: }
	addq	$24, %rsp	#,
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
.L389:
	.cfi_restore_state
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	leaq	-1(%r12,%rax), %r8	#, _41
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	cmpb	$10, (%r8)	#, *_41
	je	.L390	#,
.L318:
# sub.c:682:     if (strlen(result) != strlen(result_gmp))
	movq	%rbp, %rdi	# result,
	call	strlen@PLT	#
# sub.c:682:     if (strlen(result) != strlen(result_gmp))
	cmpq	%r15, %rax	# len, tmp145
	jne	.L319	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	testq	%r15, %r15	# len
	je	.L321	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	xorl	%r14d, %r14d	# i
	andl	$7, %r15d	#, tmp174
	je	.L320	#,
	cmpq	$1, %r15	#, tmp174
	je	.L368	#,
	cmpq	$2, %r15	#, tmp174
	je	.L369	#,
	cmpq	$3, %r15	#, tmp174
	je	.L370	#,
	cmpq	$4, %r15	#, tmp174
	je	.L371	#,
	cmpq	$5, %r15	#, tmp174
	je	.L372	#,
	cmpq	$6, %r15	#, tmp174
	je	.L373	#,
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%r12), %r9d	# MEM[(char *)str_47 + i_57 * 1], tmp204
	movq	%rbp, %rcx	# result, _96
	movq	%r12, %r15	# result_gmp, _93
	cmpb	%r9b, 0(%rbp)	# tmp204, MEM[(char *)str_58 + i_57 * 1]
	jne	.L385	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	movl	$1, %r14d	#, i
.L373:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%r12,%r14), %r10d	# MEM[(char *)str_47 + i_57 * 1], tmp205
	leaq	0(%rbp,%r14), %rcx	#, _96
	leaq	(%r12,%r14), %r15	#, _93
	cmpb	%r10b, 0(%rbp,%r14)	# tmp205, MEM[(char *)str_58 + i_57 * 1]
	jne	.L385	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%r14	# i
.L372:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%r12,%r14), %r11d	# MEM[(char *)str_47 + i_57 * 1], tmp206
	leaq	0(%rbp,%r14), %rcx	#, _96
	leaq	(%r12,%r14), %r15	#, _93
	cmpb	%r11b, 0(%rbp,%r14)	# tmp206, MEM[(char *)str_58 + i_57 * 1]
	jne	.L385	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%r14	# i
.L371:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%r12,%r14), %edx	# MEM[(char *)str_47 + i_57 * 1], tmp207
	leaq	0(%rbp,%r14), %rcx	#, _96
	leaq	(%r12,%r14), %r15	#, _93
	cmpb	%dl, 0(%rbp,%r14)	# tmp207, MEM[(char *)str_58 + i_57 * 1]
	jne	.L385	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%r14	# i
.L370:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%r12,%r14), %esi	# MEM[(char *)str_47 + i_57 * 1], tmp208
	leaq	0(%rbp,%r14), %rcx	#, _96
	leaq	(%r12,%r14), %r15	#, _93
	cmpb	%sil, 0(%rbp,%r14)	# tmp208, MEM[(char *)str_58 + i_57 * 1]
	jne	.L385	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%r14	# i
.L369:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%r12,%r14), %edi	# MEM[(char *)str_47 + i_57 * 1], tmp209
	leaq	0(%rbp,%r14), %rcx	#, _96
	leaq	(%r12,%r14), %r15	#, _93
	cmpb	%dil, 0(%rbp,%r14)	# tmp209, MEM[(char *)str_58 + i_57 * 1]
	jne	.L385	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%r14	# i
.L368:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%r12,%r14), %r8d	# MEM[(char *)str_47 + i_57 * 1], tmp210
	leaq	0(%rbp,%r14), %rcx	#, _96
	leaq	(%r12,%r14), %r15	#, _93
	cmpb	%r8b, 0(%rbp,%r14)	# tmp210, MEM[(char *)str_58 + i_57 * 1]
	jne	.L385	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%r14	# i
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	cmpq	%r14, %rax	# i, tmp145
	je	.L321	#,
.L320:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%r12,%r14), %r9d	# MEM[(char *)str_47 + i_57 * 1], tmp202
	leaq	0(%rbp,%r14), %rcx	#, _96
	leaq	(%r12,%r14), %r15	#, _93
	cmpb	%r9b, 0(%rbp,%r14)	# tmp202, MEM[(char *)str_58 + i_57 * 1]
	jne	.L385	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	1(%r14), %r10	#, tmp175
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%r12,%r10), %r11d	# MEM[(char *)str_47 + i_57 * 1], tmp203
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	movq	%r10, %r14	# tmp175, i
	leaq	0(%rbp,%r10), %rcx	#, _96
	leaq	(%r12,%r10), %r15	#, _93
# sub.c:691:         if (result[i] != result_gmp[i])
	cmpb	%r11b, 0(%rbp,%r10)	# tmp203, MEM[(char *)str_58 + i_57 * 1]
	jne	.L385	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%r14	# i
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%r12,%r14), %edx	# MEM[(char *)str_47 + i_57 * 1], tmp211
	leaq	0(%rbp,%r14), %rcx	#, _96
	leaq	(%r12,%r14), %r15	#, _93
	cmpb	%dl, 0(%rbp,%r14)	# tmp211, MEM[(char *)str_58 + i_57 * 1]
	jne	.L385	#,
	movzbl	2(%r12,%r10), %esi	# MEM[(char *)str_47 + i_57 * 1], tmp212
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	2(%r10), %r14	#, i
	leaq	0(%rbp,%r14), %rcx	#, _96
	leaq	(%r12,%r14), %r15	#, _93
# sub.c:691:         if (result[i] != result_gmp[i])
	cmpb	%sil, 2(%rbp,%r10)	# tmp212, MEM[(char *)str_58 + i_57 * 1]
	jne	.L385	#,
	movzbl	3(%r12,%r10), %edi	# MEM[(char *)str_47 + i_57 * 1], tmp213
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	3(%r10), %r14	#, i
	leaq	0(%rbp,%r14), %rcx	#, _96
	leaq	(%r12,%r14), %r15	#, _93
# sub.c:691:         if (result[i] != result_gmp[i])
	cmpb	%dil, 3(%rbp,%r10)	# tmp213, MEM[(char *)str_58 + i_57 * 1]
	jne	.L385	#,
	movzbl	4(%r12,%r10), %r8d	# MEM[(char *)str_47 + i_57 * 1], tmp214
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	4(%r10), %r14	#, i
	leaq	0(%rbp,%r14), %rcx	#, _96
	leaq	(%r12,%r14), %r15	#, _93
# sub.c:691:         if (result[i] != result_gmp[i])
	cmpb	%r8b, 4(%rbp,%r10)	# tmp214, MEM[(char *)str_58 + i_57 * 1]
	jne	.L385	#,
	movzbl	5(%r12,%r10), %r9d	# MEM[(char *)str_47 + i_57 * 1], tmp215
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	5(%r10), %r14	#, i
	leaq	0(%rbp,%r14), %rcx	#, _96
	leaq	(%r12,%r14), %r15	#, _93
# sub.c:691:         if (result[i] != result_gmp[i])
	cmpb	%r9b, 5(%rbp,%r10)	# tmp215, MEM[(char *)str_58 + i_57 * 1]
	jne	.L385	#,
	movzbl	6(%r12,%r10), %r11d	# MEM[(char *)str_47 + i_57 * 1], tmp216
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	6(%r10), %r14	#, i
	leaq	0(%rbp,%r14), %rcx	#, _96
	leaq	(%r12,%r14), %r15	#, _93
# sub.c:691:         if (result[i] != result_gmp[i])
	cmpb	%r11b, 6(%rbp,%r10)	# tmp216, MEM[(char *)str_58 + i_57 * 1]
	jne	.L385	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	7(%r10), %r14	#, i
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	cmpq	%r14, %rax	# i, tmp145
	jne	.L320	#,
.L321:
# sub.c:664:     bool result_negative = (result[0] == '-');
	cmpb	$45, %bl	#, _1
	sete	%bl	#, result_negative
# sub.c:665:     bool result_gmp_negative = (result_gmp[0] == '-');
	cmpb	$45, %r13b	#, _2
	sete	%bpl	#, result_gmp_negative
# sub.c:708:     return true;
	movl	$1, %eax	#, <retval>
# sub.c:702:     if (result_negative != result_gmp_negative)
	cmpb	%bpl, %bl	# result_gmp_negative, result_negative
	je	.L309	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC26(%rip), %rdi	#, tmp159
	call	puts@PLT	#
# sub.c:709: }
	addq	$24, %rsp	#,
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
# sub.c:705:         return false;
	xorl	%eax, %eax	# <retval>
# sub.c:709: }
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L385:
	.cfi_restore_state
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC22(%rip), %rdi	#, tmp149
	movq	%rcx, 8(%rsp)	# _96, %sfp
	call	puts@PLT	#
	movq	%r14, %rdx	# i,
	leaq	.LC23(%rip), %rsi	#, tmp150
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# sub.c:695:             printf("result[%ld] = %c, result_gmp[%ld] = %c\n", i, result[i], i, result_gmp[i]);
	movq	8(%rsp), %r13	# %sfp, _96
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movsbl	(%r15), %r9d	# *_93,
# sub.c:695:             printf("result[%ld] = %c, result_gmp[%ld] = %c\n", i, result[i], i, result_gmp[i]);
	movsbl	0(%r13), %ecx	# *_96, *_96
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	%r14, %r8	# i,
	movq	%r14, %rdx	# i,
	leaq	.LC24(%rip), %rsi	#, tmp153
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	movq	%r12, %rcx	# result_gmp,
	movq	%rbp, %rdx	# result,
	leaq	.LC25(%rip), %rsi	#, tmp154
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# sub.c:709: }
	addq	$24, %rsp	#,
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
# sub.c:697:             return false;
	xorl	%eax, %eax	# <retval>
# sub.c:709: }
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L390:
	.cfi_restore_state
# sub.c:655:         str[len - 1] = '\0';
	movb	$0, (%r8)	#, *_41
# sub.c:682:     if (strlen(result) != strlen(result_gmp))
	movq	%r12, %rdi	# result_gmp,
	call	strlen@PLT	#
	movq	%rax, %r15	# tmp197, len
	jmp	.L318	#
	.p2align 4,,10
	.p2align 3
.L388:
# sub.c:655:         str[len - 1] = '\0';
	movb	$0, (%rdi)	#, *_45
# sub.c:652:     size_t len = strlen(str);
	movq	%r12, %rdi	# result_gmp,
	call	strlen@PLT	#
	movq	%rax, %r15	# tmp196, len
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	testq	%rax, %rax	# len
	je	.L317	#,
	jmp	.L389	#
	.cfi_endproc
.LFE5796:
	.size	check_result, .-check_result
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"Error creating directory %s: %s\n"
	.text
	.p2align 4
	.globl	create_directory
	.type	create_directory, @function
create_directory:
.LFB5797:
	.cfi_startproc
	endbr64	
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12	# tmp100, path
	pushq	%rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 32
# sub.c:714:     char *path_copy = strdup(path);
	call	strdup@PLT	#
# sub.c:715:     char *parent_dir = dirname(path_copy);
	movq	%rax, %rdi	# path_copy,
# sub.c:714:     char *path_copy = strdup(path);
	movq	%rax, %rbp	# tmp101, path_copy
# sub.c:715:     char *parent_dir = dirname(path_copy);
	call	dirname@PLT	#
	movq	%rax, %rdi	# tmp102, parent_dir
# sub.c:718:     if (strcmp(parent_dir, ".") != 0 && strcmp(parent_dir, "/") != 0)
	movzbl	(%rax), %eax	# MEM <char[1:2]> [(void *)parent_dir_11], MEM <char[1:2]> [(void *)parent_dir_11]
	cmpl	$46, %eax	#, MEM <char[1:2]> [(void *)parent_dir_11]
	jne	.L396	#,
# sub.c:718:     if (strcmp(parent_dir, ".") != 0 && strcmp(parent_dir, "/") != 0)
	cmpb	$0, 1(%rdi)	#, MEM <char[1:2]> [(void *)parent_dir_11]
	jne	.L396	#,
.L393:
# sub.c:723:     free(path_copy);
	movq	%rbp, %rdi	# path_copy,
	call	free@PLT	#
# sub.c:726:     if (mkdir(path, 0777) && errno != EEXIST)
	movl	$511, %esi	#,
	movq	%r12, %rdi	# path,
	call	mkdir@PLT	#
# sub.c:726:     if (mkdir(path, 0777) && errno != EEXIST)
	testl	%eax, %eax	# tmp103
	je	.L410	#,
# sub.c:726:     if (mkdir(path, 0777) && errno != EEXIST)
	call	__errno_location@PLT	#
	movl	(%rax), %edi	# *_16, _17
# sub.c:726:     if (mkdir(path, 0777) && errno != EEXIST)
	cmpl	$17, %edi	#, _17
	jne	.L412	#,
.L410:
# sub.c:731: }
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L396:
	.cfi_restore_state
# sub.c:718:     if (strcmp(parent_dir, ".") != 0 && strcmp(parent_dir, "/") != 0)
	cmpl	$47, %eax	#, MEM <char[1:2]> [(void *)parent_dir_11]
	je	.L413	#,
.L397:
# sub.c:720:         create_directory(parent_dir);
	call	create_directory	#
	jmp	.L393	#
	.p2align 4,,10
	.p2align 3
.L413:
# sub.c:718:     if (strcmp(parent_dir, ".") != 0 && strcmp(parent_dir, "/") != 0)
	cmpb	$0, 1(%rdi)	#, MEM <char[1:2]> [(void *)parent_dir_11]
	je	.L393	#,
	jmp	.L397	#
.L412:
# sub.c:728:         fprintf(stderr, "Error creating directory %s: %s\n", path, strerror(errno));
	call	strerror@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	# stderr,
# sub.c:728:         fprintf(stderr, "Error creating directory %s: %s\n", path, strerror(errno));
	movq	%rax, %r8	#, tmp105
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rcx	# path,
	leaq	.LC27(%rip), %rdx	#, tmp98
	movl	$1, %esi	#,
	xorl	%eax, %eax	#
	call	__fprintf_chk@PLT	#
# sub.c:729:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
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
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# sub.c:735: {
	movq	%rdi, %rbp	# tmp86, filename
# sub.c:736:     gzFile file = gzopen(filename, mode);
	call	gzopen@PLT	#
# sub.c:737:     if (file == NULL)
	testq	%rax, %rax	# <retval>
	je	.L417	#,
# sub.c:743: }
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L417:
	.cfi_restore_state
	movq	%rbp, %rdi	# filename,
	call	open_gzfile.part.0	#
	.cfi_endproc
.LFE5798:
	.size	open_gzfile, .-open_gzfile
	.p2align 4
	.globl	skip_first_line
	.type	skip_first_line, @function
skip_first_line:
.LFB5799:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	-65536(%rsp), %r11	#,
	.cfi_def_cfa 11, 65552
.LPSRL0:
	subq	$4096, %rsp	#,
	orq	$0, (%rsp)	#,
	cmpq	%r11, %rsp	#,
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$16, %rsp	#,
	.cfi_def_cfa_offset 65568
# sub.c:748:     if (gzgets(file, buffer, sizeof(buffer)) == NULL)
	movl	$65536, %edx	#,
	movq	%rsp, %rsi	#, tmp85
# sub.c:746: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp89
	movq	%rax, 65544(%rsp)	# tmp89, D.40915
	xorl	%eax, %eax	# tmp89
	movq	%rdi, %rbp	# tmp87, file
# sub.c:748:     if (gzgets(file, buffer, sizeof(buffer)) == NULL)
	call	gzgets@PLT	#
# sub.c:748:     if (gzgets(file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp88
	je	.L423	#,
# sub.c:754: }
	movq	65544(%rsp), %rax	# D.40915, tmp90
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp90
	jne	.L424	#,
	addq	$65552, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbp	#
	.cfi_def_cfa_offset 8
	ret	
.L423:
	.cfi_restore_state
	movq	%rbp, %rdi	# file,
	call	skip_first_line.part.0	#
.L424:
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE5799:
	.size	skip_first_line, .-skip_first_line
	.section	.rodata.str1.1
.LC28:
	.string	"Running correctness test"
	.section	.rodata.str1.8
	.align 8
.LC29:
	.string	"Running random test cases for bit-size %d on core %d\n"
	.align 8
.LC30:
	.string	"../test/cases/%d/random.csv.gz"
	.align 8
.LC31:
	.string	"Running equal test cases for bit-size %d on core %d\n"
	.section	.rodata.str1.1
.LC32:
	.string	"../test/cases/%d/equal.csv.gz"
	.section	.rodata.str1.8
	.align 8
.LC33:
	.string	"Running greater test cases for bit-size %d on core %d\n"
	.align 8
.LC34:
	.string	"../test/cases/%d/greater.csv.gz"
	.align 8
.LC35:
	.string	"Running smaller test cases for bit-size %d on core %d\n"
	.align 8
.LC36:
	.string	"../test/cases/%d/smaller.csv.gz"
	.section	.rodata.str1.1
.LC37:
	.string	"Invalid test case"
.LC38:
	.string	"rb"
.LC39:
	.string	"Error reading line"
.LC40:
	.string	","
.LC41:
	.string	"Error parsing line: %s\n"
	.section	.rodata.str1.8
	.align 8
.LC42:
	.string	"Test case failed, at iteration %d\n"
	.align 8
.LC43:
	.string	"a = %s, b = %s\n Expected result = %s\n"
	.section	.rodata.str1.1
.LC44:
	.string	"Experimental result = %s\n"
	.section	.rodata.str1.8
	.align 8
.LC45:
	.string	"Passed random test cases for bit-size %d\n"
	.align 8
.LC46:
	.string	"Passed equal test cases for bit-size %d\n"
	.align 8
.LC47:
	.string	"Passed greater test cases for bit-size %d\n"
	.align 8
.LC48:
	.string	"Passed smaller test cases for bit-size %d\n"
	.section	.rodata.str1.1
.LC49:
	.string	"Memory leak detected"
.LC50:
	.string	"Error closing test file"
	.text
	.p2align 4
	.globl	run_correctness_test
	.type	run_correctness_test, @function
run_correctness_test:
.LFB5800:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	andq	$-64, %rsp	#,
	leaq	-65536(%rsp), %r11	#,
.LPSRL1:
	subq	$4096, %rsp	#,
	orq	$0, (%rsp)	#,
	cmpq	%r11, %rsp	#,
	jne	.LPSRL1
	subq	$384, %rsp	#,
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
# sub.c:837: {
	movl	%edi, 64(%rsp)	# test_case, %sfp
	movl	%edi, %ebx	# tmp570, test_case
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC28(%rip), %rdi	#, tmp226
# sub.c:837: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp597
	movq	%rax, 65912(%rsp)	# tmp597, D.40974
	xorl	%eax, %eax	# tmp597
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	puts@PLT	#
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	sub_space(%rip), %rdi	# sub_space,
	movl	$1073741824, %edx	#,
	xorl	%esi, %esi	#
	call	memset@PLT	#
	movq	borrow_space(%rip), %rdi	# borrow_space,
	movl	$1073741824, %edx	#,
	xorl	%esi, %esi	#
# sub.c:843:     sub_space_ptr = 0;
	movl	$0, sub_space_ptr(%rip)	#, sub_space_ptr
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	call	memset@PLT	#
# sub.c:846:     borrow_space_ptr = 0;
	movl	$0, borrow_space_ptr(%rip)	#, borrow_space_ptr
# sub.c:850:     switch (test_case)
	cmpl	$2, %ebx	#, test_case
	je	.L426	#,
	jg	.L427	#,
	testl	%ebx, %ebx	# test_case
	je	.L428	#,
	cmpl	$1, %ebx	#, test_case
	jne	.L430	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC31(%rip), %rsi	#, tmp244
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	256(%rsp), %r12	#, tmp385
	leaq	.LC32(%rip), %r8	#,
.L687:
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp385,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
# sub.c:736:     gzFile file = gzopen(filename, mode);
	leaq	.LC38(%rip), %rsi	#, tmp259
	movq	%r12, %rdi	# tmp385,
	call	gzopen@PLT	#
	movq	%rax, 88(%rsp)	# file, %sfp
# sub.c:737:     if (file == NULL)
	testq	%rax, %rax	# file
	je	.L688	#,
# sub.c:748:     if (gzgets(file, buffer, sizeof(buffer)) == NULL)
	leaq	368(%rsp), %rsi	#, tmp384
	movq	%rax, %rdi	# file,
	movl	$65536, %edx	#,
	movq	%rsi, 104(%rsp)	# tmp384, %sfp
	call	gzgets@PLT	#
# sub.c:748:     if (gzgets(file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp572
	je	.L689	#,
# sub.c:880:     for (int i = 0; i < ITERATIONS; i++)
	movl	$0, 68(%rsp)	#, %sfp
.L460:
# sub.c:885:         if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	movq	104(%rsp), %rsi	# %sfp,
	movq	88(%rsp), %rdi	# %sfp,
	movl	$65536, %edx	#,
	call	gzgets@PLT	#
# sub.c:885:         if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp573
	je	.L690	#,
# sub.c:900:         char *a_str = strtok(buffer, ",");
	movq	104(%rsp), %rdi	# %sfp,
	leaq	.LC40(%rip), %rsi	#,
	call	strtok@PLT	#
# sub.c:901:         char *b_str = strtok(NULL, ",");
	xorl	%edi, %edi	#
	leaq	.LC40(%rip), %rsi	#,
# sub.c:900:         char *a_str = strtok(buffer, ",");
	movq	%rax, %r14	# tmp575, a_str
# sub.c:901:         char *b_str = strtok(NULL, ",");
	call	strtok@PLT	#
# sub.c:902:         char *result_str = strtok(NULL, ",");
	xorl	%edi, %edi	#
	leaq	.LC40(%rip), %rsi	#,
# sub.c:901:         char *b_str = strtok(NULL, ",");
	movq	%rax, %r15	# tmp576, b_str
# sub.c:902:         char *result_str = strtok(NULL, ",");
	call	strtok@PLT	#
# sub.c:904:         if (a_str == NULL || b_str == NULL || result_str == NULL)
	testq	%r14, %r14	# a_str
# sub.c:902:         char *result_str = strtok(NULL, ",");
	movq	%rax, 96(%rsp)	# result_str, %sfp
	movq	%rax, %rcx	# tmp577, result_str
# sub.c:904:         if (a_str == NULL || b_str == NULL || result_str == NULL)
	sete	%al	#, tmp269
# sub.c:904:         if (a_str == NULL || b_str == NULL || result_str == NULL)
	testq	%r15, %r15	# b_str
	sete	%dl	#, tmp271
# sub.c:904:         if (a_str == NULL || b_str == NULL || result_str == NULL)
	orb	%dl, %al	# tmp271, tmp598
	jne	.L477	#,
	testq	%rcx, %rcx	# result_str
	je	.L477	#,
# sub.c:912:         int n_1 = strlen(a_str);
	movq	%r14, %rdi	# a_str,
	call	strlen@PLT	#
# sub.c:913:         int n_2 = strlen(b_str);
	movq	%r15, %rdi	# b_str,
# sub.c:912:         int n_1 = strlen(a_str);
	movl	%eax, 120(%rsp)	# tmp578, n_1
# sub.c:913:         int n_2 = strlen(b_str);
	call	strlen@PLT	#
# sub.c:917:         limb_set_str(a_str, b_str, &a, &b, &n_1, &n_2);
	leaq	192(%rsp), %rcx	#, tmp286
	leaq	128(%rsp), %rdx	#, tmp287
	leaq	124(%rsp), %r9	#,
	leaq	120(%rsp), %r8	#,
	movq	%r15, %rsi	# b_str,
	movq	%r14, %rdi	# a_str,
# sub.c:913:         int n_2 = strlen(b_str);
	movl	%eax, 124(%rsp)	# tmp579, n_2
# sub.c:917:         limb_set_str(a_str, b_str, &a, &b, &n_1, &n_2);
	call	limb_set_str	#
# sub.c:918:         int n = n_1;
	movslq	120(%rsp), %rbx	# n_1,
# sub.c:921:         aligned_uint64_ptr sub = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %r8	# sub_space_ptr,
	movq	sub_space(%rip), %r10	# sub_space, sub_space
# sub.c:918:         int n = n_1;
	movq	%rbx, %rdi	#,
# sub.c:923:         sub_space_ptr += (n + 31) & ~31;
	addl	$31, %edi	#, tmp291
# sub.c:921:         aligned_uint64_ptr sub = sub_space + sub_space_ptr;
	movq	%r8, %r9	#,
	leaq	(%r10,%r8,8), %r12	#, _29
# sub.c:923:         sub_space_ptr += (n + 31) & ~31;
	andl	$-32, %edi	#, _32
# sub.c:926:         memset(sub, 0, n * sizeof(uint64_t));
	leaq	0(,%rbx,8), %r13	#, _40
# sub.c:923:         sub_space_ptr += (n + 31) & ~31;
	addl	%edi, %r9d	# _32, tmp292
# sub.c:924:         borrow_space_ptr += (n + 31) & ~31;
	addl	%edi, borrow_space_ptr(%rip)	# _32, borrow_space_ptr
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	%r13, %rdx	# _40,
	xorl	%esi, %esi	#
	movq	%r12, %rdi	# _29,
# sub.c:923:         sub_space_ptr += (n + 31) & ~31;
	movl	%r9d, sub_space_ptr(%rip)	# tmp292, sub_space_ptr
# sub.c:922:         size_t sub_size = n;
	movq	%rbx, 248(%rsp)	# _30, sub_size
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	call	memset@PLT	#
	movq	borrow_space(%rip), %rdi	# borrow_space,
	movq	%r13, %rdx	# _40,
	xorl	%esi, %esi	#
	call	memset@PLT	#
# sub.c:931:         bool sign = limb_sub_n(a, b, &sub, n);
	movq	192(%rsp), %r11	# b, b.39_46
	movq	128(%rsp), %rcx	# a, a.40_47
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %rsi	# sub_space_ptr, sub_space_ptr
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %rax	# sub_space, sub_space
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r11), %rdx	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp666
	leaq	-1(%rbx), %r8	#, tmp414
# sub.c:931:         bool sign = limb_sub_n(a, b, &sub, n);
	movq	%r11, 80(%rsp)	# b.39_46, %sfp
	movq	%rcx, 72(%rsp)	# a.40_47, %sfp
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%rax,%rsi,8), %rdi	#, sub
	andl	$7, %r8d	#, tmp416
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%rdx, (%rcx)	# tmp666, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	jbe	.L691	#,
.L471:
	movq	80(%rsp), %r12	# %sfp, b
	movq	72(%rsp), %rcx	# %sfp, a
	xorl	%r8d, %r8d	# prephitmp_362
.L439:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rcx), %zmm6	# MEM[(__m512i * {ref-all})a_177 + i_175 * 8], tmp669
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %rsi	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r12), %zmm6, %zmm0	# MEM[(__m512i * {ref-all})b_180 + i_175 * 8], tmp669, tmp309
	leaq	-1(%rbx), %r9	#, tmp410
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k1	#, zeros, tmp309, tmp311
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm0, %zmm1	# tmp309, tmp309
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %rsi	# borrow_space, ivtmp.430
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm0, %zmm1{%k1}	# limb_digits, tmp309, tmp309, tmp311, tmp309
	shrq	$3, %r9	#, tmp408
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rdi)	# tmp315, MEM[(__m512i * {ref-all})result_154 + i_175 * 8]
	andl	$3, %r9d	#, tmp411
# sub.c:217:         i += 8;
	movl	$8, %r13d	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%rsi), %r11	#, ivtmp.439
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, (%rsi)	# tmp311, MEM[(__mmask8 *)_214]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %rbx	#, _30
	jbe	.L633	#,
	testq	%r9, %r9	# tmp411
	je	.L442	#,
	cmpq	$1, %r9	#, tmp411
	je	.L589	#,
	cmpq	$2, %r9	#, tmp411
	jne	.L692	#,
.L590:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rcx,%r13,8), %zmm4	# MEM[(__m512i * {ref-all})a_177 + i_175 * 8], tmp718
# sub.c:219:     } while (likely(i < n));
	incq	%r11	# ivtmp.439
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r12,%r13,8), %zmm4, %zmm5	# MEM[(__m512i * {ref-all})b_180 + i_175 * 8], tmp718, tmp527
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k3	#, zeros, tmp527, tmp529
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm5, %zmm8	# tmp527, tmp527
	vpaddq	limb_digits(%rip), %zmm5, %zmm8{%k3}	# limb_digits, tmp527, tmp527, tmp529, tmp527
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rdi,%r13,8)	# tmp531, MEM[(__m512i * {ref-all})result_154 + i_175 * 8]
# sub.c:217:         i += 8;
	addq	$8, %r13	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, -1(%r11)	# tmp529, MEM[(__mmask8 *)_214]
.L589:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rcx,%r13,8), %zmm9	# MEM[(__m512i * {ref-all})a_177 + i_175 * 8], tmp720
# sub.c:219:     } while (likely(i < n));
	incq	%r11	# ivtmp.439
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r12,%r13,8), %zmm9, %zmm10	# MEM[(__m512i * {ref-all})b_180 + i_175 * 8], tmp720, tmp533
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k4	#, zeros, tmp533, tmp535
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm10, %zmm11	# tmp533, tmp533
	vpaddq	limb_digits(%rip), %zmm10, %zmm11{%k4}	# limb_digits, tmp533, tmp533, tmp535, tmp533
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rdi,%r13,8)	# tmp537, MEM[(__m512i * {ref-all})result_154 + i_175 * 8]
# sub.c:217:         i += 8;
	addq	$8, %r13	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, -1(%r11)	# tmp535, MEM[(__mmask8 *)_214]
# sub.c:219:     } while (likely(i < n));
	cmpq	%r13, %rbx	# i, _30
	jbe	.L633	#,
.L442:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rcx,%r13,8), %zmm12	# MEM[(__m512i * {ref-all})a_177 + i_175 * 8], tmp671
# sub.c:217:         i += 8;
	leaq	8(%r13), %r10	#, tmp412
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r12,%r13,8), %zmm12, %zmm13	# MEM[(__m512i * {ref-all})b_180 + i_175 * 8], tmp671, tmp427
# sub.c:217:         i += 8;
	leaq	16(%r13), %rax	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k5	#, zeros, tmp427, tmp429
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm13, %zmm14	# tmp427, tmp427
# sub.c:217:         i += 8;
	leaq	24(%r13), %rdx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm13, %zmm14{%k5}	# limb_digits, tmp427, tmp427, tmp429, tmp427
# sub.c:219:     } while (likely(i < n));
	addq	$4, %r11	#, ivtmp.439
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rdi,%r13,8)	# tmp431, MEM[(__m512i * {ref-all})result_154 + i_175 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, -4(%r11)	# tmp429, MEM[(__mmask8 *)_214]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rcx,%r10,8), %zmm15	# MEM[(__m512i * {ref-all})a_177 + i_175 * 8], tmp673
# sub.c:217:         i += 8;
	addq	$32, %r13	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r12,%r10,8), %zmm15, %zmm6	# MEM[(__m512i * {ref-all})b_180 + i_175 * 8], tmp673, tmp435
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k6	#, zeros, tmp435, tmp437
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm6, %zmm0	# tmp435, tmp435
	vpaddq	limb_digits(%rip), %zmm6, %zmm0{%k6}	# limb_digits, tmp435, tmp435, tmp437, tmp435
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rdi,%r10,8)	# tmp439, MEM[(__m512i * {ref-all})result_154 + i_175 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, -3(%r11)	# tmp437, MEM[(__mmask8 *)_214]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rcx,%rax,8), %zmm1	# MEM[(__m512i * {ref-all})a_177 + i_175 * 8], tmp675
	vpsubq	(%r12,%rax,8), %zmm1, %zmm7	# MEM[(__m512i * {ref-all})b_180 + i_175 * 8], tmp675, tmp443
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm7, %k7	#, zeros, tmp443, tmp445
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm7, %zmm2	# tmp443, tmp443
	vpaddq	limb_digits(%rip), %zmm7, %zmm2{%k7}	# limb_digits, tmp443, tmp443, tmp445, tmp443
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, (%rdi,%rax,8)	# tmp447, MEM[(__m512i * {ref-all})result_154 + i_175 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, -2(%r11)	# tmp445, MEM[(__mmask8 *)_214]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rcx,%rdx,8), %zmm3	# MEM[(__m512i * {ref-all})a_177 + i_175 * 8], tmp677
	vpsubq	(%r12,%rdx,8), %zmm3, %zmm4	# MEM[(__m512i * {ref-all})b_180 + i_175 * 8], tmp677, tmp451
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm4, %k1	#, zeros, tmp451, tmp453
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm4, %zmm5	# tmp451, tmp451
	vpaddq	limb_digits(%rip), %zmm4, %zmm5{%k1}	# limb_digits, tmp451, tmp451, tmp453, tmp451
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, (%rdi,%rdx,8)	# tmp455, MEM[(__m512i * {ref-all})result_154 + i_175 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, -1(%r11)	# tmp453, MEM[(__mmask8 *)_214]
# sub.c:219:     } while (likely(i < n));
	cmpq	%r13, %rbx	# i, _30
	ja	.L442	#,
.L633:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm8	# zeros, tmp679
	leaq	-1(%rbx), %r12	#, tmp404
	vmovdqu64	%zmm8, (%rdi,%rbx,8)	# tmp679, MEM[(__m512i_u * {ref-all})_202]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdi), %zmm9	# MEM[(__m512i * {ref-all})result_154 + i_343 * 8], _339
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %ecx	# MEM[(__mmask8 *)_210], MEM[(__mmask8 *)_210]
	shrq	$3, %r12	#, tmp402
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k2	# MEM[(__mmask8 *)_210], tmp680
	vpsubq	ones(%rip), %zmm9, %zmm9{%k2}	# ones, _339, tmp321, tmp680, _339
	andl	$3, %r12d	#, tmp405
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rdi)	# tmp321, MEM[(__m512i * {ref-all})result_154 + i_343 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k0	#, zeros, tmp321, tmp327
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp327
	jne	.L693	#,
.L530:
# sub.c:249:         i += 8;
	movl	$8, %r9d	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rsi), %rdx	#, ivtmp.430
	cmpq	$8, %rbx	#, _30
	jbe	.L684	#,
	testq	%r12, %r12	# tmp405
	je	.L444	#,
	cmpq	$1, %r12	#, tmp405
	je	.L587	#,
	cmpq	$2, %r12	#, tmp405
	jne	.L694	#,
.L588:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdi,%r9,8), %zmm11	# MEM[(__m512i * {ref-all})result_154 + i_343 * 8], _339
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rdx), %r11d	# MEM[(__mmask8 *)_210], MEM[(__mmask8 *)_210]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r11d, %k5	# MEM[(__mmask8 *)_210], tmp712
	vpsubq	ones(%rip), %zmm11, %zmm11{%k5}	# ones, _339, tmp495, tmp712, _339
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rdi,%r9,8)	# tmp495, MEM[(__m512i * {ref-all})result_154 + i_343 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm11, %k6	#, zeros, tmp495, tmp497
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k6, %k6	# tmp497
	jne	.L695	#,
.L535:
# sub.c:249:         i += 8;
	addq	$8, %r9	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rdx	# ivtmp.430
.L587:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdi,%r9,8), %zmm12	# MEM[(__m512i * {ref-all})result_154 + i_343 * 8], _339
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rdx), %esi	# MEM[(__mmask8 *)_210], MEM[(__mmask8 *)_210]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k7	# MEM[(__mmask8 *)_210], tmp713
	vpsubq	ones(%rip), %zmm12, %zmm12{%k7}	# ones, _339, tmp501, tmp713, _339
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm12, (%rdi,%r9,8)	# tmp501, MEM[(__m512i * {ref-all})result_154 + i_343 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k1	#, zeros, tmp501, tmp503
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k1, %k1	# tmp503
	jne	.L696	#,
.L538:
# sub.c:249:         i += 8;
	addq	$8, %r9	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rdx	# ivtmp.430
	cmpq	%r9, %rbx	# i, _30
	ja	.L444	#,
	.p2align 4,,10
	.p2align 3
.L684:
	vzeroupper
.L440:
# sub.c:936:         char *sub_str = limb_get_str(sub, &sub_size, sign);
	movl	%r8d, %edx	# prephitmp_362,
	leaq	248(%rsp), %rsi	#, tmp331
	call	limb_get_str	#
# sub.c:665:     bool result_gmp_negative = (result_gmp[0] == '-');
	movq	96(%rsp), %rdi	# %sfp, result_str
# sub.c:664:     bool result_negative = (result[0] == '-');
	movzbl	(%rax), %ebx	# *sub_str_90, _124
# sub.c:665:     bool result_gmp_negative = (result_gmp[0] == '-');
	movzbl	(%rdi), %r8d	# *result_str_81, _126
# sub.c:669:         result++;
	xorl	%r9d, %r9d	# tmp387
	cmpb	$45, %bl	#, _124
	sete	%r9b	#, tmp387
# sub.c:671:         result_gmp++;
	cmpb	$45, %r8b	#, _126
	sete	%sil	#, tmp391
	movzbl	%sil, %r10d	# tmp391, tmp391
# sub.c:664:     bool result_negative = (result[0] == '-');
	movb	%bl, 63(%rsp)	# _124, %sfp
# sub.c:665:     bool result_gmp_negative = (result_gmp[0] == '-');
	movb	%r8b, 62(%rsp)	# _126, %sfp
# sub.c:671:         result_gmp++;
	leaq	(%rdi,%r10), %rbx	#, result_gmp
# sub.c:936:         char *sub_str = limb_get_str(sub, &sub_size, sign);
	movq	%rax, %r12	# tmp580, sub_str
# sub.c:669:         result++;
	leaq	(%rax,%r9), %r13	#, result
# sub.c:642:     while (*str == '0' || isspace(*str))
	call	__ctype_b_loc@PLT	#
	movq	(%rax), %r10	# *_391, pretmp_393
	jmp	.L447	#
	.p2align 4,,10
	.p2align 3
.L448:
# sub.c:644:         str++;
	incq	%r13	# result
.L447:
# sub.c:642:     while (*str == '0' || isspace(*str))
	movsbq	0(%r13), %rax	# MEM[(char *)str_299],
# sub.c:642:     while (*str == '0' || isspace(*str))
	cmpb	$48, %al	#, _301
	je	.L448	#,
	testb	$32, 1(%r10,%rax,2)	#, *_306
	jne	.L448	#,
# sub.c:642:     while (*str == '0' || isspace(*str))
	movsbq	(%rbx), %rcx	# MEM[(char *)str_288],
# sub.c:642:     while (*str == '0' || isspace(*str))
	cmpb	$48, %cl	#, _290
	jne	.L697	#,
	.p2align 4,,10
	.p2align 3
.L450:
# sub.c:642:     while (*str == '0' || isspace(*str))
	movsbq	1(%rbx), %rcx	# MEM[(char *)str_288],
# sub.c:644:         str++;
	incq	%rbx	# result_gmp
# sub.c:642:     while (*str == '0' || isspace(*str))
	cmpb	$48, %cl	#, _290
	je	.L450	#,
.L697:
	testb	$32, 1(%r10,%rcx,2)	#, *_295
	jne	.L450	#,
# sub.c:652:     size_t len = strlen(str);
	movq	%r13, %rdi	# result,
	call	strlen@PLT	#
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	testq	%rax, %rax	# tmp339
	je	.L451	#,
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	leaq	-1(%r13,%rax), %r11	#, _286
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	cmpb	$10, (%r11)	#, *_286
	jne	.L451	#,
# sub.c:655:         str[len - 1] = '\0';
	movb	$0, (%r11)	#, *_286
	.p2align 4,,10
	.p2align 3
.L451:
# sub.c:652:     size_t len = strlen(str);
	movq	%rbx, %rdi	# result_gmp,
	call	strlen@PLT	#
	movq	%rax, %rdi	# tmp583, len
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	testq	%rax, %rax	# len
	je	.L452	#,
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	leaq	-1(%rbx,%rax), %rdx	#, _282
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	cmpb	$10, (%rdx)	#, *_282
	jne	.L453	#,
# sub.c:655:         str[len - 1] = '\0';
	movb	$0, (%rdx)	#, *_282
# sub.c:682:     if (strlen(result) != strlen(result_gmp))
	movq	%rbx, %rdi	# result_gmp,
	call	strlen@PLT	#
	movq	%rax, %rdi	# tmp584, len
.L453:
	movq	%rdi, 48(%rsp)	# len, %sfp
# sub.c:682:     if (strlen(result) != strlen(result_gmp))
	movq	%r13, %rdi	# result,
	call	strlen@PLT	#
# sub.c:682:     if (strlen(result) != strlen(result_gmp))
	movq	48(%rsp), %r8	# %sfp, len
	cmpq	%r8, %rax	# len, tmp350
	jne	.L454	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	testq	%r8, %r8	# len
	je	.L456	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	xorl	%edx, %edx	# i
	andl	$7, %r8d	#, tmp400
	je	.L455	#,
	cmpq	$1, %r8	#, tmp400
	je	.L580	#,
	cmpq	$2, %r8	#, tmp400
	je	.L581	#,
	cmpq	$3, %r8	#, tmp400
	je	.L582	#,
	cmpq	$4, %r8	#, tmp400
	je	.L583	#,
	cmpq	$5, %r8	#, tmp400
	je	.L584	#,
	cmpq	$6, %r8	#, tmp400
	je	.L585	#,
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx), %r9d	# MEM[(char *)str_288 + i_298 * 1], tmp698
	movq	%r13, %rcx	# result, _203
	movq	%rbx, %r8	# result_gmp, _205
	cmpb	%r9b, 0(%r13)	# tmp698, MEM[(char *)str_299 + i_298 * 1]
	jne	.L637	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	movl	$1, %edx	#, i
.L585:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx,%rdx), %esi	# MEM[(char *)str_288 + i_298 * 1], tmp699
	leaq	0(%r13,%rdx), %rcx	#, _203
	leaq	(%rbx,%rdx), %r8	#, _205
	cmpb	%sil, 0(%r13,%rdx)	# tmp699, MEM[(char *)str_299 + i_298 * 1]
	jne	.L637	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%rdx	# i
.L584:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx,%rdx), %r10d	# MEM[(char *)str_288 + i_298 * 1], tmp700
	leaq	0(%r13,%rdx), %rcx	#, _203
	leaq	(%rbx,%rdx), %r8	#, _205
	cmpb	%r10b, 0(%r13,%rdx)	# tmp700, MEM[(char *)str_299 + i_298 * 1]
	jne	.L637	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%rdx	# i
.L583:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx,%rdx), %r11d	# MEM[(char *)str_288 + i_298 * 1], tmp701
	leaq	0(%r13,%rdx), %rcx	#, _203
	leaq	(%rbx,%rdx), %r8	#, _205
	cmpb	%r11b, 0(%r13,%rdx)	# tmp701, MEM[(char *)str_299 + i_298 * 1]
	jne	.L637	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%rdx	# i
.L582:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx,%rdx), %edi	# MEM[(char *)str_288 + i_298 * 1], tmp702
	leaq	0(%r13,%rdx), %rcx	#, _203
	leaq	(%rbx,%rdx), %r8	#, _205
	cmpb	%dil, 0(%r13,%rdx)	# tmp702, MEM[(char *)str_299 + i_298 * 1]
	jne	.L637	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%rdx	# i
.L581:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx,%rdx), %r9d	# MEM[(char *)str_288 + i_298 * 1], tmp703
	leaq	0(%r13,%rdx), %rcx	#, _203
	leaq	(%rbx,%rdx), %r8	#, _205
	cmpb	%r9b, 0(%r13,%rdx)	# tmp703, MEM[(char *)str_299 + i_298 * 1]
	jne	.L637	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%rdx	# i
.L580:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx,%rdx), %esi	# MEM[(char *)str_288 + i_298 * 1], tmp704
	leaq	0(%r13,%rdx), %rcx	#, _203
	leaq	(%rbx,%rdx), %r8	#, _205
	cmpb	%sil, 0(%r13,%rdx)	# tmp704, MEM[(char *)str_299 + i_298 * 1]
	jne	.L637	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%rdx	# i
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	cmpq	%rdx, %rax	# i, tmp350
	je	.L456	#,
.L455:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx,%rdx), %r10d	# MEM[(char *)str_288 + i_298 * 1], tmp689
	leaq	0(%r13,%rdx), %rcx	#, _203
	leaq	(%rbx,%rdx), %r8	#, _205
	cmpb	%r10b, 0(%r13,%rdx)	# tmp689, MEM[(char *)str_299 + i_298 * 1]
	jne	.L637	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	1(%rdx), %r11	#, tmp401
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx,%r11), %edi	# MEM[(char *)str_288 + i_298 * 1], tmp690
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	movq	%r11, %rdx	# tmp401, i
	leaq	0(%r13,%r11), %rcx	#, _203
	leaq	(%rbx,%r11), %r8	#, _205
# sub.c:691:         if (result[i] != result_gmp[i])
	cmpb	%dil, 0(%r13,%r11)	# tmp690, MEM[(char *)str_299 + i_298 * 1]
	jne	.L637	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%rdx	# i
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx,%rdx), %r9d	# MEM[(char *)str_288 + i_298 * 1], tmp705
	leaq	0(%r13,%rdx), %rcx	#, _203
	leaq	(%rbx,%rdx), %r8	#, _205
	cmpb	%r9b, 0(%r13,%rdx)	# tmp705, MEM[(char *)str_299 + i_298 * 1]
	jne	.L637	#,
	movzbl	2(%rbx,%r11), %esi	# MEM[(char *)str_288 + i_298 * 1], tmp706
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	2(%r11), %rdx	#, i
	leaq	0(%r13,%rdx), %rcx	#, _203
	leaq	(%rbx,%rdx), %r8	#, _205
# sub.c:691:         if (result[i] != result_gmp[i])
	cmpb	%sil, 2(%r13,%r11)	# tmp706, MEM[(char *)str_299 + i_298 * 1]
	jne	.L637	#,
	movzbl	3(%rbx,%r11), %r10d	# MEM[(char *)str_288 + i_298 * 1], tmp707
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	3(%r11), %rdx	#, i
	leaq	0(%r13,%rdx), %rcx	#, _203
	leaq	(%rbx,%rdx), %r8	#, _205
# sub.c:691:         if (result[i] != result_gmp[i])
	cmpb	%r10b, 3(%r13,%r11)	# tmp707, MEM[(char *)str_299 + i_298 * 1]
	jne	.L637	#,
	movzbl	4(%rbx,%r11), %edi	# MEM[(char *)str_288 + i_298 * 1], tmp708
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	4(%r11), %rdx	#, i
	leaq	0(%r13,%rdx), %rcx	#, _203
	leaq	(%rbx,%rdx), %r8	#, _205
# sub.c:691:         if (result[i] != result_gmp[i])
	cmpb	%dil, 4(%r13,%r11)	# tmp708, MEM[(char *)str_299 + i_298 * 1]
	jne	.L637	#,
	movzbl	5(%rbx,%r11), %r9d	# MEM[(char *)str_288 + i_298 * 1], tmp709
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	5(%r11), %rdx	#, i
	leaq	0(%r13,%rdx), %rcx	#, _203
	leaq	(%rbx,%rdx), %r8	#, _205
# sub.c:691:         if (result[i] != result_gmp[i])
	cmpb	%r9b, 5(%r13,%r11)	# tmp709, MEM[(char *)str_299 + i_298 * 1]
	jne	.L637	#,
	movzbl	6(%rbx,%r11), %esi	# MEM[(char *)str_288 + i_298 * 1], tmp710
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	6(%r11), %rdx	#, i
	leaq	0(%r13,%rdx), %rcx	#, _203
	leaq	(%rbx,%rdx), %r8	#, _205
# sub.c:691:         if (result[i] != result_gmp[i])
	cmpb	%sil, 6(%r13,%r11)	# tmp710, MEM[(char *)str_299 + i_298 * 1]
	jne	.L637	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	7(%r11), %rdx	#, i
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	cmpq	%rdx, %rax	# i, tmp350
	jne	.L455	#,
.L456:
# sub.c:664:     bool result_negative = (result[0] == '-');
	cmpb	$45, 63(%rsp)	#, %sfp
	sete	%r13b	#, result_negative
# sub.c:665:     bool result_gmp_negative = (result_gmp[0] == '-');
	cmpb	$45, 62(%rsp)	#, %sfp
	sete	%bl	#, result_gmp_negative
# sub.c:702:     if (result_negative != result_gmp_negative)
	cmpb	%bl, %r13b	# result_gmp_negative, result_negative
	jne	.L698	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:54:   free (__ptr);
	movq	72(%rsp), %rdi	# %sfp,
	call	free@PLT	#
	movq	80(%rsp), %rdi	# %sfp,
	call	free@PLT	#
# sub.c:949:         free(sub_str);
	movq	%r12, %rdi	# sub_str,
	call	free@PLT	#
# sub.c:880:     for (int i = 0; i < ITERATIONS; i++)
	incl	68(%rsp)	# %sfp
	movl	68(%rsp), %r14d	# %sfp, i
# sub.c:880:     for (int i = 0; i < ITERATIONS; i++)
	cmpl	$100000, %r14d	#, i
	jne	.L460	#,
.L461:
# sub.c:952:     switch (test_case)
	movl	64(%rsp), %edi	# %sfp, test_case
# sub.c:955:         printf("Passed random test cases for bit-size %d\n", NUM_BITS);
	movl	NUM_BITS(%rip), %edx	# NUM_BITS, pretmp_395
# sub.c:952:     switch (test_case)
	cmpl	$2, %edi	#, test_case
	je	.L462	#,
	cmpl	$3, %edi	#, test_case
	je	.L463	#,
	cmpl	$1, %edi	#, test_case
	je	.L464	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC45(%rip), %rsi	#, tmp368
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
.L465:
# sub.c:967:     if (sub_space_ptr > (1 << 30) || borrow_space_ptr > (1 << 30))
	movl	sub_space_ptr(%rip), %r9d	# sub_space_ptr, sub_space_ptr.49_55
# sub.c:967:     if (sub_space_ptr > (1 << 30) || borrow_space_ptr > (1 << 30))
	cmpl	$1073741824, %r9d	#, sub_space_ptr.49_55
	jg	.L466	#,
# sub.c:967:     if (sub_space_ptr > (1 << 30) || borrow_space_ptr > (1 << 30))
	movl	borrow_space_ptr(%rip), %ecx	# borrow_space_ptr, borrow_space_ptr.50_56
# sub.c:967:     if (sub_space_ptr > (1 << 30) || borrow_space_ptr > (1 << 30))
	cmpl	$1073741824, %ecx	#, borrow_space_ptr.50_56
	jg	.L466	#,
# sub.c:972:     if (sub_space_ptr && borrow_space_ptr)
	testl	%ecx, %ecx	# borrow_space_ptr.50_56
	je	.L468	#,
	testl	%r9d, %r9d	# sub_space_ptr.49_55
	jne	.L699	#,
.L468:
# sub.c:978:     if (gzclose(test_file) != Z_OK)
	movq	88(%rsp), %rdi	# %sfp,
	call	gzclose@PLT	#
# sub.c:978:     if (gzclose(test_file) != Z_OK)
	testl	%eax, %eax	# tmp586
	jne	.L700	#,
# sub.c:983: }
	movq	65912(%rsp), %rax	# D.40974, tmp599
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp599
	jne	.L701	#,
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
	.p2align 4,,10
	.p2align 3
.L705:
	.cfi_restore_state
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rdx)	# tmp463, MEM[(__mmask8 *)_210]
	.p2align 4,,10
	.p2align 3
.L443:
# sub.c:249:         i += 8;
	addq	$8, %r9	#, tmp406
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdi,%r9,8), %zmm14	# MEM[(__m512i * {ref-all})result_154 + i_343 * 8], _339
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rdx), %r12d	# MEM[(__mmask8 *)_210], MEM[(__mmask8 *)_210]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rdx), %rax	#, tmp407
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r12d, %k3	# MEM[(__mmask8 *)_210], tmp682
	vpsubq	ones(%rip), %zmm14, %zmm14{%k3}	# ones, _339, tmp469, tmp682, _339
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rdi,%r9,8)	# tmp469, MEM[(__m512i * {ref-all})result_154 + i_343 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k4	#, zeros, tmp469, tmp471
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k4, %k4	# tmp471
	jne	.L702	#,
.L541:
# sub.c:249:         i += 8;
	leaq	8(%r9), %rdx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdi,%rdx,8), %zmm15	# MEM[(__m512i * {ref-all})result_154 + i_343 * 8], _339
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rax), %ecx	# MEM[(__mmask8 *)_210], MEM[(__mmask8 *)_210]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k5	# MEM[(__mmask8 *)_210], tmp714
	vpsubq	ones(%rip), %zmm15, %zmm15{%k5}	# ones, _339, tmp509, tmp714, _339
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, (%rdi,%rdx,8)	# tmp509, MEM[(__m512i * {ref-all})result_154 + i_343 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k6	#, zeros, tmp509, tmp511
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k6, %k6	# tmp511
	jne	.L703	#,
.L543:
# sub.c:249:         i += 8;
	leaq	16(%r9), %r13	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdi,%r13,8), %zmm6	# MEM[(__m512i * {ref-all})result_154 + i_343 * 8], _339
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%rax), %r11d	# MEM[(__mmask8 *)_210], MEM[(__mmask8 *)_210]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r11d, %k7	# MEM[(__mmask8 *)_210], tmp715
	vpsubq	ones(%rip), %zmm6, %zmm6{%k7}	# ones, _339, tmp517, tmp715, _339
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rdi,%r13,8)	# tmp517, MEM[(__m512i * {ref-all})result_154 + i_343 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k1	#, zeros, tmp517, tmp519
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k1, %k1	# tmp519
	jne	.L704	#,
.L545:
# sub.c:249:         i += 8;
	addq	$24, %r9	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%rax), %rdx	#, ivtmp.430
	cmpq	%r9, %rbx	# i, _30
	jbe	.L684	#,
.L444:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdi,%r9,8), %zmm13	# MEM[(__m512i * {ref-all})result_154 + i_343 * 8], _339
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rdx), %r10d	# MEM[(__mmask8 *)_210], MEM[(__mmask8 *)_210]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r10d, %k2	# MEM[(__mmask8 *)_210], tmp681
	vpsubq	ones(%rip), %zmm13, %zmm13{%k2}	# ones, _339, tmp461, tmp681, _339
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rdi,%r9,8)	# tmp461, MEM[(__m512i * {ref-all})result_154 + i_343 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k0	#, zeros, tmp461, tmp463
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp463
	je	.L443	#,
	jmp	.L705	#
	.p2align 4,,10
	.p2align 3
.L427:
# sub.c:850:     switch (test_case)
	cmpl	$3, 64(%rsp)	#, %sfp
	jne	.L430	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC35(%rip), %rsi	#, tmp254
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	256(%rsp), %r12	#, tmp385
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC36(%rip), %r8	#,
	jmp	.L687	#
	.p2align 4,,10
	.p2align 3
.L694:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	64(%rdi), %zmm10	# MEM[(__m512i * {ref-all})result_154 + i_343 * 8], _339
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rsi), %r13d	# MEM[(__mmask8 *)_210], MEM[(__mmask8 *)_210]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r13d, %k3	# MEM[(__mmask8 *)_210], tmp711
	vpsubq	ones(%rip), %zmm10, %zmm10{%k3}	# ones, _339, tmp489, tmp711, _339
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, 64(%rdi)	# tmp489, MEM[(__m512i * {ref-all})result_154 + i_343 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k4	#, zeros, tmp489, tmp491
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k4, %k4	# tmp491
	jne	.L706	#,
.L532:
# sub.c:249:         i += 8;
	addq	$8, %r9	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rdx	# ivtmp.430
	jmp	.L588	#
	.p2align 4,,10
	.p2align 3
.L692:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%rcx), %zmm7	# MEM[(__m512i * {ref-all})a_177 + i_175 * 8], tmp716
# sub.c:217:         i += 8;
	movl	$16, %r13d	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%r12), %zmm7, %zmm2	# MEM[(__m512i * {ref-all})b_180 + i_175 * 8], tmp716, tmp521
# sub.c:219:     } while (likely(i < n));
	leaq	2(%rsi), %r11	#, ivtmp.439
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k2	#, zeros, tmp521, tmp523
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm2, %zmm3	# tmp521, tmp521
	vpaddq	limb_digits(%rip), %zmm2, %zmm3{%k2}	# limb_digits, tmp521, tmp521, tmp523, tmp521
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, 64(%rdi)	# tmp525, MEM[(__m512i * {ref-all})result_154 + i_175 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, 1(%rsi)	# tmp523, MEM[(__mmask8 *)_214]
	jmp	.L590	#
	.p2align 4,,10
	.p2align 3
.L452:
# sub.c:682:     if (strlen(result) != strlen(result_gmp))
	movq	%r13, %rdi	# result,
	call	strlen@PLT	#
# sub.c:682:     if (strlen(result) != strlen(result_gmp))
	testq	%rax, %rax	# tmp587
	je	.L456	#,
.L454:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC21(%rip), %rdi	#, tmp352
	call	puts@PLT	#
.L457:
	movl	68(%rsp), %edx	# %sfp,
	leaq	.LC42(%rip), %rsi	#, tmp365
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	movq	96(%rsp), %r8	# %sfp,
	movq	%r15, %rcx	# b_str,
	movq	%r14, %rdx	# a_str,
	leaq	.LC43(%rip), %rsi	#, tmp366
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	movl	$1, %edi	#,
	movq	%r12, %rdx	# sub_str,
	leaq	.LC44(%rip), %rsi	#, tmp367
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# sub.c:944:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.p2align 4,,10
	.p2align 3
.L637:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC22(%rip), %rdi	#, tmp354
	movq	%r8, 80(%rsp)	# _205, %sfp
	movq	%rcx, 88(%rsp)	# _203, %sfp
	movq	%rdx, 104(%rsp)	# i, %sfp
	call	puts@PLT	#
	movq	104(%rsp), %rdx	# %sfp, i
	leaq	.LC23(%rip), %rsi	#, tmp355
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# sub.c:695:             printf("result[%ld] = %c, result_gmp[%ld] = %c\n", i, result[i], i, result_gmp[i]);
	movq	88(%rsp), %rax	# %sfp, _203
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	80(%rsp), %r11	# %sfp, _205
	movq	104(%rsp), %rdx	# %sfp, i
# sub.c:695:             printf("result[%ld] = %c, result_gmp[%ld] = %c\n", i, result[i], i, result_gmp[i]);
	movsbl	(%rax), %ecx	# *_203, *_203
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movsbl	(%r11), %r9d	# *_205,
	movq	%rdx, %r8	# i,
	leaq	.LC24(%rip), %rsi	#, tmp358
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	movq	%rbx, %rcx	# result_gmp,
	movq	%r13, %rdx	# result,
	leaq	.LC25(%rip), %rsi	#, tmp359
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	jmp	.L457	#
	.p2align 4,,10
	.p2align 3
.L704:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k1, 2(%rax)	# tmp519, MEM[(__mmask8 *)_210]
	jmp	.L545	#
	.p2align 4,,10
	.p2align 3
.L703:
	kmovb	%k6, 1(%rax)	# tmp511, MEM[(__mmask8 *)_210]
	jmp	.L543	#
	.p2align 4,,10
	.p2align 3
.L702:
	kmovb	%k4, 1(%rdx)	# tmp471, MEM[(__mmask8 *)_210]
	jmp	.L541	#
	.p2align 4,,10
	.p2align 3
.L428:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC29(%rip), %rsi	#, tmp239
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	256(%rsp), %r12	#, tmp385
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC30(%rip), %r8	#,
	jmp	.L687	#
	.p2align 4,,10
	.p2align 3
.L426:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC33(%rip), %rsi	#, tmp249
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	256(%rsp), %r12	#, tmp385
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC34(%rip), %r8	#,
	jmp	.L687	#
.L698:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC26(%rip), %rdi	#, tmp364
	call	puts@PLT	#
	jmp	.L457	#
.L691:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L472	#,
# sub.c:185:         j++;
	movl	$1, %edx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %rbx	#, _30
	je	.L473	#,
# sub.c:192:     } while (j < n);
	jbe	.L471	#,
	testq	%r8, %r8	# tmp416
	je	.L662	#,
	cmpq	$1, %r8	#, tmp416
	je	.L592	#,
	cmpq	$2, %r8	#, tmp416
	je	.L593	#,
	cmpq	$3, %r8	#, tmp416
	je	.L594	#,
	cmpq	$4, %r8	#, tmp416
	je	.L595	#,
	cmpq	$5, %r8	#, tmp416
	je	.L596	#,
	cmpq	$6, %r8	#, tmp416
	jne	.L707	#,
.L597:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	80(%rsp), %rcx	# %sfp, b.39_46
	movq	72(%rsp), %r11	# %sfp, a.40_47
	movq	(%rcx,%rdx,8), %rsi	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp727
	cmpq	%rsi, (%r11,%rdx,8)	# tmp727, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L471	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L472	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L473	#,
.L596:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	80(%rsp), %r8	# %sfp, b.39_46
	movq	72(%rsp), %rax	# %sfp, a.40_47
	movq	(%r8,%rdx,8), %r9	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp730
	cmpq	%r9, (%rax,%rdx,8)	# tmp730, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L471	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L472	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L473	#,
.L595:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	80(%rsp), %r13	# %sfp, b.39_46
	movq	72(%rsp), %r10	# %sfp, a.40_47
	movq	0(%r13,%rdx,8), %r11	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp733
	cmpq	%r11, (%r10,%rdx,8)	# tmp733, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L471	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L472	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L473	#,
.L594:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	80(%rsp), %rcx	# %sfp, b.39_46
	movq	72(%rsp), %rsi	# %sfp, a.40_47
	movq	(%rcx,%rdx,8), %rax	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp736
	cmpq	%rax, (%rsi,%rdx,8)	# tmp736, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L471	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L472	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L473	#,
.L593:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	80(%rsp), %r9	# %sfp, b.39_46
	movq	72(%rsp), %r8	# %sfp, a.40_47
	movq	(%r9,%rdx,8), %r10	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp739
	cmpq	%r10, (%r8,%rdx,8)	# tmp739, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L471	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L472	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L473	#,
.L592:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	80(%rsp), %r11	# %sfp, b.39_46
	movq	72(%rsp), %r13	# %sfp, a.40_47
	movq	(%r11,%rdx,8), %rsi	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp742
	cmpq	%rsi, 0(%r13,%rdx,8)	# tmp742, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L471	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L472	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L473	#,
# sub.c:192:     } while (j < n);
	jbe	.L471	#,
	movq	80(%rsp), %rcx	# %sfp, b.39_46
	movq	72(%rsp), %r9	# %sfp, a.40_47
.L441:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rcx,%rdx,8), %rax	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp667
	cmpq	%rax, (%r9,%rdx,8)	# tmp667, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L471	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L472	#,
# sub.c:185:         j++;
	leaq	1(%rdx), %r10	#, tmp417
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r10, %rbx	# tmp417, _30
	je	.L473	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rcx,%r10,8), %r8	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp668
	cmpq	%r8, (%r9,%r10,8)	# tmp668, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L471	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L472	#,
# sub.c:185:         j++;
	leaq	2(%rdx), %r13	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r13, %rbx	# j, _30
	je	.L473	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rcx,%r13,8), %r11	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp743
	cmpq	%r11, (%r9,%r13,8)	# tmp743, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L471	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L472	#,
# sub.c:185:         j++;
	addq	$3, %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L473	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rcx,%rdx,8), %rsi	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp744
	cmpq	%rsi, (%r9,%rdx,8)	# tmp744, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L471	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L472	#,
# sub.c:185:         j++;
	leaq	3(%r10), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L473	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rcx,%rdx,8), %rax	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp745
	cmpq	%rax, (%r9,%rdx,8)	# tmp745, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L471	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L472	#,
# sub.c:185:         j++;
	leaq	4(%r10), %r8	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r8, %rbx	# j, _30
	je	.L473	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rcx,%r8,8), %r13	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp746
	cmpq	%r13, (%r9,%r8,8)	# tmp746, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L471	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L472	#,
# sub.c:185:         j++;
	leaq	5(%r10), %rsi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rsi, %rbx	# j, _30
	je	.L473	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rcx,%rsi,8), %r11	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp747
	cmpq	%r11, (%r9,%rsi,8)	# tmp747, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L471	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L472	#,
# sub.c:185:         j++;
	leaq	6(%r10), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L473	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rcx,%rdx,8), %rax	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp748
	cmpq	%rax, (%r9,%rdx,8)	# tmp748, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L471	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L472	#,
# sub.c:185:         j++;
	leaq	7(%r10), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L473	#,
# sub.c:192:     } while (j < n);
	ja	.L441	#,
	jmp	.L471	#
	.p2align 4,,10
	.p2align 3
.L693:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rsi)	# tmp327, MEM[(__mmask8 *)_210]
	jmp	.L530	#
.L696:
	kmovb	%k1, (%rdx)	# tmp503, MEM[(__mmask8 *)_210]
	jmp	.L538	#
.L695:
	kmovb	%k6, (%rdx)	# tmp497, MEM[(__mmask8 *)_210]
	jmp	.L535	#
.L706:
	kmovb	%k4, 1(%rsi)	# tmp491, MEM[(__mmask8 *)_210]
	jmp	.L532	#
.L690:
# sub.c:887:             if (gzeof(test_file))
	movq	88(%rsp), %rdi	# %sfp,
	call	gzeof@PLT	#
# sub.c:887:             if (gzeof(test_file))
	testl	%eax, %eax	# tmp574
	jne	.L461	#,
# sub.c:893:                 perror("Error reading line");
	leaq	.LC39(%rip), %rdi	#, tmp263
	call	perror@PLT	#
# sub.c:894:                 gzclose(test_file);
	movq	88(%rsp), %rdi	# %sfp,
	call	gzclose@PLT	#
# sub.c:895:                 exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.p2align 4,,10
	.p2align 3
.L472:
	movq	72(%rsp), %r12	# %sfp, b
	movq	80(%rsp), %rcx	# %sfp, a
	movl	$1, %r8d	#, prephitmp_362
	jmp	.L439	#
.L662:
	movq	%rcx, %r9	# a.40_47, a.40_47
	movq	80(%rsp), %rcx	# %sfp, b.39_46
	jmp	.L441	#
.L707:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	80(%rsp), %r10	# %sfp, b.39_46
	movq	8(%r10), %r13	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp724
	cmpq	%r13, 8(%rcx)	# tmp724, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L471	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L472	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	jne	.L597	#,
.L473:
	movq	%r12, %rdi	# _29, sub
	xorl	%r8d, %r8d	# prephitmp_362
	jmp	.L440	#
.L464:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC46(%rip), %rsi	#, tmp369
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	jmp	.L465	#
.L463:
	leaq	.LC48(%rip), %rsi	#, tmp371
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	jmp	.L465	#
.L462:
	leaq	.LC47(%rip), %rsi	#, tmp370
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	jmp	.L465	#
.L699:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:54:   free (__ptr);
	movq	sub_space(%rip), %rdi	# sub_space,
	call	free@PLT	#
	movq	borrow_space(%rip), %rdi	# borrow_space,
	call	free@PLT	#
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:55: }
	jmp	.L468	#
.L477:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	104(%rsp), %rcx	# %sfp,
	movq	stderr(%rip), %rdi	# stderr,
	leaq	.LC41(%rip), %rdx	#, tmp277
	movl	$1, %esi	#,
	xorl	%eax, %eax	#
	call	__fprintf_chk@PLT	#
# sub.c:907:             gzclose(test_file);
	movq	88(%rsp), %rdi	# %sfp,
	call	gzclose@PLT	#
# sub.c:908:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L466:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC49(%rip), %rdi	#, tmp372
	call	puts@PLT	#
# sub.c:970:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L689:
	movq	88(%rsp), %rdi	# %sfp,
	call	skip_first_line.part.0	#
.L688:
	movq	%r12, %rdi	# tmp385,
	call	open_gzfile.part.0	#
.L430:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC37(%rip), %rdi	#, tmp257
	call	puts@PLT	#
# sub.c:870:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L701:
# sub.c:983: }
	call	__stack_chk_fail@PLT	#
.L700:
# sub.c:980:         perror("Error closing test file");
	leaq	.LC50(%rip), %rdi	#, tmp379
	call	perror@PLT	#
# sub.c:981:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5800:
	.size	run_correctness_test, .-run_correctness_test
	.section	.rodata.str1.1
.LC52:
	.string	"experiments/results"
	.section	.rodata.str1.8
	.align 8
.LC53:
	.string	"Running the tests with RDTSC measurements"
	.align 8
.LC54:
	.string	"experiments/results/rdtsc_measurements"
	.align 8
.LC55:
	.string	"Running the tests with timespec measurements"
	.align 8
.LC56:
	.string	"experiments/results/timespec_measurements"
	.align 8
.LC57:
	.string	"Running the tests with rusage measurements"
	.align 8
.LC58:
	.string	"experiments/results/cputime_measurements"
	.section	.rodata.str1.1
.LC59:
	.string	"Invalid measure type"
.LC60:
	.string	"Running %d iterations...\n"
	.section	.rodata.str1.8
	.align 8
.LC61:
	.string	"Iteration %d, reading test case %d\n"
	.section	.rodata.str1.1
.LC62:
	.string	"Calibrating CPU speed..."
.LC64:
	.string	"done"
.LC66:
	.string	"Calibrated time: %f\n"
.LC68:
	.string	"Subtracting %d times\n"
.LC69:
	.string	"done!"
	.section	.rodata.str1.8
	.align 8
.LC72:
	.string	"RESULT: %.*f operations per second\n"
	.section	.rodata.str1.1
.LC73:
	.string	"%.*f\n"
	.section	.rodata.str1.8
	.align 8
.LC75:
	.string	"experiments/results/cputime_measurements/random_%d_%d.csv.gz"
	.section	.rodata.str1.1
.LC76:
	.string	"wb"
	.section	.rodata.str1.8
	.align 8
.LC77:
	.string	"experiments/results/rdtsc_measurements/random_%d_%d.csv.gz"
	.align 8
.LC78:
	.string	"experiments/results/timespec_measurements/random_%d_%d.csv.gz"
	.align 8
.LC79:
	.string	"experiments/results/rdtsc_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC80:
	.string	"experiments/results/rdtsc_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC81:
	.string	"experiments/results/rdtsc_measurements/greater_%d_%d.csv.gz"
	.align 8
.LC82:
	.string	"experiments/results/timespec_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC83:
	.string	"experiments/results/cputime_measurements/smaller_%d_%d.csv.gz"
	.align 8
.LC84:
	.string	"experiments/results/timespec_measurements/greater_%d_%d.csv.gz"
	.align 8
.LC85:
	.string	"experiments/results/cputime_measurements/greater_%d_%d.csv.gz"
	.align 8
.LC86:
	.string	"experiments/results/timespec_measurements/equal_%d_%d.csv.gz"
	.align 8
.LC87:
	.string	"experiments/results/cputime_measurements/equal_%d_%d.csv.gz"
	.text
	.p2align 4
	.globl	run_benchmarking_test
	.type	run_benchmarking_test, @function
run_benchmarking_test:
.LFB5801:
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
	pushq	%r13	#
	pushq	%r12	#
	pushq	%r10	#
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx	#
	leaq	-65536(%rsp), %r11	#,
.LPSRL2:
	subq	$4096, %rsp	#,
	orq	$0, (%rsp)	#,
	cmpq	%r11, %rsp	#,
	jne	.LPSRL2
	subq	$768, %rsp	#,
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
# sub.c:996: {
	movl	%esi, -66328(%rbp)	# measure_type, %sfp
	movl	%edi, %ebx	# tmp2974, test_case
	movl	%esi, %r15d	# tmp2975, measure_type
# sub.c:998:     create_directory("experiments/results");
	leaq	.LC52(%rip), %rdi	#, tmp744
# sub.c:996: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp3239
	movq	%rax, -56(%rbp)	# tmp3239, D.41319
	xorl	%eax, %eax	# tmp3239
# sub.c:998:     create_directory("experiments/results");
	call	create_directory	#
# sub.c:1001:     switch (measure_type)
	cmpl	$1, %r15d	#, measure_type
	je	.L709	#,
	cmpl	$2, %r15d	#, measure_type
	je	.L710	#,
	testl	%r15d, %r15d	# measure_type
	je	.L2309	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC59(%rip), %rdi	#, tmp781
	call	puts@PLT	#
# sub.c:1017:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.p2align 4,,10
	.p2align 3
.L709:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC55(%rip), %rdi	#, tmp757
	call	puts@PLT	#
# sub.c:1009:         create_directory("experiments/results/timespec_measurements");
	leaq	.LC56(%rip), %rdi	#, tmp758
	call	create_directory	#
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	sub_space(%rip), %rdi	# sub_space,
	movl	$1073741824, %edx	#,
	xorl	%esi, %esi	#
	call	memset@PLT	#
	movq	borrow_space(%rip), %rdi	# borrow_space,
	movl	$1073741824, %edx	#,
	xorl	%esi, %esi	#
# sub.c:1021:     sub_space_ptr = 0;
	movl	$0, sub_space_ptr(%rip)	#, sub_space_ptr
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	call	memset@PLT	#
# sub.c:1024:     borrow_space_ptr = 0;
	movl	$0, borrow_space_ptr(%rip)	#, borrow_space_ptr
# sub.c:1031:     switch (test_case)
	cmpl	$2, %ebx	#, test_case
	je	.L718	#,
	jg	.L719	#,
	testl	%ebx, %ebx	# test_case
	je	.L720	#,
	cmpl	$1, %ebx	#, test_case
	jne	.L716	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC31(%rip), %rsi	#, tmp1452
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1481
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC32(%rip), %r8	#,
	movl	$100, %esi	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movq	%r12, %rdi	# tmp1481,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %esi	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%rsi	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-65824(%rbp), %r13	#, tmp1482
	leaq	.LC86(%rip), %r8	#,
.L2292:
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r13, %rdi	# tmp1482,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
# sub.c:736:     gzFile file = gzopen(filename, mode);
	leaq	.LC76(%rip), %rsi	#, tmp1459
	movq	%r13, %rdi	# tmp1482,
	call	gzopen@PLT	#
# sub.c:737:     if (file == NULL)
	popq	%rsi	#
# sub.c:736:     gzFile file = gzopen(filename, mode);
	movq	%rax, -66352(%rbp)	# file, %sfp
# sub.c:737:     if (file == NULL)
	popq	%rdi	#
	testq	%rax, %rax	# file
	je	.L847	#,
.L848:
# sub.c:736:     gzFile file = gzopen(filename, mode);
	leaq	.LC38(%rip), %rsi	#, tmp787
	movq	%r12, %rdi	# tmp1481,
	call	gzopen@PLT	#
	movq	%rax, -66312(%rbp)	# file, %sfp
# sub.c:737:     if (file == NULL)
	testq	%rax, %rax	# file
	je	.L2310	#,
# sub.c:748:     if (gzgets(file, buffer, sizeof(buffer)) == NULL)
	leaq	-65600(%rbp), %r12	#, tmp1475
	movq	%rax, %rdi	# file,
	movl	$65536, %edx	#,
	movq	%r12, %rsi	# tmp1475,
	call	gzgets@PLT	#
# sub.c:748:     if (gzgets(file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp2977
	je	.L2308	#,
# sub.c:1191:     unsigned long seed = generate_seed();
	xorl	%eax, %eax	#
	call	generate_seed	#
# sub.c:1192:     srand(seed);
	movl	%eax, %edi	# tmp2978, seed
	call	srand@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edx	#,
	leaq	.LC60(%rip), %rsi	#, tmp791
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# sub.c:1198:         int i = rand() % ITERATIONS;
	call	rand@PLT	#
	movslq	%eax, %rdx	# tmp2979,
# sub.c:1198:         int i = rand() % ITERATIONS;
	imulq	$351843721, %rdx, %rcx	#, _40, tmp793
	movl	%edx, %esi	# _40, tmp796
	sarl	$31, %esi	#, tmp796
	sarq	$45, %rcx	#, tmp795
	subl	%esi, %ecx	# tmp796, i
	imull	$100000, %ecx, %r15d	#, i, tmp797
# sub.c:1198:         int i = rand() % ITERATIONS;
	movq	%rdx, %rbx	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC61(%rip), %rsi	#, tmp798
# sub.c:1198:         int i = rand() % ITERATIONS;
	subl	%r15d, %ebx	# tmp797, i
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	xorl	%edx, %edx	#
	movl	%ebx, %ecx	# i,
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# sub.c:1203:         gzrewind(test_file);
	movq	-66312(%rbp), %r13	# %sfp, file
	movq	%r13, %rdi	# file,
	call	gzrewind@PLT	#
# sub.c:748:     if (gzgets(file, buffer, sizeof(buffer)) == NULL)
	movl	$65536, %edx	#,
	movq	%r12, %rsi	# tmp1475,
	movq	%r13, %rdi	# file,
	call	gzgets@PLT	#
# sub.c:748:     if (gzgets(file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp2980
	je	.L2308	#,
# sub.c:1207:         for (int j = 0; j < i; ++j)
	xorl	%r15d, %r15d	# j
# sub.c:1207:         for (int j = 0; j < i; ++j)
	testl	%ebx, %ebx	# i
	jle	.L737	#,
	movl	%ebx, %edi	# i, tmp1681
	andl	$3, %edi	#, tmp1681
	je	.L2277	#,
	cmpl	$1, %edi	#, tmp1681
	je	.L1584	#,
	cmpl	$2, %edi	#, tmp1681
	jne	.L2311	#,
.L1585:
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movl	$65536, %edx	#,
	xorl	%esi, %esi	#
	movq	%r12, %rdi	# tmp1475,
	call	memset@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	movq	-66312(%rbp), %rdi	# %sfp,
	movl	$65536, %edx	#,
	movq	%r12, %rsi	# tmp1475,
	call	gzgets@PLT	#
# sub.c:1207:         for (int j = 0; j < i; ++j)
	incl	%r15d	# j
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp3002
	je	.L1925	#,
.L1584:
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	xorl	%esi, %esi	#
	movl	$65536, %edx	#,
	movq	%r12, %rdi	# tmp1475,
	call	memset@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	movq	-66312(%rbp), %rdi	# %sfp,
	movl	$65536, %edx	#,
	movq	%r12, %rsi	# tmp1475,
	call	gzgets@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp3003
	je	.L1925	#,
# sub.c:1207:         for (int j = 0; j < i; ++j)
	incl	%r15d	# j
# sub.c:1207:         for (int j = 0; j < i; ++j)
	cmpl	%r15d, %ebx	# j, i
	je	.L737	#,
.L2277:
	movq	-66312(%rbp), %r14	# %sfp, file
.L731:
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	xorl	%esi, %esi	#
	movl	$65536, %edx	#,
	movq	%r12, %rdi	# tmp1475,
	call	memset@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	movl	$65536, %edx	#,
	movq	%r12, %rsi	# tmp1475,
	movq	%r14, %rdi	# file,
	call	gzgets@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp2984
	je	.L1925	#,
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	xorl	%esi, %esi	#
	movl	$65536, %edx	#,
	movq	%r12, %rdi	# tmp1475,
	call	memset@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	movl	$65536, %edx	#,
	movq	%r12, %rsi	# tmp1475,
	movq	%r14, %rdi	# file,
	call	gzgets@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp2986
	je	.L1925	#,
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	xorl	%esi, %esi	#
	movl	$65536, %edx	#,
	movq	%r12, %rdi	# tmp1475,
	call	memset@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	movl	$65536, %edx	#,
	movq	%r12, %rsi	# tmp1475,
	movq	%r14, %rdi	# file,
	call	gzgets@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp3004
	je	.L1925	#,
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	xorl	%esi, %esi	#
	movl	$65536, %edx	#,
	movq	%r12, %rdi	# tmp1475,
	call	memset@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	movl	$65536, %edx	#,
	movq	%r12, %rsi	# tmp1475,
	movq	%r14, %rdi	# file,
	call	gzgets@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp3005
	je	.L1925	#,
# sub.c:1207:         for (int j = 0; j < i; ++j)
	addl	$4, %r15d	#, j
# sub.c:1207:         for (int j = 0; j < i; ++j)
	cmpl	%r15d, %ebx	# j, i
	jne	.L731	#,
.L737:
# sub.c:1227:         char *a_str = strtok(buffer, ",");
	leaq	.LC40(%rip), %rbx	#, tmp801
	movq	%rbx, %rsi	# tmp801,
	movq	%r12, %rdi	# tmp1475,
	call	strtok@PLT	#
# sub.c:1228:         char *b_str = strtok(NULL, ",");
	xorl	%edi, %edi	#
	movq	%rbx, %rsi	# tmp801,
# sub.c:1227:         char *a_str = strtok(buffer, ",");
	movq	%rax, %r15	# tmp2981, a_str
# sub.c:1228:         char *b_str = strtok(NULL, ",");
	call	strtok@PLT	#
# sub.c:1229:         char *result_str = strtok(NULL, ",");
	xorl	%edi, %edi	#
	movq	%rbx, %rsi	# tmp801,
# sub.c:1228:         char *b_str = strtok(NULL, ",");
	movq	%rax, %r13	# tmp2982, b_str
# sub.c:1229:         char *result_str = strtok(NULL, ",");
	call	strtok@PLT	#
# sub.c:1231:         if (a_str == NULL || b_str == NULL || result_str == NULL)
	testq	%r15, %r15	# a_str
	sete	%r8b	#, tmp805
# sub.c:1231:         if (a_str == NULL || b_str == NULL || result_str == NULL)
	testq	%r13, %r13	# b_str
	sete	%r9b	#, tmp807
# sub.c:1231:         if (a_str == NULL || b_str == NULL || result_str == NULL)
	orb	%r9b, %r8b	# tmp807, tmp3240
	jne	.L732	#,
	testq	%rax, %rax	# result_str
	je	.L732	#,
# sub.c:1239:         int n_1 = strlen(a_str);
	movq	%r15, %rdi	# a_str,
	call	strlen@PLT	#
# sub.c:1240:         int n_2 = strlen(b_str);
	movq	%r13, %rdi	# b_str,
# sub.c:1239:         int n_1 = strlen(a_str);
	movl	%eax, -66296(%rbp)	# tmp2987, n_1
# sub.c:1240:         int n_2 = strlen(b_str);
	call	strlen@PLT	#
# sub.c:1244:         limb_set_str(a_str, b_str, &a, &b, &n_1, &n_2);
	movq	%r13, %rsi	# b_str,
	movq	%r15, %rdi	# a_str,
	leaq	-66224(%rbp), %rcx	#, tmp829
	leaq	-66288(%rbp), %rdx	#, tmp830
	leaq	-66292(%rbp), %r9	#,
	leaq	-66296(%rbp), %r8	#,
# sub.c:1240:         int n_2 = strlen(b_str);
	movl	%eax, -66292(%rbp)	# tmp2988, n_2
# sub.c:1244:         limb_set_str(a_str, b_str, &a, &b, &n_1, &n_2);
	call	limb_set_str	#
# sub.c:1248:         int n = n_1;
	movslq	-66296(%rbp), %r12	# n_1,
# sub.c:1251:         aligned_uint64_ptr sub = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %r10	# sub_space_ptr,
	movq	sub_space(%rip), %rax	# sub_space, sub_space
# sub.c:1252:         sub_space_ptr += (n + 31) & ~31;
	leal	31(%r12), %edx	#, tmp834
# sub.c:1252:         sub_space_ptr += (n + 31) & ~31;
	andl	$-32, %edx	#, _59
# sub.c:1251:         aligned_uint64_ptr sub = sub_space + sub_space_ptr;
	movq	%r10, %r11	#,
# sub.c:1256:         memset(sub, 0, n * sizeof(uint64_t));
	leaq	0(,%r12,8), %r13	#, _63
# sub.c:1252:         sub_space_ptr += (n + 31) & ~31;
	addl	%edx, %r11d	# _59, tmp835
# sub.c:1253:         borrow_space_ptr += (n + 31) & ~31;
	addl	%edx, borrow_space_ptr(%rip)	# _59, borrow_space_ptr
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	xorl	%esi, %esi	#
# sub.c:1251:         aligned_uint64_ptr sub = sub_space + sub_space_ptr;
	leaq	(%rax,%r10,8), %rdi	#, _57
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	%r13, %rdx	# _63,
# sub.c:1252:         sub_space_ptr += (n + 31) & ~31;
	movl	%r11d, sub_space_ptr(%rip)	# tmp835, sub_space_ptr
# sub.c:1245:         __builtin_assume_aligned(a, 64);
	movq	-66288(%rbp), %r14	# a, a.103_51
# sub.c:1246:         __builtin_assume_aligned(b, 64);
	movq	-66224(%rbp), %r15	# b, b.104_52
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	call	memset@PLT	#
	movq	borrow_space(%rip), %rdi	# borrow_space,
	xorl	%esi, %esi	#
	movq	%r13, %rdx	# _63,
	call	memset@PLT	#
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	testl	%r12d, %r12d	# n
	jle	.L743	#,
	leal	-1(%r12), %edi	#, tmp845
	shrl	$6, %edi	#,
	salq	$6, %rdi	#, tmp848
	leaq	64(%r14,%rdi), %rsi	#, _603
	shrq	$6, %rdi	#, tmp1671
	incq	%rdi	# tmp1674
	movq	%r14, %r8	# a.103_51, ivtmp.716
	movq	%r15, %rcx	# b.104_52, ivtmp.717
	andl	$7, %edi	#, tmp1675
	je	.L742	#,
	cmpq	$1, %rdi	#, tmp1675
	je	.L1586	#,
	cmpq	$2, %rdi	#, tmp1675
	je	.L1587	#,
	cmpq	$3, %rdi	#, tmp1675
	je	.L1588	#,
	cmpq	$4, %rdi	#, tmp1675
	je	.L1589	#,
	cmpq	$5, %rdi	#, tmp1675
	je	.L1590	#,
	cmpq	$6, %rdi	#, tmp1675
	jne	.L2312	#,
.L1591:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	(%r8)	# ivtmp.716
	clflush	(%rcx)	# ivtmp.717
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	addq	$64, %r8	#, ivtmp.716
	addq	$64, %rcx	#, ivtmp.717
.L1590:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	(%r8)	# ivtmp.716
	clflush	(%rcx)	# ivtmp.717
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	addq	$64, %r8	#, ivtmp.716
	addq	$64, %rcx	#, ivtmp.717
.L1589:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	(%r8)	# ivtmp.716
	clflush	(%rcx)	# ivtmp.717
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	addq	$64, %r8	#, ivtmp.716
	addq	$64, %rcx	#, ivtmp.717
.L1588:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	(%r8)	# ivtmp.716
	clflush	(%rcx)	# ivtmp.717
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	addq	$64, %r8	#, ivtmp.716
	addq	$64, %rcx	#, ivtmp.717
.L1587:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	(%r8)	# ivtmp.716
	clflush	(%rcx)	# ivtmp.717
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	addq	$64, %r8	#, ivtmp.716
	addq	$64, %rcx	#, ivtmp.717
.L1586:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	(%r8)	# ivtmp.716
	clflush	(%rcx)	# ivtmp.717
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	addq	$64, %r8	#, ivtmp.716
	addq	$64, %rcx	#, ivtmp.717
	cmpq	%r8, %rsi	# ivtmp.716, _603
	je	.L743	#,
.L742:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	(%r8)	# ivtmp.716
	clflush	(%rcx)	# ivtmp.717
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	leaq	64(%rcx), %r9	#, tmp1677
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	64(%r8)	#
	clflush	(%r9)	# tmp1677
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	leaq	128(%rcx), %r14	#, ivtmp.717
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	128(%r8)	#
	clflush	(%r14)	# ivtmp.717
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	leaq	192(%rcx), %r15	#, ivtmp.717
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	192(%r8)	#
	clflush	(%r15)	# ivtmp.717
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	leaq	256(%rcx), %rbx	#, ivtmp.717
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	256(%r8)	#
	clflush	(%rbx)	# ivtmp.717
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	leaq	320(%rcx), %r10	#, ivtmp.717
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	320(%r8)	#
	clflush	(%r10)	# ivtmp.717
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	leaq	384(%rcx), %r11	#, ivtmp.717
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	384(%r8)	#
	clflush	(%r11)	# ivtmp.717
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	leaq	448(%rcx), %rax	#, ivtmp.717
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	448(%r8)	#
	clflush	(%rax)	# ivtmp.717
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	addq	$512, %r8	#, ivtmp.716
	addq	$512, %rcx	#, ivtmp.717
	cmpq	%r8, %rsi	# ivtmp.716, _603
	jne	.L742	#,
.L743:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1534:   __builtin_ia32_mfence ();
	mfence	
# sub.c:1332:         switch (measure_type)
	movl	-66328(%rbp), %edx	# %sfp, measure_type
	cmpl	$1, %edx	#, measure_type
	je	.L739	#,
	cmpl	$2, %edx	#, measure_type
	je	.L740	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC62(%rip), %rdi	#, tmp850
	call	puts@PLT	#
# sub.c:1337:             fflush(stdout);
	movq	stdout(%rip), %rdi	# stdout,
	call	fflush@PLT	#
# sub.c:1338:             __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);
	xorl	%eax, %eax	# tmp852
#APP
# 1338 "sub.c" 1
	cpuid
		
# 0 "" 2
# sub.c:1339:             TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
#NO_APP
	movq	-66224(%rbp), %r14	# b, b.114_69
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %rdi	# sub_space_ptr, sub_space_ptr
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %r8	# sub_space, sub_space
# sub.c:1339:             TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
	movq	-66288(%rbp), %r15	# a, a.115_70
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14), %r10	# MEM[(uint64_t *)b.114_69 + j_311 * 8], tmp3591
	leaq	-1(%r12), %rcx	#, tmp1569
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%r8,%rdi,8), %rax	#, result
	andl	$7, %ecx	#, tmp1571
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%r10, (%r15)	# tmp3591, MEM[(uint64_t *)a.115_70 + j_311 * 8]
	jbe	.L2313	#,
.L853:
	movq	%r14, %r11	# b.114_69, b
	movq	%r15, %r8	# a.115_70, a
.L744:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8), %zmm9	# MEM[(__m512i * {ref-all})a_333 + i_331 * 8], tmp3594
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %rdx	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r11), %zmm9, %zmm10	# MEM[(__m512i * {ref-all})b_336 + i_331 * 8], tmp3594, tmp888
	leaq	-1(%r12), %r10	#, tmp1565
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k7	#, zeros, tmp888, tmp890
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm10, %zmm11	# tmp888, tmp888
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %rdx	# borrow_space, ivtmp.616
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm10, %zmm11{%k7}	# limb_digits, tmp888, tmp888, tmp890, tmp888
	shrq	$3, %r10	#, tmp1563
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rax)	# tmp894, MEM[(__m512i * {ref-all})result_310 + i_331 * 8]
	andl	$3, %r10d	#, tmp1566
# sub.c:217:         i += 8;
	movl	$8, %ecx	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%rdx), %rsi	#, ivtmp.625
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, (%rdx)	# tmp890, MEM[(__mmask8 *)_1146]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %r12	#, sub_size
	jbe	.L1930	#,
	testq	%r10, %r10	# tmp1566
	je	.L748	#,
	cmpq	$1, %r10	#, tmp1566
	je	.L1629	#,
	cmpq	$2, %r10	#, tmp1566
	jne	.L2314	#,
.L1630:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rcx,8), %zmm15	# MEM[(__m512i * {ref-all})a_333 + i_331 * 8], tmp3875
# sub.c:219:     } while (likely(i < n));
	incq	%rsi	# ivtmp.625
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r11,%rcx,8), %zmm15, %zmm4	# MEM[(__m512i * {ref-all})b_336 + i_331 * 8], tmp3875, tmp2408
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm4, %k2	#, zeros, tmp2408, tmp2410
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm4, %zmm1	# tmp2408, tmp2408
	vpaddq	limb_digits(%rip), %zmm4, %zmm1{%k2}	# limb_digits, tmp2408, tmp2408, tmp2410, tmp2408
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rax,%rcx,8)	# tmp2412, MEM[(__m512i * {ref-all})result_310 + i_331 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, -1(%rsi)	# tmp2410, MEM[(__mmask8 *)_1146]
.L1629:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rcx,8), %zmm7	# MEM[(__m512i * {ref-all})a_333 + i_331 * 8], tmp3877
# sub.c:219:     } while (likely(i < n));
	incq	%rsi	# ivtmp.625
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r11,%rcx,8), %zmm7, %zmm3	# MEM[(__m512i * {ref-all})b_336 + i_331 * 8], tmp3877, tmp2414
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k3	#, zeros, tmp2414, tmp2416
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm3, %zmm2	# tmp2414, tmp2414
	vpaddq	limb_digits(%rip), %zmm3, %zmm2{%k3}	# limb_digits, tmp2414, tmp2414, tmp2416, tmp2414
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, (%rax,%rcx,8)	# tmp2418, MEM[(__m512i * {ref-all})result_310 + i_331 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, -1(%rsi)	# tmp2416, MEM[(__mmask8 *)_1146]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rcx, %r12	# i, sub_size
	jbe	.L1930	#,
.L748:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rcx,8), %zmm6	# MEM[(__m512i * {ref-all})a_333 + i_331 * 8], tmp3596
# sub.c:217:         i += 8;
	leaq	8(%rcx), %r9	#, tmp1567
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r11,%rcx,8), %zmm6, %zmm5	# MEM[(__m512i * {ref-all})b_336 + i_331 * 8], tmp3596, tmp1709
# sub.c:217:         i += 8;
	leaq	16(%rcx), %rdi	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k4	#, zeros, tmp1709, tmp1711
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm5, %zmm8	# tmp1709, tmp1709
# sub.c:217:         i += 8;
	leaq	24(%rcx), %rbx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm5, %zmm8{%k4}	# limb_digits, tmp1709, tmp1709, tmp1711, tmp1709
# sub.c:219:     } while (likely(i < n));
	addq	$4, %rsi	#, ivtmp.625
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rax,%rcx,8)	# tmp1713, MEM[(__m512i * {ref-all})result_310 + i_331 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, -4(%rsi)	# tmp1711, MEM[(__mmask8 *)_1146]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%r9,8), %zmm0	# MEM[(__m512i * {ref-all})a_333 + i_331 * 8], tmp3598
# sub.c:217:         i += 8;
	addq	$32, %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r11,%r9,8), %zmm0, %zmm9	# MEM[(__m512i * {ref-all})b_336 + i_331 * 8], tmp3598, tmp1717
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k5	#, zeros, tmp1717, tmp1719
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm9, %zmm10	# tmp1717, tmp1717
	vpaddq	limb_digits(%rip), %zmm9, %zmm10{%k5}	# limb_digits, tmp1717, tmp1717, tmp1719, tmp1717
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, (%rax,%r9,8)	# tmp1721, MEM[(__m512i * {ref-all})result_310 + i_331 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, -3(%rsi)	# tmp1719, MEM[(__mmask8 *)_1146]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rdi,8), %zmm11	# MEM[(__m512i * {ref-all})a_333 + i_331 * 8], tmp3600
	vpsubq	(%r11,%rdi,8), %zmm11, %zmm12	# MEM[(__m512i * {ref-all})b_336 + i_331 * 8], tmp3600, tmp1725
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k6	#, zeros, tmp1725, tmp1727
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm12, %zmm13	# tmp1725, tmp1725
	vpaddq	limb_digits(%rip), %zmm12, %zmm13{%k6}	# limb_digits, tmp1725, tmp1725, tmp1727, tmp1725
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rax,%rdi,8)	# tmp1729, MEM[(__m512i * {ref-all})result_310 + i_331 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, -2(%rsi)	# tmp1727, MEM[(__mmask8 *)_1146]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rbx,8), %zmm14	# MEM[(__m512i * {ref-all})a_333 + i_331 * 8], tmp3602
	vpsubq	(%r11,%rbx,8), %zmm14, %zmm15	# MEM[(__m512i * {ref-all})b_336 + i_331 * 8], tmp3602, tmp1733
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k7	#, zeros, tmp1733, tmp1735
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm15, %zmm4	# tmp1733, tmp1733
	vpaddq	limb_digits(%rip), %zmm15, %zmm4{%k7}	# limb_digits, tmp1733, tmp1733, tmp1735, tmp1733
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm4, (%rax,%rbx,8)	# tmp1737, MEM[(__m512i * {ref-all})result_310 + i_331 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, -1(%rsi)	# tmp1735, MEM[(__mmask8 *)_1146]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rcx, %r12	# i, sub_size
	ja	.L748	#,
.L1930:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm1	# zeros, tmp3604
	leaq	-1(%r12), %r11	#, tmp1559
	vmovdqu64	%zmm1, (%rax,%r12,8)	# tmp3604, MEM[(__m512i_u * {ref-all})_357]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax), %zmm7	# MEM[(__m512i * {ref-all})result_310 + i_1760 * 8], _1756
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rdx), %r8d	# MEM[(__mmask8 *)_844], MEM[(__mmask8 *)_844]
	shrq	$3, %r11	#, tmp1557
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k1	# MEM[(__mmask8 *)_844], tmp3605
	vpsubq	ones(%rip), %zmm7, %zmm7{%k1}	# ones, _1756, tmp900, tmp3605, _1756
	andl	$3, %r11d	#, tmp1560
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm7, (%rax)	# tmp900, MEM[(__m512i * {ref-all})result_310 + i_1760 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm7, %k0	#, zeros, tmp900, tmp906
	kmovb	%k0, %r10d	# tmp906, tmp906
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%r10b, %r10b	# tmp906
	jne	.L2315	#,
.L1097:
# sub.c:249:         i += 8;
	movl	$8, %ecx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rdx	# ivtmp.616
	cmpq	$8, %r12	#, sub_size
	jbe	.L751	#,
	testq	%r11, %r11	# tmp1560
	je	.L750	#,
	cmpq	$1, %r11	#, tmp1560
	je	.L1627	#,
	cmpq	$2, %r11	#, tmp1560
	je	.L1628	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm3	# MEM[(__m512i * {ref-all})result_310 + i_1760 * 8], _1756
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rdx), %esi	# MEM[(__mmask8 *)_844], MEM[(__mmask8 *)_844]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k2	# MEM[(__mmask8 *)_844], tmp3865
	vpsubq	ones(%rip), %zmm3, %zmm3{%k2}	# ones, _1756, tmp2370, tmp3865, _1756
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rax,%rcx,8)	# tmp2370, MEM[(__m512i * {ref-all})result_310 + i_1760 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k3	#, zeros, tmp2370, tmp2372
	kmovb	%k3, %r9d	# tmp2372, tmp2372
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%r9b, %r9b	# tmp2372
	jne	.L2316	#,
.L1099:
# sub.c:249:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rdx	# ivtmp.616
.L1628:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm2	# MEM[(__m512i * {ref-all})result_310 + i_1760 * 8], _1756
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rdx), %edi	# MEM[(__mmask8 *)_844], MEM[(__mmask8 *)_844]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k4	# MEM[(__mmask8 *)_844], tmp3867
	vpsubq	ones(%rip), %zmm2, %zmm2{%k4}	# ones, _1756, tmp2376, tmp3867, _1756
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, (%rax,%rcx,8)	# tmp2376, MEM[(__m512i * {ref-all})result_310 + i_1760 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k5	#, zeros, tmp2376, tmp2378
	kmovb	%k5, %ebx	# tmp2378, tmp2378
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%bl, %bl	# tmp2378
	jne	.L2317	#,
.L1102:
# sub.c:249:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rdx	# ivtmp.616
.L1627:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm6	# MEM[(__m512i * {ref-all})result_310 + i_1760 * 8], _1756
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rdx), %r11d	# MEM[(__mmask8 *)_844], MEM[(__mmask8 *)_844]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r11d, %k6	# MEM[(__mmask8 *)_844], tmp3869
	vpsubq	ones(%rip), %zmm6, %zmm6{%k6}	# ones, _1756, tmp2382, tmp3869, _1756
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rax,%rcx,8)	# tmp2382, MEM[(__m512i * {ref-all})result_310 + i_1760 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k7	#, zeros, tmp2382, tmp2384
	kmovb	%k7, %r8d	# tmp2384, tmp2384
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%r8b, %r8b	# tmp2384
	jne	.L2318	#,
.L1105:
# sub.c:249:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rdx	# ivtmp.616
	cmpq	%rcx, %r12	# i, sub_size
	ja	.L750	#,
.L751:
# sub.c:1485:     asm volatile("CPUID\n\t"
#APP
# 1485 "sub.c" 1
	CPUID
	RDTSC
	mov %edx, %esi	# cycles_high
	mov %eax, %edi	# cycles_low
	
# 0 "" 2
# sub.c:1489:     asm volatile("RDTSCP\n\t"
# 1489 "sub.c" 1
	RDTSCP
	mov %edx, %esi	# cycles_high1
	mov %eax, %edi	# cycles_low1
	CPUID
	
# 0 "" 2
# sub.c:1339:             TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
#NO_APP
	movl	$1, %r8d	#, __times
	.p2align 4,,10
	.p2align 3
.L746:
# sub.c:1339:             TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
	addq	%r8, %r8	# __times
# sub.c:1501:     asm volatile("CPUID\n\t"
#APP
# 1501 "sub.c" 1
	CPUID
	RDTSC
	mov %edx, %r10d	# cycles_high
	mov %eax, %esi	# cycles_low
	
# 0 "" 2
# sub.c:1505:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
#NO_APP
	salq	$32, %r10	#, tmp913
# sub.c:1505:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	movl	%esi, %eax	# cycles_low, cycles_low
# sub.c:1505:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	orq	%rax, %r10	# cycles_low, tmp913
	movq	%r10, -66320(%rbp)	# tmp913, %sfp
	movl	%r8d, %ebx	# __times, _840
# sub.c:1339:             TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
	xorl	%r11d, %r11d	# __t
	testq	%r8, %r8	# __times
	je	.L757	#,
	.p2align 4,,10
	.p2align 3
.L756:
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %rcx	# sub_space_ptr, sub_space_ptr
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %r9	# sub_space, sub_space
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14), %rdi	# MEM[(uint64_t *)b.114_69 + j_389 * 8], tmp3610
	leaq	-1(%r12), %rdx	#, tmp1553
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%r9,%rcx,8), %rax	#, result
	andl	$7, %edx	#, tmp1555
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%rdi, (%r15)	# tmp3610, MEM[(uint64_t *)a.115_70 + j_389 * 8]
	jbe	.L2319	#,
.L855:
	movq	%r14, %rsi	# b.114_69, b
	movq	%r15, %r9	# a.115_70, a
.L754:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9), %zmm10	# MEM[(__m512i * {ref-all})a_411 + i_409 * 8], tmp3613
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %rdi	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi), %zmm10, %zmm11	# MEM[(__m512i * {ref-all})b_414 + i_409 * 8], tmp3613, tmp928
	leaq	-1(%r12), %r10	#, tmp1549
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm11, %k1	#, zeros, tmp928, tmp930
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm11, %zmm12	# tmp928, tmp928
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %rdi	# borrow_space, ivtmp.589
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm11, %zmm12{%k1}	# limb_digits, tmp928, tmp928, tmp930, tmp928
	shrq	$3, %r10	#, tmp1547
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm12, (%rax)	# tmp934, MEM[(__m512i * {ref-all})result_388 + i_409 * 8]
	andl	$3, %r10d	#, tmp1550
# sub.c:217:         i += 8;
	movl	$8, %edx	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%rdi), %rcx	#, ivtmp.598
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, (%rdi)	# tmp930, MEM[(__mmask8 *)_838]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %r12	#, sub_size
	jbe	.L1936	#,
	testq	%r10, %r10	# tmp1550
	je	.L759	#,
	cmpq	$1, %r10	#, tmp1550
	je	.L1617	#,
	cmpq	$2, %r10	#, tmp1550
	je	.L1618	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%r9), %zmm13	# MEM[(__m512i * {ref-all})a_411 + i_409 * 8], tmp3846
# sub.c:217:         i += 8;
	movl	$16, %edx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%rsi), %zmm13, %zmm14	# MEM[(__m512i * {ref-all})b_414 + i_409 * 8], tmp3846, tmp2318
# sub.c:219:     } while (likely(i < n));
	leaq	2(%rdi), %rcx	#, ivtmp.598
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k2	#, zeros, tmp2318, tmp2320
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm14, %zmm15	# tmp2318, tmp2318
	vpaddq	limb_digits(%rip), %zmm14, %zmm15{%k2}	# limb_digits, tmp2318, tmp2318, tmp2320, tmp2318
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, 64(%rax)	# tmp2322, MEM[(__m512i * {ref-all})result_388 + i_409 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, 1(%rdi)	# tmp2320, MEM[(__mmask8 *)_838]
.L1618:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9,%rdx,8), %zmm4	# MEM[(__m512i * {ref-all})a_411 + i_409 * 8], tmp3848
# sub.c:219:     } while (likely(i < n));
	incq	%rcx	# ivtmp.598
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi,%rdx,8), %zmm4, %zmm7	# MEM[(__m512i * {ref-all})b_414 + i_409 * 8], tmp3848, tmp2324
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm7, %k3	#, zeros, tmp2324, tmp2326
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm7, %zmm1	# tmp2324, tmp2324
	vpaddq	limb_digits(%rip), %zmm7, %zmm1{%k3}	# limb_digits, tmp2324, tmp2324, tmp2326, tmp2324
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rax,%rdx,8)	# tmp2328, MEM[(__m512i * {ref-all})result_388 + i_409 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rdx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, -1(%rcx)	# tmp2326, MEM[(__mmask8 *)_838]
.L1617:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9,%rdx,8), %zmm3	# MEM[(__m512i * {ref-all})a_411 + i_409 * 8], tmp3850
# sub.c:219:     } while (likely(i < n));
	incq	%rcx	# ivtmp.598
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi,%rdx,8), %zmm3, %zmm2	# MEM[(__m512i * {ref-all})b_414 + i_409 * 8], tmp3850, tmp2330
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k4	#, zeros, tmp2330, tmp2332
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm2, %zmm6	# tmp2330, tmp2330
	vpaddq	limb_digits(%rip), %zmm2, %zmm6{%k4}	# limb_digits, tmp2330, tmp2330, tmp2332, tmp2330
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rax,%rdx,8)	# tmp2334, MEM[(__m512i * {ref-all})result_388 + i_409 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rdx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, -1(%rcx)	# tmp2332, MEM[(__mmask8 *)_838]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rdx, %r12	# i, sub_size
	jbe	.L1936	#,
.L759:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9,%rdx,8), %zmm5	# MEM[(__m512i * {ref-all})a_411 + i_409 * 8], tmp3615
# sub.c:217:         i += 8;
	leaq	8(%rdx), %r10	#, tmp1551
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi,%rdx,8), %zmm5, %zmm8	# MEM[(__m512i * {ref-all})b_414 + i_409 * 8], tmp3615, tmp1763
# sub.c:219:     } while (likely(i < n));
	addq	$4, %rcx	#, ivtmp.598
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm8, %k5	#, zeros, tmp1763, tmp1765
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm8, %zmm0	# tmp1763, tmp1763
	vpaddq	limb_digits(%rip), %zmm8, %zmm0{%k5}	# limb_digits, tmp1763, tmp1763, tmp1765, tmp1763
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rax,%rdx,8)	# tmp1767, MEM[(__m512i * {ref-all})result_388 + i_409 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, -4(%rcx)	# tmp1765, MEM[(__mmask8 *)_838]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9,%r10,8), %zmm9	# MEM[(__m512i * {ref-all})a_411 + i_409 * 8], tmp3617
	vpsubq	(%rsi,%r10,8), %zmm9, %zmm10	# MEM[(__m512i * {ref-all})b_414 + i_409 * 8], tmp3617, tmp1771
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k6	#, zeros, tmp1771, tmp1773
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm10, %zmm11	# tmp1771, tmp1771
	vpaddq	limb_digits(%rip), %zmm10, %zmm11{%k6}	# limb_digits, tmp1771, tmp1771, tmp1773, tmp1771
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rax,%r10,8)	# tmp1775, MEM[(__m512i * {ref-all})result_388 + i_409 * 8]
# sub.c:217:         i += 8;
	leaq	16(%rdx), %r10	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, -3(%rcx)	# tmp1773, MEM[(__mmask8 *)_838]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9,%r10,8), %zmm12	# MEM[(__m512i * {ref-all})a_411 + i_409 * 8], tmp3619
	vpsubq	(%rsi,%r10,8), %zmm12, %zmm13	# MEM[(__m512i * {ref-all})b_414 + i_409 * 8], tmp3619, tmp1779
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k7	#, zeros, tmp1779, tmp1781
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm13, %zmm14	# tmp1779, tmp1779
	vpaddq	limb_digits(%rip), %zmm13, %zmm14{%k7}	# limb_digits, tmp1779, tmp1779, tmp1781, tmp1779
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rax,%r10,8)	# tmp1783, MEM[(__m512i * {ref-all})result_388 + i_409 * 8]
# sub.c:217:         i += 8;
	leaq	24(%rdx), %r10	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, -2(%rcx)	# tmp1781, MEM[(__mmask8 *)_838]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9,%r10,8), %zmm15	# MEM[(__m512i * {ref-all})a_411 + i_409 * 8], tmp3621
# sub.c:217:         i += 8;
	addq	$32, %rdx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi,%r10,8), %zmm15, %zmm4	# MEM[(__m512i * {ref-all})b_414 + i_409 * 8], tmp3621, tmp1787
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm4, %k1	#, zeros, tmp1787, tmp1789
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm4, %zmm7	# tmp1787, tmp1787
	vpaddq	limb_digits(%rip), %zmm4, %zmm7{%k1}	# limb_digits, tmp1787, tmp1787, tmp1789, tmp1787
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm7, (%rax,%r10,8)	# tmp1791, MEM[(__m512i * {ref-all})result_388 + i_409 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, -1(%rcx)	# tmp1789, MEM[(__mmask8 *)_838]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rdx, %r12	# i, sub_size
	ja	.L759	#,
.L1936:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm1	# zeros, tmp3623
	leaq	-1(%r12), %rsi	#, tmp1543
	vmovdqu64	%zmm1, (%rax,%r13)	# tmp3623, MEM[(__m512i_u * {ref-all})_435]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax), %zmm3	# MEM[(__m512i * {ref-all})result_388 + i_1780 * 8], _1776
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rdi), %r9d	# MEM[(__mmask8 *)_1070], MEM[(__mmask8 *)_1070]
	shrq	$3, %rsi	#, tmp1541
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k2	# MEM[(__mmask8 *)_1070], tmp3624
	vpsubq	ones(%rip), %zmm3, %zmm3{%k2}	# ones, _1776, tmp940, tmp3624, _1776
	andl	$3, %esi	#, tmp1544
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rax)	# tmp940, MEM[(__m512i * {ref-all})result_388 + i_1780 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k0	#, zeros, tmp940, tmp946
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp946
	jne	.L2320	#,
.L1033:
# sub.c:249:         i += 8;
	movl	$8, %edx	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rdi), %rcx	#, ivtmp.589
	cmpq	$8, %r12	#, sub_size
	jbe	.L762	#,
	testq	%rsi, %rsi	# tmp1544
	je	.L761	#,
	cmpq	$1, %rsi	#, tmp1544
	je	.L1615	#,
	cmpq	$2, %rsi	#, tmp1544
	je	.L1616	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	64(%rax), %zmm2	# MEM[(__m512i * {ref-all})result_388 + i_1780 * 8], _1776
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rdi), %r10d	# MEM[(__mmask8 *)_1070], MEM[(__mmask8 *)_1070]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r10d, %k3	# MEM[(__mmask8 *)_1070], tmp3841
	vpsubq	ones(%rip), %zmm2, %zmm2{%k3}	# ones, _1776, tmp2286, tmp3841, _1776
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, 64(%rax)	# tmp2286, MEM[(__m512i * {ref-all})result_388 + i_1780 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k4	#, zeros, tmp2286, tmp2288
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k4, %k4	# tmp2288
	jne	.L2321	#,
.L1035:
# sub.c:249:         i += 8;
	addq	$8, %rdx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.589
.L1616:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm6	# MEM[(__m512i * {ref-all})result_388 + i_1780 * 8], _1776
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %edi	# MEM[(__mmask8 *)_1070], MEM[(__mmask8 *)_1070]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k5	# MEM[(__mmask8 *)_1070], tmp3842
	vpsubq	ones(%rip), %zmm6, %zmm6{%k5}	# ones, _1776, tmp2292, tmp3842, _1776
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rax,%rdx,8)	# tmp2292, MEM[(__m512i * {ref-all})result_388 + i_1780 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k6	#, zeros, tmp2292, tmp2294
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k6, %k6	# tmp2294
	jne	.L2322	#,
.L1038:
# sub.c:249:         i += 8;
	addq	$8, %rdx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.589
.L1615:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm5	# MEM[(__m512i * {ref-all})result_388 + i_1780 * 8], _1776
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %esi	# MEM[(__mmask8 *)_1070], MEM[(__mmask8 *)_1070]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k7	# MEM[(__mmask8 *)_1070], tmp3843
	vpsubq	ones(%rip), %zmm5, %zmm5{%k7}	# ones, _1776, tmp2298, tmp3843, _1776
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, (%rax,%rdx,8)	# tmp2298, MEM[(__m512i * {ref-all})result_388 + i_1780 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k1	#, zeros, tmp2298, tmp2300
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k1, %k1	# tmp2300
	jne	.L2323	#,
.L1041:
# sub.c:249:         i += 8;
	addq	$8, %rdx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.589
	cmpq	%rdx, %r12	# i, sub_size
	ja	.L761	#,
	jmp	.L762	#
	.p2align 4,,10
	.p2align 3
.L760:
# sub.c:249:         i += 8;
	addq	$8, %rdx	#, tmp1545
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm0	# MEM[(__m512i * {ref-all})result_388 + i_1780 * 8], _1776
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rcx), %edi	# MEM[(__mmask8 *)_1070], MEM[(__mmask8 *)_1070]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rcx), %r10	#, tmp1546
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k3	# MEM[(__mmask8 *)_1070], tmp3626
	vpsubq	ones(%rip), %zmm0, %zmm0{%k3}	# ones, _1776, tmp1805, tmp3626, _1776
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rax,%rdx,8)	# tmp1805, MEM[(__m512i * {ref-all})result_388 + i_1780 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k4	#, zeros, tmp1805, tmp1807
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k4, %k4	# tmp1807
	jne	.L2324	#,
.L1044:
# sub.c:249:         i += 8;
	leaq	8(%rdx), %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm9	# MEM[(__m512i * {ref-all})result_388 + i_1780 * 8], _1776
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%r10), %esi	# MEM[(__mmask8 *)_1070], MEM[(__mmask8 *)_1070]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k5	# MEM[(__mmask8 *)_1070], tmp3844
	vpsubq	ones(%rip), %zmm9, %zmm9{%k5}	# ones, _1776, tmp2306, tmp3844, _1776
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rax,%rcx,8)	# tmp2306, MEM[(__m512i * {ref-all})result_388 + i_1780 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k6	#, zeros, tmp2306, tmp2308
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k6, %k6	# tmp2308
	jne	.L2325	#,
.L1046:
# sub.c:249:         i += 8;
	leaq	16(%rdx), %r9	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r9,8), %zmm10	# MEM[(__m512i * {ref-all})result_388 + i_1780 * 8], _1776
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%r10), %edi	# MEM[(__mmask8 *)_1070], MEM[(__mmask8 *)_1070]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k7	# MEM[(__mmask8 *)_1070], tmp3845
	vpsubq	ones(%rip), %zmm10, %zmm10{%k7}	# ones, _1776, tmp2314, tmp3845, _1776
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, (%rax,%r9,8)	# tmp2314, MEM[(__m512i * {ref-all})result_388 + i_1780 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k1	#, zeros, tmp2314, tmp2316
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k1, %k1	# tmp2316
	jne	.L2326	#,
.L1048:
# sub.c:249:         i += 8;
	addq	$24, %rdx	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%r10), %rcx	#, ivtmp.589
	cmpq	%rdx, %r12	# i, sub_size
	jbe	.L762	#,
.L761:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm8	# MEM[(__m512i * {ref-all})result_388 + i_1780 * 8], _1776
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %r9d	# MEM[(__mmask8 *)_1070], MEM[(__mmask8 *)_1070]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k2	# MEM[(__mmask8 *)_1070], tmp3625
	vpsubq	ones(%rip), %zmm8, %zmm8{%k2}	# ones, _1776, tmp1797, tmp3625, _1776
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rax,%rdx,8)	# tmp1797, MEM[(__m512i * {ref-all})result_388 + i_1780 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm8, %k0	#, zeros, tmp1797, tmp1799
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp1799
	je	.L760	#,
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rcx)	# tmp1799, MEM[(__mmask8 *)_1070]
	jmp	.L760	#
.L719:
# sub.c:1031:     switch (test_case)
	cmpl	$3, %ebx	#, test_case
	jne	.L716	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC35(%rip), %rsi	#, tmp1412
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1481
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC36(%rip), %r8	#,
	movl	$1, %edx	#,
	movl	$100, %ecx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1481,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %edx	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%rdx	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-65824(%rbp), %r13	#, tmp1482
	leaq	.LC82(%rip), %r8	#,
	jmp	.L2292	#
.L2309:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC53(%rip), %rdi	#, tmp745
	call	puts@PLT	#
# sub.c:1005:         create_directory("experiments/results/rdtsc_measurements");
	leaq	.LC54(%rip), %rdi	#, tmp746
	call	create_directory	#
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	sub_space(%rip), %rdi	# sub_space,
	movl	$1073741824, %edx	#,
	xorl	%esi, %esi	#
	call	memset@PLT	#
	movq	borrow_space(%rip), %rdi	# borrow_space,
	movl	$1073741824, %edx	#,
	xorl	%esi, %esi	#
# sub.c:1021:     sub_space_ptr = 0;
	movl	$0, sub_space_ptr(%rip)	#, sub_space_ptr
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	call	memset@PLT	#
# sub.c:1024:     borrow_space_ptr = 0;
	movl	$0, borrow_space_ptr(%rip)	#, borrow_space_ptr
# sub.c:1031:     switch (test_case)
	cmpl	$2, %ebx	#, test_case
	je	.L712	#,
	jg	.L713	#,
	testl	%ebx, %ebx	# test_case
	je	.L714	#,
	cmpl	$1, %ebx	#, test_case
	jne	.L716	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC31(%rip), %rsi	#, tmp1382
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1481
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC32(%rip), %r8	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1481,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %eax	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%rax	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-66048(%rbp), %r13	#, tmp1480
	leaq	.LC79(%rip), %r8	#,
.L2288:
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r13, %rdi	# tmp1480,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
# sub.c:736:     gzFile file = gzopen(filename, mode);
	leaq	.LC76(%rip), %rsi	#, tmp1409
	movq	%r13, %rdi	# tmp1480,
	call	gzopen@PLT	#
# sub.c:737:     if (file == NULL)
	popq	%r8	#
# sub.c:736:     gzFile file = gzopen(filename, mode);
	movq	%rax, -66344(%rbp)	# file, %sfp
# sub.c:737:     if (file == NULL)
	popq	%r9	#
	testq	%rax, %rax	# file
	jne	.L848	#,
.L847:
	movq	%r13, %rdi	# tmp1474,
	call	open_gzfile.part.0	#
	.p2align 4,,10
	.p2align 3
.L713:
# sub.c:1031:     switch (test_case)
	cmpl	$3, %ebx	#, test_case
	jne	.L716	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC35(%rip), %rsi	#, tmp1392
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1481
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC36(%rip), %r8	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1481,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %r11d	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%r11	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-66048(%rbp), %r13	#, tmp1480
	leaq	.LC80(%rip), %r8	#,
	jmp	.L2288	#
.L710:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC57(%rip), %rdi	#, tmp769
	call	puts@PLT	#
# sub.c:1013:         create_directory("experiments/results/cputime_measurements");
	leaq	.LC58(%rip), %rdi	#, tmp770
	call	create_directory	#
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	sub_space(%rip), %rdi	# sub_space,
	movl	$1073741824, %edx	#,
	xorl	%esi, %esi	#
	call	memset@PLT	#
	movq	borrow_space(%rip), %rdi	# borrow_space,
	movl	$1073741824, %edx	#,
	xorl	%esi, %esi	#
# sub.c:1021:     sub_space_ptr = 0;
	movl	$0, sub_space_ptr(%rip)	#, sub_space_ptr
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	call	memset@PLT	#
# sub.c:1024:     borrow_space_ptr = 0;
	movl	$0, borrow_space_ptr(%rip)	#, borrow_space_ptr
# sub.c:1031:     switch (test_case)
	cmpl	$1, %ebx	#, test_case
	je	.L723	#,
	jle	.L2327	#,
	cmpl	$2, %ebx	#, test_case
	je	.L726	#,
	cmpl	$3, %ebx	#, test_case
	jne	.L716	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC35(%rip), %rsi	#, tmp1422
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1481
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC36(%rip), %r8	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1481,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %r9d	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%r9	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-65712(%rbp), %r13	#, tmp1474
	leaq	.LC83(%rip), %r8	#,
.L2297:
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r13, %rdi	# tmp1474,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
# sub.c:736:     gzFile file = gzopen(filename, mode);
	leaq	.LC76(%rip), %rsi	#, tmp1469
	movq	%r13, %rdi	# tmp1474,
	call	gzopen@PLT	#
# sub.c:737:     if (file == NULL)
	popq	%rdx	#
# sub.c:736:     gzFile file = gzopen(filename, mode);
	movq	%rax, -66336(%rbp)	# file, %sfp
# sub.c:737:     if (file == NULL)
	popq	%rcx	#
	testq	%rax, %rax	# file
	jne	.L848	#,
	jmp	.L847	#
	.p2align 4,,10
	.p2align 3
.L2327:
# sub.c:1031:     switch (test_case)
	testl	%ebx, %ebx	# test_case
	jne	.L716	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC29(%rip), %rsi	#, tmp1352
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1481
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC30(%rip), %r8	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1481,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %r14d	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%r14	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-65712(%rbp), %r13	#, tmp1474
	leaq	.LC75(%rip), %r8	#,
	jmp	.L2297	#
.L2311:
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movl	$65536, %edx	#,
	xorl	%esi, %esi	#
	movq	%r12, %rdi	# tmp1475,
	call	memset@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	movq	-66312(%rbp), %rdi	# %sfp,
	movl	$65536, %edx	#,
	movq	%r12, %rsi	# tmp1475,
	call	gzgets@PLT	#
# sub.c:1207:         for (int j = 0; j < i; ++j)
	movl	$1, %r15d	#, j
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp3001
	jne	.L1585	#,
.L1925:
# sub.c:1213:                 if (gzeof(test_file))
	movq	-66312(%rbp), %rdi	# %sfp,
	call	gzeof@PLT	#
# sub.c:1213:                 if (gzeof(test_file))
	testl	%eax, %eax	# tmp2985
	je	.L2328	#,
.L708:
# sub.c:1474: }
	movq	-56(%rbp), %rax	# D.41319, tmp3245
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp3245
	jne	.L2329	#,
	leaq	-48(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%rsi	#
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	leaq	-8(%rsi), %rsp	#,
	.cfi_def_cfa 7, 8
	ret	
.L740:
	.cfi_restore_state
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC62(%rip), %rdi	#, tmp1172
	call	puts@PLT	#
# sub.c:1408:             fflush(stdout);
	movq	stdout(%rip), %rdi	# stdout,
	call	fflush@PLT	#
# sub.c:1409:             __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);
	xorl	%eax, %eax	# tmp1174
#APP
# 1409 "sub.c" 1
	cpuid
		
# 0 "" 2
# sub.c:1410:             TIME_RUSAGE(time_taken, limb_sub_n(a, b, &sub, n));
#NO_APP
	movq	-66224(%rbp), %r14	# b, b.130_105
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %rsi	# sub_space_ptr, sub_space_ptr
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %r9	# sub_space, sub_space
# sub.c:1410:             TIME_RUSAGE(time_taken, limb_sub_n(a, b, &sub, n));
	movq	-66288(%rbp), %r15	# a, a.131_106
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14), %rcx	# MEM[(uint64_t *)b.130_105 + j_788 * 8], tmp3737
	leaq	-1(%r12), %rdi	#, tmp1618
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%r9,%rsi,8), %rdx	#, result
	andl	$7, %edi	#, tmp1620
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%rcx, (%r15)	# tmp3737, MEM[(uint64_t *)a.131_106 + j_788 * 8]
	jbe	.L2330	#,
.L869:
	movq	%r14, %r10	# b.130_105, b
	movq	%r15, %rdi	# a.131_106, a
.L814:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi), %zmm14	# MEM[(__m512i * {ref-all})a_810 + i_808 * 8], tmp3741
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %rcx	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r10), %zmm14, %zmm15	# MEM[(__m512i * {ref-all})b_813 + i_808 * 8], tmp3741, tmp1206
	leaq	-1(%r12), %r9	#, tmp1614
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k4	#, zeros, tmp1206, tmp1208
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm15, %zmm4	# tmp1206, tmp1206
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %rcx	# borrow_space, ivtmp.537
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm15, %zmm4{%k4}	# limb_digits, tmp1206, tmp1206, tmp1208, tmp1206
	shrq	$3, %r9	#, tmp1612
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm4, (%rdx)	# tmp1212, MEM[(__m512i * {ref-all})result_787 + i_808 * 8]
	andl	$3, %r9d	#, tmp1615
# sub.c:217:         i += 8;
	movl	$8, %r11d	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%rcx), %r8	#, ivtmp.546
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, (%rcx)	# tmp1208, MEM[(__mmask8 *)_920]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %r12	#, sub_size
	jbe	.L1965	#,
	testq	%r9, %r9	# tmp1615
	je	.L818	#,
	cmpq	$1, %r9	#, tmp1615
	je	.L1665	#,
	cmpq	$2, %r9	#, tmp1615
	jne	.L2331	#,
.L1666:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%r11,8), %zmm2	# MEM[(__m512i * {ref-all})a_810 + i_808 * 8], tmp3950
# sub.c:219:     } while (likely(i < n));
	incq	%r8	# ivtmp.546
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r10,%r11,8), %zmm2, %zmm5	# MEM[(__m512i * {ref-all})b_813 + i_808 * 8], tmp3950, tmp2666
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k6	#, zeros, tmp2666, tmp2668
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm5, %zmm6	# tmp2666, tmp2666
	vpaddq	limb_digits(%rip), %zmm5, %zmm6{%k6}	# limb_digits, tmp2666, tmp2666, tmp2668, tmp2666
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rdx,%r11,8)	# tmp2670, MEM[(__m512i * {ref-all})result_787 + i_808 * 8]
# sub.c:217:         i += 8;
	addq	$8, %r11	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, -1(%r8)	# tmp2668, MEM[(__mmask8 *)_920]
.L1665:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%r11,8), %zmm8	# MEM[(__m512i * {ref-all})a_810 + i_808 * 8], tmp3952
# sub.c:219:     } while (likely(i < n));
	incq	%r8	# ivtmp.546
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r10,%r11,8), %zmm8, %zmm9	# MEM[(__m512i * {ref-all})b_813 + i_808 * 8], tmp3952, tmp2672
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k7	#, zeros, tmp2672, tmp2674
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm9, %zmm10	# tmp2672, tmp2672
	vpaddq	limb_digits(%rip), %zmm9, %zmm10{%k7}	# limb_digits, tmp2672, tmp2672, tmp2674, tmp2672
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, (%rdx,%r11,8)	# tmp2676, MEM[(__m512i * {ref-all})result_787 + i_808 * 8]
# sub.c:217:         i += 8;
	addq	$8, %r11	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, -1(%r8)	# tmp2674, MEM[(__mmask8 *)_920]
# sub.c:219:     } while (likely(i < n));
	cmpq	%r11, %r12	# i, sub_size
	jbe	.L1965	#,
.L818:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%r11,8), %zmm11	# MEM[(__m512i * {ref-all})a_810 + i_808 * 8], tmp3743
# sub.c:217:         i += 8;
	leaq	8(%r11), %rsi	#, tmp1616
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r10,%r11,8), %zmm11, %zmm12	# MEM[(__m512i * {ref-all})b_813 + i_808 * 8], tmp3743, tmp2038
# sub.c:217:         i += 8;
	leaq	16(%r11), %rbx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k1	#, zeros, tmp2038, tmp2040
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm12, %zmm13	# tmp2038, tmp2038
# sub.c:217:         i += 8;
	leaq	24(%r11), %rax	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm12, %zmm13{%k1}	# limb_digits, tmp2038, tmp2038, tmp2040, tmp2038
# sub.c:219:     } while (likely(i < n));
	addq	$4, %r8	#, ivtmp.546
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rdx,%r11,8)	# tmp2042, MEM[(__m512i * {ref-all})result_787 + i_808 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, -4(%r8)	# tmp2040, MEM[(__mmask8 *)_920]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%rsi,8), %zmm0	# MEM[(__m512i * {ref-all})a_810 + i_808 * 8], tmp3745
# sub.c:217:         i += 8;
	addq	$32, %r11	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r10,%rsi,8), %zmm0, %zmm14	# MEM[(__m512i * {ref-all})b_813 + i_808 * 8], tmp3745, tmp2046
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k2	#, zeros, tmp2046, tmp2048
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm14, %zmm15	# tmp2046, tmp2046
	vpaddq	limb_digits(%rip), %zmm14, %zmm15{%k2}	# limb_digits, tmp2046, tmp2046, tmp2048, tmp2046
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, (%rdx,%rsi,8)	# tmp2050, MEM[(__m512i * {ref-all})result_787 + i_808 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, -3(%r8)	# tmp2048, MEM[(__mmask8 *)_920]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%rbx,8), %zmm4	# MEM[(__m512i * {ref-all})a_810 + i_808 * 8], tmp3747
	vpsubq	(%r10,%rbx,8), %zmm4, %zmm7	# MEM[(__m512i * {ref-all})b_813 + i_808 * 8], tmp3747, tmp2054
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm7, %k3	#, zeros, tmp2054, tmp2056
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm7, %zmm3	# tmp2054, tmp2054
	vpaddq	limb_digits(%rip), %zmm7, %zmm3{%k3}	# limb_digits, tmp2054, tmp2054, tmp2056, tmp2054
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rdx,%rbx,8)	# tmp2058, MEM[(__m512i * {ref-all})result_787 + i_808 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, -2(%r8)	# tmp2056, MEM[(__mmask8 *)_920]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%rax,8), %zmm1	# MEM[(__m512i * {ref-all})a_810 + i_808 * 8], tmp3749
	vpsubq	(%r10,%rax,8), %zmm1, %zmm2	# MEM[(__m512i * {ref-all})b_813 + i_808 * 8], tmp3749, tmp2062
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k4	#, zeros, tmp2062, tmp2064
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm2, %zmm5	# tmp2062, tmp2062
	vpaddq	limb_digits(%rip), %zmm2, %zmm5{%k4}	# limb_digits, tmp2062, tmp2062, tmp2064, tmp2062
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, (%rdx,%rax,8)	# tmp2066, MEM[(__m512i * {ref-all})result_787 + i_808 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, -1(%r8)	# tmp2064, MEM[(__mmask8 *)_920]
# sub.c:219:     } while (likely(i < n));
	cmpq	%r11, %r12	# i, sub_size
	ja	.L818	#,
.L1965:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm6	# zeros, tmp3751
	leaq	-1(%r12), %r10	#, tmp1608
	vmovdqu64	%zmm6, (%rdx,%r12,8)	# tmp3751, MEM[(__m512i_u * {ref-all})_834]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx), %zmm8	# MEM[(__m512i * {ref-all})result_787 + i_1820 * 8], _1816
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %edi	# MEM[(__mmask8 *)_1164], MEM[(__mmask8 *)_1164]
	shrq	$3, %r10	#, tmp1606
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k5	# MEM[(__mmask8 *)_1164], tmp3752
	vpsubq	ones(%rip), %zmm8, %zmm8{%k5}	# ones, _1816, tmp1218, tmp3752, _1816
	andl	$3, %r10d	#, tmp1609
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rdx)	# tmp1218, MEM[(__m512i * {ref-all})result_787 + i_1820 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm8, %k0	#, zeros, tmp1218, tmp1224
	kmovb	%k0, %r9d	# tmp1224, tmp1224
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%r9b, %r9b	# tmp1224
	jne	.L2332	#,
.L1290:
# sub.c:249:         i += 8;
	movl	$8, %r11d	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.537
	cmpq	$8, %r12	#, sub_size
	jbe	.L2280	#,
	testq	%r10, %r10	# tmp1609
	je	.L820	#,
	cmpq	$1, %r10	#, tmp1609
	je	.L1663	#,
	cmpq	$2, %r10	#, tmp1609
	je	.L1664	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%r11,8), %zmm9	# MEM[(__m512i * {ref-all})result_787 + i_1820 * 8], _1816
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %r8d	# MEM[(__mmask8 *)_1164], MEM[(__mmask8 *)_1164]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k6	# MEM[(__mmask8 *)_1164], tmp3940
	vpsubq	ones(%rip), %zmm9, %zmm9{%k6}	# ones, _1816, tmp2628, tmp3940, _1816
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rdx,%r11,8)	# tmp2628, MEM[(__m512i * {ref-all})result_787 + i_1820 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k7	#, zeros, tmp2628, tmp2630
	kmovb	%k7, %esi	# tmp2630, tmp2630
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%sil, %sil	# tmp2630
	jne	.L2333	#,
.L1292:
# sub.c:249:         i += 8;
	addq	$8, %r11	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.537
.L1664:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%r11,8), %zmm10	# MEM[(__m512i * {ref-all})result_787 + i_1820 * 8], _1816
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %ebx	# MEM[(__mmask8 *)_1164], MEM[(__mmask8 *)_1164]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ebx, %k1	# MEM[(__mmask8 *)_1164], tmp3942
	vpsubq	ones(%rip), %zmm10, %zmm10{%k1}	# ones, _1816, tmp2634, tmp3942, _1816
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, (%rdx,%r11,8)	# tmp2634, MEM[(__m512i * {ref-all})result_787 + i_1820 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k2	#, zeros, tmp2634, tmp2636
	kmovb	%k2, %eax	# tmp2636, tmp2636
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%al, %al	# tmp2636
	jne	.L2334	#,
.L1295:
# sub.c:249:         i += 8;
	addq	$8, %r11	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.537
.L1663:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%r11,8), %zmm11	# MEM[(__m512i * {ref-all})result_787 + i_1820 * 8], _1816
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %r10d	# MEM[(__mmask8 *)_1164], MEM[(__mmask8 *)_1164]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r10d, %k3	# MEM[(__mmask8 *)_1164], tmp3944
	vpsubq	ones(%rip), %zmm11, %zmm11{%k3}	# ones, _1816, tmp2640, tmp3944, _1816
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rdx,%r11,8)	# tmp2640, MEM[(__m512i * {ref-all})result_787 + i_1820 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm11, %k4	#, zeros, tmp2640, tmp2642
	kmovb	%k4, %edi	# tmp2642, tmp2642
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%dil, %dil	# tmp2642
	jne	.L2335	#,
.L1298:
# sub.c:249:         i += 8;
	addq	$8, %r11	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.537
	cmpq	%r11, %r12	# i, sub_size
	ja	.L820	#,
.L2280:
	vzeroupper
.L821:
	leaq	-66192(%rbp), %r11	#, tmp2032
	movq	%r11, -66320(%rbp)	# tmp2032, %sfp
# sub.c:229:     i = 0;
	movl	$1, %edx	#, __times
	movq	%r13, %rbx	# _63, _63
	movq	%rdx, %r13	# __times, __times
	.p2align 4,,10
	.p2align 3
.L816:
# sub.c:1553:     getrusage(RUSAGE_SELF, &rus);
	movq	-66320(%rbp), %rsi	# %sfp,
	xorl	%edi, %edi	#
	call	getrusage@PLT	#
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	movq	-66184(%rbp), %r8	# MEM[(struct rusage *)_1655].ru_utime.tv_usec, MEM[(struct rusage *)_1655].ru_utime.tv_usec
	movabsq	$2361183241434822607, %rax	#, tmp3241
	imulq	%r8	# MEM[(struct rusage *)_1655].ru_utime.tv_usec
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	imull	$1000, -66192(%rbp), %r9d	#, MEM[(struct rusage *)_1655].ru_utime.tv_sec, tmp1230
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	sarq	$63, %r8	#, tmp1236
	sarq	$7, %rdx	#, tmp1235
	subq	%r8, %rdx	# tmp1236, tmp1231
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	addl	%edx, %r9d	# tmp1231, _863
# sub.c:1410:             TIME_RUSAGE(time_taken, limb_sub_n(a, b, &sub, n));
	movslq	%r9d, %rsi	# _863, __t0
	addq	%r13, %r13	# __times
	movq	%rsi, -66328(%rbp)	# __t0, %sfp
	xorl	%r11d, %r11d	# __t
	testq	%r13, %r13	# __times
	jle	.L826	#,
	.p2align 4,,10
	.p2align 3
.L822:
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %r10	# sub_space_ptr, sub_space_ptr
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %rcx	# sub_space, sub_space
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14), %rdi	# MEM[(uint64_t *)b.130_105 + j_869 * 8], tmp3759
	leaq	-1(%r12), %r9	#, tmp1602
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%rcx,%r10,8), %rax	#, result
	andl	$7, %r9d	#, tmp1604
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%rdi, (%r15)	# tmp3759, MEM[(uint64_t *)a.131_106 + j_869 * 8]
	jbe	.L2336	#,
.L872:
	movq	%r14, %r10	# b.130_105, b
	movq	%r15, %rsi	# a.131_106, a
.L824:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rsi), %zmm15	# MEM[(__m512i * {ref-all})a_891 + i_889 * 8], tmp3762
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %r8	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r10), %zmm15, %zmm4	# MEM[(__m512i * {ref-all})b_894 + i_889 * 8], tmp3762, tmp1254
	leaq	-1(%r12), %r9	#, tmp1598
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm4, %k5	#, zeros, tmp1254, tmp1256
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm4, %zmm7	# tmp1254, tmp1254
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %r8	# borrow_space, ivtmp.511
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm4, %zmm7{%k5}	# limb_digits, tmp1254, tmp1254, tmp1256, tmp1254
	shrq	$3, %r9	#, tmp1596
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm7, (%rax)	# tmp1260, MEM[(__m512i * {ref-all})result_868 + i_889 * 8]
	andl	$3, %r9d	#, tmp1599
# sub.c:217:         i += 8;
	movl	$8, %edi	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%r8), %rdx	#, ivtmp.520
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, (%r8)	# tmp1256, MEM[(__mmask8 *)_1163]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %r12	#, sub_size
	jbe	.L1971	#,
	testq	%r9, %r9	# tmp1599
	je	.L828	#,
	cmpq	$1, %r9	#, tmp1599
	je	.L1653	#,
	cmpq	$2, %r9	#, tmp1599
	je	.L1654	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%rsi), %zmm3	# MEM[(__m512i * {ref-all})a_891 + i_889 * 8], tmp3921
# sub.c:217:         i += 8;
	movl	$16, %edi	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%r10), %zmm3, %zmm2	# MEM[(__m512i * {ref-all})b_894 + i_889 * 8], tmp3921, tmp2576
# sub.c:219:     } while (likely(i < n));
	leaq	2(%r8), %rdx	#, ivtmp.520
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k6	#, zeros, tmp2576, tmp2578
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm2, %zmm1	# tmp2576, tmp2576
	vpaddq	limb_digits(%rip), %zmm2, %zmm1{%k6}	# limb_digits, tmp2576, tmp2576, tmp2578, tmp2576
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, 64(%rax)	# tmp2580, MEM[(__m512i * {ref-all})result_868 + i_889 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, 1(%r8)	# tmp2578, MEM[(__mmask8 *)_1163]
.L1654:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rsi,%rdi,8), %zmm5	# MEM[(__m512i * {ref-all})a_891 + i_889 * 8], tmp3923
# sub.c:219:     } while (likely(i < n));
	incq	%rdx	# ivtmp.520
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r10,%rdi,8), %zmm5, %zmm6	# MEM[(__m512i * {ref-all})b_894 + i_889 * 8], tmp3923, tmp2582
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k7	#, zeros, tmp2582, tmp2584
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm6, %zmm8	# tmp2582, tmp2582
	vpaddq	limb_digits(%rip), %zmm6, %zmm8{%k7}	# limb_digits, tmp2582, tmp2582, tmp2584, tmp2582
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rax,%rdi,8)	# tmp2586, MEM[(__m512i * {ref-all})result_868 + i_889 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rdi	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, -1(%rdx)	# tmp2584, MEM[(__mmask8 *)_1163]
.L1653:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rsi,%rdi,8), %zmm9	# MEM[(__m512i * {ref-all})a_891 + i_889 * 8], tmp3925
# sub.c:219:     } while (likely(i < n));
	incq	%rdx	# ivtmp.520
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r10,%rdi,8), %zmm9, %zmm10	# MEM[(__m512i * {ref-all})b_894 + i_889 * 8], tmp3925, tmp2588
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k1	#, zeros, tmp2588, tmp2590
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm10, %zmm11	# tmp2588, tmp2588
	vpaddq	limb_digits(%rip), %zmm10, %zmm11{%k1}	# limb_digits, tmp2588, tmp2588, tmp2590, tmp2588
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rax,%rdi,8)	# tmp2592, MEM[(__m512i * {ref-all})result_868 + i_889 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rdi	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, -1(%rdx)	# tmp2590, MEM[(__mmask8 *)_1163]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rdi, %r12	# i, sub_size
	jbe	.L1971	#,
.L828:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rsi,%rdi,8), %zmm12	# MEM[(__m512i * {ref-all})a_891 + i_889 * 8], tmp3764
# sub.c:217:         i += 8;
	leaq	8(%rdi), %rcx	#, tmp1600
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r10,%rdi,8), %zmm12, %zmm13	# MEM[(__m512i * {ref-all})b_894 + i_889 * 8], tmp3764, tmp2092
# sub.c:217:         i += 8;
	leaq	16(%rdi), %r9	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k2	#, zeros, tmp2092, tmp2094
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm13, %zmm0	# tmp2092, tmp2092
# sub.c:219:     } while (likely(i < n));
	addq	$4, %rdx	#, ivtmp.520
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm13, %zmm0{%k2}	# limb_digits, tmp2092, tmp2092, tmp2094, tmp2092
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rax,%rdi,8)	# tmp2096, MEM[(__m512i * {ref-all})result_868 + i_889 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, -4(%rdx)	# tmp2094, MEM[(__mmask8 *)_1163]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rsi,%rcx,8), %zmm14	# MEM[(__m512i * {ref-all})a_891 + i_889 * 8], tmp3766
	vpsubq	(%r10,%rcx,8), %zmm14, %zmm15	# MEM[(__m512i * {ref-all})b_894 + i_889 * 8], tmp3766, tmp2100
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k3	#, zeros, tmp2100, tmp2102
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm15, %zmm4	# tmp2100, tmp2100
	vpaddq	limb_digits(%rip), %zmm15, %zmm4{%k3}	# limb_digits, tmp2100, tmp2100, tmp2102, tmp2100
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm4, (%rax,%rcx,8)	# tmp2104, MEM[(__m512i * {ref-all})result_868 + i_889 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, -3(%rdx)	# tmp2102, MEM[(__mmask8 *)_1163]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rsi,%r9,8), %zmm7	# MEM[(__m512i * {ref-all})a_891 + i_889 * 8], tmp3768
# sub.c:217:         i += 8;
	leaq	24(%rdi), %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r10,%r9,8), %zmm7, %zmm3	# MEM[(__m512i * {ref-all})b_894 + i_889 * 8], tmp3768, tmp2108
# sub.c:217:         i += 8;
	addq	$32, %rdi	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k4	#, zeros, tmp2108, tmp2110
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm3, %zmm2	# tmp2108, tmp2108
	vpaddq	limb_digits(%rip), %zmm3, %zmm2{%k4}	# limb_digits, tmp2108, tmp2108, tmp2110, tmp2108
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, (%rax,%r9,8)	# tmp2112, MEM[(__m512i * {ref-all})result_868 + i_889 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, -2(%rdx)	# tmp2110, MEM[(__mmask8 *)_1163]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rsi,%rcx,8), %zmm1	# MEM[(__m512i * {ref-all})a_891 + i_889 * 8], tmp3770
	vpsubq	(%r10,%rcx,8), %zmm1, %zmm5	# MEM[(__m512i * {ref-all})b_894 + i_889 * 8], tmp3770, tmp2116
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k5	#, zeros, tmp2116, tmp2118
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm5, %zmm6	# tmp2116, tmp2116
	vpaddq	limb_digits(%rip), %zmm5, %zmm6{%k5}	# limb_digits, tmp2116, tmp2116, tmp2118, tmp2116
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rax,%rcx,8)	# tmp2120, MEM[(__m512i * {ref-all})result_868 + i_889 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, -1(%rdx)	# tmp2118, MEM[(__mmask8 *)_1163]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rdi, %r12	# i, sub_size
	ja	.L828	#,
.L1971:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm8	# zeros, tmp3772
	leaq	-1(%r12), %r10	#, tmp1592
	vmovdqu64	%zmm8, (%rax,%rbx)	# tmp3772, MEM[(__m512i_u * {ref-all})_915]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax), %zmm9	# MEM[(__m512i * {ref-all})result_868 + i_1840 * 8], _1836
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%r8), %esi	# MEM[(__mmask8 *)_1009], MEM[(__mmask8 *)_1009]
	shrq	$3, %r10	#, tmp1590
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k6	# MEM[(__mmask8 *)_1009], tmp3773
	vpsubq	ones(%rip), %zmm9, %zmm9{%k6}	# ones, _1836, tmp1266, tmp3773, _1836
	andl	$3, %r10d	#, tmp1593
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rax)	# tmp1266, MEM[(__m512i * {ref-all})result_868 + i_1840 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k0	#, zeros, tmp1266, tmp1272
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp1272
	jne	.L2337	#,
.L1226:
# sub.c:249:         i += 8;
	movl	$8, %edx	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	1(%r8), %rcx	#, ivtmp.511
	cmpq	$8, %r12	#, sub_size
	jbe	.L831	#,
	testq	%r10, %r10	# tmp1593
	je	.L830	#,
	cmpq	$1, %r10	#, tmp1593
	je	.L1651	#,
	cmpq	$2, %r10	#, tmp1593
	je	.L1652	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	64(%rax), %zmm10	# MEM[(__m512i * {ref-all})result_868 + i_1840 * 8], _1836
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%r8), %edi	# MEM[(__mmask8 *)_1009], MEM[(__mmask8 *)_1009]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k7	# MEM[(__mmask8 *)_1009], tmp3916
	vpsubq	ones(%rip), %zmm10, %zmm10{%k7}	# ones, _1836, tmp2544, tmp3916, _1836
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, 64(%rax)	# tmp2544, MEM[(__m512i * {ref-all})result_868 + i_1840 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k1	#, zeros, tmp2544, tmp2546
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k1, %k1	# tmp2546
	jne	.L2338	#,
.L1228:
# sub.c:249:         i += 8;
	addq	$8, %rdx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.511
.L1652:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm11	# MEM[(__m512i * {ref-all})result_868 + i_1840 * 8], _1836
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %r8d	# MEM[(__mmask8 *)_1009], MEM[(__mmask8 *)_1009]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k2	# MEM[(__mmask8 *)_1009], tmp3917
	vpsubq	ones(%rip), %zmm11, %zmm11{%k2}	# ones, _1836, tmp2550, tmp3917, _1836
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rax,%rdx,8)	# tmp2550, MEM[(__m512i * {ref-all})result_868 + i_1840 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm11, %k3	#, zeros, tmp2550, tmp2552
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k3, %k3	# tmp2552
	jne	.L2339	#,
.L1231:
# sub.c:249:         i += 8;
	addq	$8, %rdx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.511
.L1651:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm12	# MEM[(__m512i * {ref-all})result_868 + i_1840 * 8], _1836
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %r9d	# MEM[(__mmask8 *)_1009], MEM[(__mmask8 *)_1009]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k4	# MEM[(__mmask8 *)_1009], tmp3918
	vpsubq	ones(%rip), %zmm12, %zmm12{%k4}	# ones, _1836, tmp2556, tmp3918, _1836
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm12, (%rax,%rdx,8)	# tmp2556, MEM[(__m512i * {ref-all})result_868 + i_1840 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k5	#, zeros, tmp2556, tmp2558
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k5, %k5	# tmp2558
	jne	.L2340	#,
.L1234:
# sub.c:249:         i += 8;
	addq	$8, %rdx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.511
	cmpq	%rdx, %r12	# i, sub_size
	ja	.L830	#,
	jmp	.L831	#
	.p2align 4,,10
	.p2align 3
.L829:
# sub.c:249:         i += 8;
	addq	$8, %rdx	#, tmp1594
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm0	# MEM[(__m512i * {ref-all})result_868 + i_1840 * 8], _1836
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rcx), %edi	# MEM[(__mmask8 *)_1009], MEM[(__mmask8 *)_1009]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rcx), %rsi	#, tmp1595
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k7	# MEM[(__mmask8 *)_1009], tmp3775
	vpsubq	ones(%rip), %zmm0, %zmm0{%k7}	# ones, _1836, tmp2134, tmp3775, _1836
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rax,%rdx,8)	# tmp2134, MEM[(__m512i * {ref-all})result_868 + i_1840 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k1	#, zeros, tmp2134, tmp2136
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k1, %k1	# tmp2136
	jne	.L2341	#,
.L1237:
# sub.c:249:         i += 8;
	leaq	8(%rdx), %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm14	# MEM[(__m512i * {ref-all})result_868 + i_1840 * 8], _1836
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rsi), %r8d	# MEM[(__mmask8 *)_1009], MEM[(__mmask8 *)_1009]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k2	# MEM[(__mmask8 *)_1009], tmp3919
	vpsubq	ones(%rip), %zmm14, %zmm14{%k2}	# ones, _1836, tmp2564, tmp3919, _1836
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rax,%rcx,8)	# tmp2564, MEM[(__m512i * {ref-all})result_868 + i_1840 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k3	#, zeros, tmp2564, tmp2566
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k3, %k3	# tmp2566
	jne	.L2342	#,
.L1239:
# sub.c:249:         i += 8;
	leaq	16(%rdx), %r9	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r9,8), %zmm15	# MEM[(__m512i * {ref-all})result_868 + i_1840 * 8], _1836
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%rsi), %r10d	# MEM[(__mmask8 *)_1009], MEM[(__mmask8 *)_1009]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r10d, %k4	# MEM[(__mmask8 *)_1009], tmp3920
	vpsubq	ones(%rip), %zmm15, %zmm15{%k4}	# ones, _1836, tmp2572, tmp3920, _1836
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, (%rax,%r9,8)	# tmp2572, MEM[(__m512i * {ref-all})result_868 + i_1840 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k5	#, zeros, tmp2572, tmp2574
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k5, %k5	# tmp2574
	jne	.L2343	#,
.L1241:
# sub.c:249:         i += 8;
	addq	$24, %rdx	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%rsi), %rcx	#, ivtmp.511
	cmpq	%rdx, %r12	# i, sub_size
	jbe	.L831	#,
.L830:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm13	# MEM[(__m512i * {ref-all})result_868 + i_1840 * 8], _1836
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %r10d	# MEM[(__mmask8 *)_1009], MEM[(__mmask8 *)_1009]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r10d, %k6	# MEM[(__mmask8 *)_1009], tmp3774
	vpsubq	ones(%rip), %zmm13, %zmm13{%k6}	# ones, _1836, tmp2126, tmp3774, _1836
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rax,%rdx,8)	# tmp2126, MEM[(__m512i * {ref-all})result_868 + i_1840 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k0	#, zeros, tmp2126, tmp2128
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp2128
	je	.L829	#,
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rcx)	# tmp2128, MEM[(__mmask8 *)_1009]
	jmp	.L829	#
.L726:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC33(%rip), %rsi	#, tmp1442
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1481
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC34(%rip), %r8	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1481,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %r8d	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%r8	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-65712(%rbp), %r13	#, tmp1474
	leaq	.LC85(%rip), %r8	#,
	jmp	.L2297	#
.L714:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC29(%rip), %rsi	#, tmp1362
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1481
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC30(%rip), %r8	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1481,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %ebx	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%rbx	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-66048(%rbp), %r13	#, tmp1480
	leaq	.LC77(%rip), %r8	#,
	jmp	.L2288	#
.L2347:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rdx)	# tmp1745, MEM[(__mmask8 *)_844]
.L749:
# sub.c:249:         i += 8;
	addq	$8, %rcx	#, tmp1561
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm8	# MEM[(__m512i * {ref-all})result_310 + i_1760 * 8], _1756
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rdx), %r9d	# MEM[(__mmask8 *)_844], MEM[(__mmask8 *)_844]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rdx), %rsi	#, tmp1562
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k2	# MEM[(__mmask8 *)_844], tmp3608
	vpsubq	ones(%rip), %zmm8, %zmm8{%k2}	# ones, _1756, tmp1751, tmp3608, _1756
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rax,%rcx,8)	# tmp1751, MEM[(__m512i * {ref-all})result_310 + i_1760 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm8, %k3	#, zeros, tmp1751, tmp1753
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k3, %k3	# tmp1753
	jne	.L2344	#,
.L1108:
# sub.c:249:         i += 8;
	leaq	8(%rcx), %rdx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm0	# MEM[(__m512i * {ref-all})result_310 + i_1760 * 8], _1756
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rsi), %edi	# MEM[(__mmask8 *)_844], MEM[(__mmask8 *)_844]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k4	# MEM[(__mmask8 *)_844], tmp3871
	vpsubq	ones(%rip), %zmm0, %zmm0{%k4}	# ones, _1756, tmp2390, tmp3871, _1756
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rax,%rdx,8)	# tmp2390, MEM[(__m512i * {ref-all})result_310 + i_1760 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k5	#, zeros, tmp2390, tmp2392
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k5, %k5	# tmp2392
	jne	.L2345	#,
.L1110:
# sub.c:249:         i += 8;
	leaq	16(%rcx), %rbx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rbx,8), %zmm9	# MEM[(__m512i * {ref-all})result_310 + i_1760 * 8], _1756
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%rsi), %r11d	# MEM[(__mmask8 *)_844], MEM[(__mmask8 *)_844]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r11d, %k6	# MEM[(__mmask8 *)_844], tmp3872
	vpsubq	ones(%rip), %zmm9, %zmm9{%k6}	# ones, _1756, tmp2398, tmp3872, _1756
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rax,%rbx,8)	# tmp2398, MEM[(__m512i * {ref-all})result_310 + i_1760 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k7	#, zeros, tmp2398, tmp2400
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k7, %k7	# tmp2400
	jne	.L2346	#,
.L1112:
# sub.c:249:         i += 8;
	addq	$24, %rcx	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%rsi), %rdx	#, ivtmp.616
	cmpq	%rcx, %r12	# i, sub_size
	jbe	.L751	#,
.L750:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm5	# MEM[(__m512i * {ref-all})result_310 + i_1760 * 8], _1756
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rdx), %r10d	# MEM[(__mmask8 *)_844], MEM[(__mmask8 *)_844]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r10d, %k1	# MEM[(__mmask8 *)_844], tmp3607
	vpsubq	ones(%rip), %zmm5, %zmm5{%k1}	# ones, _1756, tmp1743, tmp3607, _1756
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, (%rax,%rcx,8)	# tmp1743, MEM[(__m512i * {ref-all})result_310 + i_1760 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k0	#, zeros, tmp1743, tmp1745
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp1745
	je	.L749	#,
	jmp	.L2347	#
.L2351:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rcx)	# tmp2074, MEM[(__mmask8 *)_1164]
.L819:
# sub.c:249:         i += 8;
	addq	$8, %r11	#, tmp1610
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%r11,8), %zmm13	# MEM[(__m512i * {ref-all})result_787 + i_1820 * 8], _1816
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rcx), %esi	# MEM[(__mmask8 *)_1164], MEM[(__mmask8 *)_1164]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rcx), %r8	#, tmp1611
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k6	# MEM[(__mmask8 *)_1164], tmp3755
	vpsubq	ones(%rip), %zmm13, %zmm13{%k6}	# ones, _1816, tmp2080, tmp3755, _1816
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rdx,%r11,8)	# tmp2080, MEM[(__m512i * {ref-all})result_787 + i_1820 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k7	#, zeros, tmp2080, tmp2082
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k7, %k7	# tmp2082
	jne	.L2348	#,
.L1301:
# sub.c:249:         i += 8;
	leaq	8(%r11), %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%rcx,8), %zmm0	# MEM[(__m512i * {ref-all})result_787 + i_1820 * 8], _1816
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%r8), %ebx	# MEM[(__mmask8 *)_1164], MEM[(__mmask8 *)_1164]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ebx, %k1	# MEM[(__mmask8 *)_1164], tmp3946
	vpsubq	ones(%rip), %zmm0, %zmm0{%k1}	# ones, _1816, tmp2648, tmp3946, _1816
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rdx,%rcx,8)	# tmp2648, MEM[(__m512i * {ref-all})result_787 + i_1820 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k2	#, zeros, tmp2648, tmp2650
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k2, %k2	# tmp2650
	jne	.L2349	#,
.L1303:
# sub.c:249:         i += 8;
	leaq	16(%r11), %rax	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%rax,8), %zmm14	# MEM[(__m512i * {ref-all})result_787 + i_1820 * 8], _1816
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%r8), %r10d	# MEM[(__mmask8 *)_1164], MEM[(__mmask8 *)_1164]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r10d, %k3	# MEM[(__mmask8 *)_1164], tmp3947
	vpsubq	ones(%rip), %zmm14, %zmm14{%k3}	# ones, _1816, tmp2656, tmp3947, _1816
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rdx,%rax,8)	# tmp2656, MEM[(__m512i * {ref-all})result_787 + i_1820 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k4	#, zeros, tmp2656, tmp2658
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k4, %k4	# tmp2658
	jne	.L2350	#,
.L1305:
# sub.c:249:         i += 8;
	addq	$24, %r11	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%r8), %rcx	#, ivtmp.537
	cmpq	%r11, %r12	# i, sub_size
	jbe	.L2280	#,
.L820:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%r11,8), %zmm12	# MEM[(__m512i * {ref-all})result_787 + i_1820 * 8], _1816
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %r9d	# MEM[(__mmask8 *)_1164], MEM[(__mmask8 *)_1164]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k5	# MEM[(__mmask8 *)_1164], tmp3754
	vpsubq	ones(%rip), %zmm12, %zmm12{%k5}	# ones, _1816, tmp2072, tmp3754, _1816
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm12, (%rdx,%r11,8)	# tmp2072, MEM[(__m512i * {ref-all})result_787 + i_1820 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k0	#, zeros, tmp2072, tmp2074
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp2074
	je	.L819	#,
	jmp	.L2351	#
.L2360:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	8(%r14), %r10	# MEM[(uint64_t *)b.114_69 + j_389 * 8], tmp3852
	cmpq	%r10, 8(%r15)	# tmp3852, MEM[(uint64_t *)a.115_70 + j_389 * 8]
	ja	.L855	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L856	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	jne	.L1625	#,
	.p2align 4,,10
	.p2align 3
.L762:
# sub.c:1339:             TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
	incl	%r11d	# __t
	cmpl	%ebx, %r11d	# _840, __t
	jne	.L756	#,
.L757:
# sub.c:1514:     asm volatile("RDTSCP\n\t"
#APP
# 1514 "sub.c" 1
	RDTSCP
	mov %edx, %r11d	# cycles_high
	mov %eax, %r10d	# cycles_low
	CPUID
	
# 0 "" 2
# sub.c:1519:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
#NO_APP
	salq	$32, %r11	#, tmp918
# sub.c:1519:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	movl	%r10d, %eax	# cycles_low, cycles_low
# sub.c:1519:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	orq	%rax, %r11	# cycles_low, ticks
# sub.c:1339:             TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
	subq	-66320(%rbp), %r11	# %sfp, __tmp
	cmpq	$624999999, %r11	#, __tmp
	jbe	.L746	#,
	vxorpd	%xmm11, %xmm11, %xmm11	# tmp3627
	vcvtusi2sdq	%r11, %xmm11, %xmm12	# __tmp, tmp3627, tmp3007
	movq	%r8, %rbx	# __times, __times
	vcvtsi2sdq	%rbx, %xmm11, %xmm15	# __times, tmp3629, tmp3009
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC64(%rip), %rdi	#, tmp955
# sub.c:1339:             TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
	vmulsd	.LC63(%rip), %xmm12, %xmm13	#, tmp950, _73
	vcvttsd2usi	%xmm13, %r8	# _73, __tmp
	vcvtusi2sdq	%r8, %xmm11, %xmm1	# __tmp, tmp3628, tmp3008
	vdivsd	%xmm15, %xmm1, %xmm4	# tmp954, tmp953, time_taken
	vmovq	%xmm4, %rbx	# time_taken, time_taken
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vzeroupper
	call	puts@PLT	#
# sub.c:1340:             time_taken_ms = time_taken / 1e6;
	vmovq	%rbx, %xmm7	# time_taken, time_taken
	vmulsd	.LC65(%rip), %xmm7, %xmm0	#, time_taken, time_taken_ms
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC66(%rip), %rsi	#, tmp958
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk@PLT	#
# sub.c:1344:             niter = 1 + (unsigned long)(1e4 / time_taken_ms);
	vmovsd	.LC67(%rip), %xmm3	#, tmp960
	vmovq	%rbx, %xmm2	# time_taken, time_taken
	vdivsd	%xmm2, %xmm3, %xmm6	# time_taken, tmp960, tmp959
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
# sub.c:1344:             niter = 1 + (unsigned long)(1e4 / time_taken_ms);
	vcvttsd2usi	%xmm6, %rdx	# tmp959, tmp961
# sub.c:1344:             niter = 1 + (unsigned long)(1e4 / time_taken_ms);
	leal	1(%rdx), %esi	#, niter
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	%esi, %edx	# niter,
	movl	%esi, -66352(%rbp)	# niter, %sfp
	leaq	.LC68(%rip), %rsi	#, tmp962
	call	__printf_chk@PLT	#
# sub.c:1346:             fflush(stdout);
	movq	stdout(%rip), %rdi	# stdout,
	call	fflush@PLT	#
# sub.c:1501:     asm volatile("CPUID\n\t"
#APP
# 1501 "sub.c" 1
	CPUID
	RDTSC
	mov %edx, %r9d	# cycles_high
	mov %eax, %edi	# cycles_low
	
# 0 "" 2
# sub.c:1505:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
#NO_APP
	salq	$32, %r9	#, tmp967
# sub.c:1505:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	movl	%edi, %ecx	# cycles_low, cycles_low
# sub.c:1349:             for (int i = 0; i < niter; i++)
	movl	-66352(%rbp), %r11d	# %sfp, niter
# sub.c:1505:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	orq	%rcx, %r9	# cycles_low, tmp967
	movq	%r9, -66320(%rbp)	# tmp967, %sfp
# sub.c:1349:             for (int i = 0; i < niter; i++)
	xorl	%r10d, %r10d	# i
# sub.c:1349:             for (int i = 0; i < niter; i++)
	testl	%r11d, %r11d	# niter
	jle	.L768	#,
	.p2align 4,,10
	.p2align 3
.L763:
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %r8	# sub_space_ptr, sub_space_ptr
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %rax	# sub_space, sub_space
	leaq	-1(%r12), %rcx	#, tmp1537
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14), %rbx	# MEM[(uint64_t *)b.114_69 + j_473 * 8], tmp3643
	movq	%rcx, %rsi	# tmp1537, tmp1537
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%rax,%r8,8), %rax	#, result
	andl	$7, %esi	#, tmp1537
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%rbx, (%r15)	# tmp3643, MEM[(uint64_t *)a.115_70 + j_473 * 8]
	jbe	.L2352	#,
.L859:
	movq	%r14, %rsi	# b.114_69, b
	movq	%r15, %rbx	# a.115_70, a
.L766:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rbx), %zmm5	# MEM[(__m512i * {ref-all})a_495 + i_493 * 8], tmp3646
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %r8	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi), %zmm5, %zmm8	# MEM[(__m512i * {ref-all})b_498 + i_493 * 8], tmp3646, tmp995
	leaq	-1(%r12), %r9	#, tmp1533
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm8, %k2	#, zeros, tmp995, tmp997
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm8, %zmm0	# tmp995, tmp995
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %r8	# borrow_space, ivtmp.563
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm8, %zmm0{%k2}	# limb_digits, tmp995, tmp995, tmp997, tmp995
	shrq	$3, %r9	#, tmp1531
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rax)	# tmp1001, MEM[(__m512i * {ref-all})result_472 + i_493 * 8]
	andl	$3, %r9d	#, tmp1534
# sub.c:217:         i += 8;
	movl	$8, %edi	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%r8), %rcx	#, ivtmp.572
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, (%r8)	# tmp997, MEM[(__mmask8 *)_1168]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %r12	#, sub_size
	jbe	.L1941	#,
	testq	%r9, %r9	# tmp1534
	je	.L770	#,
	cmpq	$1, %r9	#, tmp1534
	je	.L1605	#,
	cmpq	$2, %r9	#, tmp1534
	je	.L1606	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%rbx), %zmm9	# MEM[(__m512i * {ref-all})a_495 + i_493 * 8], tmp3822
# sub.c:217:         i += 8;
	movl	$16, %edi	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%rsi), %zmm9, %zmm10	# MEM[(__m512i * {ref-all})b_498 + i_493 * 8], tmp3822, tmp2234
# sub.c:219:     } while (likely(i < n));
	leaq	2(%r8), %rcx	#, ivtmp.572
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k3	#, zeros, tmp2234, tmp2236
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm10, %zmm11	# tmp2234, tmp2234
	vpaddq	limb_digits(%rip), %zmm10, %zmm11{%k3}	# limb_digits, tmp2234, tmp2234, tmp2236, tmp2234
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, 64(%rax)	# tmp2238, MEM[(__m512i * {ref-all})result_472 + i_493 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, 1(%r8)	# tmp2236, MEM[(__mmask8 *)_1168]
.L1606:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rbx,%rdi,8), %zmm12	# MEM[(__m512i * {ref-all})a_495 + i_493 * 8], tmp3824
# sub.c:219:     } while (likely(i < n));
	incq	%rcx	# ivtmp.572
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi,%rdi,8), %zmm12, %zmm13	# MEM[(__m512i * {ref-all})b_498 + i_493 * 8], tmp3824, tmp2240
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k4	#, zeros, tmp2240, tmp2242
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm13, %zmm1	# tmp2240, tmp2240
	vpaddq	limb_digits(%rip), %zmm13, %zmm1{%k4}	# limb_digits, tmp2240, tmp2240, tmp2242, tmp2240
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rax,%rdi,8)	# tmp2244, MEM[(__m512i * {ref-all})result_472 + i_493 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rdi	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, -1(%rcx)	# tmp2242, MEM[(__mmask8 *)_1168]
.L1605:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rbx,%rdi,8), %zmm14	# MEM[(__m512i * {ref-all})a_495 + i_493 * 8], tmp3826
# sub.c:219:     } while (likely(i < n));
	incq	%rcx	# ivtmp.572
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi,%rdi,8), %zmm14, %zmm15	# MEM[(__m512i * {ref-all})b_498 + i_493 * 8], tmp3826, tmp2246
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k5	#, zeros, tmp2246, tmp2248
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm15, %zmm4	# tmp2246, tmp2246
	vpaddq	limb_digits(%rip), %zmm15, %zmm4{%k5}	# limb_digits, tmp2246, tmp2246, tmp2248, tmp2246
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm4, (%rax,%rdi,8)	# tmp2250, MEM[(__m512i * {ref-all})result_472 + i_493 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rdi	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, -1(%rcx)	# tmp2248, MEM[(__mmask8 *)_1168]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rdi, %r12	# i, sub_size
	jbe	.L1941	#,
.L770:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rbx,%rdi,8), %zmm7	# MEM[(__m512i * {ref-all})a_495 + i_493 * 8], tmp3648
# sub.c:217:         i += 8;
	leaq	8(%rdi), %rdx	#, tmp1535
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi,%rdi,8), %zmm7, %zmm3	# MEM[(__m512i * {ref-all})b_498 + i_493 * 8], tmp3648, tmp1817
# sub.c:217:         i += 8;
	leaq	16(%rdi), %r9	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k6	#, zeros, tmp1817, tmp1819
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm3, %zmm2	# tmp1817, tmp1817
# sub.c:219:     } while (likely(i < n));
	addq	$4, %rcx	#, ivtmp.572
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm3, %zmm2{%k6}	# limb_digits, tmp1817, tmp1817, tmp1819, tmp1817
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, (%rax,%rdi,8)	# tmp1821, MEM[(__m512i * {ref-all})result_472 + i_493 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, -4(%rcx)	# tmp1819, MEM[(__mmask8 *)_1168]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rbx,%rdx,8), %zmm6	# MEM[(__m512i * {ref-all})a_495 + i_493 * 8], tmp3650
	vpsubq	(%rsi,%rdx,8), %zmm6, %zmm5	# MEM[(__m512i * {ref-all})b_498 + i_493 * 8], tmp3650, tmp1825
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k7	#, zeros, tmp1825, tmp1827
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm5, %zmm8	# tmp1825, tmp1825
	vpaddq	limb_digits(%rip), %zmm5, %zmm8{%k7}	# limb_digits, tmp1825, tmp1825, tmp1827, tmp1825
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rax,%rdx,8)	# tmp1829, MEM[(__m512i * {ref-all})result_472 + i_493 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, -3(%rcx)	# tmp1827, MEM[(__mmask8 *)_1168]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rbx,%r9,8), %zmm0	# MEM[(__m512i * {ref-all})a_495 + i_493 * 8], tmp3652
# sub.c:217:         i += 8;
	leaq	24(%rdi), %rdx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi,%r9,8), %zmm0, %zmm9	# MEM[(__m512i * {ref-all})b_498 + i_493 * 8], tmp3652, tmp1833
# sub.c:217:         i += 8;
	addq	$32, %rdi	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k1	#, zeros, tmp1833, tmp1835
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm9, %zmm10	# tmp1833, tmp1833
	vpaddq	limb_digits(%rip), %zmm9, %zmm10{%k1}	# limb_digits, tmp1833, tmp1833, tmp1835, tmp1833
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, (%rax,%r9,8)	# tmp1837, MEM[(__m512i * {ref-all})result_472 + i_493 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, -2(%rcx)	# tmp1835, MEM[(__mmask8 *)_1168]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rbx,%rdx,8), %zmm11	# MEM[(__m512i * {ref-all})a_495 + i_493 * 8], tmp3654
	vpsubq	(%rsi,%rdx,8), %zmm11, %zmm12	# MEM[(__m512i * {ref-all})b_498 + i_493 * 8], tmp3654, tmp1841
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k2	#, zeros, tmp1841, tmp1843
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm12, %zmm13	# tmp1841, tmp1841
	vpaddq	limb_digits(%rip), %zmm12, %zmm13{%k2}	# limb_digits, tmp1841, tmp1841, tmp1843, tmp1841
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rax,%rdx,8)	# tmp1845, MEM[(__m512i * {ref-all})result_472 + i_493 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, -1(%rcx)	# tmp1843, MEM[(__mmask8 *)_1168]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rdi, %r12	# i, sub_size
	ja	.L770	#,
.L1941:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm1	# zeros, tmp3656
	leaq	-1(%r12), %rsi	#, tmp1527
	vmovdqu64	%zmm1, (%rax,%r13)	# tmp3656, MEM[(__m512i_u * {ref-all})_519]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax), %zmm14	# MEM[(__m512i * {ref-all})result_472 + i_1800 * 8], _1796
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%r8), %ebx	# MEM[(__mmask8 *)_921], MEM[(__mmask8 *)_921]
	shrq	$3, %rsi	#, tmp1525
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ebx, %k3	# MEM[(__mmask8 *)_921], tmp3657
	vpsubq	ones(%rip), %zmm14, %zmm14{%k3}	# ones, _1796, tmp1007, tmp3657, _1796
	andl	$3, %esi	#, tmp1528
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rax)	# tmp1007, MEM[(__m512i * {ref-all})result_472 + i_1800 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k0	#, zeros, tmp1007, tmp1013
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp1013
	jne	.L2353	#,
.L969:
# sub.c:249:         i += 8;
	movl	$8, %r9d	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	1(%r8), %rcx	#, ivtmp.563
	cmpq	$8, %r12	#, sub_size
	jbe	.L773	#,
	testq	%rsi, %rsi	# tmp1528
	je	.L772	#,
	cmpq	$1, %rsi	#, tmp1528
	je	.L1603	#,
	cmpq	$2, %rsi	#, tmp1528
	je	.L1604	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	64(%rax), %zmm15	# MEM[(__m512i * {ref-all})result_472 + i_1800 * 8], _1796
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%r8), %edi	# MEM[(__mmask8 *)_921], MEM[(__mmask8 *)_921]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k4	# MEM[(__mmask8 *)_921], tmp3817
	vpsubq	ones(%rip), %zmm15, %zmm15{%k4}	# ones, _1796, tmp2202, tmp3817, _1796
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, 64(%rax)	# tmp2202, MEM[(__m512i * {ref-all})result_472 + i_1800 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k5	#, zeros, tmp2202, tmp2204
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k5, %k5	# tmp2204
	jne	.L2354	#,
.L971:
# sub.c:249:         i += 8;
	addq	$8, %r9	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.563
.L1604:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r9,8), %zmm4	# MEM[(__m512i * {ref-all})result_472 + i_1800 * 8], _1796
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %r8d	# MEM[(__mmask8 *)_921], MEM[(__mmask8 *)_921]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k6	# MEM[(__mmask8 *)_921], tmp3818
	vpsubq	ones(%rip), %zmm4, %zmm4{%k6}	# ones, _1796, tmp2208, tmp3818, _1796
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm4, (%rax,%r9,8)	# tmp2208, MEM[(__m512i * {ref-all})result_472 + i_1800 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm4, %k7	#, zeros, tmp2208, tmp2210
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k7, %k7	# tmp2210
	jne	.L2355	#,
.L974:
# sub.c:249:         i += 8;
	addq	$8, %r9	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.563
.L1603:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r9,8), %zmm7	# MEM[(__m512i * {ref-all})result_472 + i_1800 * 8], _1796
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %edx	# MEM[(__mmask8 *)_921], MEM[(__mmask8 *)_921]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edx, %k1	# MEM[(__mmask8 *)_921], tmp3819
	vpsubq	ones(%rip), %zmm7, %zmm7{%k1}	# ones, _1796, tmp2214, tmp3819, _1796
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm7, (%rax,%r9,8)	# tmp2214, MEM[(__m512i * {ref-all})result_472 + i_1800 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm7, %k2	#, zeros, tmp2214, tmp2216
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k2, %k2	# tmp2216
	jne	.L2356	#,
.L977:
# sub.c:249:         i += 8;
	addq	$8, %r9	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.563
	cmpq	%r9, %r12	# i, sub_size
	ja	.L772	#,
	jmp	.L773	#
	.p2align 4,,10
	.p2align 3
.L771:
# sub.c:249:         i += 8;
	addq	$8, %r9	#, tmp1529
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r9,8), %zmm2	# MEM[(__m512i * {ref-all})result_472 + i_1800 * 8], _1796
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rcx), %edi	# MEM[(__mmask8 *)_921], MEM[(__mmask8 *)_921]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rcx), %rbx	#, tmp1530
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k4	# MEM[(__mmask8 *)_921], tmp3659
	vpsubq	ones(%rip), %zmm2, %zmm2{%k4}	# ones, _1796, tmp1859, tmp3659, _1796
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, (%rax,%r9,8)	# tmp1859, MEM[(__m512i * {ref-all})result_472 + i_1800 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k5	#, zeros, tmp1859, tmp1861
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k5, %k5	# tmp1861
	jne	.L2357	#,
.L980:
# sub.c:249:         i += 8;
	leaq	8(%r9), %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm6	# MEM[(__m512i * {ref-all})result_472 + i_1800 * 8], _1796
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rbx), %r8d	# MEM[(__mmask8 *)_921], MEM[(__mmask8 *)_921]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k6	# MEM[(__mmask8 *)_921], tmp3820
	vpsubq	ones(%rip), %zmm6, %zmm6{%k6}	# ones, _1796, tmp2222, tmp3820, _1796
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rax,%rcx,8)	# tmp2222, MEM[(__m512i * {ref-all})result_472 + i_1800 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k7	#, zeros, tmp2222, tmp2224
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k7, %k7	# tmp2224
	jne	.L2358	#,
.L982:
# sub.c:249:         i += 8;
	leaq	16(%r9), %rdx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm5	# MEM[(__m512i * {ref-all})result_472 + i_1800 * 8], _1796
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%rbx), %esi	# MEM[(__mmask8 *)_921], MEM[(__mmask8 *)_921]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k1	# MEM[(__mmask8 *)_921], tmp3821
	vpsubq	ones(%rip), %zmm5, %zmm5{%k1}	# ones, _1796, tmp2230, tmp3821, _1796
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, (%rax,%rdx,8)	# tmp2230, MEM[(__m512i * {ref-all})result_472 + i_1800 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k2	#, zeros, tmp2230, tmp2232
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k2, %k2	# tmp2232
	jne	.L2359	#,
.L984:
# sub.c:249:         i += 8;
	addq	$24, %r9	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%rbx), %rcx	#, ivtmp.563
	cmpq	%r9, %r12	# i, sub_size
	jbe	.L773	#,
.L772:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r9,8), %zmm3	# MEM[(__m512i * {ref-all})result_472 + i_1800 * 8], _1796
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %esi	# MEM[(__mmask8 *)_921], MEM[(__mmask8 *)_921]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k3	# MEM[(__mmask8 *)_921], tmp3658
	vpsubq	ones(%rip), %zmm3, %zmm3{%k3}	# ones, _1796, tmp1851, tmp3658, _1796
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rax,%r9,8)	# tmp1851, MEM[(__m512i * {ref-all})result_472 + i_1800 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k0	#, zeros, tmp1851, tmp1853
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp1853
	je	.L771	#,
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rcx)	# tmp1853, MEM[(__mmask8 *)_921]
	jmp	.L771	#
	.p2align 4,,10
	.p2align 3
.L2325:
	kmovb	%k6, 1(%r10)	# tmp2308, MEM[(__mmask8 *)_1070]
	jmp	.L1046	#
	.p2align 4,,10
	.p2align 3
.L2324:
	kmovb	%k4, 1(%rcx)	# tmp1807, MEM[(__mmask8 *)_1070]
	jmp	.L1044	#
	.p2align 4,,10
	.p2align 3
.L2326:
	kmovb	%k1, 2(%r10)	# tmp2316, MEM[(__mmask8 *)_1070]
	jmp	.L1048	#
.L2379:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	8(%r14), %r9	# MEM[(uint64_t *)b.114_69 + j_473 * 8], tmp3828
	cmpq	%r9, 8(%r15)	# tmp3828, MEM[(uint64_t *)a.115_70 + j_473 * 8]
	ja	.L859	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L860	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	jne	.L1613	#,
.L773:
# sub.c:1349:             for (int i = 0; i < niter; i++)
	incl	%r10d	# i
# sub.c:1349:             for (int i = 0; i < niter; i++)
	cmpl	%r10d, %r11d	# i, niter
	jne	.L763	#,
	vzeroupper
.L768:
	movl	%r11d, -66352(%rbp)	# niter, %sfp
# sub.c:1514:     asm volatile("RDTSCP\n\t"
#APP
# 1514 "sub.c" 1
	RDTSCP
	mov %edx, %r12d	# cycles_high
	mov %eax, %r13d	# cycles_low
	CPUID
	
# 0 "" 2
# sub.c:1519:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
#NO_APP
	movq	%r12, %rax	# cycles_high, tmp972
	salq	$32, %rax	#, tmp972
# sub.c:1519:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	movl	%r13d, %r10d	# cycles_low, cycles_low
# sub.c:1519:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	orq	%r10, %rax	# cycles_low, ticks
# sub.c:1354:             t1 = t1 - t0;
	subq	-66320(%rbp), %rax	# %sfp, t1
# sub.c:1355:             t1 = t1 * 0.4; // t*f -> ns
	vxorpd	%xmm8, %xmm8, %xmm8	# tmp3636
	vcvtusi2sdq	%rax, %xmm8, %xmm0	# t1, tmp3636, tmp3010
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC69(%rip), %rdi	#, tmp981
# sub.c:1361:             for (decimals = 0;; decimals++)
	xorl	%r12d, %r12d	# decimals
# sub.c:1355:             t1 = t1 * 0.4; // t*f -> ns
	vmulsd	.LC63(%rip), %xmm0, %xmm9	#, tmp976, _82
# sub.c:1355:             t1 = t1 * 0.4; // t*f -> ns
	vcvttsd2usi	%xmm9, %r11	# _82, t1
# sub.c:1356:             t1 = t1 / 1e6; // ns -> ms
	vcvtusi2sdq	%r11, %xmm8, %xmm10	# t1, tmp3637, tmp3011
	vmulsd	.LC65(%rip), %xmm10, %xmm11	#, tmp979, _84
	vmovq	%xmm11, %rbx	# _84, _84
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	puts@PLT	#
# sub.c:1359:             ops_per_sec = 1000.0 * niter / t1;
	movl	-66352(%rbp), %r9d	# %sfp, niter
	vxorpd	%xmm12, %xmm12, %xmm12	# tmp3639
	vcvtsi2sdl	%r9d, %xmm12, %xmm13	# niter, tmp3639, tmp3012
# sub.c:1356:             t1 = t1 / 1e6; // ns -> ms
	vmovq	%rbx, %xmm15	# _84, _84
	vcvttsd2usi	%xmm15, %rdi	# _84, t1
# sub.c:1359:             ops_per_sec = 1000.0 * niter / t1;
	vmovsd	.LC70(%rip), %xmm1	#, tmp982
# sub.c:1363:                 if (ops_per_sec > f)
	vmovsd	.LC51(%rip), %xmm11	#, tmp987
# sub.c:1359:             ops_per_sec = 1000.0 * niter / t1;
	vmulsd	%xmm13, %xmm1, %xmm14	# tmp3012, tmp982, tmp982
# sub.c:1359:             ops_per_sec = 1000.0 * niter / t1;
	vcvtusi2sdq	%rdi, %xmm12, %xmm4	# t1, tmp3641, tmp3013
# sub.c:1359:             ops_per_sec = 1000.0 * niter / t1;
	vdivsd	%xmm4, %xmm14, %xmm7	# tmp986, tmp983, ops_per_sec
# sub.c:1363:                 if (ops_per_sec > f)
	vcomisd	%xmm11, %xmm7	# tmp987, ops_per_sec
	ja	.L764	#,
	vmovsd	.LC71(%rip), %xmm3	#, tmp1479
.L765:
# sub.c:1365:                 f = f * 0.1;
	vmulsd	%xmm3, %xmm11, %xmm2	# tmp1479, f, f
# sub.c:1361:             for (decimals = 0;; decimals++)
	leal	1(%r12), %r8d	#, tmp1524
	movl	%r8d, %r12d	# tmp1524, decimals
# sub.c:1363:                 if (ops_per_sec > f)
	vcomisd	%xmm2, %xmm7	# f, ops_per_sec
	ja	.L764	#,
# sub.c:1365:                 f = f * 0.1;
	vmulsd	%xmm3, %xmm2, %xmm6	# tmp1479, f, f
# sub.c:1361:             for (decimals = 0;; decimals++)
	incl	%r12d	# decimals
# sub.c:1363:                 if (ops_per_sec > f)
	vcomisd	%xmm6, %xmm7	# f, ops_per_sec
	ja	.L764	#,
# sub.c:1365:                 f = f * 0.1;
	vmulsd	%xmm3, %xmm6, %xmm5	# tmp1479, f, f
# sub.c:1361:             for (decimals = 0;; decimals++)
	leal	2(%r8), %r12d	#, decimals
# sub.c:1363:                 if (ops_per_sec > f)
	vcomisd	%xmm5, %xmm7	# f, ops_per_sec
	ja	.L764	#,
# sub.c:1365:                 f = f * 0.1;
	vmulsd	%xmm3, %xmm5, %xmm8	# tmp1479, f, f
# sub.c:1361:             for (decimals = 0;; decimals++)
	leal	3(%r8), %r12d	#, decimals
# sub.c:1363:                 if (ops_per_sec > f)
	vcomisd	%xmm8, %xmm7	# f, ops_per_sec
	ja	.L764	#,
# sub.c:1365:                 f = f * 0.1;
	vmulsd	%xmm3, %xmm8, %xmm0	# tmp1479, f, f
# sub.c:1361:             for (decimals = 0;; decimals++)
	leal	4(%r8), %r12d	#, decimals
# sub.c:1363:                 if (ops_per_sec > f)
	vcomisd	%xmm0, %xmm7	# f, ops_per_sec
	ja	.L764	#,
# sub.c:1365:                 f = f * 0.1;
	vmulsd	%xmm3, %xmm0, %xmm9	# tmp1479, f, f
# sub.c:1361:             for (decimals = 0;; decimals++)
	leal	5(%r8), %r12d	#, decimals
# sub.c:1363:                 if (ops_per_sec > f)
	vcomisd	%xmm9, %xmm7	# f, ops_per_sec
	ja	.L764	#,
# sub.c:1365:                 f = f * 0.1;
	vmulsd	%xmm3, %xmm9, %xmm10	# tmp1479, f, f
# sub.c:1361:             for (decimals = 0;; decimals++)
	leal	6(%r8), %r12d	#, decimals
# sub.c:1363:                 if (ops_per_sec > f)
	vcomisd	%xmm10, %xmm7	# f, ops_per_sec
	ja	.L764	#,
# sub.c:1365:                 f = f * 0.1;
	vmulsd	%xmm3, %xmm10, %xmm11	# tmp1479, f, f
# sub.c:1361:             for (decimals = 0;; decimals++)
	leal	7(%r8), %r12d	#, decimals
# sub.c:1363:                 if (ops_per_sec > f)
	vcomisd	%xmm11, %xmm7	# f, ops_per_sec
	jbe	.L765	#,
.L764:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vmovsd	%xmm7, %xmm7, %xmm0	# ops_per_sec,
	movl	%r12d, %edx	# decimals,
	leaq	.LC72(%rip), %rsi	#, tmp1018
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	vmovsd	%xmm7, -66320(%rbp)	# ops_per_sec, %sfp
	call	__printf_chk@PLT	#
# sub.c:1368:             gzprintf(rdtsc_file, "%.*f\n", decimals, ops_per_sec);
	vmovsd	-66320(%rbp), %xmm0	# %sfp, ops_per_sec
	movq	-66344(%rbp), %rdi	# %sfp,
	movl	%r12d, %edx	# decimals,
	leaq	.LC73(%rip), %rsi	#, tmp1019
	movl	$1, %eax	#,
	call	gzprintf@PLT	#
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:54:   free (__ptr);
	movq	%r15, %rdi	# a.115_70,
	call	free@PLT	#
	movq	%r14, %rdi	# b.114_69,
	call	free@PLT	#
# sub.c:1449:     gzclose(test_file);
	movq	-66312(%rbp), %rdi	# %sfp,
	call	gzclose@PLT	#
# sub.c:1451:     if (measure_type == 0)
	movl	-66328(%rbp), %r14d	# %sfp,
	testl	%r14d, %r14d	#
	jne	.L776	#,
# sub.c:1453:         gzclose(rdtsc_file);
	movq	-66344(%rbp), %rdi	# %sfp,
	call	gzclose@PLT	#
.L813:
# sub.c:1464:     if (sub_space_ptr > (1 << 30) || borrow_space_ptr > (1 << 30))
	movl	sub_space_ptr(%rip), %r15d	# sub_space_ptr, sub_space_ptr.139_121
# sub.c:1464:     if (sub_space_ptr > (1 << 30) || borrow_space_ptr > (1 << 30))
	cmpl	$1073741824, %r15d	#, sub_space_ptr.139_121
	jg	.L844	#,
# sub.c:1464:     if (sub_space_ptr > (1 << 30) || borrow_space_ptr > (1 << 30))
	movl	borrow_space_ptr(%rip), %edx	# borrow_space_ptr, borrow_space_ptr.140_122
# sub.c:1464:     if (sub_space_ptr > (1 << 30) || borrow_space_ptr > (1 << 30))
	cmpl	$1073741824, %edx	#, borrow_space_ptr.140_122
	jg	.L844	#,
# sub.c:1469:     if (sub_space_ptr && borrow_space_ptr)
	testl	%r15d, %r15d	# sub_space_ptr.139_121
	je	.L708	#,
	testl	%edx, %edx	# borrow_space_ptr.140_122
	je	.L708	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:54:   free (__ptr);
	movq	sub_space(%rip), %rdi	# sub_space,
	call	free@PLT	#
	movq	borrow_space(%rip), %rdi	# borrow_space,
	call	free@PLT	#
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:55: }
	jmp	.L708	#
	.p2align 4,,10
	.p2align 3
.L2319:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L856	#,
# sub.c:185:         j++;
	movl	$1, %ecx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %r12	#, sub_size
	je	.L762	#,
# sub.c:192:     } while (j < n);
	jbe	.L855	#,
	testq	%rdx, %rdx	# tmp1555
	je	.L758	#,
	cmpq	$1, %rdx	#, tmp1555
	je	.L1620	#,
	cmpq	$2, %rdx	#, tmp1555
	je	.L1621	#,
	cmpq	$3, %rdx	#, tmp1555
	je	.L1622	#,
	cmpq	$4, %rdx	#, tmp1555
	je	.L1623	#,
	cmpq	$5, %rdx	#, tmp1555
	je	.L1624	#,
	cmpq	$6, %rdx	#, tmp1555
	jne	.L2360	#,
.L1625:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %rsi	# MEM[(uint64_t *)b.114_69 + j_389 * 8], tmp3853
	cmpq	%rsi, (%r15,%rcx,8)	# tmp3853, MEM[(uint64_t *)a.115_70 + j_389 * 8]
	ja	.L855	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L856	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L762	#,
.L1624:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %r9	# MEM[(uint64_t *)b.114_69 + j_389 * 8], tmp3854
	cmpq	%r9, (%r15,%rcx,8)	# tmp3854, MEM[(uint64_t *)a.115_70 + j_389 * 8]
	ja	.L855	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L856	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L762	#,
.L1623:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %rdx	# MEM[(uint64_t *)b.114_69 + j_389 * 8], tmp3855
	cmpq	%rdx, (%r15,%rcx,8)	# tmp3855, MEM[(uint64_t *)a.115_70 + j_389 * 8]
	ja	.L855	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L856	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L762	#,
.L1622:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %rdi	# MEM[(uint64_t *)b.114_69 + j_389 * 8], tmp3856
	cmpq	%rdi, (%r15,%rcx,8)	# tmp3856, MEM[(uint64_t *)a.115_70 + j_389 * 8]
	ja	.L855	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L856	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L762	#,
.L1621:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %r10	# MEM[(uint64_t *)b.114_69 + j_389 * 8], tmp3857
	cmpq	%r10, (%r15,%rcx,8)	# tmp3857, MEM[(uint64_t *)a.115_70 + j_389 * 8]
	ja	.L855	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L856	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L762	#,
.L1620:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %rsi	# MEM[(uint64_t *)b.114_69 + j_389 * 8], tmp3858
	cmpq	%rsi, (%r15,%rcx,8)	# tmp3858, MEM[(uint64_t *)a.115_70 + j_389 * 8]
	ja	.L855	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L856	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L762	#,
.L2300:
# sub.c:192:     } while (j < n);
	jbe	.L855	#,
.L758:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %r9	# MEM[(uint64_t *)b.114_69 + j_389 * 8], tmp3611
	cmpq	%r9, (%r15,%rcx,8)	# tmp3611, MEM[(uint64_t *)a.115_70 + j_389 * 8]
	ja	.L855	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L856	#,
# sub.c:185:         j++;
	leaq	1(%rcx), %rdx	#, tmp1556
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# tmp1556, sub_size
	je	.L762	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rdi	# MEM[(uint64_t *)b.114_69 + j_389 * 8], tmp3612
	cmpq	%rdi, (%r15,%rdx,8)	# tmp3612, MEM[(uint64_t *)a.115_70 + j_389 * 8]
	ja	.L855	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L856	#,
# sub.c:185:         j++;
	leaq	2(%rcx), %r10	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r10, %r12	# j, sub_size
	je	.L762	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%r10,8), %rsi	# MEM[(uint64_t *)b.114_69 + j_389 * 8], tmp3859
	cmpq	%rsi, (%r15,%r10,8)	# tmp3859, MEM[(uint64_t *)a.115_70 + j_389 * 8]
	ja	.L855	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L856	#,
# sub.c:185:         j++;
	addq	$3, %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L762	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %r9	# MEM[(uint64_t *)b.114_69 + j_389 * 8], tmp3860
	cmpq	%r9, (%r15,%rcx,8)	# tmp3860, MEM[(uint64_t *)a.115_70 + j_389 * 8]
	ja	.L855	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L856	#,
# sub.c:185:         j++;
	leaq	3(%rdx), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L762	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %rdi	# MEM[(uint64_t *)b.114_69 + j_389 * 8], tmp3861
	cmpq	%rdi, (%r15,%rcx,8)	# tmp3861, MEM[(uint64_t *)a.115_70 + j_389 * 8]
	ja	.L855	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L856	#,
# sub.c:185:         j++;
	leaq	4(%rdx), %r10	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r10, %r12	# j, sub_size
	je	.L762	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%r10,8), %rsi	# MEM[(uint64_t *)b.114_69 + j_389 * 8], tmp3862
	cmpq	%rsi, (%r15,%r10,8)	# tmp3862, MEM[(uint64_t *)a.115_70 + j_389 * 8]
	ja	.L855	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L856	#,
# sub.c:185:         j++;
	leaq	5(%rdx), %r9	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r9, %r12	# j, sub_size
	je	.L762	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%r9,8), %rcx	# MEM[(uint64_t *)b.114_69 + j_389 * 8], tmp3863
	cmpq	%rcx, (%r15,%r9,8)	# tmp3863, MEM[(uint64_t *)a.115_70 + j_389 * 8]
	ja	.L855	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L856	#,
# sub.c:185:         j++;
	leaq	6(%rdx), %r10	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r10, %r12	# j, sub_size
	je	.L762	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%r10,8), %rdi	# MEM[(uint64_t *)b.114_69 + j_389 * 8], tmp3864
	cmpq	%rdi, (%r15,%r10,8)	# tmp3864, MEM[(uint64_t *)a.115_70 + j_389 * 8]
	ja	.L855	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L856	#,
# sub.c:185:         j++;
	leaq	7(%rdx), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	jne	.L2300	#,
	jmp	.L762	#
	.p2align 4,,10
	.p2align 3
.L2320:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rdi)	# tmp946, MEM[(__mmask8 *)_1070]
	jmp	.L1033	#
.L2323:
	kmovb	%k1, (%rcx)	# tmp2300, MEM[(__mmask8 *)_1070]
	jmp	.L1041	#
.L2322:
	kmovb	%k6, (%rcx)	# tmp2294, MEM[(__mmask8 *)_1070]
	jmp	.L1038	#
.L2400:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	8(%r14), %r9	# MEM[(uint64_t *)b.130_105 + j_957 * 8], tmp3903
	cmpq	%r9, 8(%r15)	# tmp3903, MEM[(uint64_t *)a.131_106 + j_957 * 8]
	ja	.L876	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L877	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	jne	.L1649	#,
.L842:
# sub.c:1418:             for (int i = 0; i < niter; i++)
	incl	%r10d	# i
# sub.c:1418:             for (int i = 0; i < niter; i++)
	cmpl	%r10d, %r11d	# i, niter
	jne	.L832	#,
	vzeroupper
.L837:
# sub.c:1553:     getrusage(RUSAGE_SELF, &rus);
	movq	-66320(%rbp), %rsi	# %sfp,
	xorl	%edi, %edi	#
	movl	%r11d, -66344(%rbp)	# niter, %sfp
	call	getrusage@PLT	#
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	movq	-66184(%rbp), %r10	# MEM[(struct rusage *)_1655].ru_utime.tv_usec, MEM[(struct rusage *)_1655].ru_utime.tv_usec
	movabsq	$2361183241434822607, %r11	#, tmp1300
	movq	%r10, %rax	# MEM[(struct rusage *)_1655].ru_utime.tv_usec, tmp3244
	imulq	%r11	# tmp1300
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	imull	$1000, -66192(%rbp), %r12d	#, MEM[(struct rusage *)_1655].ru_utime.tv_sec, tmp1296
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	sarq	$63, %r10	#, tmp1302
	sarq	$7, %rdx	#, tmp1299
	subq	%r10, %rdx	# tmp1302, tmp1297
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC69(%rip), %rdi	#, tmp1303
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	addl	%edx, %r12d	# tmp1297, _1031
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	puts@PLT	#
# sub.c:1425:             ops_per_sec = 1000.0 * niter / t1;
	movl	-66344(%rbp), %r13d	# %sfp, niter
	vxorpd	%xmm10, %xmm10, %xmm10	# tmp3785
	vcvtsi2sdl	%r13d, %xmm10, %xmm11	# niter, tmp3785, tmp3021
	vmovsd	.LC70(%rip), %xmm12	#, tmp1304
# sub.c:1422:             t1 = cputime() - t0;
	movslq	%r12d, %r9	# _1031, _1031
# sub.c:1422:             t1 = cputime() - t0;
	subq	-66328(%rbp), %r9	# %sfp, t1
# sub.c:1425:             ops_per_sec = 1000.0 * niter / t1;
	vmulsd	%xmm11, %xmm12, %xmm13	# tmp3021, tmp1304, tmp1304
# sub.c:1425:             ops_per_sec = 1000.0 * niter / t1;
	vcvtusi2sdq	%r9, %xmm10, %xmm0	# t1, tmp3786, tmp3022
# sub.c:1430:                 if (ops_per_sec > f)
	vmovsd	.LC51(%rip), %xmm8	#, tmp1310
# sub.c:1428:             for (decimals = 0;; decimals++)
	xorl	%ebx, %ebx	# decimals
# sub.c:1425:             ops_per_sec = 1000.0 * niter / t1;
	vdivsd	%xmm0, %xmm13, %xmm14	# tmp1309, tmp1305, ops_per_sec
# sub.c:1430:                 if (ops_per_sec > f)
	vcomisd	%xmm8, %xmm14	# tmp1310, ops_per_sec
	ja	.L833	#,
	vmovsd	.LC71(%rip), %xmm15	#, tmp2137
.L834:
# sub.c:1432:                 f = f * 0.1;
	vmulsd	%xmm15, %xmm8, %xmm4	# tmp2137, f, f
# sub.c:1428:             for (decimals = 0;; decimals++)
	leal	1(%rbx), %esi	#, tmp1573
	movl	%esi, %ebx	# tmp1573, decimals
# sub.c:1430:                 if (ops_per_sec > f)
	vcomisd	%xmm4, %xmm14	# f, ops_per_sec
	ja	.L833	#,
# sub.c:1432:                 f = f * 0.1;
	vmulsd	%xmm15, %xmm4, %xmm1	# tmp2137, f, f
# sub.c:1428:             for (decimals = 0;; decimals++)
	incl	%ebx	# decimals
# sub.c:1430:                 if (ops_per_sec > f)
	vcomisd	%xmm1, %xmm14	# f, ops_per_sec
	ja	.L833	#,
# sub.c:1432:                 f = f * 0.1;
	vmulsd	%xmm15, %xmm1, %xmm7	# tmp2137, f, f
# sub.c:1428:             for (decimals = 0;; decimals++)
	leal	2(%rsi), %ebx	#, decimals
# sub.c:1430:                 if (ops_per_sec > f)
	vcomisd	%xmm7, %xmm14	# f, ops_per_sec
	ja	.L833	#,
# sub.c:1432:                 f = f * 0.1;
	vmulsd	%xmm15, %xmm7, %xmm3	# tmp2137, f, f
# sub.c:1428:             for (decimals = 0;; decimals++)
	leal	3(%rsi), %ebx	#, decimals
# sub.c:1430:                 if (ops_per_sec > f)
	vcomisd	%xmm3, %xmm14	# f, ops_per_sec
	ja	.L833	#,
# sub.c:1432:                 f = f * 0.1;
	vmulsd	%xmm15, %xmm3, %xmm2	# tmp2137, f, f
# sub.c:1428:             for (decimals = 0;; decimals++)
	leal	4(%rsi), %ebx	#, decimals
# sub.c:1430:                 if (ops_per_sec > f)
	vcomisd	%xmm2, %xmm14	# f, ops_per_sec
	ja	.L833	#,
# sub.c:1432:                 f = f * 0.1;
	vmulsd	%xmm15, %xmm2, %xmm6	# tmp2137, f, f
# sub.c:1428:             for (decimals = 0;; decimals++)
	leal	5(%rsi), %ebx	#, decimals
# sub.c:1430:                 if (ops_per_sec > f)
	vcomisd	%xmm6, %xmm14	# f, ops_per_sec
	ja	.L833	#,
# sub.c:1432:                 f = f * 0.1;
	vmulsd	%xmm15, %xmm6, %xmm5	# tmp2137, f, f
# sub.c:1428:             for (decimals = 0;; decimals++)
	leal	6(%rsi), %ebx	#, decimals
# sub.c:1430:                 if (ops_per_sec > f)
	vcomisd	%xmm5, %xmm14	# f, ops_per_sec
	ja	.L833	#,
# sub.c:1432:                 f = f * 0.1;
	vmulsd	%xmm15, %xmm5, %xmm8	# tmp2137, f, f
# sub.c:1428:             for (decimals = 0;; decimals++)
	leal	7(%rsi), %ebx	#, decimals
# sub.c:1430:                 if (ops_per_sec > f)
	vcomisd	%xmm8, %xmm14	# f, ops_per_sec
	jbe	.L834	#,
.L833:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vmovsd	%xmm14, %xmm14, %xmm0	# ops_per_sec,
	movl	%ebx, %edx	# decimals,
	leaq	.LC72(%rip), %rsi	#, tmp1341
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	vmovsd	%xmm14, -66320(%rbp)	# ops_per_sec, %sfp
	call	__printf_chk@PLT	#
# sub.c:1438:             gzprintf(cputime_file, "%.*f\n", decimals, ops_per_sec);
	vmovsd	-66320(%rbp), %xmm0	# %sfp, ops_per_sec
	movq	-66336(%rbp), %rdi	# %sfp,
	movl	%ebx, %edx	# decimals,
	leaq	.LC73(%rip), %rsi	#, tmp1342
	movl	$1, %eax	#,
	call	gzprintf@PLT	#
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:54:   free (__ptr);
	movq	%r15, %rdi	# a.131_106,
	call	free@PLT	#
	movq	%r14, %rdi	# b.130_105,
	call	free@PLT	#
# sub.c:1449:     gzclose(test_file);
	movq	-66312(%rbp), %rdi	# %sfp,
	call	gzclose@PLT	#
.L776:
# sub.c:1461:         gzclose(cputime_file);
	movq	-66336(%rbp), %rdi	# %sfp,
	call	gzclose@PLT	#
	jmp	.L813	#
.L2321:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k4, 1(%rdi)	# tmp2288, MEM[(__mmask8 *)_1070]
	jmp	.L1035	#
.L2359:
	kmovb	%k2, 2(%rbx)	# tmp2232, MEM[(__mmask8 *)_921]
	jmp	.L984	#
.L2358:
	kmovb	%k7, 1(%rbx)	# tmp2224, MEM[(__mmask8 *)_921]
	jmp	.L982	#
.L2357:
	kmovb	%k5, 1(%rcx)	# tmp1861, MEM[(__mmask8 *)_921]
	jmp	.L980	#
.L739:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC62(%rip), %rdi	#, tmp1020
	call	puts@PLT	#
# sub.c:1373:             fflush(stdout);
	movq	stdout(%rip), %rdi	# stdout,
	call	fflush@PLT	#
# sub.c:1374:             __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);
	xorl	%eax, %eax	# tmp1022
#APP
# 1374 "sub.c" 1
	cpuid
		
# 0 "" 2
# sub.c:1375:             TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
#NO_APP
	movq	-66224(%rbp), %r15	# b, b.122_89
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %rdi	# sub_space_ptr, sub_space_ptr
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %rsi	# sub_space, sub_space
# sub.c:1375:             TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
	movq	-66288(%rbp), %r14	# a, a.123_90
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15), %rcx	# MEM[(uint64_t *)b.122_89 + j_551 * 8], tmp3661
	leaq	-1(%r12), %r8	#, tmp1667
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%rsi,%rdi,8), %rdx	#, result
	andl	$7, %r8d	#, tmp1669
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%rcx, (%r14)	# tmp3661, MEM[(uint64_t *)a.123_90 + j_551 * 8]
	jbe	.L2361	#,
.L861:
	movq	%r15, %r10	# b.122_89, b
	movq	%r14, %r8	# a.123_90, a
.L777:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8), %zmm4	# MEM[(__m512i * {ref-all})a_573 + i_571 * 8], tmp3664
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %rcx	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r10), %zmm4, %zmm0	# MEM[(__m512i * {ref-all})b_576 + i_571 * 8], tmp3664, tmp1054
	leaq	-1(%r12), %r9	#, tmp1663
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k1	#, zeros, tmp1054, tmp1056
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm0, %zmm1	# tmp1054, tmp1054
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %rcx	# borrow_space, ivtmp.695
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm0, %zmm1{%k1}	# limb_digits, tmp1054, tmp1054, tmp1056, tmp1054
	shrq	$3, %r9	#, tmp1661
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rdx)	# tmp1060, MEM[(__m512i * {ref-all})result_550 + i_571 * 8]
	andl	$3, %r9d	#, tmp1664
# sub.c:217:         i += 8;
	movl	$8, %ebx	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%rcx), %rsi	#, ivtmp.704
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, (%rcx)	# tmp1056, MEM[(__mmask8 *)_680]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %r12	#, sub_size
	jbe	.L1947	#,
	testq	%r9, %r9	# tmp1664
	je	.L781	#,
	cmpq	$1, %r9	#, tmp1664
	je	.L1701	#,
	cmpq	$2, %r9	#, tmp1664
	jne	.L2362	#,
.L1702:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rbx,8), %zmm5	# MEM[(__m512i * {ref-all})a_573 + i_571 * 8], tmp4025
# sub.c:219:     } while (likely(i < n));
	incq	%rsi	# ivtmp.704
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r10,%rbx,8), %zmm5, %zmm6	# MEM[(__m512i * {ref-all})b_576 + i_571 * 8], tmp4025, tmp2924
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k3	#, zeros, tmp2924, tmp2926
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm6, %zmm8	# tmp2924, tmp2924
	vpaddq	limb_digits(%rip), %zmm6, %zmm8{%k3}	# limb_digits, tmp2924, tmp2924, tmp2926, tmp2924
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rdx,%rbx,8)	# tmp2928, MEM[(__m512i * {ref-all})result_550 + i_571 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rbx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, -1(%rsi)	# tmp2926, MEM[(__mmask8 *)_680]
.L1701:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rbx,8), %zmm9	# MEM[(__m512i * {ref-all})a_573 + i_571 * 8], tmp4027
# sub.c:219:     } while (likely(i < n));
	incq	%rsi	# ivtmp.704
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r10,%rbx,8), %zmm9, %zmm10	# MEM[(__m512i * {ref-all})b_576 + i_571 * 8], tmp4027, tmp2930
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k4	#, zeros, tmp2930, tmp2932
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm10, %zmm11	# tmp2930, tmp2930
	vpaddq	limb_digits(%rip), %zmm10, %zmm11{%k4}	# limb_digits, tmp2930, tmp2930, tmp2932, tmp2930
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rdx,%rbx,8)	# tmp2934, MEM[(__m512i * {ref-all})result_550 + i_571 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rbx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, -1(%rsi)	# tmp2932, MEM[(__mmask8 *)_680]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rbx, %r12	# i, sub_size
	jbe	.L1947	#,
.L781:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rbx,8), %zmm12	# MEM[(__m512i * {ref-all})a_573 + i_571 * 8], tmp3666
# sub.c:217:         i += 8;
	leaq	8(%rbx), %r11	#, tmp1665
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r10,%rbx,8), %zmm12, %zmm13	# MEM[(__m512i * {ref-all})b_576 + i_571 * 8], tmp3666, tmp1872
# sub.c:217:         i += 8;
	leaq	16(%rbx), %rdi	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k5	#, zeros, tmp1872, tmp1874
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm13, %zmm14	# tmp1872, tmp1872
# sub.c:217:         i += 8;
	leaq	24(%rbx), %rax	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm13, %zmm14{%k5}	# limb_digits, tmp1872, tmp1872, tmp1874, tmp1872
# sub.c:219:     } while (likely(i < n));
	addq	$4, %rsi	#, ivtmp.704
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rdx,%rbx,8)	# tmp1876, MEM[(__m512i * {ref-all})result_550 + i_571 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, -4(%rsi)	# tmp1874, MEM[(__mmask8 *)_680]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%r11,8), %zmm15	# MEM[(__m512i * {ref-all})a_573 + i_571 * 8], tmp3668
# sub.c:217:         i += 8;
	addq	$32, %rbx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r10,%r11,8), %zmm15, %zmm4	# MEM[(__m512i * {ref-all})b_576 + i_571 * 8], tmp3668, tmp1880
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm4, %k6	#, zeros, tmp1880, tmp1882
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm4, %zmm0	# tmp1880, tmp1880
	vpaddq	limb_digits(%rip), %zmm4, %zmm0{%k6}	# limb_digits, tmp1880, tmp1880, tmp1882, tmp1880
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rdx,%r11,8)	# tmp1884, MEM[(__m512i * {ref-all})result_550 + i_571 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, -3(%rsi)	# tmp1882, MEM[(__mmask8 *)_680]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rdi,8), %zmm1	# MEM[(__m512i * {ref-all})a_573 + i_571 * 8], tmp3670
	vpsubq	(%r10,%rdi,8), %zmm1, %zmm7	# MEM[(__m512i * {ref-all})b_576 + i_571 * 8], tmp3670, tmp1888
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm7, %k7	#, zeros, tmp1888, tmp1890
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm7, %zmm2	# tmp1888, tmp1888
	vpaddq	limb_digits(%rip), %zmm7, %zmm2{%k7}	# limb_digits, tmp1888, tmp1888, tmp1890, tmp1888
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, (%rdx,%rdi,8)	# tmp1892, MEM[(__m512i * {ref-all})result_550 + i_571 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, -2(%rsi)	# tmp1890, MEM[(__mmask8 *)_680]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rax,8), %zmm3	# MEM[(__m512i * {ref-all})a_573 + i_571 * 8], tmp3672
	vpsubq	(%r10,%rax,8), %zmm3, %zmm5	# MEM[(__m512i * {ref-all})b_576 + i_571 * 8], tmp3672, tmp1896
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k1	#, zeros, tmp1896, tmp1898
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm5, %zmm6	# tmp1896, tmp1896
	vpaddq	limb_digits(%rip), %zmm5, %zmm6{%k1}	# limb_digits, tmp1896, tmp1896, tmp1898, tmp1896
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rdx,%rax,8)	# tmp1900, MEM[(__m512i * {ref-all})result_550 + i_571 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, -1(%rsi)	# tmp1898, MEM[(__mmask8 *)_680]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rbx, %r12	# i, sub_size
	ja	.L781	#,
.L1947:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm8	# zeros, tmp3674
	leaq	-1(%r12), %r10	#, tmp1657
	vmovdqu64	%zmm8, (%rdx,%r12,8)	# tmp3674, MEM[(__m512i_u * {ref-all})_597]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx), %zmm9	# MEM[(__m512i * {ref-all})result_550 + i_1700 * 8], _1696
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %r8d	# MEM[(__mmask8 *)_674], MEM[(__mmask8 *)_674]
	shrq	$3, %r10	#, tmp1655
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k2	# MEM[(__mmask8 *)_674], tmp3675
	vpsubq	ones(%rip), %zmm9, %zmm9{%k2}	# ones, _1696, tmp1066, tmp3675, _1696
	andl	$3, %r10d	#, tmp1658
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rdx)	# tmp1066, MEM[(__m512i * {ref-all})result_550 + i_1700 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k0	#, zeros, tmp1066, tmp1072
	kmovb	%k0, %r9d	# tmp1072, tmp1072
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%r9b, %r9b	# tmp1072
	jne	.L2363	#,
.L1483:
# sub.c:249:         i += 8;
	movl	$8, %ebx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.695
	cmpq	$8, %r12	#, sub_size
	jbe	.L2281	#,
	testq	%r10, %r10	# tmp1658
	je	.L783	#,
	cmpq	$1, %r10	#, tmp1658
	je	.L1699	#,
	cmpq	$2, %r10	#, tmp1658
	je	.L1700	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%rbx,8), %zmm10	# MEM[(__m512i * {ref-all})result_550 + i_1700 * 8], _1696
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %esi	# MEM[(__mmask8 *)_674], MEM[(__mmask8 *)_674]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k3	# MEM[(__mmask8 *)_674], tmp4015
	vpsubq	ones(%rip), %zmm10, %zmm10{%k3}	# ones, _1696, tmp2886, tmp4015, _1696
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, (%rdx,%rbx,8)	# tmp2886, MEM[(__m512i * {ref-all})result_550 + i_1700 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k4	#, zeros, tmp2886, tmp2888
	kmovb	%k4, %r11d	# tmp2888, tmp2888
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%r11b, %r11b	# tmp2888
	jne	.L2364	#,
.L1485:
# sub.c:249:         i += 8;
	addq	$8, %rbx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.695
.L1700:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%rbx,8), %zmm11	# MEM[(__m512i * {ref-all})result_550 + i_1700 * 8], _1696
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %edi	# MEM[(__mmask8 *)_674], MEM[(__mmask8 *)_674]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k5	# MEM[(__mmask8 *)_674], tmp4017
	vpsubq	ones(%rip), %zmm11, %zmm11{%k5}	# ones, _1696, tmp2892, tmp4017, _1696
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rdx,%rbx,8)	# tmp2892, MEM[(__m512i * {ref-all})result_550 + i_1700 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm11, %k6	#, zeros, tmp2892, tmp2894
	kmovb	%k6, %eax	# tmp2894, tmp2894
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%al, %al	# tmp2894
	jne	.L2365	#,
.L1488:
# sub.c:249:         i += 8;
	addq	$8, %rbx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.695
.L1699:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%rbx,8), %zmm12	# MEM[(__m512i * {ref-all})result_550 + i_1700 * 8], _1696
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %r10d	# MEM[(__mmask8 *)_674], MEM[(__mmask8 *)_674]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r10d, %k7	# MEM[(__mmask8 *)_674], tmp4019
	vpsubq	ones(%rip), %zmm12, %zmm12{%k7}	# ones, _1696, tmp2898, tmp4019, _1696
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm12, (%rdx,%rbx,8)	# tmp2898, MEM[(__m512i * {ref-all})result_550 + i_1700 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k1	#, zeros, tmp2898, tmp2900
	kmovb	%k1, %r8d	# tmp2900, tmp2900
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%r8b, %r8b	# tmp2900
	jne	.L2366	#,
.L1491:
# sub.c:249:         i += 8;
	addq	$8, %rbx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.695
	cmpq	%rbx, %r12	# i, sub_size
	ja	.L783	#,
.L2281:
	vzeroupper
.L784:
# sub.c:229:     i = 0;
	movq	$1, -66328(%rbp)	#, %sfp
	leaq	-66192(%rbp), %rbx	#, tmp1478
	.p2align 4,,10
	.p2align 3
.L1597:
# sub.c:1527:     clock_gettime(CLOCK_MONOTONIC_RAW, &ts);
	movq	%rbx, %rsi	# tmp1478,
	movl	$4, %edi	#,
# sub.c:1375:             TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
	salq	-66328(%rbp)	# %sfp
# sub.c:1527:     clock_gettime(CLOCK_MONOTONIC_RAW, &ts);
	call	clock_gettime@PLT	#
# sub.c:1528:     return ts;
	movq	-66192(%rbp), %rdx	# MEM <__time_t> [(struct timespec *)_1655], SR.205
	movq	-66184(%rbp), %r8	# MEM <__syscall_slong_t> [(struct timespec *)_1655], SR.206
	movq	-66328(%rbp), %r9	# %sfp, __times
	movq	%rdx, -66336(%rbp)	# SR.205, %sfp
	movq	%r8, -66320(%rbp)	# SR.206, %sfp
	movl	%r9d, %r11d	# __times, _671
# sub.c:1375:             TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
	xorl	%r10d, %r10d	# __t
	testq	%r9, %r9	# __times
	jle	.L791	#,
	.p2align 4,,10
	.p2align 3
.L790:
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %rsi	# sub_space_ptr, sub_space_ptr
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %rdi	# sub_space, sub_space
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15), %rcx	# MEM[(uint64_t *)b.122_89 + j_624 * 8], tmp3684
	leaq	-1(%r12), %rdx	#, tmp1651
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%rdi,%rsi,8), %rax	#, result
	andl	$7, %edx	#, tmp1653
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%rcx, (%r14)	# tmp3684, MEM[(uint64_t *)a.123_90 + j_624 * 8]
	jbe	.L2367	#,
.L863:
	movq	%r15, %rsi	# b.122_89, b
	movq	%r14, %r8	# a.123_90, a
.L788:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8), %zmm0	# MEM[(__m512i * {ref-all})a_646 + i_644 * 8], tmp3687
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %rdi	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi), %zmm0, %zmm7	# MEM[(__m512i * {ref-all})b_649 + i_644 * 8], tmp3687, tmp1085
	leaq	-1(%r12), %r9	#, tmp1647
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm7, %k2	#, zeros, tmp1085, tmp1087
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm7, %zmm1	# tmp1085, tmp1085
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %rdi	# borrow_space, ivtmp.668
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm7, %zmm1{%k2}	# limb_digits, tmp1085, tmp1085, tmp1087, tmp1085
	shrq	$3, %r9	#, tmp1645
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rax)	# tmp1091, MEM[(__m512i * {ref-all})result_623 + i_644 * 8]
	andl	$3, %r9d	#, tmp1648
# sub.c:217:         i += 8;
	movl	$8, %edx	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%rdi), %rcx	#, ivtmp.677
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, (%rdi)	# tmp1087, MEM[(__mmask8 *)_1062]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %r12	#, sub_size
	jbe	.L1953	#,
	testq	%r9, %r9	# tmp1648
	je	.L793	#,
	cmpq	$1, %r9	#, tmp1648
	je	.L1689	#,
	cmpq	$2, %r9	#, tmp1648
	je	.L1690	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%r8), %zmm2	# MEM[(__m512i * {ref-all})a_646 + i_644 * 8], tmp3996
# sub.c:217:         i += 8;
	movl	$16, %edx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%rsi), %zmm2, %zmm3	# MEM[(__m512i * {ref-all})b_649 + i_644 * 8], tmp3996, tmp2834
# sub.c:219:     } while (likely(i < n));
	leaq	2(%rdi), %rcx	#, ivtmp.677
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k3	#, zeros, tmp2834, tmp2836
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm3, %zmm5	# tmp2834, tmp2834
	vpaddq	limb_digits(%rip), %zmm3, %zmm5{%k3}	# limb_digits, tmp2834, tmp2834, tmp2836, tmp2834
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, 64(%rax)	# tmp2838, MEM[(__m512i * {ref-all})result_623 + i_644 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, 1(%rdi)	# tmp2836, MEM[(__mmask8 *)_1062]
.L1690:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rdx,8), %zmm6	# MEM[(__m512i * {ref-all})a_646 + i_644 * 8], tmp3998
# sub.c:219:     } while (likely(i < n));
	incq	%rcx	# ivtmp.677
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi,%rdx,8), %zmm6, %zmm8	# MEM[(__m512i * {ref-all})b_649 + i_644 * 8], tmp3998, tmp2840
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm8, %k4	#, zeros, tmp2840, tmp2842
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm8, %zmm9	# tmp2840, tmp2840
	vpaddq	limb_digits(%rip), %zmm8, %zmm9{%k4}	# limb_digits, tmp2840, tmp2840, tmp2842, tmp2840
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rax,%rdx,8)	# tmp2844, MEM[(__m512i * {ref-all})result_623 + i_644 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rdx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, -1(%rcx)	# tmp2842, MEM[(__mmask8 *)_1062]
.L1689:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rdx,8), %zmm10	# MEM[(__m512i * {ref-all})a_646 + i_644 * 8], tmp4000
# sub.c:219:     } while (likely(i < n));
	incq	%rcx	# ivtmp.677
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi,%rdx,8), %zmm10, %zmm11	# MEM[(__m512i * {ref-all})b_649 + i_644 * 8], tmp4000, tmp2846
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm11, %k5	#, zeros, tmp2846, tmp2848
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm11, %zmm12	# tmp2846, tmp2846
	vpaddq	limb_digits(%rip), %zmm11, %zmm12{%k5}	# limb_digits, tmp2846, tmp2846, tmp2848, tmp2846
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm12, (%rax,%rdx,8)	# tmp2850, MEM[(__m512i * {ref-all})result_623 + i_644 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rdx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, -1(%rcx)	# tmp2848, MEM[(__mmask8 *)_1062]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rdx, %r12	# i, sub_size
	jbe	.L1953	#,
.L793:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rdx,8), %zmm13	# MEM[(__m512i * {ref-all})a_646 + i_644 * 8], tmp3689
# sub.c:217:         i += 8;
	leaq	8(%rdx), %r9	#, tmp1649
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi,%rdx,8), %zmm13, %zmm14	# MEM[(__m512i * {ref-all})b_649 + i_644 * 8], tmp3689, tmp1926
# sub.c:219:     } while (likely(i < n));
	addq	$4, %rcx	#, ivtmp.677
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k6	#, zeros, tmp1926, tmp1928
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm14, %zmm15	# tmp1926, tmp1926
	vpaddq	limb_digits(%rip), %zmm14, %zmm15{%k6}	# limb_digits, tmp1926, tmp1926, tmp1928, tmp1926
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, (%rax,%rdx,8)	# tmp1930, MEM[(__m512i * {ref-all})result_623 + i_644 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, -4(%rcx)	# tmp1928, MEM[(__mmask8 *)_1062]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%r9,8), %zmm4	# MEM[(__m512i * {ref-all})a_646 + i_644 * 8], tmp3691
	vpsubq	(%rsi,%r9,8), %zmm4, %zmm0	# MEM[(__m512i * {ref-all})b_649 + i_644 * 8], tmp3691, tmp1934
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k7	#, zeros, tmp1934, tmp1936
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm0, %zmm7	# tmp1934, tmp1934
	vpaddq	limb_digits(%rip), %zmm0, %zmm7{%k7}	# limb_digits, tmp1934, tmp1934, tmp1936, tmp1934
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm7, (%rax,%r9,8)	# tmp1938, MEM[(__m512i * {ref-all})result_623 + i_644 * 8]
# sub.c:217:         i += 8;
	leaq	16(%rdx), %r9	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, -3(%rcx)	# tmp1936, MEM[(__mmask8 *)_1062]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%r9,8), %zmm1	# MEM[(__m512i * {ref-all})a_646 + i_644 * 8], tmp3693
	vpsubq	(%rsi,%r9,8), %zmm1, %zmm2	# MEM[(__m512i * {ref-all})b_649 + i_644 * 8], tmp3693, tmp1942
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k1	#, zeros, tmp1942, tmp1944
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm2, %zmm3	# tmp1942, tmp1942
	vpaddq	limb_digits(%rip), %zmm2, %zmm3{%k1}	# limb_digits, tmp1942, tmp1942, tmp1944, tmp1942
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rax,%r9,8)	# tmp1946, MEM[(__m512i * {ref-all})result_623 + i_644 * 8]
# sub.c:217:         i += 8;
	leaq	24(%rdx), %r9	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, -2(%rcx)	# tmp1944, MEM[(__mmask8 *)_1062]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%r9,8), %zmm5	# MEM[(__m512i * {ref-all})a_646 + i_644 * 8], tmp3695
# sub.c:217:         i += 8;
	addq	$32, %rdx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi,%r9,8), %zmm5, %zmm6	# MEM[(__m512i * {ref-all})b_649 + i_644 * 8], tmp3695, tmp1950
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k2	#, zeros, tmp1950, tmp1952
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm6, %zmm8	# tmp1950, tmp1950
	vpaddq	limb_digits(%rip), %zmm6, %zmm8{%k2}	# limb_digits, tmp1950, tmp1950, tmp1952, tmp1950
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rax,%r9,8)	# tmp1954, MEM[(__m512i * {ref-all})result_623 + i_644 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, -1(%rcx)	# tmp1952, MEM[(__mmask8 *)_1062]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rdx, %r12	# i, sub_size
	ja	.L793	#,
.L1953:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm9	# zeros, tmp3697
	leaq	-1(%r12), %rsi	#, tmp1641
	vmovdqu64	%zmm9, (%rax,%r13)	# tmp3697, MEM[(__m512i_u * {ref-all})_670]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax), %zmm10	# MEM[(__m512i * {ref-all})result_623 + i_1720 * 8], _1716
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rdi), %r8d	# MEM[(__mmask8 *)_764], MEM[(__mmask8 *)_764]
	shrq	$3, %rsi	#, tmp1639
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k3	# MEM[(__mmask8 *)_764], tmp3698
	vpsubq	ones(%rip), %zmm10, %zmm10{%k3}	# ones, _1716, tmp1097, tmp3698, _1716
	andl	$3, %esi	#, tmp1642
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, (%rax)	# tmp1097, MEM[(__m512i * {ref-all})result_623 + i_1720 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k0	#, zeros, tmp1097, tmp1103
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp1103
	jne	.L2368	#,
.L1419:
# sub.c:249:         i += 8;
	movl	$8, %edx	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rdi), %rcx	#, ivtmp.668
	cmpq	$8, %r12	#, sub_size
	jbe	.L796	#,
	testq	%rsi, %rsi	# tmp1642
	je	.L795	#,
	cmpq	$1, %rsi	#, tmp1642
	je	.L1687	#,
	cmpq	$2, %rsi	#, tmp1642
	je	.L1688	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	64(%rax), %zmm11	# MEM[(__m512i * {ref-all})result_623 + i_1720 * 8], _1716
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rdi), %r9d	# MEM[(__mmask8 *)_764], MEM[(__mmask8 *)_764]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k4	# MEM[(__mmask8 *)_764], tmp3991
	vpsubq	ones(%rip), %zmm11, %zmm11{%k4}	# ones, _1716, tmp2802, tmp3991, _1716
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, 64(%rax)	# tmp2802, MEM[(__m512i * {ref-all})result_623 + i_1720 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm11, %k5	#, zeros, tmp2802, tmp2804
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k5, %k5	# tmp2804
	jne	.L2369	#,
.L1421:
# sub.c:249:         i += 8;
	addq	$8, %rdx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.668
.L1688:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm12	# MEM[(__m512i * {ref-all})result_623 + i_1720 * 8], _1716
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %edi	# MEM[(__mmask8 *)_764], MEM[(__mmask8 *)_764]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k6	# MEM[(__mmask8 *)_764], tmp3992
	vpsubq	ones(%rip), %zmm12, %zmm12{%k6}	# ones, _1716, tmp2808, tmp3992, _1716
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm12, (%rax,%rdx,8)	# tmp2808, MEM[(__m512i * {ref-all})result_623 + i_1720 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k7	#, zeros, tmp2808, tmp2810
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k7, %k7	# tmp2810
	jne	.L2370	#,
.L1424:
# sub.c:249:         i += 8;
	addq	$8, %rdx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.668
.L1687:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm13	# MEM[(__m512i * {ref-all})result_623 + i_1720 * 8], _1716
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %esi	# MEM[(__mmask8 *)_764], MEM[(__mmask8 *)_764]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k1	# MEM[(__mmask8 *)_764], tmp3993
	vpsubq	ones(%rip), %zmm13, %zmm13{%k1}	# ones, _1716, tmp2814, tmp3993, _1716
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rax,%rdx,8)	# tmp2814, MEM[(__m512i * {ref-all})result_623 + i_1720 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k2	#, zeros, tmp2814, tmp2816
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k2, %k2	# tmp2816
	jne	.L2371	#,
.L1427:
# sub.c:249:         i += 8;
	addq	$8, %rdx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.668
	cmpq	%rdx, %r12	# i, sub_size
	ja	.L795	#,
	jmp	.L796	#
	.p2align 4,,10
	.p2align 3
.L794:
# sub.c:249:         i += 8;
	addq	$8, %rdx	#, tmp1643
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm15	# MEM[(__m512i * {ref-all})result_623 + i_1720 * 8], _1716
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rcx), %edi	# MEM[(__mmask8 *)_764], MEM[(__mmask8 *)_764]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rcx), %r9	#, tmp1644
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k4	# MEM[(__mmask8 *)_764], tmp3700
	vpsubq	ones(%rip), %zmm15, %zmm15{%k4}	# ones, _1716, tmp1968, tmp3700, _1716
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, (%rax,%rdx,8)	# tmp1968, MEM[(__m512i * {ref-all})result_623 + i_1720 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k5	#, zeros, tmp1968, tmp1970
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k5, %k5	# tmp1970
	jne	.L2372	#,
.L1430:
# sub.c:249:         i += 8;
	leaq	8(%rdx), %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm4	# MEM[(__m512i * {ref-all})result_623 + i_1720 * 8], _1716
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%r9), %esi	# MEM[(__mmask8 *)_764], MEM[(__mmask8 *)_764]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k6	# MEM[(__mmask8 *)_764], tmp3994
	vpsubq	ones(%rip), %zmm4, %zmm4{%k6}	# ones, _1716, tmp2822, tmp3994, _1716
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm4, (%rax,%rcx,8)	# tmp2822, MEM[(__m512i * {ref-all})result_623 + i_1720 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm4, %k7	#, zeros, tmp2822, tmp2824
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k7, %k7	# tmp2824
	jne	.L2373	#,
.L1432:
# sub.c:249:         i += 8;
	leaq	16(%rdx), %r8	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r8,8), %zmm0	# MEM[(__m512i * {ref-all})result_623 + i_1720 * 8], _1716
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%r9), %edi	# MEM[(__mmask8 *)_764], MEM[(__mmask8 *)_764]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k1	# MEM[(__mmask8 *)_764], tmp3995
	vpsubq	ones(%rip), %zmm0, %zmm0{%k1}	# ones, _1716, tmp2830, tmp3995, _1716
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rax,%r8,8)	# tmp2830, MEM[(__m512i * {ref-all})result_623 + i_1720 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k2	#, zeros, tmp2830, tmp2832
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k2, %k2	# tmp2832
	jne	.L2374	#,
.L1434:
# sub.c:249:         i += 8;
	addq	$24, %rdx	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%r9), %rcx	#, ivtmp.668
	cmpq	%rdx, %r12	# i, sub_size
	jbe	.L796	#,
.L795:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm14	# MEM[(__m512i * {ref-all})result_623 + i_1720 * 8], _1716
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %r8d	# MEM[(__mmask8 *)_764], MEM[(__mmask8 *)_764]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k3	# MEM[(__mmask8 *)_764], tmp3699
	vpsubq	ones(%rip), %zmm14, %zmm14{%k3}	# ones, _1716, tmp1960, tmp3699, _1716
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rax,%rdx,8)	# tmp1960, MEM[(__m512i * {ref-all})result_623 + i_1720 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k0	#, zeros, tmp1960, tmp1962
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp1962
	je	.L794	#,
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rcx)	# tmp1962, MEM[(__mmask8 *)_764]
	jmp	.L794	#
.L2378:
	kmovb	%k0, (%rcx)	# tmp1908, MEM[(__mmask8 *)_674]
.L782:
# sub.c:249:         i += 8;
	addq	$8, %rbx	#, tmp1659
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%rbx,8), %zmm14	# MEM[(__m512i * {ref-all})result_550 + i_1700 * 8], _1696
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rcx), %r11d	# MEM[(__mmask8 *)_674], MEM[(__mmask8 *)_674]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rcx), %rsi	#, tmp1660
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r11d, %k3	# MEM[(__mmask8 *)_674], tmp3678
	vpsubq	ones(%rip), %zmm14, %zmm14{%k3}	# ones, _1696, tmp1914, tmp3678, _1696
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rdx,%rbx,8)	# tmp1914, MEM[(__m512i * {ref-all})result_550 + i_1700 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k4	#, zeros, tmp1914, tmp1916
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k4, %k4	# tmp1916
	jne	.L2375	#,
.L1494:
# sub.c:249:         i += 8;
	leaq	8(%rbx), %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%rcx,8), %zmm15	# MEM[(__m512i * {ref-all})result_550 + i_1700 * 8], _1696
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rsi), %edi	# MEM[(__mmask8 *)_674], MEM[(__mmask8 *)_674]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k5	# MEM[(__mmask8 *)_674], tmp4021
	vpsubq	ones(%rip), %zmm15, %zmm15{%k5}	# ones, _1696, tmp2906, tmp4021, _1696
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, (%rdx,%rcx,8)	# tmp2906, MEM[(__m512i * {ref-all})result_550 + i_1700 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k6	#, zeros, tmp2906, tmp2908
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k6, %k6	# tmp2908
	jne	.L2376	#,
.L1496:
# sub.c:249:         i += 8;
	leaq	16(%rbx), %rax	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%rax,8), %zmm4	# MEM[(__m512i * {ref-all})result_550 + i_1700 * 8], _1696
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%rsi), %r10d	# MEM[(__mmask8 *)_674], MEM[(__mmask8 *)_674]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r10d, %k7	# MEM[(__mmask8 *)_674], tmp4022
	vpsubq	ones(%rip), %zmm4, %zmm4{%k7}	# ones, _1696, tmp2914, tmp4022, _1696
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm4, (%rdx,%rax,8)	# tmp2914, MEM[(__m512i * {ref-all})result_550 + i_1700 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm4, %k1	#, zeros, tmp2914, tmp2916
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k1, %k1	# tmp2916
	jne	.L2377	#,
.L1498:
# sub.c:249:         i += 8;
	addq	$24, %rbx	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%rsi), %rcx	#, ivtmp.695
	cmpq	%rbx, %r12	# i, sub_size
	jbe	.L2281	#,
.L783:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%rbx,8), %zmm13	# MEM[(__m512i * {ref-all})result_550 + i_1700 * 8], _1696
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %r9d	# MEM[(__mmask8 *)_674], MEM[(__mmask8 *)_674]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k2	# MEM[(__mmask8 *)_674], tmp3677
	vpsubq	ones(%rip), %zmm13, %zmm13{%k2}	# ones, _1696, tmp1906, tmp3677, _1696
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rdx,%rbx,8)	# tmp1906, MEM[(__m512i * {ref-all})result_550 + i_1700 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k0	#, zeros, tmp1906, tmp1908
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp1908
	je	.L782	#,
	jmp	.L2378	#
.L723:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC31(%rip), %rsi	#, tmp1462
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1481
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC32(%rip), %r8	#,
	movq	%r12, %rdi	# tmp1481,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %edi	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%rdi	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-65712(%rbp), %r13	#, tmp1474
	leaq	.LC87(%rip), %r8	#,
	jmp	.L2297	#
.L2353:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%r8)	# tmp1013, MEM[(__mmask8 *)_921]
	jmp	.L969	#
.L2352:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L860	#,
# sub.c:185:         j++;
	movl	$1, %edx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %r12	#, sub_size
	je	.L773	#,
# sub.c:192:     } while (j < n);
	jbe	.L859	#,
	testq	%rsi, %rsi	# tmp1539
	je	.L769	#,
	cmpq	$1, %rsi	#, tmp1539
	je	.L1608	#,
	cmpq	$2, %rsi	#, tmp1539
	je	.L1609	#,
	cmpq	$3, %rsi	#, tmp1539
	je	.L1610	#,
	cmpq	$4, %rsi	#, tmp1539
	je	.L1611	#,
	cmpq	$5, %rsi	#, tmp1539
	je	.L1612	#,
	cmpq	$6, %rsi	#, tmp1539
	jne	.L2379	#,
.L1613:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rdi	# MEM[(uint64_t *)b.114_69 + j_473 * 8], tmp3829
	cmpq	%rdi, (%r15,%rdx,8)	# tmp3829, MEM[(uint64_t *)a.115_70 + j_473 * 8]
	ja	.L859	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L860	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L773	#,
.L1612:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %r8	# MEM[(uint64_t *)b.114_69 + j_473 * 8], tmp3830
	cmpq	%r8, (%r15,%rdx,8)	# tmp3830, MEM[(uint64_t *)a.115_70 + j_473 * 8]
	ja	.L859	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L860	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L773	#,
.L1611:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rcx	# MEM[(uint64_t *)b.114_69 + j_473 * 8], tmp3831
	cmpq	%rcx, (%r15,%rdx,8)	# tmp3831, MEM[(uint64_t *)a.115_70 + j_473 * 8]
	ja	.L859	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L860	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L773	#,
.L1610:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rsi	# MEM[(uint64_t *)b.114_69 + j_473 * 8], tmp3832
	cmpq	%rsi, (%r15,%rdx,8)	# tmp3832, MEM[(uint64_t *)a.115_70 + j_473 * 8]
	ja	.L859	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L860	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L773	#,
.L1609:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rbx	# MEM[(uint64_t *)b.114_69 + j_473 * 8], tmp3833
	cmpq	%rbx, (%r15,%rdx,8)	# tmp3833, MEM[(uint64_t *)a.115_70 + j_473 * 8]
	ja	.L859	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L860	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L773	#,
.L1608:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %r9	# MEM[(uint64_t *)b.114_69 + j_473 * 8], tmp3834
	cmpq	%r9, (%r15,%rdx,8)	# tmp3834, MEM[(uint64_t *)a.115_70 + j_473 * 8]
	ja	.L859	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L860	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L773	#,
.L2301:
# sub.c:192:     } while (j < n);
	jbe	.L859	#,
.L769:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rdi	# MEM[(uint64_t *)b.114_69 + j_473 * 8], tmp3644
	cmpq	%rdi, (%r15,%rdx,8)	# tmp3644, MEM[(uint64_t *)a.115_70 + j_473 * 8]
	ja	.L859	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L860	#,
# sub.c:185:         j++;
	leaq	1(%rdx), %r8	#, tmp1540
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r8, %r12	# tmp1540, sub_size
	je	.L773	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%r8,8), %rcx	# MEM[(uint64_t *)b.114_69 + j_473 * 8], tmp3645
	cmpq	%rcx, (%r15,%r8,8)	# tmp3645, MEM[(uint64_t *)a.115_70 + j_473 * 8]
	ja	.L859	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L860	#,
# sub.c:185:         j++;
	leaq	2(%rdx), %rsi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rsi, %r12	# j, sub_size
	je	.L773	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rsi,8), %rbx	# MEM[(uint64_t *)b.114_69 + j_473 * 8], tmp3835
	cmpq	%rbx, (%r15,%rsi,8)	# tmp3835, MEM[(uint64_t *)a.115_70 + j_473 * 8]
	ja	.L859	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L860	#,
# sub.c:185:         j++;
	addq	$3, %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L773	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %r9	# MEM[(uint64_t *)b.114_69 + j_473 * 8], tmp3836
	cmpq	%r9, (%r15,%rdx,8)	# tmp3836, MEM[(uint64_t *)a.115_70 + j_473 * 8]
	ja	.L859	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L860	#,
# sub.c:185:         j++;
	leaq	3(%r8), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L773	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rdi	# MEM[(uint64_t *)b.114_69 + j_473 * 8], tmp3837
	cmpq	%rdi, (%r15,%rdx,8)	# tmp3837, MEM[(uint64_t *)a.115_70 + j_473 * 8]
	ja	.L859	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L860	#,
# sub.c:185:         j++;
	leaq	4(%r8), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L773	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %rsi	# MEM[(uint64_t *)b.114_69 + j_473 * 8], tmp3838
	cmpq	%rsi, (%r15,%rcx,8)	# tmp3838, MEM[(uint64_t *)a.115_70 + j_473 * 8]
	ja	.L859	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L860	#,
# sub.c:185:         j++;
	leaq	5(%r8), %r9	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r9, %r12	# j, sub_size
	je	.L773	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%r9,8), %rbx	# MEM[(uint64_t *)b.114_69 + j_473 * 8], tmp3839
	cmpq	%rbx, (%r15,%r9,8)	# tmp3839, MEM[(uint64_t *)a.115_70 + j_473 * 8]
	ja	.L859	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L860	#,
# sub.c:185:         j++;
	leaq	6(%r8), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L773	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rdi	# MEM[(uint64_t *)b.114_69 + j_473 * 8], tmp3840
	cmpq	%rdi, (%r15,%rdx,8)	# tmp3840, MEM[(uint64_t *)a.115_70 + j_473 * 8]
	ja	.L859	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L860	#,
# sub.c:185:         j++;
	leaq	7(%r8), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	jne	.L2301	#,
	jmp	.L773	#
	.p2align 4,,10
	.p2align 3
.L856:
	movq	%r15, %rsi	# a.115_70, b
	movq	%r14, %r9	# b.114_69, a
	jmp	.L754	#
.L712:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC33(%rip), %rsi	#, tmp1402
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1481
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC34(%rip), %r8	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1481,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %r10d	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%r10	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-66048(%rbp), %r13	#, tmp1480
	leaq	.LC81(%rip), %r8	#,
	jmp	.L2288	#
.L2356:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k2, (%rcx)	# tmp2216, MEM[(__mmask8 *)_921]
	jmp	.L977	#
.L720:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC29(%rip), %rsi	#, tmp1372
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1481
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC30(%rip), %r8	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1481,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %ecx	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%rcx	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-65824(%rbp), %r13	#, tmp1482
	leaq	.LC78(%rip), %r8	#,
	jmp	.L2292	#
.L718:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC33(%rip), %rsi	#, tmp1432
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1481
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC34(%rip), %r8	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1481,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %eax	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%rax	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-65824(%rbp), %r13	#, tmp1482
	leaq	.LC84(%rip), %r8	#,
	jmp	.L2292	#
.L2312:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	(%r14)	# a.103_51
	clflush	(%r15)	# b.104_52
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	leaq	64(%r14), %r8	#, ivtmp.716
	leaq	64(%r15), %rcx	#, ivtmp.717
	jmp	.L1591	#
.L2362:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%r8), %zmm7	# MEM[(__m512i * {ref-all})a_573 + i_571 * 8], tmp4023
# sub.c:217:         i += 8;
	movl	$16, %ebx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%r10), %zmm7, %zmm2	# MEM[(__m512i * {ref-all})b_576 + i_571 * 8], tmp4023, tmp2918
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k2	#, zeros, tmp2918, tmp2920
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm2, %zmm3	# tmp2918, tmp2918
	vpaddq	limb_digits(%rip), %zmm2, %zmm3{%k2}	# limb_digits, tmp2918, tmp2918, tmp2920, tmp2918
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, 64(%rdx)	# tmp2922, MEM[(__m512i * {ref-all})result_550 + i_571 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, (%rsi)	# tmp2920, MEM[(__mmask8 *)_680]
# sub.c:219:     } while (likely(i < n));
	leaq	2(%rcx), %rsi	#, ivtmp.704
	jmp	.L1702	#
.L2314:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%r8), %zmm12	# MEM[(__m512i * {ref-all})a_333 + i_331 * 8], tmp3873
# sub.c:217:         i += 8;
	movl	$16, %ecx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%r11), %zmm12, %zmm13	# MEM[(__m512i * {ref-all})b_336 + i_331 * 8], tmp3873, tmp2402
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k1	#, zeros, tmp2402, tmp2404
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm13, %zmm14	# tmp2402, tmp2402
	vpaddq	limb_digits(%rip), %zmm13, %zmm14{%k1}	# limb_digits, tmp2402, tmp2402, tmp2404, tmp2402
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, 64(%rax)	# tmp2406, MEM[(__m512i * {ref-all})result_310 + i_331 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, (%rsi)	# tmp2404, MEM[(__mmask8 *)_1146]
# sub.c:219:     } while (likely(i < n));
	leaq	2(%rdx), %rsi	#, ivtmp.625
	jmp	.L1630	#
.L2331:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%rdi), %zmm7	# MEM[(__m512i * {ref-all})a_810 + i_808 * 8], tmp3948
# sub.c:217:         i += 8;
	movl	$16, %r11d	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%r10), %zmm7, %zmm3	# MEM[(__m512i * {ref-all})b_813 + i_808 * 8], tmp3948, tmp2660
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k5	#, zeros, tmp2660, tmp2662
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm3, %zmm1	# tmp2660, tmp2660
	vpaddq	limb_digits(%rip), %zmm3, %zmm1{%k5}	# limb_digits, tmp2660, tmp2660, tmp2662, tmp2660
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, 64(%rdx)	# tmp2664, MEM[(__m512i * {ref-all})result_787 + i_808 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, (%r8)	# tmp2662, MEM[(__mmask8 *)_920]
# sub.c:219:     } while (likely(i < n));
	leaq	2(%rcx), %r8	#, ivtmp.546
	jmp	.L1666	#
.L2317:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k5, (%rdx)	# tmp2378, MEM[(__mmask8 *)_844]
	jmp	.L1102	#
.L2334:
	kmovb	%k2, (%rcx)	# tmp2636, MEM[(__mmask8 *)_1164]
	jmp	.L1295	#
.L2365:
	kmovb	%k6, (%rcx)	# tmp2894, MEM[(__mmask8 *)_674]
	jmp	.L1488	#
	.p2align 4,,10
	.p2align 3
.L2399:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	8(%r15), %r8	# MEM[(uint64_t *)b.122_89 + j_624 * 8], tmp4002
	cmpq	%r8, 8(%r14)	# tmp4002, MEM[(uint64_t *)a.123_90 + j_624 * 8]
	ja	.L863	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L864	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	jne	.L1697	#,
	.p2align 4,,10
	.p2align 3
.L796:
# sub.c:1375:             TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
	incl	%r10d	# __t
	cmpl	%r11d, %r10d	# _671, __t
	jne	.L790	#,
	vzeroupper
.L791:
# sub.c:1527:     clock_gettime(CLOCK_MONOTONIC_RAW, &ts);
	movq	%rbx, %rsi	# tmp1478,
	movl	$4, %edi	#,
	call	clock_gettime@PLT	#
# sub.c:1528:     return ts;
	movq	-66184(%rbp), %r10	# MEM <__syscall_slong_t> [(struct timespec *)_1655], SR.212
	movq	-66192(%rbp), %rax	# MEM <__time_t> [(struct timespec *)_1655], SR.211
# sub.c:1535:     if ((end.tv_nsec - start.tv_nsec) < 0)
	movq	%r10, %r11	# SR.212, _691
	subq	-66320(%rbp), %r11	# %sfp, _691
	js	.L2380	#,
# sub.c:1542:         temp.tv_sec = end.tv_sec - start.tv_sec;
	subq	-66336(%rbp), %rax	# %sfp, tmp1112
# sub.c:1546:     return temp.tv_sec * 1000000000 + temp.tv_nsec;
	imulq	$1000000000, %rax, %rdx	#, tmp1112, tmp1113
# sub.c:1546:     return temp.tv_sec * 1000000000 + temp.tv_nsec;
	addq	%r11, %rdx	# _691, _194
# sub.c:1375:             TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
	cmpq	$249999999, %rdx	#, _194
	jle	.L1597	#,
.L797:
# sub.c:1375:             TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
	vxorpd	%xmm7, %xmm7, %xmm7	# tmp3701
	vcvtsi2sdq	%rdx, %xmm7, %xmm1	# _194, tmp3701, tmp3014
	vcvtsi2sdq	-66328(%rbp), %xmm7, %xmm3	# %sfp, tmp3702, tmp3015
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC64(%rip), %rdi	#, tmp1116
# sub.c:1375:             TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
	vdivsd	%xmm3, %xmm1, %xmm5	# tmp1115, tmp1114, time_taken
	vmovsd	%xmm5, -66320(%rbp)	# time_taken, %sfp
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	puts@PLT	#
# sub.c:1376:             time_taken_ms = time_taken / 1e6;
	vmovsd	.LC65(%rip), %xmm6	#, tmp3705
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC66(%rip), %rsi	#, tmp1119
# sub.c:1376:             time_taken_ms = time_taken / 1e6;
	vmulsd	-66320(%rbp), %xmm6, %xmm0	# %sfp, tmp3705, time_taken_ms
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk@PLT	#
# sub.c:1380:             niter = 1 + (unsigned long)(1e4 / time_taken_ms);
	vmovsd	.LC67(%rip), %xmm8	#, tmp1121
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC68(%rip), %rsi	#, tmp1123
# sub.c:1380:             niter = 1 + (unsigned long)(1e4 / time_taken_ms);
	vdivsd	-66320(%rbp), %xmm8, %xmm9	# %sfp, tmp1121, tmp1120
# sub.c:1380:             niter = 1 + (unsigned long)(1e4 / time_taken_ms);
	vcvttsd2usi	%xmm9, %rdx	# tmp1120, tmp1122
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
# sub.c:1380:             niter = 1 + (unsigned long)(1e4 / time_taken_ms);
	incl	%edx	# niter
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	%edx, -66320(%rbp)	# niter, %sfp
	call	__printf_chk@PLT	#
# sub.c:1382:             fflush(stdout);
	movq	stdout(%rip), %rdi	# stdout,
	call	fflush@PLT	#
# sub.c:1527:     clock_gettime(CLOCK_MONOTONIC_RAW, &ts);
	movq	%rbx, %rsi	# tmp1478,
	movl	$4, %edi	#,
	call	clock_gettime@PLT	#
# sub.c:1528:     return ts;
	movq	-66184(%rbp), %r9	# MEM <__syscall_slong_t> [(struct timespec *)_1655], SR.214
# sub.c:1385:             for (int i = 0; i < niter; i++)
	movl	-66320(%rbp), %esi	# %sfp,
# sub.c:1528:     return ts;
	movq	%r9, -66328(%rbp)	# SR.214, %sfp
	movq	-66192(%rbp), %rax	# MEM <__time_t> [(struct timespec *)_1655], SR.213
# sub.c:1385:             for (int i = 0; i < niter; i++)
	xorl	%r10d, %r10d	# i
# sub.c:1385:             for (int i = 0; i < niter; i++)
	testl	%esi, %esi	#
	jle	.L803	#,
	movq	%rax, -66336(%rbp)	# SR.213, %sfp
	movl	-66320(%rbp), %r11d	# %sfp, niter
	.p2align 4,,10
	.p2align 3
.L798:
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %r8	# sub_space_ptr, sub_space_ptr
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %rdi	# sub_space, sub_space
	leaq	-1(%r12), %rcx	#, tmp1635
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15), %rdx	# MEM[(uint64_t *)b.122_89 + j_706 * 8], tmp3713
	movq	%rcx, %r9	# tmp1635, tmp1635
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%rdi,%r8,8), %rax	#, result
	andl	$7, %r9d	#, tmp1635
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%rdx, (%r14)	# tmp3713, MEM[(uint64_t *)a.123_90 + j_706 * 8]
	jbe	.L2381	#,
.L866:
	movq	%r15, %rsi	# b.122_89, b
	movq	%r14, %rdi	# a.123_90, a
.L801:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi), %zmm10	# MEM[(__m512i * {ref-all})a_728 + i_726 * 8], tmp3716
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %r9	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi), %zmm10, %zmm11	# MEM[(__m512i * {ref-all})b_731 + i_726 * 8], tmp3716, tmp1134
	leaq	-1(%r12), %r8	#, tmp1631
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm11, %k3	#, zeros, tmp1134, tmp1136
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm11, %zmm12	# tmp1134, tmp1134
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %r9	# borrow_space, ivtmp.642
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm11, %zmm12{%k3}	# limb_digits, tmp1134, tmp1134, tmp1136, tmp1134
	shrq	$3, %r8	#, tmp1629
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm12, (%rax)	# tmp1140, MEM[(__m512i * {ref-all})result_705 + i_726 * 8]
	andl	$3, %r8d	#, tmp1632
# sub.c:217:         i += 8;
	movl	$8, %edx	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%r9), %rcx	#, ivtmp.651
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, (%r9)	# tmp1136, MEM[(__mmask8 *)_758]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %r12	#, sub_size
	jbe	.L1959	#,
	testq	%r8, %r8	# tmp1632
	je	.L805	#,
	cmpq	$1, %r8	#, tmp1632
	je	.L1677	#,
	cmpq	$2, %r8	#, tmp1632
	je	.L1678	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%rdi), %zmm13	# MEM[(__m512i * {ref-all})a_728 + i_726 * 8], tmp3972
# sub.c:217:         i += 8;
	movl	$16, %edx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%rsi), %zmm13, %zmm14	# MEM[(__m512i * {ref-all})b_731 + i_726 * 8], tmp3972, tmp2750
# sub.c:219:     } while (likely(i < n));
	leaq	2(%r9), %rcx	#, ivtmp.651
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k4	#, zeros, tmp2750, tmp2752
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm14, %zmm15	# tmp2750, tmp2750
	vpaddq	limb_digits(%rip), %zmm14, %zmm15{%k4}	# limb_digits, tmp2750, tmp2750, tmp2752, tmp2750
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, 64(%rax)	# tmp2754, MEM[(__m512i * {ref-all})result_705 + i_726 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, 1(%r9)	# tmp2752, MEM[(__mmask8 *)_758]
.L1678:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%rdx,8), %zmm4	# MEM[(__m512i * {ref-all})a_728 + i_726 * 8], tmp3974
# sub.c:219:     } while (likely(i < n));
	incq	%rcx	# ivtmp.651
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi,%rdx,8), %zmm4, %zmm0	# MEM[(__m512i * {ref-all})b_731 + i_726 * 8], tmp3974, tmp2756
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k5	#, zeros, tmp2756, tmp2758
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm0, %zmm7	# tmp2756, tmp2756
	vpaddq	limb_digits(%rip), %zmm0, %zmm7{%k5}	# limb_digits, tmp2756, tmp2756, tmp2758, tmp2756
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm7, (%rax,%rdx,8)	# tmp2760, MEM[(__m512i * {ref-all})result_705 + i_726 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rdx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, -1(%rcx)	# tmp2758, MEM[(__mmask8 *)_758]
.L1677:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%rdx,8), %zmm1	# MEM[(__m512i * {ref-all})a_728 + i_726 * 8], tmp3976
# sub.c:219:     } while (likely(i < n));
	incq	%rcx	# ivtmp.651
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi,%rdx,8), %zmm1, %zmm2	# MEM[(__m512i * {ref-all})b_731 + i_726 * 8], tmp3976, tmp2762
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k6	#, zeros, tmp2762, tmp2764
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm2, %zmm3	# tmp2762, tmp2762
	vpaddq	limb_digits(%rip), %zmm2, %zmm3{%k6}	# limb_digits, tmp2762, tmp2762, tmp2764, tmp2762
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rax,%rdx,8)	# tmp2766, MEM[(__m512i * {ref-all})result_705 + i_726 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rdx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, -1(%rcx)	# tmp2764, MEM[(__mmask8 *)_758]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rdx, %r12	# i, sub_size
	jbe	.L1959	#,
.L805:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%rdx,8), %zmm5	# MEM[(__m512i * {ref-all})a_728 + i_726 * 8], tmp3718
# sub.c:217:         i += 8;
	leaq	8(%rdx), %r8	#, tmp1633
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi,%rdx,8), %zmm5, %zmm6	# MEM[(__m512i * {ref-all})b_731 + i_726 * 8], tmp3718, tmp1981
# sub.c:219:     } while (likely(i < n));
	addq	$4, %rcx	#, ivtmp.651
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k7	#, zeros, tmp1981, tmp1983
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm6, %zmm8	# tmp1981, tmp1981
	vpaddq	limb_digits(%rip), %zmm6, %zmm8{%k7}	# limb_digits, tmp1981, tmp1981, tmp1983, tmp1981
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rax,%rdx,8)	# tmp1985, MEM[(__m512i * {ref-all})result_705 + i_726 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, -4(%rcx)	# tmp1983, MEM[(__mmask8 *)_758]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%r8,8), %zmm9	# MEM[(__m512i * {ref-all})a_728 + i_726 * 8], tmp3720
	vpsubq	(%rsi,%r8,8), %zmm9, %zmm10	# MEM[(__m512i * {ref-all})b_731 + i_726 * 8], tmp3720, tmp1989
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k1	#, zeros, tmp1989, tmp1991
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm10, %zmm11	# tmp1989, tmp1989
	vpaddq	limb_digits(%rip), %zmm10, %zmm11{%k1}	# limb_digits, tmp1989, tmp1989, tmp1991, tmp1989
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rax,%r8,8)	# tmp1993, MEM[(__m512i * {ref-all})result_705 + i_726 * 8]
# sub.c:217:         i += 8;
	leaq	16(%rdx), %r8	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, -3(%rcx)	# tmp1991, MEM[(__mmask8 *)_758]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%r8,8), %zmm12	# MEM[(__m512i * {ref-all})a_728 + i_726 * 8], tmp3722
	vpsubq	(%rsi,%r8,8), %zmm12, %zmm13	# MEM[(__m512i * {ref-all})b_731 + i_726 * 8], tmp3722, tmp1997
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k2	#, zeros, tmp1997, tmp1999
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm13, %zmm14	# tmp1997, tmp1997
	vpaddq	limb_digits(%rip), %zmm13, %zmm14{%k2}	# limb_digits, tmp1997, tmp1997, tmp1999, tmp1997
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rax,%r8,8)	# tmp2001, MEM[(__m512i * {ref-all})result_705 + i_726 * 8]
# sub.c:217:         i += 8;
	leaq	24(%rdx), %r8	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, -2(%rcx)	# tmp1999, MEM[(__mmask8 *)_758]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%r8,8), %zmm15	# MEM[(__m512i * {ref-all})a_728 + i_726 * 8], tmp3724
# sub.c:217:         i += 8;
	addq	$32, %rdx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rsi,%r8,8), %zmm15, %zmm4	# MEM[(__m512i * {ref-all})b_731 + i_726 * 8], tmp3724, tmp2005
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm4, %k3	#, zeros, tmp2005, tmp2007
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm4, %zmm0	# tmp2005, tmp2005
	vpaddq	limb_digits(%rip), %zmm4, %zmm0{%k3}	# limb_digits, tmp2005, tmp2005, tmp2007, tmp2005
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rax,%r8,8)	# tmp2009, MEM[(__m512i * {ref-all})result_705 + i_726 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, -1(%rcx)	# tmp2007, MEM[(__mmask8 *)_758]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rdx, %r12	# i, sub_size
	ja	.L805	#,
.L1959:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm7	# zeros, tmp3726
	leaq	-1(%r12), %rsi	#, tmp1625
	vmovdqu64	%zmm7, (%rax,%r13)	# tmp3726, MEM[(__m512i_u * {ref-all})_752]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax), %zmm1	# MEM[(__m512i * {ref-all})result_705 + i_1740 * 8], _1736
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%r9), %edi	# MEM[(__mmask8 *)_753], MEM[(__mmask8 *)_753]
	shrq	$3, %rsi	#, tmp1623
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k4	# MEM[(__mmask8 *)_753], tmp3727
	vpsubq	ones(%rip), %zmm1, %zmm1{%k4}	# ones, _1736, tmp1146, tmp3727, _1736
	andl	$3, %esi	#, tmp1626
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rax)	# tmp1146, MEM[(__m512i * {ref-all})result_705 + i_1740 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm1, %k0	#, zeros, tmp1146, tmp1152
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp1152
	jne	.L2382	#,
.L1355:
# sub.c:249:         i += 8;
	movl	$8, %edx	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	1(%r9), %rcx	#, ivtmp.642
	cmpq	$8, %r12	#, sub_size
	jbe	.L808	#,
	testq	%rsi, %rsi	# tmp1626
	je	.L807	#,
	cmpq	$1, %rsi	#, tmp1626
	je	.L1675	#,
	cmpq	$2, %rsi	#, tmp1626
	je	.L1676	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	64(%rax), %zmm2	# MEM[(__m512i * {ref-all})result_705 + i_1740 * 8], _1736
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%r9), %r8d	# MEM[(__mmask8 *)_753], MEM[(__mmask8 *)_753]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k5	# MEM[(__mmask8 *)_753], tmp3967
	vpsubq	ones(%rip), %zmm2, %zmm2{%k5}	# ones, _1736, tmp2718, tmp3967, _1736
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, 64(%rax)	# tmp2718, MEM[(__m512i * {ref-all})result_705 + i_1740 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k6	#, zeros, tmp2718, tmp2720
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k6, %k6	# tmp2720
	jne	.L2383	#,
.L1357:
# sub.c:249:         i += 8;
	addq	$8, %rdx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.642
.L1676:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm3	# MEM[(__m512i * {ref-all})result_705 + i_1740 * 8], _1736
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %r9d	# MEM[(__mmask8 *)_753], MEM[(__mmask8 *)_753]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k7	# MEM[(__mmask8 *)_753], tmp3968
	vpsubq	ones(%rip), %zmm3, %zmm3{%k7}	# ones, _1736, tmp2724, tmp3968, _1736
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rax,%rdx,8)	# tmp2724, MEM[(__m512i * {ref-all})result_705 + i_1740 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k1	#, zeros, tmp2724, tmp2726
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k1, %k1	# tmp2726
	jne	.L2384	#,
.L1360:
# sub.c:249:         i += 8;
	addq	$8, %rdx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.642
.L1675:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm5	# MEM[(__m512i * {ref-all})result_705 + i_1740 * 8], _1736
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %esi	# MEM[(__mmask8 *)_753], MEM[(__mmask8 *)_753]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k2	# MEM[(__mmask8 *)_753], tmp3969
	vpsubq	ones(%rip), %zmm5, %zmm5{%k2}	# ones, _1736, tmp2730, tmp3969, _1736
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, (%rax,%rdx,8)	# tmp2730, MEM[(__m512i * {ref-all})result_705 + i_1740 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k3	#, zeros, tmp2730, tmp2732
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k3, %k3	# tmp2732
	jne	.L2385	#,
.L1363:
# sub.c:249:         i += 8;
	addq	$8, %rdx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.642
	cmpq	%rdx, %r12	# i, sub_size
	ja	.L807	#,
	jmp	.L808	#
	.p2align 4,,10
	.p2align 3
.L806:
# sub.c:249:         i += 8;
	addq	$8, %rdx	#, tmp1627
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm8	# MEM[(__m512i * {ref-all})result_705 + i_1740 * 8], _1736
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rcx), %r9d	# MEM[(__mmask8 *)_753], MEM[(__mmask8 *)_753]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rcx), %r8	#, tmp1628
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k5	# MEM[(__mmask8 *)_753], tmp3729
	vpsubq	ones(%rip), %zmm8, %zmm8{%k5}	# ones, _1736, tmp2023, tmp3729, _1736
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rax,%rdx,8)	# tmp2023, MEM[(__m512i * {ref-all})result_705 + i_1740 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm8, %k6	#, zeros, tmp2023, tmp2025
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k6, %k6	# tmp2025
	jne	.L2386	#,
.L1366:
# sub.c:249:         i += 8;
	leaq	8(%rdx), %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm9	# MEM[(__m512i * {ref-all})result_705 + i_1740 * 8], _1736
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%r8), %esi	# MEM[(__mmask8 *)_753], MEM[(__mmask8 *)_753]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k7	# MEM[(__mmask8 *)_753], tmp3970
	vpsubq	ones(%rip), %zmm9, %zmm9{%k7}	# ones, _1736, tmp2738, tmp3970, _1736
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rax,%rcx,8)	# tmp2738, MEM[(__m512i * {ref-all})result_705 + i_1740 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k1	#, zeros, tmp2738, tmp2740
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k1, %k1	# tmp2740
	jne	.L2387	#,
.L1368:
# sub.c:249:         i += 8;
	leaq	16(%rdx), %r9	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r9,8), %zmm10	# MEM[(__m512i * {ref-all})result_705 + i_1740 * 8], _1736
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%r8), %edi	# MEM[(__mmask8 *)_753], MEM[(__mmask8 *)_753]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k2	# MEM[(__mmask8 *)_753], tmp3971
	vpsubq	ones(%rip), %zmm10, %zmm10{%k2}	# ones, _1736, tmp2746, tmp3971, _1736
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, (%rax,%r9,8)	# tmp2746, MEM[(__m512i * {ref-all})result_705 + i_1740 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k3	#, zeros, tmp2746, tmp2748
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k3, %k3	# tmp2748
	jne	.L2388	#,
.L1370:
# sub.c:249:         i += 8;
	addq	$24, %rdx	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%r8), %rcx	#, ivtmp.642
	cmpq	%rdx, %r12	# i, sub_size
	jbe	.L808	#,
.L807:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm6	# MEM[(__m512i * {ref-all})result_705 + i_1740 * 8], _1736
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %edi	# MEM[(__mmask8 *)_753], MEM[(__mmask8 *)_753]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k4	# MEM[(__mmask8 *)_753], tmp3728
	vpsubq	ones(%rip), %zmm6, %zmm6{%k4}	# ones, _1736, tmp2015, tmp3728, _1736
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rax,%rdx,8)	# tmp2015, MEM[(__m512i * {ref-all})result_705 + i_1740 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k0	#, zeros, tmp2015, tmp2017
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp2017
	je	.L806	#,
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rcx)	# tmp2017, MEM[(__mmask8 *)_753]
	jmp	.L806	#
.L2398:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	8(%r14), %r8	# MEM[(uint64_t *)b.130_105 + j_869 * 8], tmp3927
	cmpq	%r8, 8(%r15)	# tmp3927, MEM[(uint64_t *)a.131_106 + j_869 * 8]
	ja	.L872	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L873	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	jne	.L1661	#,
	.p2align 4,,10
	.p2align 3
.L831:
# sub.c:1410:             TIME_RUSAGE(time_taken, limb_sub_n(a, b, &sub, n));
	incq	%r11	# __t
	cmpq	%r11, %r13	# __t, __times
	jne	.L822	#,
	vzeroupper
.L826:
# sub.c:1553:     getrusage(RUSAGE_SELF, &rus);
	movq	-66320(%rbp), %rsi	# %sfp,
	xorl	%edi, %edi	#
	call	getrusage@PLT	#
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	movq	-66184(%rbp), %rsi	# MEM[(struct rusage *)_1655].ru_utime.tv_usec, MEM[(struct rusage *)_1655].ru_utime.tv_usec
	movabsq	$2361183241434822607, %rax	#, tmp3242
	imulq	%rsi	# MEM[(struct rusage *)_1655].ru_utime.tv_usec
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	imull	$1000, -66192(%rbp), %r11d	#, MEM[(struct rusage *)_1655].ru_utime.tv_sec, tmp1239
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	sarq	$63, %rsi	#, tmp1245
	sarq	$7, %rdx	#, tmp1244
	subq	%rsi, %rdx	# tmp1245, tmp1240
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	leal	(%r11,%rdx), %eax	#, _943
# sub.c:1410:             TIME_RUSAGE(time_taken, limb_sub_n(a, b, &sub, n));
	cltq
	subq	-66328(%rbp), %rax	# %sfp, __tmp
	cmpq	$249, %rax	#, __tmp
	jle	.L816	#,
	vxorpd	%xmm4, %xmm4, %xmm4	# tmp3776
	movq	%r13, %rdi	# __times, __times
	vcvtsi2sdq	%rdi, %xmm4, %xmm3	# __times, tmp3777, tmp3020
	vcvtsi2sdq	%rax, %xmm4, %xmm1	# __tmp, tmp3776, tmp3019
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC64(%rip), %rdi	#, tmp1278
	movq	%rbx, %r13	# _63, _63
# sub.c:1410:             TIME_RUSAGE(time_taken, limb_sub_n(a, b, &sub, n));
	vdivsd	%xmm3, %xmm1, %xmm2	# tmp1277, tmp1276, time_taken
	vmovq	%xmm2, %rbx	# time_taken, time_taken
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	puts@PLT	#
	vmovq	%rbx, %xmm0	# time_taken,
	leaq	.LC66(%rip), %rsi	#, tmp1279
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk@PLT	#
# sub.c:1413:             niter = 1 + (unsigned long)(1e4 / time_taken);
	vmovsd	.LC74(%rip), %xmm6	#, tmp1281
	vmovq	%rbx, %xmm5	# time_taken, time_taken
	vdivsd	%xmm5, %xmm6, %xmm8	# time_taken, tmp1281, tmp1280
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC68(%rip), %rsi	#, tmp1283
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
# sub.c:1413:             niter = 1 + (unsigned long)(1e4 / time_taken);
	vcvttsd2usi	%xmm8, %r8	# tmp1280, tmp1282
# sub.c:1413:             niter = 1 + (unsigned long)(1e4 / time_taken);
	leal	1(%r8), %r9d	#, niter
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	%r9d, %edx	# niter,
	movl	%r9d, -66344(%rbp)	# niter, %sfp
	call	__printf_chk@PLT	#
# sub.c:1415:             fflush(stdout);
	movq	stdout(%rip), %rdi	# stdout,
	call	fflush@PLT	#
# sub.c:1553:     getrusage(RUSAGE_SELF, &rus);
	movq	-66320(%rbp), %rsi	# %sfp,
	xorl	%edi, %edi	#
	call	getrusage@PLT	#
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	movq	-66184(%rbp), %rcx	# MEM[(struct rusage *)_1655].ru_utime.tv_usec, MEM[(struct rusage *)_1655].ru_utime.tv_usec
	movabsq	$2361183241434822607, %rax	#, tmp3243
	imulq	%rcx	# MEM[(struct rusage *)_1655].ru_utime.tv_usec
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	imull	$1000, -66192(%rbp), %r10d	#, MEM[(struct rusage *)_1655].ru_utime.tv_sec, tmp1287
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	sarq	$63, %rcx	#, tmp1293
	sarq	$7, %rdx	#, tmp1290
	subq	%rcx, %rdx	# tmp1293, tmp1288
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	addl	%edx, %r10d	# tmp1288, _951
# sub.c:1417:             t0 = cputime();
	movslq	%r10d, %r11	# _951, t0
	movq	%r11, -66328(%rbp)	# t0, %sfp
# sub.c:1418:             for (int i = 0; i < niter; i++)
	movl	-66344(%rbp), %r11d	# %sfp, niter
# sub.c:1418:             for (int i = 0; i < niter; i++)
	xorl	%r10d, %r10d	# i
# sub.c:1418:             for (int i = 0; i < niter; i++)
	testl	%r11d, %r11d	# niter
	jle	.L837	#,
	.p2align 4,,10
	.p2align 3
.L832:
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %rsi	# sub_space_ptr, sub_space_ptr
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %rdi	# sub_space, sub_space
	leaq	-1(%r12), %rcx	#, tmp1586
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14), %rbx	# MEM[(uint64_t *)b.130_105 + j_957 * 8], tmp3788
	movq	%rcx, %r8	# tmp1586, tmp1586
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%rdi,%rsi,8), %rax	#, result
	andl	$7, %r8d	#, tmp1586
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%rbx, (%r15)	# tmp3788, MEM[(uint64_t *)a.131_106 + j_957 * 8]
	jbe	.L2389	#,
.L876:
	movq	%r14, %rbx	# b.130_105, b
	movq	%r15, %rdi	# a.131_106, a
.L835:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi), %zmm9	# MEM[(__m512i * {ref-all})a_979 + i_977 * 8], tmp3791
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %r8	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rbx), %zmm9, %zmm10	# MEM[(__m512i * {ref-all})b_982 + i_977 * 8], tmp3791, tmp1318
	leaq	-1(%r12), %r9	#, tmp1582
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k6	#, zeros, tmp1318, tmp1320
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm10, %zmm11	# tmp1318, tmp1318
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %r8	# borrow_space, ivtmp.485
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm10, %zmm11{%k6}	# limb_digits, tmp1318, tmp1318, tmp1320, tmp1318
	shrq	$3, %r9	#, tmp1580
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rax)	# tmp1324, MEM[(__m512i * {ref-all})result_956 + i_977 * 8]
	andl	$3, %r9d	#, tmp1583
# sub.c:217:         i += 8;
	movl	$8, %esi	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%r8), %rcx	#, ivtmp.494
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, (%r8)	# tmp1320, MEM[(__mmask8 *)_1742]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %r12	#, sub_size
	jbe	.L1976	#,
	testq	%r9, %r9	# tmp1583
	je	.L839	#,
	cmpq	$1, %r9	#, tmp1583
	je	.L1641	#,
	cmpq	$2, %r9	#, tmp1583
	je	.L1642	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%rdi), %zmm12	# MEM[(__m512i * {ref-all})a_979 + i_977 * 8], tmp3897
# sub.c:217:         i += 8;
	movl	$16, %esi	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%rbx), %zmm12, %zmm13	# MEM[(__m512i * {ref-all})b_982 + i_977 * 8], tmp3897, tmp2492
# sub.c:219:     } while (likely(i < n));
	leaq	2(%r8), %rcx	#, ivtmp.494
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k7	#, zeros, tmp2492, tmp2494
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm13, %zmm0	# tmp2492, tmp2492
	vpaddq	limb_digits(%rip), %zmm13, %zmm0{%k7}	# limb_digits, tmp2492, tmp2492, tmp2494, tmp2492
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, 64(%rax)	# tmp2496, MEM[(__m512i * {ref-all})result_956 + i_977 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, 1(%r8)	# tmp2494, MEM[(__mmask8 *)_1742]
.L1642:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%rsi,8), %zmm14	# MEM[(__m512i * {ref-all})a_979 + i_977 * 8], tmp3899
# sub.c:219:     } while (likely(i < n));
	incq	%rcx	# ivtmp.494
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rbx,%rsi,8), %zmm14, %zmm15	# MEM[(__m512i * {ref-all})b_982 + i_977 * 8], tmp3899, tmp2498
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k1	#, zeros, tmp2498, tmp2500
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm15, %zmm4	# tmp2498, tmp2498
	vpaddq	limb_digits(%rip), %zmm15, %zmm4{%k1}	# limb_digits, tmp2498, tmp2498, tmp2500, tmp2498
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm4, (%rax,%rsi,8)	# tmp2502, MEM[(__m512i * {ref-all})result_956 + i_977 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rsi	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, -1(%rcx)	# tmp2500, MEM[(__mmask8 *)_1742]
.L1641:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%rsi,8), %zmm1	# MEM[(__m512i * {ref-all})a_979 + i_977 * 8], tmp3901
# sub.c:219:     } while (likely(i < n));
	incq	%rcx	# ivtmp.494
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rbx,%rsi,8), %zmm1, %zmm7	# MEM[(__m512i * {ref-all})b_982 + i_977 * 8], tmp3901, tmp2504
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm7, %k2	#, zeros, tmp2504, tmp2506
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm7, %zmm3	# tmp2504, tmp2504
	vpaddq	limb_digits(%rip), %zmm7, %zmm3{%k2}	# limb_digits, tmp2504, tmp2504, tmp2506, tmp2504
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rax,%rsi,8)	# tmp2508, MEM[(__m512i * {ref-all})result_956 + i_977 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rsi	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, -1(%rcx)	# tmp2506, MEM[(__mmask8 *)_1742]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rsi, %r12	# i, sub_size
	jbe	.L1976	#,
.L839:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%rsi,8), %zmm2	# MEM[(__m512i * {ref-all})a_979 + i_977 * 8], tmp3793
# sub.c:217:         i += 8;
	leaq	8(%rsi), %rdx	#, tmp1584
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rbx,%rsi,8), %zmm2, %zmm6	# MEM[(__m512i * {ref-all})b_982 + i_977 * 8], tmp3793, tmp2147
# sub.c:217:         i += 8;
	leaq	16(%rsi), %r9	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k3	#, zeros, tmp2147, tmp2149
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm6, %zmm5	# tmp2147, tmp2147
# sub.c:219:     } while (likely(i < n));
	addq	$4, %rcx	#, ivtmp.494
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm6, %zmm5{%k3}	# limb_digits, tmp2147, tmp2147, tmp2149, tmp2147
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, (%rax,%rsi,8)	# tmp2151, MEM[(__m512i * {ref-all})result_956 + i_977 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, -4(%rcx)	# tmp2149, MEM[(__mmask8 *)_1742]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%rdx,8), %zmm8	# MEM[(__m512i * {ref-all})a_979 + i_977 * 8], tmp3795
	vpsubq	(%rbx,%rdx,8), %zmm8, %zmm9	# MEM[(__m512i * {ref-all})b_982 + i_977 * 8], tmp3795, tmp2155
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k4	#, zeros, tmp2155, tmp2157
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm9, %zmm10	# tmp2155, tmp2155
	vpaddq	limb_digits(%rip), %zmm9, %zmm10{%k4}	# limb_digits, tmp2155, tmp2155, tmp2157, tmp2155
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, (%rax,%rdx,8)	# tmp2159, MEM[(__m512i * {ref-all})result_956 + i_977 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, -3(%rcx)	# tmp2157, MEM[(__mmask8 *)_1742]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%r9,8), %zmm11	# MEM[(__m512i * {ref-all})a_979 + i_977 * 8], tmp3797
# sub.c:217:         i += 8;
	leaq	24(%rsi), %rdx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rbx,%r9,8), %zmm11, %zmm12	# MEM[(__m512i * {ref-all})b_982 + i_977 * 8], tmp3797, tmp2163
# sub.c:217:         i += 8;
	addq	$32, %rsi	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k5	#, zeros, tmp2163, tmp2165
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm12, %zmm13	# tmp2163, tmp2163
	vpaddq	limb_digits(%rip), %zmm12, %zmm13{%k5}	# limb_digits, tmp2163, tmp2163, tmp2165, tmp2163
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rax,%r9,8)	# tmp2167, MEM[(__m512i * {ref-all})result_956 + i_977 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, -2(%rcx)	# tmp2165, MEM[(__mmask8 *)_1742]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%rdx,8), %zmm0	# MEM[(__m512i * {ref-all})a_979 + i_977 * 8], tmp3799
	vpsubq	(%rbx,%rdx,8), %zmm0, %zmm14	# MEM[(__m512i * {ref-all})b_982 + i_977 * 8], tmp3799, tmp2171
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k6	#, zeros, tmp2171, tmp2173
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm14, %zmm15	# tmp2171, tmp2171
	vpaddq	limb_digits(%rip), %zmm14, %zmm15{%k6}	# limb_digits, tmp2171, tmp2171, tmp2173, tmp2171
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, (%rax,%rdx,8)	# tmp2175, MEM[(__m512i * {ref-all})result_956 + i_977 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, -1(%rcx)	# tmp2173, MEM[(__mmask8 *)_1742]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rsi, %r12	# i, sub_size
	ja	.L839	#,
.L1976:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm4	# zeros, tmp3801
	leaq	-1(%r12), %rbx	#, tmp1576
	vmovdqu64	%zmm4, (%rax,%r13)	# tmp3801, MEM[(__m512i_u * {ref-all})_1003]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax), %zmm1	# MEM[(__m512i * {ref-all})result_956 + i_615 * 8], _1068
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%r8), %edi	# MEM[(__mmask8 *)_1844], MEM[(__mmask8 *)_1844]
	shrq	$3, %rbx	#, tmp1574
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k7	# MEM[(__mmask8 *)_1844], tmp3802
	vpsubq	ones(%rip), %zmm1, %zmm1{%k7}	# ones, _1068, tmp1330, tmp3802, _1068
	andl	$3, %ebx	#, tmp1577
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rax)	# tmp1330, MEM[(__m512i * {ref-all})result_956 + i_615 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm1, %k0	#, zeros, tmp1330, tmp1336
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp1336
	jne	.L2390	#,
.L1162:
# sub.c:249:         i += 8;
	movl	$8, %r9d	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	1(%r8), %rcx	#, ivtmp.485
	cmpq	$8, %r12	#, sub_size
	jbe	.L842	#,
	testq	%rbx, %rbx	# tmp1577
	je	.L841	#,
	cmpq	$1, %rbx	#, tmp1577
	je	.L1639	#,
	cmpq	$2, %rbx	#, tmp1577
	je	.L1640	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	64(%rax), %zmm7	# MEM[(__m512i * {ref-all})result_956 + i_615 * 8], _1068
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%r8), %esi	# MEM[(__mmask8 *)_1844], MEM[(__mmask8 *)_1844]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k1	# MEM[(__mmask8 *)_1844], tmp3892
	vpsubq	ones(%rip), %zmm7, %zmm7{%k1}	# ones, _1068, tmp2460, tmp3892, _1068
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm7, 64(%rax)	# tmp2460, MEM[(__m512i * {ref-all})result_956 + i_615 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm7, %k2	#, zeros, tmp2460, tmp2462
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k2, %k2	# tmp2462
	jne	.L2391	#,
.L1164:
# sub.c:249:         i += 8;
	addq	$8, %r9	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.485
.L1640:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r9,8), %zmm3	# MEM[(__m512i * {ref-all})result_956 + i_615 * 8], _1068
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %r8d	# MEM[(__mmask8 *)_1844], MEM[(__mmask8 *)_1844]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k3	# MEM[(__mmask8 *)_1844], tmp3893
	vpsubq	ones(%rip), %zmm3, %zmm3{%k3}	# ones, _1068, tmp2466, tmp3893, _1068
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rax,%r9,8)	# tmp2466, MEM[(__m512i * {ref-all})result_956 + i_615 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k4	#, zeros, tmp2466, tmp2468
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k4, %k4	# tmp2468
	jne	.L2392	#,
.L1167:
# sub.c:249:         i += 8;
	addq	$8, %r9	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.485
.L1639:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r9,8), %zmm2	# MEM[(__m512i * {ref-all})result_956 + i_615 * 8], _1068
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %edx	# MEM[(__mmask8 *)_1844], MEM[(__mmask8 *)_1844]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edx, %k5	# MEM[(__mmask8 *)_1844], tmp3894
	vpsubq	ones(%rip), %zmm2, %zmm2{%k5}	# ones, _1068, tmp2472, tmp3894, _1068
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, (%rax,%r9,8)	# tmp2472, MEM[(__m512i * {ref-all})result_956 + i_615 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k6	#, zeros, tmp2472, tmp2474
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k6, %k6	# tmp2474
	jne	.L2393	#,
.L1170:
# sub.c:249:         i += 8;
	addq	$8, %r9	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.485
	cmpq	%r9, %r12	# i, sub_size
	ja	.L841	#,
	jmp	.L842	#
	.p2align 4,,10
	.p2align 3
.L840:
# sub.c:249:         i += 8;
	addq	$8, %r9	#, tmp1578
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r9,8), %zmm5	# MEM[(__m512i * {ref-all})result_956 + i_615 * 8], _1068
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rcx), %edi	# MEM[(__mmask8 *)_1844], MEM[(__mmask8 *)_1844]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rcx), %rsi	#, tmp1579
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k1	# MEM[(__mmask8 *)_1844], tmp3804
	vpsubq	ones(%rip), %zmm5, %zmm5{%k1}	# ones, _1068, tmp2189, tmp3804, _1068
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, (%rax,%r9,8)	# tmp2189, MEM[(__m512i * {ref-all})result_956 + i_615 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k2	#, zeros, tmp2189, tmp2191
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k2, %k2	# tmp2191
	jne	.L2394	#,
.L1173:
# sub.c:249:         i += 8;
	leaq	8(%r9), %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm8	# MEM[(__m512i * {ref-all})result_956 + i_615 * 8], _1068
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rsi), %r8d	# MEM[(__mmask8 *)_1844], MEM[(__mmask8 *)_1844]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k3	# MEM[(__mmask8 *)_1844], tmp3895
	vpsubq	ones(%rip), %zmm8, %zmm8{%k3}	# ones, _1068, tmp2480, tmp3895, _1068
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rax,%rcx,8)	# tmp2480, MEM[(__m512i * {ref-all})result_956 + i_615 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm8, %k4	#, zeros, tmp2480, tmp2482
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k4, %k4	# tmp2482
	jne	.L2395	#,
.L1175:
# sub.c:249:         i += 8;
	leaq	16(%r9), %rdx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdx,8), %zmm9	# MEM[(__m512i * {ref-all})result_956 + i_615 * 8], _1068
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%rsi), %ebx	# MEM[(__mmask8 *)_1844], MEM[(__mmask8 *)_1844]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ebx, %k5	# MEM[(__mmask8 *)_1844], tmp3896
	vpsubq	ones(%rip), %zmm9, %zmm9{%k5}	# ones, _1068, tmp2488, tmp3896, _1068
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rax,%rdx,8)	# tmp2488, MEM[(__m512i * {ref-all})result_956 + i_615 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k6	#, zeros, tmp2488, tmp2490
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k6, %k6	# tmp2490
	jne	.L2396	#,
.L1177:
# sub.c:249:         i += 8;
	addq	$24, %r9	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%rsi), %rcx	#, ivtmp.485
	cmpq	%r9, %r12	# i, sub_size
	jbe	.L842	#,
.L841:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r9,8), %zmm6	# MEM[(__m512i * {ref-all})result_956 + i_615 * 8], _1068
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %ebx	# MEM[(__mmask8 *)_1844], MEM[(__mmask8 *)_1844]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ebx, %k7	# MEM[(__mmask8 *)_1844], tmp3803
	vpsubq	ones(%rip), %zmm6, %zmm6{%k7}	# ones, _1068, tmp2181, tmp3803, _1068
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rax,%r9,8)	# tmp2181, MEM[(__m512i * {ref-all})result_956 + i_615 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k0	#, zeros, tmp2181, tmp2183
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp2183
	je	.L840	#,
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rcx)	# tmp2183, MEM[(__mmask8 *)_1844]
	jmp	.L840	#
	.p2align 4,,10
	.p2align 3
.L2343:
	kmovb	%k5, 2(%rsi)	# tmp2574, MEM[(__mmask8 *)_1009]
	jmp	.L1241	#
	.p2align 4,,10
	.p2align 3
.L2342:
	kmovb	%k3, 1(%rsi)	# tmp2566, MEM[(__mmask8 *)_1009]
	jmp	.L1239	#
	.p2align 4,,10
	.p2align 3
.L2341:
	kmovb	%k1, 1(%rcx)	# tmp2136, MEM[(__mmask8 *)_1009]
	jmp	.L1237	#
	.p2align 4,,10
	.p2align 3
.L2374:
	kmovb	%k2, 2(%r9)	# tmp2832, MEM[(__mmask8 *)_764]
	jmp	.L1434	#
	.p2align 4,,10
	.p2align 3
.L2373:
	kmovb	%k7, 1(%r9)	# tmp2824, MEM[(__mmask8 *)_764]
	jmp	.L1432	#
	.p2align 4,,10
	.p2align 3
.L2372:
	kmovb	%k5, 1(%rcx)	# tmp1970, MEM[(__mmask8 *)_764]
	jmp	.L1430	#
.L2401:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	8(%r15), %rsi	# MEM[(uint64_t *)b.122_89 + j_706 * 8], tmp3978
	cmpq	%rsi, 8(%r14)	# tmp3978, MEM[(uint64_t *)a.123_90 + j_706 * 8]
	ja	.L866	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L867	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	jne	.L1685	#,
.L808:
# sub.c:1385:             for (int i = 0; i < niter; i++)
	incl	%r10d	# i
# sub.c:1385:             for (int i = 0; i < niter; i++)
	cmpl	%r10d, %r11d	# i, niter
	jne	.L798	#,
	movq	-66336(%rbp), %rax	# %sfp, SR.213
	vzeroupper
.L803:
# sub.c:1527:     clock_gettime(CLOCK_MONOTONIC_RAW, &ts);
	movq	%rbx, %rsi	# tmp1478,
	movl	$4, %edi	#,
	movq	%rax, -66336(%rbp)	# SR.213, %sfp
	call	clock_gettime@PLT	#
# sub.c:1528:     return ts;
	movq	-66184(%rbp), %r13	# MEM <__syscall_slong_t> [(struct timespec *)_1655], SR.220
	movq	-66192(%rbp), %r12	# MEM <__time_t> [(struct timespec *)_1655], SR.219
# sub.c:1535:     if ((end.tv_nsec - start.tv_nsec) < 0)
	movq	%r13, %rbx	# SR.220, temp$tv_nsec
	subq	-66328(%rbp), %rbx	# %sfp, temp$tv_nsec
	movq	-66336(%rbp), %r10	# %sfp, SR.213
	js	.L2397	#,
# sub.c:1542:         temp.tv_sec = end.tv_sec - start.tv_sec;
	subq	%r10, %r12	# SR.213, temp$tv_sec
.L809:
# sub.c:1546:     return temp.tv_sec * 1000000000 + temp.tv_nsec;
	imulq	$1000000000, %r12, %r11	#, temp$tv_sec, tmp1158
# sub.c:1391:             t1 = t1 / 1e6; // ns -> ms
	vxorpd	%xmm11, %xmm11, %xmm11	# tmp3731
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC69(%rip), %rdi	#, tmp1162
# sub.c:1546:     return temp.tv_sec * 1000000000 + temp.tv_nsec;
	addq	%rbx, %r11	# temp$tv_nsec, t1
# sub.c:1391:             t1 = t1 / 1e6; // ns -> ms
	vcvtusi2sdq	%r11, %xmm11, %xmm12	# t1, tmp3731, tmp3016
# sub.c:1396:             for (decimals = 0;; decimals++)
	xorl	%r13d, %r13d	# decimals
# sub.c:1391:             t1 = t1 / 1e6; // ns -> ms
	vmulsd	.LC65(%rip), %xmm12, %xmm13	#, tmp1160, _100
	vmovq	%xmm13, %r12	# _100, _100
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	puts@PLT	#
# sub.c:1394:             ops_per_sec = 1000.0 * niter / t1;
	vxorpd	%xmm14, %xmm14, %xmm14	# tmp3733
	vcvtsi2sdl	-66320(%rbp), %xmm14, %xmm15	# %sfp, tmp3733, tmp3017
# sub.c:1391:             t1 = t1 / 1e6; // ns -> ms
	vmovq	%r12, %xmm0	# _100, _100
	vcvttsd2usi	%xmm0, %rdx	# _100, t1
# sub.c:1394:             ops_per_sec = 1000.0 * niter / t1;
	vmovsd	.LC70(%rip), %xmm4	#, tmp1163
# sub.c:1398:                 if (ops_per_sec > f)
	vmovsd	.LC51(%rip), %xmm13	#, tmp1168
# sub.c:1394:             ops_per_sec = 1000.0 * niter / t1;
	vmulsd	%xmm15, %xmm4, %xmm7	# tmp3017, tmp1163, tmp1163
# sub.c:1394:             ops_per_sec = 1000.0 * niter / t1;
	vcvtusi2sdq	%rdx, %xmm14, %xmm1	# t1, tmp3736, tmp3018
# sub.c:1394:             ops_per_sec = 1000.0 * niter / t1;
	vdivsd	%xmm1, %xmm7, %xmm3	# tmp1167, tmp1164, ops_per_sec
# sub.c:1398:                 if (ops_per_sec > f)
	vcomisd	%xmm13, %xmm3	# tmp1168, ops_per_sec
	ja	.L810	#,
	vmovsd	.LC71(%rip), %xmm2	#, tmp2026
.L811:
# sub.c:1400:                 f = f * 0.1;
	vmulsd	%xmm2, %xmm13, %xmm5	# tmp2026, f, f
# sub.c:1396:             for (decimals = 0;; decimals++)
	leal	1(%r13), %r8d	#, tmp1622
	movl	%r8d, %r13d	# tmp1622, decimals
# sub.c:1398:                 if (ops_per_sec > f)
	vcomisd	%xmm5, %xmm3	# f, ops_per_sec
	ja	.L810	#,
# sub.c:1400:                 f = f * 0.1;
	vmulsd	%xmm2, %xmm5, %xmm6	# tmp2026, f, f
# sub.c:1396:             for (decimals = 0;; decimals++)
	incl	%r13d	# decimals
# sub.c:1398:                 if (ops_per_sec > f)
	vcomisd	%xmm6, %xmm3	# f, ops_per_sec
	ja	.L810	#,
# sub.c:1400:                 f = f * 0.1;
	vmulsd	%xmm2, %xmm6, %xmm8	# tmp2026, f, f
# sub.c:1396:             for (decimals = 0;; decimals++)
	leal	2(%r8), %r13d	#, decimals
# sub.c:1398:                 if (ops_per_sec > f)
	vcomisd	%xmm8, %xmm3	# f, ops_per_sec
	ja	.L810	#,
# sub.c:1400:                 f = f * 0.1;
	vmulsd	%xmm2, %xmm8, %xmm9	# tmp2026, f, f
# sub.c:1396:             for (decimals = 0;; decimals++)
	leal	3(%r8), %r13d	#, decimals
# sub.c:1398:                 if (ops_per_sec > f)
	vcomisd	%xmm9, %xmm3	# f, ops_per_sec
	ja	.L810	#,
# sub.c:1400:                 f = f * 0.1;
	vmulsd	%xmm2, %xmm9, %xmm10	# tmp2026, f, f
# sub.c:1396:             for (decimals = 0;; decimals++)
	leal	4(%r8), %r13d	#, decimals
# sub.c:1398:                 if (ops_per_sec > f)
	vcomisd	%xmm10, %xmm3	# f, ops_per_sec
	ja	.L810	#,
# sub.c:1400:                 f = f * 0.1;
	vmulsd	%xmm2, %xmm10, %xmm11	# tmp2026, f, f
# sub.c:1396:             for (decimals = 0;; decimals++)
	leal	5(%r8), %r13d	#, decimals
# sub.c:1398:                 if (ops_per_sec > f)
	vcomisd	%xmm11, %xmm3	# f, ops_per_sec
	ja	.L810	#,
# sub.c:1400:                 f = f * 0.1;
	vmulsd	%xmm2, %xmm11, %xmm12	# tmp2026, f, f
# sub.c:1396:             for (decimals = 0;; decimals++)
	leal	6(%r8), %r13d	#, decimals
# sub.c:1398:                 if (ops_per_sec > f)
	vcomisd	%xmm12, %xmm3	# f, ops_per_sec
	ja	.L810	#,
# sub.c:1400:                 f = f * 0.1;
	vmulsd	%xmm2, %xmm12, %xmm13	# tmp2026, f, f
# sub.c:1396:             for (decimals = 0;; decimals++)
	leal	7(%r8), %r13d	#, decimals
# sub.c:1398:                 if (ops_per_sec > f)
	vcomisd	%xmm13, %xmm3	# f, ops_per_sec
	jbe	.L811	#,
.L810:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vmovsd	%xmm3, %xmm3, %xmm0	# ops_per_sec,
	movl	%r13d, %edx	# decimals,
	leaq	.LC72(%rip), %rsi	#, tmp1170
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	vmovsd	%xmm3, -66320(%rbp)	# ops_per_sec, %sfp
	call	__printf_chk@PLT	#
# sub.c:1403:             gzprintf(timespec_file, "%.*f\n", decimals, ops_per_sec);
	movq	-66352(%rbp), %rbx	# %sfp, file
	vmovsd	-66320(%rbp), %xmm0	# %sfp, ops_per_sec
	movl	%r13d, %edx	# decimals,
	leaq	.LC73(%rip), %rsi	#, tmp1171
	movq	%rbx, %rdi	# file,
	movl	$1, %eax	#,
	call	gzprintf@PLT	#
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:54:   free (__ptr);
	movq	%r14, %rdi	# a.123_90,
	call	free@PLT	#
	movq	%r15, %rdi	# b.122_89,
	call	free@PLT	#
# sub.c:1449:     gzclose(test_file);
	movq	-66312(%rbp), %rdi	# %sfp,
	call	gzclose@PLT	#
# sub.c:1457:         gzclose(timespec_file);
	movq	%rbx, %rdi	# file,
	call	gzclose@PLT	#
	jmp	.L813	#
	.p2align 4,,10
	.p2align 3
.L2336:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L873	#,
# sub.c:185:         j++;
	movl	$1, %ecx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %r12	#, sub_size
	je	.L831	#,
# sub.c:192:     } while (j < n);
	jbe	.L872	#,
	testq	%r9, %r9	# tmp1604
	je	.L827	#,
	cmpq	$1, %r9	#, tmp1604
	je	.L1656	#,
	cmpq	$2, %r9	#, tmp1604
	je	.L1657	#,
	cmpq	$3, %r9	#, tmp1604
	je	.L1658	#,
	cmpq	$4, %r9	#, tmp1604
	je	.L1659	#,
	cmpq	$5, %r9	#, tmp1604
	je	.L1660	#,
	cmpq	$6, %r9	#, tmp1604
	jne	.L2398	#,
.L1661:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %rdx	# MEM[(uint64_t *)b.130_105 + j_869 * 8], tmp3928
	cmpq	%rdx, (%r15,%rcx,8)	# tmp3928, MEM[(uint64_t *)a.131_106 + j_869 * 8]
	ja	.L872	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L873	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L831	#,
.L1660:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %rsi	# MEM[(uint64_t *)b.130_105 + j_869 * 8], tmp3929
	cmpq	%rsi, (%r15,%rcx,8)	# tmp3929, MEM[(uint64_t *)a.131_106 + j_869 * 8]
	ja	.L872	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L873	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L831	#,
.L1659:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %r10	# MEM[(uint64_t *)b.130_105 + j_869 * 8], tmp3930
	cmpq	%r10, (%r15,%rcx,8)	# tmp3930, MEM[(uint64_t *)a.131_106 + j_869 * 8]
	ja	.L872	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L873	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L831	#,
.L1658:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %r9	# MEM[(uint64_t *)b.130_105 + j_869 * 8], tmp3931
	cmpq	%r9, (%r15,%rcx,8)	# tmp3931, MEM[(uint64_t *)a.131_106 + j_869 * 8]
	ja	.L872	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L873	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L831	#,
.L1657:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %rdi	# MEM[(uint64_t *)b.130_105 + j_869 * 8], tmp3932
	cmpq	%rdi, (%r15,%rcx,8)	# tmp3932, MEM[(uint64_t *)a.131_106 + j_869 * 8]
	ja	.L872	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L873	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L831	#,
.L1656:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %r8	# MEM[(uint64_t *)b.130_105 + j_869 * 8], tmp3933
	cmpq	%r8, (%r15,%rcx,8)	# tmp3933, MEM[(uint64_t *)a.131_106 + j_869 * 8]
	ja	.L872	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L873	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L831	#,
.L2306:
# sub.c:192:     } while (j < n);
	jbe	.L872	#,
.L827:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %rdx	# MEM[(uint64_t *)b.130_105 + j_869 * 8], tmp3760
	cmpq	%rdx, (%r15,%rcx,8)	# tmp3760, MEM[(uint64_t *)a.131_106 + j_869 * 8]
	ja	.L872	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L873	#,
# sub.c:185:         j++;
	leaq	1(%rcx), %r10	#, tmp1605
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r10, %r12	# tmp1605, sub_size
	je	.L831	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%r10,8), %rsi	# MEM[(uint64_t *)b.130_105 + j_869 * 8], tmp3761
	cmpq	%rsi, (%r15,%r10,8)	# tmp3761, MEM[(uint64_t *)a.131_106 + j_869 * 8]
	ja	.L872	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L873	#,
# sub.c:185:         j++;
	leaq	2(%rcx), %r9	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r9, %r12	# j, sub_size
	je	.L831	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%r9,8), %rdi	# MEM[(uint64_t *)b.130_105 + j_869 * 8], tmp3934
	cmpq	%rdi, (%r15,%r9,8)	# tmp3934, MEM[(uint64_t *)a.131_106 + j_869 * 8]
	ja	.L872	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L873	#,
# sub.c:185:         j++;
	addq	$3, %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L831	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %r8	# MEM[(uint64_t *)b.130_105 + j_869 * 8], tmp3935
	cmpq	%r8, (%r15,%rcx,8)	# tmp3935, MEM[(uint64_t *)a.131_106 + j_869 * 8]
	ja	.L872	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L873	#,
# sub.c:185:         j++;
	leaq	3(%r10), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L831	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %rdx	# MEM[(uint64_t *)b.130_105 + j_869 * 8], tmp3936
	cmpq	%rdx, (%r15,%rcx,8)	# tmp3936, MEM[(uint64_t *)a.131_106 + j_869 * 8]
	ja	.L872	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L873	#,
# sub.c:185:         j++;
	leaq	4(%r10), %rsi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rsi, %r12	# j, sub_size
	je	.L831	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rsi,8), %r9	# MEM[(uint64_t *)b.130_105 + j_869 * 8], tmp3937
	cmpq	%r9, (%r15,%rsi,8)	# tmp3937, MEM[(uint64_t *)a.131_106 + j_869 * 8]
	ja	.L872	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L873	#,
# sub.c:185:         j++;
	leaq	5(%r10), %r8	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r8, %r12	# j, sub_size
	je	.L831	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%r8,8), %rdi	# MEM[(uint64_t *)b.130_105 + j_869 * 8], tmp3938
	cmpq	%rdi, (%r15,%r8,8)	# tmp3938, MEM[(uint64_t *)a.131_106 + j_869 * 8]
	ja	.L872	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L873	#,
# sub.c:185:         j++;
	leaq	6(%r10), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L831	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %rdx	# MEM[(uint64_t *)b.130_105 + j_869 * 8], tmp3939
	cmpq	%rdx, (%r15,%rcx,8)	# tmp3939, MEM[(uint64_t *)a.131_106 + j_869 * 8]
	ja	.L872	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L873	#,
# sub.c:185:         j++;
	leaq	7(%r10), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	jne	.L2306	#,
	jmp	.L831	#
	.p2align 4,,10
	.p2align 3
.L2367:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L864	#,
# sub.c:185:         j++;
	movl	$1, %ecx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %r12	#, sub_size
	je	.L796	#,
# sub.c:192:     } while (j < n);
	jbe	.L863	#,
	testq	%rdx, %rdx	# tmp1653
	je	.L792	#,
	cmpq	$1, %rdx	#, tmp1653
	je	.L1692	#,
	cmpq	$2, %rdx	#, tmp1653
	je	.L1693	#,
	cmpq	$3, %rdx	#, tmp1653
	je	.L1694	#,
	cmpq	$4, %rdx	#, tmp1653
	je	.L1695	#,
	cmpq	$5, %rdx	#, tmp1653
	je	.L1696	#,
	cmpq	$6, %rdx	#, tmp1653
	jne	.L2399	#,
.L1697:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %r9	# MEM[(uint64_t *)b.122_89 + j_624 * 8], tmp4003
	cmpq	%r9, (%r14,%rcx,8)	# tmp4003, MEM[(uint64_t *)a.123_90 + j_624 * 8]
	ja	.L863	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L864	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L796	#,
.L1696:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %rsi	# MEM[(uint64_t *)b.122_89 + j_624 * 8], tmp4004
	cmpq	%rsi, (%r14,%rcx,8)	# tmp4004, MEM[(uint64_t *)a.123_90 + j_624 * 8]
	ja	.L863	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L864	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L796	#,
.L1695:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_624 * 8], tmp4005
	cmpq	%rdi, (%r14,%rcx,8)	# tmp4005, MEM[(uint64_t *)a.123_90 + j_624 * 8]
	ja	.L863	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L864	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L796	#,
.L1694:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %rdx	# MEM[(uint64_t *)b.122_89 + j_624 * 8], tmp4006
	cmpq	%rdx, (%r14,%rcx,8)	# tmp4006, MEM[(uint64_t *)a.123_90 + j_624 * 8]
	ja	.L863	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L864	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L796	#,
.L1693:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %r8	# MEM[(uint64_t *)b.122_89 + j_624 * 8], tmp4007
	cmpq	%r8, (%r14,%rcx,8)	# tmp4007, MEM[(uint64_t *)a.123_90 + j_624 * 8]
	ja	.L863	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L864	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L796	#,
.L1692:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %r9	# MEM[(uint64_t *)b.122_89 + j_624 * 8], tmp4008
	cmpq	%r9, (%r14,%rcx,8)	# tmp4008, MEM[(uint64_t *)a.123_90 + j_624 * 8]
	ja	.L863	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L864	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L796	#,
.L2303:
# sub.c:192:     } while (j < n);
	jbe	.L863	#,
.L792:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %rsi	# MEM[(uint64_t *)b.122_89 + j_624 * 8], tmp3685
	cmpq	%rsi, (%r14,%rcx,8)	# tmp3685, MEM[(uint64_t *)a.123_90 + j_624 * 8]
	ja	.L863	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L864	#,
# sub.c:185:         j++;
	leaq	1(%rcx), %rdx	#, tmp1654
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# tmp1654, sub_size
	je	.L796	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_624 * 8], tmp3686
	cmpq	%rdi, (%r14,%rdx,8)	# tmp3686, MEM[(uint64_t *)a.123_90 + j_624 * 8]
	ja	.L863	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L864	#,
# sub.c:185:         j++;
	leaq	2(%rcx), %r8	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r8, %r12	# j, sub_size
	je	.L796	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%r8,8), %r9	# MEM[(uint64_t *)b.122_89 + j_624 * 8], tmp4009
	cmpq	%r9, (%r14,%r8,8)	# tmp4009, MEM[(uint64_t *)a.123_90 + j_624 * 8]
	ja	.L863	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L864	#,
# sub.c:185:         j++;
	addq	$3, %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L796	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %rsi	# MEM[(uint64_t *)b.122_89 + j_624 * 8], tmp4010
	cmpq	%rsi, (%r14,%rcx,8)	# tmp4010, MEM[(uint64_t *)a.123_90 + j_624 * 8]
	ja	.L863	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L864	#,
# sub.c:185:         j++;
	leaq	3(%rdx), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L796	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_624 * 8], tmp4011
	cmpq	%rdi, (%r14,%rcx,8)	# tmp4011, MEM[(uint64_t *)a.123_90 + j_624 * 8]
	ja	.L863	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L864	#,
# sub.c:185:         j++;
	leaq	4(%rdx), %r8	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r8, %r12	# j, sub_size
	je	.L796	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%r8,8), %r9	# MEM[(uint64_t *)b.122_89 + j_624 * 8], tmp4012
	cmpq	%r9, (%r14,%r8,8)	# tmp4012, MEM[(uint64_t *)a.123_90 + j_624 * 8]
	ja	.L863	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L864	#,
# sub.c:185:         j++;
	leaq	5(%rdx), %rsi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rsi, %r12	# j, sub_size
	je	.L796	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rsi,8), %rcx	# MEM[(uint64_t *)b.122_89 + j_624 * 8], tmp4013
	cmpq	%rcx, (%r14,%rsi,8)	# tmp4013, MEM[(uint64_t *)a.123_90 + j_624 * 8]
	ja	.L863	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L864	#,
# sub.c:185:         j++;
	leaq	6(%rdx), %r8	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r8, %r12	# j, sub_size
	je	.L796	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%r8,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_624 * 8], tmp4014
	cmpq	%rdi, (%r14,%r8,8)	# tmp4014, MEM[(uint64_t *)a.123_90 + j_624 * 8]
	ja	.L863	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L864	#,
# sub.c:185:         j++;
	leaq	7(%rdx), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	jne	.L2303	#,
	jmp	.L796	#
	.p2align 4,,10
	.p2align 3
.L2337:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%r8)	# tmp1272, MEM[(__mmask8 *)_1009]
	jmp	.L1226	#
.L2368:
	kmovb	%k0, (%rdi)	# tmp1103, MEM[(__mmask8 *)_764]
	jmp	.L1419	#
.L2371:
	kmovb	%k2, (%rcx)	# tmp2816, MEM[(__mmask8 *)_764]
	jmp	.L1427	#
.L2340:
	kmovb	%k5, (%rcx)	# tmp2558, MEM[(__mmask8 *)_1009]
	jmp	.L1234	#
.L2380:
# sub.c:1537:         temp.tv_sec = end.tv_sec - start.tv_sec - 1;
	subq	-66336(%rbp), %rax	# %sfp, tmp1107
# sub.c:1546:     return temp.tv_sec * 1000000000 + temp.tv_nsec;
	imulq	$1000000000, %rax, %rdx	#, tmp1107, tmp1109
# sub.c:1538:         temp.tv_nsec = 1000000000 + end.tv_nsec - start.tv_nsec;
	subq	-66320(%rbp), %r10	# %sfp, tmp1111
# sub.c:1546:     return temp.tv_sec * 1000000000 + temp.tv_nsec;
	addq	%r10, %rdx	# tmp1111, _194
# sub.c:1375:             TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
	cmpq	$249999999, %rdx	#, _194
	jle	.L1597	#,
	jmp	.L797	#
.L2370:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k7, (%rcx)	# tmp2810, MEM[(__mmask8 *)_764]
	jmp	.L1424	#
.L2339:
	kmovb	%k3, (%rcx)	# tmp2552, MEM[(__mmask8 *)_1009]
	jmp	.L1231	#
.L2369:
	kmovb	%k5, 1(%rdi)	# tmp2804, MEM[(__mmask8 *)_764]
	jmp	.L1421	#
.L2338:
	kmovb	%k1, 1(%r8)	# tmp2546, MEM[(__mmask8 *)_1009]
	jmp	.L1228	#
.L2388:
	kmovb	%k3, 2(%r8)	# tmp2748, MEM[(__mmask8 *)_753]
	jmp	.L1370	#
.L2396:
	kmovb	%k6, 2(%rsi)	# tmp2490, MEM[(__mmask8 *)_1844]
	jmp	.L1177	#
.L2395:
	kmovb	%k4, 1(%rsi)	# tmp2482, MEM[(__mmask8 *)_1844]
	jmp	.L1175	#
.L2394:
	kmovb	%k2, 1(%rcx)	# tmp2191, MEM[(__mmask8 *)_1844]
	jmp	.L1173	#
.L2387:
	kmovb	%k1, 1(%r8)	# tmp2740, MEM[(__mmask8 *)_753]
	jmp	.L1368	#
.L2386:
	kmovb	%k6, 1(%rcx)	# tmp2025, MEM[(__mmask8 *)_753]
	jmp	.L1366	#
.L2382:
	kmovb	%k0, (%r9)	# tmp1152, MEM[(__mmask8 *)_753]
	jmp	.L1355	#
.L2389:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L877	#,
# sub.c:185:         j++;
	movl	$1, %edx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %r12	#, sub_size
	je	.L842	#,
# sub.c:192:     } while (j < n);
	jbe	.L876	#,
	testq	%r8, %r8	# tmp1588
	je	.L838	#,
	cmpq	$1, %r8	#, tmp1588
	je	.L1644	#,
	cmpq	$2, %r8	#, tmp1588
	je	.L1645	#,
	cmpq	$3, %r8	#, tmp1588
	je	.L1646	#,
	cmpq	$4, %r8	#, tmp1588
	je	.L1647	#,
	cmpq	$5, %r8	#, tmp1588
	je	.L1648	#,
	cmpq	$6, %r8	#, tmp1588
	jne	.L2400	#,
.L1649:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rsi	# MEM[(uint64_t *)b.130_105 + j_957 * 8], tmp3904
	cmpq	%rsi, (%r15,%rdx,8)	# tmp3904, MEM[(uint64_t *)a.131_106 + j_957 * 8]
	ja	.L876	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L877	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L842	#,
.L1648:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rdi	# MEM[(uint64_t *)b.130_105 + j_957 * 8], tmp3905
	cmpq	%rdi, (%r15,%rdx,8)	# tmp3905, MEM[(uint64_t *)a.131_106 + j_957 * 8]
	ja	.L876	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L877	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L842	#,
.L1647:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rcx	# MEM[(uint64_t *)b.130_105 + j_957 * 8], tmp3906
	cmpq	%rcx, (%r15,%rdx,8)	# tmp3906, MEM[(uint64_t *)a.131_106 + j_957 * 8]
	ja	.L876	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L877	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L842	#,
.L1646:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %r8	# MEM[(uint64_t *)b.130_105 + j_957 * 8], tmp3907
	cmpq	%r8, (%r15,%rdx,8)	# tmp3907, MEM[(uint64_t *)a.131_106 + j_957 * 8]
	ja	.L876	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L877	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L842	#,
.L1645:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rbx	# MEM[(uint64_t *)b.130_105 + j_957 * 8], tmp3908
	cmpq	%rbx, (%r15,%rdx,8)	# tmp3908, MEM[(uint64_t *)a.131_106 + j_957 * 8]
	ja	.L876	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L877	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L842	#,
.L1644:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %r9	# MEM[(uint64_t *)b.130_105 + j_957 * 8], tmp3909
	cmpq	%r9, (%r15,%rdx,8)	# tmp3909, MEM[(uint64_t *)a.131_106 + j_957 * 8]
	ja	.L876	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L877	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L842	#,
.L2307:
# sub.c:192:     } while (j < n);
	jbe	.L876	#,
.L838:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rsi	# MEM[(uint64_t *)b.130_105 + j_957 * 8], tmp3789
	cmpq	%rsi, (%r15,%rdx,8)	# tmp3789, MEM[(uint64_t *)a.131_106 + j_957 * 8]
	ja	.L876	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L877	#,
# sub.c:185:         j++;
	leaq	1(%rdx), %rdi	#, tmp1589
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdi, %r12	# tmp1589, sub_size
	je	.L842	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdi,8), %rcx	# MEM[(uint64_t *)b.130_105 + j_957 * 8], tmp3790
	cmpq	%rcx, (%r15,%rdi,8)	# tmp3790, MEM[(uint64_t *)a.131_106 + j_957 * 8]
	ja	.L876	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L877	#,
# sub.c:185:         j++;
	leaq	2(%rdx), %r8	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r8, %r12	# j, sub_size
	je	.L842	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%r8,8), %rbx	# MEM[(uint64_t *)b.130_105 + j_957 * 8], tmp3910
	cmpq	%rbx, (%r15,%r8,8)	# tmp3910, MEM[(uint64_t *)a.131_106 + j_957 * 8]
	ja	.L876	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L877	#,
# sub.c:185:         j++;
	addq	$3, %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L842	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %r9	# MEM[(uint64_t *)b.130_105 + j_957 * 8], tmp3911
	cmpq	%r9, (%r15,%rdx,8)	# tmp3911, MEM[(uint64_t *)a.131_106 + j_957 * 8]
	ja	.L876	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L877	#,
# sub.c:185:         j++;
	leaq	3(%rdi), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L842	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rsi	# MEM[(uint64_t *)b.130_105 + j_957 * 8], tmp3912
	cmpq	%rsi, (%r15,%rdx,8)	# tmp3912, MEM[(uint64_t *)a.131_106 + j_957 * 8]
	ja	.L876	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L877	#,
# sub.c:185:         j++;
	leaq	4(%rdi), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L842	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %r8	# MEM[(uint64_t *)b.130_105 + j_957 * 8], tmp3913
	cmpq	%r8, (%r15,%rcx,8)	# tmp3913, MEM[(uint64_t *)a.131_106 + j_957 * 8]
	ja	.L876	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L877	#,
# sub.c:185:         j++;
	leaq	5(%rdi), %r9	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r9, %r12	# j, sub_size
	je	.L842	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%r9,8), %rbx	# MEM[(uint64_t *)b.130_105 + j_957 * 8], tmp3914
	cmpq	%rbx, (%r15,%r9,8)	# tmp3914, MEM[(uint64_t *)a.131_106 + j_957 * 8]
	ja	.L876	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L877	#,
# sub.c:185:         j++;
	leaq	6(%rdi), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L842	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rsi	# MEM[(uint64_t *)b.130_105 + j_957 * 8], tmp3915
	cmpq	%rsi, (%r15,%rdx,8)	# tmp3915, MEM[(uint64_t *)a.131_106 + j_957 * 8]
	ja	.L876	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L877	#,
# sub.c:185:         j++;
	leaq	7(%rdi), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	jne	.L2307	#,
	jmp	.L842	#
	.p2align 4,,10
	.p2align 3
.L2381:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L867	#,
# sub.c:185:         j++;
	movl	$1, %edx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %r12	#, sub_size
	je	.L808	#,
# sub.c:192:     } while (j < n);
	jbe	.L866	#,
	testq	%r9, %r9	# tmp1637
	je	.L804	#,
	cmpq	$1, %r9	#, tmp1637
	je	.L1680	#,
	cmpq	$2, %r9	#, tmp1637
	je	.L1681	#,
	cmpq	$3, %r9	#, tmp1637
	je	.L1682	#,
	cmpq	$4, %r9	#, tmp1637
	je	.L1683	#,
	cmpq	$5, %r9	#, tmp1637
	je	.L1684	#,
	cmpq	$6, %r9	#, tmp1637
	jne	.L2401	#,
.L1685:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %r8	# MEM[(uint64_t *)b.122_89 + j_706 * 8], tmp3979
	cmpq	%r8, (%r14,%rdx,8)	# tmp3979, MEM[(uint64_t *)a.123_90 + j_706 * 8]
	ja	.L866	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L867	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L808	#,
.L1684:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_706 * 8], tmp3980
	cmpq	%rdi, (%r14,%rdx,8)	# tmp3980, MEM[(uint64_t *)a.123_90 + j_706 * 8]
	ja	.L866	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L867	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L808	#,
.L1683:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %rcx	# MEM[(uint64_t *)b.122_89 + j_706 * 8], tmp3981
	cmpq	%rcx, (%r14,%rdx,8)	# tmp3981, MEM[(uint64_t *)a.123_90 + j_706 * 8]
	ja	.L866	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L867	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L808	#,
.L1682:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %r9	# MEM[(uint64_t *)b.122_89 + j_706 * 8], tmp3982
	cmpq	%r9, (%r14,%rdx,8)	# tmp3982, MEM[(uint64_t *)a.123_90 + j_706 * 8]
	ja	.L866	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L867	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L808	#,
.L1681:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %rsi	# MEM[(uint64_t *)b.122_89 + j_706 * 8], tmp3983
	cmpq	%rsi, (%r14,%rdx,8)	# tmp3983, MEM[(uint64_t *)a.123_90 + j_706 * 8]
	ja	.L866	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L867	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L808	#,
.L1680:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %r8	# MEM[(uint64_t *)b.122_89 + j_706 * 8], tmp3984
	cmpq	%r8, (%r14,%rdx,8)	# tmp3984, MEM[(uint64_t *)a.123_90 + j_706 * 8]
	ja	.L866	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L867	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L808	#,
# sub.c:192:     } while (j < n);
	jbe	.L866	#,
.L804:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_706 * 8], tmp3714
	cmpq	%rdi, (%r14,%rdx,8)	# tmp3714, MEM[(uint64_t *)a.123_90 + j_706 * 8]
	ja	.L866	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L867	#,
# sub.c:185:         j++;
	leaq	1(%rdx), %rcx	#, tmp1638
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# tmp1638, sub_size
	je	.L808	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %r9	# MEM[(uint64_t *)b.122_89 + j_706 * 8], tmp3715
	cmpq	%r9, (%r14,%rcx,8)	# tmp3715, MEM[(uint64_t *)a.123_90 + j_706 * 8]
	ja	.L866	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L867	#,
# sub.c:185:         j++;
	leaq	2(%rdx), %rsi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rsi, %r12	# j, sub_size
	je	.L808	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rsi,8), %r8	# MEM[(uint64_t *)b.122_89 + j_706 * 8], tmp3985
	cmpq	%r8, (%r14,%rsi,8)	# tmp3985, MEM[(uint64_t *)a.123_90 + j_706 * 8]
	ja	.L866	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L867	#,
# sub.c:185:         j++;
	addq	$3, %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L808	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_706 * 8], tmp3986
	cmpq	%rdi, (%r14,%rdx,8)	# tmp3986, MEM[(uint64_t *)a.123_90 + j_706 * 8]
	ja	.L866	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L867	#,
# sub.c:185:         j++;
	leaq	3(%rcx), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L808	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %r9	# MEM[(uint64_t *)b.122_89 + j_706 * 8], tmp3987
	cmpq	%r9, (%r14,%rdx,8)	# tmp3987, MEM[(uint64_t *)a.123_90 + j_706 * 8]
	ja	.L866	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L867	#,
# sub.c:185:         j++;
	leaq	4(%rcx), %rsi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rsi, %r12	# j, sub_size
	je	.L808	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rsi,8), %r8	# MEM[(uint64_t *)b.122_89 + j_706 * 8], tmp3988
	cmpq	%r8, (%r14,%rsi,8)	# tmp3988, MEM[(uint64_t *)a.123_90 + j_706 * 8]
	ja	.L866	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L867	#,
# sub.c:185:         j++;
	leaq	5(%rcx), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L808	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_706 * 8], tmp3989
	cmpq	%rdi, (%r14,%rdx,8)	# tmp3989, MEM[(uint64_t *)a.123_90 + j_706 * 8]
	ja	.L866	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L867	#,
# sub.c:185:         j++;
	leaq	6(%rcx), %r9	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r9, %r12	# j, sub_size
	je	.L808	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%r9,8), %rsi	# MEM[(uint64_t *)b.122_89 + j_706 * 8], tmp3990
	cmpq	%rsi, (%r14,%r9,8)	# tmp3990, MEM[(uint64_t *)a.123_90 + j_706 * 8]
	ja	.L866	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L867	#,
# sub.c:185:         j++;
	leaq	7(%rcx), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L808	#,
# sub.c:192:     } while (j < n);
	ja	.L804	#,
	jmp	.L866	#
	.p2align 4,,10
	.p2align 3
.L864:
	movq	%r14, %rsi	# a.123_90, b
	movq	%r15, %r8	# b.122_89, a
	jmp	.L788	#
.L873:
	movq	%r15, %r10	# a.131_106, b
	movq	%r14, %rsi	# b.130_105, a
	jmp	.L824	#
.L2390:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%r8)	# tmp1336, MEM[(__mmask8 *)_1844]
	jmp	.L1162	#
.L2393:
	kmovb	%k6, (%rcx)	# tmp2474, MEM[(__mmask8 *)_1844]
	jmp	.L1170	#
.L2385:
	kmovb	%k3, (%rcx)	# tmp2732, MEM[(__mmask8 *)_753]
	jmp	.L1363	#
.L2397:
# sub.c:1538:         temp.tv_nsec = 1000000000 + end.tv_nsec - start.tv_nsec;
	addq	$1000000000, %r13	#, tmp1157
# sub.c:1537:         temp.tv_sec = end.tv_sec - start.tv_sec - 1;
	subq	%r10, %r12	# SR.213, tmp1156
# sub.c:1538:         temp.tv_nsec = 1000000000 + end.tv_nsec - start.tv_nsec;
	movq	%r13, %rbx	# tmp1157, tmp1157
# sub.c:1537:         temp.tv_sec = end.tv_sec - start.tv_sec - 1;
	decq	%r12	# temp$tv_sec
# sub.c:1538:         temp.tv_nsec = 1000000000 + end.tv_nsec - start.tv_nsec;
	subq	-66328(%rbp), %rbx	# %sfp, tmp1157
	jmp	.L809	#
.L2355:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k7, (%rcx)	# tmp2210, MEM[(__mmask8 *)_921]
	jmp	.L974	#
.L2384:
	kmovb	%k1, (%rcx)	# tmp2726, MEM[(__mmask8 *)_753]
	jmp	.L1360	#
.L2392:
	kmovb	%k4, (%rcx)	# tmp2468, MEM[(__mmask8 *)_1844]
	jmp	.L1167	#
.L2377:
	kmovb	%k1, 2(%rsi)	# tmp2916, MEM[(__mmask8 *)_674]
	jmp	.L1498	#
.L2376:
	kmovb	%k6, 1(%rsi)	# tmp2908, MEM[(__mmask8 *)_674]
	jmp	.L1496	#
.L2350:
	kmovb	%k4, 2(%r8)	# tmp2658, MEM[(__mmask8 *)_1164]
	jmp	.L1305	#
.L2349:
	kmovb	%k2, 1(%r8)	# tmp2650, MEM[(__mmask8 *)_1164]
	jmp	.L1303	#
.L2348:
	kmovb	%k7, 1(%rcx)	# tmp2082, MEM[(__mmask8 *)_1164]
	jmp	.L1301	#
.L2375:
	kmovb	%k4, 1(%rcx)	# tmp1916, MEM[(__mmask8 *)_674]
	jmp	.L1494	#
.L2344:
	kmovb	%k3, 1(%rdx)	# tmp1753, MEM[(__mmask8 *)_844]
	jmp	.L1108	#
.L2346:
	kmovb	%k7, 2(%rsi)	# tmp2400, MEM[(__mmask8 *)_844]
	jmp	.L1112	#
.L2345:
	kmovb	%k5, 1(%rsi)	# tmp2392, MEM[(__mmask8 *)_844]
	jmp	.L1110	#
.L2383:
	kmovb	%k6, 1(%r9)	# tmp2720, MEM[(__mmask8 *)_753]
	jmp	.L1357	#
.L2354:
	kmovb	%k5, 1(%r8)	# tmp2204, MEM[(__mmask8 *)_921]
	jmp	.L971	#
.L2391:
	kmovb	%k2, 1(%r8)	# tmp2462, MEM[(__mmask8 *)_1844]
	jmp	.L1164	#
.L867:
	movq	%r14, %rsi	# a.123_90, b
	movq	%r15, %rdi	# b.122_89, a
	jmp	.L801	#
.L877:
	movq	%r15, %rbx	# a.131_106, b
	movq	%r14, %rdi	# b.130_105, a
	jmp	.L835	#
.L2313:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L854	#,
# sub.c:185:         j++;
	movl	$1, %edx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %r12	#, sub_size
	je	.L751	#,
# sub.c:192:     } while (j < n);
	jbe	.L853	#,
	testq	%rcx, %rcx	# tmp1571
	je	.L747	#,
	cmpq	$1, %rcx	#, tmp1571
	je	.L1632	#,
	cmpq	$2, %rcx	#, tmp1571
	je	.L1633	#,
	cmpq	$3, %rcx	#, tmp1571
	je	.L1634	#,
	cmpq	$4, %rcx	#, tmp1571
	je	.L1635	#,
	cmpq	$5, %rcx	#, tmp1571
	je	.L1636	#,
	cmpq	$6, %rcx	#, tmp1571
	jne	.L2402	#,
.L1637:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %r9	# MEM[(uint64_t *)b.114_69 + j_311 * 8], tmp3880
	cmpq	%r9, (%r15,%rdx,8)	# tmp3880, MEM[(uint64_t *)a.115_70 + j_311 * 8]
	ja	.L853	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L854	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L751	#,
.L1636:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rsi	# MEM[(uint64_t *)b.114_69 + j_311 * 8], tmp3881
	cmpq	%rsi, (%r15,%rdx,8)	# tmp3881, MEM[(uint64_t *)a.115_70 + j_311 * 8]
	ja	.L853	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L854	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L751	#,
.L1635:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rbx	# MEM[(uint64_t *)b.114_69 + j_311 * 8], tmp3882
	cmpq	%rbx, (%r15,%rdx,8)	# tmp3882, MEM[(uint64_t *)a.115_70 + j_311 * 8]
	ja	.L853	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L854	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L751	#,
.L1634:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rdi	# MEM[(uint64_t *)b.114_69 + j_311 * 8], tmp3883
	cmpq	%rdi, (%r15,%rdx,8)	# tmp3883, MEM[(uint64_t *)a.115_70 + j_311 * 8]
	ja	.L853	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L854	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L751	#,
.L1633:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %r8	# MEM[(uint64_t *)b.114_69 + j_311 * 8], tmp3884
	cmpq	%r8, (%r15,%rdx,8)	# tmp3884, MEM[(uint64_t *)a.115_70 + j_311 * 8]
	ja	.L853	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L854	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L751	#,
.L1632:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rcx	# MEM[(uint64_t *)b.114_69 + j_311 * 8], tmp3885
	cmpq	%rcx, (%r15,%rdx,8)	# tmp3885, MEM[(uint64_t *)a.115_70 + j_311 * 8]
	ja	.L853	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L854	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L751	#,
# sub.c:192:     } while (j < n);
	jbe	.L853	#,
.L747:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %r10	# MEM[(uint64_t *)b.114_69 + j_311 * 8], tmp3592
	cmpq	%r10, (%r15,%rdx,8)	# tmp3592, MEM[(uint64_t *)a.115_70 + j_311 * 8]
	ja	.L853	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L854	#,
# sub.c:185:         j++;
	leaq	1(%rdx), %r11	#, tmp1572
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r11, %r12	# tmp1572, sub_size
	je	.L751	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%r11,8), %r9	# MEM[(uint64_t *)b.114_69 + j_311 * 8], tmp3593
	cmpq	%r9, (%r15,%r11,8)	# tmp3593, MEM[(uint64_t *)a.115_70 + j_311 * 8]
	ja	.L853	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L854	#,
# sub.c:185:         j++;
	leaq	2(%rdx), %rsi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rsi, %r12	# j, sub_size
	je	.L751	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rsi,8), %rbx	# MEM[(uint64_t *)b.114_69 + j_311 * 8], tmp3886
	cmpq	%rbx, (%r15,%rsi,8)	# tmp3886, MEM[(uint64_t *)a.115_70 + j_311 * 8]
	ja	.L853	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L854	#,
# sub.c:185:         j++;
	addq	$3, %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L751	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %rdi	# MEM[(uint64_t *)b.114_69 + j_311 * 8], tmp3887
	cmpq	%rdi, (%r15,%rdx,8)	# tmp3887, MEM[(uint64_t *)a.115_70 + j_311 * 8]
	ja	.L853	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L854	#,
# sub.c:185:         j++;
	leaq	3(%r11), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L751	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %r8	# MEM[(uint64_t *)b.114_69 + j_311 * 8], tmp3888
	cmpq	%r8, (%r15,%rdx,8)	# tmp3888, MEM[(uint64_t *)a.115_70 + j_311 * 8]
	ja	.L853	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L854	#,
# sub.c:185:         j++;
	leaq	4(%r11), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L751	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rcx,8), %r10	# MEM[(uint64_t *)b.114_69 + j_311 * 8], tmp3889
	cmpq	%r10, (%r15,%rcx,8)	# tmp3889, MEM[(uint64_t *)a.115_70 + j_311 * 8]
	ja	.L853	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L854	#,
# sub.c:185:         j++;
	leaq	5(%r11), %r9	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r9, %r12	# j, sub_size
	je	.L751	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%r9,8), %rsi	# MEM[(uint64_t *)b.114_69 + j_311 * 8], tmp3890
	cmpq	%rsi, (%r15,%r9,8)	# tmp3890, MEM[(uint64_t *)a.115_70 + j_311 * 8]
	ja	.L853	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L854	#,
# sub.c:185:         j++;
	leaq	6(%r11), %rdi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdi, %r12	# j, sub_size
	je	.L751	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdi,8), %rbx	# MEM[(uint64_t *)b.114_69 + j_311 * 8], tmp3891
	cmpq	%rbx, (%r15,%rdi,8)	# tmp3891, MEM[(uint64_t *)a.115_70 + j_311 * 8]
	ja	.L853	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L854	#,
# sub.c:185:         j++;
	leaq	7(%r11), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L751	#,
# sub.c:192:     } while (j < n);
	ja	.L747	#,
	jmp	.L853	#
	.p2align 4,,10
	.p2align 3
.L2330:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L870	#,
# sub.c:185:         j++;
	movl	$1, %eax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %r12	#, sub_size
	je	.L821	#,
# sub.c:192:     } while (j < n);
	jbe	.L869	#,
	testq	%rdi, %rdi	# tmp1620
	je	.L817	#,
	cmpq	$1, %rdi	#, tmp1620
	je	.L1668	#,
	cmpq	$2, %rdi	#, tmp1620
	je	.L1669	#,
	cmpq	$3, %rdi	#, tmp1620
	je	.L1670	#,
	cmpq	$4, %rdi	#, tmp1620
	je	.L1671	#,
	cmpq	$5, %rdi	#, tmp1620
	je	.L1672	#,
	cmpq	$6, %rdi	#, tmp1620
	jne	.L2403	#,
.L1673:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rax,8), %r11	# MEM[(uint64_t *)b.130_105 + j_788 * 8], tmp3955
	cmpq	%r11, (%r15,%rax,8)	# tmp3955, MEM[(uint64_t *)a.131_106 + j_788 * 8]
	ja	.L869	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L870	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L821	#,
.L1672:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rax,8), %r8	# MEM[(uint64_t *)b.130_105 + j_788 * 8], tmp3956
	cmpq	%r8, (%r15,%rax,8)	# tmp3956, MEM[(uint64_t *)a.131_106 + j_788 * 8]
	ja	.L869	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L870	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L821	#,
.L1671:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rax,8), %rbx	# MEM[(uint64_t *)b.130_105 + j_788 * 8], tmp3957
	cmpq	%rbx, (%r15,%rax,8)	# tmp3957, MEM[(uint64_t *)a.131_106 + j_788 * 8]
	ja	.L869	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L870	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L821	#,
.L1670:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rax,8), %rsi	# MEM[(uint64_t *)b.130_105 + j_788 * 8], tmp3958
	cmpq	%rsi, (%r15,%rax,8)	# tmp3958, MEM[(uint64_t *)a.131_106 + j_788 * 8]
	ja	.L869	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L870	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L821	#,
.L1669:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rax,8), %r9	# MEM[(uint64_t *)b.130_105 + j_788 * 8], tmp3959
	cmpq	%r9, (%r15,%rax,8)	# tmp3959, MEM[(uint64_t *)a.131_106 + j_788 * 8]
	ja	.L869	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L870	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L821	#,
.L1668:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rax,8), %rdi	# MEM[(uint64_t *)b.130_105 + j_788 * 8], tmp3960
	cmpq	%rdi, (%r15,%rax,8)	# tmp3960, MEM[(uint64_t *)a.131_106 + j_788 * 8]
	ja	.L869	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L870	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L821	#,
.L2305:
# sub.c:192:     } while (j < n);
	jbe	.L869	#,
.L817:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rax,8), %rcx	# MEM[(uint64_t *)b.130_105 + j_788 * 8], tmp3738
	cmpq	%rcx, (%r15,%rax,8)	# tmp3738, MEM[(uint64_t *)a.131_106 + j_788 * 8]
	ja	.L869	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L870	#,
# sub.c:185:         j++;
	leaq	1(%rax), %r10	#, tmp1621
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r10, %r12	# tmp1621, sub_size
	je	.L821	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%r10,8), %r11	# MEM[(uint64_t *)b.130_105 + j_788 * 8], tmp3740
	cmpq	%r11, (%r15,%r10,8)	# tmp3740, MEM[(uint64_t *)a.131_106 + j_788 * 8]
	ja	.L869	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L870	#,
# sub.c:185:         j++;
	leaq	2(%rax), %r8	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r8, %r12	# j, sub_size
	je	.L821	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%r8,8), %rbx	# MEM[(uint64_t *)b.130_105 + j_788 * 8], tmp3961
	cmpq	%rbx, (%r15,%r8,8)	# tmp3961, MEM[(uint64_t *)a.131_106 + j_788 * 8]
	ja	.L869	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L870	#,
# sub.c:185:         j++;
	addq	$3, %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L821	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rax,8), %rsi	# MEM[(uint64_t *)b.130_105 + j_788 * 8], tmp3962
	cmpq	%rsi, (%r15,%rax,8)	# tmp3962, MEM[(uint64_t *)a.131_106 + j_788 * 8]
	ja	.L869	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L870	#,
# sub.c:185:         j++;
	leaq	3(%r10), %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L821	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rax,8), %r9	# MEM[(uint64_t *)b.130_105 + j_788 * 8], tmp3963
	cmpq	%r9, (%r15,%rax,8)	# tmp3963, MEM[(uint64_t *)a.131_106 + j_788 * 8]
	ja	.L869	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L870	#,
# sub.c:185:         j++;
	leaq	4(%r10), %rdi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdi, %r12	# j, sub_size
	je	.L821	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdi,8), %rcx	# MEM[(uint64_t *)b.130_105 + j_788 * 8], tmp3964
	cmpq	%rcx, (%r15,%rdi,8)	# tmp3964, MEM[(uint64_t *)a.131_106 + j_788 * 8]
	ja	.L869	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L870	#,
# sub.c:185:         j++;
	leaq	5(%r10), %r11	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r11, %r12	# j, sub_size
	je	.L821	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%r11,8), %r8	# MEM[(uint64_t *)b.130_105 + j_788 * 8], tmp3965
	cmpq	%r8, (%r15,%r11,8)	# tmp3965, MEM[(uint64_t *)a.131_106 + j_788 * 8]
	ja	.L869	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L870	#,
# sub.c:185:         j++;
	leaq	6(%r10), %rsi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rsi, %r12	# j, sub_size
	je	.L821	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rsi,8), %rbx	# MEM[(uint64_t *)b.130_105 + j_788 * 8], tmp3966
	cmpq	%rbx, (%r15,%rsi,8)	# tmp3966, MEM[(uint64_t *)a.131_106 + j_788 * 8]
	ja	.L869	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L870	#,
# sub.c:185:         j++;
	leaq	7(%r10), %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	jne	.L2305	#,
	jmp	.L821	#
	.p2align 4,,10
	.p2align 3
.L2332:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rcx)	# tmp1224, MEM[(__mmask8 *)_1164]
	jmp	.L1290	#
.L2318:
	kmovb	%k7, (%rdx)	# tmp2384, MEM[(__mmask8 *)_844]
	jmp	.L1105	#
.L2335:
	kmovb	%k4, (%rcx)	# tmp2642, MEM[(__mmask8 *)_1164]
	jmp	.L1298	#
.L2315:
	kmovb	%k0, (%rdx)	# tmp906, MEM[(__mmask8 *)_844]
	jmp	.L1097	#
.L2363:
	kmovb	%k0, (%rcx)	# tmp1072, MEM[(__mmask8 *)_674]
	jmp	.L1483	#
.L2361:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L862	#,
# sub.c:185:         j++;
	movl	$1, %eax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %r12	#, sub_size
	je	.L784	#,
# sub.c:192:     } while (j < n);
	jbe	.L861	#,
	testq	%r8, %r8	# tmp1669
	je	.L780	#,
	cmpq	$1, %r8	#, tmp1669
	je	.L1704	#,
	cmpq	$2, %r8	#, tmp1669
	je	.L1705	#,
	cmpq	$3, %r8	#, tmp1669
	je	.L1706	#,
	cmpq	$4, %r8	#, tmp1669
	je	.L1707	#,
	cmpq	$5, %r8	#, tmp1669
	je	.L1708	#,
	cmpq	$6, %r8	#, tmp1669
	jne	.L2404	#,
.L1709:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %rbx	# MEM[(uint64_t *)b.122_89 + j_551 * 8], tmp4030
	cmpq	%rbx, (%r14,%rax,8)	# tmp4030, MEM[(uint64_t *)a.123_90 + j_551 * 8]
	ja	.L861	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L862	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L784	#,
.L1708:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %r10	# MEM[(uint64_t *)b.122_89 + j_551 * 8], tmp4031
	cmpq	%r10, (%r14,%rax,8)	# tmp4031, MEM[(uint64_t *)a.123_90 + j_551 * 8]
	ja	.L861	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L862	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L784	#,
.L1707:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %r11	# MEM[(uint64_t *)b.122_89 + j_551 * 8], tmp4032
	cmpq	%r11, (%r14,%rax,8)	# tmp4032, MEM[(uint64_t *)a.123_90 + j_551 * 8]
	ja	.L861	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L862	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L784	#,
.L1706:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_551 * 8], tmp4033
	cmpq	%rdi, (%r14,%rax,8)	# tmp4033, MEM[(uint64_t *)a.123_90 + j_551 * 8]
	ja	.L861	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L862	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L784	#,
.L1705:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %rsi	# MEM[(uint64_t *)b.122_89 + j_551 * 8], tmp4034
	cmpq	%rsi, (%r14,%rax,8)	# tmp4034, MEM[(uint64_t *)a.123_90 + j_551 * 8]
	ja	.L861	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L862	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L784	#,
.L1704:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %r8	# MEM[(uint64_t *)b.122_89 + j_551 * 8], tmp4035
	cmpq	%r8, (%r14,%rax,8)	# tmp4035, MEM[(uint64_t *)a.123_90 + j_551 * 8]
	ja	.L861	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L862	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L784	#,
.L2302:
# sub.c:192:     } while (j < n);
	jbe	.L861	#,
.L780:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %rcx	# MEM[(uint64_t *)b.122_89 + j_551 * 8], tmp3662
	cmpq	%rcx, (%r14,%rax,8)	# tmp3662, MEM[(uint64_t *)a.123_90 + j_551 * 8]
	ja	.L861	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L862	#,
# sub.c:185:         j++;
	leaq	1(%rax), %r9	#, tmp1670
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r9, %r12	# tmp1670, sub_size
	je	.L784	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%r9,8), %rbx	# MEM[(uint64_t *)b.122_89 + j_551 * 8], tmp3663
	cmpq	%rbx, (%r14,%r9,8)	# tmp3663, MEM[(uint64_t *)a.123_90 + j_551 * 8]
	ja	.L861	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L862	#,
# sub.c:185:         j++;
	leaq	2(%rax), %r10	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r10, %r12	# j, sub_size
	je	.L784	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%r10,8), %r11	# MEM[(uint64_t *)b.122_89 + j_551 * 8], tmp4036
	cmpq	%r11, (%r14,%r10,8)	# tmp4036, MEM[(uint64_t *)a.123_90 + j_551 * 8]
	ja	.L861	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L862	#,
# sub.c:185:         j++;
	addq	$3, %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L784	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_551 * 8], tmp4037
	cmpq	%rdi, (%r14,%rax,8)	# tmp4037, MEM[(uint64_t *)a.123_90 + j_551 * 8]
	ja	.L861	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L862	#,
# sub.c:185:         j++;
	leaq	3(%r9), %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L784	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %rsi	# MEM[(uint64_t *)b.122_89 + j_551 * 8], tmp4038
	cmpq	%rsi, (%r14,%rax,8)	# tmp4038, MEM[(uint64_t *)a.123_90 + j_551 * 8]
	ja	.L861	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L862	#,
# sub.c:185:         j++;
	leaq	4(%r9), %r8	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r8, %r12	# j, sub_size
	je	.L784	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%r8,8), %rcx	# MEM[(uint64_t *)b.122_89 + j_551 * 8], tmp4039
	cmpq	%rcx, (%r14,%r8,8)	# tmp4039, MEM[(uint64_t *)a.123_90 + j_551 * 8]
	ja	.L861	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L862	#,
# sub.c:185:         j++;
	leaq	5(%r9), %r10	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r10, %r12	# j, sub_size
	je	.L784	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%r10,8), %rbx	# MEM[(uint64_t *)b.122_89 + j_551 * 8], tmp4040
	cmpq	%rbx, (%r14,%r10,8)	# tmp4040, MEM[(uint64_t *)a.123_90 + j_551 * 8]
	ja	.L861	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L862	#,
# sub.c:185:         j++;
	leaq	6(%r9), %r11	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r11, %r12	# j, sub_size
	je	.L784	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%r11,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_551 * 8], tmp4041
	cmpq	%rdi, (%r14,%r11,8)	# tmp4041, MEM[(uint64_t *)a.123_90 + j_551 * 8]
	ja	.L861	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L862	#,
# sub.c:185:         j++;
	leaq	7(%r9), %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	jne	.L2302	#,
	jmp	.L784	#
	.p2align 4,,10
	.p2align 3
.L860:
	movq	%r15, %rsi	# a.115_70, b
	movq	%r14, %rbx	# b.114_69, a
	jmp	.L766	#
.L2366:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k1, (%rcx)	# tmp2900, MEM[(__mmask8 *)_674]
	jmp	.L1491	#
.L870:
	movq	%r15, %r10	# a.131_106, b
	movq	%r14, %rdi	# b.130_105, a
	jmp	.L814	#
.L2403:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rax,8), %r10	# MEM[(uint64_t *)b.130_105 + j_788 * 8], tmp3954
	cmpq	%r10, (%r15,%rax,8)	# tmp3954, MEM[(uint64_t *)a.131_106 + j_788 * 8]
	ja	.L869	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L870	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	jne	.L1673	#,
	jmp	.L821	#
.L2308:
	movq	-66312(%rbp), %rdi	# %sfp,
	call	skip_first_line.part.0	#
.L862:
	movq	%r14, %r10	# a.123_90, b
	movq	%r15, %r8	# b.122_89, a
	jmp	.L777	#
.L2329:
# sub.c:1474: }
	call	__stack_chk_fail@PLT	#
.L2404:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %r9	# MEM[(uint64_t *)b.122_89 + j_551 * 8], tmp4029
	cmpq	%r9, (%r14,%rax,8)	# tmp4029, MEM[(uint64_t *)a.123_90 + j_551 * 8]
	ja	.L861	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L862	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	jne	.L1709	#,
	jmp	.L784	#
	.p2align 4,,10
	.p2align 3
.L2364:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k4, (%rcx)	# tmp2888, MEM[(__mmask8 *)_674]
	jmp	.L1485	#
.L854:
	movq	%r15, %r11	# a.115_70, b
	movq	%r14, %r8	# b.114_69, a
	jmp	.L744	#
.L2402:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r14,%rdx,8), %r11	# MEM[(uint64_t *)b.114_69 + j_311 * 8], tmp3879
	cmpq	%r11, (%r15,%rdx,8)	# tmp3879, MEM[(uint64_t *)a.115_70 + j_311 * 8]
	ja	.L853	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L854	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	jne	.L1637	#,
	jmp	.L751	#
.L844:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC49(%rip), %rdi	#, tmp1343
	call	puts@PLT	#
# sub.c:1467:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L2310:
	movq	%r12, %rdi	# tmp1481,
	call	open_gzfile.part.0	#
.L716:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC37(%rip), %rdi	#, tmp785
	call	puts@PLT	#
# sub.c:1181:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L2316:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k3, (%rdx)	# tmp2372, MEM[(__mmask8 *)_844]
	jmp	.L1099	#
.L2333:
	kmovb	%k7, (%rcx)	# tmp2630, MEM[(__mmask8 *)_1164]
	jmp	.L1292	#
.L2328:
# sub.c:1219:                     perror("Error reading line");
	leaq	.LC39(%rip), %rdi	#, tmp817
	call	perror@PLT	#
# sub.c:1220:                     gzclose(test_file);
	movq	-66312(%rbp), %rdi	# %sfp,
	call	gzclose@PLT	#
# sub.c:1221:                     exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L732:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	# stderr,
	movq	%r12, %rcx	# tmp1475,
	leaq	.LC41(%rip), %rdx	#, tmp820
	movl	$1, %esi	#,
	xorl	%eax, %eax	#
	call	__fprintf_chk@PLT	#
# sub.c:1234:             gzclose(test_file);
	movq	-66312(%rbp), %rdi	# %sfp,
	call	gzclose@PLT	#
# sub.c:1235:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5801:
	.size	run_benchmarking_test, .-run_benchmarking_test
	.section	.rodata.str1.8
	.align 8
.LC88:
	.string	"Usage: %s <number of bits> <core number> <test-case number> <measure_type>\n"
	.align 8
.LC89:
	.string	"test-case number: 0 --> Random numbers"
	.align 8
.LC90:
	.string	"test-case number: 1 --> Random numbers with a < b"
	.align 8
.LC91:
	.string	"test-case number: 2 --> Random numbers with a > b"
	.align 8
.LC92:
	.string	"test-case number: 3 --> Random numbers with a = b"
	.section	.rodata.str1.1
.LC93:
	.string	"measure_type: 0 --> RDTSC"
.LC94:
	.string	"measure_type: 1 --> Timespec"
.LC95:
	.string	"measure_type: 2 --> RUSAGE"
.LC96:
	.string	"sub.c"
.LC97:
	.string	"atoi(argv[1]) > 0"
	.section	.rodata.str1.8
	.align 8
.LC98:
	.string	"atoi(argv[2]) >= 0 && atoi(argv[2]) < sysconf(_SC_NPROCESSORS_ONLN)"
	.align 8
.LC99:
	.string	"atoi(argv[3]) >= 0 && atoi(argv[3]) < 4"
	.align 8
.LC100:
	.string	"atoi(argv[4]) >= 0 && atoi(argv[4]) < 3"
	.align 8
.LC101:
	.string	"Memory allocation failed for sub_space or borrow_space\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB5785:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rsi, %rbx	# tmp192, argv
	andq	$-64, %rsp	#,
	subq	$64, %rsp	#,
# sub.c:279: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp208
	movq	%rax, 56(%rsp)	# tmp208, D.41412
	xorl	%eax, %eax	# tmp208
# sub.c:280:     if (argc != 5)
	cmpl	$5, %edi	#, tmp191
	je	.L2406	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	(%rsi), %rdx	# *argv_26(D),
	movl	$1, %edi	#,
	leaq	.LC88(%rip), %rsi	#, tmp136
	call	__printf_chk@PLT	#
	leaq	.LC89(%rip), %rdi	#, tmp137
	call	puts@PLT	#
	leaq	.LC90(%rip), %rdi	#, tmp138
	call	puts@PLT	#
	leaq	.LC91(%rip), %rdi	#, tmp139
	call	puts@PLT	#
	leaq	.LC92(%rip), %rdi	#, tmp140
	call	puts@PLT	#
	leaq	.LC93(%rip), %rdi	#, tmp141
	call	puts@PLT	#
	leaq	.LC94(%rip), %rdi	#, tmp142
	call	puts@PLT	#
	leaq	.LC95(%rip), %rdi	#, tmp143
	call	puts@PLT	#
# sub.c:290:         return 1;
	movl	$1, %r12d	#, <retval>
.L2405:
# sub.c:335: }
	movq	56(%rsp), %rax	# D.41412, tmp209
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp209
	jne	.L2423	#,
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	movl	%r12d, %eax	# <retval>,
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
.L2406:
	.cfi_restore_state
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	8(%rsi), %rdi	# MEM[(char * *)argv_26(D) + 8B], MEM[(char * *)argv_26(D) + 8B]
	movl	$10, %edx	#,
	xorl	%esi, %esi	#
	call	strtol@PLT	#
# sub.c:293:     assert(atoi(argv[1]) > 0);
	testl	%eax, %eax	# tmp193
	jle	.L2424	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	8(%rbx), %rdi	# MEM[(char * *)argv_26(D) + 8B], MEM[(char * *)argv_26(D) + 8B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
	call	strtol@PLT	#
	movq	16(%rbx), %rdi	# MEM[(char * *)argv_26(D) + 16B], MEM[(char * *)argv_26(D) + 16B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movl	%eax, NUM_BITS(%rip)	# tmp194, NUM_BITS
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	call	strtol@PLT	#
# sub.c:296:     assert(atoi(argv[2]) >= 0 && atoi(argv[2]) < sysconf(_SC_NPROCESSORS_ONLN));
	testl	%eax, %eax	# tmp195
	js	.L2410	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	16(%rbx), %rdi	# MEM[(char * *)argv_26(D) + 16B], MEM[(char * *)argv_26(D) + 16B]
	movl	$10, %edx	#,
	xorl	%esi, %esi	#
	call	strtol@PLT	#
	movq	%rax, %r12	# tmp196, _54
# sub.c:296:     assert(atoi(argv[2]) >= 0 && atoi(argv[2]) < sysconf(_SC_NPROCESSORS_ONLN));
	movl	$84, %edi	#,
	call	sysconf@PLT	#
	movslq	%r12d, %rdx	# _54, _54
	cmpq	%rax, %rdx	# tmp197, _54
	jge	.L2410	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	16(%rbx), %rdi	# MEM[(char * *)argv_26(D) + 16B], MEM[(char * *)argv_26(D) + 16B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
	call	strtol@PLT	#
	movq	24(%rbx), %rdi	# MEM[(char * *)argv_26(D) + 24B], MEM[(char * *)argv_26(D) + 24B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movl	%eax, CORE_NO(%rip)	# tmp198, CORE_NO
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	call	strtol@PLT	#
# sub.c:299:     assert(atoi(argv[3]) >= 0 && atoi(argv[3]) < 4);
	testl	%eax, %eax	# tmp199
	js	.L2412	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	24(%rbx), %rdi	# MEM[(char * *)argv_26(D) + 24B], MEM[(char * *)argv_26(D) + 24B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
	call	strtol@PLT	#
# sub.c:299:     assert(atoi(argv[3]) >= 0 && atoi(argv[3]) < 4);
	cmpl	$3, %eax	#, tmp200
	jg	.L2412	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	24(%rbx), %rdi	# MEM[(char * *)argv_26(D) + 24B], MEM[(char * *)argv_26(D) + 24B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
	call	strtol@PLT	#
	movq	32(%rbx), %rdi	# MEM[(char * *)argv_26(D) + 32B], MEM[(char * *)argv_26(D) + 32B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movl	%eax, %r13d	# tmp201, _65
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	call	strtol@PLT	#
# sub.c:302:     assert(atoi(argv[4]) >= 0 && atoi(argv[4]) < 3);
	testl	%eax, %eax	# tmp202
	js	.L2414	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	32(%rbx), %rdi	# MEM[(char * *)argv_26(D) + 32B], MEM[(char * *)argv_26(D) + 32B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
	call	strtol@PLT	#
# sub.c:302:     assert(atoi(argv[4]) >= 0 && atoi(argv[4]) < 3);
	cmpl	$2, %eax	#, tmp203
	jg	.L2414	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	32(%rbx), %rdi	# MEM[(char * *)argv_26(D) + 32B], MEM[(char * *)argv_26(D) + 32B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
	call	strtol@PLT	#
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	48(%rsp), %rdi	#, tmp168
	movl	$1073741824, %edx	#,
	movl	$64, %esi	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movl	%eax, %r14d	# tmp204, _69
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	call	posix_memalign@PLT	#
	testl	%eax, %eax	# tmp205
	jne	.L2415	#,
	movq	48(%rsp), %rbx	# D.41402, _115
	leaq	40(%rsp), %rdi	#, tmp169
	movl	$1073741824, %edx	#,
	movl	$64, %esi	#,
# sub.c:306:     sub_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	%rbx, sub_space(%rip)	# _115, sub_space
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	call	posix_memalign@PLT	#
	movl	%eax, %r12d	# tmp206, <retval>
	testl	%eax, %eax	# <retval>
	jne	.L2416	#,
	movq	40(%rsp), %r15	# D.41396, _103
# sub.c:307:     borrow_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	%r15, borrow_space(%rip)	# _103, borrow_space
# sub.c:310:     if (sub_space == NULL || borrow_space == NULL)
	testq	%r15, %r15	# _103
	je	.L2419	#,
	testq	%rbx, %rbx	# _115
	je	.L2419	#,
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	xorl	%esi, %esi	#
	movq	%rbx, %rdi	# _115,
	movl	$1073741824, %edx	#,
# sub.c:317:     sub_space_ptr = 0;
	movl	$0, sub_space_ptr(%rip)	#, sub_space_ptr
# sub.c:318:     borrow_space_ptr = 0;
	movl	$0, borrow_space_ptr(%rip)	#, borrow_space_ptr
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	call	memset@PLT	#
	xorl	%esi, %esi	#
	movq	%r15, %rdi	# _103,
	movl	$1073741824, %edx	#,
	call	memset@PLT	#
# sub.c:326:     limb_digits = _mm512_set1_epi64(LIMB_DIGITS);
	movq	LIMB_DIGITS(%rip), %rcx	# LIMB_DIGITS, LIMB_DIGITS.8_18
# sub.c:325:     ones = _mm512_set1_epi64(1);
	vpbroadcastq	.LC103(%rip), %zmm1	#, tmp184
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:4185:   return (__m512i)(__v8di) { __A, __A, __A, __A, __A, __A, __A, __A };
	vpbroadcastq	%rcx, %zmm2	# LIMB_DIGITS.8_18, tmp185
# sub.c:327:     minus_limb_digits = _mm512_set1_epi64(-LIMB_DIGITS);
	negq	%rcx	# _21
# sub.c:324:     zeros = _mm512_set1_epi64(0);
	vpxor	%xmm0, %xmm0, %xmm0	# tmp183
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:4185:   return (__m512i)(__v8di) { __A, __A, __A, __A, __A, __A, __A, __A };
	vpbroadcastq	%rcx, %zmm3	# _21, tmp186
# sub.c:330:     run_benchmarking_test(test_case, measure_type);
	movl	%r14d, %esi	# _69,
	movl	%r13d, %edi	# _65,
# sub.c:324:     zeros = _mm512_set1_epi64(0);
	vmovdqa64	%zmm0, zeros(%rip)	# tmp183, zeros
# sub.c:325:     ones = _mm512_set1_epi64(1);
	vmovdqa64	%zmm1, ones(%rip)	# tmp184, ones
# sub.c:326:     limb_digits = _mm512_set1_epi64(LIMB_DIGITS);
	vmovdqa64	%zmm2, limb_digits(%rip)	# tmp185, limb_digits
# sub.c:327:     minus_limb_digits = _mm512_set1_epi64(-LIMB_DIGITS);
	vmovdqa64	%zmm3, minus_limb_digits(%rip)	# tmp186, minus_limb_digits
# sub.c:330:     run_benchmarking_test(test_case, measure_type);
	vzeroupper
	call	run_benchmarking_test	#
# sub.c:334:     return 0;
	jmp	.L2405	#
.L2415:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	40(%rsp), %rdi	#, tmp189
	movl	$1073741824, %edx	#,
	movl	$64, %esi	#,
# sub.c:306:     sub_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	$0, sub_space(%rip)	#, sub_space
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	call	posix_memalign@PLT	#
	testl	%eax, %eax	# tmp207
	je	.L2425	#,
.L2416:
# sub.c:307:     borrow_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	$0, borrow_space(%rip)	#, borrow_space
.L2419:
# sub.c:312:         perror("Memory allocation failed for sub_space or borrow_space\n");
	leaq	.LC101(%rip), %rdi	#, tmp174
	call	perror@PLT	#
# sub.c:313:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L2424:
# sub.c:293:     assert(atoi(argv[1]) > 0);
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	#, tmp145
	movl	$293, %edx	#,
	leaq	.LC96(%rip), %rsi	#, tmp146
	leaq	.LC97(%rip), %rdi	#, tmp147
	call	__assert_fail@PLT	#
.L2423:
# sub.c:335: }
	call	__stack_chk_fail@PLT	#
.L2412:
# sub.c:299:     assert(atoi(argv[3]) >= 0 && atoi(argv[3]) < 4);
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	#, tmp157
	movl	$299, %edx	#,
	leaq	.LC96(%rip), %rsi	#, tmp158
	leaq	.LC99(%rip), %rdi	#, tmp159
	call	__assert_fail@PLT	#
.L2414:
# sub.c:302:     assert(atoi(argv[4]) >= 0 && atoi(argv[4]) < 3);
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	#, tmp163
	movl	$302, %edx	#,
	leaq	.LC96(%rip), %rsi	#, tmp164
	leaq	.LC100(%rip), %rdi	#, tmp165
	call	__assert_fail@PLT	#
.L2410:
# sub.c:296:     assert(atoi(argv[2]) >= 0 && atoi(argv[2]) < sysconf(_SC_NPROCESSORS_ONLN));
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	#, tmp150
	movl	$296, %edx	#,
	leaq	.LC96(%rip), %rsi	#, tmp151
	leaq	.LC98(%rip), %rdi	#, tmp152
	call	__assert_fail@PLT	#
.L2425:
# sub.c:307:     borrow_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	40(%rsp), %rax	# D.41396, D.41396
	movq	%rax, borrow_space(%rip)	# D.41396, borrow_space
	jmp	.L2419	#
	.cfi_endproc
.LFE5785:
	.size	main, .-main
	.section	.rodata.str1.1
.LC104:
	.string	"%f\n"
.LC105:
	.string	"Error writing to file\n"
	.text
	.p2align 4
	.globl	write_time
	.type	write_time, @function
write_time:
.LFB5808:
	.cfi_startproc
	endbr64	
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 16
# sub.c:1560:     if (gzprintf(file, "%f\n", time) < 0)
	leaq	.LC104(%rip), %rsi	#, tmp85
	movl	$1, %eax	#,
	call	gzprintf@PLT	#
# sub.c:1560:     if (gzprintf(file, "%f\n", time) < 0)
	testl	%eax, %eax	# tmp89
	js	.L2430	#,
# sub.c:1565: }
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L2430:
	.cfi_restore_state
# sub.c:1562:         perror("Error writing to file\n");
	leaq	.LC105(%rip), %rdi	#, tmp86
	call	perror@PLT	#
# sub.c:1563:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5808:
	.size	write_time, .-write_time
	.section	.rodata
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 5
__PRETTY_FUNCTION__.0:
	.string	"main"
	.globl	event_names
	.section	.rodata.str1.1
.LC106:
	.string	"PERF_COUNT_HW_CPU_CYCLES"
	.section	.rodata.str1.8
	.align 8
.LC107:
	.string	"PERF_COUNT_HW_USER_INSTRUCTIONS"
	.align 8
.LC108:
	.string	"PERF_COUNT_HW_KERNEL_INSTRUCTIONS"
	.section	.rodata.str1.1
.LC109:
	.string	"PERF_COUNT_SW_PAGE_FAULTS"
.LC110:
	.string	"PERF_COUNT_L1D_CACHE_READS"
	.section	.rodata.str1.8
	.align 8
.LC111:
	.string	"PERF_COUNT_L1D_CACHE_READ_MISSES"
	.section	.data.rel.local,"aw"
	.align 32
	.type	event_names, @object
	.size	event_names, 48
event_names:
	.quad	.LC106
	.quad	.LC107
	.quad	.LC108
	.quad	.LC109
	.quad	.LC110
	.quad	.LC111
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
	.quad	1000000000000000000
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
	.globl	ones
	.align 64
	.type	ones, @object
	.size	ones, 64
ones:
	.zero	64
	.globl	zeros
	.align 64
	.type	zeros, @object
	.size	zeros, 64
zeros:
	.zero	64
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
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC51:
	.long	0
	.long	1079574528
	.align 8
.LC63:
	.long	-1717986918
	.long	1071225241
	.align 8
.LC65:
	.long	-1598689907
	.long	1051772663
	.align 8
.LC67:
	.long	536870912
	.long	1107468383
	.align 8
.LC70:
	.long	0
	.long	1083129856
	.align 8
.LC71:
	.long	-1717986918
	.long	1069128089
	.align 8
.LC74:
	.long	0
	.long	1086556160
	.align 8
.LC103:
	.quad	1
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
