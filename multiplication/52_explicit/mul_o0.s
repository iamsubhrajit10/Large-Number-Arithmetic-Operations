limb_mul_n_52:
.LFB4328:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-64, %rsp
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$1480, %rsp
	movq	%rdi, -96(%rsp)
	movq	%rsi, -104(%rsp)
	movq	%rdx, -112(%rsp)
	movq	%rcx, -120(%rsp)
	movq	-96(%rsp), %rax
	movq	(%rax), %rax
	prefetchnta	(%rax)
	movq	-104(%rsp), %rax
	movq	(%rax), %rax
	prefetchnta	(%rax)
	movq	-96(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, -80(%rsp)
	movq	-104(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, -72(%rsp)
	movq	-80(%rsp), %rax
	movq	%rax, -16(%rsp)
	movq	-16(%rsp), %rax
	vmovdqa64	(%rax), %zmm0
	vmovdqa64	%zmm0, 8(%rsp)
	vmovdqa64	perm_idx_11(%rip), %zmm0
	vmovdqa64	%zmm0, 5384(%rsp)
	vmovdqa64	8(%rsp), %zmm0
	vmovdqa64	%zmm0, 5448(%rsp)
	vmovdqa64	5512(%rsp), %zmm1
	vmovdqa64	5384(%rsp), %zmm0
	kxnorb	%k1, %k1, %k1
	vpermq	5448(%rsp), %zmm0, %zmm1{%k1}
	vmovdqa64	%zmm1, %zmm0
	nop
	vmovdqa64	%zmm0, 72(%rsp)
	vmovdqa64	perm_idx_12(%rip), %zmm0
	vmovdqa64	%zmm0, 5192(%rsp)
	vmovdqa64	8(%rsp), %zmm0
	vmovdqa64	%zmm0, 5256(%rsp)
	vmovdqa64	5320(%rsp), %zmm1
	vmovdqa64	5192(%rsp), %zmm0
	kxnorb	%k1, %k1, %k1
	vpermq	5256(%rsp), %zmm0, %zmm1{%k1}
	vmovdqa64	%zmm1, %zmm0
	nop
	vmovdqa64	%zmm0, 136(%rsp)
	movq	-72(%rsp), %rax
	movq	%rax, -24(%rsp)
	movq	-24(%rsp), %rax
	vmovdqa64	(%rax), %zmm0
	vmovdqa64	%zmm0, 200(%rsp)
	vmovdqa64	perm_idx_21(%rip), %zmm0
	vmovdqa64	%zmm0, 5000(%rsp)
	vmovdqa64	200(%rsp), %zmm0
	vmovdqa64	%zmm0, 5064(%rsp)
	vmovdqa64	5128(%rsp), %zmm1
	vmovdqa64	5000(%rsp), %zmm0
	kxnorb	%k1, %k1, %k1
	vpermq	5064(%rsp), %zmm0, %zmm1{%k1}
	vmovdqa64	%zmm1, %zmm0
	nop
	vmovdqa64	%zmm0, 264(%rsp)
	vmovdqa64	ZEROS(%rip), %zmm0
	vmovdqa64	%zmm0, 4808(%rsp)
	vmovdqa64	72(%rsp), %zmm0
	vmovdqa64	%zmm0, 4872(%rsp)
	vmovdqa64	264(%rsp), %zmm0
	vmovdqa64	%zmm0, 4936(%rsp)
	vmovdqa64	4808(%rsp), %zmm0
	vmovdqa64	4872(%rsp), %zmm1
	vmovdqa64	4936(%rsp), %zmm2
	kxnorb	%k1, %k1, %k1
	vpmadd52huq	%zmm2, %zmm1, %zmm0{%k1}
	nop
	vmovdqa64	%zmm0, 328(%rsp)
	vmovdqa64	perm_idx_22(%rip), %zmm0
	vmovdqa64	%zmm0, 4616(%rsp)
	vmovdqa64	200(%rsp), %zmm0
	vmovdqa64	%zmm0, 4680(%rsp)
	vmovdqa64	4744(%rsp), %zmm1
	vmovdqa64	4616(%rsp), %zmm0
	kxnorb	%k1, %k1, %k1
	vpermq	4680(%rsp), %zmm0, %zmm1{%k1}
	vmovdqa64	%zmm1, %zmm0
	nop
	vmovdqa64	%zmm0, 392(%rsp)
	vmovdqa64	perm_idx_0(%rip), %zmm0
	vmovdqa64	%zmm0, 4424(%rsp)
	vmovdqa64	328(%rsp), %zmm0
	vmovdqa64	%zmm0, 4488(%rsp)
	vmovdqa64	4552(%rsp), %zmm1
	vmovdqa64	4424(%rsp), %zmm0
	kxnorb	%k1, %k1, %k1
	vpermq	4488(%rsp), %zmm0, %zmm1{%k1}
	vmovdqa64	%zmm1, %zmm0
	nop
	vmovdqa64	%zmm0, 456(%rsp)
	vmovdqa64	ZEROS(%rip), %zmm0
	vmovdqa64	%zmm0, 4232(%rsp)
	vmovdqa64	136(%rsp), %zmm0
	vmovdqa64	%zmm0, 4296(%rsp)
	vmovdqa64	392(%rsp), %zmm0
	vmovdqa64	%zmm0, 4360(%rsp)
	vmovdqa64	4232(%rsp), %zmm0
	vmovdqa64	4296(%rsp), %zmm1
	vmovdqa64	4360(%rsp), %zmm2
	kxnorb	%k1, %k1, %k1
	vpmadd52huq	%zmm2, %zmm1, %zmm0{%k1}
	nop
	vmovdqa64	%zmm0, 520(%rsp)
	movq	-120(%rsp), %rax
	movq	%rax, -32(%rsp)
	vmovdqa64	328(%rsp), %zmm0
	vmovdqa64	%zmm0, 4168(%rsp)
	movq	-32(%rsp), %rax
	vmovdqa64	4168(%rsp), %zmm0
	vmovdqa64	%zmm0, (%rax)
	nop
	vmovdqa64	perm_idx_1(%rip), %zmm0
	vmovdqa64	%zmm0, 3976(%rsp)
	vmovdqa64	520(%rsp), %zmm0
	vmovdqa64	%zmm0, 4040(%rsp)
	vmovdqa64	4104(%rsp), %zmm1
	vmovdqa64	3976(%rsp), %zmm0
	kxnorb	%k1, %k1, %k1
	vpermq	4040(%rsp), %zmm0, %zmm1{%k1}
	vmovdqa64	%zmm1, %zmm0
	nop
	vmovdqa64	%zmm0, 584(%rsp)
	movb	$-32, -85(%rsp)
	vmovdqa64	456(%rsp), %zmm0
	vmovdqa64	%zmm0, 3848(%rsp)
	vmovdqa64	584(%rsp), %zmm0
	vmovdqa64	%zmm0, 3912(%rsp)
	movzbl	-85(%rsp), %eax
	vmovdqa64	3848(%rsp), %zmm0
	vmovdqa64	3912(%rsp), %zmm1
	kmovb	%eax, %k2
	vmovdqa64	%zmm1, %zmm0{%k2}
	nop
	vmovdqa64	%zmm0, 648(%rsp)
	vmovdqa64	648(%rsp), %zmm0
	vmovdqa64	%zmm0, 3656(%rsp)
	vmovdqa64	72(%rsp), %zmm0
	vmovdqa64	%zmm0, 3720(%rsp)
	vmovdqa64	264(%rsp), %zmm0
	vmovdqa64	%zmm0, 3784(%rsp)
	vmovdqa64	3656(%rsp), %zmm0
	vmovdqa64	3720(%rsp), %zmm1
	vmovdqa64	3784(%rsp), %zmm2
	kxnorb	%k1, %k1, %k1
	vpmadd52luq	%zmm2, %zmm1, %zmm0{%k1}
	nop
	vmovdqa64	%zmm0, 712(%rsp)
	movq	-112(%rsp), %rax
	movq	%rax, -40(%rsp)
	vmovdqa64	712(%rsp), %zmm0
	vmovdqa64	%zmm0, 3592(%rsp)
	movq	-40(%rsp), %rax
	vmovdqa64	3592(%rsp), %zmm0
	vmovdqa64	%zmm0, (%rax)
	nop
	vmovdqa64	perm_idx_2(%rip), %zmm0
	vmovdqa64	%zmm0, 3400(%rsp)
	vmovdqa64	520(%rsp), %zmm0
	vmovdqa64	%zmm0, 3464(%rsp)
	vmovdqa64	3528(%rsp), %zmm1
	vmovdqa64	3400(%rsp), %zmm0
	kxnorb	%k1, %k1, %k1
	vpermq	3464(%rsp), %zmm0, %zmm1{%k1}
	vmovdqa64	%zmm1, %zmm0
	nop
	vmovdqa64	%zmm0, 776(%rsp)
	movq	-120(%rsp), %rax
	addq	$64, %rax
	movq	%rax, -48(%rsp)
	vmovdqa64	520(%rsp), %zmm0
	vmovdqa64	%zmm0, 3336(%rsp)
	movq	-48(%rsp), %rax
	vmovdqa64	3336(%rsp), %zmm0
	vmovdqa64	%zmm0, (%rax)
	nop
	vmovdqa64	perm_idx_13(%rip), %zmm0
	vmovdqa64	%zmm0, 3144(%rsp)
	vmovdqa64	8(%rsp), %zmm0
	vmovdqa64	%zmm0, 3208(%rsp)
	vmovdqa64	3272(%rsp), %zmm1
	vmovdqa64	3144(%rsp), %zmm0
	kxnorb	%k1, %k1, %k1
	vpermq	3208(%rsp), %zmm0, %zmm1{%k1}
	vmovdqa64	%zmm1, %zmm0
	nop
	vmovdqa64	%zmm0, 840(%rsp)
	vmovdqa64	perm_idx_23(%rip), %zmm0
	vmovdqa64	%zmm0, 2952(%rsp)
	vmovdqa64	200(%rsp), %zmm0
	vmovdqa64	%zmm0, 3016(%rsp)
	vmovdqa64	3080(%rsp), %zmm1
	vmovdqa64	2952(%rsp), %zmm0
	kxnorb	%k1, %k1, %k1
	vpermq	3016(%rsp), %zmm0, %zmm1{%k1}
	vmovdqa64	%zmm1, %zmm0
	nop
	vmovdqa64	%zmm0, 904(%rsp)
	vmovdqa64	ZEROS(%rip), %zmm0
	vmovdqa64	%zmm0, 2760(%rsp)
	vmovdqa64	840(%rsp), %zmm0
	vmovdqa64	%zmm0, 2824(%rsp)
	vmovdqa64	904(%rsp), %zmm0
	vmovdqa64	%zmm0, 2888(%rsp)
	vmovdqa64	2760(%rsp), %zmm0
	vmovdqa64	2824(%rsp), %zmm1
	vmovdqa64	2888(%rsp), %zmm2
	kxnorb	%k1, %k1, %k1
	vpmadd52huq	%zmm2, %zmm1, %zmm0{%k1}
	nop
	vmovdqa64	%zmm0, 968(%rsp)
	vmovdqa64	perm_idx_3(%rip), %zmm0
	vmovdqa64	%zmm0, 2568(%rsp)
	vmovdqa64	968(%rsp), %zmm0
	vmovdqa64	%zmm0, 2632(%rsp)
	vmovdqa64	2696(%rsp), %zmm1
	vmovdqa64	2568(%rsp), %zmm0
	kxnorb	%k1, %k1, %k1
	vpermq	2632(%rsp), %zmm0, %zmm1{%k1}
	vmovdqa64	%zmm1, %zmm0
	nop
	vmovdqa64	%zmm0, 1032(%rsp)
	movb	$-72, -86(%rsp)
	vmovdqa64	776(%rsp), %zmm0
	vmovdqa64	%zmm0, 2440(%rsp)
	vmovdqa64	1032(%rsp), %zmm0
	vmovdqa64	%zmm0, 2504(%rsp)
	movzbl	-86(%rsp), %eax
	vmovdqa64	2440(%rsp), %zmm0
	vmovdqa64	2504(%rsp), %zmm1
	kmovb	%eax, %k3
	vmovdqa64	%zmm1, %zmm0{%k3}
	nop
	vmovdqa64	%zmm0, 1096(%rsp)
	vmovdqa64	ZEROS(%rip), %zmm0
	movb	$64, -87(%rsp)
	vmovdqa64	1096(%rsp), %zmm1
	vmovdqa64	%zmm1, 2312(%rsp)
	vmovdqa64	%zmm0, 2376(%rsp)
	movzbl	-87(%rsp), %eax
	vmovdqa64	2312(%rsp), %zmm0
	vmovdqa64	2376(%rsp), %zmm1
	kmovb	%eax, %k4
	vmovdqa64	%zmm1, %zmm0{%k4}
	nop
	vmovdqa64	%zmm0, 1160(%rsp)
	vmovdqa64	1160(%rsp), %zmm0
	vmovdqa64	%zmm0, 2120(%rsp)
	vmovdqa64	136(%rsp), %zmm0
	vmovdqa64	%zmm0, 2184(%rsp)
	vmovdqa64	392(%rsp), %zmm0
	vmovdqa64	%zmm0, 2248(%rsp)
	vmovdqa64	2120(%rsp), %zmm0
	vmovdqa64	2184(%rsp), %zmm1
	vmovdqa64	2248(%rsp), %zmm2
	kxnorb	%k1, %k1, %k1
	vpmadd52luq	%zmm2, %zmm1, %zmm0{%k1}
	nop
	vmovdqa64	%zmm0, 1224(%rsp)
	movq	-112(%rsp), %rax
	addq	$64, %rax
	movq	%rax, -56(%rsp)
	vmovdqa64	1224(%rsp), %zmm0
	vmovdqa64	%zmm0, 2056(%rsp)
	movq	-56(%rsp), %rax
	vmovdqa64	2056(%rsp), %zmm0
	vmovdqa64	%zmm0, (%rax)
	nop
	vmovdqa64	perm_idx_4(%rip), %zmm0
	vmovdqa64	%zmm0, 1864(%rsp)
	vmovdqa64	968(%rsp), %zmm0
	vmovdqa64	%zmm0, 1928(%rsp)
	vmovdqa64	1992(%rsp), %zmm1
	vmovdqa64	1864(%rsp), %zmm0
	kxnorb	%k1, %k1, %k1
	vpermq	1928(%rsp), %zmm0, %zmm1{%k1}
	vmovdqa64	%zmm1, %zmm0
	nop
	vmovdqa64	%zmm0, 1288(%rsp)
	vmovdqa64	ZEROS(%rip), %zmm0
	movb	$-28, -88(%rsp)
	vmovdqa64	1288(%rsp), %zmm1
	vmovdqa64	%zmm1, 1736(%rsp)
	vmovdqa64	%zmm0, 1800(%rsp)
	movzbl	-88(%rsp), %eax
	vmovdqa64	1736(%rsp), %zmm0
	vmovdqa64	1800(%rsp), %zmm1
	kmovb	%eax, %k5
	vmovdqa64	%zmm1, %zmm0{%k5}
	nop
	vmovdqa64	%zmm0, 1352(%rsp)
	vmovdqa64	1352(%rsp), %zmm0
	vmovdqa64	%zmm0, 1544(%rsp)
	vmovdqa64	840(%rsp), %zmm0
	vmovdqa64	%zmm0, 1608(%rsp)
	vmovdqa64	904(%rsp), %zmm0
	vmovdqa64	%zmm0, 1672(%rsp)
	vmovdqa64	1544(%rsp), %zmm0
	vmovdqa64	1608(%rsp), %zmm1
	vmovdqa64	1672(%rsp), %zmm2
	kxnorb	%k1, %k1, %k1
	vpmadd52luq	%zmm2, %zmm1, %zmm0{%k1}
	nop
	vmovdqa64	%zmm0, 1416(%rsp)
	movq	-112(%rsp), %rax
	subq	$-128, %rax
	movq	%rax, -64(%rsp)
	vmovdqa64	1416(%rsp), %zmm0
	vmovdqa64	%zmm0, 1480(%rsp)
	movq	-64(%rsp), %rax
	vmovdqa64	1480(%rsp), %zmm0
	vmovdqa64	%zmm0, (%rax)
	nop
	movq	-80(%rsp), %rax
	addq	$32, %rax
	movq	(%rax), %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movq	-72(%rsp), %rax
	addq	$32, %rax
	movq	(%rax), %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	%r11, %rdx
	imulq	%r8, %rdx
	movq	%r9, %rax
	imulq	%r10, %rax
	leaq	(%rdx,%rax), %rcx
	movq	%r10, %rdx
	mulx	%r8, %rax, %rdx
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movq	%rax, -8(%rsp)
	movq	%rdx, (%rsp)
	movq	%rax, -8(%rsp)
	movq	%rdx, (%rsp)
.L84:
	endbr64
	movq	-112(%rsp), %rax
	addq	$184, %rax
	movq	(%rax), %rcx
	movq	-8(%rsp), %rax
	movq	(%rsp), %rdx
	shrdq	$52, %rdx, %rax
	shrq	$52, %rdx
	movq	%rax, %rdx
	movq	-112(%rsp), %rax
	addq	$184, %rax
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-112(%rsp), %rax
	movq	(%rax), %rdx
	movq	-120(%rsp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	addq	%rax, %rdx
	movq	-112(%rsp), %rax
	movq	%rdx, (%rax)
	movq	-112(%rsp), %rax
	addq	$16, %rax
	movq	(%rax), %rcx
	movq	-120(%rsp), %rax
	addq	$40, %rax
	movq	(%rax), %rdx
	movq	-112(%rsp), %rax
	addq	$16, %rax
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-112(%rsp), %rax
	addq	$40, %rax
	movq	(%rax), %rcx
	movq	-120(%rsp), %rax
	addq	$72, %rax
	movq	(%rax), %rdx
	movq	-112(%rsp), %rax
	addq	$40, %rax
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-112(%rsp), %rax
	addq	$72, %rax
	movq	(%rax), %rcx
	movq	-120(%rsp), %rax
	addq	$112, %rax
	movq	(%rax), %rdx
	movq	-112(%rsp), %rax
	addq	$72, %rax
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
.L85:
	endbr64
	movq	-8(%rsp), %rdx
	movq	-120(%rsp), %rax
	addq	$72, %rax
	movabsq	$4503599627370495, %rcx
	andq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-112(%rsp), %rax
	addq	$176, %rax
	movq	(%rax), %rcx
	movq	-112(%rsp), %rax
	addq	$184, %rax
	movq	(%rax), %rdx
	movq	-120(%rsp), %rax
	addq	$64, %rax
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-120(%rsp), %rax
	addq	$64, %rax
	movq	(%rax), %rax
	shrq	$52, %rax
	movl	%eax, -84(%rsp)
	movq	-120(%rsp), %rax
	addq	$64, %rax
	movq	(%rax), %rdx
	movq	-120(%rsp), %rax
	addq	$64, %rax
	movabsq	$4503599627370495, %rcx
	andq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-112(%rsp), %rax
	addq	$152, %rax
	movq	(%rax), %rdx
	movq	-112(%rsp), %rax
	addq	$160, %rax
	movq	(%rax), %rax
	addq	%rax, %rdx
	movq	-112(%rsp), %rax
	addq	$168, %rax
	movq	(%rax), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-84(%rsp), %edx
	movq	-120(%rsp), %rax
	addq	$56, %rax
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-120(%rsp), %rax
	addq	$56, %rax
	movq	(%rax), %rax
	shrq	$52, %rax
	movl	%eax, -84(%rsp)
	movq	-120(%rsp), %rax
	addq	$56, %rax
	movq	(%rax), %rdx
	movq	-120(%rsp), %rax
	addq	$56, %rax
	movabsq	$4503599627370495, %rcx
	andq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-112(%rsp), %rax
	addq	$120, %rax
	movq	(%rax), %rdx
	movq	-112(%rsp), %rax
	subq	$-128, %rax
	movq	(%rax), %rax
	addq	%rax, %rdx
	movq	-112(%rsp), %rax
	addq	$136, %rax
	movq	(%rax), %rax
	addq	%rax, %rdx
	movq	-112(%rsp), %rax
	addq	$144, %rax
	movq	(%rax), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-84(%rsp), %edx
	movq	-120(%rsp), %rax
	addq	$48, %rax
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-120(%rsp), %rax
	addq	$48, %rax
	movq	(%rax), %rax
	shrq	$52, %rax
	movl	%eax, -84(%rsp)
	movq	-120(%rsp), %rax
	addq	$48, %rax
	movq	(%rax), %rdx
	movq	-120(%rsp), %rax
	addq	$48, %rax
	movabsq	$4503599627370495, %rcx
	andq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-112(%rsp), %rax
	addq	$80, %rax
	movq	(%rax), %rdx
	movq	-112(%rsp), %rax
	addq	$88, %rax
	movq	(%rax), %rax
	addq	%rax, %rdx
	movq	-112(%rsp), %rax
	addq	$96, %rax
	movq	(%rax), %rax
	addq	%rax, %rdx
	movq	-112(%rsp), %rax
	addq	$104, %rax
	movq	(%rax), %rax
	addq	%rax, %rdx
	movq	-112(%rsp), %rax
	addq	$112, %rax
	movq	(%rax), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-84(%rsp), %edx
	movq	-120(%rsp), %rax
	addq	$40, %rax
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-120(%rsp), %rax
	addq	$40, %rax
	movq	(%rax), %rax
	shrq	$52, %rax
	movl	%eax, -84(%rsp)
	movq	-120(%rsp), %rax
	addq	$40, %rax
	movq	(%rax), %rdx
	movq	-120(%rsp), %rax
	addq	$40, %rax
	movabsq	$4503599627370495, %rcx
	andq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-112(%rsp), %rax
	addq	$48, %rax
	movq	(%rax), %rdx
	movq	-112(%rsp), %rax
	addq	$56, %rax
	movq	(%rax), %rax
	addq	%rax, %rdx
	movq	-112(%rsp), %rax
	addq	$64, %rax
	movq	(%rax), %rax
	addq	%rax, %rdx
	movq	-112(%rsp), %rax
	addq	$72, %rax
	movq	(%rax), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-84(%rsp), %edx
	movq	-120(%rsp), %rax
	addq	$32, %rax
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-120(%rsp), %rax
	addq	$32, %rax
	movq	(%rax), %rax
	shrq	$52, %rax
	movl	%eax, -84(%rsp)
	movq	-120(%rsp), %rax
	addq	$32, %rax
	movq	(%rax), %rdx
	movq	-120(%rsp), %rax
	addq	$32, %rax
	movabsq	$4503599627370495, %rcx
	andq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-112(%rsp), %rax
	addq	$24, %rax
	movq	(%rax), %rdx
	movq	-112(%rsp), %rax
	addq	$32, %rax
	movq	(%rax), %rax
	addq	%rax, %rdx
	movq	-112(%rsp), %rax
	addq	$40, %rax
	movq	(%rax), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-84(%rsp), %edx
	movq	-120(%rsp), %rax
	addq	$24, %rax
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-120(%rsp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	shrq	$52, %rax
	movl	%eax, -84(%rsp)
	movq	-120(%rsp), %rax
	addq	$24, %rax
	movq	(%rax), %rdx
	movq	-120(%rsp), %rax
	addq	$24, %rax
	movabsq	$4503599627370495, %rcx
	andq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-112(%rsp), %rax
	addq	$8, %rax
	movq	(%rax), %rdx
	movq	-112(%rsp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-84(%rsp), %edx
	movq	-120(%rsp), %rax
	addq	$16, %rax
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-120(%rsp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	shrq	$52, %rax
	movl	%eax, -84(%rsp)
	movq	-120(%rsp), %rax
	addq	$16, %rax
	movq	(%rax), %rdx
	movq	-120(%rsp), %rax
	addq	$16, %rax
	movabsq	$4503599627370495, %rcx
	andq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-112(%rsp), %rax
	movq	(%rax), %rcx
	movl	-84(%rsp), %edx
	movq	-120(%rsp), %rax
	addq	$8, %rax
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-120(%rsp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	shrq	$52, %rax
	movl	%eax, -84(%rsp)
	movq	-120(%rsp), %rax
	addq	$8, %rax
	movq	(%rax), %rdx
	movq	-120(%rsp), %rax
	addq	$8, %rax
	movabsq	$4503599627370495, %rcx
	andq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-120(%rsp), %rax
	movq	(%rax), %rdx
	movl	-84(%rsp), %eax
	addq	%rax, %rdx
	movq	-120(%rsp), %rax
	movq	%rdx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
