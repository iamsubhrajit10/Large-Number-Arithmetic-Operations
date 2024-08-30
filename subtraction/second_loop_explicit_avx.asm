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