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