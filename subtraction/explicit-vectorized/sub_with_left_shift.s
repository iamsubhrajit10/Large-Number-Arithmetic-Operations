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
	movq	%rax, 56(%rsp)	# tmp116, D.40675
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
	movq	56(%rsp), %rdx	# D.40675, tmp117
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
	movq	%rax, 56(%rsp)	# tmp111, D.40705
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
	movq	48(%rsp), %rbx	# D.40697, _19
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
	movq	56(%rsp), %rdx	# D.40705, tmp112
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
	movq	%rax, 104(%rsp)	# tmp421, D.40807
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
	movq	96(%rsp), %rdi	# D.40763, _116
	movl	$64, %esi	#,
	movq	%rdi, 8(%rsp)	# _116, %sfp
	leaq	88(%rsp), %rdi	#, tmp197
	movq	%rdx, 64(%rsp)	# _6, %sfp
	call	posix_memalign@PLT	#
	testl	%eax, %eax	# tmp414
	jne	.L187	#,
# sub.c:457:     if (limbs1 == NULL || limbs2 == NULL)
	cmpq	$0, 8(%rsp)	#, %sfp
	movq	88(%rsp), %r14	# D.40757, _104
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
	movq	104(%rsp), %rax	# D.40807, tmp422
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
	movq	%rax, 8(%rsp)	# tmp111, D.40862
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
	movq	8(%rsp), %rax	# D.40862, tmp112
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
	movq	%rax, 65544(%rsp)	# tmp89, D.40960
	xorl	%eax, %eax	# tmp89
	movq	%rdi, %rbp	# tmp87, file
# sub.c:748:     if (gzgets(file, buffer, sizeof(buffer)) == NULL)
	call	gzgets@PLT	#
# sub.c:748:     if (gzgets(file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp88
	je	.L423	#,
# sub.c:754: }
	movq	65544(%rsp), %rax	# D.40960, tmp90
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
	movl	%edi, %ebx	# tmp675, test_case
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC28(%rip), %rdi	#, tmp243
# sub.c:837: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp702
	movq	%rax, 65912(%rsp)	# tmp702, D.41028
	xorl	%eax, %eax	# tmp702
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
	leaq	.LC31(%rip), %rsi	#, tmp261
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	256(%rsp), %r12	#, tmp410
	leaq	.LC32(%rip), %r8	#,
.L731:
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp410,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
# sub.c:736:     gzFile file = gzopen(filename, mode);
	leaq	.LC38(%rip), %rsi	#, tmp276
	movq	%r12, %rdi	# tmp410,
	call	gzopen@PLT	#
	movq	%rax, 88(%rsp)	# file, %sfp
# sub.c:737:     if (file == NULL)
	testq	%rax, %rax	# file
	je	.L732	#,
# sub.c:748:     if (gzgets(file, buffer, sizeof(buffer)) == NULL)
	leaq	368(%rsp), %rsi	#, tmp409
	movq	%rax, %rdi	# file,
	movl	$65536, %edx	#,
	movq	%rsi, 104(%rsp)	# tmp409, %sfp
	call	gzgets@PLT	#
# sub.c:748:     if (gzgets(file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp677
	je	.L733	#,
# sub.c:880:     for (int i = 0; i < ITERATIONS; i++)
	movl	$0, 68(%rsp)	#, %sfp
.L463:
# sub.c:885:         if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	movq	104(%rsp), %rsi	# %sfp,
	movq	88(%rsp), %rdi	# %sfp,
	movl	$65536, %edx	#,
	call	gzgets@PLT	#
# sub.c:885:         if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp678
	je	.L734	#,
# sub.c:900:         char *a_str = strtok(buffer, ",");
	movq	104(%rsp), %rdi	# %sfp,
	leaq	.LC40(%rip), %rsi	#,
	call	strtok@PLT	#
# sub.c:901:         char *b_str = strtok(NULL, ",");
	xorl	%edi, %edi	#
	leaq	.LC40(%rip), %rsi	#,
# sub.c:900:         char *a_str = strtok(buffer, ",");
	movq	%rax, %r14	# tmp680, a_str
# sub.c:901:         char *b_str = strtok(NULL, ",");
	call	strtok@PLT	#
# sub.c:902:         char *result_str = strtok(NULL, ",");
	xorl	%edi, %edi	#
	leaq	.LC40(%rip), %rsi	#,
# sub.c:901:         char *b_str = strtok(NULL, ",");
	movq	%rax, %r15	# tmp681, b_str
# sub.c:902:         char *result_str = strtok(NULL, ",");
	call	strtok@PLT	#
# sub.c:904:         if (a_str == NULL || b_str == NULL || result_str == NULL)
	testq	%r14, %r14	# a_str
# sub.c:902:         char *result_str = strtok(NULL, ",");
	movq	%rax, 96(%rsp)	# result_str, %sfp
	movq	%rax, %rdi	# tmp682, result_str
# sub.c:904:         if (a_str == NULL || b_str == NULL || result_str == NULL)
	sete	%al	#, tmp286
# sub.c:904:         if (a_str == NULL || b_str == NULL || result_str == NULL)
	testq	%r15, %r15	# b_str
	sete	%dl	#, tmp288
# sub.c:904:         if (a_str == NULL || b_str == NULL || result_str == NULL)
	orb	%dl, %al	# tmp288, tmp703
	jne	.L480	#,
	testq	%rdi, %rdi	# result_str
	je	.L480	#,
# sub.c:912:         int n_1 = strlen(a_str);
	movq	%r14, %rdi	# a_str,
	call	strlen@PLT	#
# sub.c:913:         int n_2 = strlen(b_str);
	movq	%r15, %rdi	# b_str,
# sub.c:912:         int n_1 = strlen(a_str);
	movl	%eax, 120(%rsp)	# tmp683, n_1
# sub.c:913:         int n_2 = strlen(b_str);
	call	strlen@PLT	#
# sub.c:917:         limb_set_str(a_str, b_str, &a, &b, &n_1, &n_2);
	leaq	192(%rsp), %rcx	#, tmp303
	leaq	128(%rsp), %rdx	#, tmp304
	leaq	124(%rsp), %r9	#,
	leaq	120(%rsp), %r8	#,
	movq	%r15, %rsi	# b_str,
	movq	%r14, %rdi	# a_str,
# sub.c:913:         int n_2 = strlen(b_str);
	movl	%eax, 124(%rsp)	# tmp684, n_2
# sub.c:917:         limb_set_str(a_str, b_str, &a, &b, &n_1, &n_2);
	call	limb_set_str	#
# sub.c:918:         int n = n_1;
	movslq	120(%rsp), %rbx	# n_1,
# sub.c:921:         aligned_uint64_ptr sub = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %rcx	# sub_space_ptr,
	movq	sub_space(%rip), %r9	# sub_space, sub_space
# sub.c:923:         sub_space_ptr += (n + 31) & ~31;
	leal	31(%rbx), %r10d	#, tmp308
# sub.c:923:         sub_space_ptr += (n + 31) & ~31;
	andl	$-32, %r10d	#, _32
# sub.c:921:         aligned_uint64_ptr sub = sub_space + sub_space_ptr;
	movq	%rcx, %r8	#,
	leaq	(%r9,%rcx,8), %r13	#, _29
# sub.c:923:         sub_space_ptr += (n + 31) & ~31;
	addl	%r10d, %r8d	# _32, tmp309
# sub.c:926:         memset(sub, 0, n * sizeof(uint64_t));
	leaq	0(,%rbx,8), %rdx	#, _40
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	xorl	%esi, %esi	#
	movq	%r13, %rdi	# _29,
# sub.c:923:         sub_space_ptr += (n + 31) & ~31;
	movl	%r8d, sub_space_ptr(%rip)	# tmp309, sub_space_ptr
# sub.c:924:         borrow_space_ptr += (n + 31) & ~31;
	addl	%r10d, borrow_space_ptr(%rip)	# _32, borrow_space_ptr
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movq	%rdx, 80(%rsp)	# _40, %sfp
# sub.c:922:         size_t sub_size = n;
	movq	%rbx, 248(%rsp)	# _30, sub_size
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	call	memset@PLT	#
	movq	80(%rsp), %rdx	# %sfp, _40
	movq	borrow_space(%rip), %rdi	# borrow_space,
	xorl	%esi, %esi	#
	call	memset@PLT	#
# sub.c:931:         bool sign = limb_sub_n(a, b, &sub, n);
	movq	192(%rsp), %r11	# b, b.39_46
	movq	128(%rsp), %rsi	# a, a.40_47
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %rdi	# sub_space_ptr, sub_space_ptr
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %rax	# sub_space, sub_space
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r11), %rdx	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp782
	leaq	-1(%rbx), %r8	#, tmp442
# sub.c:931:         bool sign = limb_sub_n(a, b, &sub, n);
	movq	%r11, 80(%rsp)	# b.39_46, %sfp
	movq	%rsi, 72(%rsp)	# a.40_47, %sfp
# sub.c:918:         int n = n_1;
	movq	%rbx, %r12	#,
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%rax,%rdi,8), %rdi	#, sub
	andl	$7, %r8d	#, tmp444
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%rdx, (%rsi)	# tmp782, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	jbe	.L735	#,
.L474:
	movq	80(%rsp), %r13	# %sfp, b
	movq	72(%rsp), %rsi	# %sfp, a
	xorl	%r10d, %r10d	# prephitmp_402
.L439:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rsi), %zmm6	# MEM[(__m512i * {ref-all})a_177 + i_175 * 8], tmp785
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %rax	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	0(%r13), %zmm6, %zmm0	# MEM[(__m512i * {ref-all})b_180 + i_175 * 8], tmp785, tmp326
	leaq	-1(%rbx), %r8	#, tmp438
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k1	#, zeros, tmp326, tmp328
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm0, %zmm1	# tmp326, tmp326
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %rax	# borrow_space, bm
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm0, %zmm1{%k1}	# limb_digits, tmp326, tmp326, tmp328, tmp326
	shrq	$3, %r8	#, tmp436
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rdi)	# tmp332, MEM[(__m512i * {ref-all})result_154 + i_175 * 8]
	andl	$3, %r8d	#, tmp439
# sub.c:217:         i += 8;
	movl	$8, %r11d	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%rax), %rcx	#, ivtmp.448
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, (%rax)	# tmp328, MEM[(__mmask8 *)_362]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %rbx	#, _30
	jbe	.L675	#,
	testq	%r8, %r8	# tmp439
	je	.L442	#,
	cmpq	$1, %r8	#, tmp439
	je	.L624	#,
	cmpq	$2, %r8	#, tmp439
	jne	.L736	#,
.L625:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rsi,%r11,8), %zmm4	# MEM[(__m512i * {ref-all})a_177 + i_175 * 8], tmp849
# sub.c:219:     } while (likely(i < n));
	incq	%rcx	# ivtmp.448
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	0(%r13,%r11,8), %zmm4, %zmm5	# MEM[(__m512i * {ref-all})b_180 + i_175 * 8], tmp849, tmp632
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k3	#, zeros, tmp632, tmp634
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm5, %zmm8	# tmp632, tmp632
	vpaddq	limb_digits(%rip), %zmm5, %zmm8{%k3}	# limb_digits, tmp632, tmp632, tmp634, tmp632
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rdi,%r11,8)	# tmp636, MEM[(__m512i * {ref-all})result_154 + i_175 * 8]
# sub.c:217:         i += 8;
	addq	$8, %r11	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, -1(%rcx)	# tmp634, MEM[(__mmask8 *)_362]
.L624:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rsi,%r11,8), %zmm9	# MEM[(__m512i * {ref-all})a_177 + i_175 * 8], tmp851
# sub.c:219:     } while (likely(i < n));
	incq	%rcx	# ivtmp.448
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	0(%r13,%r11,8), %zmm9, %zmm10	# MEM[(__m512i * {ref-all})b_180 + i_175 * 8], tmp851, tmp638
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k4	#, zeros, tmp638, tmp640
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm10, %zmm11	# tmp638, tmp638
	vpaddq	limb_digits(%rip), %zmm10, %zmm11{%k4}	# limb_digits, tmp638, tmp638, tmp640, tmp638
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rdi,%r11,8)	# tmp642, MEM[(__m512i * {ref-all})result_154 + i_175 * 8]
# sub.c:217:         i += 8;
	addq	$8, %r11	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, -1(%rcx)	# tmp640, MEM[(__mmask8 *)_362]
# sub.c:219:     } while (likely(i < n));
	cmpq	%r11, %rbx	# i, _30
	jbe	.L675	#,
.L442:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rsi,%r11,8), %zmm12	# MEM[(__m512i * {ref-all})a_177 + i_175 * 8], tmp787
# sub.c:217:         i += 8;
	leaq	8(%r11), %r9	#, tmp440
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	0(%r13,%r11,8), %zmm12, %zmm13	# MEM[(__m512i * {ref-all})b_180 + i_175 * 8], tmp787, tmp455
# sub.c:217:         i += 8;
	leaq	16(%r11), %rdx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k5	#, zeros, tmp455, tmp457
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm13, %zmm14	# tmp455, tmp455
# sub.c:217:         i += 8;
	leaq	24(%r11), %r8	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm13, %zmm14{%k5}	# limb_digits, tmp455, tmp455, tmp457, tmp455
# sub.c:219:     } while (likely(i < n));
	addq	$4, %rcx	#, ivtmp.448
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rdi,%r11,8)	# tmp459, MEM[(__m512i * {ref-all})result_154 + i_175 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, -4(%rcx)	# tmp457, MEM[(__mmask8 *)_362]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rsi,%r9,8), %zmm15	# MEM[(__m512i * {ref-all})a_177 + i_175 * 8], tmp789
# sub.c:217:         i += 8;
	addq	$32, %r11	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	0(%r13,%r9,8), %zmm15, %zmm6	# MEM[(__m512i * {ref-all})b_180 + i_175 * 8], tmp789, tmp463
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k6	#, zeros, tmp463, tmp465
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm6, %zmm0	# tmp463, tmp463
	vpaddq	limb_digits(%rip), %zmm6, %zmm0{%k6}	# limb_digits, tmp463, tmp463, tmp465, tmp463
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rdi,%r9,8)	# tmp467, MEM[(__m512i * {ref-all})result_154 + i_175 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, -3(%rcx)	# tmp465, MEM[(__mmask8 *)_362]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rsi,%rdx,8), %zmm1	# MEM[(__m512i * {ref-all})a_177 + i_175 * 8], tmp791
	vpsubq	0(%r13,%rdx,8), %zmm1, %zmm7	# MEM[(__m512i * {ref-all})b_180 + i_175 * 8], tmp791, tmp471
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm7, %k7	#, zeros, tmp471, tmp473
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm7, %zmm2	# tmp471, tmp471
	vpaddq	limb_digits(%rip), %zmm7, %zmm2{%k7}	# limb_digits, tmp471, tmp471, tmp473, tmp471
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, (%rdi,%rdx,8)	# tmp475, MEM[(__m512i * {ref-all})result_154 + i_175 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, -2(%rcx)	# tmp473, MEM[(__mmask8 *)_362]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rsi,%r8,8), %zmm3	# MEM[(__m512i * {ref-all})a_177 + i_175 * 8], tmp793
	vpsubq	0(%r13,%r8,8), %zmm3, %zmm4	# MEM[(__m512i * {ref-all})b_180 + i_175 * 8], tmp793, tmp479
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm4, %k1	#, zeros, tmp479, tmp481
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm4, %zmm5	# tmp479, tmp479
	vpaddq	limb_digits(%rip), %zmm4, %zmm5{%k1}	# limb_digits, tmp479, tmp479, tmp481, tmp479
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, (%rdi,%r8,8)	# tmp483, MEM[(__m512i * {ref-all})result_154 + i_175 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, -1(%rcx)	# tmp481, MEM[(__mmask8 *)_362]
# sub.c:219:     } while (likely(i < n));
	cmpq	%r11, %rbx	# i, _30
	ja	.L442	#,
.L675:
# sub.c:218:         j++;
	leaq	-1(%rbx), %r13	#, tmp339
	shrq	$3, %r13	#, tmp340
	xorl	%r11d, %r11d	# j
	testl	%r12d, %r12d	# n
	setne	%r11b	#, j
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	imull	%r13d, %r11d	# tmp340, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm8	# zeros, tmp795
	movslq	%r11d, %rsi	# i, ivtmp.434
	vmovdqu64	%zmm8, (%rdi,%rbx,8)	# tmp795, MEM[(__m512i_u * {ref-all})_204]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%r11d, %r11d	# i
	js	.L446	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rax,%rsi), %r9d	# MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1],
	movl	%esi, %r12d	# ivtmp.434, tmp434
	movl	%r9d, %ecx	#,
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movl	%esi, %r8d	# ivtmp.434, tmp704
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	addl	%r9d, %r9d	# tmp344
	andl	$7, %r12d	#, tmp434
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %cl	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decl	%r8d	# tmp704
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r9b, (%rax,%rsi)	# tmp344, MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-1(%rsi), %r11	#, ivtmp.434
	js	.L446	#,
	testl	%r12d, %r12d	# tmp434
	je	.L445	#,
	cmpl	$1, %r12d	#, tmp434
	je	.L618	#,
	cmpl	$2, %r12d	#, tmp434
	je	.L619	#,
	cmpl	$3, %r12d	#, tmp434
	je	.L620	#,
	cmpl	$4, %r12d	#, tmp434
	je	.L621	#,
	cmpl	$5, %r12d	#, tmp434
	je	.L622	#,
	cmpl	$6, %r12d	#, tmp434
	jne	.L737	#,
.L623:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rax,%r11), %r12d	# MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r12,%r12), %esi	#, tmp603
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%esi, %ecx	# tmp603, tmp604
	movb	%cl, (%rax,%r11)	# tmp604, MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r12d, %ecx	# temp, temp
	shrb	$7, %cl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%r11	# ivtmp.434
.L622:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rax,%r11), %r9d	# MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %r8d	#, tmp607
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %ecx	# tmp607, tmp608
	movb	%cl, (%rax,%r11)	# tmp608, MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %ecx	# temp, temp
	shrb	$7, %cl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%r11	# ivtmp.434
.L621:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rax,%r11), %r13d	# MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r13,%r13), %edx	#, tmp611
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edx, %ecx	# tmp611, tmp612
	movb	%cl, (%rax,%r11)	# tmp612, MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r13d, %ecx	# temp, temp
	shrb	$7, %cl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%r11	# ivtmp.434
.L620:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rax,%r11), %r12d	# MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r12,%r12), %esi	#, tmp615
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%esi, %ecx	# tmp615, tmp616
	movb	%cl, (%rax,%r11)	# tmp616, MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r12d, %ecx	# temp, temp
	shrb	$7, %cl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%r11	# ivtmp.434
.L619:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rax,%r11), %r9d	# MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %r8d	#, tmp619
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %ecx	# tmp619, tmp620
	movb	%cl, (%rax,%r11)	# tmp620, MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %ecx	# temp, temp
	shrb	$7, %cl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%r11	# ivtmp.434
.L618:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rax,%r11), %r13d	# MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r13,%r13), %edx	#, tmp623
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edx, %ecx	# tmp623, tmp624
	movb	%cl, (%rax,%r11)	# tmp624, MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r13d, %ecx	# temp, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%r11	# ivtmp.434
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %cl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%r11d, %r11d	# ivtmp.434
	js	.L446	#,
.L445:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rax,%r11), %r12d	# MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r12,%r12), %esi	#, tmp489
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%esi, %ecx	# tmp489, tmp490
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-1(%rax,%r11), %esi	# MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%cl, (%rax,%r11)	# tmp490, MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1]
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp495
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, temp
	movl	%esi, %edx	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-2(%rax,%r11), %esi	# MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r12b	#, carry
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r8d	#, tmp501
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %edx	# tmp501, tmp502
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%dl, -2(%rax,%r11)	# tmp502, MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edx	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-3(%rax,%r11), %esi	# MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %r12d	# tmp495, tmp496
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r13d	#, tmp507
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r13d, %edx	# tmp507, tmp508
	movb	%dl, -3(%rax,%r11)	# tmp508, MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edx	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-4(%rax,%r11), %esi	# MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dl	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %ecx	#, tmp513
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%ecx, %edx	# tmp513, tmp514
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%dl, -4(%rax,%r11)	# tmp514, MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edx	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-5(%rax,%r11), %esi	# MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r12b, -1(%rax,%r11)	# tmp496, MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1]
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r12d	#, tmp519
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r12d, %edx	# tmp519, tmp520
	movb	%dl, -5(%rax,%r11)	# tmp520, MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edx	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-6(%rax,%r11), %esi	# MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1], temp
	movzbl	-7(%rax,%r11), %ecx	# MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp525
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dl	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %edx	# tmp525, tmp526
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%dl, -6(%rax,%r11)	# tmp526, MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1]
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rcx,%rcx), %r8d	#, tmp531
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edx	# temp, carry
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %edx	# tmp531, tmp532
	movb	%dl, -7(%rax,%r11)	# tmp532, MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	subq	$8, %r11	#, ivtmp.434
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %cl	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%r11d, %r11d	# ivtmp.434
	jns	.L445	#,
.L446:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdi), %zmm9	# MEM[(__m512i * {ref-all})result_154 + i_385 * 8], _381
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rax), %r13d	# MEM[(__mmask8 *)_227], MEM[(__mmask8 *)_227]
	leaq	-1(%rbx), %r11	#, tmp429
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r13d, %k2	# MEM[(__mmask8 *)_227], tmp798
	vpsubq	ones(%rip), %zmm9, %zmm9{%k2}	# ones, _381, tmp346, tmp798, _381
	shrq	$3, %r11	#, tmp427
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rdi)	# tmp346, MEM[(__m512i * {ref-all})result_154 + i_385 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k0	#, zeros, tmp346, tmp352
	andl	$3, %r11d	#, tmp430
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp352
	jne	.L738	#,
.L535:
# sub.c:249:         i += 8;
	movl	$8, %r12d	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rax), %rcx	#, ivtmp.431
	cmpq	$8, %rbx	#, _30
	jbe	.L728	#,
	testq	%r11, %r11	# tmp430
	je	.L444	#,
	cmpq	$1, %r11	#, tmp430
	je	.L616	#,
	cmpq	$2, %r11	#, tmp430
	jne	.L739	#,
.L617:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdi,%r12,8), %zmm11	# MEM[(__m512i * {ref-all})result_154 + i_385 * 8], _381
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %eax	# MEM[(__mmask8 *)_227], MEM[(__mmask8 *)_227]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%eax, %k5	# MEM[(__mmask8 *)_227], tmp836
	vpsubq	ones(%rip), %zmm11, %zmm11{%k5}	# ones, _381, tmp572, tmp836, _381
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rdi,%r12,8)	# tmp572, MEM[(__m512i * {ref-all})result_154 + i_385 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm11, %k6	#, zeros, tmp572, tmp574
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k6, %k6	# tmp574
	jne	.L740	#,
.L540:
# sub.c:249:         i += 8;
	addq	$8, %r12	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.431
.L616:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdi,%r12,8), %zmm12	# MEM[(__m512i * {ref-all})result_154 + i_385 * 8], _381
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %r9d	# MEM[(__mmask8 *)_227], MEM[(__mmask8 *)_227]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k7	# MEM[(__mmask8 *)_227], tmp837
	vpsubq	ones(%rip), %zmm12, %zmm12{%k7}	# ones, _381, tmp578, tmp837, _381
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm12, (%rdi,%r12,8)	# tmp578, MEM[(__m512i * {ref-all})result_154 + i_385 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k1	#, zeros, tmp578, tmp580
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k1, %k1	# tmp580
	jne	.L741	#,
.L543:
# sub.c:249:         i += 8;
	addq	$8, %r12	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.431
	cmpq	%r12, %rbx	# i, _30
	ja	.L444	#,
	.p2align 4,,10
	.p2align 3
.L728:
	vzeroupper
.L440:
# sub.c:936:         char *sub_str = limb_get_str(sub, &sub_size, sign);
	movl	%r10d, %edx	# prephitmp_402,
	leaq	248(%rsp), %rsi	#, tmp356
	call	limb_get_str	#
# sub.c:665:     bool result_gmp_negative = (result_gmp[0] == '-');
	movq	96(%rsp), %rbx	# %sfp, result_str
# sub.c:664:     bool result_negative = (result[0] == '-');
	movzbl	(%rax), %r10d	# *sub_str_91, _124
# sub.c:665:     bool result_gmp_negative = (result_gmp[0] == '-');
	movzbl	(%rbx), %edi	# *result_str_82, _126
# sub.c:669:         result++;
	xorl	%r9d, %r9d	# tmp412
	cmpb	$45, %r10b	#, _124
	sete	%r9b	#, tmp412
# sub.c:671:         result_gmp++;
	xorl	%edx, %edx	# tmp416
	cmpb	$45, %dil	#, _126
	sete	%dl	#, tmp416
# sub.c:664:     bool result_negative = (result[0] == '-');
	movb	%r10b, 63(%rsp)	# _124, %sfp
# sub.c:665:     bool result_gmp_negative = (result_gmp[0] == '-');
	movb	%dil, 62(%rsp)	# _126, %sfp
# sub.c:936:         char *sub_str = limb_get_str(sub, &sub_size, sign);
	movq	%rax, %r12	# tmp685, sub_str
# sub.c:669:         result++;
	leaq	(%rax,%r9), %r13	#, result
# sub.c:671:         result_gmp++;
	addq	%rdx, %rbx	# tmp416, result_gmp
# sub.c:642:     while (*str == '0' || isspace(*str))
	call	__ctype_b_loc@PLT	#
	movq	(%rax), %r10	# *_435, pretmp_437
	jmp	.L450	#
	.p2align 4,,10
	.p2align 3
.L451:
# sub.c:644:         str++;
	incq	%r13	# result
.L450:
# sub.c:642:     while (*str == '0' || isspace(*str))
	movsbq	0(%r13), %r8	# MEM[(char *)str_318],
# sub.c:642:     while (*str == '0' || isspace(*str))
	cmpb	$48, %r8b	#, _320
	je	.L451	#,
	testb	$32, 1(%r10,%r8,2)	#, *_325
	jne	.L451	#,
# sub.c:642:     while (*str == '0' || isspace(*str))
	movsbq	(%rbx), %r11	# MEM[(char *)str_307],
# sub.c:642:     while (*str == '0' || isspace(*str))
	cmpb	$48, %r11b	#, _309
	jne	.L742	#,
	.p2align 4,,10
	.p2align 3
.L453:
# sub.c:642:     while (*str == '0' || isspace(*str))
	movsbq	1(%rbx), %r11	# MEM[(char *)str_307],
# sub.c:644:         str++;
	incq	%rbx	# result_gmp
# sub.c:642:     while (*str == '0' || isspace(*str))
	cmpb	$48, %r11b	#, _309
	je	.L453	#,
.L742:
	testb	$32, 1(%r10,%r11,2)	#, *_314
	jne	.L453	#,
# sub.c:652:     size_t len = strlen(str);
	movq	%r13, %rdi	# result,
	call	strlen@PLT	#
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	testq	%rax, %rax	# tmp364
	je	.L454	#,
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	leaq	-1(%r13,%rax), %rax	#, _305
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	cmpb	$10, (%rax)	#, *_305
	jne	.L454	#,
# sub.c:655:         str[len - 1] = '\0';
	movb	$0, (%rax)	#, *_305
	.p2align 4,,10
	.p2align 3
.L454:
# sub.c:652:     size_t len = strlen(str);
	movq	%rbx, %rdi	# result_gmp,
	call	strlen@PLT	#
	movq	%rax, %rcx	# tmp688, len
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	testq	%rax, %rax	# len
	je	.L455	#,
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	leaq	-1(%rbx,%rax), %rsi	#, _301
# sub.c:653:     if (len > 0 && str[len - 1] == '\n')
	cmpb	$10, (%rsi)	#, *_301
	jne	.L456	#,
# sub.c:655:         str[len - 1] = '\0';
	movb	$0, (%rsi)	#, *_301
# sub.c:682:     if (strlen(result) != strlen(result_gmp))
	movq	%rbx, %rdi	# result_gmp,
	call	strlen@PLT	#
	movq	%rax, %rcx	# tmp689, len
.L456:
# sub.c:682:     if (strlen(result) != strlen(result_gmp))
	movq	%r13, %rdi	# result,
	movq	%rcx, 48(%rsp)	# len, %sfp
	call	strlen@PLT	#
# sub.c:682:     if (strlen(result) != strlen(result_gmp))
	movq	48(%rsp), %r10	# %sfp, len
	cmpq	%r10, %rax	# len, tmp375
	jne	.L457	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	testq	%r10, %r10	# len
	je	.L459	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	xorl	%edx, %edx	# i
	andl	$7, %r10d	#, tmp425
	je	.L458	#,
	cmpq	$1, %r10	#, tmp425
	je	.L609	#,
	cmpq	$2, %r10	#, tmp425
	je	.L610	#,
	cmpq	$3, %r10	#, tmp425
	je	.L611	#,
	cmpq	$4, %r10	#, tmp425
	je	.L612	#,
	cmpq	$5, %r10	#, tmp425
	je	.L613	#,
	cmpq	$6, %r10	#, tmp425
	je	.L614	#,
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx), %edi	# MEM[(char *)str_307 + i_311 * 1], tmp822
	movq	%r13, %rcx	# result, _220
	movq	%rbx, %r8	# result_gmp, _222
	cmpb	%dil, 0(%r13)	# tmp822, MEM[(char *)str_318 + i_311 * 1]
	jne	.L679	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	movl	$1, %edx	#, i
.L614:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx,%rdx), %r9d	# MEM[(char *)str_307 + i_311 * 1], tmp823
	leaq	0(%r13,%rdx), %rcx	#, _220
	leaq	(%rbx,%rdx), %r8	#, _222
	cmpb	%r9b, 0(%r13,%rdx)	# tmp823, MEM[(char *)str_318 + i_311 * 1]
	jne	.L679	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%rdx	# i
.L613:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx,%rdx), %r11d	# MEM[(char *)str_307 + i_311 * 1], tmp824
	leaq	0(%r13,%rdx), %rcx	#, _220
	leaq	(%rbx,%rdx), %r8	#, _222
	cmpb	%r11b, 0(%r13,%rdx)	# tmp824, MEM[(char *)str_318 + i_311 * 1]
	jne	.L679	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%rdx	# i
.L612:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx,%rdx), %esi	# MEM[(char *)str_307 + i_311 * 1], tmp825
	leaq	0(%r13,%rdx), %rcx	#, _220
	leaq	(%rbx,%rdx), %r8	#, _222
	cmpb	%sil, 0(%r13,%rdx)	# tmp825, MEM[(char *)str_318 + i_311 * 1]
	jne	.L679	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%rdx	# i
.L611:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx,%rdx), %r10d	# MEM[(char *)str_307 + i_311 * 1], tmp826
	leaq	0(%r13,%rdx), %rcx	#, _220
	leaq	(%rbx,%rdx), %r8	#, _222
	cmpb	%r10b, 0(%r13,%rdx)	# tmp826, MEM[(char *)str_318 + i_311 * 1]
	jne	.L679	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%rdx	# i
.L610:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx,%rdx), %edi	# MEM[(char *)str_307 + i_311 * 1], tmp827
	leaq	0(%r13,%rdx), %rcx	#, _220
	leaq	(%rbx,%rdx), %r8	#, _222
	cmpb	%dil, 0(%r13,%rdx)	# tmp827, MEM[(char *)str_318 + i_311 * 1]
	jne	.L679	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%rdx	# i
.L609:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx,%rdx), %r9d	# MEM[(char *)str_307 + i_311 * 1], tmp828
	leaq	0(%r13,%rdx), %rcx	#, _220
	leaq	(%rbx,%rdx), %r8	#, _222
	cmpb	%r9b, 0(%r13,%rdx)	# tmp828, MEM[(char *)str_318 + i_311 * 1]
	jne	.L679	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%rdx	# i
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	cmpq	%rdx, %rax	# i, tmp375
	je	.L459	#,
.L458:
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx,%rdx), %r11d	# MEM[(char *)str_307 + i_311 * 1], tmp813
	leaq	0(%r13,%rdx), %rcx	#, _220
	leaq	(%rbx,%rdx), %r8	#, _222
	cmpb	%r11b, 0(%r13,%rdx)	# tmp813, MEM[(char *)str_318 + i_311 * 1]
	jne	.L679	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	1(%rdx), %rsi	#, tmp426
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx,%rsi), %r10d	# MEM[(char *)str_307 + i_311 * 1], tmp814
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	movq	%rsi, %rdx	# tmp426, i
	leaq	0(%r13,%rsi), %rcx	#, _220
	leaq	(%rbx,%rsi), %r8	#, _222
# sub.c:691:         if (result[i] != result_gmp[i])
	cmpb	%r10b, 0(%r13,%rsi)	# tmp814, MEM[(char *)str_318 + i_311 * 1]
	jne	.L679	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	incq	%rdx	# i
# sub.c:691:         if (result[i] != result_gmp[i])
	movzbl	(%rbx,%rdx), %edi	# MEM[(char *)str_307 + i_311 * 1], tmp829
	leaq	0(%r13,%rdx), %rcx	#, _220
	leaq	(%rbx,%rdx), %r8	#, _222
	cmpb	%dil, 0(%r13,%rdx)	# tmp829, MEM[(char *)str_318 + i_311 * 1]
	jne	.L679	#,
	movzbl	2(%rbx,%rsi), %r9d	# MEM[(char *)str_307 + i_311 * 1], tmp830
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	2(%rsi), %rdx	#, i
	leaq	0(%r13,%rdx), %rcx	#, _220
	leaq	(%rbx,%rdx), %r8	#, _222
# sub.c:691:         if (result[i] != result_gmp[i])
	cmpb	%r9b, 2(%r13,%rsi)	# tmp830, MEM[(char *)str_318 + i_311 * 1]
	jne	.L679	#,
	movzbl	3(%rbx,%rsi), %r11d	# MEM[(char *)str_307 + i_311 * 1], tmp831
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	3(%rsi), %rdx	#, i
	leaq	0(%r13,%rdx), %rcx	#, _220
	leaq	(%rbx,%rdx), %r8	#, _222
# sub.c:691:         if (result[i] != result_gmp[i])
	cmpb	%r11b, 3(%r13,%rsi)	# tmp831, MEM[(char *)str_318 + i_311 * 1]
	jne	.L679	#,
	movzbl	4(%rbx,%rsi), %r10d	# MEM[(char *)str_307 + i_311 * 1], tmp832
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	4(%rsi), %rdx	#, i
	leaq	0(%r13,%rdx), %rcx	#, _220
	leaq	(%rbx,%rdx), %r8	#, _222
# sub.c:691:         if (result[i] != result_gmp[i])
	cmpb	%r10b, 4(%r13,%rsi)	# tmp832, MEM[(char *)str_318 + i_311 * 1]
	jne	.L679	#,
	movzbl	5(%rbx,%rsi), %edi	# MEM[(char *)str_307 + i_311 * 1], tmp833
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	5(%rsi), %rdx	#, i
	leaq	0(%r13,%rdx), %rcx	#, _220
	leaq	(%rbx,%rdx), %r8	#, _222
# sub.c:691:         if (result[i] != result_gmp[i])
	cmpb	%dil, 5(%r13,%rsi)	# tmp833, MEM[(char *)str_318 + i_311 * 1]
	jne	.L679	#,
	movzbl	6(%rbx,%rsi), %r9d	# MEM[(char *)str_307 + i_311 * 1], tmp834
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	6(%rsi), %rdx	#, i
	leaq	0(%r13,%rdx), %rcx	#, _220
	leaq	(%rbx,%rdx), %r8	#, _222
# sub.c:691:         if (result[i] != result_gmp[i])
	cmpb	%r9b, 6(%r13,%rsi)	# tmp834, MEM[(char *)str_318 + i_311 * 1]
	jne	.L679	#,
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	leaq	7(%rsi), %rdx	#, i
# sub.c:689:     for (size_t i = 0; i < strlen(result); i++)
	cmpq	%rdx, %rax	# i, tmp375
	jne	.L458	#,
.L459:
# sub.c:664:     bool result_negative = (result[0] == '-');
	cmpb	$45, 63(%rsp)	#, %sfp
	sete	%bl	#, result_negative
# sub.c:665:     bool result_gmp_negative = (result_gmp[0] == '-');
	cmpb	$45, 62(%rsp)	#, %sfp
	sete	%r13b	#, result_gmp_negative
# sub.c:702:     if (result_negative != result_gmp_negative)
	cmpb	%r13b, %bl	# result_gmp_negative, result_negative
	jne	.L743	#,
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
	jne	.L463	#,
.L464:
# sub.c:952:     switch (test_case)
	movl	64(%rsp), %r11d	# %sfp, test_case
# sub.c:955:         printf("Passed random test cases for bit-size %d\n", NUM_BITS);
	movl	NUM_BITS(%rip), %edx	# NUM_BITS, pretmp_439
# sub.c:952:     switch (test_case)
	cmpl	$2, %r11d	#, test_case
	je	.L465	#,
	cmpl	$3, %r11d	#, test_case
	je	.L466	#,
	cmpl	$1, %r11d	#, test_case
	je	.L467	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC45(%rip), %rsi	#, tmp393
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
.L468:
# sub.c:967:     if (sub_space_ptr > (1 << 30) || borrow_space_ptr > (1 << 30))
	movl	sub_space_ptr(%rip), %edi	# sub_space_ptr, sub_space_ptr.49_56
# sub.c:967:     if (sub_space_ptr > (1 << 30) || borrow_space_ptr > (1 << 30))
	cmpl	$1073741824, %edi	#, sub_space_ptr.49_56
	jg	.L469	#,
# sub.c:967:     if (sub_space_ptr > (1 << 30) || borrow_space_ptr > (1 << 30))
	movl	borrow_space_ptr(%rip), %ecx	# borrow_space_ptr, borrow_space_ptr.50_57
# sub.c:967:     if (sub_space_ptr > (1 << 30) || borrow_space_ptr > (1 << 30))
	cmpl	$1073741824, %ecx	#, borrow_space_ptr.50_57
	jg	.L469	#,
# sub.c:972:     if (sub_space_ptr && borrow_space_ptr)
	testl	%edi, %edi	# sub_space_ptr.49_56
	je	.L471	#,
	testl	%ecx, %ecx	# borrow_space_ptr.50_57
	jne	.L744	#,
.L471:
# sub.c:978:     if (gzclose(test_file) != Z_OK)
	movq	88(%rsp), %rdi	# %sfp,
	call	gzclose@PLT	#
# sub.c:978:     if (gzclose(test_file) != Z_OK)
	testl	%eax, %eax	# tmp691
	jne	.L745	#,
# sub.c:983: }
	movq	65912(%rsp), %rax	# D.41028, tmp705
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp705
	jne	.L746	#,
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
.L750:
	.cfi_restore_state
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rcx)	# tmp540, MEM[(__mmask8 *)_227]
	.p2align 4,,10
	.p2align 3
.L447:
# sub.c:249:         i += 8;
	addq	$8, %r12	#, tmp431
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdi,%r12,8), %zmm14	# MEM[(__m512i * {ref-all})result_154 + i_385 * 8], _381
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rcx), %r11d	# MEM[(__mmask8 *)_227], MEM[(__mmask8 *)_227]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rcx), %r8	#, tmp432
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r11d, %k3	# MEM[(__mmask8 *)_227], tmp806
	vpsubq	ones(%rip), %zmm14, %zmm14{%k3}	# ones, _381, tmp546, tmp806, _381
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rdi,%r12,8)	# tmp546, MEM[(__m512i * {ref-all})result_154 + i_385 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k4	#, zeros, tmp546, tmp548
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k4, %k4	# tmp548
	jne	.L747	#,
.L546:
# sub.c:249:         i += 8;
	leaq	8(%r12), %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdi,%rcx,8), %zmm15	# MEM[(__m512i * {ref-all})result_154 + i_385 * 8], _381
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%r8), %r13d	# MEM[(__mmask8 *)_227], MEM[(__mmask8 *)_227]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r13d, %k5	# MEM[(__mmask8 *)_227], tmp838
	vpsubq	ones(%rip), %zmm15, %zmm15{%k5}	# ones, _381, tmp586, tmp838, _381
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, (%rdi,%rcx,8)	# tmp586, MEM[(__m512i * {ref-all})result_154 + i_385 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k6	#, zeros, tmp586, tmp588
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k6, %k6	# tmp588
	jne	.L748	#,
.L548:
# sub.c:249:         i += 8;
	leaq	16(%r12), %rax	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdi,%rax,8), %zmm6	# MEM[(__m512i * {ref-all})result_154 + i_385 * 8], _381
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%r8), %esi	# MEM[(__mmask8 *)_227], MEM[(__mmask8 *)_227]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k7	# MEM[(__mmask8 *)_227], tmp839
	vpsubq	ones(%rip), %zmm6, %zmm6{%k7}	# ones, _381, tmp594, tmp839, _381
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rdi,%rax,8)	# tmp594, MEM[(__m512i * {ref-all})result_154 + i_385 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k1	#, zeros, tmp594, tmp596
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k1, %k1	# tmp596
	jne	.L749	#,
.L550:
# sub.c:249:         i += 8;
	addq	$24, %r12	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%r8), %rcx	#, ivtmp.431
	cmpq	%r12, %rbx	# i, _30
	jbe	.L728	#,
.L444:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdi,%r12,8), %zmm13	# MEM[(__m512i * {ref-all})result_154 + i_385 * 8], _381
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rcx), %edx	# MEM[(__mmask8 *)_227], MEM[(__mmask8 *)_227]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edx, %k2	# MEM[(__mmask8 *)_227], tmp805
	vpsubq	ones(%rip), %zmm13, %zmm13{%k2}	# ones, _381, tmp538, tmp805, _381
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rdi,%r12,8)	# tmp538, MEM[(__m512i * {ref-all})result_154 + i_385 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k0	#, zeros, tmp538, tmp540
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp540
	je	.L447	#,
	jmp	.L750	#
	.p2align 4,,10
	.p2align 3
.L427:
# sub.c:850:     switch (test_case)
	cmpl	$3, 64(%rsp)	#, %sfp
	jne	.L430	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC35(%rip), %rsi	#, tmp271
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	256(%rsp), %r12	#, tmp410
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC36(%rip), %r8	#,
	jmp	.L731	#
	.p2align 4,,10
	.p2align 3
.L736:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%rsi), %zmm7	# MEM[(__m512i * {ref-all})a_177 + i_175 * 8], tmp847
# sub.c:217:         i += 8;
	movl	$16, %r11d	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%r13), %zmm7, %zmm2	# MEM[(__m512i * {ref-all})b_180 + i_175 * 8], tmp847, tmp626
# sub.c:219:     } while (likely(i < n));
	leaq	2(%rax), %rcx	#, ivtmp.448
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k2	#, zeros, tmp626, tmp628
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm2, %zmm3	# tmp626, tmp626
	vpaddq	limb_digits(%rip), %zmm2, %zmm3{%k2}	# limb_digits, tmp626, tmp626, tmp628, tmp626
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, 64(%rdi)	# tmp630, MEM[(__m512i * {ref-all})result_154 + i_175 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, 1(%rax)	# tmp628, MEM[(__mmask8 *)_362]
	jmp	.L625	#
	.p2align 4,,10
	.p2align 3
.L739:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	64(%rdi), %zmm10	# MEM[(__m512i * {ref-all})result_154 + i_385 * 8], _381
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rax), %esi	# MEM[(__mmask8 *)_227], MEM[(__mmask8 *)_227]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k3	# MEM[(__mmask8 *)_227], tmp835
	vpsubq	ones(%rip), %zmm10, %zmm10{%k3}	# ones, _381, tmp566, tmp835, _381
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, 64(%rdi)	# tmp566, MEM[(__m512i * {ref-all})result_154 + i_385 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k4	#, zeros, tmp566, tmp568
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k4, %k4	# tmp568
	jne	.L751	#,
.L537:
# sub.c:249:         i += 8;
	addq	$8, %r12	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rcx	# ivtmp.431
	jmp	.L617	#
	.p2align 4,,10
	.p2align 3
.L455:
# sub.c:682:     if (strlen(result) != strlen(result_gmp))
	movq	%r13, %rdi	# result,
	call	strlen@PLT	#
# sub.c:682:     if (strlen(result) != strlen(result_gmp))
	testq	%rax, %rax	# tmp692
	je	.L459	#,
.L457:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC21(%rip), %rdi	#, tmp377
	call	puts@PLT	#
.L460:
	movl	68(%rsp), %edx	# %sfp,
	leaq	.LC42(%rip), %rsi	#, tmp390
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	movq	96(%rsp), %r8	# %sfp,
	movq	%r15, %rcx	# b_str,
	movq	%r14, %rdx	# a_str,
	leaq	.LC43(%rip), %rsi	#, tmp391
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	movl	$1, %edi	#,
	movq	%r12, %rdx	# sub_str,
	leaq	.LC44(%rip), %rsi	#, tmp392
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# sub.c:944:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.p2align 4,,10
	.p2align 3
.L679:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC22(%rip), %rdi	#, tmp379
	movq	%r8, 80(%rsp)	# _222, %sfp
	movq	%rcx, 88(%rsp)	# _220, %sfp
	movq	%rdx, 104(%rsp)	# i, %sfp
	call	puts@PLT	#
	movq	104(%rsp), %rdx	# %sfp, i
	leaq	.LC23(%rip), %rsi	#, tmp380
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# sub.c:695:             printf("result[%ld] = %c, result_gmp[%ld] = %c\n", i, result[i], i, result_gmp[i]);
	movq	88(%rsp), %rax	# %sfp, _220
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	80(%rsp), %rsi	# %sfp, _222
	movq	104(%rsp), %rdx	# %sfp, i
# sub.c:695:             printf("result[%ld] = %c, result_gmp[%ld] = %c\n", i, result[i], i, result_gmp[i]);
	movsbl	(%rax), %ecx	# *_220, *_220
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movsbl	(%rsi), %r9d	# *_222,
	movq	%rdx, %r8	# i,
	leaq	.LC24(%rip), %rsi	#, tmp383
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	movq	%rbx, %rcx	# result_gmp,
	movq	%r13, %rdx	# result,
	leaq	.LC25(%rip), %rsi	#, tmp384
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	jmp	.L460	#
	.p2align 4,,10
	.p2align 3
.L749:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k1, 2(%r8)	# tmp596, MEM[(__mmask8 *)_227]
	jmp	.L550	#
	.p2align 4,,10
	.p2align 3
.L748:
	kmovb	%k6, 1(%r8)	# tmp588, MEM[(__mmask8 *)_227]
	jmp	.L548	#
	.p2align 4,,10
	.p2align 3
.L747:
	kmovb	%k4, 1(%rcx)	# tmp548, MEM[(__mmask8 *)_227]
	jmp	.L546	#
	.p2align 4,,10
	.p2align 3
.L428:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC29(%rip), %rsi	#, tmp256
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	256(%rsp), %r12	#, tmp410
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC30(%rip), %r8	#,
	jmp	.L731	#
	.p2align 4,,10
	.p2align 3
.L426:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC33(%rip), %rsi	#, tmp266
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	256(%rsp), %r12	#, tmp410
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC34(%rip), %r8	#,
	jmp	.L731	#
.L737:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-1(%rax,%rsi), %r13d	# MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1], temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-2(%rsi), %r11	#, ivtmp.434
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r13,%r13), %edx	#, tmp599
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%ecx, %edx	# carry, tmp600
# sub.c:161:         carry = temp >> 7;
	movl	%r13d, %ecx	# temp, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%dl, -1(%rax,%rsi)	# tmp600, MEM[(__mmask8 *)bm_174 + ivtmp.434_229 * 1]
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %cl	#, temp
	jmp	.L623	#
.L743:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC26(%rip), %rdi	#, tmp389
	call	puts@PLT	#
	jmp	.L460	#
.L735:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L475	#,
# sub.c:185:         j++;
	movl	$1, %edx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %rbx	#, _30
	je	.L476	#,
# sub.c:192:     } while (j < n);
	jbe	.L474	#,
	testq	%r8, %r8	# tmp444
	je	.L706	#,
	cmpq	$1, %r8	#, tmp444
	je	.L627	#,
	cmpq	$2, %r8	#, tmp444
	je	.L628	#,
	cmpq	$3, %r8	#, tmp444
	je	.L629	#,
	cmpq	$4, %r8	#, tmp444
	je	.L630	#,
	cmpq	$5, %r8	#, tmp444
	je	.L631	#,
	cmpq	$6, %r8	#, tmp444
	jne	.L752	#,
.L632:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	80(%rsp), %rsi	# %sfp, b.39_46
	movq	72(%rsp), %r11	# %sfp, a.40_47
	movq	(%rsi,%rdx,8), %rax	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp858
	cmpq	%rax, (%r11,%rdx,8)	# tmp858, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L474	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L475	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L476	#,
.L631:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	80(%rsp), %rcx	# %sfp, b.39_46
	movq	72(%rsp), %r8	# %sfp, a.40_47
	movq	(%rcx,%rdx,8), %r9	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp861
	cmpq	%r9, (%r8,%rdx,8)	# tmp861, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L474	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L475	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L476	#,
.L630:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	80(%rsp), %r11	# %sfp, b.39_46
	movq	72(%rsp), %r10	# %sfp, a.40_47
	movq	(%r11,%rdx,8), %rsi	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp864
	cmpq	%rsi, (%r10,%rdx,8)	# tmp864, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L474	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L475	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L476	#,
.L629:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	80(%rsp), %r8	# %sfp, b.39_46
	movq	72(%rsp), %rax	# %sfp, a.40_47
	movq	(%r8,%rdx,8), %rcx	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp867
	cmpq	%rcx, (%rax,%rdx,8)	# tmp867, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L474	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L475	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L476	#,
.L628:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	80(%rsp), %r10	# %sfp, b.39_46
	movq	72(%rsp), %r9	# %sfp, a.40_47
	movq	(%r10,%rdx,8), %r11	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp870
	cmpq	%r11, (%r9,%rdx,8)	# tmp870, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L474	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L475	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L476	#,
.L627:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	80(%rsp), %rsi	# %sfp, b.39_46
	movq	72(%rsp), %rax	# %sfp, a.40_47
	movq	(%rsi,%rdx,8), %r8	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp873
	cmpq	%r8, (%rax,%rdx,8)	# tmp873, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L474	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L475	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L476	#,
# sub.c:192:     } while (j < n);
	jbe	.L474	#,
	movq	80(%rsp), %rcx	# %sfp, b.39_46
	movq	72(%rsp), %rsi	# %sfp, a.40_47
.L441:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rcx,%rdx,8), %r9	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp783
	cmpq	%r9, (%rsi,%rdx,8)	# tmp783, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L474	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L475	#,
# sub.c:185:         j++;
	leaq	1(%rdx), %r10	#, tmp445
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r10, %rbx	# tmp445, _30
	je	.L476	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rcx,%r10,8), %r11	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp784
	cmpq	%r11, (%rsi,%r10,8)	# tmp784, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L474	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L475	#,
# sub.c:185:         j++;
	leaq	2(%rdx), %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %rbx	# j, _30
	je	.L476	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rcx,%rax,8), %r8	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp874
	cmpq	%r8, (%rsi,%rax,8)	# tmp874, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L474	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L475	#,
# sub.c:185:         j++;
	addq	$3, %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L476	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rcx,%rdx,8), %r9	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp875
	cmpq	%r9, (%rsi,%rdx,8)	# tmp875, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L474	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L475	#,
# sub.c:185:         j++;
	leaq	3(%r10), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L476	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rcx,%rdx,8), %r11	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp876
	cmpq	%r11, (%rsi,%rdx,8)	# tmp876, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L474	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L475	#,
# sub.c:185:         j++;
	leaq	4(%r10), %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %rbx	# j, _30
	je	.L476	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rcx,%rax,8), %r8	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp877
	cmpq	%r8, (%rsi,%rax,8)	# tmp877, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L474	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L475	#,
# sub.c:185:         j++;
	leaq	5(%r10), %r9	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r9, %rbx	# j, _30
	je	.L476	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rcx,%r9,8), %rdx	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp878
	cmpq	%rdx, (%rsi,%r9,8)	# tmp878, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L474	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L475	#,
# sub.c:185:         j++;
	leaq	6(%r10), %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %rbx	# j, _30
	je	.L476	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rcx,%rax,8), %r11	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp879
	cmpq	%r11, (%rsi,%rax,8)	# tmp879, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L474	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L475	#,
# sub.c:185:         j++;
	leaq	7(%r10), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	je	.L476	#,
# sub.c:192:     } while (j < n);
	ja	.L441	#,
	jmp	.L474	#
	.p2align 4,,10
	.p2align 3
.L738:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rax)	# tmp352, MEM[(__mmask8 *)_227]
	jmp	.L535	#
.L741:
	kmovb	%k1, (%rcx)	# tmp580, MEM[(__mmask8 *)_227]
	jmp	.L543	#
.L740:
	kmovb	%k6, (%rcx)	# tmp574, MEM[(__mmask8 *)_227]
	jmp	.L540	#
.L751:
	kmovb	%k4, 1(%rax)	# tmp568, MEM[(__mmask8 *)_227]
	jmp	.L537	#
.L734:
# sub.c:887:             if (gzeof(test_file))
	movq	88(%rsp), %rdi	# %sfp,
	call	gzeof@PLT	#
# sub.c:887:             if (gzeof(test_file))
	testl	%eax, %eax	# tmp679
	jne	.L464	#,
# sub.c:893:                 perror("Error reading line");
	leaq	.LC39(%rip), %rdi	#, tmp280
	call	perror@PLT	#
# sub.c:894:                 gzclose(test_file);
	movq	88(%rsp), %rdi	# %sfp,
	call	gzclose@PLT	#
# sub.c:895:                 exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.p2align 4,,10
	.p2align 3
.L475:
	movq	72(%rsp), %r13	# %sfp, b
	movq	80(%rsp), %rsi	# %sfp, a
	movl	$1, %r10d	#, prephitmp_402
	jmp	.L439	#
.L706:
	movq	80(%rsp), %rcx	# %sfp, b.39_46
	jmp	.L441	#
.L752:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	80(%rsp), %r9	# %sfp, b.39_46
	movq	8(%r9), %r10	# MEM[(uint64_t *)b.39_46 + j_155 * 8], tmp855
	cmpq	%r10, 8(%rsi)	# tmp855, MEM[(uint64_t *)a.40_47 + j_155 * 8]
	ja	.L474	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L475	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %rbx	# j, _30
	jne	.L632	#,
.L476:
	movq	%r13, %rdi	# _29, sub
	xorl	%r10d, %r10d	# prephitmp_402
	jmp	.L440	#
.L467:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC46(%rip), %rsi	#, tmp394
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	jmp	.L468	#
.L466:
	leaq	.LC48(%rip), %rsi	#, tmp396
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	jmp	.L468	#
.L465:
	leaq	.LC47(%rip), %rsi	#, tmp395
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
	jmp	.L468	#
.L744:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:54:   free (__ptr);
	movq	sub_space(%rip), %rdi	# sub_space,
	call	free@PLT	#
	movq	borrow_space(%rip), %rdi	# borrow_space,
	call	free@PLT	#
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:55: }
	jmp	.L471	#
.L480:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	104(%rsp), %rcx	# %sfp,
	movq	stderr(%rip), %rdi	# stderr,
	leaq	.LC41(%rip), %rdx	#, tmp294
	movl	$1, %esi	#,
	xorl	%eax, %eax	#
	call	__fprintf_chk@PLT	#
# sub.c:907:             gzclose(test_file);
	movq	88(%rsp), %rdi	# %sfp,
	call	gzclose@PLT	#
# sub.c:908:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L469:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC49(%rip), %rdi	#, tmp397
	call	puts@PLT	#
# sub.c:970:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L430:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC37(%rip), %rdi	#, tmp274
	call	puts@PLT	#
# sub.c:870:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L733:
	movq	88(%rsp), %rdi	# %sfp,
	call	skip_first_line.part.0	#
.L732:
	movq	%r12, %rdi	# tmp410,
	call	open_gzfile.part.0	#
.L746:
# sub.c:983: }
	call	__stack_chk_fail@PLT	#
.L745:
# sub.c:980:         perror("Error closing test file");
	leaq	.LC50(%rip), %rdi	#, tmp404
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
	subq	$832, %rsp	#,
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
# sub.c:996: {
	movl	%esi, -66352(%rbp)	# measure_type, %sfp
	movl	%edi, %ebx	# tmp3888, test_case
	movl	%esi, %r14d	# tmp3889, measure_type
# sub.c:998:     create_directory("experiments/results");
	leaq	.LC52(%rip), %rdi	#, tmp873
# sub.c:996: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp4153
	movq	%rax, -56(%rbp)	# tmp4153, D.41454
	xorl	%eax, %eax	# tmp4153
# sub.c:998:     create_directory("experiments/results");
	call	create_directory	#
# sub.c:1001:     switch (measure_type)
	cmpl	$1, %r14d	#, measure_type
	je	.L754	#,
	cmpl	$2, %r14d	#, measure_type
	je	.L755	#,
	testl	%r14d, %r14d	# measure_type
	je	.L2751	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC59(%rip), %rdi	#, tmp910
	call	puts@PLT	#
# sub.c:1017:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.p2align 4,,10
	.p2align 3
.L754:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC55(%rip), %rdi	#, tmp886
	call	puts@PLT	#
# sub.c:1009:         create_directory("experiments/results/timespec_measurements");
	leaq	.LC56(%rip), %rdi	#, tmp887
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
	je	.L763	#,
	jg	.L764	#,
	testl	%ebx, %ebx	# test_case
	je	.L765	#,
	cmpl	$1, %ebx	#, test_case
	jne	.L761	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC31(%rip), %rsi	#, tmp1638
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1667
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC32(%rip), %r8	#,
	movl	$100, %esi	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movq	%r12, %rdi	# tmp1667,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %esi	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%rsi	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-65824(%rbp), %r13	#, tmp1669
	leaq	.LC86(%rip), %r8	#,
.L2735:
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r13, %rdi	# tmp1669,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
# sub.c:736:     gzFile file = gzopen(filename, mode);
	leaq	.LC76(%rip), %rsi	#, tmp1645
	movq	%r13, %rdi	# tmp1669,
	call	gzopen@PLT	#
# sub.c:737:     if (file == NULL)
	popq	%rsi	#
# sub.c:736:     gzFile file = gzopen(filename, mode);
	movq	%rax, -66360(%rbp)	# file, %sfp
# sub.c:737:     if (file == NULL)
	popq	%rdi	#
	testq	%rax, %rax	# file
	je	.L913	#,
.L914:
# sub.c:736:     gzFile file = gzopen(filename, mode);
	leaq	.LC38(%rip), %rsi	#, tmp916
	movq	%r12, %rdi	# tmp1667,
	call	gzopen@PLT	#
	movq	%rax, -66320(%rbp)	# file, %sfp
# sub.c:737:     if (file == NULL)
	testq	%rax, %rax	# file
	je	.L2752	#,
# sub.c:748:     if (gzgets(file, buffer, sizeof(buffer)) == NULL)
	leaq	-65600(%rbp), %r12	#, tmp1661
	movq	%rax, %rdi	# file,
	movl	$65536, %edx	#,
	movq	%r12, %rsi	# tmp1661,
	call	gzgets@PLT	#
# sub.c:748:     if (gzgets(file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp3891
	je	.L2750	#,
# sub.c:1191:     unsigned long seed = generate_seed();
	xorl	%eax, %eax	#
	call	generate_seed	#
# sub.c:1192:     srand(seed);
	movl	%eax, %edi	# tmp3892, seed
	call	srand@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edx	#,
	leaq	.LC60(%rip), %rsi	#, tmp920
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# sub.c:1198:         int i = rand() % ITERATIONS;
	call	rand@PLT	#
	movslq	%eax, %rdx	# tmp3893,
# sub.c:1198:         int i = rand() % ITERATIONS;
	imulq	$351843721, %rdx, %rcx	#, _40, tmp922
	movl	%edx, %esi	# _40, tmp925
	sarl	$31, %esi	#, tmp925
	sarq	$45, %rcx	#, tmp924
	subl	%esi, %ecx	# tmp925, i
	imull	$100000, %ecx, %r14d	#, i, tmp926
# sub.c:1198:         int i = rand() % ITERATIONS;
	movq	%rdx, %r15	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC61(%rip), %rsi	#, tmp927
# sub.c:1198:         int i = rand() % ITERATIONS;
	subl	%r14d, %r15d	# tmp926, i
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	xorl	%edx, %edx	#
	movl	%r15d, %ecx	# i,
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# sub.c:1203:         gzrewind(test_file);
	movq	-66320(%rbp), %r13	# %sfp, file
	movq	%r13, %rdi	# file,
	call	gzrewind@PLT	#
# sub.c:748:     if (gzgets(file, buffer, sizeof(buffer)) == NULL)
	movl	$65536, %edx	#,
	movq	%r12, %rsi	# tmp1661,
	movq	%r13, %rdi	# file,
	call	gzgets@PLT	#
# sub.c:748:     if (gzgets(file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp3894
	je	.L2750	#,
# sub.c:1207:         for (int j = 0; j < i; ++j)
	xorl	%ebx, %ebx	# j
# sub.c:1207:         for (int j = 0; j < i; ++j)
	testl	%r15d, %r15d	# i
	jle	.L782	#,
	movl	%r15d, %edi	# i, tmp1903
	andl	$3, %edi	#, tmp1903
	je	.L2721	#,
	cmpl	$1, %edi	#, tmp1903
	je	.L1872	#,
	cmpl	$2, %edi	#, tmp1903
	jne	.L2753	#,
.L1873:
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movl	$65536, %edx	#,
	xorl	%esi, %esi	#
	movq	%r12, %rdi	# tmp1661,
	call	memset@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	movq	-66320(%rbp), %rdi	# %sfp,
	movl	$65536, %edx	#,
	movq	%r12, %rsi	# tmp1661,
	call	gzgets@PLT	#
# sub.c:1207:         for (int j = 0; j < i; ++j)
	incl	%ebx	# j
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp3916
	je	.L2348	#,
.L1872:
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	xorl	%esi, %esi	#
	movl	$65536, %edx	#,
	movq	%r12, %rdi	# tmp1661,
	call	memset@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	movq	-66320(%rbp), %rdi	# %sfp,
	movl	$65536, %edx	#,
	movq	%r12, %rsi	# tmp1661,
	call	gzgets@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp3917
	je	.L2348	#,
# sub.c:1207:         for (int j = 0; j < i; ++j)
	incl	%ebx	# j
# sub.c:1207:         for (int j = 0; j < i; ++j)
	cmpl	%ebx, %r15d	# j, i
	je	.L782	#,
.L2721:
	movq	-66320(%rbp), %r14	# %sfp, file
.L776:
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	xorl	%esi, %esi	#
	movl	$65536, %edx	#,
	movq	%r12, %rdi	# tmp1661,
	call	memset@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	movl	$65536, %edx	#,
	movq	%r12, %rsi	# tmp1661,
	movq	%r14, %rdi	# file,
	call	gzgets@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp3898
	je	.L2348	#,
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	xorl	%esi, %esi	#
	movl	$65536, %edx	#,
	movq	%r12, %rdi	# tmp1661,
	call	memset@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	movl	$65536, %edx	#,
	movq	%r12, %rsi	# tmp1661,
	movq	%r14, %rdi	# file,
	call	gzgets@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp3900
	je	.L2348	#,
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	xorl	%esi, %esi	#
	movl	$65536, %edx	#,
	movq	%r12, %rdi	# tmp1661,
	call	memset@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	movl	$65536, %edx	#,
	movq	%r12, %rsi	# tmp1661,
	movq	%r14, %rdi	# file,
	call	gzgets@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp3918
	je	.L2348	#,
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	xorl	%esi, %esi	#
	movl	$65536, %edx	#,
	movq	%r12, %rdi	# tmp1661,
	call	memset@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	movl	$65536, %edx	#,
	movq	%r12, %rsi	# tmp1661,
	movq	%r14, %rdi	# file,
	call	gzgets@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp3919
	je	.L2348	#,
# sub.c:1207:         for (int j = 0; j < i; ++j)
	addl	$4, %ebx	#, j
# sub.c:1207:         for (int j = 0; j < i; ++j)
	cmpl	%ebx, %r15d	# j, i
	jne	.L776	#,
.L782:
# sub.c:1227:         char *a_str = strtok(buffer, ",");
	leaq	.LC40(%rip), %r15	#, tmp930
	movq	%r15, %rsi	# tmp930,
	movq	%r12, %rdi	# tmp1661,
	call	strtok@PLT	#
# sub.c:1228:         char *b_str = strtok(NULL, ",");
	xorl	%edi, %edi	#
	movq	%r15, %rsi	# tmp930,
# sub.c:1227:         char *a_str = strtok(buffer, ",");
	movq	%rax, %rbx	# tmp3895, a_str
# sub.c:1228:         char *b_str = strtok(NULL, ",");
	call	strtok@PLT	#
# sub.c:1229:         char *result_str = strtok(NULL, ",");
	xorl	%edi, %edi	#
	movq	%r15, %rsi	# tmp930,
# sub.c:1228:         char *b_str = strtok(NULL, ",");
	movq	%rax, %r13	# tmp3896, b_str
# sub.c:1229:         char *result_str = strtok(NULL, ",");
	call	strtok@PLT	#
# sub.c:1231:         if (a_str == NULL || b_str == NULL || result_str == NULL)
	testq	%rbx, %rbx	# a_str
	sete	%r8b	#, tmp934
# sub.c:1231:         if (a_str == NULL || b_str == NULL || result_str == NULL)
	testq	%r13, %r13	# b_str
	sete	%r9b	#, tmp936
# sub.c:1231:         if (a_str == NULL || b_str == NULL || result_str == NULL)
	orb	%r9b, %r8b	# tmp936, tmp4154
	jne	.L777	#,
	testq	%rax, %rax	# result_str
	je	.L777	#,
# sub.c:1239:         int n_1 = strlen(a_str);
	movq	%rbx, %rdi	# a_str,
	call	strlen@PLT	#
# sub.c:1240:         int n_2 = strlen(b_str);
	movq	%r13, %rdi	# b_str,
# sub.c:1239:         int n_1 = strlen(a_str);
	movl	%eax, -66296(%rbp)	# tmp3901, n_1
# sub.c:1240:         int n_2 = strlen(b_str);
	call	strlen@PLT	#
# sub.c:1244:         limb_set_str(a_str, b_str, &a, &b, &n_1, &n_2);
	leaq	-66292(%rbp), %r9	#,
	leaq	-66296(%rbp), %r8	#,
	movq	%rbx, %rdi	# a_str,
	leaq	-66224(%rbp), %rcx	#, tmp958
	leaq	-66288(%rbp), %rdx	#, tmp959
	movq	%r13, %rsi	# b_str,
# sub.c:1240:         int n_2 = strlen(b_str);
	movl	%eax, -66292(%rbp)	# tmp3902, n_2
# sub.c:1244:         limb_set_str(a_str, b_str, &a, &b, &n_1, &n_2);
	call	limb_set_str	#
# sub.c:1248:         int n = n_1;
	movslq	-66296(%rbp), %r12	# n_1,
# sub.c:1251:         aligned_uint64_ptr sub = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %r11	# sub_space_ptr,
# sub.c:1252:         sub_space_ptr += (n + 31) & ~31;
	leal	31(%r12), %ecx	#, tmp963
# sub.c:1252:         sub_space_ptr += (n + 31) & ~31;
	andl	$-32, %ecx	#, _59
# sub.c:1251:         aligned_uint64_ptr sub = sub_space + sub_space_ptr;
	movq	%r11, %rdx	#,
	movq	sub_space(%rip), %rax	# sub_space, sub_space
# sub.c:1252:         sub_space_ptr += (n + 31) & ~31;
	addl	%ecx, %edx	# _59, tmp964
# sub.c:1256:         memset(sub, 0, n * sizeof(uint64_t));
	leaq	0(,%r12,8), %r14	#, _63
# sub.c:1251:         aligned_uint64_ptr sub = sub_space + sub_space_ptr;
	leaq	(%rax,%r11,8), %rdi	#, _57
# sub.c:1252:         sub_space_ptr += (n + 31) & ~31;
	movl	%edx, sub_space_ptr(%rip)	# tmp964, sub_space_ptr
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	xorl	%esi, %esi	#
	movq	%r14, %rdx	# _63,
# sub.c:1253:         borrow_space_ptr += (n + 31) & ~31;
	addl	%ecx, borrow_space_ptr(%rip)	# _59, borrow_space_ptr
# sub.c:1254:         size_t sub_size = n;
	movl	%r12d, -66312(%rbp)	# n, %sfp
# sub.c:1245:         __builtin_assume_aligned(a, 64);
	movq	-66288(%rbp), %r15	# a, a.103_51
# sub.c:1246:         __builtin_assume_aligned(b, 64);
	movq	-66224(%rbp), %rbx	# b, b.104_52
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	call	memset@PLT	#
	movq	borrow_space(%rip), %rdi	# borrow_space,
	movq	%r14, %rdx	# _63,
	xorl	%esi, %esi	#
	call	memset@PLT	#
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	movl	-66312(%rbp), %edi	# %sfp, n
	testl	%edi, %edi	# n
	jle	.L788	#,
	leal	-1(%rdi), %r13d	#, tmp974
	shrl	$6, %r13d	#,
	salq	$6, %r13	#, tmp977
	leaq	64(%r15,%r13), %rsi	#, _2060
	shrq	$6, %r13	#, tmp1893
	incq	%r13	# tmp1896
	movq	%r15, %r8	# a.103_51, ivtmp.806
	movq	%rbx, %r9	# b.104_52, ivtmp.807
	andl	$7, %r13d	#, tmp1897
	je	.L787	#,
	cmpq	$1, %r13	#, tmp1897
	je	.L1874	#,
	cmpq	$2, %r13	#, tmp1897
	je	.L1875	#,
	cmpq	$3, %r13	#, tmp1897
	je	.L1876	#,
	cmpq	$4, %r13	#, tmp1897
	je	.L1877	#,
	cmpq	$5, %r13	#, tmp1897
	je	.L1878	#,
	cmpq	$6, %r13	#, tmp1897
	jne	.L2754	#,
.L1879:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	(%r8)	# ivtmp.806
	clflush	(%r9)	# ivtmp.807
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	addq	$64, %r8	#, ivtmp.806
	addq	$64, %r9	#, ivtmp.807
.L1878:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	(%r8)	# ivtmp.806
	clflush	(%r9)	# ivtmp.807
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	addq	$64, %r8	#, ivtmp.806
	addq	$64, %r9	#, ivtmp.807
.L1877:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	(%r8)	# ivtmp.806
	clflush	(%r9)	# ivtmp.807
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	addq	$64, %r8	#, ivtmp.806
	addq	$64, %r9	#, ivtmp.807
.L1876:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	(%r8)	# ivtmp.806
	clflush	(%r9)	# ivtmp.807
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	addq	$64, %r8	#, ivtmp.806
	addq	$64, %r9	#, ivtmp.807
.L1875:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	(%r8)	# ivtmp.806
	clflush	(%r9)	# ivtmp.807
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	addq	$64, %r8	#, ivtmp.806
	addq	$64, %r9	#, ivtmp.807
.L1874:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	(%r8)	# ivtmp.806
	clflush	(%r9)	# ivtmp.807
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	addq	$64, %r8	#, ivtmp.806
	addq	$64, %r9	#, ivtmp.807
	cmpq	%rsi, %r8	# _2060, ivtmp.806
	je	.L788	#,
.L787:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	(%r8)	# ivtmp.806
	clflush	(%r9)	# ivtmp.807
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	leaq	64(%r9), %r15	#, tmp1899
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	64(%r8)	#
	clflush	(%r15)	# tmp1899
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	leaq	128(%r9), %rbx	#, ivtmp.807
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	128(%r8)	#
	clflush	(%rbx)	# ivtmp.807
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	leaq	192(%r9), %r10	#, ivtmp.807
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	192(%r8)	#
	clflush	(%r10)	# ivtmp.807
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	leaq	256(%r9), %r11	#, ivtmp.807
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	256(%r8)	#
	clflush	(%r11)	# ivtmp.807
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	leaq	320(%r9), %rdx	#, ivtmp.807
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	320(%r8)	#
	clflush	(%rdx)	# ivtmp.807
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	leaq	384(%r9), %rax	#, ivtmp.807
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	384(%r8)	#
	clflush	(%rax)	# ivtmp.807
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	leaq	448(%r9), %rcx	#, ivtmp.807
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	448(%r8)	#
	clflush	(%rcx)	# ivtmp.807
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	addq	$512, %r8	#, ivtmp.806
	addq	$512, %r9	#, ivtmp.807
	cmpq	%rsi, %r8	# _2060, ivtmp.806
	jne	.L787	#,
.L788:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1534:   __builtin_ia32_mfence ();
	mfence	
# sub.c:1332:         switch (measure_type)
	movl	-66352(%rbp), %r13d	# %sfp, measure_type
	cmpl	$1, %r13d	#, measure_type
	je	.L784	#,
	cmpl	$2, %r13d	#, measure_type
	je	.L785	#,
	movl	%edi, -66312(%rbp)	# n, %sfp
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC62(%rip), %rdi	#, tmp979
	call	puts@PLT	#
# sub.c:1337:             fflush(stdout);
	movq	stdout(%rip), %rdi	# stdout,
	call	fflush@PLT	#
# sub.c:1338:             __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);
	xorl	%eax, %eax	# tmp981
#APP
# 1338 "sub.c" 1
	cpuid
		
# 0 "" 2
# sub.c:1339:             TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
#NO_APP
	movq	-66224(%rbp), %r13	# b, b.114_69
	movq	-66288(%rbp), %r15	# a, a.115_70
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13), %rsi	# MEM[(uint64_t *)b.114_69 + j_316 * 8], tmp4632
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %r9	# sub_space, sub_space
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %rdi	# sub_space_ptr, sub_space_ptr
	leaq	-1(%r12), %rcx	#, tmp1773
	andl	$7, %ecx	#, tmp1775
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%rsi, (%r15)	# tmp4632, MEM[(uint64_t *)a.115_70 + j_316 * 8]
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%r9,%rdi,8), %rdx	#, result
# sub.c:1339:             TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
	movq	%r13, -66344(%rbp)	# b.114_69, %sfp
# sub.c:172:         if (likely(a[j] > b[j]))
	movl	-66312(%rbp), %r9d	# %sfp, n
	jbe	.L2755	#,
.L919:
	movq	-66344(%rbp), %r13	# %sfp, b
	movq	%r15, %rdi	# a.115_70, a
.L789:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi), %zmm8	# MEM[(__m512i * {ref-all})a_338 + i_336 * 8], tmp4639
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %rax	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	0(%r13), %zmm8, %zmm9	# MEM[(__m512i * {ref-all})b_341 + i_336 * 8], tmp4639, tmp1022
	leaq	-1(%r12), %r10	#, tmp1769
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k7	#, zeros, tmp1022, tmp1024
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm9, %zmm10	# tmp1022, tmp1022
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %rax	# borrow_space, bm
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm9, %zmm10{%k7}	# limb_digits, tmp1022, tmp1022, tmp1024, tmp1022
	shrq	$3, %r10	#, tmp1767
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, (%rdx)	# tmp1028, MEM[(__m512i * {ref-all})result_315 + i_336 * 8]
	andl	$3, %r10d	#, tmp1767
# sub.c:217:         i += 8;
	movl	$8, %ecx	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%rax), %rsi	#, ivtmp.691
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, (%rax)	# tmp1024, MEM[(__mmask8 *)_1340]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %r12	#, sub_size
	jbe	.L2353	#,
	testq	%r10, %r10	# tmp1770
	je	.L793	#,
	cmpq	$1, %r10	#, tmp1770
	je	.L1953	#,
	cmpq	$2, %r10	#, tmp1770
	jne	.L2756	#,
.L1954:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%rcx,8), %zmm14	# MEM[(__m512i * {ref-all})a_338 + i_336 * 8], tmp5036
# sub.c:219:     } while (likely(i < n));
	incq	%rsi	# ivtmp.691
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	0(%r13,%rcx,8), %zmm14, %zmm15	# MEM[(__m512i * {ref-all})b_341 + i_336 * 8], tmp5036, tmp3154
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k2	#, zeros, tmp3154, tmp3156
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm15, %zmm4	# tmp3154, tmp3154
	vpaddq	limb_digits(%rip), %zmm15, %zmm4{%k2}	# limb_digits, tmp3154, tmp3154, tmp3156, tmp3154
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm4, (%rdx,%rcx,8)	# tmp3158, MEM[(__m512i * {ref-all})result_315 + i_336 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, -1(%rsi)	# tmp3156, MEM[(__mmask8 *)_1340]
.L1953:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%rcx,8), %zmm7	# MEM[(__m512i * {ref-all})a_338 + i_336 * 8], tmp5038
# sub.c:219:     } while (likely(i < n));
	incq	%rsi	# ivtmp.691
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	0(%r13,%rcx,8), %zmm7, %zmm3	# MEM[(__m512i * {ref-all})b_341 + i_336 * 8], tmp5038, tmp3160
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k3	#, zeros, tmp3160, tmp3162
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm3, %zmm1	# tmp3160, tmp3160
	vpaddq	limb_digits(%rip), %zmm3, %zmm1{%k3}	# limb_digits, tmp3160, tmp3160, tmp3162, tmp3160
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rdx,%rcx,8)	# tmp3164, MEM[(__m512i * {ref-all})result_315 + i_336 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, -1(%rsi)	# tmp3162, MEM[(__mmask8 *)_1340]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rcx, %r12	# i, sub_size
	jbe	.L2353	#,
.L793:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%rcx,8), %zmm2	# MEM[(__m512i * {ref-all})a_338 + i_336 * 8], tmp4641
# sub.c:217:         i += 8;
	leaq	8(%rcx), %r11	#, tmp1771
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	0(%r13,%rcx,8), %zmm2, %zmm5	# MEM[(__m512i * {ref-all})b_341 + i_336 * 8], tmp4641, tmp1932
# sub.c:217:         i += 8;
	leaq	16(%rcx), %rbx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k4	#, zeros, tmp1932, tmp1934
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm5, %zmm6	# tmp1932, tmp1932
# sub.c:217:         i += 8;
	leaq	24(%rcx), %r10	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm5, %zmm6{%k4}	# limb_digits, tmp1932, tmp1932, tmp1934, tmp1932
# sub.c:219:     } while (likely(i < n));
	addq	$4, %rsi	#, ivtmp.691
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rdx,%rcx,8)	# tmp1936, MEM[(__m512i * {ref-all})result_315 + i_336 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, -4(%rsi)	# tmp1934, MEM[(__mmask8 *)_1340]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%r11,8), %zmm0	# MEM[(__m512i * {ref-all})a_338 + i_336 * 8], tmp4643
# sub.c:217:         i += 8;
	addq	$32, %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	0(%r13,%r11,8), %zmm0, %zmm8	# MEM[(__m512i * {ref-all})b_341 + i_336 * 8], tmp4643, tmp1940
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm8, %k5	#, zeros, tmp1940, tmp1942
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm8, %zmm9	# tmp1940, tmp1940
	vpaddq	limb_digits(%rip), %zmm8, %zmm9{%k5}	# limb_digits, tmp1940, tmp1940, tmp1942, tmp1940
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rdx,%r11,8)	# tmp1944, MEM[(__m512i * {ref-all})result_315 + i_336 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, -3(%rsi)	# tmp1942, MEM[(__mmask8 *)_1340]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%rbx,8), %zmm10	# MEM[(__m512i * {ref-all})a_338 + i_336 * 8], tmp4645
	vpsubq	0(%r13,%rbx,8), %zmm10, %zmm11	# MEM[(__m512i * {ref-all})b_341 + i_336 * 8], tmp4645, tmp1948
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm11, %k6	#, zeros, tmp1948, tmp1950
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm11, %zmm12	# tmp1948, tmp1948
	vpaddq	limb_digits(%rip), %zmm11, %zmm12{%k6}	# limb_digits, tmp1948, tmp1948, tmp1950, tmp1948
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm12, (%rdx,%rbx,8)	# tmp1952, MEM[(__m512i * {ref-all})result_315 + i_336 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, -2(%rsi)	# tmp1950, MEM[(__mmask8 *)_1340]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%rdi,%r10,8), %zmm13	# MEM[(__m512i * {ref-all})a_338 + i_336 * 8], tmp4647
	vpsubq	0(%r13,%r10,8), %zmm13, %zmm14	# MEM[(__m512i * {ref-all})b_341 + i_336 * 8], tmp4647, tmp1956
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k7	#, zeros, tmp1956, tmp1958
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm14, %zmm15	# tmp1956, tmp1956
	vpaddq	limb_digits(%rip), %zmm14, %zmm15{%k7}	# limb_digits, tmp1956, tmp1956, tmp1958, tmp1956
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, (%rdx,%r10,8)	# tmp1960, MEM[(__m512i * {ref-all})result_315 + i_336 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, -1(%rsi)	# tmp1958, MEM[(__mmask8 *)_1340]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rcx, %r12	# i, sub_size
	ja	.L793	#,
.L2353:
# sub.c:218:         j++;
	leaq	-1(%r12), %rsi	#, tmp1666
	movq	%rsi, %r13	# tmp1666, tmp1036
	shrq	$3, %r13	#, tmp1036
	xorl	%edi, %edi	# j
	testl	%r9d, %r9d	# n
	setne	%dil	#, j
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	imull	%r13d, %edi	# tmp1036, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm4	# zeros, tmp4649
	movslq	%edi, %r8	# i, ivtmp.679
	vmovdqu64	%zmm4, (%rdx,%r12,8)	# tmp4649, MEM[(__m512i_u * {ref-all})_363]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%edi, %edi	# i
	js	.L797	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rax,%r8), %ecx	# MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1],
	movl	%r8d, %r11d	# ivtmp.679, tmp1765
	movl	%ecx, %r10d	#,
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movl	%r8d, %ebx	# ivtmp.679, tmp4155
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	addl	%ecx, %ecx	# tmp1040
	andl	$7, %r11d	#, tmp1765
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r10b	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decl	%ebx	# tmp4155
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%cl, (%rax,%r8)	# tmp1040, MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-1(%r8), %rcx	#, ivtmp.679
	js	.L797	#,
	testl	%r11d, %r11d	# tmp1765
	je	.L796	#,
	cmpl	$1, %r11d	#, tmp1765
	je	.L1947	#,
	cmpl	$2, %r11d	#, tmp1765
	je	.L1948	#,
	cmpl	$3, %r11d	#, tmp1765
	je	.L1949	#,
	cmpl	$4, %r11d	#, tmp1765
	je	.L1950	#,
	cmpl	$5, %r11d	#, tmp1765
	je	.L1951	#,
	cmpl	$6, %r11d	#, tmp1765
	je	.L1952	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rax,%rcx), %r13d	# MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r13,%r13), %edi	#, tmp3121
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %edi	# carry, tmp3122
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r13b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%dil, (%rax,%rcx)	# tmp3122, MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r13d, %r10d	# temp, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-2(%r8), %rcx	#, ivtmp.679
.L1952:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rax,%rcx), %r8d	# MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %r11d	#, tmp3125
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %r11d	# carry, tmp3126
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r8b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r11b, (%rax,%rcx)	# tmp3126, MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %r10d	# temp, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.679
.L1951:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rax,%rcx), %ebx	# MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rbx,%rbx), %r13d	#, tmp3129
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %r13d	# carry, tmp3130
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %bl	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r13b, (%rax,%rcx)	# tmp3130, MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%ebx, %r10d	# temp, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.679
.L1950:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rax,%rcx), %r8d	# MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %edi	#, tmp3133
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %edi	# carry, tmp3134
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r8b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%dil, (%rax,%rcx)	# tmp3134, MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %r10d	# temp, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.679
.L1949:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rax,%rcx), %r11d	# MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r11,%r11), %ebx	#, tmp3137
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %ebx	# carry, tmp3138
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r11b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%bl, (%rax,%rcx)	# tmp3138, MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r11d, %r10d	# temp, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.679
.L1948:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rax,%rcx), %r13d	# MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r13,%r13), %r8d	#, tmp3141
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %r8d	# carry, tmp3142
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r13b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r8b, (%rax,%rcx)	# tmp3142, MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r13d, %r10d	# temp, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.679
.L1947:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rax,%rcx), %r11d	# MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r11,%r11), %edi	#, tmp3145
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %edi	# carry, tmp3146
	movb	%dil, (%rax,%rcx)	# tmp3146, MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1]
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r11b	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.679
# sub.c:161:         carry = temp >> 7;
	movl	%r11d, %r10d	# temp, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%ecx, %ecx	# ivtmp.679
	js	.L797	#,
.L796:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rax,%rcx), %ebx	# MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1], temp
	movzbl	-1(%rax,%rcx), %r11d	# MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rbx,%rbx), %r13d	#, tmp1966
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %bl	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r11,%r11), %edi	#, tmp1972
# sub.c:161:         carry = temp >> 7;
	movl	%ebx, %r8d	# temp, carry
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %r8d	# tmp1972, tmp1973
	movb	%r8b, -1(%rax,%rcx)	# tmp1973, MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1]
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-2(%rax,%rcx), %r8d	# MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %r13d	# carry, tmp1967
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %r10d	#, tmp1978
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r8b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r13b, (%rax,%rcx)	# tmp1967, MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1]
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r11b	#, temp
	movl	%r8d, %r13d	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-3(%rax,%rcx), %r8d	# MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1], temp
# sub.c:161:         carry = temp >> 7;
	movl	%r11d, %ebx	# temp, carry
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %ebx	# tmp1978, tmp1979
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %r11d	#, tmp1984
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r8b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%bl, -2(%rax,%rcx)	# tmp1979, MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %ebx	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-4(%rax,%rcx), %r8d	# MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r11d, %r13d	# tmp1984, tmp1985
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %edi	#, tmp1990
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r8b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r13b, -3(%rax,%rcx)	# tmp1985, MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %r13d	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-5(%rax,%rcx), %r8d	# MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %ebx	# tmp1990, tmp1991
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %r10d	#, tmp1996
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %r13d	# tmp1996, tmp1997
	movb	%bl, -4(%rax,%rcx)	# tmp1991, MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1]
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-7(%rax,%rcx), %r10d	# MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1], temp
	movzbl	-6(%rax,%rcx), %ebx	# MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r8b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r13b, -5(%rax,%rcx)	# tmp1997, MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1]
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rbx,%rbx), %edi	#, tmp2002
	leal	(%r10,%r10), %r13d	#, tmp2008
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %r11d	# temp, carry
	shrb	$7, %bl	#, carry
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %r11d	# tmp2002, tmp2003
	orl	%r13d, %ebx	# tmp2008, tmp2009
	movb	%r11b, -6(%rax,%rcx)	# tmp2003, MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1]
	movb	%bl, -7(%rax,%rcx)	# tmp2009, MEM[(__mmask8 *)bm_335 + ivtmp.679_668 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	subq	$8, %rcx	#, ivtmp.679
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r10b	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%ecx, %ecx	# ivtmp.679
	jns	.L796	#,
.L797:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx), %zmm7	# MEM[(__m512i * {ref-all})result_315 + i_2149 * 8], _2145
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rax), %ecx	# MEM[(__mmask8 *)_667], MEM[(__mmask8 *)_667]
	leaq	-1(%r12), %r8	#, tmp1760
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k1	# MEM[(__mmask8 *)_667], tmp4653
	vpsubq	ones(%rip), %zmm7, %zmm7{%k1}	# ones, _2145, tmp1042, tmp4653, _2145
	shrq	$3, %r8	#, tmp1758
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm7, (%rdx)	# tmp1042, MEM[(__m512i * {ref-all})result_315 + i_2149 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm7, %k0	#, zeros, tmp1042, tmp1048
	andl	$3, %r8d	#, tmp1761
	kmovb	%k0, %r10d	# tmp1048, tmp1048
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%r10b, %r10b	# tmp1048
	jne	.L2757	#,
.L1231:
# sub.c:249:         i += 8;
	movl	$8, %r11d	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rax	# ivtmp.674
	cmpq	$8, %r12	#, sub_size
	jbe	.L799	#,
	testq	%r8, %r8	# tmp1761
	je	.L795	#,
	cmpq	$1, %r8	#, tmp1761
	je	.L1945	#,
	cmpq	$2, %r8	#, tmp1761
	je	.L1946	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%r11,8), %zmm3	# MEM[(__m512i * {ref-all})result_315 + i_2149 * 8], _2145
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rax), %ebx	# MEM[(__mmask8 *)_667], MEM[(__mmask8 *)_667]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ebx, %k2	# MEM[(__mmask8 *)_667], tmp5019
	vpsubq	ones(%rip), %zmm3, %zmm3{%k2}	# ones, _2145, tmp3088, tmp5019, _2145
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rdx,%r11,8)	# tmp3088, MEM[(__m512i * {ref-all})result_315 + i_2149 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k3	#, zeros, tmp3088, tmp3090
	kmovb	%k3, %edi	# tmp3090, tmp3090
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%dil, %dil	# tmp3090
	jne	.L2758	#,
.L1233:
# sub.c:249:         i += 8;
	addq	$8, %r11	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rax	# ivtmp.674
.L1946:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%r11,8), %zmm1	# MEM[(__m512i * {ref-all})result_315 + i_2149 * 8], _2145
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rax), %r13d	# MEM[(__mmask8 *)_667], MEM[(__mmask8 *)_667]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r13d, %k4	# MEM[(__mmask8 *)_667], tmp5021
	vpsubq	ones(%rip), %zmm1, %zmm1{%k4}	# ones, _2145, tmp3094, tmp5021, _2145
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rdx,%r11,8)	# tmp3094, MEM[(__m512i * {ref-all})result_315 + i_2149 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm1, %k5	#, zeros, tmp3094, tmp3096
	kmovb	%k5, %r8d	# tmp3096, tmp3096
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%r8b, %r8b	# tmp3096
	jne	.L2759	#,
.L1236:
# sub.c:249:         i += 8;
	addq	$8, %r11	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rax	# ivtmp.674
.L1945:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%r11,8), %zmm2	# MEM[(__m512i * {ref-all})result_315 + i_2149 * 8], _2145
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rax), %ecx	# MEM[(__mmask8 *)_667], MEM[(__mmask8 *)_667]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k6	# MEM[(__mmask8 *)_667], tmp5023
	vpsubq	ones(%rip), %zmm2, %zmm2{%k6}	# ones, _2145, tmp3100, tmp5023, _2145
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, (%rdx,%r11,8)	# tmp3100, MEM[(__m512i * {ref-all})result_315 + i_2149 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k7	#, zeros, tmp3100, tmp3102
	kmovb	%k7, %r10d	# tmp3102, tmp3102
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%r10b, %r10b	# tmp3102
	jne	.L2760	#,
.L1239:
# sub.c:249:         i += 8;
	addq	$8, %r11	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rax	# ivtmp.674
	cmpq	%r11, %r12	# i, sub_size
	ja	.L795	#,
.L799:
# sub.c:1485:     asm volatile("CPUID\n\t"
#APP
# 1485 "sub.c" 1
	CPUID
	RDTSC
	mov %edx, %edi	# cycles_high
	mov %eax, %r8d	# cycles_low
	
# 0 "" 2
# sub.c:1489:     asm volatile("RDTSCP\n\t"
# 1489 "sub.c" 1
	RDTSCP
	mov %edx, %edi	# cycles_high1
	mov %eax, %r8d	# cycles_low1
	CPUID
	
# 0 "" 2
# sub.c:218:         j++;
#NO_APP
	xorl	%edx, %edx	# j
	shrq	$3, %rsi	#, tmp1666
	testl	%r9d, %r9d	# n
	setne	%dl	#, j
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	imull	%esi, %edx	# tmp1016, j
# sub.c:1339:             TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
	movq	$1, -66328(%rbp)	#, %sfp
	movq	-66344(%rbp), %rdi	# %sfp, b.114_69
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movslq	%edx, %r13	# j,
	movl	%r13d, -66360(%rbp)	# i, %sfp
	movq	%r13, %r8	#,
	.p2align 4,,10
	.p2align 3
.L791:
# sub.c:1339:             TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
	salq	-66328(%rbp)	# %sfp
	movq	-66328(%rbp), %r11	# %sfp, __times
# sub.c:1501:     asm volatile("CPUID\n\t"
#APP
# 1501 "sub.c" 1
	CPUID
	RDTSC
	mov %edx, %r9d	# cycles_high
	mov %eax, %r10d	# cycles_low
	
# 0 "" 2
# sub.c:1505:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
#NO_APP
	movl	%r10d, %ebx	# cycles_low, cycles_low
# sub.c:1505:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	salq	$32, %r9	#, tmp1055
# sub.c:1505:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	orq	%rbx, %r9	# cycles_low, tmp1055
	movq	%r9, -66336(%rbp)	# tmp1055, %sfp
	movl	%r11d, -66312(%rbp)	# tmp4665, %sfp
# sub.c:1339:             TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
	xorl	%ebx, %ebx	# __t
	testq	%r11, %r11	# __times
	je	.L805	#,
	.p2align 4,,10
	.p2align 3
.L804:
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %rsi	# sub_space_ptr, sub_space_ptr
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %rax	# sub_space, sub_space
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rdi), %r11	# MEM[(uint64_t *)b.114_69 + j_410 * 8], tmp4667
	leaq	-1(%r12), %rdx	#, tmp1754
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%rax,%rsi,8), %rax	#, result
	andl	$7, %edx	#, tmp1756
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%r11, (%r15)	# tmp4667, MEM[(uint64_t *)a.115_70 + j_410 * 8]
	jbe	.L2761	#,
.L921:
	movq	%rdi, %r9	# b.114_69, b
	movq	%r15, %r10	# a.115_70, a
.L802:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r10), %zmm9	# MEM[(__m512i * {ref-all})a_432 + i_430 * 8], tmp4671
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %rdx	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r9), %zmm9, %zmm10	# MEM[(__m512i * {ref-all})b_435 + i_430 * 8], tmp4671, tmp1070
	leaq	-1(%r12), %r11	#, tmp1750
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k1	#, zeros, tmp1070, tmp1072
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm10, %zmm11	# tmp1070, tmp1070
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %rdx	# borrow_space, bm
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm10, %zmm11{%k1}	# limb_digits, tmp1070, tmp1070, tmp1072, tmp1070
	shrq	$3, %r11	#, tmp1748
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rax)	# tmp1076, MEM[(__m512i * {ref-all})result_409 + i_430 * 8]
	andl	$3, %r11d	#, tmp1751
# sub.c:217:         i += 8;
	movl	$8, %ecx	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%rdx), %rsi	#, ivtmp.656
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, (%rdx)	# tmp1072, MEM[(__mmask8 *)_2092]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %r12	#, sub_size
	jbe	.L2359	#,
	testq	%r11, %r11	# tmp1751
	je	.L807	#,
	cmpq	$1, %r11	#, tmp1751
	je	.L1935	#,
	cmpq	$2, %r11	#, tmp1751
	je	.L1936	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%r10), %zmm12	# MEM[(__m512i * {ref-all})a_432 + i_430 * 8], tmp5000
# sub.c:217:         i += 8;
	movl	$16, %ecx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%r9), %zmm12, %zmm13	# MEM[(__m512i * {ref-all})b_435 + i_430 * 8], tmp5000, tmp3036
# sub.c:219:     } while (likely(i < n));
	leaq	2(%rdx), %rsi	#, ivtmp.656
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k2	#, zeros, tmp3036, tmp3038
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm13, %zmm14	# tmp3036, tmp3036
	vpaddq	limb_digits(%rip), %zmm13, %zmm14{%k2}	# limb_digits, tmp3036, tmp3036, tmp3038, tmp3036
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, 64(%rax)	# tmp3040, MEM[(__m512i * {ref-all})result_409 + i_430 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, 1(%rdx)	# tmp3038, MEM[(__mmask8 *)_2092]
.L1936:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r10,%rcx,8), %zmm15	# MEM[(__m512i * {ref-all})a_432 + i_430 * 8], tmp5002
# sub.c:219:     } while (likely(i < n));
	incq	%rsi	# ivtmp.656
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r9,%rcx,8), %zmm15, %zmm4	# MEM[(__m512i * {ref-all})b_435 + i_430 * 8], tmp5002, tmp3042
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm4, %k3	#, zeros, tmp3042, tmp3044
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm4, %zmm7	# tmp3042, tmp3042
	vpaddq	limb_digits(%rip), %zmm4, %zmm7{%k3}	# limb_digits, tmp3042, tmp3042, tmp3044, tmp3042
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm7, (%rax,%rcx,8)	# tmp3046, MEM[(__m512i * {ref-all})result_409 + i_430 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, -1(%rsi)	# tmp3044, MEM[(__mmask8 *)_2092]
.L1935:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r10,%rcx,8), %zmm3	# MEM[(__m512i * {ref-all})a_432 + i_430 * 8], tmp5004
# sub.c:219:     } while (likely(i < n));
	incq	%rsi	# ivtmp.656
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r9,%rcx,8), %zmm3, %zmm2	# MEM[(__m512i * {ref-all})b_435 + i_430 * 8], tmp5004, tmp3048
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k4	#, zeros, tmp3048, tmp3050
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm2, %zmm1	# tmp3048, tmp3048
	vpaddq	limb_digits(%rip), %zmm2, %zmm1{%k4}	# limb_digits, tmp3048, tmp3048, tmp3050, tmp3048
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rax,%rcx,8)	# tmp3052, MEM[(__m512i * {ref-all})result_409 + i_430 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, -1(%rsi)	# tmp3050, MEM[(__mmask8 *)_2092]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rcx, %r12	# i, sub_size
	jbe	.L2359	#,
.L807:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r10,%rcx,8), %zmm5	# MEM[(__m512i * {ref-all})a_432 + i_430 * 8], tmp4673
# sub.c:217:         i += 8;
	leaq	8(%rcx), %r11	#, tmp1752
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r9,%rcx,8), %zmm5, %zmm6	# MEM[(__m512i * {ref-all})b_435 + i_430 * 8], tmp4673, tmp2035
# sub.c:219:     } while (likely(i < n));
	addq	$4, %rsi	#, ivtmp.656
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k5	#, zeros, tmp2035, tmp2037
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm6, %zmm0	# tmp2035, tmp2035
	vpaddq	limb_digits(%rip), %zmm6, %zmm0{%k5}	# limb_digits, tmp2035, tmp2035, tmp2037, tmp2035
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rax,%rcx,8)	# tmp2039, MEM[(__m512i * {ref-all})result_409 + i_430 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, -4(%rsi)	# tmp2037, MEM[(__mmask8 *)_2092]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r10,%r11,8), %zmm8	# MEM[(__m512i * {ref-all})a_432 + i_430 * 8], tmp4675
	vpsubq	(%r9,%r11,8), %zmm8, %zmm9	# MEM[(__m512i * {ref-all})b_435 + i_430 * 8], tmp4675, tmp2043
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k6	#, zeros, tmp2043, tmp2045
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm9, %zmm10	# tmp2043, tmp2043
	vpaddq	limb_digits(%rip), %zmm9, %zmm10{%k6}	# limb_digits, tmp2043, tmp2043, tmp2045, tmp2043
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, (%rax,%r11,8)	# tmp2047, MEM[(__m512i * {ref-all})result_409 + i_430 * 8]
# sub.c:217:         i += 8;
	leaq	16(%rcx), %r11	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, -3(%rsi)	# tmp2045, MEM[(__mmask8 *)_2092]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r10,%r11,8), %zmm11	# MEM[(__m512i * {ref-all})a_432 + i_430 * 8], tmp4677
	vpsubq	(%r9,%r11,8), %zmm11, %zmm12	# MEM[(__m512i * {ref-all})b_435 + i_430 * 8], tmp4677, tmp2051
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k7	#, zeros, tmp2051, tmp2053
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm12, %zmm13	# tmp2051, tmp2051
	vpaddq	limb_digits(%rip), %zmm12, %zmm13{%k7}	# limb_digits, tmp2051, tmp2051, tmp2053, tmp2051
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rax,%r11,8)	# tmp2055, MEM[(__m512i * {ref-all})result_409 + i_430 * 8]
# sub.c:217:         i += 8;
	leaq	24(%rcx), %r11	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, -2(%rsi)	# tmp2053, MEM[(__mmask8 *)_2092]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r10,%r11,8), %zmm14	# MEM[(__m512i * {ref-all})a_432 + i_430 * 8], tmp4679
# sub.c:217:         i += 8;
	addq	$32, %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r9,%r11,8), %zmm14, %zmm15	# MEM[(__m512i * {ref-all})b_435 + i_430 * 8], tmp4679, tmp2059
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k1	#, zeros, tmp2059, tmp2061
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm15, %zmm4	# tmp2059, tmp2059
	vpaddq	limb_digits(%rip), %zmm15, %zmm4{%k1}	# limb_digits, tmp2059, tmp2059, tmp2061, tmp2059
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm4, (%rax,%r11,8)	# tmp2063, MEM[(__m512i * {ref-all})result_409 + i_430 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, -1(%rsi)	# tmp2061, MEM[(__mmask8 *)_2092]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rcx, %r12	# i, sub_size
	ja	.L807	#,
.L2359:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm7	# zeros, tmp4681
	vmovdqu64	%zmm7, (%rax,%r14)	# tmp4681, MEM[(__m512i_u * {ref-all})_457]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%r8d, %r8d	# i
	js	.L810	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%r13), %r10d	# MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1],
	movl	%r13d, %r9d	# ivtmp.644, tmp1746
	movl	%r10d, %esi	#,
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movl	%r13d, %r11d	# ivtmp.644, tmp4156
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	addl	%r10d, %r10d	# tmp1083
	andl	$7, %r9d	#, tmp1746
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decl	%r11d	# tmp4156
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r10b, (%rdx,%r13)	# tmp1083, MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-1(%r13), %rcx	#, ivtmp.644
	js	.L810	#,
	testl	%r9d, %r9d	# tmp1746
	je	.L808	#,
	cmpl	$1, %r9d	#, tmp1746
	je	.L1929	#,
	cmpl	$2, %r9d	#, tmp1746
	je	.L1930	#,
	cmpl	$3, %r9d	#, tmp1746
	je	.L1931	#,
	cmpl	$4, %r9d	#, tmp1746
	je	.L1932	#,
	cmpl	$5, %r9d	#, tmp1746
	je	.L1933	#,
	cmpl	$6, %r9d	#, tmp1746
	je	.L1934	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-1(%rdx,%r13), %r9d	# MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %ecx	#, tmp3009
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%esi, %ecx	# carry, tmp3010
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%cl, -1(%rdx,%r13)	# tmp3010, MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1]
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-2(%r13), %rcx	#, ivtmp.644
.L1934:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r10d	# MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r10,%r10), %r11d	#, tmp3013
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r11d, %esi	# tmp3013, tmp3014
	movb	%sil, (%rdx,%rcx)	# tmp3014, MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r10d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.644
.L1933:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r10d	# MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r10,%r10), %r9d	#, tmp3017
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %esi	# tmp3017, tmp3018
	movb	%sil, (%rdx,%rcx)	# tmp3018, MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r10d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.644
.L1932:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r11d	# MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r11,%r11), %r10d	#, tmp3021
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %esi	# tmp3021, tmp3022
	movb	%sil, (%rdx,%rcx)	# tmp3022, MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r11d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.644
.L1931:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r11d	# MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r11,%r11), %r9d	#, tmp3025
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %esi	# tmp3025, tmp3026
	movb	%sil, (%rdx,%rcx)	# tmp3026, MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r11d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.644
.L1930:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r10d	# MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r10,%r10), %r11d	#, tmp3029
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r11d, %esi	# tmp3029, tmp3030
	movb	%sil, (%rdx,%rcx)	# tmp3030, MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r10d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.644
.L1929:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r10d	# MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r10,%r10), %r9d	#, tmp3033
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %esi	# tmp3033, tmp3034
	movb	%sil, (%rdx,%rcx)	# tmp3034, MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r10d, %esi	# temp, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.644
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%ecx, %ecx	# ivtmp.644
	js	.L810	#,
.L808:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r11d	# MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1], temp
	movzbl	-1(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r11,%r11), %r10d	#, tmp2068
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %esi	# tmp2068, tmp2069
	movb	%sil, (%rdx,%rcx)	# tmp2069, MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1]
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r11b	#, carry
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %esi	#, tmp2074
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%esi, %r11d	# tmp2074, tmp2075
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r9b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r11b, -1(%rdx,%rcx)	# tmp2075, MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %r11d	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-2(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %r10d	#, tmp2080
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %r11d	# tmp2080, tmp2081
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r9b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r11b, -2(%rdx,%rcx)	# tmp2081, MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %r11d	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-3(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %esi	#, tmp2086
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%esi, %r11d	# tmp2086, tmp2087
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r9b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r11b, -3(%rdx,%rcx)	# tmp2087, MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %r11d	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-4(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %r10d	#, tmp2092
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %r11d	# tmp2092, tmp2093
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r9b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r11b, -4(%rdx,%rcx)	# tmp2093, MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %r11d	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-5(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %esi	#, tmp2098
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%esi, %r11d	# tmp2098, tmp2099
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r9b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r11b, -5(%rdx,%rcx)	# tmp2099, MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %r11d	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-6(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1], temp
	movzbl	-7(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %r10d	#, tmp2104
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %r11d	# tmp2104, tmp2105
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r9b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r11b, -6(%rdx,%rcx)	# tmp2105, MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %r11d	# temp, carry
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp2110
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %r11d	# tmp2110, tmp2111
	movb	%r11b, -7(%rdx,%rcx)	# tmp2111, MEM[(__mmask8 *)bm_429 + ivtmp.644_761 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	subq	$8, %rcx	#, ivtmp.644
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%ecx, %ecx	# ivtmp.644
	jns	.L808	#,
.L810:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax), %zmm3	# MEM[(__m512i * {ref-all})result_409 + i_2169 * 8], _2165
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rdx), %ecx	# MEM[(__mmask8 *)_1220], MEM[(__mmask8 *)_1220]
	leaq	-1(%r12), %r9	#, tmp1741
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k2	# MEM[(__mmask8 *)_1220], tmp4685
	vpsubq	ones(%rip), %zmm3, %zmm3{%k2}	# ones, _2165, tmp1085, tmp4685, _2165
	shrq	$3, %r9	#, tmp1739
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rax)	# tmp1085, MEM[(__m512i * {ref-all})result_409 + i_2169 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k0	#, zeros, tmp1085, tmp1091
	andl	$3, %r9d	#, tmp1739
	movq	%r9, %r10	# tmp1739, tmp1742
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp1091
	jne	.L2762	#,
.L1145:
# sub.c:249:         i += 8;
	movl	$8, %r11d	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rdx), %rsi	#, ivtmp.639
	cmpq	$8, %r12	#, sub_size
	jbe	.L812	#,
	testq	%r10, %r10	# tmp1742
	je	.L809	#,
	cmpq	$1, %r10	#, tmp1742
	je	.L1927	#,
	cmpq	$2, %r10	#, tmp1742
	je	.L1928	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	64(%rax), %zmm2	# MEM[(__m512i * {ref-all})result_409 + i_2169 * 8], _2165
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rdx), %r9d	# MEM[(__mmask8 *)_1220], MEM[(__mmask8 *)_1220]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k3	# MEM[(__mmask8 *)_1220], tmp4988
	vpsubq	ones(%rip), %zmm2, %zmm2{%k3}	# ones, _2165, tmp2976, tmp4988, _2165
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, 64(%rax)	# tmp2976, MEM[(__m512i * {ref-all})result_409 + i_2169 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k4	#, zeros, tmp2976, tmp2978
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k4, %k4	# tmp2978
	jne	.L2763	#,
.L1147:
# sub.c:249:         i += 8;
	addq	$8, %r11	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.639
.L1928:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r11,8), %zmm1	# MEM[(__m512i * {ref-all})result_409 + i_2169 * 8], _2165
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %edx	# MEM[(__mmask8 *)_1220], MEM[(__mmask8 *)_1220]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edx, %k5	# MEM[(__mmask8 *)_1220], tmp4989
	vpsubq	ones(%rip), %zmm1, %zmm1{%k5}	# ones, _2165, tmp2982, tmp4989, _2165
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rax,%r11,8)	# tmp2982, MEM[(__m512i * {ref-all})result_409 + i_2169 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm1, %k6	#, zeros, tmp2982, tmp2984
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k6, %k6	# tmp2984
	jne	.L2764	#,
.L1150:
# sub.c:249:         i += 8;
	addq	$8, %r11	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.639
.L1927:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r11,8), %zmm5	# MEM[(__m512i * {ref-all})result_409 + i_2169 * 8], _2165
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %r10d	# MEM[(__mmask8 *)_1220], MEM[(__mmask8 *)_1220]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r10d, %k7	# MEM[(__mmask8 *)_1220], tmp4990
	vpsubq	ones(%rip), %zmm5, %zmm5{%k7}	# ones, _2165, tmp2988, tmp4990, _2165
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, (%rax,%r11,8)	# tmp2988, MEM[(__m512i * {ref-all})result_409 + i_2169 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k1	#, zeros, tmp2988, tmp2990
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k1, %k1	# tmp2990
	jne	.L2765	#,
.L1153:
# sub.c:249:         i += 8;
	addq	$8, %r11	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.639
	cmpq	%r11, %r12	# i, sub_size
	ja	.L809	#,
	jmp	.L812	#
	.p2align 4,,10
	.p2align 3
.L811:
# sub.c:249:         i += 8;
	addq	$8, %r11	#, tmp1743
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r11,8), %zmm0	# MEM[(__m512i * {ref-all})result_409 + i_2169 * 8], _2165
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rsi), %r9d	# MEM[(__mmask8 *)_1220], MEM[(__mmask8 *)_1220]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rsi), %rdx	#, tmp1744
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k3	# MEM[(__mmask8 *)_1220], tmp4693
	vpsubq	ones(%rip), %zmm0, %zmm0{%k3}	# ones, _2165, tmp2125, tmp4693, _2165
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rax,%r11,8)	# tmp2125, MEM[(__m512i * {ref-all})result_409 + i_2169 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k4	#, zeros, tmp2125, tmp2127
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k4, %k4	# tmp2127
	jne	.L2766	#,
.L1156:
# sub.c:249:         i += 8;
	leaq	8(%r11), %rsi	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rsi,8), %zmm8	# MEM[(__m512i * {ref-all})result_409 + i_2169 * 8], _2165
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rdx), %r10d	# MEM[(__mmask8 *)_1220], MEM[(__mmask8 *)_1220]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r10d, %k5	# MEM[(__mmask8 *)_1220], tmp4991
	vpsubq	ones(%rip), %zmm8, %zmm8{%k5}	# ones, _2165, tmp2996, tmp4991, _2165
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rax,%rsi,8)	# tmp2996, MEM[(__m512i * {ref-all})result_409 + i_2169 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm8, %k6	#, zeros, tmp2996, tmp2998
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k6, %k6	# tmp2998
	jne	.L2767	#,
.L1158:
# sub.c:249:         i += 8;
	leaq	16(%r11), %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm9	# MEM[(__m512i * {ref-all})result_409 + i_2169 * 8], _2165
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%rdx), %r9d	# MEM[(__mmask8 *)_1220], MEM[(__mmask8 *)_1220]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k7	# MEM[(__mmask8 *)_1220], tmp4992
	vpsubq	ones(%rip), %zmm9, %zmm9{%k7}	# ones, _2165, tmp3004, tmp4992, _2165
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rax,%rcx,8)	# tmp3004, MEM[(__m512i * {ref-all})result_409 + i_2169 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k1	#, zeros, tmp3004, tmp3006
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k1, %k1	# tmp3006
	jne	.L2768	#,
.L1160:
# sub.c:249:         i += 8;
	addq	$24, %r11	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%rdx), %rsi	#, ivtmp.639
	cmpq	%r11, %r12	# i, sub_size
	jbe	.L812	#,
.L809:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r11,8), %zmm6	# MEM[(__m512i * {ref-all})result_409 + i_2169 * 8], _2165
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %ecx	# MEM[(__mmask8 *)_1220], MEM[(__mmask8 *)_1220]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k2	# MEM[(__mmask8 *)_1220], tmp4692
	vpsubq	ones(%rip), %zmm6, %zmm6{%k2}	# ones, _2165, tmp2117, tmp4692, _2165
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rax,%r11,8)	# tmp2117, MEM[(__m512i * {ref-all})result_409 + i_2169 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k0	#, zeros, tmp2117, tmp2119
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp2119
	je	.L811	#,
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rsi)	# tmp2119, MEM[(__mmask8 *)_1220]
	jmp	.L811	#
.L764:
# sub.c:1031:     switch (test_case)
	cmpl	$3, %ebx	#, test_case
	jne	.L761	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC35(%rip), %rsi	#, tmp1598
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1667
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC36(%rip), %r8	#,
	movl	$1, %edx	#,
	movl	$100, %ecx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1667,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %edx	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%rdx	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-65824(%rbp), %r13	#, tmp1669
	leaq	.LC82(%rip), %r8	#,
	jmp	.L2735	#
.L2751:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC53(%rip), %rdi	#, tmp874
	call	puts@PLT	#
# sub.c:1005:         create_directory("experiments/results/rdtsc_measurements");
	leaq	.LC54(%rip), %rdi	#, tmp875
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
	je	.L757	#,
	jg	.L758	#,
	testl	%ebx, %ebx	# test_case
	je	.L759	#,
	cmpl	$1, %ebx	#, test_case
	jne	.L761	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC31(%rip), %rsi	#, tmp1568
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1667
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC32(%rip), %r8	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1667,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %eax	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%rax	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-66048(%rbp), %r13	#, tmp1663
	leaq	.LC79(%rip), %r8	#,
.L2731:
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r13, %rdi	# tmp1663,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
# sub.c:736:     gzFile file = gzopen(filename, mode);
	leaq	.LC76(%rip), %rsi	#, tmp1595
	movq	%r13, %rdi	# tmp1663,
	call	gzopen@PLT	#
# sub.c:737:     if (file == NULL)
	popq	%r8	#
# sub.c:736:     gzFile file = gzopen(filename, mode);
	movq	%rax, -66376(%rbp)	# file, %sfp
# sub.c:737:     if (file == NULL)
	popq	%r9	#
	testq	%rax, %rax	# file
	jne	.L914	#,
.L913:
	movq	%r13, %rdi	# tmp1660,
	call	open_gzfile.part.0	#
	.p2align 4,,10
	.p2align 3
.L758:
# sub.c:1031:     switch (test_case)
	cmpl	$3, %ebx	#, test_case
	jne	.L761	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC35(%rip), %rsi	#, tmp1578
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1667
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC36(%rip), %r8	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1667,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %r11d	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%r11	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-66048(%rbp), %r13	#, tmp1663
	leaq	.LC80(%rip), %r8	#,
	jmp	.L2731	#
.L755:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC57(%rip), %rdi	#, tmp898
	call	puts@PLT	#
# sub.c:1013:         create_directory("experiments/results/cputime_measurements");
	leaq	.LC58(%rip), %rdi	#, tmp899
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
	je	.L768	#,
	jle	.L2769	#,
	cmpl	$2, %ebx	#, test_case
	je	.L771	#,
	cmpl	$3, %ebx	#, test_case
	jne	.L761	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC35(%rip), %rsi	#, tmp1608
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1667
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC36(%rip), %r8	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1667,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %r9d	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%r9	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-65712(%rbp), %r13	#, tmp1660
	leaq	.LC83(%rip), %r8	#,
.L2740:
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r13, %rdi	# tmp1660,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
# sub.c:736:     gzFile file = gzopen(filename, mode);
	leaq	.LC76(%rip), %rsi	#, tmp1655
	movq	%r13, %rdi	# tmp1660,
	call	gzopen@PLT	#
# sub.c:737:     if (file == NULL)
	popq	%rdx	#
# sub.c:736:     gzFile file = gzopen(filename, mode);
	movq	%rax, -66368(%rbp)	# file, %sfp
# sub.c:737:     if (file == NULL)
	popq	%rcx	#
	testq	%rax, %rax	# file
	jne	.L914	#,
	jmp	.L913	#
	.p2align 4,,10
	.p2align 3
.L2769:
# sub.c:1031:     switch (test_case)
	testl	%ebx, %ebx	# test_case
	jne	.L761	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC29(%rip), %rsi	#, tmp1538
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1667
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC30(%rip), %r8	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1667,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %r15d	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%r15	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-65712(%rbp), %r13	#, tmp1660
	leaq	.LC75(%rip), %r8	#,
	jmp	.L2740	#
.L2753:
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:   return __builtin___memset_chk (__dest, __ch, __len,
	movl	$65536, %edx	#,
	xorl	%esi, %esi	#
	movq	%r12, %rdi	# tmp1661,
	call	memset@PLT	#
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	movq	-66320(%rbp), %rdi	# %sfp,
	movl	$65536, %edx	#,
	movq	%r12, %rsi	# tmp1661,
	call	gzgets@PLT	#
# sub.c:1207:         for (int j = 0; j < i; ++j)
	movl	$1, %ebx	#, j
# sub.c:1211:             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
	testq	%rax, %rax	# tmp3915
	jne	.L1873	#,
.L2348:
# sub.c:1213:                 if (gzeof(test_file))
	movq	-66320(%rbp), %rdi	# %sfp,
	call	gzeof@PLT	#
# sub.c:1213:                 if (gzeof(test_file))
	testl	%eax, %eax	# tmp3899
	je	.L2770	#,
.L753:
# sub.c:1474: }
	movq	-56(%rbp), %rax	# D.41454, tmp4168
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp4168
	jne	.L2771	#,
	leaq	-48(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%rcx	#
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	leaq	-8(%rcx), %rsp	#,
	.cfi_def_cfa 7, 8
	ret	
.L785:
	.cfi_restore_state
	movl	%edi, -66312(%rbp)	# n, %sfp
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC62(%rip), %rdi	#, tmp1339
	call	puts@PLT	#
# sub.c:1408:             fflush(stdout);
	movq	stdout(%rip), %rdi	# stdout,
	call	fflush@PLT	#
# sub.c:1409:             __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);
	xorl	%eax, %eax	# tmp1341
#APP
# 1409 "sub.c" 1
	cpuid
		
# 0 "" 2
# sub.c:1410:             TIME_RUSAGE(time_taken, limb_sub_n(a, b, &sub, n));
#NO_APP
	movq	-66224(%rbp), %r13	# b, b.130_105
	movq	-66288(%rbp), %r15	# a, a.131_106
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13), %r10	# MEM[(uint64_t *)b.130_105 + j_891 * 8], tmp4844
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %r9	# sub_space, sub_space
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %rdi	# sub_space_ptr, sub_space_ptr
	leaq	-1(%r12), %rsi	#, tmp1831
	andl	$7, %esi	#, tmp1833
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%r10, (%r15)	# tmp4844, MEM[(uint64_t *)a.131_106 + j_891 * 8]
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%r9,%rdi,8), %rcx	#, result
# sub.c:172:         if (likely(a[j] > b[j]))
	movl	-66312(%rbp), %r9d	# %sfp, n
	jbe	.L2772	#,
.L939:
	movq	%r13, %rdi	# b.130_105, b
	movq	%r15, %r10	# a.131_106, a
.L873:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r10), %zmm14	# MEM[(__m512i * {ref-all})a_913 + i_911 * 8], tmp4851
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %rsi	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi), %zmm14, %zmm15	# MEM[(__m512i * {ref-all})b_916 + i_911 * 8], tmp4851, tmp1378
	leaq	-1(%r12), %r11	#, tmp1827
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k4	#, zeros, tmp1378, tmp1380
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm15, %zmm4	# tmp1378, tmp1378
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %rsi	# borrow_space, bm
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm15, %zmm4{%k4}	# limb_digits, tmp1378, tmp1378, tmp1380, tmp1378
	shrq	$3, %r11	#, tmp1825
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm4, (%rcx)	# tmp1384, MEM[(__m512i * {ref-all})result_890 + i_911 * 8]
	andl	$3, %r11d	#, tmp1825
# sub.c:217:         i += 8;
	movl	$8, %ebx	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%rsi), %rdx	#, ivtmp.588
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, (%rsi)	# tmp1380, MEM[(__mmask8 *)_1307]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %r12	#, sub_size
	jbe	.L2388	#,
	testq	%r11, %r11	# tmp1828
	je	.L877	#,
	cmpq	$1, %r11	#, tmp1828
	je	.L2007	#,
	cmpq	$2, %r11	#, tmp1828
	jne	.L2773	#,
.L2008:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r10,%rbx,8), %zmm2	# MEM[(__m512i * {ref-all})a_913 + i_911 * 8], tmp5139
# sub.c:219:     } while (likely(i < n));
	incq	%rdx	# ivtmp.588
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rbx,8), %zmm2, %zmm5	# MEM[(__m512i * {ref-all})b_916 + i_911 * 8], tmp5139, tmp3496
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k6	#, zeros, tmp3496, tmp3498
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm5, %zmm6	# tmp3496, tmp3496
	vpaddq	limb_digits(%rip), %zmm5, %zmm6{%k6}	# limb_digits, tmp3496, tmp3496, tmp3498, tmp3496
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rcx,%rbx,8)	# tmp3500, MEM[(__m512i * {ref-all})result_890 + i_911 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rbx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, -1(%rdx)	# tmp3498, MEM[(__mmask8 *)_1307]
.L2007:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r10,%rbx,8), %zmm8	# MEM[(__m512i * {ref-all})a_913 + i_911 * 8], tmp5141
# sub.c:219:     } while (likely(i < n));
	incq	%rdx	# ivtmp.588
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rbx,8), %zmm8, %zmm9	# MEM[(__m512i * {ref-all})b_916 + i_911 * 8], tmp5141, tmp3502
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k7	#, zeros, tmp3502, tmp3504
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm9, %zmm10	# tmp3502, tmp3502
	vpaddq	limb_digits(%rip), %zmm9, %zmm10{%k7}	# limb_digits, tmp3502, tmp3502, tmp3504, tmp3502
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, (%rcx,%rbx,8)	# tmp3506, MEM[(__m512i * {ref-all})result_890 + i_911 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rbx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, -1(%rdx)	# tmp3504, MEM[(__mmask8 *)_1307]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rbx, %r12	# i, sub_size
	jbe	.L2388	#,
.L877:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r10,%rbx,8), %zmm11	# MEM[(__m512i * {ref-all})a_913 + i_911 * 8], tmp4853
# sub.c:217:         i += 8;
	leaq	8(%rbx), %rax	#, tmp1829
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rbx,8), %zmm11, %zmm12	# MEM[(__m512i * {ref-all})b_916 + i_911 * 8], tmp4853, tmp2555
# sub.c:217:         i += 8;
	leaq	16(%rbx), %r11	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k1	#, zeros, tmp2555, tmp2557
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm12, %zmm13	# tmp2555, tmp2555
# sub.c:217:         i += 8;
	leaq	24(%rbx), %r8	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm12, %zmm13{%k1}	# limb_digits, tmp2555, tmp2555, tmp2557, tmp2555
# sub.c:219:     } while (likely(i < n));
	addq	$4, %rdx	#, ivtmp.588
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rcx,%rbx,8)	# tmp2559, MEM[(__m512i * {ref-all})result_890 + i_911 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, -4(%rdx)	# tmp2557, MEM[(__mmask8 *)_1307]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r10,%rax,8), %zmm0	# MEM[(__m512i * {ref-all})a_913 + i_911 * 8], tmp4855
# sub.c:217:         i += 8;
	addq	$32, %rbx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rax,8), %zmm0, %zmm14	# MEM[(__m512i * {ref-all})b_916 + i_911 * 8], tmp4855, tmp2563
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k2	#, zeros, tmp2563, tmp2565
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm14, %zmm15	# tmp2563, tmp2563
	vpaddq	limb_digits(%rip), %zmm14, %zmm15{%k2}	# limb_digits, tmp2563, tmp2563, tmp2565, tmp2563
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, (%rcx,%rax,8)	# tmp2567, MEM[(__m512i * {ref-all})result_890 + i_911 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, -3(%rdx)	# tmp2565, MEM[(__mmask8 *)_1307]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r10,%r11,8), %zmm4	# MEM[(__m512i * {ref-all})a_913 + i_911 * 8], tmp4857
	vpsubq	(%rdi,%r11,8), %zmm4, %zmm7	# MEM[(__m512i * {ref-all})b_916 + i_911 * 8], tmp4857, tmp2571
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm7, %k3	#, zeros, tmp2571, tmp2573
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm7, %zmm3	# tmp2571, tmp2571
	vpaddq	limb_digits(%rip), %zmm7, %zmm3{%k3}	# limb_digits, tmp2571, tmp2571, tmp2573, tmp2571
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rcx,%r11,8)	# tmp2575, MEM[(__m512i * {ref-all})result_890 + i_911 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, -2(%rdx)	# tmp2573, MEM[(__mmask8 *)_1307]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r10,%r8,8), %zmm1	# MEM[(__m512i * {ref-all})a_913 + i_911 * 8], tmp4859
	vpsubq	(%rdi,%r8,8), %zmm1, %zmm2	# MEM[(__m512i * {ref-all})b_916 + i_911 * 8], tmp4859, tmp2579
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k4	#, zeros, tmp2579, tmp2581
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm2, %zmm5	# tmp2579, tmp2579
	vpaddq	limb_digits(%rip), %zmm2, %zmm5{%k4}	# limb_digits, tmp2579, tmp2579, tmp2581, tmp2579
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, (%rcx,%r8,8)	# tmp2583, MEM[(__m512i * {ref-all})result_890 + i_911 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, -1(%rdx)	# tmp2581, MEM[(__mmask8 *)_1307]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rbx, %r12	# i, sub_size
	ja	.L877	#,
.L2388:
# sub.c:218:         j++;
	leaq	-1(%r12), %rdi	#, tmp2547
	movq	%rdi, %r10	# tmp2547, tmp1392
	shrq	$3, %r10	#, tmp1392
	xorl	%ebx, %ebx	# j
	testl	%r9d, %r9d	# n
	setne	%bl	#, j
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	imull	%r10d, %ebx	# tmp1392, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm6	# zeros, tmp4861
	movslq	%ebx, %r11	# i, ivtmp.574
	vmovdqu64	%zmm6, (%rcx,%r12,8)	# tmp4861, MEM[(__m512i_u * {ref-all})_939]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%ebx, %ebx	# i
	js	.L881	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rsi,%r11), %eax	# MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1],
	movl	%r11d, %r8d	# ivtmp.574, tmp1823
	movl	%eax, %edx	#,
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movl	%r11d, %r10d	# ivtmp.574, tmp4161
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	addl	%eax, %eax	# tmp1396
	andl	$7, %r8d	#, tmp1823
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dl	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decl	%r10d	# tmp4161
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%al, (%rsi,%r11)	# tmp1396, MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-1(%r11), %rax	#, ivtmp.574
	js	.L881	#,
	testl	%r8d, %r8d	# tmp1823
	je	.L880	#,
	cmpl	$1, %r8d	#, tmp1823
	je	.L2001	#,
	cmpl	$2, %r8d	#, tmp1823
	je	.L2002	#,
	cmpl	$3, %r8d	#, tmp1823
	je	.L2003	#,
	cmpl	$4, %r8d	#, tmp1823
	je	.L2004	#,
	cmpl	$5, %r8d	#, tmp1823
	je	.L2005	#,
	cmpl	$6, %r8d	#, tmp1823
	je	.L2006	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rsi,%rax), %ebx	# MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rbx,%rbx), %r8d	#, tmp3463
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %edx	# tmp3463, tmp3464
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %bl	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%dl, (%rsi,%rax)	# tmp3464, MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%ebx, %edx	# temp, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-2(%r11), %rax	#, ivtmp.574
.L2006:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rsi,%rax), %r11d	# MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r11,%r11), %r10d	#, tmp3467
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %edx	# tmp3467, tmp3468
	movb	%dl, (%rsi,%rax)	# tmp3468, MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r11d, %edx	# temp, temp
	shrb	$7, %dl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rax	# ivtmp.574
.L2005:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rsi,%rax), %ebx	# MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rbx,%rbx), %r8d	#, tmp3471
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %edx	# tmp3471, tmp3472
	movb	%dl, (%rsi,%rax)	# tmp3472, MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%ebx, %edx	# temp, temp
	shrb	$7, %dl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rax	# ivtmp.574
.L2004:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rsi,%rax), %r11d	# MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r11,%r11), %r10d	#, tmp3475
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %edx	# tmp3475, tmp3476
	movb	%dl, (%rsi,%rax)	# tmp3476, MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r11d, %edx	# temp, temp
	shrb	$7, %dl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rax	# ivtmp.574
.L2003:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rsi,%rax), %ebx	# MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rbx,%rbx), %r8d	#, tmp3479
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %edx	# tmp3479, tmp3480
	movb	%dl, (%rsi,%rax)	# tmp3480, MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%ebx, %edx	# temp, temp
	shrb	$7, %dl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rax	# ivtmp.574
.L2002:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rsi,%rax), %r11d	# MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r11,%r11), %r10d	#, tmp3483
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %edx	# tmp3483, tmp3484
	movb	%dl, (%rsi,%rax)	# tmp3484, MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r11d, %edx	# temp, temp
	shrb	$7, %dl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rax	# ivtmp.574
.L2001:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rsi,%rax), %ebx	# MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rbx,%rbx), %r8d	#, tmp3487
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %edx	# tmp3487, tmp3488
	movb	%dl, (%rsi,%rax)	# tmp3488, MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%ebx, %edx	# temp, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rax	# ivtmp.574
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%eax, %eax	# ivtmp.574
	js	.L881	#,
.L880:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rsi,%rax), %r11d	# MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1], temp
	movzbl	-1(%rsi,%rax), %r8d	# MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r11,%r11), %r10d	#, tmp2589
	leal	(%r8,%r8), %ebx	#, tmp2595
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r11b	#, carry
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%ebx, %r11d	# tmp2595, tmp2596
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r8b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r11b, -1(%rsi,%rax)	# tmp2596, MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %r11d	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-2(%rsi,%rax), %r8d	# MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %edx	# tmp2589, tmp2590
	movb	%dl, (%rsi,%rax)	# tmp2590, MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1]
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %edx	#, tmp2601
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r8b	#, temp
	movl	%r8d, %ebx	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-3(%rsi,%rax), %r8d	# MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edx, %r11d	# tmp2601, tmp2602
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %r10d	#, tmp2607
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r8b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r11b, -2(%rsi,%rax)	# tmp2602, MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %r11d	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-4(%rsi,%rax), %r8d	# MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %ebx	# tmp2607, tmp2608
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %edx	#, tmp2613
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r8b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%bl, -3(%rsi,%rax)	# tmp2608, MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %ebx	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-5(%rsi,%rax), %r8d	# MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edx, %r11d	# tmp2613, tmp2614
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %r10d	#, tmp2619
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r8b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r11b, -4(%rsi,%rax)	# tmp2614, MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %r11d	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-6(%rsi,%rax), %r8d	# MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %ebx	# tmp2619, tmp2620
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %edx	#, tmp2625
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edx, %r11d	# tmp2625, tmp2626
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-7(%rsi,%rax), %edx	# MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r8b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%bl, -5(%rsi,%rax)	# tmp2620, MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1]
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rdx,%rdx), %r10d	#, tmp2631
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %ebx	# temp, carry
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %ebx	# tmp2631, tmp2632
	movb	%r11b, -6(%rsi,%rax)	# tmp2626, MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1]
	movb	%bl, -7(%rsi,%rax)	# tmp2632, MEM[(__mmask8 *)bm_910 + ivtmp.574_1068 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	subq	$8, %rax	#, ivtmp.574
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dl	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%eax, %eax	# ivtmp.574
	jns	.L880	#,
.L881:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rcx), %zmm8	# MEM[(__m512i * {ref-all})result_890 + i_2209 * 8], _2205
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %eax	# MEM[(__mmask8 *)_1333], MEM[(__mmask8 *)_1333]
	leaq	-1(%r12), %rdx	#, tmp1818
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%eax, %k5	# MEM[(__mmask8 *)_1333], tmp4866
	vpsubq	ones(%rip), %zmm8, %zmm8{%k5}	# ones, _2205, tmp1398, tmp4866, _2205
	shrq	$3, %rdx	#, tmp1816
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rcx)	# tmp1398, MEM[(__m512i * {ref-all})result_890 + i_2209 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm8, %k0	#, zeros, tmp1398, tmp1404
	andl	$3, %edx	#, tmp1816
	movq	%rdx, %r11	# tmp1816, tmp1819
	kmovb	%k0, %r8d	# tmp1404, tmp1404
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%r8b, %r8b	# tmp1404
	jne	.L2774	#,
.L1490:
# sub.c:249:         i += 8;
	movl	$8, %ebx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.571
	cmpq	$8, %r12	#, sub_size
	jbe	.L2723	#,
	testq	%r11, %r11	# tmp1819
	je	.L879	#,
	cmpq	$1, %r11	#, tmp1819
	je	.L1999	#,
	cmpq	$2, %r11	#, tmp1819
	je	.L2000	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rcx,%rbx,8), %zmm9	# MEM[(__m512i * {ref-all})result_890 + i_2209 * 8], _2205
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %r10d	# MEM[(__mmask8 *)_1333], MEM[(__mmask8 *)_1333]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r10d, %k6	# MEM[(__mmask8 *)_1333], tmp5122
	vpsubq	ones(%rip), %zmm9, %zmm9{%k6}	# ones, _2205, tmp3430, tmp5122, _2205
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rcx,%rbx,8)	# tmp3430, MEM[(__m512i * {ref-all})result_890 + i_2209 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k7	#, zeros, tmp3430, tmp3432
	kmovb	%k7, %edx	# tmp3432, tmp3432
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%dl, %dl	# tmp3432
	jne	.L2775	#,
.L1492:
# sub.c:249:         i += 8;
	addq	$8, %rbx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.571
.L2000:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rcx,%rbx,8), %zmm10	# MEM[(__m512i * {ref-all})result_890 + i_2209 * 8], _2205
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %r11d	# MEM[(__mmask8 *)_1333], MEM[(__mmask8 *)_1333]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r11d, %k1	# MEM[(__mmask8 *)_1333], tmp5124
	vpsubq	ones(%rip), %zmm10, %zmm10{%k1}	# ones, _2205, tmp3436, tmp5124, _2205
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, (%rcx,%rbx,8)	# tmp3436, MEM[(__m512i * {ref-all})result_890 + i_2209 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k2	#, zeros, tmp3436, tmp3438
	kmovb	%k2, %eax	# tmp3438, tmp3438
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%al, %al	# tmp3438
	jne	.L2776	#,
.L1495:
# sub.c:249:         i += 8;
	addq	$8, %rbx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.571
.L1999:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rcx,%rbx,8), %zmm11	# MEM[(__m512i * {ref-all})result_890 + i_2209 * 8], _2205
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %r8d	# MEM[(__mmask8 *)_1333], MEM[(__mmask8 *)_1333]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k3	# MEM[(__mmask8 *)_1333], tmp5126
	vpsubq	ones(%rip), %zmm11, %zmm11{%k3}	# ones, _2205, tmp3442, tmp5126, _2205
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rcx,%rbx,8)	# tmp3442, MEM[(__m512i * {ref-all})result_890 + i_2209 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm11, %k4	#, zeros, tmp3442, tmp3444
	kmovb	%k4, %r10d	# tmp3444, tmp3444
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%r10b, %r10b	# tmp3444
	jne	.L2777	#,
.L1498:
# sub.c:249:         i += 8;
	addq	$8, %rbx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.571
	cmpq	%rbx, %r12	# i, sub_size
	ja	.L879	#,
.L2723:
	vzeroupper
.L883:
# sub.c:218:         j++;
	shrq	$3, %rdi	#, tmp1372
	xorl	%ecx, %ecx	# j
	testl	%r9d, %r9d	# n
	setne	%cl	#, j
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	imull	%edi, %ecx	# tmp1372, j
	leaq	-66192(%rbp), %r9	#, tmp2549
	movq	%r9, -66328(%rbp)	# tmp2549, %sfp
	movl	%ecx, -66312(%rbp)	# i, %sfp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movl	$1, %edi	#, __times
	movq	%r14, -66344(%rbp)	# _63, %sfp
	movslq	%ecx, %rbx	# i, ivtmp.540
	movq	%rdi, %r14	# __times, __times
	.p2align 4,,10
	.p2align 3
.L875:
# sub.c:1553:     getrusage(RUSAGE_SELF, &rus);
	movq	-66328(%rbp), %rsi	# %sfp,
	xorl	%edi, %edi	#
	call	getrusage@PLT	#
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	movq	-66184(%rbp), %r8	# MEM[(struct rusage *)_2061].ru_utime.tv_usec, MEM[(struct rusage *)_2061].ru_utime.tv_usec
	movabsq	$2361183241434822607, %rax	#, tmp4162
	imulq	%r8	# MEM[(struct rusage *)_2061].ru_utime.tv_usec
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	imull	$1000, -66192(%rbp), %r11d	#, MEM[(struct rusage *)_2061].ru_utime.tv_sec, tmp1410
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	sarq	$63, %r8	#, tmp1416
	sarq	$7, %rdx	#, tmp1415
	subq	%r8, %rdx	# tmp1416, tmp1411
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	addl	%edx, %r11d	# tmp1411, _983
# sub.c:1410:             TIME_RUSAGE(time_taken, limb_sub_n(a, b, &sub, n));
	movslq	%r11d, %r10	# _983, __t0
	addq	%r14, %r14	# __times
	movq	%r10, -66336(%rbp)	# __t0, %sfp
	movq	-66344(%rbp), %r8	# %sfp, _63
	xorl	%r11d, %r11d	# __t
	testq	%r14, %r14	# __times
	jle	.L888	#,
	.p2align 4,,10
	.p2align 3
.L884:
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %rsi	# sub_space_ptr, sub_space_ptr
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %rcx	# sub_space, sub_space
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13), %rdi	# MEM[(uint64_t *)b.130_105 + j_989 * 8], tmp4879
	leaq	-1(%r12), %r9	#, tmp1812
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%rcx,%rsi,8), %rax	#, result
	andl	$7, %r9d	#, tmp1814
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%rdi, (%r15)	# tmp4879, MEM[(uint64_t *)a.131_106 + j_989 * 8]
	jbe	.L2778	#,
.L942:
	movq	%r13, %rdi	# b.130_105, b
	movq	%r15, %r9	# a.131_106, a
.L886:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9), %zmm15	# MEM[(__m512i * {ref-all})a_1011 + i_1009 * 8], tmp4882
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %rdx	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi), %zmm15, %zmm4	# MEM[(__m512i * {ref-all})b_1014 + i_1009 * 8], tmp4882, tmp1434
	leaq	-1(%r12), %r10	#, tmp1808
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm4, %k5	#, zeros, tmp1434, tmp1436
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm4, %zmm7	# tmp1434, tmp1434
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %rdx	# borrow_space, bm
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm4, %zmm7{%k5}	# limb_digits, tmp1434, tmp1434, tmp1436, tmp1434
	shrq	$3, %r10	#, tmp1806
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm7, (%rax)	# tmp1440, MEM[(__m512i * {ref-all})result_988 + i_1009 * 8]
	andl	$3, %r10d	#, tmp1809
# sub.c:217:         i += 8;
	movl	$8, %ecx	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%rdx), %rsi	#, ivtmp.554
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, (%rdx)	# tmp1436, MEM[(__mmask8 *)_1332]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %r12	#, sub_size
	jbe	.L2394	#,
	testq	%r10, %r10	# tmp1809
	je	.L890	#,
	cmpq	$1, %r10	#, tmp1809
	je	.L1989	#,
	cmpq	$2, %r10	#, tmp1809
	je	.L1990	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%r9), %zmm3	# MEM[(__m512i * {ref-all})a_1011 + i_1009 * 8], tmp5103
# sub.c:217:         i += 8;
	movl	$16, %ecx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%rdi), %zmm3, %zmm2	# MEM[(__m512i * {ref-all})b_1014 + i_1009 * 8], tmp5103, tmp3378
# sub.c:219:     } while (likely(i < n));
	leaq	2(%rdx), %rsi	#, ivtmp.554
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k6	#, zeros, tmp3378, tmp3380
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm2, %zmm1	# tmp3378, tmp3378
	vpaddq	limb_digits(%rip), %zmm2, %zmm1{%k6}	# limb_digits, tmp3378, tmp3378, tmp3380, tmp3378
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, 64(%rax)	# tmp3382, MEM[(__m512i * {ref-all})result_988 + i_1009 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, 1(%rdx)	# tmp3380, MEM[(__mmask8 *)_1332]
.L1990:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9,%rcx,8), %zmm5	# MEM[(__m512i * {ref-all})a_1011 + i_1009 * 8], tmp5105
# sub.c:219:     } while (likely(i < n));
	incq	%rsi	# ivtmp.554
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rcx,8), %zmm5, %zmm6	# MEM[(__m512i * {ref-all})b_1014 + i_1009 * 8], tmp5105, tmp3384
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k7	#, zeros, tmp3384, tmp3386
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm6, %zmm8	# tmp3384, tmp3384
	vpaddq	limb_digits(%rip), %zmm6, %zmm8{%k7}	# limb_digits, tmp3384, tmp3384, tmp3386, tmp3384
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rax,%rcx,8)	# tmp3388, MEM[(__m512i * {ref-all})result_988 + i_1009 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, -1(%rsi)	# tmp3386, MEM[(__mmask8 *)_1332]
.L1989:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9,%rcx,8), %zmm9	# MEM[(__m512i * {ref-all})a_1011 + i_1009 * 8], tmp5107
# sub.c:219:     } while (likely(i < n));
	incq	%rsi	# ivtmp.554
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rcx,8), %zmm9, %zmm10	# MEM[(__m512i * {ref-all})b_1014 + i_1009 * 8], tmp5107, tmp3390
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k1	#, zeros, tmp3390, tmp3392
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm10, %zmm11	# tmp3390, tmp3390
	vpaddq	limb_digits(%rip), %zmm10, %zmm11{%k1}	# limb_digits, tmp3390, tmp3390, tmp3392, tmp3390
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rax,%rcx,8)	# tmp3394, MEM[(__m512i * {ref-all})result_988 + i_1009 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, -1(%rsi)	# tmp3392, MEM[(__mmask8 *)_1332]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rcx, %r12	# i, sub_size
	jbe	.L2394	#,
.L890:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9,%rcx,8), %zmm12	# MEM[(__m512i * {ref-all})a_1011 + i_1009 * 8], tmp4884
# sub.c:217:         i += 8;
	leaq	8(%rcx), %r10	#, tmp1810
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rcx,8), %zmm12, %zmm13	# MEM[(__m512i * {ref-all})b_1014 + i_1009 * 8], tmp4884, tmp2658
# sub.c:219:     } while (likely(i < n));
	addq	$4, %rsi	#, ivtmp.554
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k2	#, zeros, tmp2658, tmp2660
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm13, %zmm0	# tmp2658, tmp2658
	vpaddq	limb_digits(%rip), %zmm13, %zmm0{%k2}	# limb_digits, tmp2658, tmp2658, tmp2660, tmp2658
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rax,%rcx,8)	# tmp2662, MEM[(__m512i * {ref-all})result_988 + i_1009 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, -4(%rsi)	# tmp2660, MEM[(__mmask8 *)_1332]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9,%r10,8), %zmm14	# MEM[(__m512i * {ref-all})a_1011 + i_1009 * 8], tmp4886
	vpsubq	(%rdi,%r10,8), %zmm14, %zmm15	# MEM[(__m512i * {ref-all})b_1014 + i_1009 * 8], tmp4886, tmp2666
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k3	#, zeros, tmp2666, tmp2668
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm15, %zmm4	# tmp2666, tmp2666
	vpaddq	limb_digits(%rip), %zmm15, %zmm4{%k3}	# limb_digits, tmp2666, tmp2666, tmp2668, tmp2666
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm4, (%rax,%r10,8)	# tmp2670, MEM[(__m512i * {ref-all})result_988 + i_1009 * 8]
# sub.c:217:         i += 8;
	leaq	16(%rcx), %r10	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, -3(%rsi)	# tmp2668, MEM[(__mmask8 *)_1332]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9,%r10,8), %zmm7	# MEM[(__m512i * {ref-all})a_1011 + i_1009 * 8], tmp4888
	vpsubq	(%rdi,%r10,8), %zmm7, %zmm3	# MEM[(__m512i * {ref-all})b_1014 + i_1009 * 8], tmp4888, tmp2674
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k4	#, zeros, tmp2674, tmp2676
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm3, %zmm2	# tmp2674, tmp2674
	vpaddq	limb_digits(%rip), %zmm3, %zmm2{%k4}	# limb_digits, tmp2674, tmp2674, tmp2676, tmp2674
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, (%rax,%r10,8)	# tmp2678, MEM[(__m512i * {ref-all})result_988 + i_1009 * 8]
# sub.c:217:         i += 8;
	leaq	24(%rcx), %r10	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, -2(%rsi)	# tmp2676, MEM[(__mmask8 *)_1332]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9,%r10,8), %zmm1	# MEM[(__m512i * {ref-all})a_1011 + i_1009 * 8], tmp4890
# sub.c:217:         i += 8;
	addq	$32, %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%r10,8), %zmm1, %zmm5	# MEM[(__m512i * {ref-all})b_1014 + i_1009 * 8], tmp4890, tmp2682
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k5	#, zeros, tmp2682, tmp2684
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm5, %zmm6	# tmp2682, tmp2682
	vpaddq	limb_digits(%rip), %zmm5, %zmm6{%k5}	# limb_digits, tmp2682, tmp2682, tmp2684, tmp2682
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rax,%r10,8)	# tmp2686, MEM[(__m512i * {ref-all})result_988 + i_1009 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, -1(%rsi)	# tmp2684, MEM[(__mmask8 *)_1332]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rcx, %r12	# i, sub_size
	ja	.L890	#,
.L2394:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm8	# zeros, tmp4892
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movl	-66312(%rbp), %edi	# %sfp,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqu64	%zmm8, (%rax,%r8)	# tmp4892, MEM[(__m512i_u * {ref-all})_1036]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%edi, %edi	#
	js	.L893	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rbx), %ecx	# MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1],
	movl	%ebx, %r9d	# ivtmp.540, tmp1804
	movl	%ecx, %esi	#,
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movl	%ebx, %r10d	# ivtmp.540, tmp4164
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	addl	%ecx, %ecx	# tmp1447
	andl	$7, %r9d	#, tmp1804
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decl	%r10d	# tmp4164
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%cl, (%rdx,%rbx)	# tmp1447, MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-1(%rbx), %rcx	#, ivtmp.540
	js	.L893	#,
	testl	%r9d, %r9d	# tmp1804
	je	.L891	#,
	cmpl	$1, %r9d	#, tmp1804
	je	.L1983	#,
	cmpl	$2, %r9d	#, tmp1804
	je	.L1984	#,
	cmpl	$3, %r9d	#, tmp1804
	je	.L1985	#,
	cmpl	$4, %r9d	#, tmp1804
	je	.L1986	#,
	cmpl	$5, %r9d	#, tmp1804
	je	.L1987	#,
	cmpl	$6, %r9d	#, tmp1804
	je	.L1988	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-1(%rdx,%rbx), %edi	# MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1], temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-2(%rbx), %rcx	#, ivtmp.540
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rdi,%rdi), %r9d	#, tmp3351
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%esi, %r9d	# carry, tmp3352
	movb	%r9b, -1(%rdx,%rbx)	# tmp3352, MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1]
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
	movl	%edi, %esi	# temp, carry
.L1988:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r10d	# MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r10,%r10), %edi	#, tmp3355
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %esi	# tmp3355, tmp3356
	movb	%sil, (%rdx,%rcx)	# tmp3356, MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r10d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.540
.L1987:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %r10d	#, tmp3359
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %esi	# tmp3359, tmp3360
	movb	%sil, (%rdx,%rcx)	# tmp3360, MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.540
.L1986:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %edi	#, tmp3363
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %esi	# tmp3363, tmp3364
	movb	%sil, (%rdx,%rcx)	# tmp3364, MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.540
.L1985:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r10d	# MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r10,%r10), %r9d	#, tmp3367
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %esi	# tmp3367, tmp3368
	movb	%sil, (%rdx,%rcx)	# tmp3368, MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r10d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.540
.L1984:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r10d	# MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r10,%r10), %edi	#, tmp3371
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %esi	# tmp3371, tmp3372
	movb	%sil, (%rdx,%rcx)	# tmp3372, MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r10d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.540
.L1983:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %r10d	#, tmp3375
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %esi	# tmp3375, tmp3376
	movb	%sil, (%rdx,%rcx)	# tmp3376, MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.540
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%ecx, %ecx	# ivtmp.540
	js	.L893	#,
.L891:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %edi	# MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rdi,%rdi), %r9d	#, tmp2691
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %esi	# tmp2691, tmp2692
	movb	%sil, (%rdx,%rcx)	# tmp2692, MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1]
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-1(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, carry
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r10d	#, tmp2697
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %edi	# tmp2697, tmp2698
	movb	%dil, -1(%rdx,%rcx)	# tmp2698, MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-2(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp2703
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %edi	# tmp2703, tmp2704
	movb	%dil, -2(%rdx,%rcx)	# tmp2704, MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-3(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r10d	#, tmp2709
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %edi	# tmp2709, tmp2710
	movb	%dil, -3(%rdx,%rcx)	# tmp2710, MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-4(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp2715
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %edi	# tmp2715, tmp2716
	movb	%dil, -4(%rdx,%rcx)	# tmp2716, MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-5(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r10d	#, tmp2721
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %edi	# tmp2721, tmp2722
	movb	%dil, -5(%rdx,%rcx)	# tmp2722, MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-6(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp2727
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %edi	# tmp2727, tmp2728
	movb	%dil, -6(%rdx,%rcx)	# tmp2728, MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-7(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r10d	#, tmp2733
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %edi	# tmp2733, tmp2734
	movb	%dil, -7(%rdx,%rcx)	# tmp2734, MEM[(__mmask8 *)bm_1008 + ivtmp.540_1173 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	subq	$8, %rcx	#, ivtmp.540
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%ecx, %ecx	# ivtmp.540
	jns	.L891	#,
.L893:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax), %zmm9	# MEM[(__m512i * {ref-all})result_988 + i_2246 * 8], _2225
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rdx), %ecx	# MEM[(__mmask8 *)_1327], MEM[(__mmask8 *)_1327]
	leaq	-1(%r12), %rdi	#, tmp1799
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k6	# MEM[(__mmask8 *)_1327], tmp4897
	vpsubq	ones(%rip), %zmm9, %zmm9{%k6}	# ones, _2225, tmp1449, tmp4897, _2225
	shrq	$3, %rdi	#, tmp1797
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rax)	# tmp1449, MEM[(__m512i * {ref-all})result_988 + i_2246 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k0	#, zeros, tmp1449, tmp1455
	movq	%rdi, %r9	# tmp1797, tmp1797
	andl	$3, %r9d	#, tmp1797
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp1455
	jne	.L2779	#,
.L1404:
# sub.c:249:         i += 8;
	movl	$8, %r10d	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rdx), %rsi	#, ivtmp.537
	cmpq	$8, %r12	#, sub_size
	jbe	.L895	#,
	testq	%r9, %r9	# tmp1800
	je	.L892	#,
	cmpq	$1, %r9	#, tmp1800
	je	.L1981	#,
	cmpq	$2, %r9	#, tmp1800
	je	.L1982	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	64(%rax), %zmm10	# MEM[(__m512i * {ref-all})result_988 + i_2246 * 8], _2225
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rdx), %edi	# MEM[(__mmask8 *)_1327], MEM[(__mmask8 *)_1327]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k7	# MEM[(__mmask8 *)_1327], tmp5091
	vpsubq	ones(%rip), %zmm10, %zmm10{%k7}	# ones, _2225, tmp3318, tmp5091, _2225
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, 64(%rax)	# tmp3318, MEM[(__m512i * {ref-all})result_988 + i_2246 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k1	#, zeros, tmp3318, tmp3320
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k1, %k1	# tmp3320
	jne	.L2780	#,
.L1406:
# sub.c:249:         i += 8;
	addq	$8, %r10	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.537
.L1982:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r10,8), %zmm11	# MEM[(__m512i * {ref-all})result_988 + i_2246 * 8], _2225
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %edx	# MEM[(__mmask8 *)_1327], MEM[(__mmask8 *)_1327]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edx, %k2	# MEM[(__mmask8 *)_1327], tmp5092
	vpsubq	ones(%rip), %zmm11, %zmm11{%k2}	# ones, _2225, tmp3324, tmp5092, _2225
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rax,%r10,8)	# tmp3324, MEM[(__m512i * {ref-all})result_988 + i_2246 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm11, %k3	#, zeros, tmp3324, tmp3326
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k3, %k3	# tmp3326
	jne	.L2781	#,
.L1409:
# sub.c:249:         i += 8;
	addq	$8, %r10	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.537
.L1981:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r10,8), %zmm12	# MEM[(__m512i * {ref-all})result_988 + i_2246 * 8], _2225
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %r9d	# MEM[(__mmask8 *)_1327], MEM[(__mmask8 *)_1327]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k4	# MEM[(__mmask8 *)_1327], tmp5093
	vpsubq	ones(%rip), %zmm12, %zmm12{%k4}	# ones, _2225, tmp3330, tmp5093, _2225
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm12, (%rax,%r10,8)	# tmp3330, MEM[(__m512i * {ref-all})result_988 + i_2246 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k5	#, zeros, tmp3330, tmp3332
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k5, %k5	# tmp3332
	jne	.L2782	#,
.L1412:
# sub.c:249:         i += 8;
	addq	$8, %r10	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.537
	cmpq	%r10, %r12	# i, sub_size
	ja	.L892	#,
	jmp	.L895	#
	.p2align 4,,10
	.p2align 3
.L894:
# sub.c:249:         i += 8;
	addq	$8, %r10	#, tmp1801
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r10,8), %zmm0	# MEM[(__m512i * {ref-all})result_988 + i_2246 * 8], _2225
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rsi), %edi	# MEM[(__mmask8 *)_1327], MEM[(__mmask8 *)_1327]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rsi), %rdx	#, tmp1802
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k7	# MEM[(__mmask8 *)_1327], tmp4905
	vpsubq	ones(%rip), %zmm0, %zmm0{%k7}	# ones, _2225, tmp2748, tmp4905, _2225
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rax,%r10,8)	# tmp2748, MEM[(__m512i * {ref-all})result_988 + i_2246 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k1	#, zeros, tmp2748, tmp2750
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k1, %k1	# tmp2750
	jne	.L2783	#,
.L1415:
# sub.c:249:         i += 8;
	leaq	8(%r10), %rsi	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rsi,8), %zmm14	# MEM[(__m512i * {ref-all})result_988 + i_2246 * 8], _2225
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rdx), %r9d	# MEM[(__mmask8 *)_1327], MEM[(__mmask8 *)_1327]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k2	# MEM[(__mmask8 *)_1327], tmp5094
	vpsubq	ones(%rip), %zmm14, %zmm14{%k2}	# ones, _2225, tmp3338, tmp5094, _2225
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rax,%rsi,8)	# tmp3338, MEM[(__m512i * {ref-all})result_988 + i_2246 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k3	#, zeros, tmp3338, tmp3340
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k3, %k3	# tmp3340
	jne	.L2784	#,
.L1417:
# sub.c:249:         i += 8;
	leaq	16(%r10), %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm15	# MEM[(__m512i * {ref-all})result_988 + i_2246 * 8], _2225
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%rdx), %edi	# MEM[(__mmask8 *)_1327], MEM[(__mmask8 *)_1327]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k4	# MEM[(__mmask8 *)_1327], tmp5095
	vpsubq	ones(%rip), %zmm15, %zmm15{%k4}	# ones, _2225, tmp3346, tmp5095, _2225
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, (%rax,%rcx,8)	# tmp3346, MEM[(__m512i * {ref-all})result_988 + i_2246 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k5	#, zeros, tmp3346, tmp3348
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k5, %k5	# tmp3348
	jne	.L2785	#,
.L1419:
# sub.c:249:         i += 8;
	addq	$24, %r10	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%rdx), %rsi	#, ivtmp.537
	cmpq	%r10, %r12	# i, sub_size
	jbe	.L895	#,
.L892:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r10,8), %zmm13	# MEM[(__m512i * {ref-all})result_988 + i_2246 * 8], _2225
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %ecx	# MEM[(__mmask8 *)_1327], MEM[(__mmask8 *)_1327]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k6	# MEM[(__mmask8 *)_1327], tmp4904
	vpsubq	ones(%rip), %zmm13, %zmm13{%k6}	# ones, _2225, tmp2740, tmp4904, _2225
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rax,%r10,8)	# tmp2740, MEM[(__m512i * {ref-all})result_988 + i_2246 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k0	#, zeros, tmp2740, tmp2742
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp2742
	je	.L894	#,
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rsi)	# tmp2742, MEM[(__mmask8 *)_1327]
	jmp	.L894	#
.L771:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC33(%rip), %rsi	#, tmp1628
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1667
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC34(%rip), %r8	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1667,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %r8d	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%r8	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-65712(%rbp), %r13	#, tmp1660
	leaq	.LC85(%rip), %r8	#,
	jmp	.L2740	#
.L759:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC29(%rip), %rsi	#, tmp1548
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1667
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC30(%rip), %r8	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1667,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %ebx	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%rbx	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-66048(%rbp), %r13	#, tmp1663
	leaq	.LC77(%rip), %r8	#,
	jmp	.L2731	#
.L2789:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rsi)	# tmp2640, MEM[(__mmask8 *)_1333]
.L882:
# sub.c:249:         i += 8;
	addq	$8, %rbx	#, tmp1820
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rcx,%rbx,8), %zmm13	# MEM[(__m512i * {ref-all})result_890 + i_2209 * 8], _2205
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rsi), %eax	# MEM[(__mmask8 *)_1333], MEM[(__mmask8 *)_1333]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rsi), %r11	#, tmp1821
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%eax, %k6	# MEM[(__mmask8 *)_1333], tmp4875
	vpsubq	ones(%rip), %zmm13, %zmm13{%k6}	# ones, _2205, tmp2646, tmp4875, _2205
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rcx,%rbx,8)	# tmp2646, MEM[(__m512i * {ref-all})result_890 + i_2209 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k7	#, zeros, tmp2646, tmp2648
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k7, %k7	# tmp2648
	jne	.L2786	#,
.L1501:
# sub.c:249:         i += 8;
	leaq	8(%rbx), %rsi	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rcx,%rsi,8), %zmm0	# MEM[(__m512i * {ref-all})result_890 + i_2209 * 8], _2205
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%r11), %r8d	# MEM[(__mmask8 *)_1333], MEM[(__mmask8 *)_1333]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k1	# MEM[(__mmask8 *)_1333], tmp5128
	vpsubq	ones(%rip), %zmm0, %zmm0{%k1}	# ones, _2205, tmp3450, tmp5128, _2205
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rcx,%rsi,8)	# tmp3450, MEM[(__m512i * {ref-all})result_890 + i_2209 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k2	#, zeros, tmp3450, tmp3452
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k2, %k2	# tmp3452
	jne	.L2787	#,
.L1503:
# sub.c:249:         i += 8;
	leaq	16(%rbx), %r10	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rcx,%r10,8), %zmm14	# MEM[(__m512i * {ref-all})result_890 + i_2209 * 8], _2205
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%r11), %edx	# MEM[(__mmask8 *)_1333], MEM[(__mmask8 *)_1333]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edx, %k3	# MEM[(__mmask8 *)_1333], tmp5129
	vpsubq	ones(%rip), %zmm14, %zmm14{%k3}	# ones, _2205, tmp3458, tmp5129, _2205
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rcx,%r10,8)	# tmp3458, MEM[(__m512i * {ref-all})result_890 + i_2209 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k4	#, zeros, tmp3458, tmp3460
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k4, %k4	# tmp3460
	jne	.L2788	#,
.L1505:
# sub.c:249:         i += 8;
	addq	$24, %rbx	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%r11), %rsi	#, ivtmp.571
	cmpq	%rbx, %r12	# i, sub_size
	jbe	.L2723	#,
.L879:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rcx,%rbx,8), %zmm12	# MEM[(__m512i * {ref-all})result_890 + i_2209 * 8], _2205
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %edx	# MEM[(__mmask8 *)_1333], MEM[(__mmask8 *)_1333]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edx, %k5	# MEM[(__mmask8 *)_1333], tmp4874
	vpsubq	ones(%rip), %zmm12, %zmm12{%k5}	# ones, _2205, tmp2638, tmp4874, _2205
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm12, (%rcx,%rbx,8)	# tmp2638, MEM[(__m512i * {ref-all})result_890 + i_2209 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k0	#, zeros, tmp2638, tmp2640
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp2640
	je	.L882	#,
	jmp	.L2789	#
.L2793:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rax)	# tmp2017, MEM[(__mmask8 *)_667]
.L798:
# sub.c:249:         i += 8;
	addq	$8, %r11	#, tmp1762
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%r11,8), %zmm6	# MEM[(__m512i * {ref-all})result_315 + i_2149 * 8], _2145
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rax), %r13d	# MEM[(__mmask8 *)_667], MEM[(__mmask8 *)_667]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rax), %rdi	#, tmp1763
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r13d, %k2	# MEM[(__mmask8 *)_667], tmp4662
	vpsubq	ones(%rip), %zmm6, %zmm6{%k2}	# ones, _2145, tmp2023, tmp4662, _2145
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rdx,%r11,8)	# tmp2023, MEM[(__m512i * {ref-all})result_315 + i_2149 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k3	#, zeros, tmp2023, tmp2025
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k3, %k3	# tmp2025
	jne	.L2790	#,
.L1242:
# sub.c:249:         i += 8;
	leaq	8(%r11), %rax	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%rax,8), %zmm0	# MEM[(__m512i * {ref-all})result_315 + i_2149 * 8], _2145
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rdi), %r8d	# MEM[(__mmask8 *)_667], MEM[(__mmask8 *)_667]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k4	# MEM[(__mmask8 *)_667], tmp5025
	vpsubq	ones(%rip), %zmm0, %zmm0{%k4}	# ones, _2145, tmp3108, tmp5025, _2145
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rdx,%rax,8)	# tmp3108, MEM[(__m512i * {ref-all})result_315 + i_2149 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k5	#, zeros, tmp3108, tmp3110
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k5, %k5	# tmp3110
	jne	.L2791	#,
.L1244:
# sub.c:249:         i += 8;
	leaq	16(%r11), %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%rcx,8), %zmm8	# MEM[(__m512i * {ref-all})result_315 + i_2149 * 8], _2145
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%rdi), %r10d	# MEM[(__mmask8 *)_667], MEM[(__mmask8 *)_667]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r10d, %k6	# MEM[(__mmask8 *)_667], tmp5026
	vpsubq	ones(%rip), %zmm8, %zmm8{%k6}	# ones, _2145, tmp3116, tmp5026, _2145
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rdx,%rcx,8)	# tmp3116, MEM[(__m512i * {ref-all})result_315 + i_2149 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm8, %k7	#, zeros, tmp3116, tmp3118
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k7, %k7	# tmp3118
	jne	.L2792	#,
.L1246:
# sub.c:249:         i += 8;
	addq	$24, %r11	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%rdi), %rax	#, ivtmp.674
	cmpq	%r11, %r12	# i, sub_size
	jbe	.L799	#,
.L795:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rdx,%r11,8), %zmm5	# MEM[(__m512i * {ref-all})result_315 + i_2149 * 8], _2145
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rax), %ebx	# MEM[(__mmask8 *)_667], MEM[(__mmask8 *)_667]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ebx, %k1	# MEM[(__mmask8 *)_667], tmp4661
	vpsubq	ones(%rip), %zmm5, %zmm5{%k1}	# ones, _2145, tmp2015, tmp4661, _2145
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, (%rdx,%r11,8)	# tmp2015, MEM[(__m512i * {ref-all})result_315 + i_2149 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k0	#, zeros, tmp2015, tmp2017
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp2017
	je	.L798	#,
	jmp	.L2793	#
.L2802:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	8(%rdi), %r9	# MEM[(uint64_t *)b.114_69 + j_410 * 8], tmp5006
	cmpq	%r9, 8(%r15)	# tmp5006, MEM[(uint64_t *)a.115_70 + j_410 * 8]
	ja	.L921	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L922	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	jne	.L1943	#,
	.p2align 4,,10
	.p2align 3
.L812:
# sub.c:1339:             TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
	incl	%ebx	# __t
	cmpl	-66312(%rbp), %ebx	# %sfp, __t
	jne	.L804	#,
.L805:
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
	salq	$32, %r11	#, tmp1060
# sub.c:1519:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	movl	%r10d, %eax	# cycles_low, cycles_low
# sub.c:1519:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	orq	%rax, %r11	# cycles_low, ticks
# sub.c:1339:             TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
	subq	-66336(%rbp), %r11	# %sfp, __tmp
	cmpq	$624999999, %r11	#, __tmp
	jbe	.L791	#,
# sub.c:1339:             TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
	vxorpd	%xmm10, %xmm10, %xmm10	# tmp4694
	vcvtusi2sdq	%r11, %xmm10, %xmm11	# __tmp, tmp4694, tmp3921
	vcvtsi2sdq	-66328(%rbp), %xmm10, %xmm14	# %sfp, tmp4696, tmp3923
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC64(%rip), %rdi	#, tmp1100
# sub.c:1339:             TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
	vmulsd	.LC63(%rip), %xmm11, %xmm12	#, tmp1095, _73
	vcvttsd2usi	%xmm12, %rbx	# _73, __tmp
	vcvtusi2sdq	%rbx, %xmm10, %xmm1	# __tmp, tmp4695, tmp3922
	vdivsd	%xmm14, %xmm1, %xmm15	# tmp1099, tmp1098, time_taken
	vmovq	%xmm15, %rbx	# time_taken, time_taken
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vzeroupper
	call	puts@PLT	#
# sub.c:1340:             time_taken_ms = time_taken / 1e6;
	vmovq	%rbx, %xmm4	# time_taken, time_taken
	vmulsd	.LC65(%rip), %xmm4, %xmm0	#, time_taken, time_taken_ms
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC66(%rip), %rsi	#, tmp1103
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk@PLT	#
# sub.c:1344:             niter = 1 + (unsigned long)(1e4 / time_taken_ms);
	vmovsd	.LC67(%rip), %xmm7	#, tmp1105
	vmovq	%rbx, %xmm3	# time_taken, time_taken
	vdivsd	%xmm3, %xmm7, %xmm2	# time_taken, tmp1105, tmp1104
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC68(%rip), %rsi	#, tmp1107
	xorl	%eax, %eax	#
# sub.c:1344:             niter = 1 + (unsigned long)(1e4 / time_taken_ms);
	vcvttsd2usi	%xmm2, %rdi	# tmp1104, tmp1106
# sub.c:1344:             niter = 1 + (unsigned long)(1e4 / time_taken_ms);
	leal	1(%rdi), %r8d	#, niter
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	%r8d, %edx	# niter,
	movl	$1, %edi	#,
	movl	%r8d, -66328(%rbp)	# niter, %sfp
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
	mov %eax, %esi	# cycles_low
	
# 0 "" 2
# sub.c:1505:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
#NO_APP
	salq	$32, %r9	#, tmp1112
# sub.c:1505:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	movl	%esi, %edx	# cycles_low, cycles_low
# sub.c:1349:             for (int i = 0; i < niter; i++)
	movl	-66328(%rbp), %r11d	# %sfp, niter
# sub.c:1505:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	orq	%rdx, %r9	# cycles_low, tmp1112
	movq	%r9, -66312(%rbp)	# tmp1112, %sfp
	movq	-66344(%rbp), %rbx	# %sfp, b.114_69
# sub.c:1349:             for (int i = 0; i < niter; i++)
	xorl	%r10d, %r10d	# i
# sub.c:1349:             for (int i = 0; i < niter; i++)
	testl	%r11d, %r11d	# niter
	jle	.L818	#,
	.p2align 4,,10
	.p2align 3
.L813:
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %rcx	# sub_space_ptr, sub_space_ptr
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %rax	# sub_space, sub_space
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rbx), %r8	# MEM[(uint64_t *)b.114_69 + j_510 * 8], tmp4710
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%rax,%rcx,8), %rax	#, result
	leaq	-1(%r12), %rcx	#, tmp1735
	andl	$7, %ecx	#, tmp1735
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%r8, (%r15)	# tmp4710, MEM[(uint64_t *)a.115_70 + j_510 * 8]
	jbe	.L2794	#,
.L926:
	movq	%rbx, %rdi	# b.114_69, b
	movq	%r15, %r8	# a.115_70, a
.L816:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8), %zmm5	# MEM[(__m512i * {ref-all})a_532 + i_530 * 8], tmp4713
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %rdx	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi), %zmm5, %zmm6	# MEM[(__m512i * {ref-all})b_535 + i_530 * 8], tmp4713, tmp1140
	leaq	-1(%r12), %r9	#, tmp1731
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k2	#, zeros, tmp1140, tmp1142
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm6, %zmm0	# tmp1140, tmp1140
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %rdx	# borrow_space, bm
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm6, %zmm0{%k2}	# limb_digits, tmp1140, tmp1140, tmp1142, tmp1140
	shrq	$3, %r9	#, tmp1729
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rax)	# tmp1146, MEM[(__m512i * {ref-all})result_509 + i_530 * 8]
	andl	$3, %r9d	#, tmp1732
# sub.c:217:         i += 8;
	movl	$8, %ecx	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%rdx), %rsi	#, ivtmp.622
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, (%rdx)	# tmp1142, MEM[(__mmask8 *)_1358]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %r12	#, sub_size
	jbe	.L2364	#,
	testq	%r9, %r9	# tmp1732
	je	.L820	#,
	cmpq	$1, %r9	#, tmp1732
	je	.L1917	#,
	cmpq	$2, %r9	#, tmp1732
	je	.L1918	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%r8), %zmm8	# MEM[(__m512i * {ref-all})a_532 + i_530 * 8], tmp4969
# sub.c:217:         i += 8;
	movl	$16, %ecx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%rdi), %zmm8, %zmm9	# MEM[(__m512i * {ref-all})b_535 + i_530 * 8], tmp4969, tmp2924
# sub.c:219:     } while (likely(i < n));
	leaq	2(%rdx), %rsi	#, ivtmp.622
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k3	#, zeros, tmp2924, tmp2926
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm9, %zmm10	# tmp2924, tmp2924
	vpaddq	limb_digits(%rip), %zmm9, %zmm10{%k3}	# limb_digits, tmp2924, tmp2924, tmp2926, tmp2924
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, 64(%rax)	# tmp2928, MEM[(__m512i * {ref-all})result_509 + i_530 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, 1(%rdx)	# tmp2926, MEM[(__mmask8 *)_1358]
.L1918:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rcx,8), %zmm11	# MEM[(__m512i * {ref-all})a_532 + i_530 * 8], tmp4971
# sub.c:219:     } while (likely(i < n));
	incq	%rsi	# ivtmp.622
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rcx,8), %zmm11, %zmm12	# MEM[(__m512i * {ref-all})b_535 + i_530 * 8], tmp4971, tmp2930
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k4	#, zeros, tmp2930, tmp2932
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm12, %zmm1	# tmp2930, tmp2930
	vpaddq	limb_digits(%rip), %zmm12, %zmm1{%k4}	# limb_digits, tmp2930, tmp2930, tmp2932, tmp2930
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rax,%rcx,8)	# tmp2934, MEM[(__m512i * {ref-all})result_509 + i_530 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, -1(%rsi)	# tmp2932, MEM[(__mmask8 *)_1358]
.L1917:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rcx,8), %zmm13	# MEM[(__m512i * {ref-all})a_532 + i_530 * 8], tmp4973
# sub.c:219:     } while (likely(i < n));
	incq	%rsi	# ivtmp.622
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rcx,8), %zmm13, %zmm14	# MEM[(__m512i * {ref-all})b_535 + i_530 * 8], tmp4973, tmp2936
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k5	#, zeros, tmp2936, tmp2938
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm14, %zmm15	# tmp2936, tmp2936
	vpaddq	limb_digits(%rip), %zmm14, %zmm15{%k5}	# limb_digits, tmp2936, tmp2936, tmp2938, tmp2936
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, (%rax,%rcx,8)	# tmp2940, MEM[(__m512i * {ref-all})result_509 + i_530 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, -1(%rsi)	# tmp2938, MEM[(__mmask8 *)_1358]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rcx, %r12	# i, sub_size
	jbe	.L2364	#,
.L820:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rcx,8), %zmm4	# MEM[(__m512i * {ref-all})a_532 + i_530 * 8], tmp4715
# sub.c:217:         i += 8;
	leaq	8(%rcx), %r9	#, tmp1733
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rcx,8), %zmm4, %zmm7	# MEM[(__m512i * {ref-all})b_535 + i_530 * 8], tmp4715, tmp2137
# sub.c:219:     } while (likely(i < n));
	addq	$4, %rsi	#, ivtmp.622
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm7, %k6	#, zeros, tmp2137, tmp2139
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm7, %zmm3	# tmp2137, tmp2137
	vpaddq	limb_digits(%rip), %zmm7, %zmm3{%k6}	# limb_digits, tmp2137, tmp2137, tmp2139, tmp2137
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rax,%rcx,8)	# tmp2141, MEM[(__m512i * {ref-all})result_509 + i_530 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, -4(%rsi)	# tmp2139, MEM[(__mmask8 *)_1358]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%r9,8), %zmm2	# MEM[(__m512i * {ref-all})a_532 + i_530 * 8], tmp4717
	vpsubq	(%rdi,%r9,8), %zmm2, %zmm5	# MEM[(__m512i * {ref-all})b_535 + i_530 * 8], tmp4717, tmp2145
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k7	#, zeros, tmp2145, tmp2147
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm5, %zmm6	# tmp2145, tmp2145
	vpaddq	limb_digits(%rip), %zmm5, %zmm6{%k7}	# limb_digits, tmp2145, tmp2145, tmp2147, tmp2145
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rax,%r9,8)	# tmp2149, MEM[(__m512i * {ref-all})result_509 + i_530 * 8]
# sub.c:217:         i += 8;
	leaq	16(%rcx), %r9	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, -3(%rsi)	# tmp2147, MEM[(__mmask8 *)_1358]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%r9,8), %zmm0	# MEM[(__m512i * {ref-all})a_532 + i_530 * 8], tmp4719
	vpsubq	(%rdi,%r9,8), %zmm0, %zmm8	# MEM[(__m512i * {ref-all})b_535 + i_530 * 8], tmp4719, tmp2153
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm8, %k1	#, zeros, tmp2153, tmp2155
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm8, %zmm9	# tmp2153, tmp2153
	vpaddq	limb_digits(%rip), %zmm8, %zmm9{%k1}	# limb_digits, tmp2153, tmp2153, tmp2155, tmp2153
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rax,%r9,8)	# tmp2157, MEM[(__m512i * {ref-all})result_509 + i_530 * 8]
# sub.c:217:         i += 8;
	leaq	24(%rcx), %r9	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, -2(%rsi)	# tmp2155, MEM[(__mmask8 *)_1358]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%r9,8), %zmm10	# MEM[(__m512i * {ref-all})a_532 + i_530 * 8], tmp4721
# sub.c:217:         i += 8;
	addq	$32, %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%r9,8), %zmm10, %zmm11	# MEM[(__m512i * {ref-all})b_535 + i_530 * 8], tmp4721, tmp2161
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm11, %k2	#, zeros, tmp2161, tmp2163
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm11, %zmm12	# tmp2161, tmp2161
	vpaddq	limb_digits(%rip), %zmm11, %zmm12{%k2}	# limb_digits, tmp2161, tmp2161, tmp2163, tmp2161
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm12, (%rax,%r9,8)	# tmp2165, MEM[(__m512i * {ref-all})result_509 + i_530 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, -1(%rsi)	# tmp2163, MEM[(__mmask8 *)_1358]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rcx, %r12	# i, sub_size
	ja	.L820	#,
.L2364:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm1	# zeros, tmp4723
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movl	-66360(%rbp), %edi	# %sfp,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqu64	%zmm1, (%rax,%r14)	# tmp4723, MEM[(__m512i_u * {ref-all})_557]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%edi, %edi	#
	js	.L823	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%r13), %r8d	# MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1],
	movl	%r13d, %r9d	# ivtmp.644, tmp1727
	movl	%r8d, %esi	#,
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movl	%r13d, %edi	# ivtmp.644, tmp4157
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	addl	%r8d, %r8d	# tmp1153
	andl	$7, %r9d	#, tmp1727
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decl	%edi	# tmp4157
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r8b, (%rdx,%r13)	# tmp1153, MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-1(%r13), %rcx	#, ivtmp.610
	js	.L823	#,
	testl	%r9d, %r9d	# tmp1727
	je	.L821	#,
	cmpl	$1, %r9d	#, tmp1727
	je	.L1911	#,
	cmpl	$2, %r9d	#, tmp1727
	je	.L1912	#,
	cmpl	$3, %r9d	#, tmp1727
	je	.L1913	#,
	cmpl	$4, %r9d	#, tmp1727
	je	.L1914	#,
	cmpl	$5, %r9d	#, tmp1727
	je	.L1915	#,
	cmpl	$6, %r9d	#, tmp1727
	je	.L1916	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-1(%rdx,%r13), %edi	# MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rdi,%rdi), %ecx	#, tmp2897
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%esi, %ecx	# carry, tmp2898
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%cl, -1(%rdx,%r13)	# tmp2898, MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%edi, %esi	# temp, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-2(%r13), %rcx	#, ivtmp.610
.L1916:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %r8d	#, tmp2901
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %esi	# tmp2901, tmp2902
	movb	%sil, (%rdx,%rcx)	# tmp2902, MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.610
.L1915:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %edi	#, tmp2905
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %esi	# tmp2905, tmp2906
	movb	%sil, (%rdx,%rcx)	# tmp2906, MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.610
.L1914:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r8d	# MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %r9d	#, tmp2909
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %esi	# tmp2909, tmp2910
	movb	%sil, (%rdx,%rcx)	# tmp2910, MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.610
.L1913:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r8d	# MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %edi	#, tmp2913
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %esi	# tmp2913, tmp2914
	movb	%sil, (%rdx,%rcx)	# tmp2914, MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.610
.L1912:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %r8d	#, tmp2917
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %esi	# tmp2917, tmp2918
	movb	%sil, (%rdx,%rcx)	# tmp2918, MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.610
.L1911:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %edi	#, tmp2921
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %esi	# tmp2921, tmp2922
	movb	%sil, (%rdx,%rcx)	# tmp2922, MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.610
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%ecx, %ecx	# ivtmp.610
	js	.L823	#,
.L821:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1], temp
	movzbl	-1(%rdx,%rcx), %edi	# MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %r8d	#, tmp2170
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %esi	# tmp2170, tmp2171
	movb	%sil, (%rdx,%rcx)	# tmp2171, MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1]
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r9b	#, carry
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rdi,%rdi), %esi	#, tmp2176
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%esi, %r9d	# tmp2176, tmp2177
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-2(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r9b, -1(%rdx,%rcx)	# tmp2177, MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1]
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp2182
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %edi	# tmp2182, tmp2183
	movb	%dil, -2(%rdx,%rcx)	# tmp2183, MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-3(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r8d	#, tmp2188
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %edi	# tmp2188, tmp2189
	movb	%dil, -3(%rdx,%rcx)	# tmp2189, MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-4(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp2194
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %edi	# tmp2194, tmp2195
	movb	%dil, -4(%rdx,%rcx)	# tmp2195, MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-5(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r8d	#, tmp2200
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %edi	# tmp2200, tmp2201
	movb	%dil, -5(%rdx,%rcx)	# tmp2201, MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-6(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp2206
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %edi	# tmp2206, tmp2207
	movb	%dil, -6(%rdx,%rcx)	# tmp2207, MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-7(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r8d	#, tmp2212
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %edi	# tmp2212, tmp2213
	movb	%dil, -7(%rdx,%rcx)	# tmp2213, MEM[(__mmask8 *)bm_529 + ivtmp.610_971 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	subq	$8, %rcx	#, ivtmp.610
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%ecx, %ecx	# ivtmp.610
	jns	.L821	#,
.L823:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax), %zmm13	# MEM[(__m512i * {ref-all})result_509 + i_2189 * 8], _2185
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rdx), %ecx	# MEM[(__mmask8 *)_1308], MEM[(__mmask8 *)_1308]
	leaq	-1(%r12), %rdi	#, tmp1722
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k3	# MEM[(__mmask8 *)_1308], tmp4728
	vpsubq	ones(%rip), %zmm13, %zmm13{%k3}	# ones, _2185, tmp1155, tmp4728, _2185
	shrq	$3, %rdi	#, tmp1720
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rax)	# tmp1155, MEM[(__m512i * {ref-all})result_509 + i_2189 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k0	#, zeros, tmp1155, tmp1161
	movq	%rdi, %r9	# tmp1720, tmp1720
	andl	$3, %r9d	#, tmp1720
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp1161
	jne	.L2795	#,
.L1059:
# sub.c:249:         i += 8;
	movl	$8, %ecx	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rdx), %rsi	#, ivtmp.605
	cmpq	$8, %r12	#, sub_size
	jbe	.L825	#,
	testq	%r9, %r9	# tmp1723
	je	.L822	#,
	cmpq	$1, %r9	#, tmp1723
	je	.L1909	#,
	cmpq	$2, %r9	#, tmp1723
	je	.L1910	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	64(%rax), %zmm14	# MEM[(__m512i * {ref-all})result_509 + i_2189 * 8], _2185
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rdx), %r8d	# MEM[(__mmask8 *)_1308], MEM[(__mmask8 *)_1308]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k4	# MEM[(__mmask8 *)_1308], tmp4957
	vpsubq	ones(%rip), %zmm14, %zmm14{%k4}	# ones, _2185, tmp2864, tmp4957, _2185
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, 64(%rax)	# tmp2864, MEM[(__m512i * {ref-all})result_509 + i_2189 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k5	#, zeros, tmp2864, tmp2866
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k5, %k5	# tmp2866
	jne	.L2796	#,
.L1061:
# sub.c:249:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.605
.L1910:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm15	# MEM[(__m512i * {ref-all})result_509 + i_2189 * 8], _2185
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %edx	# MEM[(__mmask8 *)_1308], MEM[(__mmask8 *)_1308]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edx, %k6	# MEM[(__mmask8 *)_1308], tmp4958
	vpsubq	ones(%rip), %zmm15, %zmm15{%k6}	# ones, _2185, tmp2870, tmp4958, _2185
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, (%rax,%rcx,8)	# tmp2870, MEM[(__m512i * {ref-all})result_509 + i_2189 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k7	#, zeros, tmp2870, tmp2872
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k7, %k7	# tmp2872
	jne	.L2797	#,
.L1064:
# sub.c:249:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.605
.L1909:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm4	# MEM[(__m512i * {ref-all})result_509 + i_2189 * 8], _2185
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %edi	# MEM[(__mmask8 *)_1308], MEM[(__mmask8 *)_1308]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k1	# MEM[(__mmask8 *)_1308], tmp4959
	vpsubq	ones(%rip), %zmm4, %zmm4{%k1}	# ones, _2185, tmp2876, tmp4959, _2185
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm4, (%rax,%rcx,8)	# tmp2876, MEM[(__m512i * {ref-all})result_509 + i_2189 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm4, %k2	#, zeros, tmp2876, tmp2878
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k2, %k2	# tmp2878
	jne	.L2798	#,
.L1067:
# sub.c:249:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.605
	cmpq	%rcx, %r12	# i, sub_size
	ja	.L822	#,
	jmp	.L825	#
	.p2align 4,,10
	.p2align 3
.L824:
# sub.c:249:         i += 8;
	leaq	8(%rcx), %r8	#, tmp1724
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r8,8), %zmm3	# MEM[(__m512i * {ref-all})result_509 + i_2189 * 8], _2185
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rsi), %ecx	# MEM[(__mmask8 *)_1308], MEM[(__mmask8 *)_1308]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rsi), %rdx	#, tmp1725
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k4	# MEM[(__mmask8 *)_1308], tmp4736
	vpsubq	ones(%rip), %zmm3, %zmm3{%k4}	# ones, _2185, tmp2227, tmp4736, _2185
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rax,%r8,8)	# tmp2227, MEM[(__m512i * {ref-all})result_509 + i_2189 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k5	#, zeros, tmp2227, tmp2229
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k5, %k5	# tmp2229
	jne	.L2799	#,
.L1070:
# sub.c:249:         i += 8;
	leaq	8(%r8), %rdi	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdi,8), %zmm2	# MEM[(__m512i * {ref-all})result_509 + i_2189 * 8], _2185
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rdx), %esi	# MEM[(__mmask8 *)_1308], MEM[(__mmask8 *)_1308]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k6	# MEM[(__mmask8 *)_1308], tmp4960
	vpsubq	ones(%rip), %zmm2, %zmm2{%k6}	# ones, _2185, tmp2884, tmp4960, _2185
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, (%rax,%rdi,8)	# tmp2884, MEM[(__m512i * {ref-all})result_509 + i_2189 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k7	#, zeros, tmp2884, tmp2886
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k7, %k7	# tmp2886
	jne	.L2800	#,
.L1072:
# sub.c:249:         i += 8;
	leaq	16(%r8), %r9	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r9,8), %zmm5	# MEM[(__m512i * {ref-all})result_509 + i_2189 * 8], _2185
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%rdx), %ecx	# MEM[(__mmask8 *)_1308], MEM[(__mmask8 *)_1308]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k1	# MEM[(__mmask8 *)_1308], tmp4961
	vpsubq	ones(%rip), %zmm5, %zmm5{%k1}	# ones, _2185, tmp2892, tmp4961, _2185
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, (%rax,%r9,8)	# tmp2892, MEM[(__m512i * {ref-all})result_509 + i_2189 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k2	#, zeros, tmp2892, tmp2894
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k2, %k2	# tmp2894
	jne	.L2801	#,
.L1074:
# sub.c:249:         i += 8;
	leaq	24(%r8), %rcx	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%rdx), %rsi	#, ivtmp.605
	cmpq	%rcx, %r12	# i, sub_size
	jbe	.L825	#,
.L822:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm7	# MEM[(__m512i * {ref-all})result_509 + i_2189 * 8], _2185
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %r9d	# MEM[(__mmask8 *)_1308], MEM[(__mmask8 *)_1308]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k3	# MEM[(__mmask8 *)_1308], tmp4735
	vpsubq	ones(%rip), %zmm7, %zmm7{%k3}	# ones, _2185, tmp2219, tmp4735, _2185
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm7, (%rax,%rcx,8)	# tmp2219, MEM[(__m512i * {ref-all})result_509 + i_2189 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm7, %k0	#, zeros, tmp2219, tmp2221
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp2221
	je	.L824	#,
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rsi)	# tmp2221, MEM[(__mmask8 *)_1308]
	jmp	.L824	#
	.p2align 4,,10
	.p2align 3
.L2768:
	kmovb	%k1, 2(%rdx)	# tmp3006, MEM[(__mmask8 *)_1220]
	jmp	.L1160	#
	.p2align 4,,10
	.p2align 3
.L2767:
	kmovb	%k6, 1(%rdx)	# tmp2998, MEM[(__mmask8 *)_1220]
	jmp	.L1158	#
	.p2align 4,,10
	.p2align 3
.L2766:
	kmovb	%k4, 1(%rsi)	# tmp2127, MEM[(__mmask8 *)_1220]
	jmp	.L1156	#
.L2821:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	8(%rbx), %r9	# MEM[(uint64_t *)b.114_69 + j_510 * 8], tmp4975
	cmpq	%r9, 8(%r15)	# tmp4975, MEM[(uint64_t *)a.115_70 + j_510 * 8]
	ja	.L926	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L927	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	jne	.L1925	#,
.L825:
# sub.c:1349:             for (int i = 0; i < niter; i++)
	incl	%r10d	# i
# sub.c:1349:             for (int i = 0; i < niter; i++)
	cmpl	%r10d, %r11d	# i, niter
	jne	.L813	#,
	vzeroupper
.L818:
	movl	%r11d, -66328(%rbp)	# niter, %sfp
# sub.c:1514:     asm volatile("RDTSCP\n\t"
#APP
# 1514 "sub.c" 1
	RDTSCP
	mov %edx, %r12d	# cycles_high
	mov %eax, %r14d	# cycles_low
	CPUID
	
# 0 "" 2
# sub.c:1519:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
#NO_APP
	movq	%r12, %rax	# cycles_high, tmp1117
	salq	$32, %rax	#, tmp1117
# sub.c:1519:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	movl	%r14d, %ebx	# cycles_low, cycles_low
# sub.c:1519:     ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
	orq	%rbx, %rax	# cycles_low, ticks
# sub.c:1354:             t1 = t1 - t0;
	subq	-66312(%rbp), %rax	# %sfp, t1
# sub.c:1355:             t1 = t1 * 0.4; // t*f -> ns
	vxorpd	%xmm6, %xmm6, %xmm6	# tmp4703
	vcvtusi2sdq	%rax, %xmm6, %xmm0	# t1, tmp4703, tmp3924
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC69(%rip), %rdi	#, tmp1126
# sub.c:1361:             for (decimals = 0;; decimals++)
	xorl	%r12d, %r12d	# decimals
# sub.c:1355:             t1 = t1 * 0.4; // t*f -> ns
	vmulsd	.LC63(%rip), %xmm0, %xmm8	#, tmp1121, _82
# sub.c:1355:             t1 = t1 * 0.4; // t*f -> ns
	vcvttsd2usi	%xmm8, %r10	# _82, t1
# sub.c:1356:             t1 = t1 / 1e6; // ns -> ms
	vcvtusi2sdq	%r10, %xmm6, %xmm9	# t1, tmp4704, tmp3925
	vmulsd	.LC65(%rip), %xmm9, %xmm10	#, tmp1124, _84
	vmovq	%xmm10, %r13	# _84, _84
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	puts@PLT	#
# sub.c:1359:             ops_per_sec = 1000.0 * niter / t1;
	movl	-66328(%rbp), %r11d	# %sfp, niter
	vxorpd	%xmm11, %xmm11, %xmm11	# tmp4706
	vcvtsi2sdl	%r11d, %xmm11, %xmm12	# niter, tmp4706, tmp3926
# sub.c:1356:             t1 = t1 / 1e6; // ns -> ms
	vmovq	%r13, %xmm14	# _84, _84
	vcvttsd2usi	%xmm14, %r8	# _84, t1
# sub.c:1359:             ops_per_sec = 1000.0 * niter / t1;
	vmovsd	.LC70(%rip), %xmm1	#, tmp1127
# sub.c:1363:                 if (ops_per_sec > f)
	vmovsd	.LC51(%rip), %xmm10	#, tmp1132
# sub.c:1359:             ops_per_sec = 1000.0 * niter / t1;
	vmulsd	%xmm12, %xmm1, %xmm13	# tmp3926, tmp1127, tmp1127
# sub.c:1359:             ops_per_sec = 1000.0 * niter / t1;
	vcvtusi2sdq	%r8, %xmm11, %xmm15	# t1, tmp4708, tmp3927
# sub.c:1359:             ops_per_sec = 1000.0 * niter / t1;
	vdivsd	%xmm15, %xmm13, %xmm4	# tmp1131, tmp1128, ops_per_sec
# sub.c:1363:                 if (ops_per_sec > f)
	vcomisd	%xmm10, %xmm4	# tmp1132, ops_per_sec
	ja	.L814	#,
	vmovsd	.LC71(%rip), %xmm7	#, tmp1668
.L815:
# sub.c:1365:                 f = f * 0.1;
	vmulsd	%xmm7, %xmm10, %xmm3	# tmp1668, f, f
# sub.c:1361:             for (decimals = 0;; decimals++)
	leal	1(%r12), %edx	#, tmp1719
	movl	%edx, %r12d	# tmp1719, decimals
# sub.c:1363:                 if (ops_per_sec > f)
	vcomisd	%xmm3, %xmm4	# f, ops_per_sec
	ja	.L814	#,
# sub.c:1365:                 f = f * 0.1;
	vmulsd	%xmm7, %xmm3, %xmm2	# tmp1668, f, f
# sub.c:1361:             for (decimals = 0;; decimals++)
	incl	%r12d	# decimals
# sub.c:1363:                 if (ops_per_sec > f)
	vcomisd	%xmm2, %xmm4	# f, ops_per_sec
	ja	.L814	#,
# sub.c:1365:                 f = f * 0.1;
	vmulsd	%xmm7, %xmm2, %xmm5	# tmp1668, f, f
# sub.c:1361:             for (decimals = 0;; decimals++)
	leal	2(%rdx), %r12d	#, decimals
# sub.c:1363:                 if (ops_per_sec > f)
	vcomisd	%xmm5, %xmm4	# f, ops_per_sec
	ja	.L814	#,
# sub.c:1365:                 f = f * 0.1;
	vmulsd	%xmm7, %xmm5, %xmm6	# tmp1668, f, f
# sub.c:1361:             for (decimals = 0;; decimals++)
	leal	3(%rdx), %r12d	#, decimals
# sub.c:1363:                 if (ops_per_sec > f)
	vcomisd	%xmm6, %xmm4	# f, ops_per_sec
	ja	.L814	#,
# sub.c:1365:                 f = f * 0.1;
	vmulsd	%xmm7, %xmm6, %xmm0	# tmp1668, f, f
# sub.c:1361:             for (decimals = 0;; decimals++)
	leal	4(%rdx), %r12d	#, decimals
# sub.c:1363:                 if (ops_per_sec > f)
	vcomisd	%xmm0, %xmm4	# f, ops_per_sec
	ja	.L814	#,
# sub.c:1365:                 f = f * 0.1;
	vmulsd	%xmm7, %xmm0, %xmm8	# tmp1668, f, f
# sub.c:1361:             for (decimals = 0;; decimals++)
	leal	5(%rdx), %r12d	#, decimals
# sub.c:1363:                 if (ops_per_sec > f)
	vcomisd	%xmm8, %xmm4	# f, ops_per_sec
	ja	.L814	#,
# sub.c:1365:                 f = f * 0.1;
	vmulsd	%xmm7, %xmm8, %xmm9	# tmp1668, f, f
# sub.c:1361:             for (decimals = 0;; decimals++)
	leal	6(%rdx), %r12d	#, decimals
# sub.c:1363:                 if (ops_per_sec > f)
	vcomisd	%xmm9, %xmm4	# f, ops_per_sec
	ja	.L814	#,
# sub.c:1365:                 f = f * 0.1;
	vmulsd	%xmm7, %xmm9, %xmm10	# tmp1668, f, f
# sub.c:1361:             for (decimals = 0;; decimals++)
	leal	7(%rdx), %r12d	#, decimals
# sub.c:1363:                 if (ops_per_sec > f)
	vcomisd	%xmm10, %xmm4	# f, ops_per_sec
	jbe	.L815	#,
.L814:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vmovsd	%xmm4, %xmm4, %xmm0	# ops_per_sec,
	movl	%r12d, %edx	# decimals,
	leaq	.LC72(%rip), %rsi	#, tmp1166
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	vmovsd	%xmm4, -66312(%rbp)	# ops_per_sec, %sfp
	call	__printf_chk@PLT	#
# sub.c:1368:             gzprintf(rdtsc_file, "%.*f\n", decimals, ops_per_sec);
	vmovsd	-66312(%rbp), %xmm0	# %sfp, ops_per_sec
	movq	-66376(%rbp), %rdi	# %sfp,
	movl	%r12d, %edx	# decimals,
	leaq	.LC73(%rip), %rsi	#, tmp1167
	movl	$1, %eax	#,
	call	gzprintf@PLT	#
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:54:   free (__ptr);
	movq	%r15, %rdi	# a.115_70,
	call	free@PLT	#
	movq	-66344(%rbp), %rdi	# %sfp,
	call	free@PLT	#
# sub.c:1449:     gzclose(test_file);
	movq	-66320(%rbp), %rdi	# %sfp,
	call	gzclose@PLT	#
# sub.c:1451:     if (measure_type == 0)
	movl	-66352(%rbp), %r15d	# %sfp,
	testl	%r15d, %r15d	#
	jne	.L828	#,
# sub.c:1453:         gzclose(rdtsc_file);
	movq	-66376(%rbp), %rdi	# %sfp,
	call	gzclose@PLT	#
.L872:
# sub.c:1464:     if (sub_space_ptr > (1 << 30) || borrow_space_ptr > (1 << 30))
	movl	sub_space_ptr(%rip), %edi	# sub_space_ptr, sub_space_ptr.139_121
# sub.c:1464:     if (sub_space_ptr > (1 << 30) || borrow_space_ptr > (1 << 30))
	cmpl	$1073741824, %edi	#, sub_space_ptr.139_121
	jg	.L910	#,
# sub.c:1464:     if (sub_space_ptr > (1 << 30) || borrow_space_ptr > (1 << 30))
	movl	borrow_space_ptr(%rip), %r9d	# borrow_space_ptr, borrow_space_ptr.140_122
# sub.c:1464:     if (sub_space_ptr > (1 << 30) || borrow_space_ptr > (1 << 30))
	cmpl	$1073741824, %r9d	#, borrow_space_ptr.140_122
	jg	.L910	#,
# sub.c:1469:     if (sub_space_ptr && borrow_space_ptr)
	testl	%r9d, %r9d	# borrow_space_ptr.140_122
	je	.L753	#,
	testl	%edi, %edi	# sub_space_ptr.139_121
	je	.L753	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:54:   free (__ptr);
	movq	sub_space(%rip), %rdi	# sub_space,
	call	free@PLT	#
	movq	borrow_space(%rip), %rdi	# borrow_space,
	call	free@PLT	#
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:55: }
	jmp	.L753	#
	.p2align 4,,10
	.p2align 3
.L2761:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L922	#,
# sub.c:185:         j++;
	movl	$1, %ecx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %r12	#, sub_size
	je	.L812	#,
# sub.c:192:     } while (j < n);
	jbe	.L921	#,
	testq	%rdx, %rdx	# tmp1756
	je	.L806	#,
	cmpq	$1, %rdx	#, tmp1756
	je	.L1938	#,
	cmpq	$2, %rdx	#, tmp1756
	je	.L1939	#,
	cmpq	$3, %rdx	#, tmp1756
	je	.L1940	#,
	cmpq	$4, %rdx	#, tmp1756
	je	.L1941	#,
	cmpq	$5, %rdx	#, tmp1756
	je	.L1942	#,
	cmpq	$6, %rdx	#, tmp1756
	jne	.L2802	#,
.L1943:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rdi,%rcx,8), %r10	# MEM[(uint64_t *)b.114_69 + j_410 * 8], tmp5007
	cmpq	%r10, (%r15,%rcx,8)	# tmp5007, MEM[(uint64_t *)a.115_70 + j_410 * 8]
	ja	.L921	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L922	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L812	#,
.L1942:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rdi,%rcx,8), %rsi	# MEM[(uint64_t *)b.114_69 + j_410 * 8], tmp5008
	cmpq	%rsi, (%r15,%rcx,8)	# tmp5008, MEM[(uint64_t *)a.115_70 + j_410 * 8]
	ja	.L921	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L922	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L812	#,
.L1941:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rdi,%rcx,8), %rdx	# MEM[(uint64_t *)b.114_69 + j_410 * 8], tmp5009
	cmpq	%rdx, (%r15,%rcx,8)	# tmp5009, MEM[(uint64_t *)a.115_70 + j_410 * 8]
	ja	.L921	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L922	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L812	#,
.L1940:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rdi,%rcx,8), %r11	# MEM[(uint64_t *)b.114_69 + j_410 * 8], tmp5010
	cmpq	%r11, (%r15,%rcx,8)	# tmp5010, MEM[(uint64_t *)a.115_70 + j_410 * 8]
	ja	.L921	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L922	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L812	#,
.L1939:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rdi,%rcx,8), %r9	# MEM[(uint64_t *)b.114_69 + j_410 * 8], tmp5011
	cmpq	%r9, (%r15,%rcx,8)	# tmp5011, MEM[(uint64_t *)a.115_70 + j_410 * 8]
	ja	.L921	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L922	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L812	#,
.L1938:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rdi,%rcx,8), %r10	# MEM[(uint64_t *)b.114_69 + j_410 * 8], tmp5012
	cmpq	%r10, (%r15,%rcx,8)	# tmp5012, MEM[(uint64_t *)a.115_70 + j_410 * 8]
	ja	.L921	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L922	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L812	#,
.L2742:
# sub.c:192:     } while (j < n);
	jbe	.L921	#,
.L806:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rdi,%rcx,8), %rsi	# MEM[(uint64_t *)b.114_69 + j_410 * 8], tmp4668
	cmpq	%rsi, (%r15,%rcx,8)	# tmp4668, MEM[(uint64_t *)a.115_70 + j_410 * 8]
	ja	.L921	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L922	#,
# sub.c:185:         j++;
	leaq	1(%rcx), %rdx	#, tmp1757
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# tmp1757, sub_size
	je	.L812	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rdi,%rdx,8), %r11	# MEM[(uint64_t *)b.114_69 + j_410 * 8], tmp4670
	cmpq	%r11, (%r15,%rdx,8)	# tmp4670, MEM[(uint64_t *)a.115_70 + j_410 * 8]
	ja	.L921	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L922	#,
# sub.c:185:         j++;
	leaq	2(%rcx), %r9	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r9, %r12	# j, sub_size
	je	.L812	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rdi,%r9,8), %r10	# MEM[(uint64_t *)b.114_69 + j_410 * 8], tmp5013
	cmpq	%r10, (%r15,%r9,8)	# tmp5013, MEM[(uint64_t *)a.115_70 + j_410 * 8]
	ja	.L921	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L922	#,
# sub.c:185:         j++;
	addq	$3, %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L812	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rdi,%rcx,8), %rsi	# MEM[(uint64_t *)b.114_69 + j_410 * 8], tmp5014
	cmpq	%rsi, (%r15,%rcx,8)	# tmp5014, MEM[(uint64_t *)a.115_70 + j_410 * 8]
	ja	.L921	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L922	#,
# sub.c:185:         j++;
	leaq	3(%rdx), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L812	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rdi,%rcx,8), %r11	# MEM[(uint64_t *)b.114_69 + j_410 * 8], tmp5015
	cmpq	%r11, (%r15,%rcx,8)	# tmp5015, MEM[(uint64_t *)a.115_70 + j_410 * 8]
	ja	.L921	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L922	#,
# sub.c:185:         j++;
	leaq	4(%rdx), %r9	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r9, %r12	# j, sub_size
	je	.L812	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rdi,%r9,8), %r10	# MEM[(uint64_t *)b.114_69 + j_410 * 8], tmp5016
	cmpq	%r10, (%r15,%r9,8)	# tmp5016, MEM[(uint64_t *)a.115_70 + j_410 * 8]
	ja	.L921	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L922	#,
# sub.c:185:         j++;
	leaq	5(%rdx), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L812	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rdi,%rcx,8), %rsi	# MEM[(uint64_t *)b.114_69 + j_410 * 8], tmp5017
	cmpq	%rsi, (%r15,%rcx,8)	# tmp5017, MEM[(uint64_t *)a.115_70 + j_410 * 8]
	ja	.L921	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L922	#,
# sub.c:185:         j++;
	leaq	6(%rdx), %r11	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r11, %r12	# j, sub_size
	je	.L812	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rdi,%r11,8), %r9	# MEM[(uint64_t *)b.114_69 + j_410 * 8], tmp5018
	cmpq	%r9, (%r15,%r11,8)	# tmp5018, MEM[(uint64_t *)a.115_70 + j_410 * 8]
	ja	.L921	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L922	#,
# sub.c:185:         j++;
	leaq	7(%rdx), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	jne	.L2742	#,
	jmp	.L812	#
	.p2align 4,,10
	.p2align 3
.L2762:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rdx)	# tmp1091, MEM[(__mmask8 *)_1220]
	jmp	.L1145	#
.L2765:
	kmovb	%k1, (%rsi)	# tmp2990, MEM[(__mmask8 *)_1220]
	jmp	.L1153	#
.L2764:
	kmovb	%k6, (%rsi)	# tmp2984, MEM[(__mmask8 *)_1220]
	jmp	.L1150	#
.L2842:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	8(%r13), %r10	# MEM[(uint64_t *)b.130_105 + j_1093 * 8], tmp5078
	cmpq	%r10, 8(%r15)	# tmp5078, MEM[(uint64_t *)a.131_106 + j_1093 * 8]
	ja	.L947	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L948	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	jne	.L1979	#,
.L908:
# sub.c:1418:             for (int i = 0; i < niter; i++)
	incl	%r11d	# i
# sub.c:1418:             for (int i = 0; i < niter; i++)
	cmpl	%r11d, %r8d	# i, niter
	jne	.L896	#,
	vzeroupper
.L901:
# sub.c:1553:     getrusage(RUSAGE_SELF, &rus);
	movq	-66328(%rbp), %rsi	# %sfp,
	xorl	%edi, %edi	#
	movl	%r8d, -66312(%rbp)	# niter, %sfp
	call	getrusage@PLT	#
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	movq	-66184(%rbp), %r8	# MEM[(struct rusage *)_2061].ru_utime.tv_usec, MEM[(struct rusage *)_2061].ru_utime.tv_usec
	movabsq	$2361183241434822607, %r11	#, tmp1483
	movq	%r8, %rax	# MEM[(struct rusage *)_2061].ru_utime.tv_usec, tmp4166
	imulq	%r11	# tmp1483
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	imull	$1000, -66192(%rbp), %ebx	#, MEM[(struct rusage *)_2061].ru_utime.tv_sec, tmp1479
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	sarq	$63, %r8	#, tmp1485
	sarq	$7, %rdx	#, tmp1482
	subq	%r8, %rdx	# tmp1485, tmp1480
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC69(%rip), %rdi	#, tmp1486
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	addl	%edx, %ebx	# tmp1480, _1184
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	puts@PLT	#
# sub.c:1425:             ops_per_sec = 1000.0 * niter / t1;
	movl	-66312(%rbp), %r12d	# %sfp, niter
	vxorpd	%xmm9, %xmm9, %xmm9	# tmp4915
	vcvtsi2sdl	%r12d, %xmm9, %xmm10	# niter, tmp4915, tmp3935
	vmovsd	.LC70(%rip), %xmm11	#, tmp1487
# sub.c:1422:             t1 = cputime() - t0;
	movslq	%ebx, %r14	# _1184, _1184
# sub.c:1422:             t1 = cputime() - t0;
	subq	-66336(%rbp), %r14	# %sfp, t1
# sub.c:1425:             ops_per_sec = 1000.0 * niter / t1;
	vmulsd	%xmm10, %xmm11, %xmm12	# tmp3935, tmp1487, tmp1487
# sub.c:1425:             ops_per_sec = 1000.0 * niter / t1;
	vcvtusi2sdq	%r14, %xmm9, %xmm13	# t1, tmp4916, tmp3936
# sub.c:1430:                 if (ops_per_sec > f)
	vmovsd	.LC51(%rip), %xmm6	#, tmp1493
# sub.c:1428:             for (decimals = 0;; decimals++)
	xorl	%ebx, %ebx	# decimals
# sub.c:1425:             ops_per_sec = 1000.0 * niter / t1;
	vdivsd	%xmm13, %xmm12, %xmm14	# tmp1492, tmp1488, ops_per_sec
# sub.c:1430:                 if (ops_per_sec > f)
	vcomisd	%xmm6, %xmm14	# tmp1493, ops_per_sec
	ja	.L897	#,
	vmovsd	.LC71(%rip), %xmm15	#, tmp2751
.L898:
# sub.c:1432:                 f = f * 0.1;
	vmulsd	%xmm15, %xmm6, %xmm0	# tmp2751, f, f
# sub.c:1428:             for (decimals = 0;; decimals++)
	leal	1(%rbx), %r10d	#, tmp1777
	movl	%r10d, %ebx	# tmp1777, decimals
# sub.c:1430:                 if (ops_per_sec > f)
	vcomisd	%xmm0, %xmm14	# f, ops_per_sec
	ja	.L897	#,
# sub.c:1432:                 f = f * 0.1;
	vmulsd	%xmm15, %xmm0, %xmm4	# tmp2751, f, f
# sub.c:1428:             for (decimals = 0;; decimals++)
	incl	%ebx	# decimals
# sub.c:1430:                 if (ops_per_sec > f)
	vcomisd	%xmm4, %xmm14	# f, ops_per_sec
	ja	.L897	#,
# sub.c:1432:                 f = f * 0.1;
	vmulsd	%xmm15, %xmm4, %xmm7	# tmp2751, f, f
# sub.c:1428:             for (decimals = 0;; decimals++)
	leal	2(%r10), %ebx	#, decimals
# sub.c:1430:                 if (ops_per_sec > f)
	vcomisd	%xmm7, %xmm14	# f, ops_per_sec
	ja	.L897	#,
# sub.c:1432:                 f = f * 0.1;
	vmulsd	%xmm15, %xmm7, %xmm1	# tmp2751, f, f
# sub.c:1428:             for (decimals = 0;; decimals++)
	leal	3(%r10), %ebx	#, decimals
# sub.c:1430:                 if (ops_per_sec > f)
	vcomisd	%xmm1, %xmm14	# f, ops_per_sec
	ja	.L897	#,
# sub.c:1432:                 f = f * 0.1;
	vmulsd	%xmm15, %xmm1, %xmm3	# tmp2751, f, f
# sub.c:1428:             for (decimals = 0;; decimals++)
	leal	4(%r10), %ebx	#, decimals
# sub.c:1430:                 if (ops_per_sec > f)
	vcomisd	%xmm3, %xmm14	# f, ops_per_sec
	ja	.L897	#,
# sub.c:1432:                 f = f * 0.1;
	vmulsd	%xmm15, %xmm3, %xmm2	# tmp2751, f, f
# sub.c:1428:             for (decimals = 0;; decimals++)
	leal	5(%r10), %ebx	#, decimals
# sub.c:1430:                 if (ops_per_sec > f)
	vcomisd	%xmm2, %xmm14	# f, ops_per_sec
	ja	.L897	#,
# sub.c:1432:                 f = f * 0.1;
	vmulsd	%xmm15, %xmm2, %xmm5	# tmp2751, f, f
# sub.c:1428:             for (decimals = 0;; decimals++)
	leal	6(%r10), %ebx	#, decimals
# sub.c:1430:                 if (ops_per_sec > f)
	vcomisd	%xmm5, %xmm14	# f, ops_per_sec
	ja	.L897	#,
# sub.c:1432:                 f = f * 0.1;
	vmulsd	%xmm15, %xmm5, %xmm6	# tmp2751, f, f
# sub.c:1428:             for (decimals = 0;; decimals++)
	leal	7(%r10), %ebx	#, decimals
# sub.c:1430:                 if (ops_per_sec > f)
	vcomisd	%xmm6, %xmm14	# f, ops_per_sec
	jbe	.L898	#,
.L897:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vmovsd	%xmm14, %xmm14, %xmm0	# ops_per_sec,
	movl	%ebx, %edx	# decimals,
	leaq	.LC72(%rip), %rsi	#, tmp1527
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	vmovsd	%xmm14, -66312(%rbp)	# ops_per_sec, %sfp
	call	__printf_chk@PLT	#
# sub.c:1438:             gzprintf(cputime_file, "%.*f\n", decimals, ops_per_sec);
	vmovsd	-66312(%rbp), %xmm0	# %sfp, ops_per_sec
	movq	-66368(%rbp), %rdi	# %sfp,
	movl	%ebx, %edx	# decimals,
	leaq	.LC73(%rip), %rsi	#, tmp1528
	movl	$1, %eax	#,
	call	gzprintf@PLT	#
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:54:   free (__ptr);
	movq	%r15, %rdi	# a.131_106,
	call	free@PLT	#
	movq	%r13, %rdi	# b.130_105,
	call	free@PLT	#
# sub.c:1449:     gzclose(test_file);
	movq	-66320(%rbp), %rdi	# %sfp,
	call	gzclose@PLT	#
.L828:
# sub.c:1461:         gzclose(cputime_file);
	movq	-66368(%rbp), %rdi	# %sfp,
	call	gzclose@PLT	#
	jmp	.L872	#
.L2763:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k4, 1(%rdx)	# tmp2978, MEM[(__mmask8 *)_1220]
	jmp	.L1147	#
.L2801:
	kmovb	%k2, 2(%rdx)	# tmp2894, MEM[(__mmask8 *)_1308]
	jmp	.L1074	#
.L2800:
	kmovb	%k7, 1(%rdx)	# tmp2886, MEM[(__mmask8 *)_1308]
	jmp	.L1072	#
.L2799:
	kmovb	%k5, 1(%rsi)	# tmp2229, MEM[(__mmask8 *)_1308]
	jmp	.L1070	#
.L784:
	movl	%edi, -66312(%rbp)	# n, %sfp
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC62(%rip), %rdi	#, tmp1168
	call	puts@PLT	#
# sub.c:1373:             fflush(stdout);
	movq	stdout(%rip), %rdi	# stdout,
	call	fflush@PLT	#
# sub.c:1374:             __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);
	xorl	%eax, %eax	# tmp1170
#APP
# 1374 "sub.c" 1
	cpuid
		
# 0 "" 2
# sub.c:1375:             TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
#NO_APP
	movq	-66224(%rbp), %r15	# b, b.122_89
	movq	-66288(%rbp), %r13	# a, a.123_90
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15), %r9	# MEM[(uint64_t *)b.122_89 + j_604 * 8], tmp4738
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %rdi	# sub_space_ptr, sub_space_ptr
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %rsi	# sub_space, sub_space
	leaq	-1(%r12), %r8	#, tmp1889
	andl	$7, %r8d	#, tmp1891
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%r9, 0(%r13)	# tmp4738, MEM[(uint64_t *)a.123_90 + j_604 * 8]
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%rsi,%rdi,8), %rcx	#, result
# sub.c:172:         if (likely(a[j] > b[j]))
	movl	-66312(%rbp), %r9d	# %sfp, n
	jbe	.L2803	#,
.L929:
	movq	%r15, %r11	# b.122_89, b
	movq	%r13, %r8	# a.123_90, a
.L829:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8), %zmm4	# MEM[(__m512i * {ref-all})a_626 + i_624 * 8], tmp4744
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %rsi	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r11), %zmm4, %zmm0	# MEM[(__m512i * {ref-all})b_629 + i_624 * 8], tmp4744, tmp1207
	leaq	-1(%r12), %r10	#, tmp1885
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k1	#, zeros, tmp1207, tmp1209
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm0, %zmm1	# tmp1207, tmp1207
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %rsi	# borrow_space, bm
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm0, %zmm1{%k1}	# limb_digits, tmp1207, tmp1207, tmp1209, tmp1207
	shrq	$3, %r10	#, tmp1883
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rcx)	# tmp1213, MEM[(__m512i * {ref-all})result_603 + i_624 * 8]
	andl	$3, %r10d	#, tmp1886
# sub.c:217:         i += 8;
	movl	$8, %ebx	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%rsi), %rdx	#, ivtmp.794
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, (%rsi)	# tmp1209, MEM[(__mmask8 *)_2046]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %r12	#, sub_size
	jbe	.L2370	#,
	testq	%r10, %r10	# tmp1886
	je	.L833	#,
	cmpq	$1, %r10	#, tmp1886
	je	.L2061	#,
	cmpq	$2, %r10	#, tmp1886
	jne	.L2804	#,
.L2062:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rbx,8), %zmm5	# MEM[(__m512i * {ref-all})a_626 + i_624 * 8], tmp5235
# sub.c:219:     } while (likely(i < n));
	incq	%rdx	# ivtmp.794
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r11,%rbx,8), %zmm5, %zmm6	# MEM[(__m512i * {ref-all})b_629 + i_624 * 8], tmp5235, tmp3838
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k3	#, zeros, tmp3838, tmp3840
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm6, %zmm8	# tmp3838, tmp3838
	vpaddq	limb_digits(%rip), %zmm6, %zmm8{%k3}	# limb_digits, tmp3838, tmp3838, tmp3840, tmp3838
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rcx,%rbx,8)	# tmp3842, MEM[(__m512i * {ref-all})result_603 + i_624 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rbx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, -1(%rdx)	# tmp3840, MEM[(__mmask8 *)_2046]
.L2061:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rbx,8), %zmm9	# MEM[(__m512i * {ref-all})a_626 + i_624 * 8], tmp5237
# sub.c:219:     } while (likely(i < n));
	incq	%rdx	# ivtmp.794
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r11,%rbx,8), %zmm9, %zmm10	# MEM[(__m512i * {ref-all})b_629 + i_624 * 8], tmp5237, tmp3844
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k4	#, zeros, tmp3844, tmp3846
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm10, %zmm11	# tmp3844, tmp3844
	vpaddq	limb_digits(%rip), %zmm10, %zmm11{%k4}	# limb_digits, tmp3844, tmp3844, tmp3846, tmp3844
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rcx,%rbx,8)	# tmp3848, MEM[(__m512i * {ref-all})result_603 + i_624 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rbx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, -1(%rdx)	# tmp3846, MEM[(__mmask8 *)_2046]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rbx, %r12	# i, sub_size
	jbe	.L2370	#,
.L833:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rbx,8), %zmm12	# MEM[(__m512i * {ref-all})a_626 + i_624 * 8], tmp4746
# sub.c:217:         i += 8;
	leaq	8(%rbx), %rdi	#, tmp1887
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r11,%rbx,8), %zmm12, %zmm13	# MEM[(__m512i * {ref-all})b_629 + i_624 * 8], tmp4746, tmp2242
# sub.c:217:         i += 8;
	leaq	16(%rbx), %rax	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k5	#, zeros, tmp2242, tmp2244
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm13, %zmm14	# tmp2242, tmp2242
# sub.c:217:         i += 8;
	leaq	24(%rbx), %r10	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm13, %zmm14{%k5}	# limb_digits, tmp2242, tmp2242, tmp2244, tmp2242
# sub.c:219:     } while (likely(i < n));
	addq	$4, %rdx	#, ivtmp.794
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rcx,%rbx,8)	# tmp2246, MEM[(__m512i * {ref-all})result_603 + i_624 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, -4(%rdx)	# tmp2244, MEM[(__mmask8 *)_2046]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rdi,8), %zmm15	# MEM[(__m512i * {ref-all})a_626 + i_624 * 8], tmp4748
# sub.c:217:         i += 8;
	addq	$32, %rbx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%r11,%rdi,8), %zmm15, %zmm4	# MEM[(__m512i * {ref-all})b_629 + i_624 * 8], tmp4748, tmp2250
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm4, %k6	#, zeros, tmp2250, tmp2252
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm4, %zmm0	# tmp2250, tmp2250
	vpaddq	limb_digits(%rip), %zmm4, %zmm0{%k6}	# limb_digits, tmp2250, tmp2250, tmp2252, tmp2250
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rcx,%rdi,8)	# tmp2254, MEM[(__m512i * {ref-all})result_603 + i_624 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, -3(%rdx)	# tmp2252, MEM[(__mmask8 *)_2046]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rax,8), %zmm1	# MEM[(__m512i * {ref-all})a_626 + i_624 * 8], tmp4750
	vpsubq	(%r11,%rax,8), %zmm1, %zmm7	# MEM[(__m512i * {ref-all})b_629 + i_624 * 8], tmp4750, tmp2258
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm7, %k7	#, zeros, tmp2258, tmp2260
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm7, %zmm2	# tmp2258, tmp2258
	vpaddq	limb_digits(%rip), %zmm7, %zmm2{%k7}	# limb_digits, tmp2258, tmp2258, tmp2260, tmp2258
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, (%rcx,%rax,8)	# tmp2262, MEM[(__m512i * {ref-all})result_603 + i_624 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, -2(%rdx)	# tmp2260, MEM[(__mmask8 *)_2046]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%r10,8), %zmm3	# MEM[(__m512i * {ref-all})a_626 + i_624 * 8], tmp4752
	vpsubq	(%r11,%r10,8), %zmm3, %zmm5	# MEM[(__m512i * {ref-all})b_629 + i_624 * 8], tmp4752, tmp2266
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k1	#, zeros, tmp2266, tmp2268
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm5, %zmm6	# tmp2266, tmp2266
	vpaddq	limb_digits(%rip), %zmm5, %zmm6{%k1}	# limb_digits, tmp2266, tmp2266, tmp2268, tmp2266
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rcx,%r10,8)	# tmp2270, MEM[(__m512i * {ref-all})result_603 + i_624 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, -1(%rdx)	# tmp2268, MEM[(__mmask8 *)_2046]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rbx, %r12	# i, sub_size
	ja	.L833	#,
.L2370:
# sub.c:218:         j++;
	leaq	-1(%r12), %rdi	#, tmp2235
	movq	%rdi, %r11	# tmp2235, tmp1221
	shrq	$3, %r11	#, tmp1221
	xorl	%r8d, %r8d	# j
	testl	%r9d, %r9d	# n
	setne	%r8b	#, j
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	imull	%r11d, %r8d	# tmp1221, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm8	# zeros, tmp4754
	movslq	%r8d, %r10	# i, ivtmp.782
	vmovdqu64	%zmm8, (%rcx,%r12,8)	# tmp4754, MEM[(__m512i_u * {ref-all})_651]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%r8d, %r8d	# i
	js	.L837	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rsi,%r10), %ebx	# MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1],
	movl	%r10d, %r11d	# ivtmp.782, tmp1881
	movl	%ebx, %edx	#,
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movl	%r10d, %r8d	# ivtmp.782, tmp4158
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	addl	%ebx, %ebx	# tmp1225
	andl	$7, %r11d	#, tmp1881
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dl	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decl	%r8d	# tmp4158
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%bl, (%rsi,%r10)	# tmp1225, MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-1(%r10), %rax	#, ivtmp.782
	js	.L837	#,
	testl	%r11d, %r11d	# tmp1881
	je	.L836	#,
	cmpl	$1, %r11d	#, tmp1881
	je	.L2055	#,
	cmpl	$2, %r11d	#, tmp1881
	je	.L2056	#,
	cmpl	$3, %r11d	#, tmp1881
	je	.L2057	#,
	cmpl	$4, %r11d	#, tmp1881
	je	.L2058	#,
	cmpl	$5, %r11d	#, tmp1881
	je	.L2059	#,
	cmpl	$6, %r11d	#, tmp1881
	je	.L2060	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rsi,%rax), %r11d	# MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r11,%r11), %ebx	#, tmp3805
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%ebx, %edx	# tmp3805, tmp3806
	movb	%dl, (%rsi,%rax)	# tmp3806, MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r11d, %edx	# temp, temp
	shrb	$7, %dl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-2(%r10), %rax	#, ivtmp.782
.L2060:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rsi,%rax), %r10d	# MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r10,%r10), %r8d	#, tmp3809
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %edx	# tmp3809, tmp3810
	movb	%dl, (%rsi,%rax)	# tmp3810, MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r10d, %edx	# temp, temp
	shrb	$7, %dl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rax	# ivtmp.782
.L2059:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rsi,%rax), %r11d	# MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r11,%r11), %ebx	#, tmp3813
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%ebx, %edx	# tmp3813, tmp3814
	movb	%dl, (%rsi,%rax)	# tmp3814, MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r11d, %edx	# temp, temp
	shrb	$7, %dl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rax	# ivtmp.782
.L2058:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rsi,%rax), %r10d	# MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r10,%r10), %r8d	#, tmp3817
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %edx	# tmp3817, tmp3818
	movb	%dl, (%rsi,%rax)	# tmp3818, MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r10d, %edx	# temp, temp
	shrb	$7, %dl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rax	# ivtmp.782
.L2057:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rsi,%rax), %r11d	# MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r11,%r11), %ebx	#, tmp3821
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%ebx, %edx	# tmp3821, tmp3822
	movb	%dl, (%rsi,%rax)	# tmp3822, MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r11d, %edx	# temp, temp
	shrb	$7, %dl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rax	# ivtmp.782
.L2056:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rsi,%rax), %r10d	# MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r10,%r10), %r8d	#, tmp3825
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %edx	# tmp3825, tmp3826
	movb	%dl, (%rsi,%rax)	# tmp3826, MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r10d, %edx	# temp, temp
	shrb	$7, %dl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rax	# ivtmp.782
.L2055:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rsi,%rax), %r11d	# MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r11,%r11), %ebx	#, tmp3829
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%ebx, %edx	# tmp3829, tmp3830
	movb	%dl, (%rsi,%rax)	# tmp3830, MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r11d, %edx	# temp, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rax	# ivtmp.782
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dl	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%eax, %eax	# ivtmp.782
	js	.L837	#,
.L836:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rsi,%rax), %r8d	# MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1], temp
	movzbl	-1(%rsi,%rax), %r11d	# MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %r10d	#, tmp2276
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %edx	# tmp2276, tmp2277
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r11,%r11), %ebx	#, tmp2282
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%dl, (%rsi,%rax)	# tmp2277, MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1]
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r8b	#, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-2(%rsi,%rax), %edx	# MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%ebx, %r8d	# tmp2282, tmp2283
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r11b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rdx,%rdx), %r10d	#, tmp2288
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r8b, -1(%rsi,%rax)	# tmp2283, MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r11d, %r8d	# temp, carry
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %r8d	# tmp2288, tmp2289
	movb	%r8b, -2(%rsi,%rax)	# tmp2289, MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1]
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-3(%rsi,%rax), %r8d	# MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dl	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %ebx	#, tmp2294
# sub.c:161:         carry = temp >> 7;
	movl	%edx, %r11d	# temp, carry
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%ebx, %r11d	# tmp2294, tmp2295
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r8b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r11b, -3(%rsi,%rax)	# tmp2295, MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %r11d	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-4(%rsi,%rax), %r8d	# MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %edx	#, tmp2300
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r8b	#, temp
	movl	%r8d, %ebx	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-5(%rsi,%rax), %r8d	# MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edx, %r11d	# tmp2300, tmp2301
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %r10d	#, tmp2306
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r8b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r11b, -4(%rsi,%rax)	# tmp2301, MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %r11d	# temp, carry
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-6(%rsi,%rax), %r8d	# MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %ebx	# tmp2306, tmp2307
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %edx	#, tmp2312
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edx, %r11d	# tmp2312, tmp2313
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-7(%rsi,%rax), %edx	# MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r8b	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%bl, -5(%rsi,%rax)	# tmp2307, MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1]
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rdx,%rdx), %r10d	#, tmp2318
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %ebx	# temp, carry
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %ebx	# tmp2318, tmp2319
	movb	%r11b, -6(%rsi,%rax)	# tmp2313, MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1]
	movb	%bl, -7(%rsi,%rax)	# tmp2319, MEM[(__mmask8 *)bm_623 + ivtmp.782_385 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	subq	$8, %rax	#, ivtmp.782
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dl	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%eax, %eax	# ivtmp.782
	jns	.L836	#,
.L837:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rcx), %zmm9	# MEM[(__m512i * {ref-all})result_603 + i_2089 * 8], _2085
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %eax	# MEM[(__mmask8 *)_382], MEM[(__mmask8 *)_382]
	leaq	-1(%r12), %r11	#, tmp1876
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%eax, %k2	# MEM[(__mmask8 *)_382], tmp4758
	vpsubq	ones(%rip), %zmm9, %zmm9{%k2}	# ones, _2085, tmp1227, tmp4758, _2085
	shrq	$3, %r11	#, tmp1874
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rcx)	# tmp1227, MEM[(__m512i * {ref-all})result_603 + i_2089 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k0	#, zeros, tmp1227, tmp1233
	andl	$3, %r11d	#, tmp1877
	kmovb	%k0, %r8d	# tmp1233, tmp1233
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%r8b, %r8b	# tmp1233
	jne	.L2805	#,
.L1749:
# sub.c:249:         i += 8;
	movl	$8, %ebx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.777
	cmpq	$8, %r12	#, sub_size
	jbe	.L2724	#,
	testq	%r11, %r11	# tmp1877
	je	.L835	#,
	cmpq	$1, %r11	#, tmp1877
	je	.L2053	#,
	cmpq	$2, %r11	#, tmp1877
	je	.L2054	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rcx,%rbx,8), %zmm10	# MEM[(__m512i * {ref-all})result_603 + i_2089 * 8], _2085
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %edx	# MEM[(__mmask8 *)_382], MEM[(__mmask8 *)_382]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edx, %k3	# MEM[(__mmask8 *)_382], tmp5218
	vpsubq	ones(%rip), %zmm10, %zmm10{%k3}	# ones, _2085, tmp3772, tmp5218, _2085
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, (%rcx,%rbx,8)	# tmp3772, MEM[(__m512i * {ref-all})result_603 + i_2089 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k4	#, zeros, tmp3772, tmp3774
	kmovb	%k4, %r10d	# tmp3774, tmp3774
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%r10b, %r10b	# tmp3774
	jne	.L2806	#,
.L1751:
# sub.c:249:         i += 8;
	addq	$8, %rbx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.777
.L2054:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rcx,%rbx,8), %zmm11	# MEM[(__m512i * {ref-all})result_603 + i_2089 * 8], _2085
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %r11d	# MEM[(__mmask8 *)_382], MEM[(__mmask8 *)_382]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r11d, %k5	# MEM[(__mmask8 *)_382], tmp5220
	vpsubq	ones(%rip), %zmm11, %zmm11{%k5}	# ones, _2085, tmp3778, tmp5220, _2085
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rcx,%rbx,8)	# tmp3778, MEM[(__m512i * {ref-all})result_603 + i_2089 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm11, %k6	#, zeros, tmp3778, tmp3780
	kmovb	%k6, %eax	# tmp3780, tmp3780
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%al, %al	# tmp3780
	jne	.L2807	#,
.L1754:
# sub.c:249:         i += 8;
	addq	$8, %rbx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.777
.L2053:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rcx,%rbx,8), %zmm12	# MEM[(__m512i * {ref-all})result_603 + i_2089 * 8], _2085
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %r8d	# MEM[(__mmask8 *)_382], MEM[(__mmask8 *)_382]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k7	# MEM[(__mmask8 *)_382], tmp5222
	vpsubq	ones(%rip), %zmm12, %zmm12{%k7}	# ones, _2085, tmp3784, tmp5222, _2085
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm12, (%rcx,%rbx,8)	# tmp3784, MEM[(__m512i * {ref-all})result_603 + i_2089 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k1	#, zeros, tmp3784, tmp3786
	kmovb	%k1, %edx	# tmp3786, tmp3786
# sub.c:242:         if (unlikely(borrow_mask))
	testb	%dl, %dl	# tmp3786
	jne	.L2808	#,
.L1757:
# sub.c:249:         i += 8;
	addq	$8, %rbx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.777
	cmpq	%rbx, %r12	# i, sub_size
	ja	.L835	#,
.L2724:
	vzeroupper
.L839:
# sub.c:218:         j++;
	shrq	$3, %rdi	#, tmp1201
	xorl	%ecx, %ecx	# j
	testl	%r9d, %r9d	# n
	setne	%cl	#, j
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	imull	%edi, %ecx	# tmp1201, j
	leaq	-66192(%rbp), %rdi	#, tmp1662
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movq	$1, -66344(%rbp)	#, %sfp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movl	%ecx, -66312(%rbp)	# i, %sfp
	movq	%rdi, -66336(%rbp)	# tmp1662, %sfp
	movslq	%ecx, %rbx	# i, ivtmp.747
	.p2align 4,,10
	.p2align 3
.L1895:
# sub.c:1527:     clock_gettime(CLOCK_MONOTONIC_RAW, &ts);
	movq	-66336(%rbp), %rsi	# %sfp,
	movl	$4, %edi	#,
# sub.c:1375:             TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
	salq	-66344(%rbp)	# %sfp
# sub.c:1527:     clock_gettime(CLOCK_MONOTONIC_RAW, &ts);
	call	clock_gettime@PLT	#
# sub.c:1528:     return ts;
	movq	-66184(%rbp), %r11	# MEM <__syscall_slong_t> [(struct timespec *)_2061], SR.206
	movq	-66192(%rbp), %r9	# MEM <__time_t> [(struct timespec *)_2061], SR.205
	movq	-66344(%rbp), %rax	# %sfp, __times
	movq	%r11, -66328(%rbp)	# SR.206, %sfp
	movq	%r9, -66352(%rbp)	# SR.205, %sfp
	movl	%eax, %r11d	# __times, _379
# sub.c:1375:             TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
	xorl	%r10d, %r10d	# __t
	testq	%rax, %rax	# __times
	jle	.L846	#,
	.p2align 4,,10
	.p2align 3
.L845:
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %r8	# sub_space_ptr, sub_space_ptr
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %rdx	# sub_space, sub_space
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15), %rcx	# MEM[(uint64_t *)b.122_89 + j_693 * 8], tmp4773
	leaq	-1(%r12), %rsi	#, tmp1870
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%rdx,%r8,8), %rax	#, result
	andl	$7, %esi	#, tmp1872
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%rcx, 0(%r13)	# tmp4773, MEM[(uint64_t *)a.123_90 + j_693 * 8]
	jbe	.L2809	#,
.L931:
	movq	%r15, %rdi	# b.122_89, b
	movq	%r13, %r8	# a.123_90, a
.L843:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8), %zmm0	# MEM[(__m512i * {ref-all})a_715 + i_713 * 8], tmp4776
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %rdx	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi), %zmm0, %zmm7	# MEM[(__m512i * {ref-all})b_718 + i_713 * 8], tmp4776, tmp1246
	leaq	-1(%r12), %r9	#, tmp1866
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm7, %k2	#, zeros, tmp1246, tmp1248
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm7, %zmm1	# tmp1246, tmp1246
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %rdx	# borrow_space, bm
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm7, %zmm1{%k2}	# limb_digits, tmp1246, tmp1246, tmp1248, tmp1246
	shrq	$3, %r9	#, tmp1864
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rax)	# tmp1252, MEM[(__m512i * {ref-all})result_692 + i_713 * 8]
	andl	$3, %r9d	#, tmp1867
# sub.c:217:         i += 8;
	movl	$8, %ecx	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%rdx), %rsi	#, ivtmp.759
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, (%rdx)	# tmp1248, MEM[(__mmask8 *)_1200]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %r12	#, sub_size
	jbe	.L2376	#,
	testq	%r9, %r9	# tmp1867
	je	.L848	#,
	cmpq	$1, %r9	#, tmp1867
	je	.L2043	#,
	cmpq	$2, %r9	#, tmp1867
	je	.L2044	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%r8), %zmm2	# MEM[(__m512i * {ref-all})a_715 + i_713 * 8], tmp5199
# sub.c:217:         i += 8;
	movl	$16, %ecx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%rdi), %zmm2, %zmm3	# MEM[(__m512i * {ref-all})b_718 + i_713 * 8], tmp5199, tmp3720
# sub.c:219:     } while (likely(i < n));
	leaq	2(%rdx), %rsi	#, ivtmp.759
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k3	#, zeros, tmp3720, tmp3722
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm3, %zmm5	# tmp3720, tmp3720
	vpaddq	limb_digits(%rip), %zmm3, %zmm5{%k3}	# limb_digits, tmp3720, tmp3720, tmp3722, tmp3720
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, 64(%rax)	# tmp3724, MEM[(__m512i * {ref-all})result_692 + i_713 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, 1(%rdx)	# tmp3722, MEM[(__mmask8 *)_1200]
.L2044:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rcx,8), %zmm6	# MEM[(__m512i * {ref-all})a_715 + i_713 * 8], tmp5201
# sub.c:219:     } while (likely(i < n));
	incq	%rsi	# ivtmp.759
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rcx,8), %zmm6, %zmm8	# MEM[(__m512i * {ref-all})b_718 + i_713 * 8], tmp5201, tmp3726
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm8, %k4	#, zeros, tmp3726, tmp3728
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm8, %zmm9	# tmp3726, tmp3726
	vpaddq	limb_digits(%rip), %zmm8, %zmm9{%k4}	# limb_digits, tmp3726, tmp3726, tmp3728, tmp3726
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rax,%rcx,8)	# tmp3730, MEM[(__m512i * {ref-all})result_692 + i_713 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, -1(%rsi)	# tmp3728, MEM[(__mmask8 *)_1200]
.L2043:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rcx,8), %zmm10	# MEM[(__m512i * {ref-all})a_715 + i_713 * 8], tmp5203
# sub.c:219:     } while (likely(i < n));
	incq	%rsi	# ivtmp.759
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rcx,8), %zmm10, %zmm11	# MEM[(__m512i * {ref-all})b_718 + i_713 * 8], tmp5203, tmp3732
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm11, %k5	#, zeros, tmp3732, tmp3734
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm11, %zmm12	# tmp3732, tmp3732
	vpaddq	limb_digits(%rip), %zmm11, %zmm12{%k5}	# limb_digits, tmp3732, tmp3732, tmp3734, tmp3732
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm12, (%rax,%rcx,8)	# tmp3736, MEM[(__m512i * {ref-all})result_692 + i_713 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, -1(%rsi)	# tmp3734, MEM[(__mmask8 *)_1200]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rcx, %r12	# i, sub_size
	jbe	.L2376	#,
.L848:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rcx,8), %zmm13	# MEM[(__m512i * {ref-all})a_715 + i_713 * 8], tmp4778
# sub.c:217:         i += 8;
	leaq	8(%rcx), %r9	#, tmp1868
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rcx,8), %zmm13, %zmm14	# MEM[(__m512i * {ref-all})b_718 + i_713 * 8], tmp4778, tmp2345
# sub.c:219:     } while (likely(i < n));
	addq	$4, %rsi	#, ivtmp.759
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k6	#, zeros, tmp2345, tmp2347
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm14, %zmm15	# tmp2345, tmp2345
	vpaddq	limb_digits(%rip), %zmm14, %zmm15{%k6}	# limb_digits, tmp2345, tmp2345, tmp2347, tmp2345
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, (%rax,%rcx,8)	# tmp2349, MEM[(__m512i * {ref-all})result_692 + i_713 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, -4(%rsi)	# tmp2347, MEM[(__mmask8 *)_1200]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%r9,8), %zmm4	# MEM[(__m512i * {ref-all})a_715 + i_713 * 8], tmp4780
	vpsubq	(%rdi,%r9,8), %zmm4, %zmm0	# MEM[(__m512i * {ref-all})b_718 + i_713 * 8], tmp4780, tmp2353
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k7	#, zeros, tmp2353, tmp2355
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm0, %zmm7	# tmp2353, tmp2353
	vpaddq	limb_digits(%rip), %zmm0, %zmm7{%k7}	# limb_digits, tmp2353, tmp2353, tmp2355, tmp2353
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm7, (%rax,%r9,8)	# tmp2357, MEM[(__m512i * {ref-all})result_692 + i_713 * 8]
# sub.c:217:         i += 8;
	leaq	16(%rcx), %r9	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, -3(%rsi)	# tmp2355, MEM[(__mmask8 *)_1200]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%r9,8), %zmm1	# MEM[(__m512i * {ref-all})a_715 + i_713 * 8], tmp4782
	vpsubq	(%rdi,%r9,8), %zmm1, %zmm2	# MEM[(__m512i * {ref-all})b_718 + i_713 * 8], tmp4782, tmp2361
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k1	#, zeros, tmp2361, tmp2363
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm2, %zmm3	# tmp2361, tmp2361
	vpaddq	limb_digits(%rip), %zmm2, %zmm3{%k1}	# limb_digits, tmp2361, tmp2361, tmp2363, tmp2361
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rax,%r9,8)	# tmp2365, MEM[(__m512i * {ref-all})result_692 + i_713 * 8]
# sub.c:217:         i += 8;
	leaq	24(%rcx), %r9	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, -2(%rsi)	# tmp2363, MEM[(__mmask8 *)_1200]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%r9,8), %zmm5	# MEM[(__m512i * {ref-all})a_715 + i_713 * 8], tmp4784
# sub.c:217:         i += 8;
	addq	$32, %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%r9,8), %zmm5, %zmm6	# MEM[(__m512i * {ref-all})b_718 + i_713 * 8], tmp4784, tmp2369
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k2	#, zeros, tmp2369, tmp2371
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm6, %zmm8	# tmp2369, tmp2369
	vpaddq	limb_digits(%rip), %zmm6, %zmm8{%k2}	# limb_digits, tmp2369, tmp2369, tmp2371, tmp2369
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rax,%r9,8)	# tmp2373, MEM[(__m512i * {ref-all})result_692 + i_713 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, -1(%rsi)	# tmp2371, MEM[(__mmask8 *)_1200]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rcx, %r12	# i, sub_size
	ja	.L848	#,
.L2376:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm9	# zeros, tmp4786
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movl	-66312(%rbp), %edi	# %sfp,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqu64	%zmm9, (%rax,%r14)	# tmp4786, MEM[(__m512i_u * {ref-all})_741]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%edi, %edi	#
	js	.L851	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rbx), %r8d	# MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1],
	movl	%ebx, %r9d	# ivtmp.747, tmp1862
	movl	%r8d, %esi	#,
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movl	%ebx, %edi	# ivtmp.747, tmp4159
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	addl	%r8d, %r8d	# tmp1259
	andl	$7, %r9d	#, tmp1862
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decl	%edi	# tmp4159
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r8b, (%rdx,%rbx)	# tmp1259, MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-1(%rbx), %rcx	#, ivtmp.747
	js	.L851	#,
	testl	%r9d, %r9d	# tmp1862
	je	.L849	#,
	cmpl	$1, %r9d	#, tmp1862
	je	.L2037	#,
	cmpl	$2, %r9d	#, tmp1862
	je	.L2038	#,
	cmpl	$3, %r9d	#, tmp1862
	je	.L2039	#,
	cmpl	$4, %r9d	#, tmp1862
	je	.L2040	#,
	cmpl	$5, %r9d	#, tmp1862
	je	.L2041	#,
	cmpl	$6, %r9d	#, tmp1862
	je	.L2042	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-1(%rdx,%rbx), %edi	# MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rdi,%rdi), %ecx	#, tmp3693
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%esi, %ecx	# carry, tmp3694
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%cl, -1(%rdx,%rbx)	# tmp3694, MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%edi, %esi	# temp, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-2(%rbx), %rcx	#, ivtmp.747
.L2042:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %r8d	#, tmp3697
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %esi	# tmp3697, tmp3698
	movb	%sil, (%rdx,%rcx)	# tmp3698, MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.747
.L2041:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %edi	#, tmp3701
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %esi	# tmp3701, tmp3702
	movb	%sil, (%rdx,%rcx)	# tmp3702, MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.747
.L2040:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r8d	# MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %r9d	#, tmp3705
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %esi	# tmp3705, tmp3706
	movb	%sil, (%rdx,%rcx)	# tmp3706, MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.747
.L2039:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r8d	# MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %edi	#, tmp3709
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %esi	# tmp3709, tmp3710
	movb	%sil, (%rdx,%rcx)	# tmp3710, MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.747
.L2038:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %r8d	#, tmp3713
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %esi	# tmp3713, tmp3714
	movb	%sil, (%rdx,%rcx)	# tmp3714, MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.747
.L2037:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %edi	#, tmp3717
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %esi	# tmp3717, tmp3718
	movb	%sil, (%rdx,%rcx)	# tmp3718, MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.747
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%ecx, %ecx	# ivtmp.747
	js	.L851	#,
.L849:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1], temp
	movzbl	-1(%rdx,%rcx), %edi	# MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %r8d	#, tmp2378
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %esi	# tmp2378, tmp2379
	movb	%sil, (%rdx,%rcx)	# tmp2379, MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1]
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r9b	#, carry
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rdi,%rdi), %esi	#, tmp2384
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%esi, %r9d	# tmp2384, tmp2385
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-2(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r9b, -1(%rdx,%rcx)	# tmp2385, MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1]
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp2390
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %edi	# tmp2390, tmp2391
	movb	%dil, -2(%rdx,%rcx)	# tmp2391, MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-3(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r8d	#, tmp2396
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %edi	# tmp2396, tmp2397
	movb	%dil, -3(%rdx,%rcx)	# tmp2397, MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-4(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp2402
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %edi	# tmp2402, tmp2403
	movb	%dil, -4(%rdx,%rcx)	# tmp2403, MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-5(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r8d	#, tmp2408
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %edi	# tmp2408, tmp2409
	movb	%dil, -5(%rdx,%rcx)	# tmp2409, MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-6(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp2414
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %edi	# tmp2414, tmp2415
	movb	%dil, -6(%rdx,%rcx)	# tmp2415, MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-7(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r8d	#, tmp2420
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %edi	# tmp2420, tmp2421
	movb	%dil, -7(%rdx,%rcx)	# tmp2421, MEM[(__mmask8 *)bm_712 + ivtmp.747_478 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	subq	$8, %rcx	#, ivtmp.747
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%ecx, %ecx	# ivtmp.747
	jns	.L849	#,
.L851:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax), %zmm10	# MEM[(__m512i * {ref-all})result_692 + i_2109 * 8], _2105
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rdx), %ecx	# MEM[(__mmask8 *)_475], MEM[(__mmask8 *)_475]
	leaq	-1(%r12), %rdi	#, tmp1857
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k3	# MEM[(__mmask8 *)_475], tmp4791
	vpsubq	ones(%rip), %zmm10, %zmm10{%k3}	# ones, _2105, tmp1261, tmp4791, _2105
	shrq	$3, %rdi	#, tmp1855
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, (%rax)	# tmp1261, MEM[(__m512i * {ref-all})result_692 + i_2109 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k0	#, zeros, tmp1261, tmp1267
	movq	%rdi, %r9	# tmp1855, tmp1855
	andl	$3, %r9d	#, tmp1855
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp1267
	jne	.L2810	#,
.L1663:
# sub.c:249:         i += 8;
	movl	$8, %r8d	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rdx), %rsi	#, ivtmp.742
	cmpq	$8, %r12	#, sub_size
	jbe	.L853	#,
	testq	%r9, %r9	# tmp1858
	je	.L850	#,
	cmpq	$1, %r9	#, tmp1858
	je	.L2035	#,
	cmpq	$2, %r9	#, tmp1858
	je	.L2036	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	64(%rax), %zmm11	# MEM[(__m512i * {ref-all})result_692 + i_2109 * 8], _2105
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rdx), %edi	# MEM[(__mmask8 *)_475], MEM[(__mmask8 *)_475]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k4	# MEM[(__mmask8 *)_475], tmp5187
	vpsubq	ones(%rip), %zmm11, %zmm11{%k4}	# ones, _2105, tmp3660, tmp5187, _2105
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, 64(%rax)	# tmp3660, MEM[(__m512i * {ref-all})result_692 + i_2109 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm11, %k5	#, zeros, tmp3660, tmp3662
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k5, %k5	# tmp3662
	jne	.L2811	#,
.L1665:
# sub.c:249:         i += 8;
	addq	$8, %r8	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.742
.L2036:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r8,8), %zmm12	# MEM[(__m512i * {ref-all})result_692 + i_2109 * 8], _2105
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %edx	# MEM[(__mmask8 *)_475], MEM[(__mmask8 *)_475]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edx, %k6	# MEM[(__mmask8 *)_475], tmp5188
	vpsubq	ones(%rip), %zmm12, %zmm12{%k6}	# ones, _2105, tmp3666, tmp5188, _2105
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm12, (%rax,%r8,8)	# tmp3666, MEM[(__m512i * {ref-all})result_692 + i_2109 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k7	#, zeros, tmp3666, tmp3668
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k7, %k7	# tmp3668
	jne	.L2812	#,
.L1668:
# sub.c:249:         i += 8;
	addq	$8, %r8	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.742
.L2035:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r8,8), %zmm13	# MEM[(__m512i * {ref-all})result_692 + i_2109 * 8], _2105
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %r9d	# MEM[(__mmask8 *)_475], MEM[(__mmask8 *)_475]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k1	# MEM[(__mmask8 *)_475], tmp5189
	vpsubq	ones(%rip), %zmm13, %zmm13{%k1}	# ones, _2105, tmp3672, tmp5189, _2105
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rax,%r8,8)	# tmp3672, MEM[(__m512i * {ref-all})result_692 + i_2109 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k2	#, zeros, tmp3672, tmp3674
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k2, %k2	# tmp3674
	jne	.L2813	#,
.L1671:
# sub.c:249:         i += 8;
	addq	$8, %r8	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.742
	cmpq	%r8, %r12	# i, sub_size
	ja	.L850	#,
	jmp	.L853	#
	.p2align 4,,10
	.p2align 3
.L852:
# sub.c:249:         i += 8;
	addq	$8, %r8	#, tmp1859
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r8,8), %zmm15	# MEM[(__m512i * {ref-all})result_692 + i_2109 * 8], _2105
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rsi), %edi	# MEM[(__mmask8 *)_475], MEM[(__mmask8 *)_475]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rsi), %rdx	#, tmp1860
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k4	# MEM[(__mmask8 *)_475], tmp4799
	vpsubq	ones(%rip), %zmm15, %zmm15{%k4}	# ones, _2105, tmp2435, tmp4799, _2105
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, (%rax,%r8,8)	# tmp2435, MEM[(__m512i * {ref-all})result_692 + i_2109 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k5	#, zeros, tmp2435, tmp2437
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k5, %k5	# tmp2437
	jne	.L2814	#,
.L1674:
# sub.c:249:         i += 8;
	leaq	8(%r8), %rsi	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rsi,8), %zmm4	# MEM[(__m512i * {ref-all})result_692 + i_2109 * 8], _2105
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rdx), %r9d	# MEM[(__mmask8 *)_475], MEM[(__mmask8 *)_475]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k6	# MEM[(__mmask8 *)_475], tmp5190
	vpsubq	ones(%rip), %zmm4, %zmm4{%k6}	# ones, _2105, tmp3680, tmp5190, _2105
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm4, (%rax,%rsi,8)	# tmp3680, MEM[(__m512i * {ref-all})result_692 + i_2109 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm4, %k7	#, zeros, tmp3680, tmp3682
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k7, %k7	# tmp3682
	jne	.L2815	#,
.L1676:
# sub.c:249:         i += 8;
	leaq	16(%r8), %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm0	# MEM[(__m512i * {ref-all})result_692 + i_2109 * 8], _2105
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%rdx), %edi	# MEM[(__mmask8 *)_475], MEM[(__mmask8 *)_475]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k1	# MEM[(__mmask8 *)_475], tmp5191
	vpsubq	ones(%rip), %zmm0, %zmm0{%k1}	# ones, _2105, tmp3688, tmp5191, _2105
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rax,%rcx,8)	# tmp3688, MEM[(__m512i * {ref-all})result_692 + i_2109 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k2	#, zeros, tmp3688, tmp3690
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k2, %k2	# tmp3690
	jne	.L2816	#,
.L1678:
# sub.c:249:         i += 8;
	addq	$24, %r8	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%rdx), %rsi	#, ivtmp.742
	cmpq	%r8, %r12	# i, sub_size
	jbe	.L853	#,
.L850:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r8,8), %zmm14	# MEM[(__m512i * {ref-all})result_692 + i_2109 * 8], _2105
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %ecx	# MEM[(__mmask8 *)_475], MEM[(__mmask8 *)_475]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k3	# MEM[(__mmask8 *)_475], tmp4798
	vpsubq	ones(%rip), %zmm14, %zmm14{%k3}	# ones, _2105, tmp2427, tmp4798, _2105
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rax,%r8,8)	# tmp2427, MEM[(__m512i * {ref-all})result_692 + i_2109 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k0	#, zeros, tmp2427, tmp2429
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp2429
	je	.L852	#,
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rsi)	# tmp2429, MEM[(__mmask8 *)_475]
	jmp	.L852	#
.L2820:
	kmovb	%k0, (%rsi)	# tmp2327, MEM[(__mmask8 *)_382]
.L838:
# sub.c:249:         i += 8;
	addq	$8, %rbx	#, tmp1878
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rcx,%rbx,8), %zmm14	# MEM[(__m512i * {ref-all})result_603 + i_2089 * 8], _2085
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rsi), %eax	# MEM[(__mmask8 *)_382], MEM[(__mmask8 *)_382]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rsi), %r11	#, tmp1879
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%eax, %k3	# MEM[(__mmask8 *)_382], tmp4767
	vpsubq	ones(%rip), %zmm14, %zmm14{%k3}	# ones, _2085, tmp2333, tmp4767, _2085
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rcx,%rbx,8)	# tmp2333, MEM[(__m512i * {ref-all})result_603 + i_2089 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k4	#, zeros, tmp2333, tmp2335
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k4, %k4	# tmp2335
	jne	.L2817	#,
.L1760:
# sub.c:249:         i += 8;
	leaq	8(%rbx), %rsi	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rcx,%rsi,8), %zmm15	# MEM[(__m512i * {ref-all})result_603 + i_2089 * 8], _2085
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%r11), %r8d	# MEM[(__mmask8 *)_382], MEM[(__mmask8 *)_382]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k5	# MEM[(__mmask8 *)_382], tmp5224
	vpsubq	ones(%rip), %zmm15, %zmm15{%k5}	# ones, _2085, tmp3792, tmp5224, _2085
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, (%rcx,%rsi,8)	# tmp3792, MEM[(__m512i * {ref-all})result_603 + i_2089 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm15, %k6	#, zeros, tmp3792, tmp3794
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k6, %k6	# tmp3794
	jne	.L2818	#,
.L1762:
# sub.c:249:         i += 8;
	leaq	16(%rbx), %rdx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rcx,%rdx,8), %zmm4	# MEM[(__m512i * {ref-all})result_603 + i_2089 * 8], _2085
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%r11), %r10d	# MEM[(__mmask8 *)_382], MEM[(__mmask8 *)_382]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r10d, %k7	# MEM[(__mmask8 *)_382], tmp5225
	vpsubq	ones(%rip), %zmm4, %zmm4{%k7}	# ones, _2085, tmp3800, tmp5225, _2085
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm4, (%rcx,%rdx,8)	# tmp3800, MEM[(__m512i * {ref-all})result_603 + i_2089 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm4, %k1	#, zeros, tmp3800, tmp3802
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k1, %k1	# tmp3802
	jne	.L2819	#,
.L1764:
# sub.c:249:         i += 8;
	addq	$24, %rbx	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%r11), %rsi	#, ivtmp.777
	cmpq	%rbx, %r12	# i, sub_size
	jbe	.L2724	#,
.L835:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rcx,%rbx,8), %zmm13	# MEM[(__m512i * {ref-all})result_603 + i_2089 * 8], _2085
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %r10d	# MEM[(__mmask8 *)_382], MEM[(__mmask8 *)_382]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r10d, %k2	# MEM[(__mmask8 *)_382], tmp4766
	vpsubq	ones(%rip), %zmm13, %zmm13{%k2}	# ones, _2085, tmp2325, tmp4766, _2085
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, (%rcx,%rbx,8)	# tmp2325, MEM[(__m512i * {ref-all})result_603 + i_2089 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k0	#, zeros, tmp2325, tmp2327
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp2327
	je	.L838	#,
	jmp	.L2820	#
.L768:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC31(%rip), %rsi	#, tmp1648
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1667
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC32(%rip), %r8	#,
	movq	%r12, %rdi	# tmp1667,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %edi	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%rdi	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-65712(%rbp), %r13	#, tmp1660
	leaq	.LC87(%rip), %r8	#,
	jmp	.L2740	#
.L2794:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L927	#,
# sub.c:185:         j++;
	movl	$1, %edx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %r12	#, sub_size
	je	.L825	#,
# sub.c:192:     } while (j < n);
	jbe	.L926	#,
	testq	%rcx, %rcx	# tmp1737
	je	.L819	#,
	cmpq	$1, %rcx	#, tmp1737
	je	.L1920	#,
	cmpq	$2, %rcx	#, tmp1737
	je	.L1921	#,
	cmpq	$3, %rcx	#, tmp1737
	je	.L1922	#,
	cmpq	$4, %rcx	#, tmp1737
	je	.L1923	#,
	cmpq	$5, %rcx	#, tmp1737
	je	.L1924	#,
	cmpq	$6, %rcx	#, tmp1737
	jne	.L2821	#,
.L1925:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rbx,%rdx,8), %rsi	# MEM[(uint64_t *)b.114_69 + j_510 * 8], tmp4976
	cmpq	%rsi, (%r15,%rdx,8)	# tmp4976, MEM[(uint64_t *)a.115_70 + j_510 * 8]
	ja	.L926	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L927	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L825	#,
.L1924:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rbx,%rdx,8), %rcx	# MEM[(uint64_t *)b.114_69 + j_510 * 8], tmp4977
	cmpq	%rcx, (%r15,%rdx,8)	# tmp4977, MEM[(uint64_t *)a.115_70 + j_510 * 8]
	ja	.L926	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L927	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L825	#,
.L1923:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rbx,%rdx,8), %rdi	# MEM[(uint64_t *)b.114_69 + j_510 * 8], tmp4978
	cmpq	%rdi, (%r15,%rdx,8)	# tmp4978, MEM[(uint64_t *)a.115_70 + j_510 * 8]
	ja	.L926	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L927	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L825	#,
.L1922:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rbx,%rdx,8), %r8	# MEM[(uint64_t *)b.114_69 + j_510 * 8], tmp4979
	cmpq	%r8, (%r15,%rdx,8)	# tmp4979, MEM[(uint64_t *)a.115_70 + j_510 * 8]
	ja	.L926	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L927	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L825	#,
.L1921:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rbx,%rdx,8), %r9	# MEM[(uint64_t *)b.114_69 + j_510 * 8], tmp4980
	cmpq	%r9, (%r15,%rdx,8)	# tmp4980, MEM[(uint64_t *)a.115_70 + j_510 * 8]
	ja	.L926	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L927	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L825	#,
.L1920:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rbx,%rdx,8), %rsi	# MEM[(uint64_t *)b.114_69 + j_510 * 8], tmp4981
	cmpq	%rsi, (%r15,%rdx,8)	# tmp4981, MEM[(uint64_t *)a.115_70 + j_510 * 8]
	ja	.L926	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L927	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L825	#,
# sub.c:192:     } while (j < n);
	jbe	.L926	#,
.L819:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rbx,%rdx,8), %rcx	# MEM[(uint64_t *)b.114_69 + j_510 * 8], tmp4711
	cmpq	%rcx, (%r15,%rdx,8)	# tmp4711, MEM[(uint64_t *)a.115_70 + j_510 * 8]
	ja	.L926	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L927	#,
# sub.c:185:         j++;
	leaq	1(%rdx), %r8	#, tmp1738
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r8, %r12	# tmp1738, sub_size
	je	.L825	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rbx,%r8,8), %rdi	# MEM[(uint64_t *)b.114_69 + j_510 * 8], tmp4712
	cmpq	%rdi, (%r15,%r8,8)	# tmp4712, MEM[(uint64_t *)a.115_70 + j_510 * 8]
	ja	.L926	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L927	#,
# sub.c:185:         j++;
	leaq	2(%rdx), %r9	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r9, %r12	# j, sub_size
	je	.L825	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rbx,%r9,8), %rsi	# MEM[(uint64_t *)b.114_69 + j_510 * 8], tmp4982
	cmpq	%rsi, (%r15,%r9,8)	# tmp4982, MEM[(uint64_t *)a.115_70 + j_510 * 8]
	ja	.L926	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L927	#,
# sub.c:185:         j++;
	addq	$3, %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L825	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rbx,%rdx,8), %rcx	# MEM[(uint64_t *)b.114_69 + j_510 * 8], tmp4983
	cmpq	%rcx, (%r15,%rdx,8)	# tmp4983, MEM[(uint64_t *)a.115_70 + j_510 * 8]
	ja	.L926	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L927	#,
# sub.c:185:         j++;
	leaq	3(%r8), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L825	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rbx,%rdx,8), %rdi	# MEM[(uint64_t *)b.114_69 + j_510 * 8], tmp4984
	cmpq	%rdi, (%r15,%rdx,8)	# tmp4984, MEM[(uint64_t *)a.115_70 + j_510 * 8]
	ja	.L926	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L927	#,
# sub.c:185:         j++;
	leaq	4(%r8), %r9	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r9, %r12	# j, sub_size
	je	.L825	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rbx,%r9,8), %rsi	# MEM[(uint64_t *)b.114_69 + j_510 * 8], tmp4985
	cmpq	%rsi, (%r15,%r9,8)	# tmp4985, MEM[(uint64_t *)a.115_70 + j_510 * 8]
	ja	.L926	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L927	#,
# sub.c:185:         j++;
	leaq	5(%r8), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L825	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rbx,%rcx,8), %rdx	# MEM[(uint64_t *)b.114_69 + j_510 * 8], tmp4986
	cmpq	%rdx, (%r15,%rcx,8)	# tmp4986, MEM[(uint64_t *)a.115_70 + j_510 * 8]
	ja	.L926	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L927	#,
# sub.c:185:         j++;
	leaq	6(%r8), %r9	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r9, %r12	# j, sub_size
	je	.L825	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rbx,%r9,8), %rdi	# MEM[(uint64_t *)b.114_69 + j_510 * 8], tmp4987
	cmpq	%rdi, (%r15,%r9,8)	# tmp4987, MEM[(uint64_t *)a.115_70 + j_510 * 8]
	ja	.L926	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L927	#,
# sub.c:185:         j++;
	leaq	7(%r8), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L825	#,
# sub.c:192:     } while (j < n);
	ja	.L819	#,
	jmp	.L926	#
	.p2align 4,,10
	.p2align 3
.L2795:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rdx)	# tmp1161, MEM[(__mmask8 *)_1308]
	jmp	.L1059	#
.L922:
	movq	%r15, %r9	# a.115_70, b
	movq	%rdi, %r10	# b.114_69, a
	jmp	.L802	#
.L757:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC33(%rip), %rsi	#, tmp1588
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1667
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC34(%rip), %r8	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1667,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %r10d	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%r10	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-66048(%rbp), %r13	#, tmp1663
	leaq	.LC81(%rip), %r8	#,
	jmp	.L2731	#
.L765:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC29(%rip), %rsi	#, tmp1558
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1667
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC30(%rip), %r8	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1667,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %ecx	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%rcx	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-65824(%rbp), %r13	#, tmp1669
	leaq	.LC78(%rip), %r8	#,
	jmp	.L2735	#
.L763:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	CORE_NO(%rip), %ecx	# CORE_NO,
	movl	NUM_BITS(%rip), %edx	# NUM_BITS,
	leaq	.LC33(%rip), %rsi	#, tmp1618
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	-65936(%rbp), %r12	#, tmp1667
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	.LC34(%rip), %r8	#,
	movl	$100, %ecx	#,
	movl	$1, %edx	#,
	movl	$100, %esi	#,
	movq	%r12, %rdi	# tmp1667,
	xorl	%eax, %eax	#
	call	__snprintf_chk@PLT	#
	movl	CORE_NO(%rip), %eax	# CORE_NO, CORE_NO
	subq	$8, %rsp	#,
	pushq	%rax	# CORE_NO
	movl	NUM_BITS(%rip), %r9d	# NUM_BITS,
	leaq	-65824(%rbp), %r13	#, tmp1669
	leaq	.LC84(%rip), %r8	#,
	jmp	.L2735	#
.L2798:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k2, (%rsi)	# tmp2878, MEM[(__mmask8 *)_1308]
	jmp	.L1067	#
.L2754:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/emmintrin.h:1522:   __builtin_ia32_clflush (__A);
	clflush	(%r15)	# a.103_51
	clflush	(%rbx)	# b.104_52
# sub.c:1265:         for (int i = 0; i < n; i += 64)
	leaq	64(%r15), %r8	#, ivtmp.806
	leaq	64(%rbx), %r9	#, ivtmp.807
	jmp	.L1879	#
.L2804:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%r8), %zmm7	# MEM[(__m512i * {ref-all})a_626 + i_624 * 8], tmp5233
# sub.c:217:         i += 8;
	movl	$16, %ebx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%r11), %zmm7, %zmm2	# MEM[(__m512i * {ref-all})b_629 + i_624 * 8], tmp5233, tmp3832
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k2	#, zeros, tmp3832, tmp3834
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm2, %zmm3	# tmp3832, tmp3832
	vpaddq	limb_digits(%rip), %zmm2, %zmm3{%k2}	# limb_digits, tmp3832, tmp3832, tmp3834, tmp3832
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, 64(%rcx)	# tmp3836, MEM[(__m512i * {ref-all})result_603 + i_624 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, (%rdx)	# tmp3834, MEM[(__mmask8 *)_2046]
# sub.c:219:     } while (likely(i < n));
	leaq	2(%rsi), %rdx	#, ivtmp.794
	jmp	.L2062	#
.L2756:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%rdi), %zmm11	# MEM[(__m512i * {ref-all})a_338 + i_336 * 8], tmp5034
# sub.c:217:         i += 8;
	movl	$16, %ecx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%r13), %zmm11, %zmm12	# MEM[(__m512i * {ref-all})b_341 + i_336 * 8], tmp5034, tmp3148
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k1	#, zeros, tmp3148, tmp3150
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm12, %zmm13	# tmp3148, tmp3148
	vpaddq	limb_digits(%rip), %zmm12, %zmm13{%k1}	# limb_digits, tmp3148, tmp3148, tmp3150, tmp3148
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, 64(%rdx)	# tmp3152, MEM[(__m512i * {ref-all})result_315 + i_336 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, (%rsi)	# tmp3150, MEM[(__mmask8 *)_1340]
# sub.c:219:     } while (likely(i < n));
	leaq	2(%rax), %rsi	#, ivtmp.691
	jmp	.L1954	#
.L2773:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%r10), %zmm7	# MEM[(__m512i * {ref-all})a_913 + i_911 * 8], tmp5137
# sub.c:217:         i += 8;
	movl	$16, %ebx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%rdi), %zmm7, %zmm3	# MEM[(__m512i * {ref-all})b_916 + i_911 * 8], tmp5137, tmp3490
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k5	#, zeros, tmp3490, tmp3492
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm3, %zmm1	# tmp3490, tmp3490
	vpaddq	limb_digits(%rip), %zmm3, %zmm1{%k5}	# limb_digits, tmp3490, tmp3490, tmp3492, tmp3490
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, 64(%rcx)	# tmp3494, MEM[(__m512i * {ref-all})result_890 + i_911 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, (%rdx)	# tmp3492, MEM[(__mmask8 *)_1307]
# sub.c:219:     } while (likely(i < n));
	leaq	2(%rsi), %rdx	#, ivtmp.588
	jmp	.L2008	#
.L2807:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k6, (%rsi)	# tmp3780, MEM[(__mmask8 *)_382]
	jmp	.L1754	#
.L2776:
	kmovb	%k2, (%rsi)	# tmp3438, MEM[(__mmask8 *)_1333]
	jmp	.L1495	#
.L2759:
	kmovb	%k5, (%rax)	# tmp3096, MEM[(__mmask8 *)_667]
	jmp	.L1236	#
	.p2align 4,,10
	.p2align 3
.L2841:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	8(%r15), %rdi	# MEM[(uint64_t *)b.122_89 + j_693 * 8], tmp5205
	cmpq	%rdi, 8(%r13)	# tmp5205, MEM[(uint64_t *)a.123_90 + j_693 * 8]
	ja	.L931	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L932	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	jne	.L2051	#,
	.p2align 4,,10
	.p2align 3
.L853:
# sub.c:1375:             TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
	incl	%r10d	# __t
	cmpl	%r11d, %r10d	# _379, __t
	jne	.L845	#,
	vzeroupper
.L846:
# sub.c:1527:     clock_gettime(CLOCK_MONOTONIC_RAW, &ts);
	movq	-66336(%rbp), %rsi	# %sfp,
	movl	$4, %edi	#,
	call	clock_gettime@PLT	#
# sub.c:1528:     return ts;
	movq	-66184(%rbp), %r10	# MEM <__syscall_slong_t> [(struct timespec *)_2061], SR.212
	movq	-66192(%rbp), %rax	# MEM <__time_t> [(struct timespec *)_2061], SR.211
# sub.c:1535:     if ((end.tv_nsec - start.tv_nsec) < 0)
	movq	%r10, %r11	# SR.212, _777
	subq	-66328(%rbp), %r11	# %sfp, _777
	js	.L2822	#,
# sub.c:1542:         temp.tv_sec = end.tv_sec - start.tv_sec;
	subq	-66352(%rbp), %rax	# %sfp, tmp1276
# sub.c:1546:     return temp.tv_sec * 1000000000 + temp.tv_nsec;
	imulq	$1000000000, %rax, %r8	#, tmp1276, tmp1277
# sub.c:1546:     return temp.tv_sec * 1000000000 + temp.tv_nsec;
	addq	%r11, %r8	# _777, _204
# sub.c:1375:             TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
	cmpq	$249999999, %r8	#, _204
	jle	.L1895	#,
.L854:
# sub.c:1375:             TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
	vxorpd	%xmm7, %xmm7, %xmm7	# tmp4800
	vcvtsi2sdq	%r8, %xmm7, %xmm1	# _204, tmp4800, tmp3928
	vcvtsi2sdq	-66344(%rbp), %xmm7, %xmm3	# %sfp, tmp4801, tmp3929
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC64(%rip), %rdi	#, tmp1280
# sub.c:1375:             TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
	vdivsd	%xmm3, %xmm1, %xmm5	# tmp1279, tmp1278, time_taken
	vmovsd	%xmm5, -66328(%rbp)	# time_taken, %sfp
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	puts@PLT	#
# sub.c:1376:             time_taken_ms = time_taken / 1e6;
	vmovsd	.LC65(%rip), %xmm6	#, tmp4804
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC66(%rip), %rsi	#, tmp1283
# sub.c:1376:             time_taken_ms = time_taken / 1e6;
	vmulsd	-66328(%rbp), %xmm6, %xmm0	# %sfp, tmp4804, time_taken_ms
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk@PLT	#
# sub.c:1380:             niter = 1 + (unsigned long)(1e4 / time_taken_ms);
	vmovsd	.LC67(%rip), %xmm8	#, tmp1285
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC68(%rip), %rsi	#, tmp1287
# sub.c:1380:             niter = 1 + (unsigned long)(1e4 / time_taken_ms);
	vdivsd	-66328(%rbp), %xmm8, %xmm9	# %sfp, tmp1285, tmp1284
# sub.c:1380:             niter = 1 + (unsigned long)(1e4 / time_taken_ms);
	vcvttsd2usi	%xmm9, %rdx	# tmp1284, tmp1286
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
# sub.c:1380:             niter = 1 + (unsigned long)(1e4 / time_taken_ms);
	leal	1(%rdx), %r9d	#, niter
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	%r9d, %edx	# niter,
	movl	%r9d, -66352(%rbp)	# niter, %sfp
	call	__printf_chk@PLT	#
# sub.c:1382:             fflush(stdout);
	movq	stdout(%rip), %rdi	# stdout,
	call	fflush@PLT	#
# sub.c:1527:     clock_gettime(CLOCK_MONOTONIC_RAW, &ts);
	movq	-66336(%rbp), %rsi	# %sfp,
	movl	$4, %edi	#,
	call	clock_gettime@PLT	#
# sub.c:1528:     return ts;
	movq	-66192(%rbp), %rcx	# MEM <__time_t> [(struct timespec *)_2061], SR.213
	movq	-66184(%rbp), %rdi	# MEM <__syscall_slong_t> [(struct timespec *)_2061], SR.214
# sub.c:1385:             for (int i = 0; i < niter; i++)
	movl	-66352(%rbp), %r11d	# %sfp, niter
# sub.c:1528:     return ts;
	movq	%rcx, -66328(%rbp)	# SR.213, %sfp
	movq	%rdi, -66344(%rbp)	# SR.214, %sfp
# sub.c:1385:             for (int i = 0; i < niter; i++)
	xorl	%r10d, %r10d	# i
# sub.c:1385:             for (int i = 0; i < niter; i++)
	testl	%r11d, %r11d	# niter
	jle	.L860	#,
	.p2align 4,,10
	.p2align 3
.L855:
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %rsi	# sub_space_ptr, sub_space_ptr
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %rax	# sub_space, sub_space
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15), %rdx	# MEM[(uint64_t *)b.122_89 + j_792 * 8], tmp4811
	leaq	-1(%r12), %rcx	#, tmp1851
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%rax,%rsi,8), %rax	#, result
	andl	$7, %ecx	#, tmp1851
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%rdx, 0(%r13)	# tmp4811, MEM[(uint64_t *)a.123_90 + j_792 * 8]
	jbe	.L2823	#,
.L935:
	movq	%r15, %rdi	# b.122_89, b
	movq	%r13, %r8	# a.123_90, a
.L858:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8), %zmm10	# MEM[(__m512i * {ref-all})a_814 + i_812 * 8], tmp4814
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %rdx	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi), %zmm10, %zmm11	# MEM[(__m512i * {ref-all})b_817 + i_812 * 8], tmp4814, tmp1298
	leaq	-1(%r12), %r9	#, tmp1847
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm11, %k3	#, zeros, tmp1298, tmp1300
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm11, %zmm12	# tmp1298, tmp1298
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %rdx	# borrow_space, bm
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm11, %zmm12{%k3}	# limb_digits, tmp1298, tmp1298, tmp1300, tmp1298
	shrq	$3, %r9	#, tmp1845
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm12, (%rax)	# tmp1304, MEM[(__m512i * {ref-all})result_791 + i_812 * 8]
	andl	$3, %r9d	#, tmp1848
# sub.c:217:         i += 8;
	movl	$8, %ecx	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%rdx), %rsi	#, ivtmp.725
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, (%rdx)	# tmp1300, MEM[(__mmask8 *)_1383]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %r12	#, sub_size
	jbe	.L2382	#,
	testq	%r9, %r9	# tmp1848
	je	.L862	#,
	cmpq	$1, %r9	#, tmp1848
	je	.L2025	#,
	cmpq	$2, %r9	#, tmp1848
	je	.L2026	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%r8), %zmm13	# MEM[(__m512i * {ref-all})a_814 + i_812 * 8], tmp5168
# sub.c:217:         i += 8;
	movl	$16, %ecx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%rdi), %zmm13, %zmm14	# MEM[(__m512i * {ref-all})b_817 + i_812 * 8], tmp5168, tmp3608
# sub.c:219:     } while (likely(i < n));
	leaq	2(%rdx), %rsi	#, ivtmp.725
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k4	#, zeros, tmp3608, tmp3610
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm14, %zmm15	# tmp3608, tmp3608
	vpaddq	limb_digits(%rip), %zmm14, %zmm15{%k4}	# limb_digits, tmp3608, tmp3608, tmp3610, tmp3608
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, 64(%rax)	# tmp3612, MEM[(__m512i * {ref-all})result_791 + i_812 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, 1(%rdx)	# tmp3610, MEM[(__mmask8 *)_1383]
.L2026:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rcx,8), %zmm4	# MEM[(__m512i * {ref-all})a_814 + i_812 * 8], tmp5170
# sub.c:219:     } while (likely(i < n));
	incq	%rsi	# ivtmp.725
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rcx,8), %zmm4, %zmm0	# MEM[(__m512i * {ref-all})b_817 + i_812 * 8], tmp5170, tmp3614
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k5	#, zeros, tmp3614, tmp3616
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm0, %zmm7	# tmp3614, tmp3614
	vpaddq	limb_digits(%rip), %zmm0, %zmm7{%k5}	# limb_digits, tmp3614, tmp3614, tmp3616, tmp3614
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm7, (%rax,%rcx,8)	# tmp3618, MEM[(__m512i * {ref-all})result_791 + i_812 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, -1(%rsi)	# tmp3616, MEM[(__mmask8 *)_1383]
.L2025:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rcx,8), %zmm1	# MEM[(__m512i * {ref-all})a_814 + i_812 * 8], tmp5172
# sub.c:219:     } while (likely(i < n));
	incq	%rsi	# ivtmp.725
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rcx,8), %zmm1, %zmm2	# MEM[(__m512i * {ref-all})b_817 + i_812 * 8], tmp5172, tmp3620
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k6	#, zeros, tmp3620, tmp3622
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm2, %zmm3	# tmp3620, tmp3620
	vpaddq	limb_digits(%rip), %zmm2, %zmm3{%k6}	# limb_digits, tmp3620, tmp3620, tmp3622, tmp3620
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rax,%rcx,8)	# tmp3624, MEM[(__m512i * {ref-all})result_791 + i_812 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, -1(%rsi)	# tmp3622, MEM[(__mmask8 *)_1383]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rcx, %r12	# i, sub_size
	jbe	.L2382	#,
.L862:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%rcx,8), %zmm5	# MEM[(__m512i * {ref-all})a_814 + i_812 * 8], tmp4816
# sub.c:217:         i += 8;
	leaq	8(%rcx), %r9	#, tmp1849
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rcx,8), %zmm5, %zmm6	# MEM[(__m512i * {ref-all})b_817 + i_812 * 8], tmp4816, tmp2448
# sub.c:219:     } while (likely(i < n));
	addq	$4, %rsi	#, ivtmp.725
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k7	#, zeros, tmp2448, tmp2450
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm6, %zmm8	# tmp2448, tmp2448
	vpaddq	limb_digits(%rip), %zmm6, %zmm8{%k7}	# limb_digits, tmp2448, tmp2448, tmp2450, tmp2448
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rax,%rcx,8)	# tmp2452, MEM[(__m512i * {ref-all})result_791 + i_812 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, -4(%rsi)	# tmp2450, MEM[(__mmask8 *)_1383]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%r9,8), %zmm9	# MEM[(__m512i * {ref-all})a_814 + i_812 * 8], tmp4818
	vpsubq	(%rdi,%r9,8), %zmm9, %zmm10	# MEM[(__m512i * {ref-all})b_817 + i_812 * 8], tmp4818, tmp2456
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k1	#, zeros, tmp2456, tmp2458
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm10, %zmm11	# tmp2456, tmp2456
	vpaddq	limb_digits(%rip), %zmm10, %zmm11{%k1}	# limb_digits, tmp2456, tmp2456, tmp2458, tmp2456
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm11, (%rax,%r9,8)	# tmp2460, MEM[(__m512i * {ref-all})result_791 + i_812 * 8]
# sub.c:217:         i += 8;
	leaq	16(%rcx), %r9	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, -3(%rsi)	# tmp2458, MEM[(__mmask8 *)_1383]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%r9,8), %zmm12	# MEM[(__m512i * {ref-all})a_814 + i_812 * 8], tmp4820
	vpsubq	(%rdi,%r9,8), %zmm12, %zmm13	# MEM[(__m512i * {ref-all})b_817 + i_812 * 8], tmp4820, tmp2464
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm13, %k2	#, zeros, tmp2464, tmp2466
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm13, %zmm14	# tmp2464, tmp2464
	vpaddq	limb_digits(%rip), %zmm13, %zmm14{%k2}	# limb_digits, tmp2464, tmp2464, tmp2466, tmp2464
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rax,%r9,8)	# tmp2468, MEM[(__m512i * {ref-all})result_791 + i_812 * 8]
# sub.c:217:         i += 8;
	leaq	24(%rcx), %r9	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, -2(%rsi)	# tmp2466, MEM[(__mmask8 *)_1383]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r8,%r9,8), %zmm15	# MEM[(__m512i * {ref-all})a_814 + i_812 * 8], tmp4822
# sub.c:217:         i += 8;
	addq	$32, %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%r9,8), %zmm15, %zmm4	# MEM[(__m512i * {ref-all})b_817 + i_812 * 8], tmp4822, tmp2472
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm4, %k3	#, zeros, tmp2472, tmp2474
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm4, %zmm0	# tmp2472, tmp2472
	vpaddq	limb_digits(%rip), %zmm4, %zmm0{%k3}	# limb_digits, tmp2472, tmp2472, tmp2474, tmp2472
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm0, (%rax,%r9,8)	# tmp2476, MEM[(__m512i * {ref-all})result_791 + i_812 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, -1(%rsi)	# tmp2474, MEM[(__mmask8 *)_1383]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rcx, %r12	# i, sub_size
	ja	.L862	#,
.L2382:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm7	# zeros, tmp4824
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movl	-66312(%rbp), %edi	# %sfp,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqu64	%zmm7, (%rax,%r14)	# tmp4824, MEM[(__m512i_u * {ref-all})_840]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%edi, %edi	#
	js	.L865	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rbx), %r8d	# MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1],
	movl	%ebx, %r9d	# ivtmp.747, tmp1843
	movl	%r8d, %esi	#,
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movl	%ebx, %edi	# ivtmp.747, tmp4160
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	addl	%r8d, %r8d	# tmp1311
	andl	$7, %r9d	#, tmp1843
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decl	%edi	# tmp4160
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r8b, (%rdx,%rbx)	# tmp1311, MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-1(%rbx), %rcx	#, ivtmp.711
	js	.L865	#,
	testl	%r9d, %r9d	# tmp1843
	je	.L863	#,
	cmpl	$1, %r9d	#, tmp1843
	je	.L2019	#,
	cmpl	$2, %r9d	#, tmp1843
	je	.L2020	#,
	cmpl	$3, %r9d	#, tmp1843
	je	.L2021	#,
	cmpl	$4, %r9d	#, tmp1843
	je	.L2022	#,
	cmpl	$5, %r9d	#, tmp1843
	je	.L2023	#,
	cmpl	$6, %r9d	#, tmp1843
	je	.L2024	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-1(%rdx,%rbx), %edi	# MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rdi,%rdi), %ecx	#, tmp3581
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%esi, %ecx	# carry, tmp3582
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%cl, -1(%rdx,%rbx)	# tmp3582, MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%edi, %esi	# temp, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-2(%rbx), %rcx	#, ivtmp.711
.L2024:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %r8d	#, tmp3585
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %esi	# tmp3585, tmp3586
	movb	%sil, (%rdx,%rcx)	# tmp3586, MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.711
.L2023:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %edi	#, tmp3589
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %esi	# tmp3589, tmp3590
	movb	%sil, (%rdx,%rcx)	# tmp3590, MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.711
.L2022:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r8d	# MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %r9d	#, tmp3593
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %esi	# tmp3593, tmp3594
	movb	%sil, (%rdx,%rcx)	# tmp3594, MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.711
.L2021:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r8d	# MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r8,%r8), %edi	#, tmp3597
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %esi	# tmp3597, tmp3598
	movb	%sil, (%rdx,%rcx)	# tmp3598, MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r8d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.711
.L2020:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %r8d	#, tmp3601
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %esi	# tmp3601, tmp3602
	movb	%sil, (%rdx,%rcx)	# tmp3602, MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.711
.L2019:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %edi	#, tmp3605
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %esi	# tmp3605, tmp3606
	movb	%sil, (%rdx,%rcx)	# tmp3606, MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.711
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%ecx, %ecx	# ivtmp.711
	js	.L865	#,
.L863:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1], temp
	movzbl	-1(%rdx,%rcx), %edi	# MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %r8d	#, tmp2481
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %esi	# tmp2481, tmp2482
	movb	%sil, (%rdx,%rcx)	# tmp2482, MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1]
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %r9b	#, carry
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rdi,%rdi), %esi	#, tmp2487
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%esi, %r9d	# tmp2487, tmp2488
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-2(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%r9b, -1(%rdx,%rcx)	# tmp2488, MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1]
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp2493
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %edi	# tmp2493, tmp2494
	movb	%dil, -2(%rdx,%rcx)	# tmp2494, MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-3(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r8d	#, tmp2499
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %edi	# tmp2499, tmp2500
	movb	%dil, -3(%rdx,%rcx)	# tmp2500, MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-4(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp2505
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %edi	# tmp2505, tmp2506
	movb	%dil, -4(%rdx,%rcx)	# tmp2506, MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-5(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r8d	#, tmp2511
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %edi	# tmp2511, tmp2512
	movb	%dil, -5(%rdx,%rcx)	# tmp2512, MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-6(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp2517
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %edi	# tmp2517, tmp2518
	movb	%dil, -6(%rdx,%rcx)	# tmp2518, MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-7(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r8d	#, tmp2523
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r8d, %edi	# tmp2523, tmp2524
	movb	%dil, -7(%rdx,%rcx)	# tmp2524, MEM[(__mmask8 *)bm_811 + ivtmp.711_574 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	subq	$8, %rcx	#, ivtmp.711
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%ecx, %ecx	# ivtmp.711
	jns	.L863	#,
.L865:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax), %zmm1	# MEM[(__m512i * {ref-all})result_791 + i_2129 * 8], _2125
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rdx), %ecx	# MEM[(__mmask8 *)_573], MEM[(__mmask8 *)_573]
	leaq	-1(%r12), %rdi	#, tmp1838
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k4	# MEM[(__mmask8 *)_573], tmp4829
	vpsubq	ones(%rip), %zmm1, %zmm1{%k4}	# ones, _2125, tmp1313, tmp4829, _2125
	shrq	$3, %rdi	#, tmp1836
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rax)	# tmp1313, MEM[(__m512i * {ref-all})result_791 + i_2129 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm1, %k0	#, zeros, tmp1313, tmp1319
	movq	%rdi, %r9	# tmp1836, tmp1836
	andl	$3, %r9d	#, tmp1836
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp1319
	jne	.L2824	#,
.L1577:
# sub.c:249:         i += 8;
	movl	$8, %ecx	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rdx), %rsi	#, ivtmp.708
	cmpq	$8, %r12	#, sub_size
	jbe	.L867	#,
	testq	%r9, %r9	# tmp1839
	je	.L864	#,
	cmpq	$1, %r9	#, tmp1839
	je	.L2017	#,
	cmpq	$2, %r9	#, tmp1839
	je	.L2018	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	64(%rax), %zmm2	# MEM[(__m512i * {ref-all})result_791 + i_2129 * 8], _2125
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rdx), %r8d	# MEM[(__mmask8 *)_573], MEM[(__mmask8 *)_573]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r8d, %k5	# MEM[(__mmask8 *)_573], tmp5156
	vpsubq	ones(%rip), %zmm2, %zmm2{%k5}	# ones, _2125, tmp3548, tmp5156, _2125
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, 64(%rax)	# tmp3548, MEM[(__m512i * {ref-all})result_791 + i_2129 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k6	#, zeros, tmp3548, tmp3550
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k6, %k6	# tmp3550
	jne	.L2825	#,
.L1579:
# sub.c:249:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.708
.L2018:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm3	# MEM[(__m512i * {ref-all})result_791 + i_2129 * 8], _2125
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %edx	# MEM[(__mmask8 *)_573], MEM[(__mmask8 *)_573]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edx, %k7	# MEM[(__mmask8 *)_573], tmp5157
	vpsubq	ones(%rip), %zmm3, %zmm3{%k7}	# ones, _2125, tmp3554, tmp5157, _2125
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rax,%rcx,8)	# tmp3554, MEM[(__m512i * {ref-all})result_791 + i_2129 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k1	#, zeros, tmp3554, tmp3556
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k1, %k1	# tmp3556
	jne	.L2826	#,
.L1582:
# sub.c:249:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.708
.L2017:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm5	# MEM[(__m512i * {ref-all})result_791 + i_2129 * 8], _2125
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %edi	# MEM[(__mmask8 *)_573], MEM[(__mmask8 *)_573]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k2	# MEM[(__mmask8 *)_573], tmp5158
	vpsubq	ones(%rip), %zmm5, %zmm5{%k2}	# ones, _2125, tmp3560, tmp5158, _2125
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, (%rax,%rcx,8)	# tmp3560, MEM[(__m512i * {ref-all})result_791 + i_2129 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k3	#, zeros, tmp3560, tmp3562
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k3, %k3	# tmp3562
	jne	.L2827	#,
.L1585:
# sub.c:249:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.708
	cmpq	%rcx, %r12	# i, sub_size
	ja	.L864	#,
	jmp	.L867	#
	.p2align 4,,10
	.p2align 3
.L866:
# sub.c:249:         i += 8;
	leaq	8(%rcx), %r8	#, tmp1840
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r8,8), %zmm8	# MEM[(__m512i * {ref-all})result_791 + i_2129 * 8], _2125
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rsi), %ecx	# MEM[(__mmask8 *)_573], MEM[(__mmask8 *)_573]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rsi), %rdx	#, tmp1841
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k5	# MEM[(__mmask8 *)_573], tmp4837
	vpsubq	ones(%rip), %zmm8, %zmm8{%k5}	# ones, _2125, tmp2538, tmp4837, _2125
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rax,%r8,8)	# tmp2538, MEM[(__m512i * {ref-all})result_791 + i_2129 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm8, %k6	#, zeros, tmp2538, tmp2540
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k6, %k6	# tmp2540
	jne	.L2828	#,
.L1588:
# sub.c:249:         i += 8;
	leaq	8(%r8), %rdi	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdi,8), %zmm9	# MEM[(__m512i * {ref-all})result_791 + i_2129 * 8], _2125
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rdx), %esi	# MEM[(__mmask8 *)_573], MEM[(__mmask8 *)_573]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k7	# MEM[(__mmask8 *)_573], tmp5159
	vpsubq	ones(%rip), %zmm9, %zmm9{%k7}	# ones, _2125, tmp3568, tmp5159, _2125
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rax,%rdi,8)	# tmp3568, MEM[(__m512i * {ref-all})result_791 + i_2129 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k1	#, zeros, tmp3568, tmp3570
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k1, %k1	# tmp3570
	jne	.L2829	#,
.L1590:
# sub.c:249:         i += 8;
	leaq	16(%r8), %r9	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r9,8), %zmm10	# MEM[(__m512i * {ref-all})result_791 + i_2129 * 8], _2125
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%rdx), %ecx	# MEM[(__mmask8 *)_573], MEM[(__mmask8 *)_573]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k2	# MEM[(__mmask8 *)_573], tmp5160
	vpsubq	ones(%rip), %zmm10, %zmm10{%k2}	# ones, _2125, tmp3576, tmp5160, _2125
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, (%rax,%r9,8)	# tmp3576, MEM[(__m512i * {ref-all})result_791 + i_2129 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm10, %k3	#, zeros, tmp3576, tmp3578
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k3, %k3	# tmp3578
	jne	.L2830	#,
.L1592:
# sub.c:249:         i += 8;
	leaq	24(%r8), %rcx	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%rdx), %rsi	#, ivtmp.708
	cmpq	%rcx, %r12	# i, sub_size
	jbe	.L867	#,
.L864:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm6	# MEM[(__m512i * {ref-all})result_791 + i_2129 * 8], _2125
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %r9d	# MEM[(__mmask8 *)_573], MEM[(__mmask8 *)_573]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k4	# MEM[(__mmask8 *)_573], tmp4836
	vpsubq	ones(%rip), %zmm6, %zmm6{%k4}	# ones, _2125, tmp2530, tmp4836, _2125
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rax,%rcx,8)	# tmp2530, MEM[(__m512i * {ref-all})result_791 + i_2129 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k0	#, zeros, tmp2530, tmp2532
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp2532
	je	.L866	#,
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rsi)	# tmp2532, MEM[(__mmask8 *)_573]
	jmp	.L866	#
.L2840:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	8(%r13), %rdx	# MEM[(uint64_t *)b.130_105 + j_989 * 8], tmp5109
	cmpq	%rdx, 8(%r15)	# tmp5109, MEM[(uint64_t *)a.131_106 + j_989 * 8]
	ja	.L942	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L943	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	jne	.L1997	#,
	.p2align 4,,10
	.p2align 3
.L895:
# sub.c:1410:             TIME_RUSAGE(time_taken, limb_sub_n(a, b, &sub, n));
	incq	%r11	# __t
	cmpq	%r11, %r14	# __t, __times
	jne	.L884	#,
	vzeroupper
.L888:
# sub.c:1553:     getrusage(RUSAGE_SELF, &rus);
	movq	-66328(%rbp), %rsi	# %sfp,
	xorl	%edi, %edi	#
	call	getrusage@PLT	#
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	movq	-66184(%rbp), %r11	# MEM[(struct rusage *)_2061].ru_utime.tv_usec, MEM[(struct rusage *)_2061].ru_utime.tv_usec
	movabsq	$2361183241434822607, %rax	#, tmp4163
	imulq	%r11	# MEM[(struct rusage *)_2061].ru_utime.tv_usec
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	imull	$1000, -66192(%rbp), %r8d	#, MEM[(struct rusage *)_2061].ru_utime.tv_sec, tmp1419
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	sarq	$63, %r11	#, tmp1425
	sarq	$7, %rdx	#, tmp1424
	subq	%r11, %rdx	# tmp1425, tmp1420
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	leal	(%r8,%rdx), %eax	#, _1079
# sub.c:1410:             TIME_RUSAGE(time_taken, limb_sub_n(a, b, &sub, n));
	cltq
	subq	-66336(%rbp), %rax	# %sfp, __tmp
	cmpq	$249, %rax	#, __tmp
	jle	.L875	#,
	movq	%r14, %r10	# __times, __times
	vxorpd	%xmm4, %xmm4, %xmm4	# tmp4906
	vcvtsi2sdq	%rax, %xmm4, %xmm1	# __tmp, tmp4906, tmp3933
	vcvtsi2sdq	%r10, %xmm4, %xmm3	# __times, tmp4907, tmp3934
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC64(%rip), %rdi	#, tmp1461
	movq	-66344(%rbp), %r14	# %sfp, _63
# sub.c:1410:             TIME_RUSAGE(time_taken, limb_sub_n(a, b, &sub, n));
	vdivsd	%xmm3, %xmm1, %xmm2	# tmp1460, tmp1459, time_taken
	vmovsd	%xmm2, -66336(%rbp)	# time_taken, %sfp
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	puts@PLT	#
	vmovsd	-66336(%rbp), %xmm0	# %sfp,
	leaq	.LC66(%rip), %rsi	#, tmp1462
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk@PLT	#
# sub.c:1413:             niter = 1 + (unsigned long)(1e4 / time_taken);
	vmovsd	.LC74(%rip), %xmm5	#, tmp1464
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC68(%rip), %rsi	#, tmp1466
# sub.c:1413:             niter = 1 + (unsigned long)(1e4 / time_taken);
	vdivsd	-66336(%rbp), %xmm5, %xmm6	# %sfp, tmp1464, tmp1463
# sub.c:1413:             niter = 1 + (unsigned long)(1e4 / time_taken);
	vcvttsd2usi	%xmm6, %r9	# tmp1463, tmp1465
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
# sub.c:1413:             niter = 1 + (unsigned long)(1e4 / time_taken);
	leal	1(%r9), %ecx	#, niter
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	%ecx, %edx	# niter,
	movl	%ecx, -66344(%rbp)	# niter, %sfp
	call	__printf_chk@PLT	#
# sub.c:1415:             fflush(stdout);
	movq	stdout(%rip), %rdi	# stdout,
	call	fflush@PLT	#
# sub.c:1553:     getrusage(RUSAGE_SELF, &rus);
	movq	-66328(%rbp), %rsi	# %sfp,
	xorl	%edi, %edi	#
	call	getrusage@PLT	#
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	movq	-66184(%rbp), %rsi	# MEM[(struct rusage *)_2061].ru_utime.tv_usec, MEM[(struct rusage *)_2061].ru_utime.tv_usec
	movabsq	$2361183241434822607, %rax	#, tmp4165
	imulq	%rsi	# MEM[(struct rusage *)_2061].ru_utime.tv_usec
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	imull	$1000, -66192(%rbp), %edi	#, MEM[(struct rusage *)_2061].ru_utime.tv_sec, tmp1470
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	sarq	$63, %rsi	#, tmp1476
	sarq	$7, %rdx	#, tmp1473
	subq	%rsi, %rdx	# tmp1476, tmp1471
# sub.c:1554:     return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
	addl	%edx, %edi	# tmp1471, _1087
# sub.c:1417:             t0 = cputime();
	movslq	%edi, %r8	# _1087, t0
	movq	%r8, -66336(%rbp)	# t0, %sfp
# sub.c:1418:             for (int i = 0; i < niter; i++)
	movl	-66344(%rbp), %r8d	# %sfp, niter
# sub.c:1418:             for (int i = 0; i < niter; i++)
	xorl	%r11d, %r11d	# i
# sub.c:1418:             for (int i = 0; i < niter; i++)
	testl	%r8d, %r8d	# niter
	jle	.L901	#,
	.p2align 4,,10
	.p2align 3
.L896:
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movslq	sub_space_ptr(%rip), %r10	# sub_space_ptr, sub_space_ptr
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	movq	sub_space(%rip), %r9	# sub_space, sub_space
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13), %rsi	# MEM[(uint64_t *)b.130_105 + j_1093 * 8], tmp4918
	leaq	-1(%r12), %rcx	#, tmp1793
# sub.c:167:     aligned_uint64_ptr result = sub_space + sub_space_ptr;
	leaq	(%r9,%r10,8), %rax	#, result
	andl	$7, %ecx	#, tmp1793
# sub.c:172:         if (likely(a[j] > b[j]))
	cmpq	%rsi, (%r15)	# tmp4918, MEM[(uint64_t *)a.131_106 + j_1093 * 8]
	jbe	.L2831	#,
.L947:
	movq	%r13, %rdi	# b.130_105, b
	movq	%r15, %r9	# a.131_106, a
.L899:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9), %zmm8	# MEM[(__m512i * {ref-all})a_1115 + i_1113 * 8], tmp4921
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	movslq	borrow_space_ptr(%rip), %rdx	# borrow_space_ptr, borrow_space_ptr
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi), %zmm8, %zmm9	# MEM[(__m512i * {ref-all})b_1118 + i_1113 * 8], tmp4921, tmp1501
	leaq	-1(%r12), %r10	#, tmp1789
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm9, %k6	#, zeros, tmp1501, tmp1503
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm9, %zmm10	# tmp1501, tmp1501
# sub.c:195:     __mmask8 *bm = (__mmask8 *)borrow_space + borrow_space_ptr;
	addq	borrow_space(%rip), %rdx	# borrow_space, bm
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vpaddq	limb_digits(%rip), %zmm9, %zmm10{%k6}	# limb_digits, tmp1501, tmp1501, tmp1503, tmp1501
	shrq	$3, %r10	#, tmp1787
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm10, (%rax)	# tmp1507, MEM[(__m512i * {ref-all})result_1092 + i_1113 * 8]
	andl	$3, %r10d	#, tmp1790
# sub.c:217:         i += 8;
	movl	$8, %ecx	#, i
# sub.c:219:     } while (likely(i < n));
	leaq	1(%rdx), %rsi	#, ivtmp.520
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, (%rdx)	# tmp1503, MEM[(__mmask8 *)_1164]
# sub.c:219:     } while (likely(i < n));
	cmpq	$8, %r12	#, sub_size
	jbe	.L2399	#,
	testq	%r10, %r10	# tmp1790
	je	.L903	#,
	cmpq	$1, %r10	#, tmp1790
	je	.L1971	#,
	cmpq	$2, %r10	#, tmp1790
	je	.L1972	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	64(%r9), %zmm11	# MEM[(__m512i * {ref-all})a_1115 + i_1113 * 8], tmp5072
# sub.c:217:         i += 8;
	movl	$16, %ecx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	64(%rdi), %zmm11, %zmm12	# MEM[(__m512i * {ref-all})b_1118 + i_1113 * 8], tmp5072, tmp3266
# sub.c:219:     } while (likely(i < n));
	leaq	2(%rdx), %rsi	#, ivtmp.520
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm12, %k7	#, zeros, tmp3266, tmp3268
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm12, %zmm13	# tmp3266, tmp3266
	vpaddq	limb_digits(%rip), %zmm12, %zmm13{%k7}	# limb_digits, tmp3266, tmp3266, tmp3268, tmp3266
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm13, 64(%rax)	# tmp3270, MEM[(__m512i * {ref-all})result_1092 + i_1113 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k7, 1(%rdx)	# tmp3268, MEM[(__mmask8 *)_1164]
.L1972:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9,%rcx,8), %zmm0	# MEM[(__m512i * {ref-all})a_1115 + i_1113 * 8], tmp5074
# sub.c:219:     } while (likely(i < n));
	incq	%rsi	# ivtmp.520
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rcx,8), %zmm0, %zmm14	# MEM[(__m512i * {ref-all})b_1118 + i_1113 * 8], tmp5074, tmp3272
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm14, %k1	#, zeros, tmp3272, tmp3274
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm14, %zmm15	# tmp3272, tmp3272
	vpaddq	limb_digits(%rip), %zmm14, %zmm15{%k1}	# limb_digits, tmp3272, tmp3272, tmp3274, tmp3272
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm15, (%rax,%rcx,8)	# tmp3276, MEM[(__m512i * {ref-all})result_1092 + i_1113 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k1, -1(%rsi)	# tmp3274, MEM[(__mmask8 *)_1164]
.L1971:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9,%rcx,8), %zmm4	# MEM[(__m512i * {ref-all})a_1115 + i_1113 * 8], tmp5076
# sub.c:219:     } while (likely(i < n));
	incq	%rsi	# ivtmp.520
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rcx,8), %zmm4, %zmm7	# MEM[(__m512i * {ref-all})b_1118 + i_1113 * 8], tmp5076, tmp3278
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm7, %k2	#, zeros, tmp3278, tmp3280
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm7, %zmm1	# tmp3278, tmp3278
	vpaddq	limb_digits(%rip), %zmm7, %zmm1{%k2}	# limb_digits, tmp3278, tmp3278, tmp3280, tmp3278
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rax,%rcx,8)	# tmp3282, MEM[(__m512i * {ref-all})result_1092 + i_1113 * 8]
# sub.c:217:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k2, -1(%rsi)	# tmp3280, MEM[(__mmask8 *)_1164]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rcx, %r12	# i, sub_size
	jbe	.L2399	#,
.L903:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9,%rcx,8), %zmm3	# MEM[(__m512i * {ref-all})a_1115 + i_1113 * 8], tmp4923
# sub.c:217:         i += 8;
	leaq	8(%rcx), %r10	#, tmp1791
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%rcx,8), %zmm3, %zmm2	# MEM[(__m512i * {ref-all})b_1118 + i_1113 * 8], tmp4923, tmp2761
# sub.c:219:     } while (likely(i < n));
	addq	$4, %rsi	#, ivtmp.520
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k3	#, zeros, tmp2761, tmp2763
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm2, %zmm5	# tmp2761, tmp2761
	vpaddq	limb_digits(%rip), %zmm2, %zmm5{%k3}	# limb_digits, tmp2761, tmp2761, tmp2763, tmp2761
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, (%rax,%rcx,8)	# tmp2765, MEM[(__m512i * {ref-all})result_1092 + i_1113 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k3, -4(%rsi)	# tmp2763, MEM[(__mmask8 *)_1164]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9,%r10,8), %zmm6	# MEM[(__m512i * {ref-all})a_1115 + i_1113 * 8], tmp4925
	vpsubq	(%rdi,%r10,8), %zmm6, %zmm8	# MEM[(__m512i * {ref-all})b_1118 + i_1113 * 8], tmp4925, tmp2769
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm8, %k4	#, zeros, tmp2769, tmp2771
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm8, %zmm9	# tmp2769, tmp2769
	vpaddq	limb_digits(%rip), %zmm8, %zmm9{%k4}	# limb_digits, tmp2769, tmp2769, tmp2771, tmp2769
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm9, (%rax,%r10,8)	# tmp2773, MEM[(__m512i * {ref-all})result_1092 + i_1113 * 8]
# sub.c:217:         i += 8;
	leaq	16(%rcx), %r10	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k4, -3(%rsi)	# tmp2771, MEM[(__mmask8 *)_1164]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9,%r10,8), %zmm10	# MEM[(__m512i * {ref-all})a_1115 + i_1113 * 8], tmp4927
	vpsubq	(%rdi,%r10,8), %zmm10, %zmm11	# MEM[(__m512i * {ref-all})b_1118 + i_1113 * 8], tmp4927, tmp2777
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm11, %k5	#, zeros, tmp2777, tmp2779
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm11, %zmm12	# tmp2777, tmp2777
	vpaddq	limb_digits(%rip), %zmm11, %zmm12{%k5}	# limb_digits, tmp2777, tmp2777, tmp2779, tmp2777
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm12, (%rax,%r10,8)	# tmp2781, MEM[(__m512i * {ref-all})result_1092 + i_1113 * 8]
# sub.c:217:         i += 8;
	leaq	24(%rcx), %r10	#, i
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k5, -2(%rsi)	# tmp2779, MEM[(__mmask8 *)_1164]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vmovdqa64	(%r9,%r10,8), %zmm13	# MEM[(__m512i * {ref-all})a_1115 + i_1113 * 8], tmp4929
# sub.c:217:         i += 8;
	addq	$32, %rcx	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:762:   return (__m512i) ((__v8du) __A - (__v8du) __B);
	vpsubq	(%rdi,%r10,8), %zmm13, %zmm0	# MEM[(__m512i * {ref-all})b_1118 + i_1113 * 8], tmp4929, tmp2785
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm0, %k6	#, zeros, tmp2785, tmp2787
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:741:   return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
	vmovdqa64	%zmm0, %zmm14	# tmp2785, tmp2785
	vpaddq	limb_digits(%rip), %zmm0, %zmm14{%k6}	# limb_digits, tmp2785, tmp2785, tmp2787, tmp2785
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm14, (%rax,%r10,8)	# tmp2789, MEM[(__m512i * {ref-all})result_1092 + i_1113 * 8]
# sub.c:216:         bm[j] = borrow_mask;
	kmovb	%k6, -1(%rsi)	# tmp2787, MEM[(__mmask8 *)_1164]
# sub.c:219:     } while (likely(i < n));
	cmpq	%rcx, %r12	# i, sub_size
	ja	.L903	#,
.L2399:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqa64	zeros(%rip), %zmm15	# zeros, tmp4931
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movl	-66312(%rbp), %edi	# %sfp,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:6483:   *(__m512i_u *)__P = __A;
	vmovdqu64	%zmm15, (%rax,%r14)	# tmp4931, MEM[(__m512i_u * {ref-all})_1141]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%edi, %edi	#
	js	.L906	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rbx), %ecx	# MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1],
	movl	%ebx, %r9d	# ivtmp.540, tmp1785
	movl	%ecx, %esi	#,
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	movl	%ebx, %r10d	# ivtmp.540, tmp4167
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	addl	%ecx, %ecx	# tmp1514
	andl	$7, %r9d	#, tmp1785
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decl	%r10d	# tmp4167
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	movb	%cl, (%rdx,%rbx)	# tmp1514, MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-1(%rbx), %rcx	#, ivtmp.506
	js	.L906	#,
	testl	%r9d, %r9d	# tmp1785
	je	.L904	#,
	cmpl	$1, %r9d	#, tmp1785
	je	.L1965	#,
	cmpl	$2, %r9d	#, tmp1785
	je	.L1966	#,
	cmpl	$3, %r9d	#, tmp1785
	je	.L1967	#,
	cmpl	$4, %r9d	#, tmp1785
	je	.L1968	#,
	cmpl	$5, %r9d	#, tmp1785
	je	.L1969	#,
	cmpl	$6, %r9d	#, tmp1785
	je	.L1970	#,
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-1(%rdx,%rbx), %edi	# MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1], temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	leaq	-2(%rbx), %rcx	#, ivtmp.506
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rdi,%rdi), %r9d	#, tmp3239
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%esi, %r9d	# carry, tmp3240
	movb	%r9b, -1(%rdx,%rbx)	# tmp3240, MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1]
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
	movl	%edi, %esi	# temp, carry
.L1970:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r10d	# MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r10,%r10), %edi	#, tmp3243
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %esi	# tmp3243, tmp3244
	movb	%sil, (%rdx,%rcx)	# tmp3244, MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r10d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.506
.L1969:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %r10d	#, tmp3247
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %esi	# tmp3247, tmp3248
	movb	%sil, (%rdx,%rcx)	# tmp3248, MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.506
.L1968:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %edi	#, tmp3251
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %esi	# tmp3251, tmp3252
	movb	%sil, (%rdx,%rcx)	# tmp3252, MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.506
.L1967:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r10d	# MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r10,%r10), %r9d	#, tmp3255
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %esi	# tmp3255, tmp3256
	movb	%sil, (%rdx,%rcx)	# tmp3256, MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r10d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.506
.L1966:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r10d	# MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r10,%r10), %edi	#, tmp3259
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%edi, %esi	# tmp3259, tmp3260
	movb	%sil, (%rdx,%rcx)	# tmp3260, MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r10d, %esi	# temp, temp
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.506
.L1965:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %r9d	# MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%r9,%r9), %r10d	#, tmp3263
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %esi	# tmp3263, tmp3264
	movb	%sil, (%rdx,%rcx)	# tmp3264, MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%r9d, %esi	# temp, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	decq	%rcx	# ivtmp.506
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, temp
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%ecx, %ecx	# ivtmp.506
	js	.L906	#,
.L904:
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	(%rdx,%rcx), %edi	# MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1], temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rdi,%rdi), %r9d	#, tmp2794
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %esi	# tmp2794, tmp2795
	movb	%sil, (%rdx,%rcx)	# tmp2795, MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1]
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-1(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, carry
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r10d	#, tmp2800
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %edi	# tmp2800, tmp2801
	movb	%dil, -1(%rdx,%rcx)	# tmp2801, MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-2(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp2806
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %edi	# tmp2806, tmp2807
	movb	%dil, -2(%rdx,%rcx)	# tmp2807, MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-3(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r10d	#, tmp2812
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %edi	# tmp2812, tmp2813
	movb	%dil, -3(%rdx,%rcx)	# tmp2813, MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-4(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp2818
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %edi	# tmp2818, tmp2819
	movb	%dil, -4(%rdx,%rcx)	# tmp2819, MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-5(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r10d	#, tmp2824
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %edi	# tmp2824, tmp2825
	movb	%dil, -5(%rdx,%rcx)	# tmp2825, MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-6(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r9d	#, tmp2830
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r9d, %edi	# tmp2830, tmp2831
	movb	%dil, -6(%rdx,%rcx)	# tmp2831, MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1]
# sub.c:161:         carry = temp >> 7;
	movl	%esi, %edi	# temp, temp
# sub.c:159:         uint8_t temp = borrow_mask[i];
	movzbl	-7(%rdx,%rcx), %esi	# MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1], temp
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %dil	#, temp
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	leal	(%rsi,%rsi), %r10d	#, tmp2836
# sub.c:160:         borrow_mask[i] = (temp << 1) | carry;
	orl	%r10d, %edi	# tmp2836, tmp2837
	movb	%dil, -7(%rdx,%rcx)	# tmp2837, MEM[(__mmask8 *)bm_1112 + ivtmp.506_2171 * 1]
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	subq	$8, %rcx	#, ivtmp.506
# sub.c:161:         carry = temp >> 7;
	shrb	$7, %sil	#, carry
# sub.c:157:     for (int i = n - 1; i >= 0; i--)
	testl	%ecx, %ecx	# ivtmp.506
	jns	.L904	#,
.L906:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax), %zmm4	# MEM[(__m512i * {ref-all})result_1092 + i_2232 * 8], _2233
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rdx), %ecx	# MEM[(__mmask8 *)_1222], MEM[(__mmask8 *)_1222]
	leaq	-1(%r12), %rdi	#, tmp1780
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k7	# MEM[(__mmask8 *)_1222], tmp4936
	vpsubq	ones(%rip), %zmm4, %zmm4{%k7}	# ones, _2233, tmp1516, tmp4936, _2233
	shrq	$3, %rdi	#, tmp1778
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm4, (%rax)	# tmp1516, MEM[(__m512i * {ref-all})result_1092 + i_2232 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm4, %k0	#, zeros, tmp1516, tmp1522
	movq	%rdi, %r9	# tmp1778, tmp1778
	andl	$3, %r9d	#, tmp1778
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp1522
	jne	.L2832	#,
.L1318:
# sub.c:249:         i += 8;
	movl	$8, %ecx	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rdx), %rsi	#, ivtmp.503
	cmpq	$8, %r12	#, sub_size
	jbe	.L908	#,
	testq	%r9, %r9	# tmp1781
	je	.L905	#,
	cmpq	$1, %r9	#, tmp1781
	je	.L1963	#,
	cmpq	$2, %r9	#, tmp1781
	je	.L1964	#,
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	64(%rax), %zmm7	# MEM[(__m512i * {ref-all})result_1092 + i_2232 * 8], _2233
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rdx), %r10d	# MEM[(__mmask8 *)_1222], MEM[(__mmask8 *)_1222]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r10d, %k1	# MEM[(__mmask8 *)_1222], tmp5060
	vpsubq	ones(%rip), %zmm7, %zmm7{%k1}	# ones, _2233, tmp3206, tmp5060, _2233
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm7, 64(%rax)	# tmp3206, MEM[(__m512i * {ref-all})result_1092 + i_2232 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm7, %k2	#, zeros, tmp3206, tmp3208
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k2, %k2	# tmp3208
	jne	.L2833	#,
.L1320:
# sub.c:249:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.503
.L1964:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm1	# MEM[(__m512i * {ref-all})result_1092 + i_2232 * 8], _2233
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %edx	# MEM[(__mmask8 *)_1222], MEM[(__mmask8 *)_1222]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edx, %k3	# MEM[(__mmask8 *)_1222], tmp5061
	vpsubq	ones(%rip), %zmm1, %zmm1{%k3}	# ones, _2233, tmp3212, tmp5061, _2233
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm1, (%rax,%rcx,8)	# tmp3212, MEM[(__m512i * {ref-all})result_1092 + i_2232 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm1, %k4	#, zeros, tmp3212, tmp3214
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k4, %k4	# tmp3214
	jne	.L2834	#,
.L1323:
# sub.c:249:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.503
.L1963:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm3	# MEM[(__m512i * {ref-all})result_1092 + i_2232 * 8], _2233
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %edi	# MEM[(__mmask8 *)_1222], MEM[(__mmask8 *)_1222]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%edi, %k5	# MEM[(__mmask8 *)_1222], tmp5062
	vpsubq	ones(%rip), %zmm3, %zmm3{%k5}	# ones, _2233, tmp3218, tmp5062, _2233
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm3, (%rax,%rcx,8)	# tmp3218, MEM[(__m512i * {ref-all})result_1092 + i_2232 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm3, %k6	#, zeros, tmp3218, tmp3220
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k6, %k6	# tmp3220
	jne	.L2835	#,
.L1326:
# sub.c:249:         i += 8;
	addq	$8, %rcx	#, i
# sub.c:251:     } while (likely(i < n));
	incq	%rsi	# ivtmp.503
	cmpq	%rcx, %r12	# i, sub_size
	ja	.L905	#,
	jmp	.L908	#
	.p2align 4,,10
	.p2align 3
.L907:
# sub.c:249:         i += 8;
	leaq	8(%rcx), %r10	#, tmp1782
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r10,8), %zmm5	# MEM[(__m512i * {ref-all})result_1092 + i_2232 * 8], _2233
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rsi), %ecx	# MEM[(__mmask8 *)_1222], MEM[(__mmask8 *)_1222]
# sub.c:251:     } while (likely(i < n));
	leaq	1(%rsi), %rdx	#, tmp1783
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k1	# MEM[(__mmask8 *)_1222], tmp4944
	vpsubq	ones(%rip), %zmm5, %zmm5{%k1}	# ones, _2233, tmp2851, tmp4944, _2233
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm5, (%rax,%r10,8)	# tmp2851, MEM[(__m512i * {ref-all})result_1092 + i_2232 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm5, %k2	#, zeros, tmp2851, tmp2853
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k2, %k2	# tmp2853
	jne	.L2836	#,
.L1329:
# sub.c:249:         i += 8;
	leaq	8(%r10), %rdi	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rdi,8), %zmm6	# MEM[(__m512i * {ref-all})result_1092 + i_2232 * 8], _2233
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	1(%rdx), %esi	# MEM[(__mmask8 *)_1222], MEM[(__mmask8 *)_1222]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%esi, %k3	# MEM[(__mmask8 *)_1222], tmp5063
	vpsubq	ones(%rip), %zmm6, %zmm6{%k3}	# ones, _2233, tmp3226, tmp5063, _2233
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm6, (%rax,%rdi,8)	# tmp3226, MEM[(__m512i * {ref-all})result_1092 + i_2232 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm6, %k4	#, zeros, tmp3226, tmp3228
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k4, %k4	# tmp3228
	jne	.L2837	#,
.L1331:
# sub.c:249:         i += 8;
	leaq	16(%r10), %r9	#, i
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%r9,8), %zmm8	# MEM[(__m512i * {ref-all})result_1092 + i_2232 * 8], _2233
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	2(%rdx), %ecx	# MEM[(__mmask8 *)_1222], MEM[(__mmask8 *)_1222]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%ecx, %k5	# MEM[(__mmask8 *)_1222], tmp5064
	vpsubq	ones(%rip), %zmm8, %zmm8{%k5}	# ones, _2233, tmp3234, tmp5064, _2233
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm8, (%rax,%r9,8)	# tmp3234, MEM[(__m512i * {ref-all})result_1092 + i_2232 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm8, %k6	#, zeros, tmp3234, tmp3236
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k6, %k6	# tmp3236
	jne	.L2838	#,
.L1333:
# sub.c:249:         i += 8;
	leaq	24(%r10), %rcx	#, i
# sub.c:251:     } while (likely(i < n));
	leaq	3(%rdx), %rsi	#, ivtmp.503
	cmpq	%rcx, %r12	# i, sub_size
	jbe	.L908	#,
.L905:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:542:   return *(__m512i *) __P;
	vmovdqa64	(%rax,%rcx,8), %zmm2	# MEM[(__m512i * {ref-all})result_1092 + i_2232 * 8], _2233
# sub.c:238:         result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
	movzbl	(%rsi), %r9d	# MEM[(__mmask8 *)_1222], MEM[(__mmask8 *)_1222]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:769:   return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
	kmovb	%r9d, %k7	# MEM[(__mmask8 *)_1222], tmp4943
	vpsubq	ones(%rip), %zmm2, %zmm2{%k7}	# ones, _2233, tmp2843, tmp4943, _2233
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:575:   *(__m512i *) __P = __A;
	vmovdqa64	%zmm2, (%rax,%rcx,8)	# tmp2843, MEM[(__m512i * {ref-all})result_1092 + i_2232 * 8]
# /usr/lib/gcc/x86_64-linux-gnu/11/include/avx512fintrin.h:9896:   return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
	vpcmpq	$1, zeros(%rip), %zmm2, %k0	#, zeros, tmp2843, tmp2845
# sub.c:242:         if (unlikely(borrow_mask))
	kortestb	%k0, %k0	# tmp2845
	je	.L907	#,
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rsi)	# tmp2845, MEM[(__mmask8 *)_1222]
	jmp	.L907	#
	.p2align 4,,10
	.p2align 3
.L2816:
	kmovb	%k2, 2(%rdx)	# tmp3690, MEM[(__mmask8 *)_475]
	jmp	.L1678	#
	.p2align 4,,10
	.p2align 3
.L2815:
	kmovb	%k7, 1(%rdx)	# tmp3682, MEM[(__mmask8 *)_475]
	jmp	.L1676	#
	.p2align 4,,10
	.p2align 3
.L2814:
	kmovb	%k5, 1(%rsi)	# tmp2437, MEM[(__mmask8 *)_475]
	jmp	.L1674	#
	.p2align 4,,10
	.p2align 3
.L2784:
	kmovb	%k3, 1(%rdx)	# tmp3340, MEM[(__mmask8 *)_1327]
	jmp	.L1417	#
	.p2align 4,,10
	.p2align 3
.L2783:
	kmovb	%k1, 1(%rsi)	# tmp2750, MEM[(__mmask8 *)_1327]
	jmp	.L1415	#
	.p2align 4,,10
	.p2align 3
.L2785:
	kmovb	%k5, 2(%rdx)	# tmp3348, MEM[(__mmask8 *)_1327]
	jmp	.L1419	#
.L2843:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	8(%r15), %r9	# MEM[(uint64_t *)b.122_89 + j_792 * 8], tmp5174
	cmpq	%r9, 8(%r13)	# tmp5174, MEM[(uint64_t *)a.123_90 + j_792 * 8]
	ja	.L935	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L936	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	jne	.L2033	#,
.L867:
# sub.c:1385:             for (int i = 0; i < niter; i++)
	incl	%r10d	# i
# sub.c:1385:             for (int i = 0; i < niter; i++)
	cmpl	%r10d, %r11d	# i, niter
	jne	.L855	#,
	vzeroupper
.L860:
# sub.c:1527:     clock_gettime(CLOCK_MONOTONIC_RAW, &ts);
	movq	-66336(%rbp), %rsi	# %sfp,
	movl	$4, %edi	#,
	movl	%r11d, -66312(%rbp)	# niter, %sfp
	call	clock_gettime@PLT	#
# sub.c:1528:     return ts;
	movq	-66184(%rbp), %r14	# MEM <__syscall_slong_t> [(struct timespec *)_2061], SR.220
	movq	-66192(%rbp), %r12	# MEM <__time_t> [(struct timespec *)_2061], SR.219
# sub.c:1535:     if ((end.tv_nsec - start.tv_nsec) < 0)
	movq	%r14, %rbx	# SR.220, temp$tv_nsec
	subq	-66344(%rbp), %rbx	# %sfp, temp$tv_nsec
	movl	-66312(%rbp), %eax	# %sfp, niter
	js	.L2839	#,
# sub.c:1542:         temp.tv_sec = end.tv_sec - start.tv_sec;
	subq	-66328(%rbp), %r12	# %sfp, temp$tv_sec
.L868:
# sub.c:1546:     return temp.tv_sec * 1000000000 + temp.tv_nsec;
	imulq	$1000000000, %r12, %r10	#, temp$tv_sec, tmp1325
# sub.c:1391:             t1 = t1 / 1e6; // ns -> ms
	vxorpd	%xmm11, %xmm11, %xmm11	# tmp4839
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC69(%rip), %rdi	#, tmp1329
# sub.c:1546:     return temp.tv_sec * 1000000000 + temp.tv_nsec;
	addq	%rbx, %r10	# temp$tv_nsec, t1
# sub.c:1391:             t1 = t1 / 1e6; // ns -> ms
	vcvtusi2sdq	%r10, %xmm11, %xmm12	# t1, tmp4839, tmp3930
	movl	%eax, -66312(%rbp)	# niter, %sfp
# sub.c:1396:             for (decimals = 0;; decimals++)
	xorl	%r14d, %r14d	# decimals
# sub.c:1391:             t1 = t1 / 1e6; // ns -> ms
	vmulsd	.LC65(%rip), %xmm12, %xmm13	#, tmp1327, _100
	vmovq	%xmm13, %r12	# _100, _100
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	puts@PLT	#
# sub.c:1394:             ops_per_sec = 1000.0 * niter / t1;
	movl	-66312(%rbp), %r11d	# %sfp, niter
	vxorpd	%xmm14, %xmm14, %xmm14	# tmp4841
	vcvtsi2sdl	%r11d, %xmm14, %xmm15	# niter, tmp4841, tmp3931
# sub.c:1391:             t1 = t1 / 1e6; // ns -> ms
	vmovq	%r12, %xmm0	# _100, _100
	vcvttsd2usi	%xmm0, %r8	# _100, t1
# sub.c:1394:             ops_per_sec = 1000.0 * niter / t1;
	vmovsd	.LC70(%rip), %xmm4	#, tmp1330
# sub.c:1398:                 if (ops_per_sec > f)
	vmovsd	.LC51(%rip), %xmm13	#, tmp1335
# sub.c:1394:             ops_per_sec = 1000.0 * niter / t1;
	vmulsd	%xmm15, %xmm4, %xmm7	# tmp3931, tmp1330, tmp1330
# sub.c:1394:             ops_per_sec = 1000.0 * niter / t1;
	vcvtusi2sdq	%r8, %xmm14, %xmm1	# t1, tmp4843, tmp3932
# sub.c:1394:             ops_per_sec = 1000.0 * niter / t1;
	vdivsd	%xmm1, %xmm7, %xmm3	# tmp1334, tmp1331, ops_per_sec
# sub.c:1398:                 if (ops_per_sec > f)
	vcomisd	%xmm13, %xmm3	# tmp1335, ops_per_sec
	ja	.L869	#,
	vmovsd	.LC71(%rip), %xmm2	#, tmp2541
.L870:
# sub.c:1400:                 f = f * 0.1;
	vmulsd	%xmm2, %xmm13, %xmm5	# tmp2541, f, f
# sub.c:1396:             for (decimals = 0;; decimals++)
	leal	1(%r14), %edx	#, tmp1835
	movl	%edx, %r14d	# tmp1835, decimals
# sub.c:1398:                 if (ops_per_sec > f)
	vcomisd	%xmm5, %xmm3	# f, ops_per_sec
	ja	.L869	#,
# sub.c:1400:                 f = f * 0.1;
	vmulsd	%xmm2, %xmm5, %xmm6	# tmp2541, f, f
# sub.c:1396:             for (decimals = 0;; decimals++)
	incl	%r14d	# decimals
# sub.c:1398:                 if (ops_per_sec > f)
	vcomisd	%xmm6, %xmm3	# f, ops_per_sec
	ja	.L869	#,
# sub.c:1400:                 f = f * 0.1;
	vmulsd	%xmm2, %xmm6, %xmm8	# tmp2541, f, f
# sub.c:1396:             for (decimals = 0;; decimals++)
	leal	2(%rdx), %r14d	#, decimals
# sub.c:1398:                 if (ops_per_sec > f)
	vcomisd	%xmm8, %xmm3	# f, ops_per_sec
	ja	.L869	#,
# sub.c:1400:                 f = f * 0.1;
	vmulsd	%xmm2, %xmm8, %xmm9	# tmp2541, f, f
# sub.c:1396:             for (decimals = 0;; decimals++)
	leal	3(%rdx), %r14d	#, decimals
# sub.c:1398:                 if (ops_per_sec > f)
	vcomisd	%xmm9, %xmm3	# f, ops_per_sec
	ja	.L869	#,
# sub.c:1400:                 f = f * 0.1;
	vmulsd	%xmm2, %xmm9, %xmm10	# tmp2541, f, f
# sub.c:1396:             for (decimals = 0;; decimals++)
	leal	4(%rdx), %r14d	#, decimals
# sub.c:1398:                 if (ops_per_sec > f)
	vcomisd	%xmm10, %xmm3	# f, ops_per_sec
	ja	.L869	#,
# sub.c:1400:                 f = f * 0.1;
	vmulsd	%xmm2, %xmm10, %xmm11	# tmp2541, f, f
# sub.c:1396:             for (decimals = 0;; decimals++)
	leal	5(%rdx), %r14d	#, decimals
# sub.c:1398:                 if (ops_per_sec > f)
	vcomisd	%xmm11, %xmm3	# f, ops_per_sec
	ja	.L869	#,
# sub.c:1400:                 f = f * 0.1;
	vmulsd	%xmm2, %xmm11, %xmm12	# tmp2541, f, f
# sub.c:1396:             for (decimals = 0;; decimals++)
	leal	6(%rdx), %r14d	#, decimals
# sub.c:1398:                 if (ops_per_sec > f)
	vcomisd	%xmm12, %xmm3	# f, ops_per_sec
	ja	.L869	#,
# sub.c:1400:                 f = f * 0.1;
	vmulsd	%xmm2, %xmm12, %xmm13	# tmp2541, f, f
# sub.c:1396:             for (decimals = 0;; decimals++)
	leal	7(%rdx), %r14d	#, decimals
# sub.c:1398:                 if (ops_per_sec > f)
	vcomisd	%xmm13, %xmm3	# f, ops_per_sec
	jbe	.L870	#,
.L869:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vmovsd	%xmm3, %xmm3, %xmm0	# ops_per_sec,
	movl	%r14d, %edx	# decimals,
	leaq	.LC72(%rip), %rsi	#, tmp1337
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	vmovsd	%xmm3, -66312(%rbp)	# ops_per_sec, %sfp
	call	__printf_chk@PLT	#
# sub.c:1403:             gzprintf(timespec_file, "%.*f\n", decimals, ops_per_sec);
	movq	-66360(%rbp), %rbx	# %sfp, file
	vmovsd	-66312(%rbp), %xmm0	# %sfp, ops_per_sec
	movl	%r14d, %edx	# decimals,
	leaq	.LC73(%rip), %rsi	#, tmp1338
	movq	%rbx, %rdi	# file,
	movl	$1, %eax	#,
	call	gzprintf@PLT	#
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:54:   free (__ptr);
	movq	%r13, %rdi	# a.123_90,
	call	free@PLT	#
	movq	%r15, %rdi	# b.122_89,
	call	free@PLT	#
# sub.c:1449:     gzclose(test_file);
	movq	-66320(%rbp), %rdi	# %sfp,
	call	gzclose@PLT	#
# sub.c:1457:         gzclose(timespec_file);
	movq	%rbx, %rdi	# file,
	call	gzclose@PLT	#
	jmp	.L872	#
	.p2align 4,,10
	.p2align 3
.L2778:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L943	#,
# sub.c:185:         j++;
	movl	$1, %ecx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %r12	#, sub_size
	je	.L895	#,
# sub.c:192:     } while (j < n);
	jbe	.L942	#,
	testq	%r9, %r9	# tmp1814
	je	.L889	#,
	cmpq	$1, %r9	#, tmp1814
	je	.L1992	#,
	cmpq	$2, %r9	#, tmp1814
	je	.L1993	#,
	cmpq	$3, %r9	#, tmp1814
	je	.L1994	#,
	cmpq	$4, %r9	#, tmp1814
	je	.L1995	#,
	cmpq	$5, %r9	#, tmp1814
	je	.L1996	#,
	cmpq	$6, %r9	#, tmp1814
	jne	.L2840	#,
.L1997:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rcx,8), %r10	# MEM[(uint64_t *)b.130_105 + j_989 * 8], tmp5110
	cmpq	%r10, (%r15,%rcx,8)	# tmp5110, MEM[(uint64_t *)a.131_106 + j_989 * 8]
	ja	.L942	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L943	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L895	#,
.L1996:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rcx,8), %rsi	# MEM[(uint64_t *)b.130_105 + j_989 * 8], tmp5111
	cmpq	%rsi, (%r15,%rcx,8)	# tmp5111, MEM[(uint64_t *)a.131_106 + j_989 * 8]
	ja	.L942	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L943	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L895	#,
.L1995:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rcx,8), %r9	# MEM[(uint64_t *)b.130_105 + j_989 * 8], tmp5112
	cmpq	%r9, (%r15,%rcx,8)	# tmp5112, MEM[(uint64_t *)a.131_106 + j_989 * 8]
	ja	.L942	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L943	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L895	#,
.L1994:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rcx,8), %rdi	# MEM[(uint64_t *)b.130_105 + j_989 * 8], tmp5113
	cmpq	%rdi, (%r15,%rcx,8)	# tmp5113, MEM[(uint64_t *)a.131_106 + j_989 * 8]
	ja	.L942	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L943	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L895	#,
.L1993:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rcx,8), %rdx	# MEM[(uint64_t *)b.130_105 + j_989 * 8], tmp5114
	cmpq	%rdx, (%r15,%rcx,8)	# tmp5114, MEM[(uint64_t *)a.131_106 + j_989 * 8]
	ja	.L942	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L943	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L895	#,
.L1992:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rcx,8), %r10	# MEM[(uint64_t *)b.130_105 + j_989 * 8], tmp5115
	cmpq	%r10, (%r15,%rcx,8)	# tmp5115, MEM[(uint64_t *)a.131_106 + j_989 * 8]
	ja	.L942	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L943	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L895	#,
# sub.c:192:     } while (j < n);
	jbe	.L942	#,
.L889:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rcx,8), %rsi	# MEM[(uint64_t *)b.130_105 + j_989 * 8], tmp4880
	cmpq	%rsi, (%r15,%rcx,8)	# tmp4880, MEM[(uint64_t *)a.131_106 + j_989 * 8]
	ja	.L942	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L943	#,
# sub.c:185:         j++;
	leaq	1(%rcx), %r9	#, tmp1815
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r9, %r12	# tmp1815, sub_size
	je	.L895	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%r9,8), %rdi	# MEM[(uint64_t *)b.130_105 + j_989 * 8], tmp4881
	cmpq	%rdi, (%r15,%r9,8)	# tmp4881, MEM[(uint64_t *)a.131_106 + j_989 * 8]
	ja	.L942	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L943	#,
# sub.c:185:         j++;
	leaq	2(%rcx), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L895	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rdx,8), %r10	# MEM[(uint64_t *)b.130_105 + j_989 * 8], tmp5116
	cmpq	%r10, (%r15,%rdx,8)	# tmp5116, MEM[(uint64_t *)a.131_106 + j_989 * 8]
	ja	.L942	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L943	#,
# sub.c:185:         j++;
	addq	$3, %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L895	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rcx,8), %rsi	# MEM[(uint64_t *)b.130_105 + j_989 * 8], tmp5117
	cmpq	%rsi, (%r15,%rcx,8)	# tmp5117, MEM[(uint64_t *)a.131_106 + j_989 * 8]
	ja	.L942	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L943	#,
# sub.c:185:         j++;
	leaq	3(%r9), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L895	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rcx,8), %rdi	# MEM[(uint64_t *)b.130_105 + j_989 * 8], tmp5118
	cmpq	%rdi, (%r15,%rcx,8)	# tmp5118, MEM[(uint64_t *)a.131_106 + j_989 * 8]
	ja	.L942	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L943	#,
# sub.c:185:         j++;
	leaq	4(%r9), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L895	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rdx,8), %r10	# MEM[(uint64_t *)b.130_105 + j_989 * 8], tmp5119
	cmpq	%r10, (%r15,%rdx,8)	# tmp5119, MEM[(uint64_t *)a.131_106 + j_989 * 8]
	ja	.L942	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L943	#,
# sub.c:185:         j++;
	leaq	5(%r9), %rsi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rsi, %r12	# j, sub_size
	je	.L895	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rsi,8), %rcx	# MEM[(uint64_t *)b.130_105 + j_989 * 8], tmp5120
	cmpq	%rcx, (%r15,%rsi,8)	# tmp5120, MEM[(uint64_t *)a.131_106 + j_989 * 8]
	ja	.L942	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L943	#,
# sub.c:185:         j++;
	leaq	6(%r9), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L895	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rdx,8), %rdi	# MEM[(uint64_t *)b.130_105 + j_989 * 8], tmp5121
	cmpq	%rdi, (%r15,%rdx,8)	# tmp5121, MEM[(uint64_t *)a.131_106 + j_989 * 8]
	ja	.L942	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L943	#,
# sub.c:185:         j++;
	leaq	7(%r9), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L895	#,
# sub.c:192:     } while (j < n);
	ja	.L889	#,
	jmp	.L942	#
	.p2align 4,,10
	.p2align 3
.L2809:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L932	#,
# sub.c:185:         j++;
	movl	$1, %ecx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %r12	#, sub_size
	je	.L853	#,
# sub.c:192:     } while (j < n);
	jbe	.L931	#,
	testq	%rsi, %rsi	# tmp1872
	je	.L847	#,
	cmpq	$1, %rsi	#, tmp1872
	je	.L2046	#,
	cmpq	$2, %rsi	#, tmp1872
	je	.L2047	#,
	cmpq	$3, %rsi	#, tmp1872
	je	.L2048	#,
	cmpq	$4, %rsi	#, tmp1872
	je	.L2049	#,
	cmpq	$5, %rsi	#, tmp1872
	je	.L2050	#,
	cmpq	$6, %rsi	#, tmp1872
	jne	.L2841	#,
.L2051:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %r9	# MEM[(uint64_t *)b.122_89 + j_693 * 8], tmp5206
	cmpq	%r9, 0(%r13,%rcx,8)	# tmp5206, MEM[(uint64_t *)a.123_90 + j_693 * 8]
	ja	.L931	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L932	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L853	#,
.L2050:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %r8	# MEM[(uint64_t *)b.122_89 + j_693 * 8], tmp5207
	cmpq	%r8, 0(%r13,%rcx,8)	# tmp5207, MEM[(uint64_t *)a.123_90 + j_693 * 8]
	ja	.L931	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L932	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L853	#,
.L2049:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %rdx	# MEM[(uint64_t *)b.122_89 + j_693 * 8], tmp5208
	cmpq	%rdx, 0(%r13,%rcx,8)	# tmp5208, MEM[(uint64_t *)a.123_90 + j_693 * 8]
	ja	.L931	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L932	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L853	#,
.L2048:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %rsi	# MEM[(uint64_t *)b.122_89 + j_693 * 8], tmp5209
	cmpq	%rsi, 0(%r13,%rcx,8)	# tmp5209, MEM[(uint64_t *)a.123_90 + j_693 * 8]
	ja	.L931	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L932	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L853	#,
.L2047:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_693 * 8], tmp5210
	cmpq	%rdi, 0(%r13,%rcx,8)	# tmp5210, MEM[(uint64_t *)a.123_90 + j_693 * 8]
	ja	.L931	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L932	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L853	#,
.L2046:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %r9	# MEM[(uint64_t *)b.122_89 + j_693 * 8], tmp5211
	cmpq	%r9, 0(%r13,%rcx,8)	# tmp5211, MEM[(uint64_t *)a.123_90 + j_693 * 8]
	ja	.L931	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L932	#,
# sub.c:185:         j++;
	incq	%rcx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L853	#,
# sub.c:192:     } while (j < n);
	jbe	.L931	#,
.L847:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %r8	# MEM[(uint64_t *)b.122_89 + j_693 * 8], tmp4774
	cmpq	%r8, 0(%r13,%rcx,8)	# tmp4774, MEM[(uint64_t *)a.123_90 + j_693 * 8]
	ja	.L931	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L932	#,
# sub.c:185:         j++;
	leaq	1(%rcx), %rdx	#, tmp1873
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# tmp1873, sub_size
	je	.L853	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %rsi	# MEM[(uint64_t *)b.122_89 + j_693 * 8], tmp4775
	cmpq	%rsi, 0(%r13,%rdx,8)	# tmp4775, MEM[(uint64_t *)a.123_90 + j_693 * 8]
	ja	.L931	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L932	#,
# sub.c:185:         j++;
	leaq	2(%rcx), %r9	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r9, %r12	# j, sub_size
	je	.L853	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%r9,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_693 * 8], tmp5212
	cmpq	%rdi, 0(%r13,%r9,8)	# tmp5212, MEM[(uint64_t *)a.123_90 + j_693 * 8]
	ja	.L931	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L932	#,
# sub.c:185:         j++;
	addq	$3, %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L853	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %r8	# MEM[(uint64_t *)b.122_89 + j_693 * 8], tmp5213
	cmpq	%r8, 0(%r13,%rcx,8)	# tmp5213, MEM[(uint64_t *)a.123_90 + j_693 * 8]
	ja	.L931	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L932	#,
# sub.c:185:         j++;
	leaq	3(%rdx), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L853	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %rsi	# MEM[(uint64_t *)b.122_89 + j_693 * 8], tmp5214
	cmpq	%rsi, 0(%r13,%rcx,8)	# tmp5214, MEM[(uint64_t *)a.123_90 + j_693 * 8]
	ja	.L931	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L932	#,
# sub.c:185:         j++;
	leaq	4(%rdx), %r9	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r9, %r12	# j, sub_size
	je	.L853	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%r9,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_693 * 8], tmp5215
	cmpq	%rdi, 0(%r13,%r9,8)	# tmp5215, MEM[(uint64_t *)a.123_90 + j_693 * 8]
	ja	.L931	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L932	#,
# sub.c:185:         j++;
	leaq	5(%rdx), %r8	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r8, %r12	# j, sub_size
	je	.L853	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%r8,8), %rcx	# MEM[(uint64_t *)b.122_89 + j_693 * 8], tmp5216
	cmpq	%rcx, 0(%r13,%r8,8)	# tmp5216, MEM[(uint64_t *)a.123_90 + j_693 * 8]
	ja	.L931	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L932	#,
# sub.c:185:         j++;
	leaq	6(%rdx), %rsi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rsi, %r12	# j, sub_size
	je	.L853	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rsi,8), %r9	# MEM[(uint64_t *)b.122_89 + j_693 * 8], tmp5217
	cmpq	%r9, 0(%r13,%rsi,8)	# tmp5217, MEM[(uint64_t *)a.123_90 + j_693 * 8]
	ja	.L931	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L932	#,
# sub.c:185:         j++;
	leaq	7(%rdx), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L853	#,
# sub.c:192:     } while (j < n);
	ja	.L847	#,
	jmp	.L931	#
	.p2align 4,,10
	.p2align 3
.L2810:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rdx)	# tmp1267, MEM[(__mmask8 *)_475]
	jmp	.L1663	#
.L2779:
	kmovb	%k0, (%rdx)	# tmp1455, MEM[(__mmask8 *)_1327]
	jmp	.L1404	#
.L2782:
	kmovb	%k5, (%rsi)	# tmp3332, MEM[(__mmask8 *)_1327]
	jmp	.L1412	#
.L2813:
	kmovb	%k2, (%rsi)	# tmp3674, MEM[(__mmask8 *)_475]
	jmp	.L1671	#
.L2822:
# sub.c:1537:         temp.tv_sec = end.tv_sec - start.tv_sec - 1;
	subq	-66352(%rbp), %rax	# %sfp, tmp1271
# sub.c:1546:     return temp.tv_sec * 1000000000 + temp.tv_nsec;
	imulq	$1000000000, %rax, %r8	#, tmp1271, tmp1273
# sub.c:1538:         temp.tv_nsec = 1000000000 + end.tv_nsec - start.tv_nsec;
	subq	-66328(%rbp), %r10	# %sfp, tmp1275
# sub.c:1546:     return temp.tv_sec * 1000000000 + temp.tv_nsec;
	addq	%r10, %r8	# tmp1275, _204
# sub.c:1375:             TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
	cmpq	$249999999, %r8	#, _204
	jle	.L1895	#,
	jmp	.L854	#
.L2812:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k7, (%rsi)	# tmp3668, MEM[(__mmask8 *)_475]
	jmp	.L1668	#
.L2781:
	kmovb	%k3, (%rsi)	# tmp3326, MEM[(__mmask8 *)_1327]
	jmp	.L1409	#
.L2811:
	kmovb	%k5, 1(%rdx)	# tmp3662, MEM[(__mmask8 *)_475]
	jmp	.L1665	#
.L2780:
	kmovb	%k1, 1(%rdx)	# tmp3320, MEM[(__mmask8 *)_1327]
	jmp	.L1406	#
.L2830:
	kmovb	%k3, 2(%rdx)	# tmp3578, MEM[(__mmask8 *)_573]
	jmp	.L1592	#
.L2829:
	kmovb	%k1, 1(%rdx)	# tmp3570, MEM[(__mmask8 *)_573]
	jmp	.L1590	#
.L2828:
	kmovb	%k6, 1(%rsi)	# tmp2540, MEM[(__mmask8 *)_573]
	jmp	.L1588	#
.L2838:
	kmovb	%k6, 2(%rdx)	# tmp3236, MEM[(__mmask8 *)_1222]
	jmp	.L1333	#
.L2837:
	kmovb	%k4, 1(%rdx)	# tmp3228, MEM[(__mmask8 *)_1222]
	jmp	.L1331	#
.L2836:
	kmovb	%k2, 1(%rsi)	# tmp2853, MEM[(__mmask8 *)_1222]
	jmp	.L1329	#
.L2832:
	kmovb	%k0, (%rdx)	# tmp1522, MEM[(__mmask8 *)_1222]
	jmp	.L1318	#
.L2831:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L948	#,
# sub.c:185:         j++;
	movl	$1, %edx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %r12	#, sub_size
	je	.L908	#,
# sub.c:192:     } while (j < n);
	jbe	.L947	#,
	testq	%rcx, %rcx	# tmp1795
	je	.L902	#,
	cmpq	$1, %rcx	#, tmp1795
	je	.L1974	#,
	cmpq	$2, %rcx	#, tmp1795
	je	.L1975	#,
	cmpq	$3, %rcx	#, tmp1795
	je	.L1976	#,
	cmpq	$4, %rcx	#, tmp1795
	je	.L1977	#,
	cmpq	$5, %rcx	#, tmp1795
	je	.L1978	#,
	cmpq	$6, %rcx	#, tmp1795
	jne	.L2842	#,
.L1979:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rdx,8), %r9	# MEM[(uint64_t *)b.130_105 + j_1093 * 8], tmp5079
	cmpq	%r9, (%r15,%rdx,8)	# tmp5079, MEM[(uint64_t *)a.131_106 + j_1093 * 8]
	ja	.L947	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L948	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L908	#,
.L1978:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rdx,8), %rcx	# MEM[(uint64_t *)b.130_105 + j_1093 * 8], tmp5080
	cmpq	%rcx, (%r15,%rdx,8)	# tmp5080, MEM[(uint64_t *)a.131_106 + j_1093 * 8]
	ja	.L947	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L948	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L908	#,
.L1977:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rdx,8), %rdi	# MEM[(uint64_t *)b.130_105 + j_1093 * 8], tmp5081
	cmpq	%rdi, (%r15,%rdx,8)	# tmp5081, MEM[(uint64_t *)a.131_106 + j_1093 * 8]
	ja	.L947	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L948	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L908	#,
.L1976:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rdx,8), %rsi	# MEM[(uint64_t *)b.130_105 + j_1093 * 8], tmp5082
	cmpq	%rsi, (%r15,%rdx,8)	# tmp5082, MEM[(uint64_t *)a.131_106 + j_1093 * 8]
	ja	.L947	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L948	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L908	#,
.L1975:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rdx,8), %r10	# MEM[(uint64_t *)b.130_105 + j_1093 * 8], tmp5083
	cmpq	%r10, (%r15,%rdx,8)	# tmp5083, MEM[(uint64_t *)a.131_106 + j_1093 * 8]
	ja	.L947	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L948	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L908	#,
.L1974:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rdx,8), %r9	# MEM[(uint64_t *)b.130_105 + j_1093 * 8], tmp5084
	cmpq	%r9, (%r15,%rdx,8)	# tmp5084, MEM[(uint64_t *)a.131_106 + j_1093 * 8]
	ja	.L947	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L948	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L908	#,
.L2749:
# sub.c:192:     } while (j < n);
	jbe	.L947	#,
.L902:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rdx,8), %rcx	# MEM[(uint64_t *)b.130_105 + j_1093 * 8], tmp4919
	cmpq	%rcx, (%r15,%rdx,8)	# tmp4919, MEM[(uint64_t *)a.131_106 + j_1093 * 8]
	ja	.L947	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L948	#,
# sub.c:185:         j++;
	leaq	1(%rdx), %r10	#, tmp1796
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r10, %r12	# tmp1796, sub_size
	je	.L908	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%r10,8), %rdi	# MEM[(uint64_t *)b.130_105 + j_1093 * 8], tmp4920
	cmpq	%rdi, (%r15,%r10,8)	# tmp4920, MEM[(uint64_t *)a.131_106 + j_1093 * 8]
	ja	.L947	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L948	#,
# sub.c:185:         j++;
	leaq	2(%rdx), %rsi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rsi, %r12	# j, sub_size
	je	.L908	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rsi,8), %r9	# MEM[(uint64_t *)b.130_105 + j_1093 * 8], tmp5085
	cmpq	%r9, (%r15,%rsi,8)	# tmp5085, MEM[(uint64_t *)a.131_106 + j_1093 * 8]
	ja	.L947	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L948	#,
# sub.c:185:         j++;
	addq	$3, %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L908	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rdx,8), %rcx	# MEM[(uint64_t *)b.130_105 + j_1093 * 8], tmp5086
	cmpq	%rcx, (%r15,%rdx,8)	# tmp5086, MEM[(uint64_t *)a.131_106 + j_1093 * 8]
	ja	.L947	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L948	#,
# sub.c:185:         j++;
	leaq	3(%r10), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L908	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rdx,8), %rdi	# MEM[(uint64_t *)b.130_105 + j_1093 * 8], tmp5087
	cmpq	%rdi, (%r15,%rdx,8)	# tmp5087, MEM[(uint64_t *)a.131_106 + j_1093 * 8]
	ja	.L947	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L948	#,
# sub.c:185:         j++;
	leaq	4(%r10), %rsi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rsi, %r12	# j, sub_size
	je	.L908	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rsi,8), %r9	# MEM[(uint64_t *)b.130_105 + j_1093 * 8], tmp5088
	cmpq	%r9, (%r15,%rsi,8)	# tmp5088, MEM[(uint64_t *)a.131_106 + j_1093 * 8]
	ja	.L947	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L948	#,
# sub.c:185:         j++;
	leaq	5(%r10), %rcx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# j, sub_size
	je	.L908	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rcx,8), %rdx	# MEM[(uint64_t *)b.130_105 + j_1093 * 8], tmp5089
	cmpq	%rdx, (%r15,%rcx,8)	# tmp5089, MEM[(uint64_t *)a.131_106 + j_1093 * 8]
	ja	.L947	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L948	#,
# sub.c:185:         j++;
	leaq	6(%r10), %rsi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rsi, %r12	# j, sub_size
	je	.L908	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rsi,8), %rdi	# MEM[(uint64_t *)b.130_105 + j_1093 * 8], tmp5090
	cmpq	%rdi, (%r15,%rsi,8)	# tmp5090, MEM[(uint64_t *)a.131_106 + j_1093 * 8]
	ja	.L947	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L948	#,
# sub.c:185:         j++;
	leaq	7(%r10), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	jne	.L2749	#,
	jmp	.L908	#
	.p2align 4,,10
	.p2align 3
.L943:
	movq	%r15, %rdi	# a.131_106, b
	movq	%r13, %r9	# b.130_105, a
	jmp	.L886	#
.L932:
	movq	%r13, %rdi	# a.123_90, b
	movq	%r15, %r8	# b.122_89, a
	jmp	.L843	#
.L2823:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L936	#,
# sub.c:185:         j++;
	movl	$1, %edx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %r12	#, sub_size
	je	.L867	#,
# sub.c:192:     } while (j < n);
	jbe	.L935	#,
	testq	%rcx, %rcx	# tmp1853
	je	.L861	#,
	cmpq	$1, %rcx	#, tmp1853
	je	.L2028	#,
	cmpq	$2, %rcx	#, tmp1853
	je	.L2029	#,
	cmpq	$3, %rcx	#, tmp1853
	je	.L2030	#,
	cmpq	$4, %rcx	#, tmp1853
	je	.L2031	#,
	cmpq	$5, %rcx	#, tmp1853
	je	.L2032	#,
	cmpq	$6, %rcx	#, tmp1853
	jne	.L2843	#,
.L2033:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_792 * 8], tmp5175
	cmpq	%rdi, 0(%r13,%rdx,8)	# tmp5175, MEM[(uint64_t *)a.123_90 + j_792 * 8]
	ja	.L935	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L936	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L867	#,
.L2032:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %rsi	# MEM[(uint64_t *)b.122_89 + j_792 * 8], tmp5176
	cmpq	%rsi, 0(%r13,%rdx,8)	# tmp5176, MEM[(uint64_t *)a.123_90 + j_792 * 8]
	ja	.L935	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L936	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L867	#,
.L2031:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %rcx	# MEM[(uint64_t *)b.122_89 + j_792 * 8], tmp5177
	cmpq	%rcx, 0(%r13,%rdx,8)	# tmp5177, MEM[(uint64_t *)a.123_90 + j_792 * 8]
	ja	.L935	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L936	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L867	#,
.L2030:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %r8	# MEM[(uint64_t *)b.122_89 + j_792 * 8], tmp5178
	cmpq	%r8, 0(%r13,%rdx,8)	# tmp5178, MEM[(uint64_t *)a.123_90 + j_792 * 8]
	ja	.L935	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L936	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L867	#,
.L2029:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %r9	# MEM[(uint64_t *)b.122_89 + j_792 * 8], tmp5179
	cmpq	%r9, 0(%r13,%rdx,8)	# tmp5179, MEM[(uint64_t *)a.123_90 + j_792 * 8]
	ja	.L935	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L936	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L867	#,
.L2028:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_792 * 8], tmp5180
	cmpq	%rdi, 0(%r13,%rdx,8)	# tmp5180, MEM[(uint64_t *)a.123_90 + j_792 * 8]
	ja	.L935	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L936	#,
# sub.c:185:         j++;
	incq	%rdx	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L867	#,
.L2746:
# sub.c:192:     } while (j < n);
	jbe	.L935	#,
.L861:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %rsi	# MEM[(uint64_t *)b.122_89 + j_792 * 8], tmp4812
	cmpq	%rsi, 0(%r13,%rdx,8)	# tmp4812, MEM[(uint64_t *)a.123_90 + j_792 * 8]
	ja	.L935	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L936	#,
# sub.c:185:         j++;
	leaq	1(%rdx), %rcx	#, tmp1854
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# tmp1854, sub_size
	je	.L867	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rcx,8), %r8	# MEM[(uint64_t *)b.122_89 + j_792 * 8], tmp4813
	cmpq	%r8, 0(%r13,%rcx,8)	# tmp4813, MEM[(uint64_t *)a.123_90 + j_792 * 8]
	ja	.L935	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L936	#,
# sub.c:185:         j++;
	leaq	2(%rdx), %r9	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r9, %r12	# j, sub_size
	je	.L867	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%r9,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_792 * 8], tmp5181
	cmpq	%rdi, 0(%r13,%r9,8)	# tmp5181, MEM[(uint64_t *)a.123_90 + j_792 * 8]
	ja	.L935	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L936	#,
# sub.c:185:         j++;
	addq	$3, %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L867	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %rsi	# MEM[(uint64_t *)b.122_89 + j_792 * 8], tmp5182
	cmpq	%rsi, 0(%r13,%rdx,8)	# tmp5182, MEM[(uint64_t *)a.123_90 + j_792 * 8]
	ja	.L935	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L936	#,
# sub.c:185:         j++;
	leaq	3(%rcx), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L867	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %r8	# MEM[(uint64_t *)b.122_89 + j_792 * 8], tmp5183
	cmpq	%r8, 0(%r13,%rdx,8)	# tmp5183, MEM[(uint64_t *)a.123_90 + j_792 * 8]
	ja	.L935	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L936	#,
# sub.c:185:         j++;
	leaq	4(%rcx), %r9	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r9, %r12	# j, sub_size
	je	.L867	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%r9,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_792 * 8], tmp5184
	cmpq	%rdi, 0(%r13,%r9,8)	# tmp5184, MEM[(uint64_t *)a.123_90 + j_792 * 8]
	ja	.L935	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L936	#,
# sub.c:185:         j++;
	leaq	5(%rcx), %rsi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rsi, %r12	# j, sub_size
	je	.L867	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rsi,8), %rdx	# MEM[(uint64_t *)b.122_89 + j_792 * 8], tmp5185
	cmpq	%rdx, 0(%r13,%rsi,8)	# tmp5185, MEM[(uint64_t *)a.123_90 + j_792 * 8]
	ja	.L935	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L936	#,
# sub.c:185:         j++;
	leaq	6(%rcx), %r8	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r8, %r12	# j, sub_size
	je	.L867	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%r8,8), %r9	# MEM[(uint64_t *)b.122_89 + j_792 * 8], tmp5186
	cmpq	%r9, 0(%r13,%r8,8)	# tmp5186, MEM[(uint64_t *)a.123_90 + j_792 * 8]
	ja	.L935	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L936	#,
# sub.c:185:         j++;
	leaq	7(%rcx), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	jne	.L2746	#,
	jmp	.L867	#
	.p2align 4,,10
	.p2align 3
.L2824:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rdx)	# tmp1319, MEM[(__mmask8 *)_573]
	jmp	.L1577	#
.L2827:
	kmovb	%k3, (%rsi)	# tmp3562, MEM[(__mmask8 *)_573]
	jmp	.L1585	#
.L2835:
	kmovb	%k6, (%rsi)	# tmp3220, MEM[(__mmask8 *)_1222]
	jmp	.L1326	#
.L2839:
# sub.c:1538:         temp.tv_nsec = 1000000000 + end.tv_nsec - start.tv_nsec;
	addq	$1000000000, %r14	#, tmp1324
# sub.c:1537:         temp.tv_sec = end.tv_sec - start.tv_sec - 1;
	subq	-66328(%rbp), %r12	# %sfp, tmp1323
# sub.c:1538:         temp.tv_nsec = 1000000000 + end.tv_nsec - start.tv_nsec;
	subq	-66344(%rbp), %r14	# %sfp, tmp1324
# sub.c:1537:         temp.tv_sec = end.tv_sec - start.tv_sec - 1;
	decq	%r12	# temp$tv_sec
# sub.c:1538:         temp.tv_nsec = 1000000000 + end.tv_nsec - start.tv_nsec;
	movq	%r14, %rbx	# tmp1324, temp$tv_nsec
	jmp	.L868	#
.L2826:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k1, (%rsi)	# tmp3556, MEM[(__mmask8 *)_573]
	jmp	.L1582	#
.L2834:
	kmovb	%k4, (%rsi)	# tmp3214, MEM[(__mmask8 *)_1222]
	jmp	.L1323	#
.L2797:
	kmovb	%k7, (%rsi)	# tmp2872, MEM[(__mmask8 *)_1308]
	jmp	.L1064	#
.L2788:
	kmovb	%k4, 2(%r11)	# tmp3460, MEM[(__mmask8 *)_1333]
	jmp	.L1505	#
.L2791:
	kmovb	%k5, 1(%rdi)	# tmp3110, MEM[(__mmask8 *)_667]
	jmp	.L1244	#
.L2790:
	kmovb	%k3, 1(%rax)	# tmp2025, MEM[(__mmask8 *)_667]
	jmp	.L1242	#
.L2792:
	kmovb	%k7, 2(%rdi)	# tmp3118, MEM[(__mmask8 *)_667]
	jmp	.L1246	#
.L2819:
	kmovb	%k1, 2(%r11)	# tmp3802, MEM[(__mmask8 *)_382]
	jmp	.L1764	#
.L2818:
	kmovb	%k6, 1(%r11)	# tmp3794, MEM[(__mmask8 *)_382]
	jmp	.L1762	#
.L2817:
	kmovb	%k4, 1(%rsi)	# tmp2335, MEM[(__mmask8 *)_382]
	jmp	.L1760	#
.L2787:
	kmovb	%k2, 1(%r11)	# tmp3452, MEM[(__mmask8 *)_1333]
	jmp	.L1503	#
.L2786:
	kmovb	%k7, 1(%rsi)	# tmp2648, MEM[(__mmask8 *)_1333]
	jmp	.L1501	#
.L2796:
	kmovb	%k5, 1(%rdx)	# tmp2866, MEM[(__mmask8 *)_1308]
	jmp	.L1061	#
.L2825:
	kmovb	%k6, 1(%rdx)	# tmp3550, MEM[(__mmask8 *)_573]
	jmp	.L1579	#
.L2833:
	kmovb	%k2, 1(%rdx)	# tmp3208, MEM[(__mmask8 *)_1222]
	jmp	.L1320	#
.L948:
	movq	%r15, %rdi	# a.131_106, b
	movq	%r13, %r9	# b.130_105, a
	jmp	.L899	#
.L927:
	movq	%r15, %rdi	# a.115_70, b
	movq	%rbx, %r8	# b.114_69, a
	jmp	.L816	#
.L2808:
	kmovb	%k1, (%rsi)	# tmp3786, MEM[(__mmask8 *)_382]
	jmp	.L1757	#
.L2757:
	kmovb	%k0, (%rax)	# tmp1048, MEM[(__mmask8 *)_667]
	jmp	.L1231	#
.L2777:
	kmovb	%k4, (%rsi)	# tmp3444, MEM[(__mmask8 *)_1333]
	jmp	.L1498	#
.L936:
	movq	%r13, %rdi	# a.123_90, b
	movq	%r15, %r8	# b.122_89, a
	jmp	.L858	#
.L2774:
	kmovb	%k0, (%rsi)	# tmp1404, MEM[(__mmask8 *)_1333]
	jmp	.L1490	#
.L2760:
	kmovb	%k7, (%rax)	# tmp3102, MEM[(__mmask8 *)_667]
	jmp	.L1239	#
.L2803:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L930	#,
# sub.c:185:         j++;
	movl	$1, %eax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %r12	#, sub_size
	je	.L2413	#,
# sub.c:192:     } while (j < n);
	jbe	.L929	#,
	testq	%r8, %r8	# tmp1891
	je	.L832	#,
	cmpq	$1, %r8	#, tmp1891
	je	.L2064	#,
	cmpq	$2, %r8	#, tmp1891
	je	.L2065	#,
	cmpq	$3, %r8	#, tmp1891
	je	.L2066	#,
	cmpq	$4, %r8	#, tmp1891
	je	.L2067	#,
	cmpq	$5, %r8	#, tmp1891
	je	.L2068	#,
	cmpq	$6, %r8	#, tmp1891
	jne	.L2844	#,
.L2069:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %r10	# MEM[(uint64_t *)b.122_89 + j_604 * 8], tmp5240
	cmpq	%r10, 0(%r13,%rax,8)	# tmp5240, MEM[(uint64_t *)a.123_90 + j_604 * 8]
	ja	.L929	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L930	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2413	#,
.L2068:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %r11	# MEM[(uint64_t *)b.122_89 + j_604 * 8], tmp5241
	cmpq	%r11, 0(%r13,%rax,8)	# tmp5241, MEM[(uint64_t *)a.123_90 + j_604 * 8]
	ja	.L929	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L930	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2413	#,
.L2067:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %rdx	# MEM[(uint64_t *)b.122_89 + j_604 * 8], tmp5242
	cmpq	%rdx, 0(%r13,%rax,8)	# tmp5242, MEM[(uint64_t *)a.123_90 + j_604 * 8]
	ja	.L929	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L930	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2413	#,
.L2066:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_604 * 8], tmp5243
	cmpq	%rdi, 0(%r13,%rax,8)	# tmp5243, MEM[(uint64_t *)a.123_90 + j_604 * 8]
	ja	.L929	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L930	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2413	#,
.L2065:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %rsi	# MEM[(uint64_t *)b.122_89 + j_604 * 8], tmp5244
	cmpq	%rsi, 0(%r13,%rax,8)	# tmp5244, MEM[(uint64_t *)a.123_90 + j_604 * 8]
	ja	.L929	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L930	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2413	#,
.L2064:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %r8	# MEM[(uint64_t *)b.122_89 + j_604 * 8], tmp5245
	cmpq	%r8, 0(%r13,%rax,8)	# tmp5245, MEM[(uint64_t *)a.123_90 + j_604 * 8]
	ja	.L929	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L930	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2413	#,
.L2744:
# sub.c:192:     } while (j < n);
	jbe	.L929	#,
.L832:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %rbx	# MEM[(uint64_t *)b.122_89 + j_604 * 8], tmp4739
	cmpq	%rbx, 0(%r13,%rax,8)	# tmp4739, MEM[(uint64_t *)a.123_90 + j_604 * 8]
	ja	.L929	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L930	#,
# sub.c:185:         j++;
	leaq	1(%rax), %r10	#, tmp1892
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r10, %r12	# tmp1892, sub_size
	je	.L2413	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%r10,8), %r11	# MEM[(uint64_t *)b.122_89 + j_604 * 8], tmp4743
	cmpq	%r11, 0(%r13,%r10,8)	# tmp4743, MEM[(uint64_t *)a.123_90 + j_604 * 8]
	ja	.L929	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L930	#,
# sub.c:185:         j++;
	leaq	2(%rax), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L2413	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_604 * 8], tmp5246
	cmpq	%rdi, 0(%r13,%rdx,8)	# tmp5246, MEM[(uint64_t *)a.123_90 + j_604 * 8]
	ja	.L929	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L930	#,
# sub.c:185:         j++;
	addq	$3, %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2413	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %rsi	# MEM[(uint64_t *)b.122_89 + j_604 * 8], tmp5247
	cmpq	%rsi, 0(%r13,%rax,8)	# tmp5247, MEM[(uint64_t *)a.123_90 + j_604 * 8]
	ja	.L929	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L930	#,
# sub.c:185:         j++;
	leaq	3(%r10), %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2413	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %r8	# MEM[(uint64_t *)b.122_89 + j_604 * 8], tmp5248
	cmpq	%r8, 0(%r13,%rax,8)	# tmp5248, MEM[(uint64_t *)a.123_90 + j_604 * 8]
	ja	.L929	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L930	#,
# sub.c:185:         j++;
	leaq	4(%r10), %r11	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r11, %r12	# j, sub_size
	je	.L2413	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%r11,8), %rbx	# MEM[(uint64_t *)b.122_89 + j_604 * 8], tmp5249
	cmpq	%rbx, 0(%r13,%r11,8)	# tmp5249, MEM[(uint64_t *)a.123_90 + j_604 * 8]
	ja	.L929	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L930	#,
# sub.c:185:         j++;
	leaq	5(%r10), %rdx	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdx, %r12	# j, sub_size
	je	.L2413	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rdx,8), %rdi	# MEM[(uint64_t *)b.122_89 + j_604 * 8], tmp5250
	cmpq	%rdi, 0(%r13,%rdx,8)	# tmp5250, MEM[(uint64_t *)a.123_90 + j_604 * 8]
	ja	.L929	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L930	#,
# sub.c:185:         j++;
	leaq	6(%r10), %rsi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rsi, %r12	# j, sub_size
	je	.L2413	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rsi,8), %rax	# MEM[(uint64_t *)b.122_89 + j_604 * 8], tmp5251
	cmpq	%rax, 0(%r13,%rsi,8)	# tmp5251, MEM[(uint64_t *)a.123_90 + j_604 * 8]
	ja	.L929	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L930	#,
# sub.c:185:         j++;
	leaq	7(%r10), %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	jne	.L2744	#,
.L2413:
	leaq	-1(%r12), %rdi	#, tmp2235
	jmp	.L839	#
	.p2align 4,,10
	.p2align 3
.L2755:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L920	#,
# sub.c:185:         j++;
	movl	$1, %eax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %r12	#, sub_size
	je	.L2405	#,
# sub.c:192:     } while (j < n);
	jbe	.L919	#,
	testq	%rcx, %rcx	# tmp1775
	je	.L2518	#,
	cmpq	$1, %rcx	#, tmp1775
	je	.L1956	#,
	cmpq	$2, %rcx	#, tmp1775
	je	.L1957	#,
	cmpq	$3, %rcx	#, tmp1775
	je	.L1958	#,
	cmpq	$4, %rcx	#, tmp1775
	je	.L1959	#,
	cmpq	$5, %rcx	#, tmp1775
	je	.L1960	#,
	cmpq	$6, %rcx	#, tmp1775
	jne	.L2845	#,
.L1961:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	-66344(%rbp), %r11	# %sfp, b.114_69
	movq	(%r11,%rax,8), %r10	# MEM[(uint64_t *)b.114_69 + j_316 * 8], tmp5043
	cmpq	%r10, (%r15,%rax,8)	# tmp5043, MEM[(uint64_t *)a.115_70 + j_316 * 8]
	ja	.L919	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L920	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2405	#,
.L1960:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	-66344(%rbp), %rbx	# %sfp, b.114_69
	movq	(%rbx,%rax,8), %r13	# MEM[(uint64_t *)b.114_69 + j_316 * 8], tmp5045
	cmpq	%r13, (%r15,%rax,8)	# tmp5045, MEM[(uint64_t *)a.115_70 + j_316 * 8]
	ja	.L919	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L920	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2405	#,
.L1959:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	-66344(%rbp), %rdi	# %sfp, b.114_69
	movq	(%rdi,%rax,8), %rcx	# MEM[(uint64_t *)b.114_69 + j_316 * 8], tmp5047
	cmpq	%rcx, (%r15,%rax,8)	# tmp5047, MEM[(uint64_t *)a.115_70 + j_316 * 8]
	ja	.L919	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L920	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2405	#,
.L1958:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	-66344(%rbp), %rsi	# %sfp, b.114_69
	movq	(%rsi,%rax,8), %r8	# MEM[(uint64_t *)b.114_69 + j_316 * 8], tmp5049
	cmpq	%r8, (%r15,%rax,8)	# tmp5049, MEM[(uint64_t *)a.115_70 + j_316 * 8]
	ja	.L919	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L920	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2405	#,
.L1957:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	-66344(%rbp), %r11	# %sfp, b.114_69
	movq	(%r11,%rax,8), %r10	# MEM[(uint64_t *)b.114_69 + j_316 * 8], tmp5051
	cmpq	%r10, (%r15,%rax,8)	# tmp5051, MEM[(uint64_t *)a.115_70 + j_316 * 8]
	ja	.L919	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L920	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2405	#,
.L1956:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	-66344(%rbp), %rbx	# %sfp, b.114_69
	movq	(%rbx,%rax,8), %r13	# MEM[(uint64_t *)b.114_69 + j_316 * 8], tmp5053
	cmpq	%r13, (%r15,%rax,8)	# tmp5053, MEM[(uint64_t *)a.115_70 + j_316 * 8]
	ja	.L919	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L920	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2405	#,
	movq	-66344(%rbp), %rsi	# %sfp, b.114_69
# sub.c:192:     } while (j < n);
	jbe	.L919	#,
.L792:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rsi,%rax,8), %rdi	# MEM[(uint64_t *)b.114_69 + j_316 * 8], tmp4633
	cmpq	%rdi, (%r15,%rax,8)	# tmp4633, MEM[(uint64_t *)a.115_70 + j_316 * 8]
	ja	.L919	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L920	#,
# sub.c:185:         j++;
	leaq	1(%rax), %rcx	#, tmp1776
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rcx, %r12	# tmp1776, sub_size
	je	.L2405	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rsi,%rcx,8), %r8	# MEM[(uint64_t *)b.114_69 + j_316 * 8], tmp4637
	cmpq	%r8, (%r15,%rcx,8)	# tmp4637, MEM[(uint64_t *)a.115_70 + j_316 * 8]
	ja	.L919	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L920	#,
# sub.c:185:         j++;
	leaq	2(%rax), %r11	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r11, %r12	# j, sub_size
	je	.L2405	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rsi,%r11,8), %r10	# MEM[(uint64_t *)b.114_69 + j_316 * 8], tmp5054
	cmpq	%r10, (%r15,%r11,8)	# tmp5054, MEM[(uint64_t *)a.115_70 + j_316 * 8]
	ja	.L919	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L920	#,
# sub.c:185:         j++;
	addq	$3, %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2405	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rsi,%rax,8), %rbx	# MEM[(uint64_t *)b.114_69 + j_316 * 8], tmp5055
	cmpq	%rbx, (%r15,%rax,8)	# tmp5055, MEM[(uint64_t *)a.115_70 + j_316 * 8]
	ja	.L919	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L920	#,
# sub.c:185:         j++;
	leaq	3(%rcx), %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2405	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rsi,%rax,8), %r13	# MEM[(uint64_t *)b.114_69 + j_316 * 8], tmp5056
	cmpq	%r13, (%r15,%rax,8)	# tmp5056, MEM[(uint64_t *)a.115_70 + j_316 * 8]
	ja	.L919	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L920	#,
# sub.c:185:         j++;
	leaq	4(%rcx), %rdi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdi, %r12	# j, sub_size
	je	.L2405	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rsi,%rdi,8), %r8	# MEM[(uint64_t *)b.114_69 + j_316 * 8], tmp5057
	cmpq	%r8, (%r15,%rdi,8)	# tmp5057, MEM[(uint64_t *)a.115_70 + j_316 * 8]
	ja	.L919	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L920	#,
# sub.c:185:         j++;
	leaq	5(%rcx), %r11	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r11, %r12	# j, sub_size
	je	.L2405	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rsi,%r11,8), %r10	# MEM[(uint64_t *)b.114_69 + j_316 * 8], tmp5058
	cmpq	%r10, (%r15,%r11,8)	# tmp5058, MEM[(uint64_t *)a.115_70 + j_316 * 8]
	ja	.L919	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L920	#,
# sub.c:185:         j++;
	leaq	6(%rcx), %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2405	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%rsi,%rax,8), %rbx	# MEM[(uint64_t *)b.114_69 + j_316 * 8], tmp5059
	cmpq	%rbx, (%r15,%rax,8)	# tmp5059, MEM[(uint64_t *)a.115_70 + j_316 * 8]
	ja	.L919	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L920	#,
# sub.c:185:         j++;
	leaq	7(%rcx), %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2405	#,
# sub.c:192:     } while (j < n);
	ja	.L792	#,
	jmp	.L919	#
	.p2align 4,,10
	.p2align 3
.L2772:
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L940	#,
# sub.c:185:         j++;
	movl	$1, %eax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	$1, %r12	#, sub_size
	je	.L2409	#,
# sub.c:192:     } while (j < n);
	jbe	.L939	#,
	testq	%rsi, %rsi	# tmp1833
	je	.L876	#,
	cmpq	$1, %rsi	#, tmp1833
	je	.L2010	#,
	cmpq	$2, %rsi	#, tmp1833
	je	.L2011	#,
	cmpq	$3, %rsi	#, tmp1833
	je	.L2012	#,
	cmpq	$4, %rsi	#, tmp1833
	je	.L2013	#,
	cmpq	$5, %rsi	#, tmp1833
	je	.L2014	#,
	cmpq	$6, %rsi	#, tmp1833
	jne	.L2846	#,
.L2015:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rax,8), %r8	# MEM[(uint64_t *)b.130_105 + j_891 * 8], tmp5144
	cmpq	%r8, (%r15,%rax,8)	# tmp5144, MEM[(uint64_t *)a.131_106 + j_891 * 8]
	ja	.L939	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L940	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2409	#,
.L2014:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rax,8), %rdx	# MEM[(uint64_t *)b.130_105 + j_891 * 8], tmp5145
	cmpq	%rdx, (%r15,%rax,8)	# tmp5145, MEM[(uint64_t *)a.131_106 + j_891 * 8]
	ja	.L939	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L940	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2409	#,
.L2013:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rax,8), %rbx	# MEM[(uint64_t *)b.130_105 + j_891 * 8], tmp5146
	cmpq	%rbx, (%r15,%rax,8)	# tmp5146, MEM[(uint64_t *)a.131_106 + j_891 * 8]
	ja	.L939	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L940	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2409	#,
.L2012:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rax,8), %rdi	# MEM[(uint64_t *)b.130_105 + j_891 * 8], tmp5147
	cmpq	%rdi, (%r15,%rax,8)	# tmp5147, MEM[(uint64_t *)a.131_106 + j_891 * 8]
	ja	.L939	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L940	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2409	#,
.L2011:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rax,8), %rsi	# MEM[(uint64_t *)b.130_105 + j_891 * 8], tmp5148
	cmpq	%rsi, (%r15,%rax,8)	# tmp5148, MEM[(uint64_t *)a.131_106 + j_891 * 8]
	ja	.L939	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L940	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2409	#,
.L2010:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rax,8), %r10	# MEM[(uint64_t *)b.130_105 + j_891 * 8], tmp5149
	cmpq	%r10, (%r15,%rax,8)	# tmp5149, MEM[(uint64_t *)a.131_106 + j_891 * 8]
	ja	.L939	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L940	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2409	#,
.L2747:
# sub.c:192:     } while (j < n);
	jbe	.L939	#,
.L876:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rax,8), %r11	# MEM[(uint64_t *)b.130_105 + j_891 * 8], tmp4845
	cmpq	%r11, (%r15,%rax,8)	# tmp4845, MEM[(uint64_t *)a.131_106 + j_891 * 8]
	ja	.L939	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L940	#,
# sub.c:185:         j++;
	leaq	1(%rax), %r8	#, tmp1834
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r8, %r12	# tmp1834, sub_size
	je	.L2409	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%r8,8), %rdx	# MEM[(uint64_t *)b.130_105 + j_891 * 8], tmp4849
	cmpq	%rdx, (%r15,%r8,8)	# tmp4849, MEM[(uint64_t *)a.131_106 + j_891 * 8]
	ja	.L939	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L940	#,
# sub.c:185:         j++;
	leaq	2(%rax), %rdi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdi, %r12	# j, sub_size
	je	.L2409	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rdi,8), %rbx	# MEM[(uint64_t *)b.130_105 + j_891 * 8], tmp5150
	cmpq	%rbx, (%r15,%rdi,8)	# tmp5150, MEM[(uint64_t *)a.131_106 + j_891 * 8]
	ja	.L939	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L940	#,
# sub.c:185:         j++;
	addq	$3, %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2409	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rax,8), %rsi	# MEM[(uint64_t *)b.130_105 + j_891 * 8], tmp5151
	cmpq	%rsi, (%r15,%rax,8)	# tmp5151, MEM[(uint64_t *)a.131_106 + j_891 * 8]
	ja	.L939	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L940	#,
# sub.c:185:         j++;
	leaq	3(%r8), %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	je	.L2409	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rax,8), %r10	# MEM[(uint64_t *)b.130_105 + j_891 * 8], tmp5152
	cmpq	%r10, (%r15,%rax,8)	# tmp5152, MEM[(uint64_t *)a.131_106 + j_891 * 8]
	ja	.L939	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L940	#,
# sub.c:185:         j++;
	leaq	4(%r8), %r11	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%r11, %r12	# j, sub_size
	je	.L2409	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%r11,8), %rdx	# MEM[(uint64_t *)b.130_105 + j_891 * 8], tmp5153
	cmpq	%rdx, (%r15,%r11,8)	# tmp5153, MEM[(uint64_t *)a.131_106 + j_891 * 8]
	ja	.L939	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L940	#,
# sub.c:185:         j++;
	leaq	5(%r8), %rdi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rdi, %r12	# j, sub_size
	je	.L2409	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rdi,8), %rbx	# MEM[(uint64_t *)b.130_105 + j_891 * 8], tmp5154
	cmpq	%rbx, (%r15,%rdi,8)	# tmp5154, MEM[(uint64_t *)a.131_106 + j_891 * 8]
	ja	.L939	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L940	#,
# sub.c:185:         j++;
	leaq	6(%r8), %rsi	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rsi, %r12	# j, sub_size
	je	.L2409	#,
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rsi,8), %rax	# MEM[(uint64_t *)b.130_105 + j_891 * 8], tmp5155
	cmpq	%rax, (%r15,%rsi,8)	# tmp5155, MEM[(uint64_t *)a.131_106 + j_891 * 8]
	ja	.L939	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L940	#,
# sub.c:185:         j++;
	leaq	7(%r8), %rax	#, j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	jne	.L2747	#,
.L2409:
	leaq	-1(%r12), %rdi	#, tmp2547
	jmp	.L883	#
	.p2align 4,,10
	.p2align 3
.L2805:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k0, (%rsi)	# tmp1233, MEM[(__mmask8 *)_382]
	jmp	.L1749	#
.L940:
	movq	%r15, %rdi	# a.131_106, b
	movq	%r13, %r10	# b.130_105, a
	jmp	.L873	#
.L2775:
	kmovb	%k7, (%rsi)	# tmp3432, MEM[(__mmask8 *)_1333]
	jmp	.L1492	#
.L2846:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rax,8), %r11	# MEM[(uint64_t *)b.130_105 + j_891 * 8], tmp5143
	cmpq	%r11, (%r15,%rax,8)	# tmp5143, MEM[(uint64_t *)a.131_106 + j_891 * 8]
	ja	.L939	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L940	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	jne	.L2015	#,
	jmp	.L2409	#
	.p2align 4,,10
	.p2align 3
.L920:
	movq	-66344(%rbp), %rdi	# %sfp, a
	movq	%r15, %r13	# a.115_70, b
	jmp	.L789	#
.L2845:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	0(%r13,%rax,8), %r8	# MEM[(uint64_t *)b.114_69 + j_316 * 8], tmp5041
	cmpq	%r8, (%r15,%rax,8)	# tmp5041, MEM[(uint64_t *)a.115_70 + j_316 * 8]
	ja	.L919	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L920	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	jne	.L1961	#,
.L2405:
	leaq	-1(%r12), %rsi	#, tmp1666
	jmp	.L799	#
.L2770:
# sub.c:1219:                     perror("Error reading line");
	leaq	.LC39(%rip), %rdi	#, tmp946
	call	perror@PLT	#
# sub.c:1220:                     gzclose(test_file);
	movq	-66320(%rbp), %rdi	# %sfp,
	call	gzclose@PLT	#
# sub.c:1221:                     exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L2750:
	movq	-66320(%rbp), %rdi	# %sfp,
	call	skip_first_line.part.0	#
.L2752:
	movq	%r12, %rdi	# tmp1667,
	call	open_gzfile.part.0	#
.L2771:
# sub.c:1474: }
	call	__stack_chk_fail@PLT	#
.L2518:
	movq	%r13, %rsi	# b.114_69, b.114_69
	jmp	.L792	#
.L2806:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k4, (%rsi)	# tmp3774, MEM[(__mmask8 *)_382]
	jmp	.L1751	#
.L930:
	movq	%r13, %r11	# a.123_90, b
	movq	%r15, %r8	# b.122_89, a
	jmp	.L829	#
.L2844:
# sub.c:172:         if (likely(a[j] > b[j]))
	movq	(%r15,%rax,8), %rbx	# MEM[(uint64_t *)b.122_89 + j_604 * 8], tmp5239
	cmpq	%rbx, 0(%r13,%rax,8)	# tmp5239, MEM[(uint64_t *)a.123_90 + j_604 * 8]
	ja	.L929	#,
# sub.c:176:         if (unlikely(a[j] < b[j]))
	jb	.L930	#,
# sub.c:185:         j++;
	incq	%rax	# j
# sub.c:186:         if (unlikely(j == n))
	cmpq	%rax, %r12	# j, sub_size
	jne	.L2069	#,
	jmp	.L2413	#
.L761:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC37(%rip), %rdi	#, tmp914
	call	puts@PLT	#
# sub.c:1181:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L777:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:105:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	# stderr,
	movq	%r12, %rcx	# tmp1661,
	leaq	.LC41(%rip), %rdx	#, tmp949
	movl	$1, %esi	#,
	xorl	%eax, %eax	#
	call	__fprintf_chk@PLT	#
# sub.c:1234:             gzclose(test_file);
	movq	-66320(%rbp), %rdi	# %sfp,
	call	gzclose@PLT	#
# sub.c:1235:             exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L910:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC49(%rip), %rdi	#, tmp1529
	call	puts@PLT	#
# sub.c:1467:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L2758:
# sub.c:247:             bm[j] = borrow_mask;
	kmovb	%k3, (%rax)	# tmp3090, MEM[(__mmask8 *)_667]
	jmp	.L1233	#
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
	movq	%rax, 56(%rsp)	# tmp208, D.41547
	xorl	%eax, %eax	# tmp208
# sub.c:280:     if (argc != 5)
	cmpl	$5, %edi	#, tmp191
	je	.L2848	#,
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
.L2847:
# sub.c:335: }
	movq	56(%rsp), %rax	# D.41547, tmp209
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp209
	jne	.L2865	#,
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
.L2848:
	.cfi_restore_state
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	8(%rsi), %rdi	# MEM[(char * *)argv_26(D) + 8B], MEM[(char * *)argv_26(D) + 8B]
	movl	$10, %edx	#,
	xorl	%esi, %esi	#
	call	strtol@PLT	#
# sub.c:293:     assert(atoi(argv[1]) > 0);
	testl	%eax, %eax	# tmp193
	jle	.L2866	#,
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
	js	.L2852	#,
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
	jge	.L2852	#,
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
	js	.L2854	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	24(%rbx), %rdi	# MEM[(char * *)argv_26(D) + 24B], MEM[(char * *)argv_26(D) + 24B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
	call	strtol@PLT	#
# sub.c:299:     assert(atoi(argv[3]) >= 0 && atoi(argv[3]) < 4);
	cmpl	$3, %eax	#, tmp200
	jg	.L2854	#,
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
	js	.L2856	#,
# /usr/include/stdlib.h:364:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	32(%rbx), %rdi	# MEM[(char * *)argv_26(D) + 32B], MEM[(char * *)argv_26(D) + 32B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
	call	strtol@PLT	#
# sub.c:302:     assert(atoi(argv[4]) >= 0 && atoi(argv[4]) < 3);
	cmpl	$2, %eax	#, tmp203
	jg	.L2856	#,
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
	jne	.L2857	#,
	movq	48(%rsp), %rbx	# D.41537, _115
	leaq	40(%rsp), %rdi	#, tmp169
	movl	$1073741824, %edx	#,
	movl	$64, %esi	#,
# sub.c:306:     sub_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	%rbx, sub_space(%rip)	# _115, sub_space
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	call	posix_memalign@PLT	#
	movl	%eax, %r12d	# tmp206, <retval>
	testl	%eax, %eax	# <retval>
	jne	.L2858	#,
	movq	40(%rsp), %r15	# D.41531, _103
# sub.c:307:     borrow_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	%r15, borrow_space(%rip)	# _103, borrow_space
# sub.c:310:     if (sub_space == NULL || borrow_space == NULL)
	testq	%r15, %r15	# _103
	je	.L2861	#,
	testq	%rbx, %rbx	# _115
	je	.L2861	#,
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
	jmp	.L2847	#
.L2857:
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	leaq	40(%rsp), %rdi	#, tmp189
	movl	$1073741824, %edx	#,
	movl	$64, %esi	#,
# sub.c:306:     sub_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	$0, sub_space(%rip)	#, sub_space
# /usr/lib/gcc/x86_64-linux-gnu/11/include/mm_malloc.h:45:   if (posix_memalign (&__ptr, __alignment, __size) == 0)
	call	posix_memalign@PLT	#
	testl	%eax, %eax	# tmp207
	je	.L2867	#,
.L2858:
# sub.c:307:     borrow_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	$0, borrow_space(%rip)	#, borrow_space
.L2861:
# sub.c:312:         perror("Memory allocation failed for sub_space or borrow_space\n");
	leaq	.LC101(%rip), %rdi	#, tmp174
	call	perror@PLT	#
# sub.c:313:         exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L2866:
# sub.c:293:     assert(atoi(argv[1]) > 0);
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	#, tmp145
	movl	$293, %edx	#,
	leaq	.LC96(%rip), %rsi	#, tmp146
	leaq	.LC97(%rip), %rdi	#, tmp147
	call	__assert_fail@PLT	#
.L2865:
# sub.c:335: }
	call	__stack_chk_fail@PLT	#
.L2854:
# sub.c:299:     assert(atoi(argv[3]) >= 0 && atoi(argv[3]) < 4);
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	#, tmp157
	movl	$299, %edx	#,
	leaq	.LC96(%rip), %rsi	#, tmp158
	leaq	.LC99(%rip), %rdi	#, tmp159
	call	__assert_fail@PLT	#
.L2856:
# sub.c:302:     assert(atoi(argv[4]) >= 0 && atoi(argv[4]) < 3);
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	#, tmp163
	movl	$302, %edx	#,
	leaq	.LC96(%rip), %rsi	#, tmp164
	leaq	.LC100(%rip), %rdi	#, tmp165
	call	__assert_fail@PLT	#
.L2852:
# sub.c:296:     assert(atoi(argv[2]) >= 0 && atoi(argv[2]) < sysconf(_SC_NPROCESSORS_ONLN));
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	#, tmp150
	movl	$296, %edx	#,
	leaq	.LC96(%rip), %rsi	#, tmp151
	leaq	.LC98(%rip), %rdi	#, tmp152
	call	__assert_fail@PLT	#
.L2867:
# sub.c:307:     borrow_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
	movq	40(%rsp), %rax	# D.41531, D.41531
	movq	%rax, borrow_space(%rip)	# D.41531, borrow_space
	jmp	.L2861	#
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
	js	.L2872	#,
# sub.c:1565: }
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L2872:
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
