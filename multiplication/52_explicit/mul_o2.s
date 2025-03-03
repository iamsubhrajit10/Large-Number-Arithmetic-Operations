limb_mul_n_52:
.LFB5649:
	.cfi_startproc
	endbr64
	movq	%rsi, %r8
	movq	(%rdi), %rsi
	vmovdqa64	perm_idx_11(%rip), %zmm4
	movl	$-32, %edi
	movq	(%r8), %rax
	kmovb	%edi, %k1
	vmovdqa64	perm_idx_21(%rip), %zmm7
	movq	%rdx, %r10
	vmovdqa64	(%rsi), %zmm1
	prefetchnta	(%rsi)
	vmovdqa64	ZEROS(%rip), %zmm8
	movl	$64, %r9d
	vmovdqa64	(%rax), %zmm3
	prefetchnta	(%rax)
	vmovdqa64	perm_idx_12(%rip), %zmm5
	kmovb	%r9d, %k3
	vmovdqa64	perm_idx_22(%rip), %zmm0
	vpermq	%zmm1, %zmm4, %zmm6
	vmovdqa64	ZEROS(%rip), %zmm14
	movl	$-28, %r11d
	vpermq	%zmm3, %zmm7, %zmm11
	vpermq	%zmm1, %zmm5, %zmm10
	kmovb	%r11d, %k4
	vmovdqa64	perm_idx_0(%rip), %zmm2
	vpmadd52huq	%zmm11, %zmm6, %zmm8
	vpermq	%zmm3, %zmm0, %zmm12
	vpmadd52huq	%zmm12, %zmm10, %zmm14
	vmovdqa64	%zmm8, (%rcx)
	vpermq	%zmm8, %zmm2, %zmm13
	vmovdqa64	perm_idx_1(%rip), %zmm9
	vpermq	%zmm14, %zmm9, %zmm13{%k1}
	vpmadd52luq	%zmm11, %zmm6, %zmm13
	vmovdqa64	%zmm13, (%rdx)
	movl	$-72, %edx
	vmovdqa64	perm_idx_13(%rip), %zmm6
	vmovdqa64	ZEROS(%rip), %zmm7
	vmovdqa64	perm_idx_2(%rip), %zmm15
	kmovb	%edx, %k2
	vmovdqa64	perm_idx_3(%rip), %zmm11
	vmovdqa64	%zmm14, 64(%rcx)
	vpermq	%zmm1, %zmm6, %zmm5
	vmovdqa64	perm_idx_23(%rip), %zmm1
	vpermq	%zmm14, %zmm15, %zmm4
	vpermq	%zmm3, %zmm1, %zmm3
	vpmadd52huq	%zmm3, %zmm5, %zmm7
	vpermq	%zmm7, %zmm11, %zmm4{%k2}
	vmovdqa64	ZEROS(%rip), %zmm4{%k3}
	vpmadd52luq	%zmm12, %zmm10, %zmm4
	vmovdqa64	perm_idx_4(%rip), %zmm10
	vpermq	%zmm7, %zmm10, %zmm8
	vmovdqa64	ZEROS(%rip), %zmm8{%k4}
	vpmadd52luq	%zmm3, %zmm5, %zmm8
	vmovdqa64	%zmm4, 64(%r10)
	vmovdqa64	%zmm8, 128(%r10)
	movq	32(%rax), %rdx
	mulx	32(%rsi), %r8, %rdi
	movq	%r8, %rsi
	shrdq	$52, %rdi, %rsi
	addq	%rsi, 184(%r10)
	movq	16(%rcx), %r9
	movabsq	$4503599627370495, %rsi
	andq	%rsi, %r8
	addq	%r9, (%r10)
	movq	40(%rcx), %r11
	addq	%r11, 16(%r10)
	movq	72(%rcx), %rdx
	addq	%rdx, 40(%r10)
	movq	112(%rcx), %rdi
	addq	%rdi, 72(%r10)
	movq	%r8, 72(%rcx)
	movq	184(%r10), %r8
	addq	176(%r10), %r8
	movq	%r8, %rax
	shrq	$52, %r8
	andq	%rsi, %rax
	movq	%rax, 64(%rcx)
	movq	160(%r10), %r9
	addq	152(%r10), %r9
	addq	168(%r10), %r9
	addq	%r8, %r9
	movq	%r9, %r11
	shrq	$52, %r9
	andq	%rsi, %r11
	movq	%r11, 56(%rcx)
	movq	128(%r10), %rdx
	addq	120(%r10), %rdx
	addq	136(%r10), %rdx
	addq	144(%r10), %rdx
	addq	%r9, %rdx
	movq	%rdx, %rdi
	shrq	$52, %rdx
	andq	%rsi, %rdi
	movq	%rdi, 48(%rcx)
	movq	88(%r10), %r8
	addq	80(%r10), %r8
	addq	96(%r10), %r8
	addq	104(%r10), %r8
	addq	112(%r10), %r8
	addq	%rdx, %r8
	movq	%r8, %rax
	shrq	$52, %r8
	andq	%rsi, %rax
	movq	%rax, 40(%rcx)
	movq	56(%r10), %r9
	addq	48(%r10), %r9
	addq	64(%r10), %r9
	addq	72(%r10), %r9
	addq	%r9, %r8
	movq	%r8, %r11
	andq	%rsi, %r11
	shrq	$52, %r8
	movq	%r11, 32(%rcx)
	movq	32(%r10), %rdx
	addq	24(%r10), %rdx
	addq	40(%r10), %rdx
	addq	%r8, %rdx
	movq	%rdx, %rdi
	shrq	$52, %rdx
	andq	%rsi, %rdi
	movq	%rdi, 24(%rcx)
	movq	16(%r10), %r8
	addq	8(%r10), %r8
	addq	%rdx, %r8
	movq	%r8, %rax
	shrq	$52, %r8
	andq	%rsi, %rax
	movq	%rax, 16(%rcx)
	addq	(%r10), %r8
	andq	%r8, %rsi
	shrq	$52, %r8
	addq	%r8, (%rcx)
	movq	%rsi, 8(%rcx)
	vzeroupper
	ret
	.cfi_endproc