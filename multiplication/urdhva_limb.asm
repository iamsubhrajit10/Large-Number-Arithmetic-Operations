
urdhva_limb:     file format elf64-x86-64


Disassembly of section .init:

0000000000002000 <_init>:
    2000:	f3 0f 1e fa          	endbr64 
    2004:	48 83 ec 08          	sub    rsp,0x8
    2008:	48 8b 05 d9 6f 00 00 	mov    rax,QWORD PTR [rip+0x6fd9]        # 8fe8 <__gmon_start__@Base>
    200f:	48 85 c0             	test   rax,rax
    2012:	74 02                	je     2016 <_init+0x16>
    2014:	ff d0                	call   rax
    2016:	48 83 c4 08          	add    rsp,0x8
    201a:	c3                   	ret    

Disassembly of section .plt:

0000000000002020 <.plt>:
    2020:	ff 35 4a 6e 00 00    	push   QWORD PTR [rip+0x6e4a]        # 8e70 <_GLOBAL_OFFSET_TABLE_+0x8>
    2026:	f2 ff 25 4b 6e 00 00 	bnd jmp QWORD PTR [rip+0x6e4b]        # 8e78 <_GLOBAL_OFFSET_TABLE_+0x10>
    202d:	0f 1f 00             	nop    DWORD PTR [rax]
    2030:	f3 0f 1e fa          	endbr64 
    2034:	68 00 00 00 00       	push   0x0
    2039:	f2 e9 e1 ff ff ff    	bnd jmp 2020 <_init+0x20>
    203f:	90                   	nop
    2040:	f3 0f 1e fa          	endbr64 
    2044:	68 01 00 00 00       	push   0x1
    2049:	f2 e9 d1 ff ff ff    	bnd jmp 2020 <_init+0x20>
    204f:	90                   	nop
    2050:	f3 0f 1e fa          	endbr64 
    2054:	68 02 00 00 00       	push   0x2
    2059:	f2 e9 c1 ff ff ff    	bnd jmp 2020 <_init+0x20>
    205f:	90                   	nop
    2060:	f3 0f 1e fa          	endbr64 
    2064:	68 03 00 00 00       	push   0x3
    2069:	f2 e9 b1 ff ff ff    	bnd jmp 2020 <_init+0x20>
    206f:	90                   	nop
    2070:	f3 0f 1e fa          	endbr64 
    2074:	68 04 00 00 00       	push   0x4
    2079:	f2 e9 a1 ff ff ff    	bnd jmp 2020 <_init+0x20>
    207f:	90                   	nop
    2080:	f3 0f 1e fa          	endbr64 
    2084:	68 05 00 00 00       	push   0x5
    2089:	f2 e9 91 ff ff ff    	bnd jmp 2020 <_init+0x20>
    208f:	90                   	nop
    2090:	f3 0f 1e fa          	endbr64 
    2094:	68 06 00 00 00       	push   0x6
    2099:	f2 e9 81 ff ff ff    	bnd jmp 2020 <_init+0x20>
    209f:	90                   	nop
    20a0:	f3 0f 1e fa          	endbr64 
    20a4:	68 07 00 00 00       	push   0x7
    20a9:	f2 e9 71 ff ff ff    	bnd jmp 2020 <_init+0x20>
    20af:	90                   	nop
    20b0:	f3 0f 1e fa          	endbr64 
    20b4:	68 08 00 00 00       	push   0x8
    20b9:	f2 e9 61 ff ff ff    	bnd jmp 2020 <_init+0x20>
    20bf:	90                   	nop
    20c0:	f3 0f 1e fa          	endbr64 
    20c4:	68 09 00 00 00       	push   0x9
    20c9:	f2 e9 51 ff ff ff    	bnd jmp 2020 <_init+0x20>
    20cf:	90                   	nop
    20d0:	f3 0f 1e fa          	endbr64 
    20d4:	68 0a 00 00 00       	push   0xa
    20d9:	f2 e9 41 ff ff ff    	bnd jmp 2020 <_init+0x20>
    20df:	90                   	nop
    20e0:	f3 0f 1e fa          	endbr64 
    20e4:	68 0b 00 00 00       	push   0xb
    20e9:	f2 e9 31 ff ff ff    	bnd jmp 2020 <_init+0x20>
    20ef:	90                   	nop
    20f0:	f3 0f 1e fa          	endbr64 
    20f4:	68 0c 00 00 00       	push   0xc
    20f9:	f2 e9 21 ff ff ff    	bnd jmp 2020 <_init+0x20>
    20ff:	90                   	nop
    2100:	f3 0f 1e fa          	endbr64 
    2104:	68 0d 00 00 00       	push   0xd
    2109:	f2 e9 11 ff ff ff    	bnd jmp 2020 <_init+0x20>
    210f:	90                   	nop
    2110:	f3 0f 1e fa          	endbr64 
    2114:	68 0e 00 00 00       	push   0xe
    2119:	f2 e9 01 ff ff ff    	bnd jmp 2020 <_init+0x20>
    211f:	90                   	nop
    2120:	f3 0f 1e fa          	endbr64 
    2124:	68 0f 00 00 00       	push   0xf
    2129:	f2 e9 f1 fe ff ff    	bnd jmp 2020 <_init+0x20>
    212f:	90                   	nop
    2130:	f3 0f 1e fa          	endbr64 
    2134:	68 10 00 00 00       	push   0x10
    2139:	f2 e9 e1 fe ff ff    	bnd jmp 2020 <_init+0x20>
    213f:	90                   	nop
    2140:	f3 0f 1e fa          	endbr64 
    2144:	68 11 00 00 00       	push   0x11
    2149:	f2 e9 d1 fe ff ff    	bnd jmp 2020 <_init+0x20>
    214f:	90                   	nop
    2150:	f3 0f 1e fa          	endbr64 
    2154:	68 12 00 00 00       	push   0x12
    2159:	f2 e9 c1 fe ff ff    	bnd jmp 2020 <_init+0x20>
    215f:	90                   	nop
    2160:	f3 0f 1e fa          	endbr64 
    2164:	68 13 00 00 00       	push   0x13
    2169:	f2 e9 b1 fe ff ff    	bnd jmp 2020 <_init+0x20>
    216f:	90                   	nop
    2170:	f3 0f 1e fa          	endbr64 
    2174:	68 14 00 00 00       	push   0x14
    2179:	f2 e9 a1 fe ff ff    	bnd jmp 2020 <_init+0x20>
    217f:	90                   	nop
    2180:	f3 0f 1e fa          	endbr64 
    2184:	68 15 00 00 00       	push   0x15
    2189:	f2 e9 91 fe ff ff    	bnd jmp 2020 <_init+0x20>
    218f:	90                   	nop
    2190:	f3 0f 1e fa          	endbr64 
    2194:	68 16 00 00 00       	push   0x16
    2199:	f2 e9 81 fe ff ff    	bnd jmp 2020 <_init+0x20>
    219f:	90                   	nop
    21a0:	f3 0f 1e fa          	endbr64 
    21a4:	68 17 00 00 00       	push   0x17
    21a9:	f2 e9 71 fe ff ff    	bnd jmp 2020 <_init+0x20>
    21af:	90                   	nop
    21b0:	f3 0f 1e fa          	endbr64 
    21b4:	68 18 00 00 00       	push   0x18
    21b9:	f2 e9 61 fe ff ff    	bnd jmp 2020 <_init+0x20>
    21bf:	90                   	nop
    21c0:	f3 0f 1e fa          	endbr64 
    21c4:	68 19 00 00 00       	push   0x19
    21c9:	f2 e9 51 fe ff ff    	bnd jmp 2020 <_init+0x20>
    21cf:	90                   	nop
    21d0:	f3 0f 1e fa          	endbr64 
    21d4:	68 1a 00 00 00       	push   0x1a
    21d9:	f2 e9 41 fe ff ff    	bnd jmp 2020 <_init+0x20>
    21df:	90                   	nop
    21e0:	f3 0f 1e fa          	endbr64 
    21e4:	68 1b 00 00 00       	push   0x1b
    21e9:	f2 e9 31 fe ff ff    	bnd jmp 2020 <_init+0x20>
    21ef:	90                   	nop
    21f0:	f3 0f 1e fa          	endbr64 
    21f4:	68 1c 00 00 00       	push   0x1c
    21f9:	f2 e9 21 fe ff ff    	bnd jmp 2020 <_init+0x20>
    21ff:	90                   	nop
    2200:	f3 0f 1e fa          	endbr64 
    2204:	68 1d 00 00 00       	push   0x1d
    2209:	f2 e9 11 fe ff ff    	bnd jmp 2020 <_init+0x20>
    220f:	90                   	nop
    2210:	f3 0f 1e fa          	endbr64 
    2214:	68 1e 00 00 00       	push   0x1e
    2219:	f2 e9 01 fe ff ff    	bnd jmp 2020 <_init+0x20>
    221f:	90                   	nop
    2220:	f3 0f 1e fa          	endbr64 
    2224:	68 1f 00 00 00       	push   0x1f
    2229:	f2 e9 f1 fd ff ff    	bnd jmp 2020 <_init+0x20>
    222f:	90                   	nop
    2230:	f3 0f 1e fa          	endbr64 
    2234:	68 20 00 00 00       	push   0x20
    2239:	f2 e9 e1 fd ff ff    	bnd jmp 2020 <_init+0x20>
    223f:	90                   	nop
    2240:	f3 0f 1e fa          	endbr64 
    2244:	68 21 00 00 00       	push   0x21
    2249:	f2 e9 d1 fd ff ff    	bnd jmp 2020 <_init+0x20>
    224f:	90                   	nop
    2250:	f3 0f 1e fa          	endbr64 
    2254:	68 22 00 00 00       	push   0x22
    2259:	f2 e9 c1 fd ff ff    	bnd jmp 2020 <_init+0x20>
    225f:	90                   	nop
    2260:	f3 0f 1e fa          	endbr64 
    2264:	68 23 00 00 00       	push   0x23
    2269:	f2 e9 b1 fd ff ff    	bnd jmp 2020 <_init+0x20>
    226f:	90                   	nop
    2270:	f3 0f 1e fa          	endbr64 
    2274:	68 24 00 00 00       	push   0x24
    2279:	f2 e9 a1 fd ff ff    	bnd jmp 2020 <_init+0x20>
    227f:	90                   	nop
    2280:	f3 0f 1e fa          	endbr64 
    2284:	68 25 00 00 00       	push   0x25
    2289:	f2 e9 91 fd ff ff    	bnd jmp 2020 <_init+0x20>
    228f:	90                   	nop
    2290:	f3 0f 1e fa          	endbr64 
    2294:	68 26 00 00 00       	push   0x26
    2299:	f2 e9 81 fd ff ff    	bnd jmp 2020 <_init+0x20>
    229f:	90                   	nop
    22a0:	f3 0f 1e fa          	endbr64 
    22a4:	68 27 00 00 00       	push   0x27
    22a9:	f2 e9 71 fd ff ff    	bnd jmp 2020 <_init+0x20>
    22af:	90                   	nop
    22b0:	f3 0f 1e fa          	endbr64 
    22b4:	68 28 00 00 00       	push   0x28
    22b9:	f2 e9 61 fd ff ff    	bnd jmp 2020 <_init+0x20>
    22bf:	90                   	nop
    22c0:	f3 0f 1e fa          	endbr64 
    22c4:	68 29 00 00 00       	push   0x29
    22c9:	f2 e9 51 fd ff ff    	bnd jmp 2020 <_init+0x20>
    22cf:	90                   	nop
    22d0:	f3 0f 1e fa          	endbr64 
    22d4:	68 2a 00 00 00       	push   0x2a
    22d9:	f2 e9 41 fd ff ff    	bnd jmp 2020 <_init+0x20>
    22df:	90                   	nop

Disassembly of section .plt.got:

00000000000022e0 <__cxa_finalize@plt>:
    22e0:	f3 0f 1e fa          	endbr64 
    22e4:	f2 ff 25 0d 6d 00 00 	bnd jmp QWORD PTR [rip+0x6d0d]        # 8ff8 <__cxa_finalize@GLIBC_2.2.5>
    22eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .plt.sec:

00000000000022f0 <__gmp_randseed_ui@plt>:
    22f0:	f3 0f 1e fa          	endbr64 
    22f4:	f2 ff 25 85 6b 00 00 	bnd jmp QWORD PTR [rip+0x6b85]        # 8e80 <__gmp_randseed_ui@Base>
    22fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002300 <__snprintf_chk@plt>:
    2300:	f3 0f 1e fa          	endbr64 
    2304:	f2 ff 25 7d 6b 00 00 	bnd jmp QWORD PTR [rip+0x6b7d]        # 8e88 <__snprintf_chk@GLIBC_2.3.4>
    230b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002310 <free@plt>:
    2310:	f3 0f 1e fa          	endbr64 
    2314:	f2 ff 25 75 6b 00 00 	bnd jmp QWORD PTR [rip+0x6b75]        # 8e90 <free@GLIBC_2.2.5>
    231b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002320 <putchar@plt>:
    2320:	f3 0f 1e fa          	endbr64 
    2324:	f2 ff 25 6d 6b 00 00 	bnd jmp QWORD PTR [rip+0x6b6d]        # 8e98 <putchar@GLIBC_2.2.5>
    232b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002330 <__errno_location@plt>:
    2330:	f3 0f 1e fa          	endbr64 
    2334:	f2 ff 25 65 6b 00 00 	bnd jmp QWORD PTR [rip+0x6b65]        # 8ea0 <__errno_location@GLIBC_2.2.5>
    233b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002340 <__gmpz_set_str@plt>:
    2340:	f3 0f 1e fa          	endbr64 
    2344:	f2 ff 25 5d 6b 00 00 	bnd jmp QWORD PTR [rip+0x6b5d]        # 8ea8 <__gmpz_set_str@Base>
    234b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002350 <puts@plt>:
    2350:	f3 0f 1e fa          	endbr64 
    2354:	f2 ff 25 55 6b 00 00 	bnd jmp QWORD PTR [rip+0x6b55]        # 8eb0 <puts@GLIBC_2.2.5>
    235b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002360 <__gmpz_set_ui@plt>:
    2360:	f3 0f 1e fa          	endbr64 
    2364:	f2 ff 25 4d 6b 00 00 	bnd jmp QWORD PTR [rip+0x6b4d]        # 8eb8 <__gmpz_set_ui@Base>
    236b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002370 <getpid@plt>:
    2370:	f3 0f 1e fa          	endbr64 
    2374:	f2 ff 25 45 6b 00 00 	bnd jmp QWORD PTR [rip+0x6b45]        # 8ec0 <getpid@GLIBC_2.2.5>
    237b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002380 <pow@plt>:
    2380:	f3 0f 1e fa          	endbr64 
    2384:	f2 ff 25 3d 6b 00 00 	bnd jmp QWORD PTR [rip+0x6b3d]        # 8ec8 <pow@GLIBC_2.29>
    238b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002390 <strlen@plt>:
    2390:	f3 0f 1e fa          	endbr64 
    2394:	f2 ff 25 35 6b 00 00 	bnd jmp QWORD PTR [rip+0x6b35]        # 8ed0 <strlen@GLIBC_2.2.5>
    239b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000023a0 <__gmpz_get_str@plt>:
    23a0:	f3 0f 1e fa          	endbr64 
    23a4:	f2 ff 25 2d 6b 00 00 	bnd jmp QWORD PTR [rip+0x6b2d]        # 8ed8 <__gmpz_get_str@Base>
    23ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000023b0 <__stack_chk_fail@plt>:
    23b0:	f3 0f 1e fa          	endbr64 
    23b4:	f2 ff 25 25 6b 00 00 	bnd jmp QWORD PTR [rip+0x6b25]        # 8ee0 <__stack_chk_fail@GLIBC_2.4>
    23bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000023c0 <__gmp_randclear@plt>:
    23c0:	f3 0f 1e fa          	endbr64 
    23c4:	f2 ff 25 1d 6b 00 00 	bnd jmp QWORD PTR [rip+0x6b1d]        # 8ee8 <__gmp_randclear@Base>
    23cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000023d0 <__gmpz_mul@plt>:
    23d0:	f3 0f 1e fa          	endbr64 
    23d4:	f2 ff 25 15 6b 00 00 	bnd jmp QWORD PTR [rip+0x6b15]        # 8ef0 <__gmpz_mul@Base>
    23db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000023e0 <gettimeofday@plt>:
    23e0:	f3 0f 1e fa          	endbr64 
    23e4:	f2 ff 25 0d 6b 00 00 	bnd jmp QWORD PTR [rip+0x6b0d]        # 8ef8 <gettimeofday@GLIBC_2.2.5>
    23eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000023f0 <__assert_fail@plt>:
    23f0:	f3 0f 1e fa          	endbr64 
    23f4:	f2 ff 25 05 6b 00 00 	bnd jmp QWORD PTR [rip+0x6b05]        # 8f00 <__assert_fail@GLIBC_2.2.5>
    23fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002400 <memset@plt>:
    2400:	f3 0f 1e fa          	endbr64 
    2404:	f2 ff 25 fd 6a 00 00 	bnd jmp QWORD PTR [rip+0x6afd]        # 8f08 <memset@GLIBC_2.2.5>
    240b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002410 <ioctl@plt>:
    2410:	f3 0f 1e fa          	endbr64 
    2414:	f2 ff 25 f5 6a 00 00 	bnd jmp QWORD PTR [rip+0x6af5]        # 8f10 <ioctl@GLIBC_2.2.5>
    241b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002420 <fputc@plt>:
    2420:	f3 0f 1e fa          	endbr64 
    2424:	f2 ff 25 ed 6a 00 00 	bnd jmp QWORD PTR [rip+0x6aed]        # 8f18 <fputc@GLIBC_2.2.5>
    242b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002430 <read@plt>:
    2430:	f3 0f 1e fa          	endbr64 
    2434:	f2 ff 25 e5 6a 00 00 	bnd jmp QWORD PTR [rip+0x6ae5]        # 8f20 <read@GLIBC_2.2.5>
    243b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002440 <srand@plt>:
    2440:	f3 0f 1e fa          	endbr64 
    2444:	f2 ff 25 dd 6a 00 00 	bnd jmp QWORD PTR [rip+0x6add]        # 8f28 <srand@GLIBC_2.2.5>
    244b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002450 <__gmp_randinit_default@plt>:
    2450:	f3 0f 1e fa          	endbr64 
    2454:	f2 ff 25 d5 6a 00 00 	bnd jmp QWORD PTR [rip+0x6ad5]        # 8f30 <__gmp_randinit_default@Base>
    245b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002460 <calloc@plt>:
    2460:	f3 0f 1e fa          	endbr64 
    2464:	f2 ff 25 cd 6a 00 00 	bnd jmp QWORD PTR [rip+0x6acd]        # 8f38 <calloc@GLIBC_2.2.5>
    246b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002470 <syscall@plt>:
    2470:	f3 0f 1e fa          	endbr64 
    2474:	f2 ff 25 c5 6a 00 00 	bnd jmp QWORD PTR [rip+0x6ac5]        # 8f40 <syscall@GLIBC_2.2.5>
    247b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002480 <strtol@plt>:
    2480:	f3 0f 1e fa          	endbr64 
    2484:	f2 ff 25 bd 6a 00 00 	bnd jmp QWORD PTR [rip+0x6abd]        # 8f48 <strtol@GLIBC_2.2.5>
    248b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002490 <memcpy@plt>:
    2490:	f3 0f 1e fa          	endbr64 
    2494:	f2 ff 25 b5 6a 00 00 	bnd jmp QWORD PTR [rip+0x6ab5]        # 8f50 <memcpy@GLIBC_2.14>
    249b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000024a0 <time@plt>:
    24a0:	f3 0f 1e fa          	endbr64 
    24a4:	f2 ff 25 ad 6a 00 00 	bnd jmp QWORD PTR [rip+0x6aad]        # 8f58 <time@GLIBC_2.2.5>
    24ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000024b0 <malloc@plt>:
    24b0:	f3 0f 1e fa          	endbr64 
    24b4:	f2 ff 25 a5 6a 00 00 	bnd jmp QWORD PTR [rip+0x6aa5]        # 8f60 <malloc@GLIBC_2.2.5>
    24bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000024c0 <__gmpz_clear@plt>:
    24c0:	f3 0f 1e fa          	endbr64 
    24c4:	f2 ff 25 9d 6a 00 00 	bnd jmp QWORD PTR [rip+0x6a9d]        # 8f68 <__gmpz_clear@Base>
    24cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000024d0 <realloc@plt>:
    24d0:	f3 0f 1e fa          	endbr64 
    24d4:	f2 ff 25 95 6a 00 00 	bnd jmp QWORD PTR [rip+0x6a95]        # 8f70 <realloc@GLIBC_2.2.5>
    24db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000024e0 <__printf_chk@plt>:
    24e0:	f3 0f 1e fa          	endbr64 
    24e4:	f2 ff 25 8d 6a 00 00 	bnd jmp QWORD PTR [rip+0x6a8d]        # 8f78 <__printf_chk@GLIBC_2.3.4>
    24eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000024f0 <fopen@plt>:
    24f0:	f3 0f 1e fa          	endbr64 
    24f4:	f2 ff 25 85 6a 00 00 	bnd jmp QWORD PTR [rip+0x6a85]        # 8f80 <fopen@GLIBC_2.2.5>
    24fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002500 <perror@plt>:
    2500:	f3 0f 1e fa          	endbr64 
    2504:	f2 ff 25 7d 6a 00 00 	bnd jmp QWORD PTR [rip+0x6a7d]        # 8f88 <perror@GLIBC_2.2.5>
    250b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002510 <exit@plt>:
    2510:	f3 0f 1e fa          	endbr64 
    2514:	f2 ff 25 75 6a 00 00 	bnd jmp QWORD PTR [rip+0x6a75]        # 8f90 <exit@GLIBC_2.2.5>
    251b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002520 <fwrite@plt>:
    2520:	f3 0f 1e fa          	endbr64 
    2524:	f2 ff 25 6d 6a 00 00 	bnd jmp QWORD PTR [rip+0x6a6d]        # 8f98 <fwrite@GLIBC_2.2.5>
    252b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002530 <__fprintf_chk@plt>:
    2530:	f3 0f 1e fa          	endbr64 
    2534:	f2 ff 25 65 6a 00 00 	bnd jmp QWORD PTR [rip+0x6a65]        # 8fa0 <__fprintf_chk@GLIBC_2.3.4>
    253b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002540 <posix_memalign@plt>:
    2540:	f3 0f 1e fa          	endbr64 
    2544:	f2 ff 25 5d 6a 00 00 	bnd jmp QWORD PTR [rip+0x6a5d]        # 8fa8 <posix_memalign@GLIBC_2.2.5>
    254b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002550 <__gmpz_init@plt>:
    2550:	f3 0f 1e fa          	endbr64 
    2554:	f2 ff 25 55 6a 00 00 	bnd jmp QWORD PTR [rip+0x6a55]        # 8fb0 <__gmpz_init@Base>
    255b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002560 <strerror@plt>:
    2560:	f3 0f 1e fa          	endbr64 
    2564:	f2 ff 25 4d 6a 00 00 	bnd jmp QWORD PTR [rip+0x6a4d]        # 8fb8 <strerror@GLIBC_2.2.5>
    256b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002570 <__gmpz_urandomb@plt>:
    2570:	f3 0f 1e fa          	endbr64 
    2574:	f2 ff 25 45 6a 00 00 	bnd jmp QWORD PTR [rip+0x6a45]        # 8fc0 <__gmpz_urandomb@Base>
    257b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002580 <rand@plt>:
    2580:	f3 0f 1e fa          	endbr64 
    2584:	f2 ff 25 3d 6a 00 00 	bnd jmp QWORD PTR [rip+0x6a3d]        # 8fc8 <rand@GLIBC_2.2.5>
    258b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002590 <__sprintf_chk@plt>:
    2590:	f3 0f 1e fa          	endbr64 
    2594:	f2 ff 25 35 6a 00 00 	bnd jmp QWORD PTR [rip+0x6a35]        # 8fd0 <__sprintf_chk@GLIBC_2.3.4>
    259b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

00000000000025a0 <main>:
    25a0:	f3 0f 1e fa          	endbr64 
    25a4:	4c 8d 54 24 08       	lea    r10,[rsp+0x8]
    25a9:	48 83 e4 c0          	and    rsp,0xffffffffffffffc0
    25ad:	48 8d 0d 6c 4e 00 00 	lea    rcx,[rip+0x4e6c]        # 7420 <_IO_stdin_used+0x420>
    25b4:	41 ff 72 f8          	push   QWORD PTR [r10-0x8]
    25b8:	c4 e1 f9 6e c1       	vmovq  xmm0,rcx
    25bd:	48 8d 15 3c 4e 00 00 	lea    rdx,[rip+0x4e3c]        # 7400 <_IO_stdin_used+0x400>
    25c4:	55                   	push   rbp
    25c5:	48 89 e5             	mov    rbp,rsp
    25c8:	41 57                	push   r15
    25ca:	41 56                	push   r14
    25cc:	41 55                	push   r13
    25ce:	41 54                	push   r12
    25d0:	41 52                	push   r10
    25d2:	53                   	push   rbx
    25d3:	48 8d 1d 57 4a 00 00 	lea    rbx,[rip+0x4a57]        # 7031 <_IO_stdin_used+0x31>
    25da:	c4 e1 f9 6e cb       	vmovq  xmm1,rbx
    25df:	c4 e3 f1 22 da 01    	vpinsrq xmm3,xmm1,rdx,0x1
    25e5:	48 81 ec c0 05 00 00 	sub    rsp,0x5c0
    25ec:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    25f3:	00 00 
    25f5:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    25f9:	48 8d 05 4a 4a 00 00 	lea    rax,[rip+0x4a4a]        # 704a <_IO_stdin_used+0x4a>
    2600:	c4 e3 f9 22 d0 01    	vpinsrq xmm2,xmm0,rax,0x1
    2606:	c4 e3 65 38 fa 01    	vinserti128 ymm7,ymm3,xmm2,0x1
    260c:	c5 fd 7f bd b0 fa ff 	vmovdqa YMMWORD PTR [rbp-0x550],ymm7
    2613:	ff 
    2614:	83 ff 02             	cmp    edi,0x2
    2617:	0f 85 2d 1e 00 00    	jne    444a <main+0x1eaa>
    261d:	48 8b 7e 08          	mov    rdi,QWORD PTR [rsi+0x8]
    2621:	ba 0a 00 00 00       	mov    edx,0xa
    2626:	31 f6                	xor    esi,esi
    2628:	c5 f8 77             	vzeroupper 
    262b:	e8 50 fe ff ff       	call   2480 <strtol@plt>
    2630:	48 8d bd d0 fb ff ff 	lea    rdi,[rbp-0x430]
    2637:	b9 60 00 00 00       	mov    ecx,0x60
    263c:	89 05 ea 69 00 00    	mov    DWORD PTR [rip+0x69ea],eax        # 902c <NUMBER_OF_BITS>
    2642:	49 89 c5             	mov    r13,rax
    2645:	31 c0                	xor    eax,eax
    2647:	49 89 fe             	mov    r14,rdi
    264a:	48 89 bd 88 fa ff ff 	mov    QWORD PTR [rbp-0x578],rdi
    2651:	4c 8d bd 50 fb ff ff 	lea    r15,[rbp-0x4b0]
    2658:	31 db                	xor    ebx,ebx
    265a:	48 be 01 00 00 00 80 	movabs rsi,0x8000000001
    2661:	00 00 00 
    2664:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
    2667:	48 89 b5 50 fd ff ff 	mov    QWORD PTR [rbp-0x2b0],rsi
    266e:	48 83 c6 02          	add    rsi,0x2
    2672:	c7 85 d4 fb ff ff 80 	mov    DWORD PTR [rbp-0x42c],0x80
    2679:	00 00 00 
    267c:	c6 85 f8 fb ff ff c5 	mov    BYTE PTR [rbp-0x408],0xc5
    2683:	c7 85 54 fc ff ff 80 	mov    DWORD PTR [rbp-0x3ac],0x80
    268a:	00 00 00 
    268d:	c7 85 d4 fc ff ff 80 	mov    DWORD PTR [rbp-0x32c],0x80
    2694:	00 00 00 
    2697:	c6 85 78 fd ff ff c5 	mov    BYTE PTR [rbp-0x288],0xc5
    269e:	c6 85 f8 fd ff ff c5 	mov    BYTE PTR [rbp-0x208],0xc5
    26a5:	c6 85 78 fe ff ff c5 	mov    BYTE PTR [rbp-0x188],0xc5
    26ac:	48 c7 85 58 fc ff ff 	mov    QWORD PTR [rbp-0x3a8],0x1
    26b3:	01 00 00 00 
    26b7:	c6 85 78 fc ff ff e5 	mov    BYTE PTR [rbp-0x388],0xe5
    26be:	48 c7 85 d8 fc ff ff 	mov    QWORD PTR [rbp-0x328],0x1
    26c5:	01 00 00 00 
    26c9:	c6 85 f8 fc ff ff d5 	mov    BYTE PTR [rbp-0x308],0xd5
    26d0:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x2
    26d7:	02 00 00 00 
    26db:	48 89 b5 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],rsi
    26e2:	48 89 b5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rsi
    26e9:	48 c7 85 58 fe ff ff 	mov    QWORD PTR [rbp-0x1a8],0x10000
    26f0:	00 00 01 00 
    26f4:	4c 89 bd d8 fa ff ff 	mov    QWORD PTR [rbp-0x528],r15
    26fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    2700:	45 31 c9             	xor    r9d,r9d
    2703:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
    2709:	31 c9                	xor    ecx,ecx
    270b:	31 d2                	xor    edx,edx
    270d:	4c 89 f6             	mov    rsi,r14
    2710:	bf 2a 01 00 00       	mov    edi,0x12a
    2715:	31 c0                	xor    eax,eax
    2717:	e8 54 fd ff ff       	call   2470 <syscall@plt>
    271c:	41 89 04 9f          	mov    DWORD PTR [r15+rbx*4],eax
    2720:	83 f8 ff             	cmp    eax,0xffffffff
    2723:	0f 84 ca 1c 00 00    	je     43f3 <main+0x1e53>
    2729:	48 83 c3 01          	add    rbx,0x1
    272d:	49 83 ee 80          	sub    r14,0xffffffffffffff80
    2731:	48 83 fb 06          	cmp    rbx,0x6
    2735:	75 c9                	jne    2700 <main+0x160>
    2737:	48 83 ec 08          	sub    rsp,0x8
    273b:	b9 64 00 00 00       	mov    ecx,0x64
    2740:	ba 01 00 00 00       	mov    edx,0x1
    2745:	31 c0                	xor    eax,eax
    2747:	41 55                	push   r13
    2749:	4c 8d 0d c6 48 00 00 	lea    r9,[rip+0x48c6]        # 7016 <_IO_stdin_used+0x16>
    2750:	c5 fd 6f ad b0 fa ff 	vmovdqa ymm5,YMMWORD PTR [rbp-0x550]
    2757:	ff 
    2758:	4c 8d 05 79 4c 00 00 	lea    r8,[rip+0x4c79]        # 73d8 <_IO_stdin_used+0x3d8>
    275f:	c4 c1 f9 6e e1       	vmovq  xmm4,r9
    2764:	4c 8d b5 f0 fe ff ff 	lea    r14,[rbp-0x110]
    276b:	49 bb 55 72 64 68 76 	movabs r11,0x4c5f617668647255
    2772:	61 5f 4c 
    2775:	be 64 00 00 00       	mov    esi,0x64
    277a:	c4 c3 d9 22 f0 01    	vpinsrq xmm6,xmm4,r8,0x1
    2780:	4c 8d 8d e3 fe ff ff 	lea    r9,[rbp-0x11d]
    2787:	4c 8d 05 f2 48 00 00 	lea    r8,[rip+0x48f2]        # 7080 <_IO_stdin_used+0x80>
    278e:	4c 89 f7             	mov    rdi,r14
    2791:	4c 89 9d e3 fe ff ff 	mov    QWORD PTR [rbp-0x11d],r11
    2798:	c7 85 eb fe ff ff 69 	mov    DWORD PTR [rbp-0x115],0x5f626d69
    279f:	6d 62 5f 
    27a2:	c6 85 ef fe ff ff 00 	mov    BYTE PTR [rbp-0x111],0x0
    27a9:	c5 fd 7f ad 70 fb ff 	vmovdqa YMMWORD PTR [rbp-0x490],ymm5
    27b0:	ff 
    27b1:	c5 f9 7f b5 90 fb ff 	vmovdqa XMMWORD PTR [rbp-0x470],xmm6
    27b8:	ff 
    27b9:	c5 f8 77             	vzeroupper 
    27bc:	4c 8d 2d d3 48 00 00 	lea    r13,[rip+0x48d3]        # 7096 <_IO_stdin_used+0x96>
    27c3:	e8 38 fb ff ff       	call   2300 <__snprintf_chk@plt>
    27c8:	4c 89 ee             	mov    rsi,r13
    27cb:	4c 89 f7             	mov    rdi,r14
    27ce:	e8 1d fd ff ff       	call   24f0 <fopen@plt>
    27d3:	5e                   	pop    rsi
    27d4:	5f                   	pop    rdi
    27d5:	48 89 85 80 fa ff ff 	mov    QWORD PTR [rbp-0x580],rax
    27dc:	48 85 c0             	test   rax,rax
    27df:	0f 84 54 1c 00 00    	je     4439 <main+0x1e99>
    27e5:	48 8d 9d 70 fb ff ff 	lea    rbx,[rbp-0x490]
    27ec:	4c 8d b5 a0 fb ff ff 	lea    r14,[rbp-0x460]
    27f3:	49 89 c7             	mov    r15,rax
    27f6:	4c 89 b5 a8 fa ff ff 	mov    QWORD PTR [rbp-0x558],r14
    27fd:	4c 8d 25 94 48 00 00 	lea    r12,[rip+0x4894]        # 7098 <_IO_stdin_used+0x98>
    2804:	48 89 9d b0 fa ff ff 	mov    QWORD PTR [rbp-0x550],rbx
    280b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    2810:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
    2813:	4c 89 e2             	mov    rdx,r12
    2816:	be 01 00 00 00       	mov    esi,0x1
    281b:	4c 89 ff             	mov    rdi,r15
    281e:	31 c0                	xor    eax,eax
    2820:	48 83 c3 08          	add    rbx,0x8
    2824:	e8 07 fd ff ff       	call   2530 <__fprintf_chk@plt>
    2829:	49 39 de             	cmp    r14,rbx
    282c:	75 e2                	jne    2810 <main+0x270>
    282e:	48 8b b5 80 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x580]
    2835:	bf 0a 00 00 00       	mov    edi,0xa
    283a:	4c 8b bd b0 fa ff ff 	mov    r15,QWORD PTR [rbp-0x550]
    2841:	48 8d 9d 60 ff ff ff 	lea    rbx,[rbp-0xa0]
    2848:	e8 d3 fb ff ff       	call   2420 <fputc@plt>
    284d:	48 83 ec 08          	sub    rsp,0x8
    2851:	b9 64 00 00 00       	mov    ecx,0x64
    2856:	31 c0                	xor    eax,eax
    2858:	44 8b 15 cd 67 00 00 	mov    r10d,DWORD PTR [rip+0x67cd]        # 902c <NUMBER_OF_BITS>
    285f:	ba 01 00 00 00       	mov    edx,0x1
    2864:	48 89 df             	mov    rdi,rbx
    2867:	4c 8d 8d de fe ff ff 	lea    r9,[rbp-0x122]
    286e:	4c 8d 05 0b 48 00 00 	lea    r8,[rip+0x480b]        # 7080 <_IO_stdin_used+0x80>
    2875:	be 64 00 00 00       	mov    esi,0x64
    287a:	c7 85 de fe ff ff 47 	mov    DWORD PTR [rbp-0x122],0x5f504d47
    2881:	4d 50 5f 
    2884:	41 52                	push   r10
    2886:	c6 85 e2 fe ff ff 00 	mov    BYTE PTR [rbp-0x11e],0x0
    288d:	e8 6e fa ff ff       	call   2300 <__snprintf_chk@plt>
    2892:	4c 89 ee             	mov    rsi,r13
    2895:	48 89 df             	mov    rdi,rbx
    2898:	e8 53 fc ff ff       	call   24f0 <fopen@plt>
    289d:	5a                   	pop    rdx
    289e:	59                   	pop    rcx
    289f:	48 89 85 d0 fa ff ff 	mov    QWORD PTR [rbp-0x530],rax
    28a6:	48 85 c0             	test   rax,rax
    28a9:	0f 84 79 1b 00 00    	je     4428 <main+0x1e88>
    28af:	4c 8b b5 a8 fa ff ff 	mov    r14,QWORD PTR [rbp-0x558]
    28b6:	49 89 c5             	mov    r13,rax
    28b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    28c0:	49 8b 0f             	mov    rcx,QWORD PTR [r15]
    28c3:	4c 89 e2             	mov    rdx,r12
    28c6:	be 01 00 00 00       	mov    esi,0x1
    28cb:	4c 89 ef             	mov    rdi,r13
    28ce:	31 c0                	xor    eax,eax
    28d0:	49 83 c7 08          	add    r15,0x8
    28d4:	e8 57 fc ff ff       	call   2530 <__fprintf_chk@plt>
    28d9:	4d 39 fe             	cmp    r14,r15
    28dc:	75 e2                	jne    28c0 <main+0x320>
    28de:	48 8b b5 d0 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x530]
    28e5:	bf 0a 00 00 00       	mov    edi,0xa
    28ea:	4c 8d bd f4 fa ff ff 	lea    r15,[rbp-0x50c]
    28f1:	4c 8d a5 68 fb ff ff 	lea    r12,[rbp-0x498]
    28f8:	e8 23 fb ff ff       	call   2420 <fputc@plt>
    28fd:	48 8d 95 10 fb ff ff 	lea    rdx,[rbp-0x4f0]
    2904:	48 8d bd 20 fb ff ff 	lea    rdi,[rbp-0x4e0]
    290b:	c7 85 34 fa ff ff 00 	mov    DWORD PTR [rbp-0x5cc],0x0
    2912:	00 00 00 
    2915:	48 8d 8d 30 fb ff ff 	lea    rcx,[rbp-0x4d0]
    291c:	48 8d 85 00 fb ff ff 	lea    rax,[rbp-0x500]
    2923:	48 89 95 a0 fa ff ff 	mov    QWORD PTR [rbp-0x560],rdx
    292a:	48 8d b5 40 fb ff ff 	lea    rsi,[rbp-0x4c0]
    2931:	4c 8d 85 f0 fa ff ff 	lea    r8,[rbp-0x510]
    2938:	48 89 bd 98 fa ff ff 	mov    QWORD PTR [rbp-0x568],rdi
    293f:	4c 8d 8d ec fa ff ff 	lea    r9,[rbp-0x514]
    2946:	4c 8d 9d f8 fa ff ff 	lea    r11,[rbp-0x508]
    294d:	48 89 8d 90 fa ff ff 	mov    QWORD PTR [rbp-0x570],rcx
    2954:	48 89 85 78 fa ff ff 	mov    QWORD PTR [rbp-0x588],rax
    295b:	48 89 b5 b0 fa ff ff 	mov    QWORD PTR [rbp-0x550],rsi
    2962:	4c 89 85 58 fa ff ff 	mov    QWORD PTR [rbp-0x5a8],r8
    2969:	4c 89 8d 60 fa ff ff 	mov    QWORD PTR [rbp-0x5a0],r9
    2970:	4c 89 9d 20 fa ff ff 	mov    QWORD PTR [rbp-0x5e0],r11
    2977:	4c 89 bd 28 fa ff ff 	mov    QWORD PTR [rbp-0x5d8],r15
    297e:	48 8b bd a0 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x560]
    2985:	e8 c6 fb ff ff       	call   2550 <__gmpz_init@plt>
    298a:	48 8b bd 98 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x568]
    2991:	e8 ba fb ff ff       	call   2550 <__gmpz_init@plt>
    2996:	48 8b bd 90 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x570]
    299d:	e8 ae fb ff ff       	call   2550 <__gmpz_init@plt>
    29a2:	48 8b bd a0 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x560]
    29a9:	31 f6                	xor    esi,esi
    29ab:	e8 b0 f9 ff ff       	call   2360 <__gmpz_set_ui@plt>
    29b0:	48 8b bd 98 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x568]
    29b7:	31 f6                	xor    esi,esi
    29b9:	e8 a2 f9 ff ff       	call   2360 <__gmpz_set_ui@plt>
    29be:	48 8b bd 90 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x570]
    29c5:	31 f6                	xor    esi,esi
    29c7:	e8 94 f9 ff ff       	call   2360 <__gmpz_set_ui@plt>
    29cc:	48 8b bd 78 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x588]
    29d3:	31 f6                	xor    esi,esi
    29d5:	e8 06 fa ff ff       	call   23e0 <gettimeofday@plt>
    29da:	c4 41 39 57 c0       	vxorpd xmm8,xmm8,xmm8
    29df:	c4 e1 bb 2a 8d 00 fb 	vcvtsi2sd xmm1,xmm8,QWORD PTR [rbp-0x500]
    29e6:	ff ff 
    29e8:	c4 61 bb 2a 95 08 fb 	vcvtsi2sd xmm10,xmm8,QWORD PTR [rbp-0x4f8]
    29ef:	ff ff 
    29f1:	c5 73 10 c9          	vmovsd xmm9,xmm1,xmm1
    29f5:	c4 62 a9 99 0d 8a 4c 	vfmadd132sd xmm9,xmm10,QWORD PTR [rip+0x4c8a]        # 7688 <__PRETTY_FUNCTION__.0+0x148>
    29fc:	00 00 
    29fe:	c5 7b 11 8d 70 fa ff 	vmovsd QWORD PTR [rbp-0x590],xmm9
    2a05:	ff 
    2a06:	e8 65 f9 ff ff       	call   2370 <getpid@plt>
    2a0b:	62 f1 ff 08 78 9d 70 	vcvttsd2usi rbx,QWORD PTR [rbp-0x590]
    2a12:	fa ff ff 
    2a15:	31 d8                	xor    eax,ebx
    2a17:	89 c7                	mov    edi,eax
    2a19:	e8 22 fa ff ff       	call   2440 <srand@plt>
    2a1e:	e8 5d fb ff ff       	call   2580 <rand@plt>
    2a23:	4c 8b b5 a8 fa ff ff 	mov    r14,QWORD PTR [rbp-0x558]
    2a2a:	41 89 c5             	mov    r13d,eax
    2a2d:	4c 89 f7             	mov    rdi,r14
    2a30:	e8 1b fa ff ff       	call   2450 <__gmp_randinit_default@plt>
    2a35:	31 ff                	xor    edi,edi
    2a37:	e8 64 fa ff ff       	call   24a0 <time@plt>
    2a3c:	49 63 d5             	movsxd rdx,r13d
    2a3f:	44 89 e9             	mov    ecx,r13d
    2a42:	48 69 fa 1f 85 eb 51 	imul   rdi,rdx,0x51eb851f
    2a49:	c1 f9 1f             	sar    ecx,0x1f
    2a4c:	49 89 c2             	mov    r10,rax
    2a4f:	48 c1 ff 25          	sar    rdi,0x25
    2a53:	29 cf                	sub    edi,ecx
    2a55:	6b c7 64             	imul   eax,edi,0x64
    2a58:	4c 89 f7             	mov    rdi,r14
    2a5b:	41 29 c5             	sub    r13d,eax
    2a5e:	41 8d 75 01          	lea    esi,[r13+0x1]
    2a62:	48 63 f6             	movsxd rsi,esi
    2a65:	4c 01 d6             	add    rsi,r10
    2a68:	e8 83 f8 ff ff       	call   22f0 <__gmp_randseed_ui@plt>
    2a6d:	48 8b bd b0 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x550]
    2a74:	e8 d7 fa ff ff       	call   2550 <__gmpz_init@plt>
    2a79:	48 63 15 ac 65 00 00 	movsxd rdx,DWORD PTR [rip+0x65ac]        # 902c <NUMBER_OF_BITS>
    2a80:	48 8b bd b0 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x550]
    2a87:	4c 89 f6             	mov    rsi,r14
    2a8a:	e8 e1 fa ff ff       	call   2570 <__gmpz_urandomb@plt>
    2a8f:	48 8b 95 b0 fa ff ff 	mov    rdx,QWORD PTR [rbp-0x550]
    2a96:	be 0a 00 00 00       	mov    esi,0xa
    2a9b:	31 ff                	xor    edi,edi
    2a9d:	e8 fe f8 ff ff       	call   23a0 <__gmpz_get_str@plt>
    2aa2:	48 8b bd b0 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x550]
    2aa9:	49 89 c5             	mov    r13,rax
    2aac:	e8 0f fa ff ff       	call   24c0 <__gmpz_clear@plt>
    2ab1:	4c 89 f7             	mov    rdi,r14
    2ab4:	e8 07 f9 ff ff       	call   23c0 <__gmp_randclear@plt>
    2ab9:	48 8b bd 78 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x588]
    2ac0:	31 f6                	xor    esi,esi
    2ac2:	e8 19 f9 ff ff       	call   23e0 <gettimeofday@plt>
    2ac7:	c4 41 21 57 db       	vxorpd xmm11,xmm11,xmm11
    2acc:	c4 e1 a3 2a 8d 00 fb 	vcvtsi2sd xmm1,xmm11,QWORD PTR [rbp-0x500]
    2ad3:	ff ff 
    2ad5:	c4 61 a3 2a ad 08 fb 	vcvtsi2sd xmm13,xmm11,QWORD PTR [rbp-0x4f8]
    2adc:	ff ff 
    2ade:	c5 73 10 e1          	vmovsd xmm12,xmm1,xmm1
    2ae2:	c4 62 91 99 25 9d 4b 	vfmadd132sd xmm12,xmm13,QWORD PTR [rip+0x4b9d]        # 7688 <__PRETTY_FUNCTION__.0+0x148>
    2ae9:	00 00 
    2aeb:	c5 7b 11 a5 70 fa ff 	vmovsd QWORD PTR [rbp-0x590],xmm12
    2af2:	ff 
    2af3:	e8 78 f8 ff ff       	call   2370 <getpid@plt>
    2af8:	62 71 ff 08 78 85 70 	vcvttsd2usi r8,QWORD PTR [rbp-0x590]
    2aff:	fa ff ff 
    2b02:	44 31 c0             	xor    eax,r8d
    2b05:	89 c7                	mov    edi,eax
    2b07:	e8 34 f9 ff ff       	call   2440 <srand@plt>
    2b0c:	e8 6f fa ff ff       	call   2580 <rand@plt>
    2b11:	4c 89 f7             	mov    rdi,r14
    2b14:	41 89 c7             	mov    r15d,eax
    2b17:	e8 34 f9 ff ff       	call   2450 <__gmp_randinit_default@plt>
    2b1c:	31 ff                	xor    edi,edi
    2b1e:	e8 7d f9 ff ff       	call   24a0 <time@plt>
    2b23:	4d 63 df             	movsxd r11,r15d
    2b26:	45 89 fa             	mov    r10d,r15d
    2b29:	49 69 db 1f 85 eb 51 	imul   rbx,r11,0x51eb851f
    2b30:	41 c1 fa 1f          	sar    r10d,0x1f
    2b34:	48 c1 fb 25          	sar    rbx,0x25
    2b38:	44 29 d3             	sub    ebx,r10d
    2b3b:	6b d3 64             	imul   edx,ebx,0x64
    2b3e:	41 29 d7             	sub    r15d,edx
    2b41:	41 8d 7f 01          	lea    edi,[r15+0x1]
    2b45:	48 63 f7             	movsxd rsi,edi
    2b48:	4c 89 f7             	mov    rdi,r14
    2b4b:	48 01 c6             	add    rsi,rax
    2b4e:	e8 9d f7 ff ff       	call   22f0 <__gmp_randseed_ui@plt>
    2b53:	48 8b bd b0 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x550]
    2b5a:	e8 f1 f9 ff ff       	call   2550 <__gmpz_init@plt>
    2b5f:	48 63 15 c6 64 00 00 	movsxd rdx,DWORD PTR [rip+0x64c6]        # 902c <NUMBER_OF_BITS>
    2b66:	48 8b bd b0 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x550]
    2b6d:	4c 89 f6             	mov    rsi,r14
    2b70:	e8 fb f9 ff ff       	call   2570 <__gmpz_urandomb@plt>
    2b75:	48 8b 95 b0 fa ff ff 	mov    rdx,QWORD PTR [rbp-0x550]
    2b7c:	be 0a 00 00 00       	mov    esi,0xa
    2b81:	31 ff                	xor    edi,edi
    2b83:	e8 18 f8 ff ff       	call   23a0 <__gmpz_get_str@plt>
    2b88:	48 8b bd b0 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x550]
    2b8f:	48 89 c3             	mov    rbx,rax
    2b92:	e8 29 f9 ff ff       	call   24c0 <__gmpz_clear@plt>
    2b97:	4c 89 f7             	mov    rdi,r14
    2b9a:	e8 21 f8 ff ff       	call   23c0 <__gmp_randclear@plt>
    2b9f:	4c 89 ef             	mov    rdi,r13
    2ba2:	e8 e9 f7 ff ff       	call   2390 <strlen@plt>
    2ba7:	48 89 df             	mov    rdi,rbx
    2baa:	89 85 ec fa ff ff    	mov    DWORD PTR [rbp-0x514],eax
    2bb0:	e8 db f7 ff ff       	call   2390 <strlen@plt>
    2bb5:	48 8b bd a0 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x560]
    2bbc:	ba 0a 00 00 00       	mov    edx,0xa
    2bc1:	4c 89 ee             	mov    rsi,r13
    2bc4:	89 85 f0 fa ff ff    	mov    DWORD PTR [rbp-0x510],eax
    2bca:	e8 71 f7 ff ff       	call   2340 <__gmpz_set_str@plt>
    2bcf:	48 8b bd 98 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x568]
    2bd6:	ba 0a 00 00 00       	mov    edx,0xa
    2bdb:	48 89 de             	mov    rsi,rbx
    2bde:	e8 5d f7 ff ff       	call   2340 <__gmpz_set_str@plt>
    2be3:	4c 63 b5 ec fa ff ff 	movsxd r14,DWORD PTR [rbp-0x514]
    2bea:	be 04 00 00 00       	mov    esi,0x4
    2bef:	4c 89 f7             	mov    rdi,r14
    2bf2:	4c 89 b5 50 fa ff ff 	mov    QWORD PTR [rbp-0x5b0],r14
    2bf9:	4d 89 f7             	mov    r15,r14
    2bfc:	e8 5f f8 ff ff       	call   2460 <calloc@plt>
    2c01:	48 63 bd f0 fa ff ff 	movsxd rdi,DWORD PTR [rbp-0x510]
    2c08:	be 04 00 00 00       	mov    esi,0x4
    2c0d:	48 89 85 f8 fa ff ff 	mov    QWORD PTR [rbp-0x508],rax
    2c14:	49 89 c6             	mov    r14,rax
    2c17:	89 bd 68 fa ff ff    	mov    DWORD PTR [rbp-0x598],edi
    2c1d:	48 89 bd 70 fa ff ff 	mov    QWORD PTR [rbp-0x590],rdi
    2c24:	e8 37 f8 ff ff       	call   2460 <calloc@plt>
    2c29:	45 85 ff             	test   r15d,r15d
    2c2c:	4c 8b 9d 70 fa ff ff 	mov    r11,QWORD PTR [rbp-0x590]
    2c33:	44 8b 95 68 fa ff ff 	mov    r10d,DWORD PTR [rbp-0x598]
    2c3a:	48 89 85 00 fb ff ff 	mov    QWORD PTR [rbp-0x500],rax
    2c41:	0f 8e d1 03 00 00    	jle    3018 <main+0xa78>
    2c47:	48 8b 95 50 fa ff ff 	mov    rdx,QWORD PTR [rbp-0x5b0]
    2c4e:	45 89 f8             	mov    r8d,r15d
    2c51:	41 8d 77 ff          	lea    esi,[r15-0x1]
    2c55:	4d 8d 0c 96          	lea    r9,[r14+rdx*4]
    2c59:	4d 39 cd             	cmp    r13,r9
    2c5c:	40 0f 93 c7          	setae  dil
    2c60:	4c 01 ea             	add    rdx,r13
    2c63:	49 39 d6             	cmp    r14,rdx
    2c66:	0f 93 c1             	setae  cl
    2c69:	40 08 f9             	or     cl,dil
    2c6c:	0f 84 88 14 00 00    	je     40fa <main+0x1b5a>
    2c72:	83 fe 0e             	cmp    esi,0xe
    2c75:	0f 86 7f 14 00 00    	jbe    40fa <main+0x1b5a>
    2c7b:	83 fe 1e             	cmp    esi,0x1e
    2c7e:	0f 86 ef 16 00 00    	jbe    4373 <main+0x1dd3>
    2c84:	41 c1 e8 05          	shr    r8d,0x5
    2c88:	4c 89 ef             	mov    rdi,r13
    2c8b:	4c 89 f1             	mov    rcx,r14
    2c8e:	49 c1 e0 05          	shl    r8,0x5
    2c92:	4f 8d 0c 28          	lea    r9,[r8+r13*1]
    2c96:	41 83 e0 20          	and    r8d,0x20
    2c9a:	74 74                	je     2d10 <main+0x770>
    2c9c:	c4 c1 7e 6f 45 00    	vmovdqu ymm0,YMMWORD PTR [r13+0x0]
    2ca2:	c4 42 7d 20 75 00    	vpmovsxbw ymm14,XMMWORD PTR [r13+0x0]
    2ca8:	49 8d 7d 20          	lea    rdi,[r13+0x20]
    2cac:	49 8d 8e 80 00 00 00 	lea    rcx,[r14+0x80]
    2cb3:	c5 0d fd 3d 25 4a 00 	vpaddw ymm15,ymm14,YMMWORD PTR [rip+0x4a25]        # 76e0 <__PRETTY_FUNCTION__.0+0x1a0>
    2cba:	00 
    2cbb:	c4 e3 7d 39 c2 01    	vextracti128 xmm2,ymm0,0x1
    2cc1:	c4 e2 7d 20 da       	vpmovsxbw ymm3,xmm2
    2cc6:	c4 63 7d 39 fc 01    	vextracti128 xmm4,ymm15,0x1
    2ccc:	c5 e5 fd 3d 0c 4a 00 	vpaddw ymm7,ymm3,YMMWORD PTR [rip+0x4a0c]        # 76e0 <__PRETTY_FUNCTION__.0+0x1a0>
    2cd3:	00 
    2cd4:	c4 c2 7d 23 ef       	vpmovsxwd ymm5,xmm15
    2cd9:	c4 e2 7d 23 f4       	vpmovsxwd ymm6,xmm4
    2cde:	c4 c3 7d 39 f9 01    	vextracti128 xmm9,ymm7,0x1
    2ce4:	c4 62 7d 23 c7       	vpmovsxwd ymm8,xmm7
    2ce9:	c4 c1 7e 7f 2e       	vmovdqu YMMWORD PTR [r14],ymm5
    2cee:	c4 42 7d 23 d1       	vpmovsxwd ymm10,xmm9
    2cf3:	c4 c1 7e 7f 76 20    	vmovdqu YMMWORD PTR [r14+0x20],ymm6
    2cf9:	c4 41 7e 7f 46 40    	vmovdqu YMMWORD PTR [r14+0x40],ymm8
    2cff:	c4 41 7e 7f 56 60    	vmovdqu YMMWORD PTR [r14+0x60],ymm10
    2d05:	4c 39 cf             	cmp    rdi,r9
    2d08:	0f 84 d4 00 00 00    	je     2de2 <main+0x842>
    2d0e:	66 90                	xchg   ax,ax
    2d10:	c5 7e 6f 27          	vmovdqu ymm12,YMMWORD PTR [rdi]
    2d14:	c4 62 7d 20 1f       	vpmovsxbw ymm11,XMMWORD PTR [rdi]
    2d19:	48 83 c7 40          	add    rdi,0x40
    2d1d:	48 81 c1 00 01 00 00 	add    rcx,0x100
    2d24:	c5 a5 fd 0d b4 49 00 	vpaddw ymm1,ymm11,YMMWORD PTR [rip+0x49b4]        # 76e0 <__PRETTY_FUNCTION__.0+0x1a0>
    2d2b:	00 
    2d2c:	c4 43 7d 39 e5 01    	vextracti128 xmm13,ymm12,0x1
    2d32:	c4 42 7d 20 f5       	vpmovsxbw ymm14,xmm13
    2d37:	c4 e3 7d 39 ca 01    	vextracti128 xmm2,ymm1,0x1
    2d3d:	c5 0d fd 3d 9b 49 00 	vpaddw ymm15,ymm14,YMMWORD PTR [rip+0x499b]        # 76e0 <__PRETTY_FUNCTION__.0+0x1a0>
    2d44:	00 
    2d45:	c4 e2 7d 23 c1       	vpmovsxwd ymm0,xmm1
    2d4a:	c4 e2 7d 23 da       	vpmovsxwd ymm3,xmm2
    2d4f:	c4 63 7d 39 fd 01    	vextracti128 xmm5,ymm15,0x1
    2d55:	c4 c2 7d 23 ff       	vpmovsxwd ymm7,xmm15
    2d5a:	c5 fe 7f 81 00 ff ff 	vmovdqu YMMWORD PTR [rcx-0x100],ymm0
    2d61:	ff 
    2d62:	c5 fe 7f 99 20 ff ff 	vmovdqu YMMWORD PTR [rcx-0xe0],ymm3
    2d69:	ff 
    2d6a:	c4 e2 7d 23 e5       	vpmovsxwd ymm4,xmm5
    2d6f:	c5 fe 7f b9 40 ff ff 	vmovdqu YMMWORD PTR [rcx-0xc0],ymm7
    2d76:	ff 
    2d77:	c5 fe 7f a1 60 ff ff 	vmovdqu YMMWORD PTR [rcx-0xa0],ymm4
    2d7e:	ff 
    2d7f:	c5 7e 6f 4f e0       	vmovdqu ymm9,YMMWORD PTR [rdi-0x20]
    2d84:	c4 e2 7d 20 77 e0    	vpmovsxbw ymm6,XMMWORD PTR [rdi-0x20]
    2d8a:	c5 4d fd 05 4e 49 00 	vpaddw ymm8,ymm6,YMMWORD PTR [rip+0x494e]        # 76e0 <__PRETTY_FUNCTION__.0+0x1a0>
    2d91:	00 
    2d92:	c4 43 7d 39 ca 01    	vextracti128 xmm10,ymm9,0x1
    2d98:	c4 42 7d 20 da       	vpmovsxbw ymm11,xmm10
    2d9d:	c4 43 7d 39 c5 01    	vextracti128 xmm13,ymm8,0x1
    2da3:	c5 25 fd 25 35 49 00 	vpaddw ymm12,ymm11,YMMWORD PTR [rip+0x4935]        # 76e0 <__PRETTY_FUNCTION__.0+0x1a0>
    2daa:	00 
    2dab:	c4 c2 7d 23 c8       	vpmovsxwd ymm1,xmm8
    2db0:	c4 42 7d 23 f5       	vpmovsxwd ymm14,xmm13
    2db5:	c4 63 7d 39 e0 01    	vextracti128 xmm0,ymm12,0x1
    2dbb:	c4 42 7d 23 fc       	vpmovsxwd ymm15,xmm12
    2dc0:	c5 fe 7f 49 80       	vmovdqu YMMWORD PTR [rcx-0x80],ymm1
    2dc5:	c4 e2 7d 23 d0       	vpmovsxwd ymm2,xmm0
    2dca:	c5 7e 7f 71 a0       	vmovdqu YMMWORD PTR [rcx-0x60],ymm14
    2dcf:	c5 7e 7f 79 c0       	vmovdqu YMMWORD PTR [rcx-0x40],ymm15
    2dd4:	c5 fe 7f 51 e0       	vmovdqu YMMWORD PTR [rcx-0x20],ymm2
    2dd9:	4c 39 cf             	cmp    rdi,r9
    2ddc:	0f 85 2e ff ff ff    	jne    2d10 <main+0x770>
    2de2:	44 89 fe             	mov    esi,r15d
    2de5:	83 e6 e0             	and    esi,0xffffffe0
    2de8:	89 f2                	mov    edx,esi
    2dea:	41 39 f7             	cmp    r15d,esi
    2ded:	0f 84 25 02 00 00    	je     3018 <main+0xa78>
    2df3:	45 89 f8             	mov    r8d,r15d
    2df6:	41 29 f0             	sub    r8d,esi
    2df9:	45 8d 48 ff          	lea    r9d,[r8-0x1]
    2dfd:	41 83 f9 0e          	cmp    r9d,0xe
    2e01:	76 6d                	jbe    2e70 <main+0x8d0>
    2e03:	c4 c1 7a 6f 5c 35 00 	vmovdqu xmm3,XMMWORD PTR [r13+rsi*1+0x0]
    2e0a:	49 8d 3c b6          	lea    rdi,[r14+rsi*4]
    2e0e:	44 89 c6             	mov    esi,r8d
    2e11:	83 e6 f0             	and    esi,0xfffffff0
    2e14:	c5 d9 73 db 08       	vpsrldq xmm4,xmm3,0x8
    2e19:	c4 e2 79 20 fb       	vpmovsxbw xmm7,xmm3
    2e1e:	01 f2                	add    edx,esi
    2e20:	c5 c1 fd 2d b8 48 00 	vpaddw xmm5,xmm7,XMMWORD PTR [rip+0x48b8]        # 76e0 <__PRETTY_FUNCTION__.0+0x1a0>
    2e27:	00 
    2e28:	c4 e2 79 20 f4       	vpmovsxbw xmm6,xmm4
    2e2d:	c5 49 fd 05 ab 48 00 	vpaddw xmm8,xmm6,XMMWORD PTR [rip+0x48ab]        # 76e0 <__PRETTY_FUNCTION__.0+0x1a0>
    2e34:	00 
    2e35:	c5 a9 73 dd 08       	vpsrldq xmm10,xmm5,0x8
    2e3a:	c4 c1 71 73 d8 08    	vpsrldq xmm1,xmm8,0x8
    2e40:	c4 62 79 23 cd       	vpmovsxwd xmm9,xmm5
    2e45:	c4 42 79 23 da       	vpmovsxwd xmm11,xmm10
    2e4a:	c4 42 79 23 e0       	vpmovsxwd xmm12,xmm8
    2e4f:	c4 62 79 23 e9       	vpmovsxwd xmm13,xmm1
    2e54:	c5 7a 7f 0f          	vmovdqu XMMWORD PTR [rdi],xmm9
    2e58:	c5 7a 7f 5f 10       	vmovdqu XMMWORD PTR [rdi+0x10],xmm11
    2e5d:	c5 7a 7f 67 20       	vmovdqu XMMWORD PTR [rdi+0x20],xmm12
    2e62:	c5 7a 7f 6f 30       	vmovdqu XMMWORD PTR [rdi+0x30],xmm13
    2e67:	41 39 f0             	cmp    r8d,esi
    2e6a:	0f 84 a8 01 00 00    	je     3018 <main+0xa78>
    2e70:	48 63 ca             	movsxd rcx,edx
    2e73:	8d 7a 01             	lea    edi,[rdx+0x1]
    2e76:	45 0f be 4c 0d 00    	movsx  r9d,BYTE PTR [r13+rcx*1+0x0]
    2e7c:	4c 8d 04 8d 00 00 00 	lea    r8,[rcx*4+0x0]
    2e83:	00 
    2e84:	41 83 e9 30          	sub    r9d,0x30
    2e88:	45 89 0c 8e          	mov    DWORD PTR [r14+rcx*4],r9d
    2e8c:	41 39 ff             	cmp    r15d,edi
    2e8f:	0f 8e 83 01 00 00    	jle    3018 <main+0xa78>
    2e95:	48 63 f7             	movsxd rsi,edi
    2e98:	44 8d 4a 02          	lea    r9d,[rdx+0x2]
    2e9c:	41 0f be 4c 35 00    	movsx  ecx,BYTE PTR [r13+rsi*1+0x0]
    2ea2:	83 e9 30             	sub    ecx,0x30
    2ea5:	43 89 4c 06 04       	mov    DWORD PTR [r14+r8*1+0x4],ecx
    2eaa:	45 39 cf             	cmp    r15d,r9d
    2ead:	0f 8e 65 01 00 00    	jle    3018 <main+0xa78>
    2eb3:	49 63 f9             	movsxd rdi,r9d
    2eb6:	8d 4a 03             	lea    ecx,[rdx+0x3]
    2eb9:	41 0f be 74 3d 00    	movsx  esi,BYTE PTR [r13+rdi*1+0x0]
    2ebf:	83 ee 30             	sub    esi,0x30
    2ec2:	43 89 74 06 08       	mov    DWORD PTR [r14+r8*1+0x8],esi
    2ec7:	41 39 cf             	cmp    r15d,ecx
    2eca:	0f 8e 48 01 00 00    	jle    3018 <main+0xa78>
    2ed0:	4c 63 c9             	movsxd r9,ecx
    2ed3:	8d 72 04             	lea    esi,[rdx+0x4]
    2ed6:	43 0f be 7c 0d 00    	movsx  edi,BYTE PTR [r13+r9*1+0x0]
    2edc:	83 ef 30             	sub    edi,0x30
    2edf:	43 89 7c 06 0c       	mov    DWORD PTR [r14+r8*1+0xc],edi
    2ee4:	41 39 f7             	cmp    r15d,esi
    2ee7:	0f 8e 2b 01 00 00    	jle    3018 <main+0xa78>
    2eed:	48 63 ce             	movsxd rcx,esi
    2ef0:	8d 7a 05             	lea    edi,[rdx+0x5]
    2ef3:	45 0f be 4c 0d 00    	movsx  r9d,BYTE PTR [r13+rcx*1+0x0]
    2ef9:	41 83 e9 30          	sub    r9d,0x30
    2efd:	47 89 4c 06 10       	mov    DWORD PTR [r14+r8*1+0x10],r9d
    2f02:	41 39 ff             	cmp    r15d,edi
    2f05:	0f 8e 0d 01 00 00    	jle    3018 <main+0xa78>
    2f0b:	48 63 f7             	movsxd rsi,edi
    2f0e:	44 8d 4a 06          	lea    r9d,[rdx+0x6]
    2f12:	41 0f be 4c 35 00    	movsx  ecx,BYTE PTR [r13+rsi*1+0x0]
    2f18:	83 e9 30             	sub    ecx,0x30
    2f1b:	43 89 4c 06 14       	mov    DWORD PTR [r14+r8*1+0x14],ecx
    2f20:	45 39 cf             	cmp    r15d,r9d
    2f23:	0f 8e ef 00 00 00    	jle    3018 <main+0xa78>
    2f29:	49 63 f9             	movsxd rdi,r9d
    2f2c:	8d 4a 07             	lea    ecx,[rdx+0x7]
    2f2f:	41 0f be 74 3d 00    	movsx  esi,BYTE PTR [r13+rdi*1+0x0]
    2f35:	83 ee 30             	sub    esi,0x30
    2f38:	43 89 74 06 18       	mov    DWORD PTR [r14+r8*1+0x18],esi
    2f3d:	41 39 cf             	cmp    r15d,ecx
    2f40:	0f 8e d2 00 00 00    	jle    3018 <main+0xa78>
    2f46:	4c 63 c9             	movsxd r9,ecx
    2f49:	8d 72 08             	lea    esi,[rdx+0x8]
    2f4c:	43 0f be 7c 0d 00    	movsx  edi,BYTE PTR [r13+r9*1+0x0]
    2f52:	83 ef 30             	sub    edi,0x30
    2f55:	43 89 7c 06 1c       	mov    DWORD PTR [r14+r8*1+0x1c],edi
    2f5a:	41 39 f7             	cmp    r15d,esi
    2f5d:	0f 8e b5 00 00 00    	jle    3018 <main+0xa78>
    2f63:	48 63 ce             	movsxd rcx,esi
    2f66:	8d 7a 09             	lea    edi,[rdx+0x9]
    2f69:	45 0f be 4c 0d 00    	movsx  r9d,BYTE PTR [r13+rcx*1+0x0]
    2f6f:	41 83 e9 30          	sub    r9d,0x30
    2f73:	47 89 4c 06 20       	mov    DWORD PTR [r14+r8*1+0x20],r9d
    2f78:	41 39 ff             	cmp    r15d,edi
    2f7b:	0f 8e 97 00 00 00    	jle    3018 <main+0xa78>
    2f81:	48 63 f7             	movsxd rsi,edi
    2f84:	44 8d 4a 0a          	lea    r9d,[rdx+0xa]
    2f88:	41 0f be 4c 35 00    	movsx  ecx,BYTE PTR [r13+rsi*1+0x0]
    2f8e:	83 e9 30             	sub    ecx,0x30
    2f91:	43 89 4c 06 24       	mov    DWORD PTR [r14+r8*1+0x24],ecx
    2f96:	45 39 cf             	cmp    r15d,r9d
    2f99:	7e 7d                	jle    3018 <main+0xa78>
    2f9b:	49 63 f9             	movsxd rdi,r9d
    2f9e:	8d 4a 0b             	lea    ecx,[rdx+0xb]
    2fa1:	41 0f be 74 3d 00    	movsx  esi,BYTE PTR [r13+rdi*1+0x0]
    2fa7:	83 ee 30             	sub    esi,0x30
    2faa:	43 89 74 06 28       	mov    DWORD PTR [r14+r8*1+0x28],esi
    2faf:	41 39 cf             	cmp    r15d,ecx
    2fb2:	7e 64                	jle    3018 <main+0xa78>
    2fb4:	4c 63 c9             	movsxd r9,ecx
    2fb7:	8d 72 0c             	lea    esi,[rdx+0xc]
    2fba:	43 0f be 7c 0d 00    	movsx  edi,BYTE PTR [r13+r9*1+0x0]
    2fc0:	83 ef 30             	sub    edi,0x30
    2fc3:	43 89 7c 06 2c       	mov    DWORD PTR [r14+r8*1+0x2c],edi
    2fc8:	41 39 f7             	cmp    r15d,esi
    2fcb:	7e 4b                	jle    3018 <main+0xa78>
    2fcd:	48 63 ce             	movsxd rcx,esi
    2fd0:	8d 7a 0d             	lea    edi,[rdx+0xd]
    2fd3:	45 0f be 4c 0d 00    	movsx  r9d,BYTE PTR [r13+rcx*1+0x0]
    2fd9:	41 83 e9 30          	sub    r9d,0x30
    2fdd:	47 89 4c 06 30       	mov    DWORD PTR [r14+r8*1+0x30],r9d
    2fe2:	41 39 ff             	cmp    r15d,edi
    2fe5:	7e 31                	jle    3018 <main+0xa78>
    2fe7:	48 63 f7             	movsxd rsi,edi
    2fea:	83 c2 0e             	add    edx,0xe
    2fed:	41 0f be 4c 35 00    	movsx  ecx,BYTE PTR [r13+rsi*1+0x0]
    2ff3:	83 e9 30             	sub    ecx,0x30
    2ff6:	43 89 4c 06 34       	mov    DWORD PTR [r14+r8*1+0x34],ecx
    2ffb:	41 39 d7             	cmp    r15d,edx
    2ffe:	7e 18                	jle    3018 <main+0xa78>
    3000:	4c 63 fa             	movsxd r15,edx
    3003:	47 0f be 6c 3d 00    	movsx  r13d,BYTE PTR [r13+r15*1+0x0]
    3009:	41 83 ed 30          	sub    r13d,0x30
    300d:	47 89 6c 06 38       	mov    DWORD PTR [r14+r8*1+0x38],r13d
    3012:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    3018:	45 85 d2             	test   r10d,r10d
    301b:	0f 8e cf 03 00 00    	jle    33f0 <main+0xe50>
    3021:	4e 8d 0c 98          	lea    r9,[rax+r11*4]
    3025:	45 89 d6             	mov    r14d,r10d
    3028:	45 8d 6a ff          	lea    r13d,[r10-0x1]
    302c:	4c 39 cb             	cmp    rbx,r9
    302f:	0f 93 c2             	setae  dl
    3032:	49 01 db             	add    r11,rbx
    3035:	4c 39 d8             	cmp    rax,r11
    3038:	41 0f 93 c3          	setae  r11b
    303c:	44 08 da             	or     dl,r11b
    303f:	0f 84 de 11 00 00    	je     4223 <main+0x1c83>
    3045:	41 83 fd 0e          	cmp    r13d,0xe
    3049:	0f 86 d4 11 00 00    	jbe    4223 <main+0x1c83>
    304f:	41 83 fd 1e          	cmp    r13d,0x1e
    3053:	0f 86 23 13 00 00    	jbe    437c <main+0x1ddc>
    3059:	44 89 d7             	mov    edi,r10d
    305c:	48 89 de             	mov    rsi,rbx
    305f:	49 89 c6             	mov    r14,rax
    3062:	c1 ef 05             	shr    edi,0x5
    3065:	48 c1 e7 05          	shl    rdi,0x5
    3069:	4c 8d 3c 1f          	lea    r15,[rdi+rbx*1]
    306d:	83 e7 20             	and    edi,0x20
    3070:	74 6e                	je     30e0 <main+0xb40>
    3072:	c5 fe 6f 03          	vmovdqu ymm0,YMMWORD PTR [rbx]
    3076:	c4 62 7d 20 33       	vpmovsxbw ymm14,XMMWORD PTR [rbx]
    307b:	48 8d 73 20          	lea    rsi,[rbx+0x20]
    307f:	4c 8d b0 80 00 00 00 	lea    r14,[rax+0x80]
    3086:	c5 0d fd 3d 52 46 00 	vpaddw ymm15,ymm14,YMMWORD PTR [rip+0x4652]        # 76e0 <__PRETTY_FUNCTION__.0+0x1a0>
    308d:	00 
    308e:	c4 e3 7d 39 c2 01    	vextracti128 xmm2,ymm0,0x1
    3094:	c4 e2 7d 20 da       	vpmovsxbw ymm3,xmm2
    3099:	c4 63 7d 39 fc 01    	vextracti128 xmm4,ymm15,0x1
    309f:	c5 e5 fd 3d 39 46 00 	vpaddw ymm7,ymm3,YMMWORD PTR [rip+0x4639]        # 76e0 <__PRETTY_FUNCTION__.0+0x1a0>
    30a6:	00 
    30a7:	c4 c2 7d 23 ef       	vpmovsxwd ymm5,xmm15
    30ac:	c4 e2 7d 23 f4       	vpmovsxwd ymm6,xmm4
    30b1:	c4 c3 7d 39 f9 01    	vextracti128 xmm9,ymm7,0x1
    30b7:	c4 62 7d 23 c7       	vpmovsxwd ymm8,xmm7
    30bc:	c5 fe 7f 28          	vmovdqu YMMWORD PTR [rax],ymm5
    30c0:	c4 42 7d 23 d1       	vpmovsxwd ymm10,xmm9
    30c5:	c5 fe 7f 70 20       	vmovdqu YMMWORD PTR [rax+0x20],ymm6
    30ca:	c5 7e 7f 40 40       	vmovdqu YMMWORD PTR [rax+0x40],ymm8
    30cf:	c5 7e 7f 50 60       	vmovdqu YMMWORD PTR [rax+0x60],ymm10
    30d4:	49 39 f7             	cmp    r15,rsi
    30d7:	0f 84 dd 00 00 00    	je     31ba <main+0xc1a>
    30dd:	0f 1f 00             	nop    DWORD PTR [rax]
    30e0:	c5 fe 6f 0e          	vmovdqu ymm1,YMMWORD PTR [rsi]
    30e4:	c4 62 7d 20 1e       	vpmovsxbw ymm11,XMMWORD PTR [rsi]
    30e9:	48 83 c6 40          	add    rsi,0x40
    30ed:	49 81 c6 00 01 00 00 	add    r14,0x100
    30f4:	c5 25 fd 25 e4 45 00 	vpaddw ymm12,ymm11,YMMWORD PTR [rip+0x45e4]        # 76e0 <__PRETTY_FUNCTION__.0+0x1a0>
    30fb:	00 
    30fc:	c4 c3 7d 39 cd 01    	vextracti128 xmm13,ymm1,0x1
    3102:	c4 42 7d 20 f5       	vpmovsxbw ymm14,xmm13
    3107:	c4 63 7d 39 e2 01    	vextracti128 xmm2,ymm12,0x1
    310d:	c5 0d fd 3d cb 45 00 	vpaddw ymm15,ymm14,YMMWORD PTR [rip+0x45cb]        # 76e0 <__PRETTY_FUNCTION__.0+0x1a0>
    3114:	00 
    3115:	c4 c2 7d 23 c4       	vpmovsxwd ymm0,xmm12
    311a:	c4 e2 7d 23 da       	vpmovsxwd ymm3,xmm2
    311f:	c4 63 7d 39 fd 01    	vextracti128 xmm5,ymm15,0x1
    3125:	c4 c2 7d 23 ff       	vpmovsxwd ymm7,xmm15
    312a:	c4 c1 7e 7f 86 00 ff 	vmovdqu YMMWORD PTR [r14-0x100],ymm0
    3131:	ff ff 
    3133:	c4 c1 7e 7f 9e 20 ff 	vmovdqu YMMWORD PTR [r14-0xe0],ymm3
    313a:	ff ff 
    313c:	c4 e2 7d 23 e5       	vpmovsxwd ymm4,xmm5
    3141:	c4 c1 7e 7f be 40 ff 	vmovdqu YMMWORD PTR [r14-0xc0],ymm7
    3148:	ff ff 
    314a:	c4 c1 7e 7f a6 60 ff 	vmovdqu YMMWORD PTR [r14-0xa0],ymm4
    3151:	ff ff 
    3153:	c5 7e 6f 4e e0       	vmovdqu ymm9,YMMWORD PTR [rsi-0x20]
    3158:	c4 e2 7d 20 76 e0    	vpmovsxbw ymm6,XMMWORD PTR [rsi-0x20]
    315e:	c5 4d fd 05 7a 45 00 	vpaddw ymm8,ymm6,YMMWORD PTR [rip+0x457a]        # 76e0 <__PRETTY_FUNCTION__.0+0x1a0>
    3165:	00 
    3166:	c4 43 7d 39 ca 01    	vextracti128 xmm10,ymm9,0x1
    316c:	c4 42 7d 20 da       	vpmovsxbw ymm11,xmm10
    3171:	c4 43 7d 39 c5 01    	vextracti128 xmm13,ymm8,0x1
    3177:	c5 25 fd 25 61 45 00 	vpaddw ymm12,ymm11,YMMWORD PTR [rip+0x4561]        # 76e0 <__PRETTY_FUNCTION__.0+0x1a0>
    317e:	00 
    317f:	c4 c2 7d 23 c8       	vpmovsxwd ymm1,xmm8
    3184:	c4 42 7d 23 f5       	vpmovsxwd ymm14,xmm13
    3189:	c4 63 7d 39 e0 01    	vextracti128 xmm0,ymm12,0x1
    318f:	c4 42 7d 23 fc       	vpmovsxwd ymm15,xmm12
    3194:	c4 c1 7e 7f 4e 80    	vmovdqu YMMWORD PTR [r14-0x80],ymm1
    319a:	c4 e2 7d 23 d0       	vpmovsxwd ymm2,xmm0
    319f:	c4 41 7e 7f 76 a0    	vmovdqu YMMWORD PTR [r14-0x60],ymm14
    31a5:	c4 41 7e 7f 7e c0    	vmovdqu YMMWORD PTR [r14-0x40],ymm15
    31ab:	c4 c1 7e 7f 56 e0    	vmovdqu YMMWORD PTR [r14-0x20],ymm2
    31b1:	49 39 f7             	cmp    r15,rsi
    31b4:	0f 85 26 ff ff ff    	jne    30e0 <main+0xb40>
    31ba:	45 89 d0             	mov    r8d,r10d
    31bd:	41 83 e0 e0          	and    r8d,0xffffffe0
    31c1:	44 89 c1             	mov    ecx,r8d
    31c4:	45 39 c2             	cmp    r10d,r8d
    31c7:	0f 84 23 02 00 00    	je     33f0 <main+0xe50>
    31cd:	45 89 d6             	mov    r14d,r10d
    31d0:	45 29 c6             	sub    r14d,r8d
    31d3:	45 8d 6e ff          	lea    r13d,[r14-0x1]
    31d7:	41 83 fd 0e          	cmp    r13d,0xe
    31db:	76 71                	jbe    324e <main+0xcae>
    31dd:	c4 a1 7a 6f 1c 03    	vmovdqu xmm3,XMMWORD PTR [rbx+r8*1]
    31e3:	44 89 f2             	mov    edx,r14d
    31e6:	4e 8d 0c 80          	lea    r9,[rax+r8*4]
    31ea:	c4 e2 79 79 2d ed 44 	vpbroadcastw xmm5,WORD PTR [rip+0x44ed]        # 76e0 <__PRETTY_FUNCTION__.0+0x1a0>
    31f1:	00 00 
    31f3:	83 e2 f0             	and    edx,0xfffffff0
    31f6:	c5 c9 73 db 08       	vpsrldq xmm6,xmm3,0x8
    31fb:	c4 e2 79 20 fb       	vpmovsxbw xmm7,xmm3
    3200:	01 d1                	add    ecx,edx
    3202:	c4 62 79 20 c6       	vpmovsxbw xmm8,xmm6
    3207:	c5 c1 fd e5          	vpaddw xmm4,xmm7,xmm5
    320b:	c5 39 fd cd          	vpaddw xmm9,xmm8,xmm5
    320f:	c5 a1 73 dc 08       	vpsrldq xmm11,xmm4,0x8
    3214:	c4 62 79 23 d4       	vpmovsxwd xmm10,xmm4
    3219:	c4 c1 11 73 d9 08    	vpsrldq xmm13,xmm9,0x8
    321f:	c4 42 79 23 e3       	vpmovsxwd xmm12,xmm11
    3224:	c4 c2 79 23 c9       	vpmovsxwd xmm1,xmm9
    3229:	c4 41 7a 7f 11       	vmovdqu XMMWORD PTR [r9],xmm10
    322e:	c4 42 79 23 f5       	vpmovsxwd xmm14,xmm13
    3233:	c4 41 7a 7f 61 10    	vmovdqu XMMWORD PTR [r9+0x10],xmm12
    3239:	c4 c1 7a 7f 49 20    	vmovdqu XMMWORD PTR [r9+0x20],xmm1
    323f:	c4 41 7a 7f 71 30    	vmovdqu XMMWORD PTR [r9+0x30],xmm14
    3245:	41 39 d6             	cmp    r14d,edx
    3248:	0f 84 a2 01 00 00    	je     33f0 <main+0xe50>
    324e:	4c 63 d9             	movsxd r11,ecx
    3251:	8d 79 01             	lea    edi,[rcx+0x1]
    3254:	46 0f be 04 1b       	movsx  r8d,BYTE PTR [rbx+r11*1]
    3259:	4e 8d 3c 9d 00 00 00 	lea    r15,[r11*4+0x0]
    3260:	00 
    3261:	41 83 e8 30          	sub    r8d,0x30
    3265:	46 89 04 98          	mov    DWORD PTR [rax+r11*4],r8d
    3269:	41 39 fa             	cmp    r10d,edi
    326c:	0f 8e 7e 01 00 00    	jle    33f0 <main+0xe50>
    3272:	48 63 f7             	movsxd rsi,edi
    3275:	44 8d 69 02          	lea    r13d,[rcx+0x2]
    3279:	44 0f be 34 33       	movsx  r14d,BYTE PTR [rbx+rsi*1]
    327e:	41 83 ee 30          	sub    r14d,0x30
    3282:	46 89 74 38 04       	mov    DWORD PTR [rax+r15*1+0x4],r14d
    3287:	45 39 ea             	cmp    r10d,r13d
    328a:	0f 8e 60 01 00 00    	jle    33f0 <main+0xe50>
    3290:	4d 63 cd             	movsxd r9,r13d
    3293:	44 8d 59 03          	lea    r11d,[rcx+0x3]
    3297:	42 0f be 14 0b       	movsx  edx,BYTE PTR [rbx+r9*1]
    329c:	83 ea 30             	sub    edx,0x30
    329f:	42 89 54 38 08       	mov    DWORD PTR [rax+r15*1+0x8],edx
    32a4:	45 39 da             	cmp    r10d,r11d
    32a7:	0f 8e 43 01 00 00    	jle    33f0 <main+0xe50>
    32ad:	4d 63 c3             	movsxd r8,r11d
    32b0:	8d 71 04             	lea    esi,[rcx+0x4]
    32b3:	42 0f be 3c 03       	movsx  edi,BYTE PTR [rbx+r8*1]
    32b8:	83 ef 30             	sub    edi,0x30
    32bb:	42 89 7c 38 0c       	mov    DWORD PTR [rax+r15*1+0xc],edi
    32c0:	41 39 f2             	cmp    r10d,esi
    32c3:	0f 8e 27 01 00 00    	jle    33f0 <main+0xe50>
    32c9:	4c 63 f6             	movsxd r14,esi
    32cc:	44 8d 49 05          	lea    r9d,[rcx+0x5]
    32d0:	46 0f be 2c 33       	movsx  r13d,BYTE PTR [rbx+r14*1]
    32d5:	41 83 ed 30          	sub    r13d,0x30
    32d9:	46 89 6c 38 10       	mov    DWORD PTR [rax+r15*1+0x10],r13d
    32de:	45 39 ca             	cmp    r10d,r9d
    32e1:	0f 8e 09 01 00 00    	jle    33f0 <main+0xe50>
    32e7:	49 63 d1             	movsxd rdx,r9d
    32ea:	44 8d 41 06          	lea    r8d,[rcx+0x6]
    32ee:	44 0f be 1c 13       	movsx  r11d,BYTE PTR [rbx+rdx*1]
    32f3:	41 83 eb 30          	sub    r11d,0x30
    32f7:	46 89 5c 38 14       	mov    DWORD PTR [rax+r15*1+0x14],r11d
    32fc:	45 39 c2             	cmp    r10d,r8d
    32ff:	0f 8e eb 00 00 00    	jle    33f0 <main+0xe50>
    3305:	49 63 f8             	movsxd rdi,r8d
    3308:	44 8d 71 07          	lea    r14d,[rcx+0x7]
    330c:	0f be 34 3b          	movsx  esi,BYTE PTR [rbx+rdi*1]
    3310:	83 ee 30             	sub    esi,0x30
    3313:	42 89 74 38 18       	mov    DWORD PTR [rax+r15*1+0x18],esi
    3318:	45 39 f2             	cmp    r10d,r14d
    331b:	0f 8e cf 00 00 00    	jle    33f0 <main+0xe50>
    3321:	4d 63 ee             	movsxd r13,r14d
    3324:	8d 51 08             	lea    edx,[rcx+0x8]
    3327:	46 0f be 0c 2b       	movsx  r9d,BYTE PTR [rbx+r13*1]
    332c:	41 83 e9 30          	sub    r9d,0x30
    3330:	46 89 4c 38 1c       	mov    DWORD PTR [rax+r15*1+0x1c],r9d
    3335:	41 39 d2             	cmp    r10d,edx
    3338:	0f 8e b2 00 00 00    	jle    33f0 <main+0xe50>
    333e:	4c 63 da             	movsxd r11,edx
    3341:	8d 79 09             	lea    edi,[rcx+0x9]
    3344:	46 0f be 04 1b       	movsx  r8d,BYTE PTR [rbx+r11*1]
    3349:	41 83 e8 30          	sub    r8d,0x30
    334d:	46 89 44 38 20       	mov    DWORD PTR [rax+r15*1+0x20],r8d
    3352:	41 39 fa             	cmp    r10d,edi
    3355:	0f 8e 95 00 00 00    	jle    33f0 <main+0xe50>
    335b:	48 63 f7             	movsxd rsi,edi
    335e:	44 8d 69 0a          	lea    r13d,[rcx+0xa]
    3362:	44 0f be 34 33       	movsx  r14d,BYTE PTR [rbx+rsi*1]
    3367:	41 83 ee 30          	sub    r14d,0x30
    336b:	46 89 74 38 24       	mov    DWORD PTR [rax+r15*1+0x24],r14d
    3370:	45 39 ea             	cmp    r10d,r13d
    3373:	7e 7b                	jle    33f0 <main+0xe50>
    3375:	4d 63 cd             	movsxd r9,r13d
    3378:	44 8d 59 0b          	lea    r11d,[rcx+0xb]
    337c:	42 0f be 14 0b       	movsx  edx,BYTE PTR [rbx+r9*1]
    3381:	83 ea 30             	sub    edx,0x30
    3384:	42 89 54 38 28       	mov    DWORD PTR [rax+r15*1+0x28],edx
    3389:	45 39 da             	cmp    r10d,r11d
    338c:	7e 62                	jle    33f0 <main+0xe50>
    338e:	4d 63 c3             	movsxd r8,r11d
    3391:	8d 71 0c             	lea    esi,[rcx+0xc]
    3394:	42 0f be 3c 03       	movsx  edi,BYTE PTR [rbx+r8*1]
    3399:	83 ef 30             	sub    edi,0x30
    339c:	42 89 7c 38 2c       	mov    DWORD PTR [rax+r15*1+0x2c],edi
    33a1:	41 39 f2             	cmp    r10d,esi
    33a4:	7e 4a                	jle    33f0 <main+0xe50>
    33a6:	4c 63 f6             	movsxd r14,esi
    33a9:	44 8d 49 0d          	lea    r9d,[rcx+0xd]
    33ad:	46 0f be 2c 33       	movsx  r13d,BYTE PTR [rbx+r14*1]
    33b2:	41 83 ed 30          	sub    r13d,0x30
    33b6:	46 89 6c 38 30       	mov    DWORD PTR [rax+r15*1+0x30],r13d
    33bb:	45 39 ca             	cmp    r10d,r9d
    33be:	7e 30                	jle    33f0 <main+0xe50>
    33c0:	49 63 d1             	movsxd rdx,r9d
    33c3:	83 c1 0e             	add    ecx,0xe
    33c6:	44 0f be 1c 13       	movsx  r11d,BYTE PTR [rbx+rdx*1]
    33cb:	41 83 eb 30          	sub    r11d,0x30
    33cf:	46 89 5c 38 34       	mov    DWORD PTR [rax+r15*1+0x34],r11d
    33d4:	41 39 ca             	cmp    r10d,ecx
    33d7:	7e 17                	jle    33f0 <main+0xe50>
    33d9:	4c 63 d1             	movsxd r10,ecx
    33dc:	42 0f be 1c 13       	movsx  ebx,BYTE PTR [rbx+r10*1]
    33e1:	83 eb 30             	sub    ebx,0x30
    33e4:	42 89 5c 38 38       	mov    DWORD PTR [rax+r15*1+0x38],ebx
    33e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    33f0:	48 8b 8d 58 fa ff ff 	mov    rcx,QWORD PTR [rbp-0x5a8]
    33f7:	48 8b 95 60 fa ff ff 	mov    rdx,QWORD PTR [rbp-0x5a0]
    33fe:	48 8b b5 78 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x588]
    3405:	48 8b bd 20 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x5e0]
    340c:	c5 f8 77             	vzeroupper 
    340f:	e8 5c 2e 00 00       	call   6270 <make_equidistant>
    3414:	8b 9d f0 fa ff ff    	mov    ebx,DWORD PTR [rbp-0x510]
    341a:	8b 85 ec fa ff ff    	mov    eax,DWORD PTR [rbp-0x514]
    3420:	be 08 00 00 00       	mov    esi,0x8
    3425:	39 c3                	cmp    ebx,eax
    3427:	0f 4d c3             	cmovge eax,ebx
    342a:	4c 63 f8             	movsxd r15,eax
    342d:	47 8d 44 3f ff       	lea    r8d,[r15+r15*1-0x1]
    3432:	4d 63 f0             	movsxd r14,r8d
    3435:	4c 89 f7             	mov    rdi,r14
    3438:	e8 23 f0 ff ff       	call   2460 <calloc@plt>
    343d:	4c 89 f7             	mov    rdi,r14
    3440:	be 08 00 00 00       	mov    esi,0x8
    3445:	48 89 85 50 fa ff ff 	mov    QWORD PTR [rbp-0x5b0],rax
    344c:	e8 0f f0 ff ff       	call   2460 <calloc@plt>
    3451:	be 04 00 00 00       	mov    esi,0x4
    3456:	4c 89 ff             	mov    rdi,r15
    3459:	48 89 85 48 fa ff ff 	mov    QWORD PTR [rbp-0x5b8],rax
    3460:	e8 fb ef ff ff       	call   2460 <calloc@plt>
    3465:	be 04 00 00 00       	mov    esi,0x4
    346a:	4c 89 ff             	mov    rdi,r15
    346d:	49 89 c5             	mov    r13,rax
    3470:	e8 eb ef ff ff       	call   2460 <calloc@plt>
    3475:	49 89 c6             	mov    r14,rax
    3478:	44 89 f8             	mov    eax,r15d
    347b:	83 e8 01             	sub    eax,0x1
    347e:	0f 88 3b 04 00 00    	js     38bf <main+0x131f>
    3484:	4e 8d 1c bd 00 00 00 	lea    r11,[r15*4+0x0]
    348b:	00 
    348c:	48 8b 9d f8 fa ff ff 	mov    rbx,QWORD PTR [rbp-0x508]
    3493:	45 89 fa             	mov    r10d,r15d
    3496:	48 8b bd 00 fb ff ff 	mov    rdi,QWORD PTR [rbp-0x500]
    349d:	49 8d 4b f8          	lea    rcx,[r11-0x8]
    34a1:	44 89 bd 68 fa ff ff 	mov    DWORD PTR [rbp-0x598],r15d
    34a8:	4d 89 df             	mov    r15,r11
    34ab:	4d 8d 4b fc          	lea    r9,[r11-0x4]
    34af:	48 89 8d 38 fa ff ff 	mov    QWORD PTR [rbp-0x5c8],rcx
    34b6:	4c 8d 1c 0b          	lea    r11,[rbx+rcx*1]
    34ba:	49 8d 4f c0          	lea    rcx,[r15-0x40]
    34be:	4c 89 bd 70 fa ff ff 	mov    QWORD PTR [rbp-0x590],r15
    34c5:	49 8d 54 0d 00       	lea    rdx,[r13+rcx*1+0x0]
    34ca:	49 01 ff             	add    r15,rdi
    34cd:	4c 8b 85 70 fa ff ff 	mov    r8,QWORD PTR [rbp-0x590]
    34d4:	4b 8d 34 0e          	lea    rsi,[r14+r9*1]
    34d8:	4c 39 fa             	cmp    rdx,r15
    34db:	41 0f 93 c7          	setae  r15b
    34df:	48 89 b5 40 fa ff ff 	mov    QWORD PTR [rbp-0x5c0],rsi
    34e6:	4d 01 e8             	add    r8,r13
    34e9:	48 8d 34 0f          	lea    rsi,[rdi+rcx*1]
    34ed:	4c 39 c6             	cmp    rsi,r8
    34f0:	41 0f 93 c0          	setae  r8b
    34f4:	45 09 f8             	or     r8d,r15d
    34f7:	83 f8 06             	cmp    eax,0x6
    34fa:	41 0f 97 c7          	seta   r15b
    34fe:	45 21 f8             	and    r8d,r15d
    3501:	4d 89 ef             	mov    r15,r13
    3504:	4d 29 df             	sub    r15,r11
    3507:	4f 8d 4c 0f 38       	lea    r9,[r15+r9*1+0x38]
    350c:	49 83 f9 38          	cmp    r9,0x38
    3510:	4c 8b 8d 40 fa ff ff 	mov    r9,QWORD PTR [rbp-0x5c0]
    3517:	41 0f 97 c7          	seta   r15b
    351b:	45 21 f8             	and    r8d,r15d
    351e:	4d 89 cf             	mov    r15,r9
    3521:	4d 29 df             	sub    r15,r11
    3524:	49 83 c7 38          	add    r15,0x38
    3528:	49 83 ff 38          	cmp    r15,0x38
    352c:	41 0f 97 c3          	seta   r11b
    3530:	45 84 d8             	test   r8b,r11b
    3533:	0f 84 37 0a 00 00    	je     3f70 <main+0x19d0>
    3539:	4c 8b 85 38 fa ff ff 	mov    r8,QWORD PTR [rbp-0x5c8]
    3540:	49 01 f8             	add    r8,rdi
    3543:	4d 29 c1             	sub    r9,r8
    3546:	49 83 c1 38          	add    r9,0x38
    354a:	49 83 f9 38          	cmp    r9,0x38
    354e:	0f 86 1c 0a 00 00    	jbe    3f70 <main+0x19d0>
    3554:	83 f8 0e             	cmp    eax,0xe
    3557:	0f 86 0f 0e 00 00    	jbe    436c <main+0x1dcc>
    355d:	41 c1 ea 04          	shr    r10d,0x4
    3561:	4c 8d 3c 0b          	lea    r15,[rbx+rcx*1]
    3565:	45 31 db             	xor    r11d,r11d
    3568:	4c 01 f1             	add    rcx,r14
    356b:	49 f7 da             	neg    r10
    356e:	49 c1 e2 06          	shl    r10,0x6
    3572:	4d 89 d1             	mov    r9,r10
    3575:	49 f7 d9             	neg    r9
    3578:	49 83 e9 40          	sub    r9,0x40
    357c:	49 c1 e9 06          	shr    r9,0x6
    3580:	49 83 c1 01          	add    r9,0x1
    3584:	41 83 e1 07          	and    r9d,0x7
    3588:	0f 84 f9 00 00 00    	je     3687 <main+0x10e7>
    358e:	49 83 f9 01          	cmp    r9,0x1
    3592:	0f 84 c6 00 00 00    	je     365e <main+0x10be>
    3598:	49 83 f9 02          	cmp    r9,0x2
    359c:	0f 84 9c 00 00 00    	je     363e <main+0x109e>
    35a2:	49 83 f9 03          	cmp    r9,0x3
    35a6:	74 76                	je     361e <main+0x107e>
    35a8:	49 83 f9 04          	cmp    r9,0x4
    35ac:	74 50                	je     35fe <main+0x105e>
    35ae:	49 83 f9 05          	cmp    r9,0x5
    35b2:	74 2a                	je     35de <main+0x103e>
    35b4:	49 83 f9 06          	cmp    r9,0x6
    35b8:	0f 85 8a 0d 00 00    	jne    4348 <main+0x1da8>
    35be:	62 91 7e 48 6f 14 1f 	vmovdqu32 zmm2,ZMMWORD PTR [r15+r11*1]
    35c5:	62 b1 7e 48 7f 14 1a 	vmovdqu32 ZMMWORD PTR [rdx+r11*1],zmm2
    35cc:	62 b1 7e 48 6f 1c 1e 	vmovdqu32 zmm3,ZMMWORD PTR [rsi+r11*1]
    35d3:	62 b1 7e 48 7f 1c 19 	vmovdqu32 ZMMWORD PTR [rcx+r11*1],zmm3
    35da:	49 83 eb 40          	sub    r11,0x40
    35de:	62 91 7e 48 6f 3c 1f 	vmovdqu32 zmm7,ZMMWORD PTR [r15+r11*1]
    35e5:	62 b1 7e 48 7f 3c 1a 	vmovdqu32 ZMMWORD PTR [rdx+r11*1],zmm7
    35ec:	62 b1 7e 48 6f 2c 1e 	vmovdqu32 zmm5,ZMMWORD PTR [rsi+r11*1]
    35f3:	62 b1 7e 48 7f 2c 19 	vmovdqu32 ZMMWORD PTR [rcx+r11*1],zmm5
    35fa:	49 83 eb 40          	sub    r11,0x40
    35fe:	62 91 7e 48 6f 24 1f 	vmovdqu32 zmm4,ZMMWORD PTR [r15+r11*1]
    3605:	62 b1 7e 48 7f 24 1a 	vmovdqu32 ZMMWORD PTR [rdx+r11*1],zmm4
    360c:	62 b1 7e 48 6f 34 1e 	vmovdqu32 zmm6,ZMMWORD PTR [rsi+r11*1]
    3613:	62 b1 7e 48 7f 34 19 	vmovdqu32 ZMMWORD PTR [rcx+r11*1],zmm6
    361a:	49 83 eb 40          	sub    r11,0x40
    361e:	62 11 7e 48 6f 04 1f 	vmovdqu32 zmm8,ZMMWORD PTR [r15+r11*1]
    3625:	62 31 7e 48 7f 04 1a 	vmovdqu32 ZMMWORD PTR [rdx+r11*1],zmm8
    362c:	62 31 7e 48 6f 0c 1e 	vmovdqu32 zmm9,ZMMWORD PTR [rsi+r11*1]
    3633:	62 31 7e 48 7f 0c 19 	vmovdqu32 ZMMWORD PTR [rcx+r11*1],zmm9
    363a:	49 83 eb 40          	sub    r11,0x40
    363e:	62 11 7e 48 6f 14 1f 	vmovdqu32 zmm10,ZMMWORD PTR [r15+r11*1]
    3645:	62 31 7e 48 7f 14 1a 	vmovdqu32 ZMMWORD PTR [rdx+r11*1],zmm10
    364c:	62 31 7e 48 6f 1c 1e 	vmovdqu32 zmm11,ZMMWORD PTR [rsi+r11*1]
    3653:	62 31 7e 48 7f 1c 19 	vmovdqu32 ZMMWORD PTR [rcx+r11*1],zmm11
    365a:	49 83 eb 40          	sub    r11,0x40
    365e:	62 11 7e 48 6f 24 1f 	vmovdqu32 zmm12,ZMMWORD PTR [r15+r11*1]
    3665:	62 31 7e 48 7f 24 1a 	vmovdqu32 ZMMWORD PTR [rdx+r11*1],zmm12
    366c:	62 b1 7e 48 6f 0c 1e 	vmovdqu32 zmm1,ZMMWORD PTR [rsi+r11*1]
    3673:	62 b1 7e 48 7f 0c 19 	vmovdqu32 ZMMWORD PTR [rcx+r11*1],zmm1
    367a:	49 83 eb 40          	sub    r11,0x40
    367e:	4d 39 da             	cmp    r10,r11
    3681:	0f 84 0c 01 00 00    	je     3793 <main+0x11f3>
    3687:	62 11 7e 48 6f 2c 1f 	vmovdqu32 zmm13,ZMMWORD PTR [r15+r11*1]
    368e:	62 31 7e 48 7f 2c 1a 	vmovdqu32 ZMMWORD PTR [rdx+r11*1],zmm13
    3695:	62 31 7e 48 6f 34 1e 	vmovdqu32 zmm14,ZMMWORD PTR [rsi+r11*1]
    369c:	62 31 7e 48 7f 34 19 	vmovdqu32 ZMMWORD PTR [rcx+r11*1],zmm14
    36a3:	62 11 7e 48 6f 7c 1f 	vmovdqu32 zmm15,ZMMWORD PTR [r15+r11*1-0x40]
    36aa:	ff 
    36ab:	62 31 7e 48 7f 7c 1a 	vmovdqu32 ZMMWORD PTR [rdx+r11*1-0x40],zmm15
    36b2:	ff 
    36b3:	62 b1 7e 48 6f 44 1e 	vmovdqu32 zmm0,ZMMWORD PTR [rsi+r11*1-0x40]
    36ba:	ff 
    36bb:	62 b1 7e 48 7f 44 19 	vmovdqu32 ZMMWORD PTR [rcx+r11*1-0x40],zmm0
    36c2:	ff 
    36c3:	62 91 7e 48 6f 54 1f 	vmovdqu32 zmm2,ZMMWORD PTR [r15+r11*1-0x80]
    36ca:	fe 
    36cb:	62 b1 7e 48 7f 54 1a 	vmovdqu32 ZMMWORD PTR [rdx+r11*1-0x80],zmm2
    36d2:	fe 
    36d3:	62 b1 7e 48 6f 5c 1e 	vmovdqu32 zmm3,ZMMWORD PTR [rsi+r11*1-0x80]
    36da:	fe 
    36db:	62 b1 7e 48 7f 5c 19 	vmovdqu32 ZMMWORD PTR [rcx+r11*1-0x80],zmm3
    36e2:	fe 
    36e3:	62 91 7e 48 6f 7c 1f 	vmovdqu32 zmm7,ZMMWORD PTR [r15+r11*1-0xc0]
    36ea:	fd 
    36eb:	62 b1 7e 48 7f 7c 1a 	vmovdqu32 ZMMWORD PTR [rdx+r11*1-0xc0],zmm7
    36f2:	fd 
    36f3:	62 b1 7e 48 6f 6c 1e 	vmovdqu32 zmm5,ZMMWORD PTR [rsi+r11*1-0xc0]
    36fa:	fd 
    36fb:	62 b1 7e 48 7f 6c 19 	vmovdqu32 ZMMWORD PTR [rcx+r11*1-0xc0],zmm5
    3702:	fd 
    3703:	62 91 7e 48 6f 64 1f 	vmovdqu32 zmm4,ZMMWORD PTR [r15+r11*1-0x100]
    370a:	fc 
    370b:	62 b1 7e 48 7f 64 1a 	vmovdqu32 ZMMWORD PTR [rdx+r11*1-0x100],zmm4
    3712:	fc 
    3713:	62 b1 7e 48 6f 74 1e 	vmovdqu32 zmm6,ZMMWORD PTR [rsi+r11*1-0x100]
    371a:	fc 
    371b:	62 b1 7e 48 7f 74 19 	vmovdqu32 ZMMWORD PTR [rcx+r11*1-0x100],zmm6
    3722:	fc 
    3723:	62 11 7e 48 6f 44 1f 	vmovdqu32 zmm8,ZMMWORD PTR [r15+r11*1-0x140]
    372a:	fb 
    372b:	62 31 7e 48 7f 44 1a 	vmovdqu32 ZMMWORD PTR [rdx+r11*1-0x140],zmm8
    3732:	fb 
    3733:	62 31 7e 48 6f 4c 1e 	vmovdqu32 zmm9,ZMMWORD PTR [rsi+r11*1-0x140]
    373a:	fb 
    373b:	62 31 7e 48 7f 4c 19 	vmovdqu32 ZMMWORD PTR [rcx+r11*1-0x140],zmm9
    3742:	fb 
    3743:	62 11 7e 48 6f 54 1f 	vmovdqu32 zmm10,ZMMWORD PTR [r15+r11*1-0x180]
    374a:	fa 
    374b:	62 31 7e 48 7f 54 1a 	vmovdqu32 ZMMWORD PTR [rdx+r11*1-0x180],zmm10
    3752:	fa 
    3753:	62 31 7e 48 6f 5c 1e 	vmovdqu32 zmm11,ZMMWORD PTR [rsi+r11*1-0x180]
    375a:	fa 
    375b:	62 31 7e 48 7f 5c 19 	vmovdqu32 ZMMWORD PTR [rcx+r11*1-0x180],zmm11
    3762:	fa 
    3763:	62 11 7e 48 6f 64 1f 	vmovdqu32 zmm12,ZMMWORD PTR [r15+r11*1-0x1c0]
    376a:	f9 
    376b:	62 31 7e 48 7f 64 1a 	vmovdqu32 ZMMWORD PTR [rdx+r11*1-0x1c0],zmm12
    3772:	f9 
    3773:	62 b1 7e 48 6f 4c 1e 	vmovdqu32 zmm1,ZMMWORD PTR [rsi+r11*1-0x1c0]
    377a:	f9 
    377b:	62 b1 7e 48 7f 4c 19 	vmovdqu32 ZMMWORD PTR [rcx+r11*1-0x1c0],zmm1
    3782:	f9 
    3783:	49 81 eb 00 02 00 00 	sub    r11,0x200
    378a:	4d 39 da             	cmp    r10,r11
    378d:	0f 85 f4 fe ff ff    	jne    3687 <main+0x10e7>
    3793:	44 8b 95 68 fa ff ff 	mov    r10d,DWORD PTR [rbp-0x598]
    379a:	44 89 d1             	mov    ecx,r10d
    379d:	83 e1 f0             	and    ecx,0xfffffff0
    37a0:	29 c8                	sub    eax,ecx
    37a2:	41 39 ca             	cmp    r10d,ecx
    37a5:	0f 84 bd 07 00 00    	je     3f68 <main+0x19c8>
    37ab:	41 29 ca             	sub    r10d,ecx
    37ae:	41 8d 72 ff          	lea    esi,[r10-0x1]
    37b2:	83 fe 06             	cmp    esi,0x6
    37b5:	76 3c                	jbe    37f3 <main+0x1253>
    37b7:	48 8b 95 70 fa ff ff 	mov    rdx,QWORD PTR [rbp-0x590]
    37be:	83 c1 01             	add    ecx,0x1
    37c1:	48 f7 d9             	neg    rcx
    37c4:	4c 8d 44 8a e4       	lea    r8,[rdx+rcx*4-0x1c]
    37c9:	44 89 d1             	mov    ecx,r10d
    37cc:	c4 21 7e 6f 2c 03    	vmovdqu ymm13,YMMWORD PTR [rbx+r8*1]
    37d2:	83 e1 f8             	and    ecx,0xfffffff8
    37d5:	29 c8                	sub    eax,ecx
    37d7:	c4 01 7e 7f 6c 05 00 	vmovdqu YMMWORD PTR [r13+r8*1+0x0],ymm13
    37de:	c4 21 7e 6f 34 07    	vmovdqu ymm14,YMMWORD PTR [rdi+r8*1]
    37e4:	c4 01 7e 7f 34 06    	vmovdqu YMMWORD PTR [r14+r8*1],ymm14
    37ea:	44 39 d1             	cmp    ecx,r10d
    37ed:	0f 84 75 07 00 00    	je     3f68 <main+0x19c8>
    37f3:	4c 63 f8             	movsxd r15,eax
    37f6:	46 8b 1c bb          	mov    r11d,DWORD PTR [rbx+r15*4]
    37fa:	4e 8d 0c bd 00 00 00 	lea    r9,[r15*4+0x0]
    3801:	00 
    3802:	47 89 5c bd 00       	mov    DWORD PTR [r13+r15*4+0x0],r11d
    3807:	46 8b 14 bf          	mov    r10d,DWORD PTR [rdi+r15*4]
    380b:	47 89 14 be          	mov    DWORD PTR [r14+r15*4],r10d
    380f:	85 c0                	test   eax,eax
    3811:	0f 84 51 07 00 00    	je     3f68 <main+0x19c8>
    3817:	42 8b 74 0b fc       	mov    esi,DWORD PTR [rbx+r9*1-0x4]
    381c:	43 89 74 0d fc       	mov    DWORD PTR [r13+r9*1-0x4],esi
    3821:	42 8b 54 0f fc       	mov    edx,DWORD PTR [rdi+r9*1-0x4]
    3826:	43 89 54 0e fc       	mov    DWORD PTR [r14+r9*1-0x4],edx
    382b:	83 f8 01             	cmp    eax,0x1
    382e:	0f 84 34 07 00 00    	je     3f68 <main+0x19c8>
    3834:	46 8b 44 0b f8       	mov    r8d,DWORD PTR [rbx+r9*1-0x8]
    3839:	47 89 44 0d f8       	mov    DWORD PTR [r13+r9*1-0x8],r8d
    383e:	42 8b 4c 0f f8       	mov    ecx,DWORD PTR [rdi+r9*1-0x8]
    3843:	43 89 4c 0e f8       	mov    DWORD PTR [r14+r9*1-0x8],ecx
    3848:	83 f8 02             	cmp    eax,0x2
    384b:	0f 84 17 07 00 00    	je     3f68 <main+0x19c8>
    3851:	46 8b 7c 0b f4       	mov    r15d,DWORD PTR [rbx+r9*1-0xc]
    3856:	47 89 7c 0d f4       	mov    DWORD PTR [r13+r9*1-0xc],r15d
    385b:	46 8b 5c 0f f4       	mov    r11d,DWORD PTR [rdi+r9*1-0xc]
    3860:	47 89 5c 0e f4       	mov    DWORD PTR [r14+r9*1-0xc],r11d
    3865:	83 f8 03             	cmp    eax,0x3
    3868:	0f 84 fa 06 00 00    	je     3f68 <main+0x19c8>
    386e:	46 8b 54 0b f0       	mov    r10d,DWORD PTR [rbx+r9*1-0x10]
    3873:	47 89 54 0d f0       	mov    DWORD PTR [r13+r9*1-0x10],r10d
    3878:	42 8b 74 0f f0       	mov    esi,DWORD PTR [rdi+r9*1-0x10]
    387d:	43 89 74 0e f0       	mov    DWORD PTR [r14+r9*1-0x10],esi
    3882:	83 f8 04             	cmp    eax,0x4
    3885:	0f 84 dd 06 00 00    	je     3f68 <main+0x19c8>
    388b:	42 8b 54 0b ec       	mov    edx,DWORD PTR [rbx+r9*1-0x14]
    3890:	43 89 54 0d ec       	mov    DWORD PTR [r13+r9*1-0x14],edx
    3895:	46 8b 44 0f ec       	mov    r8d,DWORD PTR [rdi+r9*1-0x14]
    389a:	47 89 44 0e ec       	mov    DWORD PTR [r14+r9*1-0x14],r8d
    389f:	83 f8 05             	cmp    eax,0x5
    38a2:	0f 84 c0 06 00 00    	je     3f68 <main+0x19c8>
    38a8:	42 8b 44 0b e8       	mov    eax,DWORD PTR [rbx+r9*1-0x18]
    38ad:	43 89 44 0d e8       	mov    DWORD PTR [r13+r9*1-0x18],eax
    38b2:	42 8b 5c 0f e8       	mov    ebx,DWORD PTR [rdi+r9*1-0x18]
    38b7:	43 89 5c 0e e8       	mov    DWORD PTR [r14+r9*1-0x18],ebx
    38bc:	c5 f8 77             	vzeroupper 
    38bf:	48 8b b5 60 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x5a0]
    38c6:	4c 89 ef             	mov    rdi,r13
    38c9:	e8 32 1e 00 00       	call   5700 <returnLimbs>
    38ce:	48 8b b5 58 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x5a8]
    38d5:	4c 89 f7             	mov    rdi,r14
    38d8:	49 89 c7             	mov    r15,rax
    38db:	e8 20 1e 00 00       	call   5700 <returnLimbs>
    38e0:	41 0f 18 0f          	prefetcht0 BYTE PTR [r15]
    38e4:	c5 79 6e bd f0 fa ff 	vmovd  xmm15,DWORD PTR [rbp-0x510]
    38eb:	ff 
    38ec:	c5 f9 6e 85 ec fa ff 	vmovd  xmm0,DWORD PTR [rbp-0x514]
    38f3:	ff 
    38f4:	c4 e2 01 3d d0       	vpmaxsd xmm2,xmm15,xmm0
    38f9:	48 89 85 70 fa ff ff 	mov    QWORD PTR [rbp-0x590],rax
    3900:	48 8b 95 70 fa ff ff 	mov    rdx,QWORD PTR [rbp-0x590]
    3907:	c5 f9 7e 95 68 fa ff 	vmovd  DWORD PTR [rbp-0x598],xmm2
    390e:	ff 
    390f:	c5 f9 7e d7          	vmovd  edi,xmm2
    3913:	8d 5c 3f ff          	lea    ebx,[rdi+rdi*1-0x1]
    3917:	0f 18 0a             	prefetcht0 BYTE PTR [rdx]
    391a:	89 9d f4 fa ff ff    	mov    DWORD PTR [rbp-0x50c],ebx
    3920:	48 8b 9d d8 fa ff ff 	mov    rbx,QWORD PTR [rbp-0x528]
    3927:	49 89 dd             	mov    r13,rbx
    392a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    3930:	44 8b 33             	mov    r14d,DWORD PTR [rbx]
    3933:	31 d2                	xor    edx,edx
    3935:	be 03 24 00 00       	mov    esi,0x2403
    393a:	31 c0                	xor    eax,eax
    393c:	48 83 c3 04          	add    rbx,0x4
    3940:	44 89 f7             	mov    edi,r14d
    3943:	e8 c8 ea ff ff       	call   2410 <ioctl@plt>
    3948:	31 d2                	xor    edx,edx
    394a:	be 00 24 00 00       	mov    esi,0x2400
    394f:	44 89 f7             	mov    edi,r14d
    3952:	31 c0                	xor    eax,eax
    3954:	e8 b7 ea ff ff       	call   2410 <ioctl@plt>
    3959:	49 39 dc             	cmp    r12,rbx
    395c:	75 d2                	jne    3930 <main+0x1390>
    395e:	4c 8b 8d 28 fa ff ff 	mov    r9,QWORD PTR [rbp-0x5d8]
    3965:	4c 8b 85 48 fa ff ff 	mov    r8,QWORD PTR [rbp-0x5b8]
    396c:	4c 89 ff             	mov    rdi,r15
    396f:	48 8b 8d 50 fa ff ff 	mov    rcx,QWORD PTR [rbp-0x5b0]
    3976:	8b 95 68 fa ff ff    	mov    edx,DWORD PTR [rbp-0x598]
    397c:	48 8b b5 70 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x590]
    3983:	e8 68 0f 00 00       	call   48f0 <urdhva>
    3988:	4c 8b bd d8 fa ff ff 	mov    r15,QWORD PTR [rbp-0x528]
    398f:	48 89 85 70 fa ff ff 	mov    QWORD PTR [rbp-0x590],rax
    3996:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    399d:	00 00 00 
    39a0:	41 8b 3f             	mov    edi,DWORD PTR [r15]
    39a3:	31 d2                	xor    edx,edx
    39a5:	31 c0                	xor    eax,eax
    39a7:	be 01 24 00 00       	mov    esi,0x2401
    39ac:	e8 5f ea ff ff       	call   2410 <ioctl@plt>
    39b1:	83 f8 ff             	cmp    eax,0xffffffff
    39b4:	0f 84 23 0a 00 00    	je     43dd <main+0x1e3d>
    39ba:	49 83 c7 04          	add    r15,0x4
    39be:	4d 39 fc             	cmp    r12,r15
    39c1:	75 dd                	jne    39a0 <main+0x1400>
    39c3:	4c 8b b5 a8 fa ff ff 	mov    r14,QWORD PTR [rbp-0x558]
    39ca:	48 8b 9d d8 fa ff ff 	mov    rbx,QWORD PTR [rbp-0x528]
    39d1:	4c 8b bd 88 fa ff ff 	mov    r15,QWORD PTR [rbp-0x578]
    39d8:	4c 89 b5 68 fa ff ff 	mov    QWORD PTR [rbp-0x598],r14
    39df:	90                   	nop
    39e0:	8b 3b                	mov    edi,DWORD PTR [rbx]
    39e2:	ba 08 00 00 00       	mov    edx,0x8
    39e7:	4c 89 f6             	mov    rsi,r14
    39ea:	e8 41 ea ff ff       	call   2430 <read@plt>
    39ef:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
    39f3:	0f 84 ce 09 00 00    	je     43c7 <main+0x1e27>
    39f9:	49 83 c6 08          	add    r14,0x8
    39fd:	48 83 c3 04          	add    rbx,0x4
    3a01:	4d 39 f7             	cmp    r15,r14
    3a04:	75 da                	jne    39e0 <main+0x1440>
    3a06:	4c 89 a5 50 fa ff ff 	mov    QWORD PTR [rbp-0x5b0],r12
    3a0d:	48 8b 9d a8 fa ff ff 	mov    rbx,QWORD PTR [rbp-0x558]
    3a14:	4c 8d 35 b5 36 00 00 	lea    r14,[rip+0x36b5]        # 70d0 <_IO_stdin_used+0xd0>
    3a1b:	4c 8b bd 80 fa ff ff 	mov    r15,QWORD PTR [rbp-0x580]
    3a22:	4c 8b a5 88 fa ff ff 	mov    r12,QWORD PTR [rbp-0x578]
    3a29:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    3a30:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
    3a33:	4c 89 f2             	mov    rdx,r14
    3a36:	be 01 00 00 00       	mov    esi,0x1
    3a3b:	4c 89 ff             	mov    rdi,r15
    3a3e:	31 c0                	xor    eax,eax
    3a40:	48 83 c3 08          	add    rbx,0x8
    3a44:	e8 e7 ea ff ff       	call   2530 <__fprintf_chk@plt>
    3a49:	49 39 dc             	cmp    r12,rbx
    3a4c:	75 e2                	jne    3a30 <main+0x1490>
    3a4e:	48 8b b5 80 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x580]
    3a55:	bf 0a 00 00 00       	mov    edi,0xa
    3a5a:	48 8b 9d 68 fa ff ff 	mov    rbx,QWORD PTR [rbp-0x598]
    3a61:	4c 8b a5 50 fa ff ff 	mov    r12,QWORD PTR [rbp-0x5b0]
    3a68:	e8 b3 e9 ff ff       	call   2420 <fputc@plt>
    3a6d:	8b b5 f4 fa ff ff    	mov    esi,DWORD PTR [rbp-0x50c]
    3a73:	48 8b bd 70 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x590]
    3a7a:	e8 01 1a 00 00       	call   5480 <formatUrdhvaResult>
    3a7f:	4c 8b 9d d8 fa ff ff 	mov    r11,QWORD PTR [rbp-0x528]
    3a86:	4c 89 ad 68 fa ff ff 	mov    QWORD PTR [rbp-0x598],r13
    3a8d:	48 89 9d 50 fa ff ff 	mov    QWORD PTR [rbp-0x5b0],rbx
    3a94:	49 89 c7             	mov    r15,rax
    3a97:	4c 89 db             	mov    rbx,r11
    3a9a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    3aa0:	44 8b 2b             	mov    r13d,DWORD PTR [rbx]
    3aa3:	31 d2                	xor    edx,edx
    3aa5:	be 03 24 00 00       	mov    esi,0x2403
    3aaa:	31 c0                	xor    eax,eax
    3aac:	48 83 c3 04          	add    rbx,0x4
    3ab0:	44 89 ef             	mov    edi,r13d
    3ab3:	e8 58 e9 ff ff       	call   2410 <ioctl@plt>
    3ab8:	31 d2                	xor    edx,edx
    3aba:	be 00 24 00 00       	mov    esi,0x2400
    3abf:	44 89 ef             	mov    edi,r13d
    3ac2:	31 c0                	xor    eax,eax
    3ac4:	e8 47 e9 ff ff       	call   2410 <ioctl@plt>
    3ac9:	49 39 dc             	cmp    r12,rbx
    3acc:	75 d2                	jne    3aa0 <main+0x1500>
    3ace:	48 8b 95 98 fa ff ff 	mov    rdx,QWORD PTR [rbp-0x568]
    3ad5:	48 8b b5 a0 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x560]
    3adc:	48 8b bd 90 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x570]
    3ae3:	48 8b 9d 50 fa ff ff 	mov    rbx,QWORD PTR [rbp-0x5b0]
    3aea:	4c 8b ad 68 fa ff ff 	mov    r13,QWORD PTR [rbp-0x598]
    3af1:	e8 da e8 ff ff       	call   23d0 <__gmpz_mul@plt>
    3af6:	4c 8b 95 d8 fa ff ff 	mov    r10,QWORD PTR [rbp-0x528]
    3afd:	48 89 9d 68 fa ff ff 	mov    QWORD PTR [rbp-0x598],rbx
    3b04:	4c 89 d3             	mov    rbx,r10
    3b07:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    3b0e:	00 00 
    3b10:	8b 3b                	mov    edi,DWORD PTR [rbx]
    3b12:	31 d2                	xor    edx,edx
    3b14:	31 c0                	xor    eax,eax
    3b16:	be 01 24 00 00       	mov    esi,0x2401
    3b1b:	e8 f0 e8 ff ff       	call   2410 <ioctl@plt>
    3b20:	83 f8 ff             	cmp    eax,0xffffffff
    3b23:	0f 84 b4 08 00 00    	je     43dd <main+0x1e3d>
    3b29:	48 83 c3 04          	add    rbx,0x4
    3b2d:	49 39 dc             	cmp    r12,rbx
    3b30:	75 de                	jne    3b10 <main+0x1570>
    3b32:	4c 89 a5 50 fa ff ff 	mov    QWORD PTR [rbp-0x5b0],r12
    3b39:	48 8b 9d a8 fa ff ff 	mov    rbx,QWORD PTR [rbp-0x558]
    3b40:	4d 89 ec             	mov    r12,r13
    3b43:	4c 8b ad 88 fa ff ff 	mov    r13,QWORD PTR [rbp-0x578]
    3b4a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    3b50:	41 8b 3c 24          	mov    edi,DWORD PTR [r12]
    3b54:	ba 08 00 00 00       	mov    edx,0x8
    3b59:	48 89 de             	mov    rsi,rbx
    3b5c:	e8 cf e8 ff ff       	call   2430 <read@plt>
    3b61:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
    3b65:	0f 84 5c 08 00 00    	je     43c7 <main+0x1e27>
    3b6b:	48 83 c3 08          	add    rbx,0x8
    3b6f:	49 83 c4 04          	add    r12,0x4
    3b73:	49 39 dd             	cmp    r13,rbx
    3b76:	75 d8                	jne    3b50 <main+0x15b0>
    3b78:	48 8b b5 50 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x5b0]
    3b7f:	4c 89 eb             	mov    rbx,r13
    3b82:	4c 8b a5 68 fa ff ff 	mov    r12,QWORD PTR [rbp-0x598]
    3b89:	4c 8b ad d0 fa ff ff 	mov    r13,QWORD PTR [rbp-0x530]
    3b90:	48 89 b5 88 fa ff ff 	mov    QWORD PTR [rbp-0x578],rsi
    3b97:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    3b9e:	00 00 
    3ba0:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    3ba4:	4c 89 f2             	mov    rdx,r14
    3ba7:	be 01 00 00 00       	mov    esi,0x1
    3bac:	4c 89 ef             	mov    rdi,r13
    3baf:	31 c0                	xor    eax,eax
    3bb1:	49 83 c4 08          	add    r12,0x8
    3bb5:	e8 76 e9 ff ff       	call   2530 <__fprintf_chk@plt>
    3bba:	4c 39 e3             	cmp    rbx,r12
    3bbd:	75 e1                	jne    3ba0 <main+0x1600>
    3bbf:	4c 89 ee             	mov    rsi,r13
    3bc2:	bf 0a 00 00 00       	mov    edi,0xa
    3bc7:	4c 89 ad d0 fa ff ff 	mov    QWORD PTR [rbp-0x530],r13
    3bce:	4c 8b a5 88 fa ff ff 	mov    r12,QWORD PTR [rbp-0x578]
    3bd5:	48 89 9d 88 fa ff ff 	mov    QWORD PTR [rbp-0x578],rbx
    3bdc:	e8 3f e8 ff ff       	call   2420 <fputc@plt>
    3be1:	48 8b 95 90 fa ff ff 	mov    rdx,QWORD PTR [rbp-0x570]
    3be8:	31 ff                	xor    edi,edi
    3bea:	be 0a 00 00 00       	mov    esi,0xa
    3bef:	e8 ac e7 ff ff       	call   23a0 <__gmpz_get_str@plt>
    3bf4:	48 89 c7             	mov    rdi,rax
    3bf7:	49 89 c5             	mov    r13,rax
    3bfa:	e8 91 e7 ff ff       	call   2390 <strlen@plt>
    3bff:	85 c0                	test   eax,eax
    3c01:	0f 8e 19 02 00 00    	jle    3e20 <main+0x1880>
    3c07:	44 8d 40 ff          	lea    r8d,[rax-0x1]
    3c0b:	45 31 db             	xor    r11d,r11d
    3c0e:	4d 89 c1             	mov    r9,r8
    3c11:	41 83 e1 07          	and    r9d,0x7
    3c15:	0f 84 0f 01 00 00    	je     3d2a <main+0x178a>
    3c1b:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
    3c20:	31 c9                	xor    ecx,ecx
    3c22:	4d 89 fe             	mov    r14,r15
    3c25:	4c 89 eb             	mov    rbx,r13
    3c28:	41 38 07             	cmp    BYTE PTR [r15],al
    3c2b:	0f 85 2f 02 00 00    	jne    3e60 <main+0x18c0>
    3c31:	bf 01 00 00 00       	mov    edi,0x1
    3c36:	41 bb 01 00 00 00    	mov    r11d,0x1
    3c3c:	49 83 f9 01          	cmp    r9,0x1
    3c40:	0f 84 e4 00 00 00    	je     3d2a <main+0x178a>
    3c46:	49 83 f9 02          	cmp    r9,0x2
    3c4a:	0f 84 ba 00 00 00    	je     3d0a <main+0x176a>
    3c50:	49 83 f9 03          	cmp    r9,0x3
    3c54:	0f 84 90 00 00 00    	je     3cea <main+0x174a>
    3c5a:	49 83 f9 04          	cmp    r9,0x4
    3c5e:	74 6a                	je     3cca <main+0x172a>
    3c60:	49 83 f9 05          	cmp    r9,0x5
    3c64:	74 44                	je     3caa <main+0x170a>
    3c66:	49 83 f9 06          	cmp    r9,0x6
    3c6a:	74 1e                	je     3c8a <main+0x16ea>
    3c6c:	41 0f b6 55 01       	movzx  edx,BYTE PTR [r13+0x1]
    3c71:	89 f9                	mov    ecx,edi
    3c73:	4d 8d 34 3f          	lea    r14,[r15+rdi*1]
    3c77:	49 8d 5c 3d 00       	lea    rbx,[r13+rdi*1+0x0]
    3c7c:	41 38 57 01          	cmp    BYTE PTR [r15+0x1],dl
    3c80:	0f 85 da 01 00 00    	jne    3e60 <main+0x18c0>
    3c86:	4c 8d 5f 01          	lea    r11,[rdi+0x1]
    3c8a:	47 0f b6 54 1d 00    	movzx  r10d,BYTE PTR [r13+r11*1+0x0]
    3c90:	44 89 d9             	mov    ecx,r11d
    3c93:	4f 8d 34 1f          	lea    r14,[r15+r11*1]
    3c97:	4b 8d 5c 1d 00       	lea    rbx,[r13+r11*1+0x0]
    3c9c:	47 38 14 1f          	cmp    BYTE PTR [r15+r11*1],r10b
    3ca0:	0f 85 ba 01 00 00    	jne    3e60 <main+0x18c0>
    3ca6:	49 83 c3 01          	add    r11,0x1
    3caa:	43 0f b6 74 1d 00    	movzx  esi,BYTE PTR [r13+r11*1+0x0]
    3cb0:	44 89 d9             	mov    ecx,r11d
    3cb3:	4f 8d 34 1f          	lea    r14,[r15+r11*1]
    3cb7:	4b 8d 5c 1d 00       	lea    rbx,[r13+r11*1+0x0]
    3cbc:	43 38 34 1f          	cmp    BYTE PTR [r15+r11*1],sil
    3cc0:	0f 85 9a 01 00 00    	jne    3e60 <main+0x18c0>
    3cc6:	49 83 c3 01          	add    r11,0x1
    3cca:	47 0f b6 4c 1d 00    	movzx  r9d,BYTE PTR [r13+r11*1+0x0]
    3cd0:	44 89 d9             	mov    ecx,r11d
    3cd3:	4f 8d 34 1f          	lea    r14,[r15+r11*1]
    3cd7:	4b 8d 5c 1d 00       	lea    rbx,[r13+r11*1+0x0]
    3cdc:	47 38 0c 1f          	cmp    BYTE PTR [r15+r11*1],r9b
    3ce0:	0f 85 7a 01 00 00    	jne    3e60 <main+0x18c0>
    3ce6:	49 83 c3 01          	add    r11,0x1
    3cea:	43 0f b6 44 1d 00    	movzx  eax,BYTE PTR [r13+r11*1+0x0]
    3cf0:	44 89 d9             	mov    ecx,r11d
    3cf3:	4f 8d 34 1f          	lea    r14,[r15+r11*1]
    3cf7:	4b 8d 5c 1d 00       	lea    rbx,[r13+r11*1+0x0]
    3cfc:	43 38 04 1f          	cmp    BYTE PTR [r15+r11*1],al
    3d00:	0f 85 5a 01 00 00    	jne    3e60 <main+0x18c0>
    3d06:	49 83 c3 01          	add    r11,0x1
    3d0a:	43 0f b6 7c 1d 00    	movzx  edi,BYTE PTR [r13+r11*1+0x0]
    3d10:	44 89 d9             	mov    ecx,r11d
    3d13:	4f 8d 34 1f          	lea    r14,[r15+r11*1]
    3d17:	4b 8d 5c 1d 00       	lea    rbx,[r13+r11*1+0x0]
    3d1c:	43 38 3c 1f          	cmp    BYTE PTR [r15+r11*1],dil
    3d20:	0f 85 3a 01 00 00    	jne    3e60 <main+0x18c0>
    3d26:	49 83 c3 01          	add    r11,0x1
    3d2a:	43 0f b6 54 1d 00    	movzx  edx,BYTE PTR [r13+r11*1+0x0]
    3d30:	44 89 d9             	mov    ecx,r11d
    3d33:	4f 8d 34 1f          	lea    r14,[r15+r11*1]
    3d37:	4b 8d 5c 1d 00       	lea    rbx,[r13+r11*1+0x0]
    3d3c:	43 38 14 1f          	cmp    BYTE PTR [r15+r11*1],dl
    3d40:	0f 85 1a 01 00 00    	jne    3e60 <main+0x18c0>
    3d46:	49 8d 5b 01          	lea    rbx,[r11+0x1]
    3d4a:	4d 39 d8             	cmp    r8,r11
    3d4d:	0f 84 cd 00 00 00    	je     3e20 <main+0x1880>
    3d53:	89 d9                	mov    ecx,ebx
    3d55:	4d 8d 34 1f          	lea    r14,[r15+rbx*1]
    3d59:	47 0f b6 54 1d 01    	movzx  r10d,BYTE PTR [r13+r11*1+0x1]
    3d5f:	4c 01 eb             	add    rbx,r13
    3d62:	47 38 54 1f 01       	cmp    BYTE PTR [r15+r11*1+0x1],r10b
    3d67:	0f 85 f3 00 00 00    	jne    3e60 <main+0x18c0>
    3d6d:	49 8d 5b 02          	lea    rbx,[r11+0x2]
    3d71:	43 0f b6 74 1d 02    	movzx  esi,BYTE PTR [r13+r11*1+0x2]
    3d77:	89 d9                	mov    ecx,ebx
    3d79:	4d 8d 34 1f          	lea    r14,[r15+rbx*1]
    3d7d:	4c 01 eb             	add    rbx,r13
    3d80:	43 38 74 1f 02       	cmp    BYTE PTR [r15+r11*1+0x2],sil
    3d85:	0f 85 d5 00 00 00    	jne    3e60 <main+0x18c0>
    3d8b:	49 8d 5b 03          	lea    rbx,[r11+0x3]
    3d8f:	47 0f b6 4c 1d 03    	movzx  r9d,BYTE PTR [r13+r11*1+0x3]
    3d95:	89 d9                	mov    ecx,ebx
    3d97:	4d 8d 34 1f          	lea    r14,[r15+rbx*1]
    3d9b:	4c 01 eb             	add    rbx,r13
    3d9e:	47 38 4c 1f 03       	cmp    BYTE PTR [r15+r11*1+0x3],r9b
    3da3:	0f 85 b7 00 00 00    	jne    3e60 <main+0x18c0>
    3da9:	49 8d 5b 04          	lea    rbx,[r11+0x4]
    3dad:	43 0f b6 44 1d 04    	movzx  eax,BYTE PTR [r13+r11*1+0x4]
    3db3:	89 d9                	mov    ecx,ebx
    3db5:	4d 8d 34 1f          	lea    r14,[r15+rbx*1]
    3db9:	4c 01 eb             	add    rbx,r13
    3dbc:	43 38 44 1f 04       	cmp    BYTE PTR [r15+r11*1+0x4],al
    3dc1:	0f 85 99 00 00 00    	jne    3e60 <main+0x18c0>
    3dc7:	49 8d 5b 05          	lea    rbx,[r11+0x5]
    3dcb:	43 0f b6 7c 1d 05    	movzx  edi,BYTE PTR [r13+r11*1+0x5]
    3dd1:	89 d9                	mov    ecx,ebx
    3dd3:	4d 8d 34 1f          	lea    r14,[r15+rbx*1]
    3dd7:	4c 01 eb             	add    rbx,r13
    3dda:	43 38 7c 1f 05       	cmp    BYTE PTR [r15+r11*1+0x5],dil
    3ddf:	75 7f                	jne    3e60 <main+0x18c0>
    3de1:	49 8d 5b 06          	lea    rbx,[r11+0x6]
    3de5:	43 0f b6 54 1d 06    	movzx  edx,BYTE PTR [r13+r11*1+0x6]
    3deb:	89 d9                	mov    ecx,ebx
    3ded:	4d 8d 34 1f          	lea    r14,[r15+rbx*1]
    3df1:	4c 01 eb             	add    rbx,r13
    3df4:	43 38 54 1f 06       	cmp    BYTE PTR [r15+r11*1+0x6],dl
    3df9:	75 65                	jne    3e60 <main+0x18c0>
    3dfb:	49 8d 5b 07          	lea    rbx,[r11+0x7]
    3dff:	47 0f b6 54 1d 07    	movzx  r10d,BYTE PTR [r13+r11*1+0x7]
    3e05:	89 d9                	mov    ecx,ebx
    3e07:	4d 8d 34 1f          	lea    r14,[r15+rbx*1]
    3e0b:	4c 01 eb             	add    rbx,r13
    3e0e:	47 38 54 1f 07       	cmp    BYTE PTR [r15+r11*1+0x7],r10b
    3e13:	75 4b                	jne    3e60 <main+0x18c0>
    3e15:	49 83 c3 08          	add    r11,0x8
    3e19:	e9 0c ff ff ff       	jmp    3d2a <main+0x178a>
    3e1e:	66 90                	xchg   ax,ax
    3e20:	44 8b b5 34 fa ff ff 	mov    r14d,DWORD PTR [rbp-0x5cc]
    3e27:	48 8d 35 ba 36 00 00 	lea    rsi,[rip+0x36ba]        # 74e8 <_IO_stdin_used+0x4e8>
    3e2e:	bf 01 00 00 00       	mov    edi,0x1
    3e33:	31 c0                	xor    eax,eax
    3e35:	44 89 f2             	mov    edx,r14d
    3e38:	e8 a3 e6 ff ff       	call   24e0 <__printf_chk@plt>
    3e3d:	44 89 f1             	mov    ecx,r14d
    3e40:	83 c1 01             	add    ecx,0x1
    3e43:	89 8d 34 fa ff ff    	mov    DWORD PTR [rbp-0x5cc],ecx
    3e49:	81 f9 e8 03 00 00    	cmp    ecx,0x3e8
    3e4f:	0f 85 29 eb ff ff    	jne    297e <main+0x3de>
    3e55:	31 c0                	xor    eax,eax
    3e57:	e9 de 00 00 00       	jmp    3f3a <main+0x199a>
    3e5c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    3e60:	48 8d 3d 6e 32 00 00 	lea    rdi,[rip+0x326e]        # 70d5 <_IO_stdin_used+0xd5>
    3e67:	4d 89 fc             	mov    r12,r15
    3e6a:	4d 89 ef             	mov    r15,r13
    3e6d:	41 89 cd             	mov    r13d,ecx
    3e70:	e8 db e4 ff ff       	call   2350 <puts@plt>
    3e75:	48 8d 35 77 32 00 00 	lea    rsi,[rip+0x3277]        # 70f3 <_IO_stdin_used+0xf3>
    3e7c:	bf 01 00 00 00       	mov    edi,0x1
    3e81:	31 c0                	xor    eax,eax
    3e83:	e8 58 e6 ff ff       	call   24e0 <__printf_chk@plt>
    3e88:	44 8b 85 f4 fa ff ff 	mov    r8d,DWORD PTR [rbp-0x50c]
    3e8f:	45 85 c0             	test   r8d,r8d
    3e92:	7e 4d                	jle    3ee1 <main+0x1941>
    3e94:	4c 89 a5 b0 fa ff ff 	mov    QWORD PTR [rbp-0x550],r12
    3e9b:	45 31 db             	xor    r11d,r11d
    3e9e:	4c 8b a5 70 fa ff ff 	mov    r12,QWORD PTR [rbp-0x590]
    3ea5:	48 89 9d d8 fa ff ff 	mov    QWORD PTR [rbp-0x528],rbx
    3eac:	4c 89 db             	mov    rbx,r11
    3eaf:	90                   	nop
    3eb0:	49 8b 14 dc          	mov    rdx,QWORD PTR [r12+rbx*8]
    3eb4:	48 8d 35 4d 32 00 00 	lea    rsi,[rip+0x324d]        # 7108 <_IO_stdin_used+0x108>
    3ebb:	bf 01 00 00 00       	mov    edi,0x1
    3ec0:	31 c0                	xor    eax,eax
    3ec2:	48 83 c3 01          	add    rbx,0x1
    3ec6:	e8 15 e6 ff ff       	call   24e0 <__printf_chk@plt>
    3ecb:	39 9d f4 fa ff ff    	cmp    DWORD PTR [rbp-0x50c],ebx
    3ed1:	7f dd                	jg     3eb0 <main+0x1910>
    3ed3:	4c 8b a5 b0 fa ff ff 	mov    r12,QWORD PTR [rbp-0x550]
    3eda:	48 8b 9d d8 fa ff ff 	mov    rbx,QWORD PTR [rbp-0x528]
    3ee1:	bf 0a 00 00 00       	mov    edi,0xa
    3ee6:	e8 35 e4 ff ff       	call   2320 <putchar@plt>
    3eeb:	4c 89 e2             	mov    rdx,r12
    3eee:	bf 01 00 00 00       	mov    edi,0x1
    3ef3:	31 c0                	xor    eax,eax
    3ef5:	48 8d 35 11 32 00 00 	lea    rsi,[rip+0x3211]        # 710d <_IO_stdin_used+0x10d>
    3efc:	e8 df e5 ff ff       	call   24e0 <__printf_chk@plt>
    3f01:	4c 89 fa             	mov    rdx,r15
    3f04:	bf 01 00 00 00       	mov    edi,0x1
    3f09:	31 c0                	xor    eax,eax
    3f0b:	48 8d 35 13 32 00 00 	lea    rsi,[rip+0x3213]        # 7125 <_IO_stdin_used+0x125>
    3f12:	e8 c9 e5 ff ff       	call   24e0 <__printf_chk@plt>
    3f17:	41 0f be 0e          	movsx  ecx,BYTE PTR [r14]
    3f1b:	44 0f be 03          	movsx  r8d,BYTE PTR [rbx]
    3f1f:	44 89 ea             	mov    edx,r13d
    3f22:	48 8d 35 9f 35 00 00 	lea    rsi,[rip+0x359f]        # 74c8 <_IO_stdin_used+0x4c8>
    3f29:	bf 01 00 00 00       	mov    edi,0x1
    3f2e:	31 c0                	xor    eax,eax
    3f30:	e8 ab e5 ff ff       	call   24e0 <__printf_chk@plt>
    3f35:	b8 ff ff ff ff       	mov    eax,0xffffffff
    3f3a:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    3f3e:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    3f45:	00 00 
    3f47:	0f 85 27 05 00 00    	jne    4474 <main+0x1ed4>
    3f4d:	48 8d 65 d0          	lea    rsp,[rbp-0x30]
    3f51:	5b                   	pop    rbx
    3f52:	5e                   	pop    rsi
    3f53:	41 5c                	pop    r12
    3f55:	41 5d                	pop    r13
    3f57:	41 5e                	pop    r14
    3f59:	41 5f                	pop    r15
    3f5b:	5d                   	pop    rbp
    3f5c:	48 8d 66 f8          	lea    rsp,[rsi-0x8]
    3f60:	c3                   	ret    
    3f61:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    3f68:	c5 f8 77             	vzeroupper 
    3f6b:	e9 4f f9 ff ff       	jmp    38bf <main+0x131f>
    3f70:	4c 63 c8             	movsxd r9,eax
    3f73:	83 e0 07             	and    eax,0x7
    3f76:	42 8b 0c 8b          	mov    ecx,DWORD PTR [rbx+r9*4]
    3f7a:	45 89 cb             	mov    r11d,r9d
    3f7d:	49 8d 51 ff          	lea    rdx,[r9-0x1]
    3f81:	41 83 eb 01          	sub    r11d,0x1
    3f85:	43 89 4c 8d 00       	mov    DWORD PTR [r13+r9*4+0x0],ecx
    3f8a:	46 8b 3c 8f          	mov    r15d,DWORD PTR [rdi+r9*4]
    3f8e:	47 89 3c 8e          	mov    DWORD PTR [r14+r9*4],r15d
    3f92:	0f 88 27 f9 ff ff    	js     38bf <main+0x131f>
    3f98:	85 c0                	test   eax,eax
    3f9a:	0f 84 a7 00 00 00    	je     4047 <main+0x1aa7>
    3fa0:	83 f8 01             	cmp    eax,0x1
    3fa3:	0f 84 82 00 00 00    	je     402b <main+0x1a8b>
    3fa9:	83 f8 02             	cmp    eax,0x2
    3fac:	74 69                	je     4017 <main+0x1a77>
    3fae:	83 f8 03             	cmp    eax,0x3
    3fb1:	74 50                	je     4003 <main+0x1a63>
    3fb3:	83 f8 04             	cmp    eax,0x4
    3fb6:	74 36                	je     3fee <main+0x1a4e>
    3fb8:	83 f8 05             	cmp    eax,0x5
    3fbb:	74 1d                	je     3fda <main+0x1a3a>
    3fbd:	83 f8 06             	cmp    eax,0x6
    3fc0:	0f 85 e8 03 00 00    	jne    43ae <main+0x1e0e>
    3fc6:	44 8b 04 93          	mov    r8d,DWORD PTR [rbx+rdx*4]
    3fca:	45 89 44 95 00       	mov    DWORD PTR [r13+rdx*4+0x0],r8d
    3fcf:	8b 04 97             	mov    eax,DWORD PTR [rdi+rdx*4]
    3fd2:	41 89 04 96          	mov    DWORD PTR [r14+rdx*4],eax
    3fd6:	48 83 ea 01          	sub    rdx,0x1
    3fda:	44 8b 0c 93          	mov    r9d,DWORD PTR [rbx+rdx*4]
    3fde:	45 89 4c 95 00       	mov    DWORD PTR [r13+rdx*4+0x0],r9d
    3fe3:	8b 0c 97             	mov    ecx,DWORD PTR [rdi+rdx*4]
    3fe6:	41 89 0c 96          	mov    DWORD PTR [r14+rdx*4],ecx
    3fea:	48 83 ea 01          	sub    rdx,0x1
    3fee:	44 8b 3c 93          	mov    r15d,DWORD PTR [rbx+rdx*4]
    3ff2:	45 89 7c 95 00       	mov    DWORD PTR [r13+rdx*4+0x0],r15d
    3ff7:	44 8b 1c 97          	mov    r11d,DWORD PTR [rdi+rdx*4]
    3ffb:	45 89 1c 96          	mov    DWORD PTR [r14+rdx*4],r11d
    3fff:	48 83 ea 01          	sub    rdx,0x1
    4003:	44 8b 14 93          	mov    r10d,DWORD PTR [rbx+rdx*4]
    4007:	45 89 54 95 00       	mov    DWORD PTR [r13+rdx*4+0x0],r10d
    400c:	8b 34 97             	mov    esi,DWORD PTR [rdi+rdx*4]
    400f:	41 89 34 96          	mov    DWORD PTR [r14+rdx*4],esi
    4013:	48 83 ea 01          	sub    rdx,0x1
    4017:	44 8b 04 93          	mov    r8d,DWORD PTR [rbx+rdx*4]
    401b:	45 89 44 95 00       	mov    DWORD PTR [r13+rdx*4+0x0],r8d
    4020:	8b 04 97             	mov    eax,DWORD PTR [rdi+rdx*4]
    4023:	41 89 04 96          	mov    DWORD PTR [r14+rdx*4],eax
    4027:	48 83 ea 01          	sub    rdx,0x1
    402b:	44 8b 0c 93          	mov    r9d,DWORD PTR [rbx+rdx*4]
    402f:	45 89 4c 95 00       	mov    DWORD PTR [r13+rdx*4+0x0],r9d
    4034:	8b 0c 97             	mov    ecx,DWORD PTR [rdi+rdx*4]
    4037:	41 89 0c 96          	mov    DWORD PTR [r14+rdx*4],ecx
    403b:	48 83 ea 01          	sub    rdx,0x1
    403f:	85 d2                	test   edx,edx
    4041:	0f 88 78 f8 ff ff    	js     38bf <main+0x131f>
    4047:	44 8b 3c 93          	mov    r15d,DWORD PTR [rbx+rdx*4]
    404b:	4c 8d 52 ff          	lea    r10,[rdx-0x1]
    404f:	48 8d 42 fe          	lea    rax,[rdx-0x2]
    4053:	45 89 7c 95 00       	mov    DWORD PTR [r13+rdx*4+0x0],r15d
    4058:	44 8b 1c 97          	mov    r11d,DWORD PTR [rdi+rdx*4]
    405c:	4c 8d 7a fd          	lea    r15,[rdx-0x3]
    4060:	45 89 1c 96          	mov    DWORD PTR [r14+rdx*4],r11d
    4064:	42 8b 34 93          	mov    esi,DWORD PTR [rbx+r10*4]
    4068:	43 89 74 95 00       	mov    DWORD PTR [r13+r10*4+0x0],esi
    406d:	46 8b 04 97          	mov    r8d,DWORD PTR [rdi+r10*4]
    4071:	48 8d 72 fc          	lea    rsi,[rdx-0x4]
    4075:	47 89 04 96          	mov    DWORD PTR [r14+r10*4],r8d
    4079:	44 8b 0c 83          	mov    r9d,DWORD PTR [rbx+rax*4]
    407d:	45 89 4c 85 00       	mov    DWORD PTR [r13+rax*4+0x0],r9d
    4082:	8b 0c 87             	mov    ecx,DWORD PTR [rdi+rax*4]
    4085:	4c 8d 4a fb          	lea    r9,[rdx-0x5]
    4089:	41 89 0c 86          	mov    DWORD PTR [r14+rax*4],ecx
    408d:	46 8b 1c bb          	mov    r11d,DWORD PTR [rbx+r15*4]
    4091:	47 89 5c bd 00       	mov    DWORD PTR [r13+r15*4+0x0],r11d
    4096:	46 8b 14 bf          	mov    r10d,DWORD PTR [rdi+r15*4]
    409a:	4c 8d 5a fa          	lea    r11,[rdx-0x6]
    409e:	47 89 14 be          	mov    DWORD PTR [r14+r15*4],r10d
    40a2:	44 8b 04 b3          	mov    r8d,DWORD PTR [rbx+rsi*4]
    40a6:	45 89 44 b5 00       	mov    DWORD PTR [r13+rsi*4+0x0],r8d
    40ab:	8b 04 b7             	mov    eax,DWORD PTR [rdi+rsi*4]
    40ae:	4c 8d 42 f9          	lea    r8,[rdx-0x7]
    40b2:	48 83 ea 08          	sub    rdx,0x8
    40b6:	41 89 04 b6          	mov    DWORD PTR [r14+rsi*4],eax
    40ba:	42 8b 0c 8b          	mov    ecx,DWORD PTR [rbx+r9*4]
    40be:	43 89 4c 8d 00       	mov    DWORD PTR [r13+r9*4+0x0],ecx
    40c3:	46 8b 3c 8f          	mov    r15d,DWORD PTR [rdi+r9*4]
    40c7:	47 89 3c 8e          	mov    DWORD PTR [r14+r9*4],r15d
    40cb:	46 8b 14 9b          	mov    r10d,DWORD PTR [rbx+r11*4]
    40cf:	47 89 54 9d 00       	mov    DWORD PTR [r13+r11*4+0x0],r10d
    40d4:	42 8b 34 9f          	mov    esi,DWORD PTR [rdi+r11*4]
    40d8:	43 89 34 9e          	mov    DWORD PTR [r14+r11*4],esi
    40dc:	42 8b 04 83          	mov    eax,DWORD PTR [rbx+r8*4]
    40e0:	43 89 44 85 00       	mov    DWORD PTR [r13+r8*4+0x0],eax
    40e5:	46 8b 0c 87          	mov    r9d,DWORD PTR [rdi+r8*4]
    40e9:	47 89 0c 86          	mov    DWORD PTR [r14+r8*4],r9d
    40ed:	85 d2                	test   edx,edx
    40ef:	0f 89 52 ff ff ff    	jns    4047 <main+0x1aa7>
    40f5:	e9 c5 f7 ff ff       	jmp    38bf <main+0x131f>
    40fa:	45 89 f9             	mov    r9d,r15d
    40fd:	31 ff                	xor    edi,edi
    40ff:	41 83 e7 07          	and    r15d,0x7
    4103:	0f 84 9a 00 00 00    	je     41a3 <main+0x1c03>
    4109:	49 83 ff 01          	cmp    r15,0x1
    410d:	74 79                	je     4188 <main+0x1be8>
    410f:	49 83 ff 02          	cmp    r15,0x2
    4113:	74 62                	je     4177 <main+0x1bd7>
    4115:	49 83 ff 03          	cmp    r15,0x3
    4119:	74 4a                	je     4165 <main+0x1bc5>
    411b:	49 83 ff 04          	cmp    r15,0x4
    411f:	74 33                	je     4154 <main+0x1bb4>
    4121:	49 83 ff 05          	cmp    r15,0x5
    4125:	74 1c                	je     4143 <main+0x1ba3>
    4127:	49 83 ff 06          	cmp    r15,0x6
    412b:	0f 85 55 02 00 00    	jne    4386 <main+0x1de6>
    4131:	45 0f be 44 3d 00    	movsx  r8d,BYTE PTR [r13+rdi*1+0x0]
    4137:	41 83 e8 30          	sub    r8d,0x30
    413b:	45 89 04 be          	mov    DWORD PTR [r14+rdi*4],r8d
    413f:	48 83 c7 01          	add    rdi,0x1
    4143:	41 0f be 74 3d 00    	movsx  esi,BYTE PTR [r13+rdi*1+0x0]
    4149:	83 ee 30             	sub    esi,0x30
    414c:	41 89 34 be          	mov    DWORD PTR [r14+rdi*4],esi
    4150:	48 83 c7 01          	add    rdi,0x1
    4154:	41 0f be 4c 3d 00    	movsx  ecx,BYTE PTR [r13+rdi*1+0x0]
    415a:	83 e9 30             	sub    ecx,0x30
    415d:	41 89 0c be          	mov    DWORD PTR [r14+rdi*4],ecx
    4161:	48 83 c7 01          	add    rdi,0x1
    4165:	45 0f be 7c 3d 00    	movsx  r15d,BYTE PTR [r13+rdi*1+0x0]
    416b:	41 83 ef 30          	sub    r15d,0x30
    416f:	45 89 3c be          	mov    DWORD PTR [r14+rdi*4],r15d
    4173:	48 83 c7 01          	add    rdi,0x1
    4177:	41 0f be 54 3d 00    	movsx  edx,BYTE PTR [r13+rdi*1+0x0]
    417d:	83 ea 30             	sub    edx,0x30
    4180:	41 89 14 be          	mov    DWORD PTR [r14+rdi*4],edx
    4184:	48 83 c7 01          	add    rdi,0x1
    4188:	45 0f be 44 3d 00    	movsx  r8d,BYTE PTR [r13+rdi*1+0x0]
    418e:	41 83 e8 30          	sub    r8d,0x30
    4192:	45 89 04 be          	mov    DWORD PTR [r14+rdi*4],r8d
    4196:	48 83 c7 01          	add    rdi,0x1
    419a:	4c 39 cf             	cmp    rdi,r9
    419d:	0f 84 75 ee ff ff    	je     3018 <main+0xa78>
    41a3:	41 0f be 74 3d 00    	movsx  esi,BYTE PTR [r13+rdi*1+0x0]
    41a9:	83 ee 30             	sub    esi,0x30
    41ac:	41 89 34 be          	mov    DWORD PTR [r14+rdi*4],esi
    41b0:	41 0f be 4c 3d 01    	movsx  ecx,BYTE PTR [r13+rdi*1+0x1]
    41b6:	83 e9 30             	sub    ecx,0x30
    41b9:	41 89 4c be 04       	mov    DWORD PTR [r14+rdi*4+0x4],ecx
    41be:	45 0f be 7c 3d 02    	movsx  r15d,BYTE PTR [r13+rdi*1+0x2]
    41c4:	41 83 ef 30          	sub    r15d,0x30
    41c8:	45 89 7c be 08       	mov    DWORD PTR [r14+rdi*4+0x8],r15d
    41cd:	41 0f be 54 3d 03    	movsx  edx,BYTE PTR [r13+rdi*1+0x3]
    41d3:	83 ea 30             	sub    edx,0x30
    41d6:	41 89 54 be 0c       	mov    DWORD PTR [r14+rdi*4+0xc],edx
    41db:	45 0f be 44 3d 04    	movsx  r8d,BYTE PTR [r13+rdi*1+0x4]
    41e1:	41 83 e8 30          	sub    r8d,0x30
    41e5:	45 89 44 be 10       	mov    DWORD PTR [r14+rdi*4+0x10],r8d
    41ea:	41 0f be 74 3d 05    	movsx  esi,BYTE PTR [r13+rdi*1+0x5]
    41f0:	83 ee 30             	sub    esi,0x30
    41f3:	41 89 74 be 14       	mov    DWORD PTR [r14+rdi*4+0x14],esi
    41f8:	41 0f be 4c 3d 06    	movsx  ecx,BYTE PTR [r13+rdi*1+0x6]
    41fe:	83 e9 30             	sub    ecx,0x30
    4201:	41 89 4c be 18       	mov    DWORD PTR [r14+rdi*4+0x18],ecx
    4206:	45 0f be 7c 3d 07    	movsx  r15d,BYTE PTR [r13+rdi*1+0x7]
    420c:	41 83 ef 30          	sub    r15d,0x30
    4210:	45 89 7c be 1c       	mov    DWORD PTR [r14+rdi*4+0x1c],r15d
    4215:	48 83 c7 08          	add    rdi,0x8
    4219:	4c 39 cf             	cmp    rdi,r9
    421c:	75 85                	jne    41a3 <main+0x1c03>
    421e:	e9 f5 ed ff ff       	jmp    3018 <main+0xa78>
    4223:	45 89 d7             	mov    r15d,r10d
    4226:	45 31 c0             	xor    r8d,r8d
    4229:	41 83 e2 07          	and    r10d,0x7
    422d:	0f 84 94 00 00 00    	je     42c7 <main+0x1d27>
    4233:	49 83 fa 01          	cmp    r10,0x1
    4237:	74 75                	je     42ae <main+0x1d0e>
    4239:	49 83 fa 02          	cmp    r10,0x2
    423d:	74 5e                	je     429d <main+0x1cfd>
    423f:	49 83 fa 03          	cmp    r10,0x3
    4243:	74 47                	je     428c <main+0x1cec>
    4245:	49 83 fa 04          	cmp    r10,0x4
    4249:	74 30                	je     427b <main+0x1cdb>
    424b:	49 83 fa 05          	cmp    r10,0x5
    424f:	74 1a                	je     426b <main+0x1ccb>
    4251:	49 83 fa 06          	cmp    r10,0x6
    4255:	0f 85 40 01 00 00    	jne    439b <main+0x1dfb>
    425b:	42 0f be 3c 03       	movsx  edi,BYTE PTR [rbx+r8*1]
    4260:	83 ef 30             	sub    edi,0x30
    4263:	42 89 3c 80          	mov    DWORD PTR [rax+r8*4],edi
    4267:	49 83 c0 01          	add    r8,0x1
    426b:	42 0f be 34 03       	movsx  esi,BYTE PTR [rbx+r8*1]
    4270:	83 ee 30             	sub    esi,0x30
    4273:	42 89 34 80          	mov    DWORD PTR [rax+r8*4],esi
    4277:	49 83 c0 01          	add    r8,0x1
    427b:	46 0f be 34 03       	movsx  r14d,BYTE PTR [rbx+r8*1]
    4280:	41 83 ee 30          	sub    r14d,0x30
    4284:	46 89 34 80          	mov    DWORD PTR [rax+r8*4],r14d
    4288:	49 83 c0 01          	add    r8,0x1
    428c:	46 0f be 2c 03       	movsx  r13d,BYTE PTR [rbx+r8*1]
    4291:	41 83 ed 30          	sub    r13d,0x30
    4295:	46 89 2c 80          	mov    DWORD PTR [rax+r8*4],r13d
    4299:	49 83 c0 01          	add    r8,0x1
    429d:	46 0f be 0c 03       	movsx  r9d,BYTE PTR [rbx+r8*1]
    42a2:	41 83 e9 30          	sub    r9d,0x30
    42a6:	46 89 0c 80          	mov    DWORD PTR [rax+r8*4],r9d
    42aa:	49 83 c0 01          	add    r8,0x1
    42ae:	42 0f be 14 03       	movsx  edx,BYTE PTR [rbx+r8*1]
    42b3:	83 ea 30             	sub    edx,0x30
    42b6:	42 89 14 80          	mov    DWORD PTR [rax+r8*4],edx
    42ba:	49 83 c0 01          	add    r8,0x1
    42be:	4d 39 c7             	cmp    r15,r8
    42c1:	0f 84 29 f1 ff ff    	je     33f0 <main+0xe50>
    42c7:	46 0f be 1c 03       	movsx  r11d,BYTE PTR [rbx+r8*1]
    42cc:	41 83 eb 30          	sub    r11d,0x30
    42d0:	46 89 1c 80          	mov    DWORD PTR [rax+r8*4],r11d
    42d4:	46 0f be 54 03 01    	movsx  r10d,BYTE PTR [rbx+r8*1+0x1]
    42da:	41 83 ea 30          	sub    r10d,0x30
    42de:	46 89 54 80 04       	mov    DWORD PTR [rax+r8*4+0x4],r10d
    42e3:	42 0f be 4c 03 02    	movsx  ecx,BYTE PTR [rbx+r8*1+0x2]
    42e9:	83 e9 30             	sub    ecx,0x30
    42ec:	42 89 4c 80 08       	mov    DWORD PTR [rax+r8*4+0x8],ecx
    42f1:	42 0f be 7c 03 03    	movsx  edi,BYTE PTR [rbx+r8*1+0x3]
    42f7:	83 ef 30             	sub    edi,0x30
    42fa:	42 89 7c 80 0c       	mov    DWORD PTR [rax+r8*4+0xc],edi
    42ff:	42 0f be 74 03 04    	movsx  esi,BYTE PTR [rbx+r8*1+0x4]
    4305:	83 ee 30             	sub    esi,0x30
    4308:	42 89 74 80 10       	mov    DWORD PTR [rax+r8*4+0x10],esi
    430d:	46 0f be 74 03 05    	movsx  r14d,BYTE PTR [rbx+r8*1+0x5]
    4313:	41 83 ee 30          	sub    r14d,0x30
    4317:	46 89 74 80 14       	mov    DWORD PTR [rax+r8*4+0x14],r14d
    431c:	46 0f be 6c 03 06    	movsx  r13d,BYTE PTR [rbx+r8*1+0x6]
    4322:	41 83 ed 30          	sub    r13d,0x30
    4326:	46 89 6c 80 18       	mov    DWORD PTR [rax+r8*4+0x18],r13d
    432b:	46 0f be 4c 03 07    	movsx  r9d,BYTE PTR [rbx+r8*1+0x7]
    4331:	41 83 e9 30          	sub    r9d,0x30
    4335:	46 89 4c 80 1c       	mov    DWORD PTR [rax+r8*4+0x1c],r9d
    433a:	49 83 c0 08          	add    r8,0x8
    433e:	4d 39 c7             	cmp    r15,r8
    4341:	75 84                	jne    42c7 <main+0x1d27>
    4343:	e9 a8 f0 ff ff       	jmp    33f0 <main+0xe50>
    4348:	62 51 7e 48 6f 3f    	vmovdqu32 zmm15,ZMMWORD PTR [r15]
    434e:	49 c7 c3 c0 ff ff ff 	mov    r11,0xffffffffffffffc0
    4355:	62 71 7e 48 7f 3a    	vmovdqu32 ZMMWORD PTR [rdx],zmm15
    435b:	62 f1 7e 48 6f 06    	vmovdqu32 zmm0,ZMMWORD PTR [rsi]
    4361:	62 f1 7e 48 7f 01    	vmovdqu32 ZMMWORD PTR [rcx],zmm0
    4367:	e9 52 f2 ff ff       	jmp    35be <main+0x101e>
    436c:	31 c9                	xor    ecx,ecx
    436e:	e9 44 f4 ff ff       	jmp    37b7 <main+0x1217>
    4373:	31 f6                	xor    esi,esi
    4375:	31 d2                	xor    edx,edx
    4377:	e9 87 ea ff ff       	jmp    2e03 <main+0x863>
    437c:	45 31 c0             	xor    r8d,r8d
    437f:	31 c9                	xor    ecx,ecx
    4381:	e9 57 ee ff ff       	jmp    31dd <main+0xc3d>
    4386:	41 0f be 55 00       	movsx  edx,BYTE PTR [r13+0x0]
    438b:	bf 01 00 00 00       	mov    edi,0x1
    4390:	83 ea 30             	sub    edx,0x30
    4393:	41 89 16             	mov    DWORD PTR [r14],edx
    4396:	e9 96 fd ff ff       	jmp    4131 <main+0x1b91>
    439b:	0f be 0b             	movsx  ecx,BYTE PTR [rbx]
    439e:	41 b8 01 00 00 00    	mov    r8d,0x1
    43a4:	83 e9 30             	sub    ecx,0x30
    43a7:	89 08                	mov    DWORD PTR [rax],ecx
    43a9:	e9 ad fe ff ff       	jmp    425b <main+0x1cbb>
    43ae:	44 8b 14 93          	mov    r10d,DWORD PTR [rbx+rdx*4]
    43b2:	45 89 54 95 00       	mov    DWORD PTR [r13+rdx*4+0x0],r10d
    43b7:	8b 34 97             	mov    esi,DWORD PTR [rdi+rdx*4]
    43ba:	41 89 34 96          	mov    DWORD PTR [r14+rdx*4],esi
    43be:	49 8d 51 fe          	lea    rdx,[r9-0x2]
    43c2:	e9 ff fb ff ff       	jmp    3fc6 <main+0x1a26>
    43c7:	48 8d 3d e6 2c 00 00 	lea    rdi,[rip+0x2ce6]        # 70b4 <_IO_stdin_used+0xb4>
    43ce:	e8 2d e1 ff ff       	call   2500 <perror@plt>
    43d3:	bf 01 00 00 00       	mov    edi,0x1
    43d8:	e8 33 e1 ff ff       	call   2510 <exit@plt>
    43dd:	48 8d 3d b8 2c 00 00 	lea    rdi,[rip+0x2cb8]        # 709c <_IO_stdin_used+0x9c>
    43e4:	e8 17 e1 ff ff       	call   2500 <perror@plt>
    43e9:	bf 01 00 00 00       	mov    edi,0x1
    43ee:	e8 1d e1 ff ff       	call   2510 <exit@plt>
    43f3:	e8 38 df ff ff       	call   2330 <__errno_location@plt>
    43f8:	8b 38                	mov    edi,DWORD PTR [rax]
    43fa:	e8 61 e1 ff ff       	call   2560 <strerror@plt>
    43ff:	48 8b 3d 1a 4c 00 00 	mov    rdi,QWORD PTR [rip+0x4c1a]        # 9020 <stderr@GLIBC_2.2.5>
    4406:	89 d9                	mov    ecx,ebx
    4408:	48 8d 15 55 2c 00 00 	lea    rdx,[rip+0x2c55]        # 7064 <_IO_stdin_used+0x64>
    440f:	49 89 c0             	mov    r8,rax
    4412:	be 01 00 00 00       	mov    esi,0x1
    4417:	31 c0                	xor    eax,eax
    4419:	e8 12 e1 ff ff       	call   2530 <__fprintf_chk@plt>
    441e:	bf 01 00 00 00       	mov    edi,0x1
    4423:	e8 e8 e0 ff ff       	call   2510 <exit@plt>
    4428:	48 8d 3d 71 30 00 00 	lea    rdi,[rip+0x3071]        # 74a0 <_IO_stdin_used+0x4a0>
    442f:	e8 cc e0 ff ff       	call   2500 <perror@plt>
    4434:	e9 fc fa ff ff       	jmp    3f35 <main+0x1995>
    4439:	48 8d 3d 30 30 00 00 	lea    rdi,[rip+0x3030]        # 7470 <_IO_stdin_used+0x470>
    4440:	e8 bb e0 ff ff       	call   2500 <perror@plt>
    4445:	e9 eb fa ff ff       	jmp    3f35 <main+0x1995>
    444a:	48 8b 0d cf 4b 00 00 	mov    rcx,QWORD PTR [rip+0x4bcf]        # 9020 <stderr@GLIBC_2.2.5>
    4451:	ba 26 00 00 00       	mov    edx,0x26
    4456:	be 01 00 00 00       	mov    esi,0x1
    445b:	48 8d 3d e6 2f 00 00 	lea    rdi,[rip+0x2fe6]        # 7448 <_IO_stdin_used+0x448>
    4462:	c5 f8 77             	vzeroupper 
    4465:	e8 b6 e0 ff ff       	call   2520 <fwrite@plt>
    446a:	bf 01 00 00 00       	mov    edi,0x1
    446f:	e8 9c e0 ff ff       	call   2510 <exit@plt>
    4474:	e8 37 df ff ff       	call   23b0 <__stack_chk_fail@plt>
    4479:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000004480 <_start>:
    4480:	f3 0f 1e fa          	endbr64 
    4484:	31 ed                	xor    ebp,ebp
    4486:	49 89 d1             	mov    r9,rdx
    4489:	5e                   	pop    rsi
    448a:	48 89 e2             	mov    rdx,rsp
    448d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    4491:	50                   	push   rax
    4492:	54                   	push   rsp
    4493:	45 31 c0             	xor    r8d,r8d
    4496:	31 c9                	xor    ecx,ecx
    4498:	48 8d 3d 01 e1 ff ff 	lea    rdi,[rip+0xffffffffffffe101]        # 25a0 <main>
    449f:	ff 15 33 4b 00 00    	call   QWORD PTR [rip+0x4b33]        # 8fd8 <__libc_start_main@GLIBC_2.34>
    44a5:	f4                   	hlt    
    44a6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    44ad:	00 00 00 

00000000000044b0 <deregister_tm_clones>:
    44b0:	48 8d 3d 59 4b 00 00 	lea    rdi,[rip+0x4b59]        # 9010 <__TMC_END__>
    44b7:	48 8d 05 52 4b 00 00 	lea    rax,[rip+0x4b52]        # 9010 <__TMC_END__>
    44be:	48 39 f8             	cmp    rax,rdi
    44c1:	74 15                	je     44d8 <deregister_tm_clones+0x28>
    44c3:	48 8b 05 16 4b 00 00 	mov    rax,QWORD PTR [rip+0x4b16]        # 8fe0 <_ITM_deregisterTMCloneTable@Base>
    44ca:	48 85 c0             	test   rax,rax
    44cd:	74 09                	je     44d8 <deregister_tm_clones+0x28>
    44cf:	ff e0                	jmp    rax
    44d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    44d8:	c3                   	ret    
    44d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000044e0 <register_tm_clones>:
    44e0:	48 8d 3d 29 4b 00 00 	lea    rdi,[rip+0x4b29]        # 9010 <__TMC_END__>
    44e7:	48 8d 35 22 4b 00 00 	lea    rsi,[rip+0x4b22]        # 9010 <__TMC_END__>
    44ee:	48 29 fe             	sub    rsi,rdi
    44f1:	48 89 f0             	mov    rax,rsi
    44f4:	48 c1 ee 3f          	shr    rsi,0x3f
    44f8:	48 c1 f8 03          	sar    rax,0x3
    44fc:	48 01 c6             	add    rsi,rax
    44ff:	48 d1 fe             	sar    rsi,1
    4502:	74 14                	je     4518 <register_tm_clones+0x38>
    4504:	48 8b 05 e5 4a 00 00 	mov    rax,QWORD PTR [rip+0x4ae5]        # 8ff0 <_ITM_registerTMCloneTable@Base>
    450b:	48 85 c0             	test   rax,rax
    450e:	74 08                	je     4518 <register_tm_clones+0x38>
    4510:	ff e0                	jmp    rax
    4512:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    4518:	c3                   	ret    
    4519:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000004520 <__do_global_dtors_aux>:
    4520:	f3 0f 1e fa          	endbr64 
    4524:	80 3d fd 4a 00 00 00 	cmp    BYTE PTR [rip+0x4afd],0x0        # 9028 <completed.0>
    452b:	75 2b                	jne    4558 <__do_global_dtors_aux+0x38>
    452d:	55                   	push   rbp
    452e:	48 83 3d c2 4a 00 00 	cmp    QWORD PTR [rip+0x4ac2],0x0        # 8ff8 <__cxa_finalize@GLIBC_2.2.5>
    4535:	00 
    4536:	48 89 e5             	mov    rbp,rsp
    4539:	74 0c                	je     4547 <__do_global_dtors_aux+0x27>
    453b:	48 8b 3d c6 4a 00 00 	mov    rdi,QWORD PTR [rip+0x4ac6]        # 9008 <__dso_handle>
    4542:	e8 99 dd ff ff       	call   22e0 <__cxa_finalize@plt>
    4547:	e8 64 ff ff ff       	call   44b0 <deregister_tm_clones>
    454c:	c6 05 d5 4a 00 00 01 	mov    BYTE PTR [rip+0x4ad5],0x1        # 9028 <completed.0>
    4553:	5d                   	pop    rbp
    4554:	c3                   	ret    
    4555:	0f 1f 00             	nop    DWORD PTR [rax]
    4558:	c3                   	ret    
    4559:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000004560 <frame_dummy>:
    4560:	f3 0f 1e fa          	endbr64 
    4564:	e9 77 ff ff ff       	jmp    44e0 <register_tm_clones>
    4569:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000004570 <mul_int_array_avx512>:
    4570:	f3 0f 1e fa          	endbr64 
    4574:	55                   	push   rbp
    4575:	48 89 f9             	mov    rcx,rdi
    4578:	89 d7                	mov    edi,edx
    457a:	49 89 f0             	mov    r8,rsi
    457d:	c1 ff 04             	sar    edi,0x4
    4580:	83 e2 0f             	and    edx,0xf
    4583:	48 89 e5             	mov    rbp,rsp
    4586:	48 83 e4 c0          	and    rsp,0xffffffffffffffc0
    458a:	48 83 c4 80          	add    rsp,0xffffffffffffff80
    458e:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    4595:	00 00 
    4597:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
    459c:	31 c0                	xor    eax,eax
    459e:	85 ff                	test   edi,edi
    45a0:	0f 8e 1d 03 00 00    	jle    48c3 <mul_int_array_avx512+0x353>
    45a6:	4c 63 d7             	movsxd r10,edi
    45a9:	48 89 f0             	mov    rax,rsi
    45ac:	c4 41 09 ef f6       	vpxor  xmm14,xmm14,xmm14
    45b1:	62 f1 7d 48 6f 05 c5 	vmovdqa32 zmm0,ZMMWORD PTR [rip+0x2fc5]        # 7580 <__PRETTY_FUNCTION__.0+0x40>
    45b8:	2f 00 00 
    45bb:	49 c1 e2 06          	shl    r10,0x6
    45bf:	49 8d 72 c0          	lea    rsi,[r10-0x40]
    45c3:	4e 8d 0c 11          	lea    r9,[rcx+r10*1]
    45c7:	48 c1 ee 06          	shr    rsi,0x6
    45cb:	48 83 c6 01          	add    rsi,0x1
    45cf:	83 e6 07             	and    esi,0x7
    45d2:	0f 84 db 00 00 00    	je     46b3 <mul_int_array_avx512+0x143>
    45d8:	48 83 fe 01          	cmp    rsi,0x1
    45dc:	0f 84 ad 00 00 00    	je     468f <mul_int_array_avx512+0x11f>
    45e2:	48 83 fe 02          	cmp    rsi,0x2
    45e6:	0f 84 88 00 00 00    	je     4674 <mul_int_array_avx512+0x104>
    45ec:	48 83 fe 03          	cmp    rsi,0x3
    45f0:	74 67                	je     4659 <mul_int_array_avx512+0xe9>
    45f2:	48 83 fe 04          	cmp    rsi,0x4
    45f6:	74 46                	je     463e <mul_int_array_avx512+0xce>
    45f8:	48 83 fe 05          	cmp    rsi,0x5
    45fc:	74 25                	je     4623 <mul_int_array_avx512+0xb3>
    45fe:	48 83 fe 06          	cmp    rsi,0x6
    4602:	0f 85 a1 02 00 00    	jne    48a9 <mul_int_array_avx512+0x339>
    4608:	62 f2 7d 48 36 10    	vpermd zmm2,zmm0,ZMMWORD PTR [rax]
    460e:	48 83 c1 40          	add    rcx,0x40
    4612:	48 83 e8 40          	sub    rax,0x40
    4616:	62 f2 6d 48 40 59 ff 	vpmulld zmm3,zmm2,ZMMWORD PTR [rcx-0x40]
    461d:	62 51 65 48 fe f6    	vpaddd zmm14,zmm3,zmm14
    4623:	62 f2 7d 48 36 20    	vpermd zmm4,zmm0,ZMMWORD PTR [rax]
    4629:	48 83 c1 40          	add    rcx,0x40
    462d:	48 83 e8 40          	sub    rax,0x40
    4631:	62 f2 5d 48 40 69 ff 	vpmulld zmm5,zmm4,ZMMWORD PTR [rcx-0x40]
    4638:	62 51 55 48 fe f6    	vpaddd zmm14,zmm5,zmm14
    463e:	62 f2 7d 48 36 30    	vpermd zmm6,zmm0,ZMMWORD PTR [rax]
    4644:	48 83 c1 40          	add    rcx,0x40
    4648:	48 83 e8 40          	sub    rax,0x40
    464c:	62 f2 4d 48 40 79 ff 	vpmulld zmm7,zmm6,ZMMWORD PTR [rcx-0x40]
    4653:	62 51 45 48 fe f6    	vpaddd zmm14,zmm7,zmm14
    4659:	62 72 7d 48 36 00    	vpermd zmm8,zmm0,ZMMWORD PTR [rax]
    465f:	48 83 c1 40          	add    rcx,0x40
    4663:	48 83 e8 40          	sub    rax,0x40
    4667:	62 72 3d 48 40 49 ff 	vpmulld zmm9,zmm8,ZMMWORD PTR [rcx-0x40]
    466e:	62 51 35 48 fe f6    	vpaddd zmm14,zmm9,zmm14
    4674:	62 72 7d 48 36 10    	vpermd zmm10,zmm0,ZMMWORD PTR [rax]
    467a:	48 83 c1 40          	add    rcx,0x40
    467e:	48 83 e8 40          	sub    rax,0x40
    4682:	62 72 2d 48 40 59 ff 	vpmulld zmm11,zmm10,ZMMWORD PTR [rcx-0x40]
    4689:	62 51 25 48 fe f6    	vpaddd zmm14,zmm11,zmm14
    468f:	62 72 7d 48 36 20    	vpermd zmm12,zmm0,ZMMWORD PTR [rax]
    4695:	48 83 c1 40          	add    rcx,0x40
    4699:	48 83 e8 40          	sub    rax,0x40
    469d:	62 72 1d 48 40 69 ff 	vpmulld zmm13,zmm12,ZMMWORD PTR [rcx-0x40]
    46a4:	62 51 15 48 fe f6    	vpaddd zmm14,zmm13,zmm14
    46aa:	4c 39 c9             	cmp    rcx,r9
    46ad:	0f 84 b4 00 00 00    	je     4767 <mul_int_array_avx512+0x1f7>
    46b3:	62 72 7d 48 36 38    	vpermd zmm15,zmm0,ZMMWORD PTR [rax]
    46b9:	62 f2 05 48 40 09    	vpmulld zmm1,zmm15,ZMMWORD PTR [rcx]
    46bf:	62 d1 75 48 fe d6    	vpaddd zmm2,zmm1,zmm14
    46c5:	62 f2 7d 48 36 58 ff 	vpermd zmm3,zmm0,ZMMWORD PTR [rax-0x40]
    46cc:	62 f2 65 48 40 61 01 	vpmulld zmm4,zmm3,ZMMWORD PTR [rcx+0x40]
    46d3:	62 f1 5d 48 fe ea    	vpaddd zmm5,zmm4,zmm2
    46d9:	62 f2 7d 48 36 70 fe 	vpermd zmm6,zmm0,ZMMWORD PTR [rax-0x80]
    46e0:	62 f2 4d 48 40 79 02 	vpmulld zmm7,zmm6,ZMMWORD PTR [rcx+0x80]
    46e7:	62 71 45 48 fe c5    	vpaddd zmm8,zmm7,zmm5
    46ed:	48 2d 00 02 00 00    	sub    rax,0x200
    46f3:	62 72 7d 48 36 48 05 	vpermd zmm9,zmm0,ZMMWORD PTR [rax+0x140]
    46fa:	62 72 35 48 40 51 03 	vpmulld zmm10,zmm9,ZMMWORD PTR [rcx+0xc0]
    4701:	62 51 2d 48 fe d8    	vpaddd zmm11,zmm10,zmm8
    4707:	62 72 7d 48 36 60 04 	vpermd zmm12,zmm0,ZMMWORD PTR [rax+0x100]
    470e:	62 72 1d 48 40 69 04 	vpmulld zmm13,zmm12,ZMMWORD PTR [rcx+0x100]
    4715:	62 72 7d 48 36 78 03 	vpermd zmm15,zmm0,ZMMWORD PTR [rax+0xc0]
    471c:	62 51 15 48 fe f3    	vpaddd zmm14,zmm13,zmm11
    4722:	62 f2 7d 48 36 70 01 	vpermd zmm6,zmm0,ZMMWORD PTR [rax+0x40]
    4729:	62 f2 05 48 40 49 05 	vpmulld zmm1,zmm15,ZMMWORD PTR [rcx+0x140]
    4730:	62 f2 4d 48 40 79 07 	vpmulld zmm7,zmm6,ZMMWORD PTR [rcx+0x1c0]
    4737:	62 d1 75 48 fe de    	vpaddd zmm3,zmm1,zmm14
    473d:	48 81 c1 00 02 00 00 	add    rcx,0x200
    4744:	62 f2 7d 48 36 50 02 	vpermd zmm2,zmm0,ZMMWORD PTR [rax+0x80]
    474b:	62 f2 6d 48 40 61 fe 	vpmulld zmm4,zmm2,ZMMWORD PTR [rcx-0x80]
    4752:	62 f1 5d 48 fe eb    	vpaddd zmm5,zmm4,zmm3
    4758:	62 71 45 48 fe f5    	vpaddd zmm14,zmm7,zmm5
    475e:	4c 39 c9             	cmp    rcx,r9
    4761:	0f 85 4c ff ff ff    	jne    46b3 <mul_int_array_avx512+0x143>
    4767:	4d 29 d0             	sub    r8,r10
    476a:	62 53 7d 48 3b f2 01 	vextracti32x8 ymm10,zmm14,0x1
    4771:	62 52 7d 48 35 ce    	vpmovzxdq zmm9,ymm14
    4777:	62 d2 7d 48 36 00    	vpermd zmm0,zmm0,ZMMWORD PTR [r8]
    477d:	62 52 7d 48 40 01    	vpmulld zmm8,zmm0,ZMMWORD PTR [r9]
    4783:	62 52 7d 48 35 da    	vpmovzxdq zmm11,ymm10
    4789:	62 71 fe 48 7f 84 24 	vmovdqu64 ZMMWORD PTR [rsp+0x20],zmm8
    4790:	20 00 00 00 
    4794:	62 51 b5 48 d4 e3    	vpaddq zmm12,zmm9,zmm11
    479a:	62 53 fd 48 3b e6 01 	vextracti64x4 ymm14,zmm12,0x1
    47a1:	c4 41 1d d4 fe       	vpaddq ymm15,ymm12,ymm14
    47a6:	c4 63 7d 39 fb 01    	vextracti128 xmm3,ymm15,0x1
    47ac:	c5 81 d4 e3          	vpaddq xmm4,xmm15,xmm3
    47b0:	c5 e9 73 dc 08       	vpsrldq xmm2,xmm4,0x8
    47b5:	c5 d9 d4 ea          	vpaddq xmm5,xmm4,xmm2
    47b9:	c4 e1 f9 7e e8       	vmovq  rax,xmm5
    47be:	85 d2                	test   edx,edx
    47c0:	0f 84 ce 00 00 00    	je     4894 <mul_int_array_avx512+0x324>
    47c6:	44 8d 5a ff          	lea    r11d,[rdx-0x1]
    47ca:	41 83 fb 06          	cmp    r11d,0x6
    47ce:	0f 86 06 01 00 00    	jbe    48da <mul_int_array_avx512+0x36a>
    47d4:	c4 63 7d 39 c7 01    	vextracti128 xmm7,ymm8,0x1
    47da:	c4 c2 7d 35 f0       	vpmovzxdq ymm6,xmm8
    47df:	c4 e2 7d 35 c7       	vpmovzxdq ymm0,xmm7
    47e4:	c5 4d d4 c0          	vpaddq ymm8,ymm6,ymm0
    47e8:	c4 43 7d 39 c2 01    	vextracti128 xmm10,ymm8,0x1
    47ee:	c4 41 39 d4 da       	vpaddq xmm11,xmm8,xmm10
    47f3:	c4 c1 19 73 db 08    	vpsrldq xmm12,xmm11,0x8
    47f9:	c4 41 21 d4 ec       	vpaddq xmm13,xmm11,xmm12
    47fe:	c4 41 f9 7e e8       	vmovq  r8,xmm13
    4803:	4c 01 c0             	add    rax,r8
    4806:	83 fa 08             	cmp    edx,0x8
    4809:	0f 84 85 00 00 00    	je     4894 <mul_int_array_avx512+0x324>
    480f:	b9 08 00 00 00       	mov    ecx,0x8
    4814:	41 b9 08 00 00 00    	mov    r9d,0x8
    481a:	89 d7                	mov    edi,edx
    481c:	29 cf                	sub    edi,ecx
    481e:	44 8d 57 ff          	lea    r10d,[rdi-0x1]
    4822:	41 83 fa 02          	cmp    r10d,0x2
    4826:	76 3a                	jbe    4862 <mul_int_array_avx512+0x2f2>
    4828:	c5 79 6f 74 8c 20    	vmovdqa xmm14,XMMWORD PTR [rsp+rcx*4+0x20]
    482e:	41 89 fb             	mov    r11d,edi
    4831:	41 83 e3 fc          	and    r11d,0xfffffffc
    4835:	c4 c1 71 73 de 08    	vpsrldq xmm1,xmm14,0x8
    483b:	c4 42 79 35 fe       	vpmovzxdq xmm15,xmm14
    4840:	45 01 d9             	add    r9d,r11d
    4843:	c4 e2 79 35 d9       	vpmovzxdq xmm3,xmm1
    4848:	c5 81 d4 e3          	vpaddq xmm4,xmm15,xmm3
    484c:	c5 e9 73 dc 08       	vpsrldq xmm2,xmm4,0x8
    4851:	c5 d9 d4 ea          	vpaddq xmm5,xmm4,xmm2
    4855:	c4 e1 f9 7e ee       	vmovq  rsi,xmm5
    485a:	48 01 f0             	add    rax,rsi
    485d:	44 39 df             	cmp    edi,r11d
    4860:	74 32                	je     4894 <mul_int_array_avx512+0x324>
    4862:	49 63 c9             	movsxd rcx,r9d
    4865:	41 8d 79 01          	lea    edi,[r9+0x1]
    4869:	44 8b 44 8c 20       	mov    r8d,DWORD PTR [rsp+rcx*4+0x20]
    486e:	4c 01 c0             	add    rax,r8
    4871:	39 fa                	cmp    edx,edi
    4873:	7e 1f                	jle    4894 <mul_int_array_avx512+0x324>
    4875:	4c 63 d7             	movsxd r10,edi
    4878:	41 83 c1 02          	add    r9d,0x2
    487c:	42 8b 74 94 20       	mov    esi,DWORD PTR [rsp+r10*4+0x20]
    4881:	48 01 f0             	add    rax,rsi
    4884:	41 39 d1             	cmp    r9d,edx
    4887:	7d 0b                	jge    4894 <mul_int_array_avx512+0x324>
    4889:	49 63 d1             	movsxd rdx,r9d
    488c:	44 8b 4c 94 20       	mov    r9d,DWORD PTR [rsp+rdx*4+0x20]
    4891:	4c 01 c8             	add    rax,r9
    4894:	48 8b 54 24 78       	mov    rdx,QWORD PTR [rsp+0x78]
    4899:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    48a0:	00 00 
    48a2:	75 40                	jne    48e4 <mul_int_array_avx512+0x374>
    48a4:	c5 f8 77             	vzeroupper 
    48a7:	c9                   	leave  
    48a8:	c3                   	ret    
    48a9:	62 d2 7d 48 36 08    	vpermd zmm1,zmm0,ZMMWORD PTR [r8]
    48af:	48 83 c1 40          	add    rcx,0x40
    48b3:	49 8d 40 c0          	lea    rax,[r8-0x40]
    48b7:	62 72 75 48 40 71 ff 	vpmulld zmm14,zmm1,ZMMWORD PTR [rcx-0x40]
    48be:	e9 45 fd ff ff       	jmp    4608 <mul_int_array_avx512+0x98>
    48c3:	62 f1 7d 48 6f 05 b3 	vmovdqa32 zmm0,ZMMWORD PTR [rip+0x2cb3]        # 7580 <__PRETTY_FUNCTION__.0+0x40>
    48ca:	2c 00 00 
    48cd:	49 89 c9             	mov    r9,rcx
    48d0:	c4 41 09 ef f6       	vpxor  xmm14,xmm14,xmm14
    48d5:	e9 90 fe ff ff       	jmp    476a <mul_int_array_avx512+0x1fa>
    48da:	31 c9                	xor    ecx,ecx
    48dc:	45 31 c9             	xor    r9d,r9d
    48df:	e9 36 ff ff ff       	jmp    481a <mul_int_array_avx512+0x2aa>
    48e4:	c5 f8 77             	vzeroupper 
    48e7:	e8 c4 da ff ff       	call   23b0 <__stack_chk_fail@plt>
    48ec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000000048f0 <urdhva>:
    48f0:	f3 0f 1e fa          	endbr64 
    48f4:	55                   	push   rbp
    48f5:	48 89 e5             	mov    rbp,rsp
    48f8:	41 57                	push   r15
    48fa:	41 56                	push   r14
    48fc:	41 55                	push   r13
    48fe:	41 54                	push   r12
    4900:	53                   	push   rbx
    4901:	48 83 e4 c0          	and    rsp,0xffffffffffffffc0
    4905:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
    490c:	89 54 24 5c          	mov    DWORD PTR [rsp+0x5c],edx
    4910:	48 89 4c 24 50       	mov    QWORD PTR [rsp+0x50],rcx
    4915:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    491c:	00 00 
    491e:	48 89 84 24 b8 00 00 	mov    QWORD PTR [rsp+0xb8],rax
    4925:	00 
    4926:	31 c0                	xor    eax,eax
    4928:	48 85 ff             	test   rdi,rdi
    492b:	0f 84 f2 0a 00 00    	je     5423 <urdhva+0xb33>
    4931:	49 89 f3             	mov    r11,rsi
    4934:	48 85 f6             	test   rsi,rsi
    4937:	0f 84 e6 0a 00 00    	je     5423 <urdhva+0xb33>
    493d:	48 85 c9             	test   rcx,rcx
    4940:	0f 95 c2             	setne  dl
    4943:	4d 85 c0             	test   r8,r8
    4946:	0f 95 c0             	setne  al
    4949:	84 c2                	test   dl,al
    494b:	0f 84 d2 0a 00 00    	je     5423 <urdhva+0xb33>
    4951:	4d 85 c9             	test   r9,r9
    4954:	0f 84 c9 0a 00 00    	je     5423 <urdhva+0xb33>
    495a:	4c 39 44 24 50       	cmp    QWORD PTR [rsp+0x50],r8
    495f:	0f 84 9f 0a 00 00    	je     5404 <urdhva+0xb14>
    4965:	48 89 cb             	mov    rbx,rcx
    4968:	48 39 cf             	cmp    rdi,rcx
    496b:	0f 84 74 0a 00 00    	je     53e5 <urdhva+0xaf5>
    4971:	48 63 4c 24 5c       	movsxd rcx,DWORD PTR [rsp+0x5c]
    4976:	4d 63 09             	movsxd r9,DWORD PTR [r9]
    4979:	4c 8d 14 8d fc ff ff 	lea    r10,[rcx*4-0x4]
    4980:	ff 
    4981:	4e 8d 64 cb f8       	lea    r12,[rbx+r9*8-0x8]
    4986:	44 89 4c 24 58       	mov    DWORD PTR [rsp+0x58],r9d
    498b:	4e 8d 2c 17          	lea    r13,[rdi+r10*1]
    498f:	4d 39 ec             	cmp    r12,r13
    4992:	0f 84 4d 0a 00 00    	je     53e5 <urdhva+0xaf5>
    4998:	4c 3b 5c 24 50       	cmp    r11,QWORD PTR [rsp+0x50]
    499d:	0f 84 23 0a 00 00    	je     53c6 <urdhva+0xad6>
    49a3:	4d 01 da             	add    r10,r11
    49a6:	4d 39 d4             	cmp    r12,r10
    49a9:	0f 84 17 0a 00 00    	je     53c6 <urdhva+0xad6>
    49af:	41 8d 51 ff          	lea    edx,[r9-0x1]
    49b3:	44 8b 7c 24 5c       	mov    r15d,DWORD PTR [rsp+0x5c]
    49b8:	48 63 c2             	movsxd rax,edx
    49bb:	89 54 24 48          	mov    DWORD PTR [rsp+0x48],edx
    49bf:	48 c1 e0 03          	shl    rax,0x3
    49c3:	45 8d 6f ff          	lea    r13d,[r15-0x1]
    49c7:	48 8d 0c 03          	lea    rcx,[rbx+rax*1]
    49cb:	4c 01 c0             	add    rax,r8
    49ce:	48 89 4c 24 40       	mov    QWORD PTR [rsp+0x40],rcx
    49d3:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
    49d8:	45 85 c9             	test   r9d,r9d
    49db:	0f 8e cd 09 00 00    	jle    53ae <urdhva+0xabe>
    49e1:	45 85 ed             	test   r13d,r13d
    49e4:	0f 88 2a 09 00 00    	js     5314 <urdhva+0xa24>
    49ea:	62 f1 7d 48 6f 05 8c 	vmovdqa32 zmm0,ZMMWORD PTR [rip+0x2b8c]        # 7580 <__PRETTY_FUNCTION__.0+0x40>
    49f1:	2b 00 00 
    49f4:	41 39 d5             	cmp    r13d,edx
    49f7:	41 0f 4e d5          	cmovle edx,r13d
    49fb:	31 f6                	xor    esi,esi
    49fd:	41 89 d7             	mov    r15d,edx
    4a00:	39 74 24 5c          	cmp    DWORD PTR [rsp+0x5c],esi
    4a04:	44 89 e8             	mov    eax,r13d
    4a07:	0f 4f c6             	cmovg  eax,esi
    4a0a:	44 8d 50 01          	lea    r10d,[rax+0x1]
    4a0e:	48 98                	cdqe   
    4a10:	49 8d 54 83 c4       	lea    rdx,[r11+rax*4-0x3c]
    4a15:	44 89 d0             	mov    eax,r10d
    4a18:	83 e0 0f             	and    eax,0xf
    4a1b:	41 c1 fa 04          	sar    r10d,0x4
    4a1f:	0f 84 e4 08 00 00    	je     5309 <urdhva+0xa19>
    4a25:	4d 63 e2             	movsxd r12,r10d
    4a28:	48 89 f9             	mov    rcx,rdi
    4a2b:	c4 41 01 ef ff       	vpxor  xmm15,xmm15,xmm15
    4a30:	49 89 d2             	mov    r10,rdx
    4a33:	49 c1 e4 06          	shl    r12,0x6
    4a37:	4d 8d 74 24 c0       	lea    r14,[r12-0x40]
    4a3c:	4e 8d 0c 27          	lea    r9,[rdi+r12*1]
    4a40:	49 c1 ee 06          	shr    r14,0x6
    4a44:	49 83 c6 01          	add    r14,0x1
    4a48:	41 83 e6 07          	and    r14d,0x7
    4a4c:	0f 84 f1 00 00 00    	je     4b43 <urdhva+0x253>
    4a52:	49 83 fe 01          	cmp    r14,0x1
    4a56:	0f 84 bd 00 00 00    	je     4b19 <urdhva+0x229>
    4a5c:	49 83 fe 02          	cmp    r14,0x2
    4a60:	0f 84 98 00 00 00    	je     4afe <urdhva+0x20e>
    4a66:	49 83 fe 03          	cmp    r14,0x3
    4a6a:	74 77                	je     4ae3 <urdhva+0x1f3>
    4a6c:	49 83 fe 04          	cmp    r14,0x4
    4a70:	74 56                	je     4ac8 <urdhva+0x1d8>
    4a72:	49 83 fe 05          	cmp    r14,0x5
    4a76:	74 35                	je     4aad <urdhva+0x1bd>
    4a78:	49 83 fe 06          	cmp    r14,0x6
    4a7c:	74 14                	je     4a92 <urdhva+0x1a2>
    4a7e:	48 8d 4f 40          	lea    rcx,[rdi+0x40]
    4a82:	4c 8d 52 c0          	lea    r10,[rdx-0x40]
    4a86:	62 f2 7d 48 36 12    	vpermd zmm2,zmm0,ZMMWORD PTR [rdx]
    4a8c:	62 72 6d 48 40 3f    	vpmulld zmm15,zmm2,ZMMWORD PTR [rdi]
    4a92:	62 d2 7d 48 36 0a    	vpermd zmm1,zmm0,ZMMWORD PTR [r10]
    4a98:	48 83 c1 40          	add    rcx,0x40
    4a9c:	49 83 ea 40          	sub    r10,0x40
    4aa0:	62 f2 75 48 40 59 ff 	vpmulld zmm3,zmm1,ZMMWORD PTR [rcx-0x40]
    4aa7:	62 51 65 48 fe ff    	vpaddd zmm15,zmm3,zmm15
    4aad:	62 d2 7d 48 36 22    	vpermd zmm4,zmm0,ZMMWORD PTR [r10]
    4ab3:	48 83 c1 40          	add    rcx,0x40
    4ab7:	49 83 ea 40          	sub    r10,0x40
    4abb:	62 f2 5d 48 40 69 ff 	vpmulld zmm5,zmm4,ZMMWORD PTR [rcx-0x40]
    4ac2:	62 51 55 48 fe ff    	vpaddd zmm15,zmm5,zmm15
    4ac8:	62 d2 7d 48 36 32    	vpermd zmm6,zmm0,ZMMWORD PTR [r10]
    4ace:	48 83 c1 40          	add    rcx,0x40
    4ad2:	49 83 ea 40          	sub    r10,0x40
    4ad6:	62 f2 4d 48 40 79 ff 	vpmulld zmm7,zmm6,ZMMWORD PTR [rcx-0x40]
    4add:	62 51 45 48 fe ff    	vpaddd zmm15,zmm7,zmm15
    4ae3:	62 52 7d 48 36 02    	vpermd zmm8,zmm0,ZMMWORD PTR [r10]
    4ae9:	48 83 c1 40          	add    rcx,0x40
    4aed:	49 83 ea 40          	sub    r10,0x40
    4af1:	62 72 3d 48 40 49 ff 	vpmulld zmm9,zmm8,ZMMWORD PTR [rcx-0x40]
    4af8:	62 51 35 48 fe ff    	vpaddd zmm15,zmm9,zmm15
    4afe:	62 52 7d 48 36 12    	vpermd zmm10,zmm0,ZMMWORD PTR [r10]
    4b04:	48 83 c1 40          	add    rcx,0x40
    4b08:	49 83 ea 40          	sub    r10,0x40
    4b0c:	62 72 2d 48 40 59 ff 	vpmulld zmm11,zmm10,ZMMWORD PTR [rcx-0x40]
    4b13:	62 51 25 48 fe ff    	vpaddd zmm15,zmm11,zmm15
    4b19:	62 52 7d 48 36 22    	vpermd zmm12,zmm0,ZMMWORD PTR [r10]
    4b1f:	48 83 c1 40          	add    rcx,0x40
    4b23:	49 83 ea 40          	sub    r10,0x40
    4b27:	62 72 1d 48 40 69 ff 	vpmulld zmm13,zmm12,ZMMWORD PTR [rcx-0x40]
    4b2e:	62 51 15 48 fe f7    	vpaddd zmm14,zmm13,zmm15
    4b34:	62 51 fd 48 6f fe    	vmovdqa64 zmm15,zmm14
    4b3a:	4c 39 c9             	cmp    rcx,r9
    4b3d:	0f 84 bb 00 00 00    	je     4bfe <urdhva+0x30e>
    4b43:	62 d2 7d 48 36 12    	vpermd zmm2,zmm0,ZMMWORD PTR [r10]
    4b49:	62 f2 6d 48 40 09    	vpmulld zmm1,zmm2,ZMMWORD PTR [rcx]
    4b4f:	62 d1 75 48 fe df    	vpaddd zmm3,zmm1,zmm15
    4b55:	62 d2 7d 48 36 62 ff 	vpermd zmm4,zmm0,ZMMWORD PTR [r10-0x40]
    4b5c:	62 f2 5d 48 40 69 01 	vpmulld zmm5,zmm4,ZMMWORD PTR [rcx+0x40]
    4b63:	62 f1 55 48 fe f3    	vpaddd zmm6,zmm5,zmm3
    4b69:	62 d2 7d 48 36 7a fe 	vpermd zmm7,zmm0,ZMMWORD PTR [r10-0x80]
    4b70:	62 72 45 48 40 41 02 	vpmulld zmm8,zmm7,ZMMWORD PTR [rcx+0x80]
    4b77:	62 71 3d 48 fe ce    	vpaddd zmm9,zmm8,zmm6
    4b7d:	62 52 7d 48 36 52 fd 	vpermd zmm10,zmm0,ZMMWORD PTR [r10-0xc0]
    4b84:	62 72 2d 48 40 59 03 	vpmulld zmm11,zmm10,ZMMWORD PTR [rcx+0xc0]
    4b8b:	62 52 7d 48 36 6a fc 	vpermd zmm13,zmm0,ZMMWORD PTR [r10-0x100]
    4b92:	62 51 25 48 fe e1    	vpaddd zmm12,zmm11,zmm9
    4b98:	62 72 15 48 40 71 04 	vpmulld zmm14,zmm13,ZMMWORD PTR [rcx+0x100]
    4b9f:	62 d2 7d 48 36 52 fb 	vpermd zmm2,zmm0,ZMMWORD PTR [r10-0x140]
    4ba6:	62 f2 6d 48 40 49 05 	vpmulld zmm1,zmm2,ZMMWORD PTR [rcx+0x140]
    4bad:	62 51 0d 48 fe fc    	vpaddd zmm15,zmm14,zmm12
    4bb3:	48 81 c1 00 02 00 00 	add    rcx,0x200
    4bba:	62 d2 7d 48 36 62 fa 	vpermd zmm4,zmm0,ZMMWORD PTR [r10-0x180]
    4bc1:	62 f2 5d 48 40 69 fe 	vpmulld zmm5,zmm4,ZMMWORD PTR [rcx-0x80]
    4bc8:	62 d1 75 48 fe df    	vpaddd zmm3,zmm1,zmm15
    4bce:	49 81 ea 00 02 00 00 	sub    r10,0x200
    4bd5:	62 d2 7d 48 36 7a 01 	vpermd zmm7,zmm0,ZMMWORD PTR [r10+0x40]
    4bdc:	62 72 45 48 40 41 ff 	vpmulld zmm8,zmm7,ZMMWORD PTR [rcx-0x40]
    4be3:	62 f1 55 48 fe f3    	vpaddd zmm6,zmm5,zmm3
    4be9:	62 71 3d 48 fe f6    	vpaddd zmm14,zmm8,zmm6
    4bef:	62 51 fd 48 6f fe    	vmovdqa64 zmm15,zmm14
    4bf5:	4c 39 c9             	cmp    rcx,r9
    4bf8:	0f 85 45 ff ff ff    	jne    4b43 <urdhva+0x253>
    4bfe:	c4 41 79 7e f6       	vmovd  r14d,xmm14
    4c03:	4c 29 e2             	sub    rdx,r12
    4c06:	c4 43 79 16 f4 01    	vpextrd r12d,xmm14,0x1
    4c0c:	c4 63 79 16 f1 02    	vpextrd ecx,xmm14,0x2
    4c12:	4d 01 e6             	add    r14,r12
    4c15:	c4 43 7d 39 f3 01    	vextracti128 xmm11,ymm14,0x1
    4c1b:	c4 43 79 16 f2 03    	vpextrd r10d,xmm14,0x3
    4c21:	49 01 ce             	add    r14,rcx
    4c24:	c4 41 79 7e dc       	vmovd  r12d,xmm11
    4c29:	4d 01 d6             	add    r14,r10
    4c2c:	c4 63 79 16 d9 01    	vpextrd ecx,xmm11,0x1
    4c32:	c4 43 79 16 da 02    	vpextrd r10d,xmm11,0x2
    4c38:	4d 01 e6             	add    r14,r12
    4c3b:	62 53 7d 48 3b f4 01 	vextracti32x8 ymm12,zmm14,0x1
    4c42:	c4 43 79 16 dc 03    	vpextrd r12d,xmm11,0x3
    4c48:	49 01 ce             	add    r14,rcx
    4c4b:	c5 79 7e e1          	vmovd  ecx,xmm12
    4c4f:	c4 43 7d 39 e6 01    	vextracti128 xmm14,ymm12,0x1
    4c55:	4d 01 d6             	add    r14,r10
    4c58:	c4 43 79 16 e2 01    	vpextrd r10d,xmm12,0x1
    4c5e:	4d 01 e6             	add    r14,r12
    4c61:	c4 43 79 16 e4 02    	vpextrd r12d,xmm12,0x2
    4c67:	49 01 ce             	add    r14,rcx
    4c6a:	c4 63 79 16 e1 03    	vpextrd ecx,xmm12,0x3
    4c70:	4d 01 d6             	add    r14,r10
    4c73:	c4 41 79 7e f2       	vmovd  r10d,xmm14
    4c78:	4d 01 e6             	add    r14,r12
    4c7b:	c4 43 79 16 f4 01    	vpextrd r12d,xmm14,0x1
    4c81:	49 01 ce             	add    r14,rcx
    4c84:	c4 63 79 16 f1 02    	vpextrd ecx,xmm14,0x2
    4c8a:	4d 01 d6             	add    r14,r10
    4c8d:	c4 43 79 16 f2 03    	vpextrd r10d,xmm14,0x3
    4c93:	4d 01 e6             	add    r14,r12
    4c96:	49 01 ce             	add    r14,rcx
    4c99:	4d 01 d6             	add    r14,r10
    4c9c:	62 72 7d 48 36 3a    	vpermd zmm15,zmm0,ZMMWORD PTR [rdx]
    4ca2:	62 d2 05 48 40 09    	vpmulld zmm1,zmm15,ZMMWORD PTR [r9]
    4ca8:	62 f1 fe 48 7f 8c 24 	vmovdqu64 ZMMWORD PTR [rsp+0x60],zmm1
    4caf:	60 00 00 00 
    4cb3:	85 c0                	test   eax,eax
    4cb5:	0f 84 cd 00 00 00    	je     4d88 <urdhva+0x498>
    4cbb:	8d 50 ff             	lea    edx,[rax-0x1]
    4cbe:	83 fa 06             	cmp    edx,0x6
    4cc1:	0f 86 5e 06 00 00    	jbe    5325 <urdhva+0xa35>
    4cc7:	c4 e3 7d 39 cb 01    	vextracti128 xmm3,ymm1,0x1
    4ccd:	c4 e2 7d 35 d1       	vpmovzxdq ymm2,xmm1
    4cd2:	c4 e2 7d 35 e3       	vpmovzxdq ymm4,xmm3
    4cd7:	c5 ed d4 ec          	vpaddq ymm5,ymm2,ymm4
    4cdb:	c4 e3 7d 39 ef 01    	vextracti128 xmm7,ymm5,0x1
    4ce1:	c5 51 d4 c7          	vpaddq xmm8,xmm5,xmm7
    4ce5:	c4 c1 31 73 d8 08    	vpsrldq xmm9,xmm8,0x8
    4ceb:	c4 41 39 d4 d1       	vpaddq xmm10,xmm8,xmm9
    4cf0:	c4 41 f9 7e d4       	vmovq  r12,xmm10
    4cf5:	4d 01 e6             	add    r14,r12
    4cf8:	83 f8 08             	cmp    eax,0x8
    4cfb:	0f 84 87 00 00 00    	je     4d88 <urdhva+0x498>
    4d01:	41 b9 08 00 00 00    	mov    r9d,0x8
    4d07:	b9 08 00 00 00       	mov    ecx,0x8
    4d0c:	41 89 c2             	mov    r10d,eax
    4d0f:	45 29 ca             	sub    r10d,r9d
    4d12:	41 8d 52 ff          	lea    edx,[r10-0x1]
    4d16:	83 fa 02             	cmp    edx,0x2
    4d19:	76 3d                	jbe    4d58 <urdhva+0x468>
    4d1b:	c4 21 79 6f 5c 8c 60 	vmovdqa xmm11,XMMWORD PTR [rsp+r9*4+0x60]
    4d22:	45 89 d4             	mov    r12d,r10d
    4d25:	41 83 e4 fc          	and    r12d,0xfffffffc
    4d29:	c4 c1 11 73 db 08    	vpsrldq xmm13,xmm11,0x8
    4d2f:	c4 42 79 35 e3       	vpmovzxdq xmm12,xmm11
    4d34:	44 01 e1             	add    ecx,r12d
    4d37:	c4 42 79 35 f5       	vpmovzxdq xmm14,xmm13
    4d3c:	c4 41 19 d4 fe       	vpaddq xmm15,xmm12,xmm14
    4d41:	c4 c1 71 73 df 08    	vpsrldq xmm1,xmm15,0x8
    4d47:	c5 81 d4 d1          	vpaddq xmm2,xmm15,xmm1
    4d4b:	c4 c1 f9 7e d1       	vmovq  r9,xmm2
    4d50:	4d 01 ce             	add    r14,r9
    4d53:	45 39 e2             	cmp    r10d,r12d
    4d56:	74 30                	je     4d88 <urdhva+0x498>
    4d58:	4c 63 d1             	movsxd r10,ecx
    4d5b:	44 8d 49 01          	lea    r9d,[rcx+0x1]
    4d5f:	42 8b 54 94 60       	mov    edx,DWORD PTR [rsp+r10*4+0x60]
    4d64:	49 01 d6             	add    r14,rdx
    4d67:	44 39 c8             	cmp    eax,r9d
    4d6a:	7e 1c                	jle    4d88 <urdhva+0x498>
    4d6c:	4d 63 e1             	movsxd r12,r9d
    4d6f:	83 c1 02             	add    ecx,0x2
    4d72:	46 8b 54 a4 60       	mov    r10d,DWORD PTR [rsp+r12*4+0x60]
    4d77:	4d 01 d6             	add    r14,r10
    4d7a:	39 c8                	cmp    eax,ecx
    4d7c:	7e 0a                	jle    4d88 <urdhva+0x498>
    4d7e:	48 63 c1             	movsxd rax,ecx
    4d81:	8b 4c 84 60          	mov    ecx,DWORD PTR [rsp+rax*4+0x60]
    4d85:	49 01 ce             	add    r14,rcx
    4d88:	85 f6                	test   esi,esi
    4d8a:	0f 84 48 05 00 00    	je     52d8 <urdhva+0x9e8>
    4d90:	83 c6 01             	add    esi,0x1
    4d93:	48 83 c3 08          	add    rbx,0x8
    4d97:	49 83 c0 08          	add    r8,0x8
    4d9b:	48 b8 4b 59 86 38 d6 	movabs rax,0x346dc5d63886594b
    4da2:	c5 6d 34 
    4da5:	49 f7 e6             	mul    r14
    4da8:	48 c1 ea 0b          	shr    rdx,0xb
    4dac:	4c 69 ca 10 27 00 00 	imul   r9,rdx,0x2710
    4db3:	4d 29 ce             	sub    r14,r9
    4db6:	4c 89 73 f8          	mov    QWORD PTR [rbx-0x8],r14
    4dba:	49 89 50 f0          	mov    QWORD PTR [r8-0x10],rdx
    4dbe:	41 39 f7             	cmp    r15d,esi
    4dc1:	0f 8d 39 fc ff ff    	jge    4a00 <urdhva+0x110>
    4dc7:	39 74 24 58          	cmp    DWORD PTR [rsp+0x58],esi
    4dcb:	0f 8e ea 03 00 00    	jle    51bb <urdhva+0x8cb>
    4dd1:	4c 63 fe             	movsxd r15,esi
    4dd4:	4d 63 f5             	movsxd r14,r13d
    4dd7:	45 31 e4             	xor    r12d,r12d
    4dda:	4d 29 f7             	sub    r15,r14
    4ddd:	4e 8d 14 bf          	lea    r10,[rdi+r15*4]
    4de1:	8b 7c 24 5c          	mov    edi,DWORD PTR [rsp+0x5c]
    4de5:	8d 4c 3f fe          	lea    ecx,[rdi+rdi*1-0x2]
    4de9:	89 4c 24 4c          	mov    DWORD PTR [rsp+0x4c],ecx
    4ded:	0f 1f 00             	nop    DWORD PTR [rax]
    4df0:	4c 89 d1             	mov    rcx,r10
    4df3:	39 74 24 5c          	cmp    DWORD PTR [rsp+0x5c],esi
    4df7:	0f 8f 9b 04 00 00    	jg     5298 <urdhva+0x9a8>
    4dfd:	8b 44 24 4c          	mov    eax,DWORD PTR [rsp+0x4c]
    4e01:	49 63 d5             	movsxd rdx,r13d
    4e04:	29 f0                	sub    eax,esi
    4e06:	83 c0 01             	add    eax,0x1
    4e09:	49 8d 54 93 c4       	lea    rdx,[r11+rdx*4-0x3c]
    4e0e:	41 89 c1             	mov    r9d,eax
    4e11:	83 e0 0f             	and    eax,0xf
    4e14:	41 c1 f9 04          	sar    r9d,0x4
    4e18:	45 85 c9             	test   r9d,r9d
    4e1b:	0f 8e dd 04 00 00    	jle    52fe <urdhva+0xa0e>
    4e21:	4d 63 f9             	movsxd r15,r9d
    4e24:	c5 e9 ef d2          	vpxor  xmm2,xmm2,xmm2
    4e28:	49 89 d1             	mov    r9,rdx
    4e2b:	49 c1 e7 06          	shl    r15,0x6
    4e2f:	4d 8d 77 c0          	lea    r14,[r15-0x40]
    4e33:	4b 8d 3c 3a          	lea    rdi,[r10+r15*1]
    4e37:	49 c1 ee 06          	shr    r14,0x6
    4e3b:	49 83 c6 01          	add    r14,0x1
    4e3f:	41 83 e6 07          	and    r14d,0x7
    4e43:	0f 84 f1 00 00 00    	je     4f3a <urdhva+0x64a>
    4e49:	49 83 fe 01          	cmp    r14,0x1
    4e4d:	0f 84 bd 00 00 00    	je     4f10 <urdhva+0x620>
    4e53:	49 83 fe 02          	cmp    r14,0x2
    4e57:	0f 84 98 00 00 00    	je     4ef5 <urdhva+0x605>
    4e5d:	49 83 fe 03          	cmp    r14,0x3
    4e61:	74 77                	je     4eda <urdhva+0x5ea>
    4e63:	49 83 fe 04          	cmp    r14,0x4
    4e67:	74 56                	je     4ebf <urdhva+0x5cf>
    4e69:	49 83 fe 05          	cmp    r14,0x5
    4e6d:	74 35                	je     4ea4 <urdhva+0x5b4>
    4e6f:	49 83 fe 06          	cmp    r14,0x6
    4e73:	74 14                	je     4e89 <urdhva+0x599>
    4e75:	49 8d 4a 40          	lea    rcx,[r10+0x40]
    4e79:	4c 8d 4a c0          	lea    r9,[rdx-0x40]
    4e7d:	62 f2 7d 48 36 1a    	vpermd zmm3,zmm0,ZMMWORD PTR [rdx]
    4e83:	62 d2 65 48 40 12    	vpmulld zmm2,zmm3,ZMMWORD PTR [r10]
    4e89:	62 d2 7d 48 36 21    	vpermd zmm4,zmm0,ZMMWORD PTR [r9]
    4e8f:	48 83 c1 40          	add    rcx,0x40
    4e93:	49 83 e9 40          	sub    r9,0x40
    4e97:	62 f2 5d 48 40 69 ff 	vpmulld zmm5,zmm4,ZMMWORD PTR [rcx-0x40]
    4e9e:	62 f1 55 48 fe d2    	vpaddd zmm2,zmm5,zmm2
    4ea4:	62 d2 7d 48 36 31    	vpermd zmm6,zmm0,ZMMWORD PTR [r9]
    4eaa:	48 83 c1 40          	add    rcx,0x40
    4eae:	49 83 e9 40          	sub    r9,0x40
    4eb2:	62 f2 4d 48 40 79 ff 	vpmulld zmm7,zmm6,ZMMWORD PTR [rcx-0x40]
    4eb9:	62 f1 45 48 fe d2    	vpaddd zmm2,zmm7,zmm2
    4ebf:	62 52 7d 48 36 01    	vpermd zmm8,zmm0,ZMMWORD PTR [r9]
    4ec5:	48 83 c1 40          	add    rcx,0x40
    4ec9:	49 83 e9 40          	sub    r9,0x40
    4ecd:	62 72 3d 48 40 49 ff 	vpmulld zmm9,zmm8,ZMMWORD PTR [rcx-0x40]
    4ed4:	62 f1 35 48 fe d2    	vpaddd zmm2,zmm9,zmm2
    4eda:	62 52 7d 48 36 11    	vpermd zmm10,zmm0,ZMMWORD PTR [r9]
    4ee0:	48 83 c1 40          	add    rcx,0x40
    4ee4:	49 83 e9 40          	sub    r9,0x40
    4ee8:	62 72 2d 48 40 59 ff 	vpmulld zmm11,zmm10,ZMMWORD PTR [rcx-0x40]
    4eef:	62 f1 25 48 fe d2    	vpaddd zmm2,zmm11,zmm2
    4ef5:	62 52 7d 48 36 21    	vpermd zmm12,zmm0,ZMMWORD PTR [r9]
    4efb:	48 83 c1 40          	add    rcx,0x40
    4eff:	49 83 e9 40          	sub    r9,0x40
    4f03:	62 72 1d 48 40 69 ff 	vpmulld zmm13,zmm12,ZMMWORD PTR [rcx-0x40]
    4f0a:	62 f1 15 48 fe d2    	vpaddd zmm2,zmm13,zmm2
    4f10:	62 52 7d 48 36 31    	vpermd zmm14,zmm0,ZMMWORD PTR [r9]
    4f16:	48 83 c1 40          	add    rcx,0x40
    4f1a:	49 83 e9 40          	sub    r9,0x40
    4f1e:	62 72 0d 48 40 79 ff 	vpmulld zmm15,zmm14,ZMMWORD PTR [rcx-0x40]
    4f25:	62 f1 05 48 fe ca    	vpaddd zmm1,zmm15,zmm2
    4f2b:	62 f1 fd 48 6f d1    	vmovdqa64 zmm2,zmm1
    4f31:	48 39 cf             	cmp    rdi,rcx
    4f34:	0f 84 bb 00 00 00    	je     4ff5 <urdhva+0x705>
    4f3a:	62 d2 7d 48 36 19    	vpermd zmm3,zmm0,ZMMWORD PTR [r9]
    4f40:	62 f2 65 48 40 21    	vpmulld zmm4,zmm3,ZMMWORD PTR [rcx]
    4f46:	62 f1 5d 48 fe ea    	vpaddd zmm5,zmm4,zmm2
    4f4c:	62 d2 7d 48 36 71 ff 	vpermd zmm6,zmm0,ZMMWORD PTR [r9-0x40]
    4f53:	62 f2 4d 48 40 79 01 	vpmulld zmm7,zmm6,ZMMWORD PTR [rcx+0x40]
    4f5a:	62 71 45 48 fe c5    	vpaddd zmm8,zmm7,zmm5
    4f60:	62 52 7d 48 36 49 fe 	vpermd zmm9,zmm0,ZMMWORD PTR [r9-0x80]
    4f67:	62 72 35 48 40 51 02 	vpmulld zmm10,zmm9,ZMMWORD PTR [rcx+0x80]
    4f6e:	62 51 2d 48 fe d8    	vpaddd zmm11,zmm10,zmm8
    4f74:	62 52 7d 48 36 61 fd 	vpermd zmm12,zmm0,ZMMWORD PTR [r9-0xc0]
    4f7b:	62 72 1d 48 40 69 03 	vpmulld zmm13,zmm12,ZMMWORD PTR [rcx+0xc0]
    4f82:	62 52 7d 48 36 79 fc 	vpermd zmm15,zmm0,ZMMWORD PTR [r9-0x100]
    4f89:	62 51 15 48 fe f3    	vpaddd zmm14,zmm13,zmm11
    4f8f:	62 f2 05 48 40 49 04 	vpmulld zmm1,zmm15,ZMMWORD PTR [rcx+0x100]
    4f96:	62 d2 7d 48 36 59 fb 	vpermd zmm3,zmm0,ZMMWORD PTR [r9-0x140]
    4f9d:	62 f2 65 48 40 61 05 	vpmulld zmm4,zmm3,ZMMWORD PTR [rcx+0x140]
    4fa4:	62 d1 75 48 fe d6    	vpaddd zmm2,zmm1,zmm14
    4faa:	48 81 c1 00 02 00 00 	add    rcx,0x200
    4fb1:	62 d2 7d 48 36 71 fa 	vpermd zmm6,zmm0,ZMMWORD PTR [r9-0x180]
    4fb8:	62 f2 4d 48 40 79 fe 	vpmulld zmm7,zmm6,ZMMWORD PTR [rcx-0x80]
    4fbf:	62 f1 5d 48 fe ea    	vpaddd zmm5,zmm4,zmm2
    4fc5:	49 81 e9 00 02 00 00 	sub    r9,0x200
    4fcc:	62 52 7d 48 36 49 01 	vpermd zmm9,zmm0,ZMMWORD PTR [r9+0x40]
    4fd3:	62 72 35 48 40 51 ff 	vpmulld zmm10,zmm9,ZMMWORD PTR [rcx-0x40]
    4fda:	62 71 45 48 fe c5    	vpaddd zmm8,zmm7,zmm5
    4fe0:	62 d1 2d 48 fe c8    	vpaddd zmm1,zmm10,zmm8
    4fe6:	62 f1 fd 48 6f d1    	vmovdqa64 zmm2,zmm1
    4fec:	48 39 cf             	cmp    rdi,rcx
    4fef:	0f 85 45 ff ff ff    	jne    4f3a <urdhva+0x64a>
    4ff5:	c4 c1 79 7e ce       	vmovd  r14d,xmm1
    4ffa:	4c 29 fa             	sub    rdx,r15
    4ffd:	c4 c3 79 16 cf 01    	vpextrd r15d,xmm1,0x1
    5003:	c4 e3 79 16 c9 02    	vpextrd ecx,xmm1,0x2
    5009:	4d 01 f7             	add    r15,r14
    500c:	c4 c3 7d 39 cd 01    	vextracti128 xmm13,ymm1,0x1
    5012:	c4 c3 79 16 c9 03    	vpextrd r9d,xmm1,0x3
    5018:	49 01 cf             	add    r15,rcx
    501b:	c4 41 79 7e ee       	vmovd  r14d,xmm13
    5020:	4d 01 cf             	add    r15,r9
    5023:	c4 63 79 16 e9 01    	vpextrd ecx,xmm13,0x1
    5029:	c4 43 79 16 e9 02    	vpextrd r9d,xmm13,0x2
    502f:	4d 01 f7             	add    r15,r14
    5032:	62 d3 7d 48 3b ce 01 	vextracti32x8 ymm14,zmm1,0x1
    5039:	c4 43 79 16 ee 03    	vpextrd r14d,xmm13,0x3
    503f:	49 01 cf             	add    r15,rcx
    5042:	c5 79 7e f1          	vmovd  ecx,xmm14
    5046:	c4 63 7d 39 f1 01    	vextracti128 xmm1,ymm14,0x1
    504c:	4d 01 cf             	add    r15,r9
    504f:	c4 43 79 16 f1 01    	vpextrd r9d,xmm14,0x1
    5055:	4d 01 f7             	add    r15,r14
    5058:	c4 43 79 16 f6 02    	vpextrd r14d,xmm14,0x2
    505e:	49 01 cf             	add    r15,rcx
    5061:	c4 63 79 16 f1 03    	vpextrd ecx,xmm14,0x3
    5067:	4d 01 cf             	add    r15,r9
    506a:	c4 c1 79 7e c9       	vmovd  r9d,xmm1
    506f:	4d 01 f7             	add    r15,r14
    5072:	c4 c3 79 16 ce 01    	vpextrd r14d,xmm1,0x1
    5078:	49 01 cf             	add    r15,rcx
    507b:	c4 e3 79 16 c9 02    	vpextrd ecx,xmm1,0x2
    5081:	4d 01 cf             	add    r15,r9
    5084:	c4 c3 79 16 c9 03    	vpextrd r9d,xmm1,0x3
    508a:	4d 01 f7             	add    r15,r14
    508d:	49 01 cf             	add    r15,rcx
    5090:	4d 01 cf             	add    r15,r9
    5093:	62 f2 7d 48 36 12    	vpermd zmm2,zmm0,ZMMWORD PTR [rdx]
    5099:	62 f2 6d 48 40 1f    	vpmulld zmm3,zmm2,ZMMWORD PTR [rdi]
    509f:	62 f1 fe 48 7f 9c 24 	vmovdqu64 ZMMWORD PTR [rsp+0x60],zmm3
    50a6:	60 00 00 00 
    50aa:	85 c0                	test   eax,eax
    50ac:	0f 84 c8 00 00 00    	je     517a <urdhva+0x88a>
    50b2:	8d 50 ff             	lea    edx,[rax-0x1]
    50b5:	83 fa 06             	cmp    edx,0x6
    50b8:	0f 86 71 02 00 00    	jbe    532f <urdhva+0xa3f>
    50be:	c4 e3 7d 39 dd 01    	vextracti128 xmm5,ymm3,0x1
    50c4:	c4 e2 7d 35 e3       	vpmovzxdq ymm4,xmm3
    50c9:	c4 e2 7d 35 f5       	vpmovzxdq ymm6,xmm5
    50ce:	c5 dd d4 fe          	vpaddq ymm7,ymm4,ymm6
    50d2:	c4 c3 7d 39 f9 01    	vextracti128 xmm9,ymm7,0x1
    50d8:	c4 41 41 d4 d1       	vpaddq xmm10,xmm7,xmm9
    50dd:	c4 c1 21 73 da 08    	vpsrldq xmm11,xmm10,0x8
    50e3:	c4 41 29 d4 e3       	vpaddq xmm12,xmm10,xmm11
    50e8:	c4 41 f9 7e e6       	vmovq  r14,xmm12
    50ed:	4d 01 f7             	add    r15,r14
    50f0:	83 f8 08             	cmp    eax,0x8
    50f3:	0f 84 81 00 00 00    	je     517a <urdhva+0x88a>
    50f9:	bf 08 00 00 00       	mov    edi,0x8
    50fe:	b9 08 00 00 00       	mov    ecx,0x8
    5103:	41 89 c1             	mov    r9d,eax
    5106:	41 29 f9             	sub    r9d,edi
    5109:	41 8d 51 ff          	lea    edx,[r9-0x1]
    510d:	83 fa 02             	cmp    edx,0x2
    5110:	76 3a                	jbe    514c <urdhva+0x85c>
    5112:	c5 79 6f 6c bc 60    	vmovdqa xmm13,XMMWORD PTR [rsp+rdi*4+0x60]
    5118:	45 89 ce             	mov    r14d,r9d
    511b:	41 83 e6 fc          	and    r14d,0xfffffffc
    511f:	c4 c1 01 73 dd 08    	vpsrldq xmm15,xmm13,0x8
    5125:	c4 42 79 35 f5       	vpmovzxdq xmm14,xmm13
    512a:	44 01 f1             	add    ecx,r14d
    512d:	c4 c2 79 35 cf       	vpmovzxdq xmm1,xmm15
    5132:	c5 89 d4 d9          	vpaddq xmm3,xmm14,xmm1
    5136:	c5 e9 73 db 08       	vpsrldq xmm2,xmm3,0x8
    513b:	c5 e1 d4 e2          	vpaddq xmm4,xmm3,xmm2
    513f:	c4 e1 f9 7e e7       	vmovq  rdi,xmm4
    5144:	49 01 ff             	add    r15,rdi
    5147:	45 39 f1             	cmp    r9d,r14d
    514a:	74 2e                	je     517a <urdhva+0x88a>
    514c:	4c 63 c9             	movsxd r9,ecx
    514f:	8d 79 01             	lea    edi,[rcx+0x1]
    5152:	42 8b 54 8c 60       	mov    edx,DWORD PTR [rsp+r9*4+0x60]
    5157:	49 01 d7             	add    r15,rdx
    515a:	39 f8                	cmp    eax,edi
    515c:	7e 1c                	jle    517a <urdhva+0x88a>
    515e:	4c 63 f7             	movsxd r14,edi
    5161:	83 c1 02             	add    ecx,0x2
    5164:	46 8b 4c b4 60       	mov    r9d,DWORD PTR [rsp+r14*4+0x60]
    5169:	4d 01 cf             	add    r15,r9
    516c:	39 c1                	cmp    ecx,eax
    516e:	7d 0a                	jge    517a <urdhva+0x88a>
    5170:	48 63 c1             	movsxd rax,ecx
    5173:	8b 4c 84 60          	mov    ecx,DWORD PTR [rsp+rax*4+0x60]
    5177:	49 01 cf             	add    r15,rcx
    517a:	85 f6                	test   esi,esi
    517c:	0f 84 26 01 00 00    	je     52a8 <urdhva+0x9b8>
    5182:	48 b8 4b 59 86 38 d6 	movabs rax,0x346dc5d63886594b
    5189:	c5 6d 34 
    518c:	83 c6 01             	add    esi,0x1
    518f:	49 83 c2 04          	add    r10,0x4
    5193:	49 f7 e7             	mul    r15
    5196:	48 c1 ea 0b          	shr    rdx,0xb
    519a:	48 69 fa 10 27 00 00 	imul   rdi,rdx,0x2710
    51a1:	49 29 ff             	sub    r15,rdi
    51a4:	4e 89 3c 23          	mov    QWORD PTR [rbx+r12*1],r15
    51a8:	4b 89 54 20 f8       	mov    QWORD PTR [r8+r12*1-0x8],rdx
    51ad:	49 83 c4 08          	add    r12,0x8
    51b1:	39 74 24 58          	cmp    DWORD PTR [rsp+0x58],esi
    51b5:	0f 8f 35 fc ff ff    	jg     4df0 <urdhva+0x500>
    51bb:	c5 f8 77             	vzeroupper 
    51be:	31 c0                	xor    eax,eax
    51c0:	be 59 17 b7 d1       	mov    esi,0xd1b71759
    51c5:	f6 44 24 48 01       	test   BYTE PTR [rsp+0x48],0x1
    51ca:	0f 84 68 01 00 00    	je     5338 <urdhva+0xa48>
    51d0:	44 8b 5c 24 48       	mov    r11d,DWORD PTR [rsp+0x48]
    51d5:	48 8b 4c 24 40       	mov    rcx,QWORD PTR [rsp+0x40]
    51da:	4c 8b 4c 24 38       	mov    r9,QWORD PTR [rsp+0x38]
    51df:	90                   	nop
    51e0:	4d 8b 31             	mov    r14,QWORD PTR [r9]
    51e3:	4d 85 f6             	test   r14,r14
    51e6:	75 07                	jne    51ef <urdhva+0x8ff>
    51e8:	45 31 ed             	xor    r13d,r13d
    51eb:	85 c0                	test   eax,eax
    51ed:	74 22                	je     5211 <urdhva+0x921>
    51ef:	44 03 31             	add    r14d,DWORD PTR [rcx]
    51f2:	44 01 f0             	add    eax,r14d
    51f5:	49 89 c5             	mov    r13,rax
    51f8:	4c 0f af ee          	imul   r13,rsi
    51fc:	49 c1 ed 2d          	shr    r13,0x2d
    5200:	45 85 db             	test   r11d,r11d
    5203:	74 09                	je     520e <urdhva+0x91e>
    5205:	41 69 fd 10 27 00 00 	imul   edi,r13d,0x2710
    520c:	29 f8                	sub    eax,edi
    520e:	48 89 01             	mov    QWORD PTR [rcx],rax
    5211:	4d 8d 79 f8          	lea    r15,[r9-0x8]
    5215:	4d 8b 49 f8          	mov    r9,QWORD PTR [r9-0x8]
    5219:	45 8d 53 ff          	lea    r10d,[r11-0x1]
    521d:	4c 8d 61 f8          	lea    r12,[rcx-0x8]
    5221:	4d 85 c9             	test   r9,r9
    5224:	75 07                	jne    522d <urdhva+0x93d>
    5226:	31 c0                	xor    eax,eax
    5228:	45 85 ed             	test   r13d,r13d
    522b:	74 26                	je     5253 <urdhva+0x963>
    522d:	45 03 0c 24          	add    r9d,DWORD PTR [r12]
    5231:	43 8d 14 29          	lea    edx,[r9+r13*1]
    5235:	48 89 d0             	mov    rax,rdx
    5238:	48 0f af c6          	imul   rax,rsi
    523c:	48 c1 e8 2d          	shr    rax,0x2d
    5240:	45 85 d2             	test   r10d,r10d
    5243:	74 0a                	je     524f <urdhva+0x95f>
    5245:	44 69 c0 10 27 00 00 	imul   r8d,eax,0x2710
    524c:	44 29 c2             	sub    edx,r8d
    524f:	49 89 14 24          	mov    QWORD PTR [r12],rdx
    5253:	45 8d 5a ff          	lea    r11d,[r10-0x1]
    5257:	49 8d 4c 24 f8       	lea    rcx,[r12-0x8]
    525c:	4d 8d 4f f8          	lea    r9,[r15-0x8]
    5260:	45 85 d2             	test   r10d,r10d
    5263:	0f 85 77 ff ff ff    	jne    51e0 <urdhva+0x8f0>
    5269:	48 8b 84 24 b8 00 00 	mov    rax,QWORD PTR [rsp+0xb8]
    5270:	00 
    5271:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    5278:	00 00 
    527a:	0f 85 41 01 00 00    	jne    53c1 <urdhva+0xad1>
    5280:	48 8b 44 24 50       	mov    rax,QWORD PTR [rsp+0x50]
    5285:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
    5289:	5b                   	pop    rbx
    528a:	41 5c                	pop    r12
    528c:	41 5d                	pop    r13
    528e:	41 5e                	pop    r14
    5290:	41 5f                	pop    r15
    5292:	5d                   	pop    rbp
    5293:	c3                   	ret    
    5294:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    5298:	44 89 e8             	mov    eax,r13d
    529b:	48 63 d6             	movsxd rdx,esi
    529e:	e9 63 fb ff ff       	jmp    4e06 <urdhva+0x516>
    52a3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    52a8:	4e 89 3c 23          	mov    QWORD PTR [rbx+r12*1],r15
    52ac:	49 83 c2 04          	add    r10,0x4
    52b0:	4b c7 44 20 f8 00 00 	mov    QWORD PTR [r8+r12*1-0x8],0x0
    52b7:	00 00 
    52b9:	49 83 c4 08          	add    r12,0x8
    52bd:	83 7c 24 58 01       	cmp    DWORD PTR [rsp+0x58],0x1
    52c2:	0f 84 f3 fe ff ff    	je     51bb <urdhva+0x8cb>
    52c8:	be 01 00 00 00       	mov    esi,0x1
    52cd:	e9 1e fb ff ff       	jmp    4df0 <urdhva+0x500>
    52d2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    52d8:	4c 89 33             	mov    QWORD PTR [rbx],r14
    52db:	49 83 c0 08          	add    r8,0x8
    52df:	48 83 c3 08          	add    rbx,0x8
    52e3:	be 01 00 00 00       	mov    esi,0x1
    52e8:	49 c7 40 f0 00 00 00 	mov    QWORD PTR [r8-0x10],0x0
    52ef:	00 
    52f0:	45 85 ff             	test   r15d,r15d
    52f3:	0f 8f 07 f7 ff ff    	jg     4a00 <urdhva+0x110>
    52f9:	e9 c9 fa ff ff       	jmp    4dc7 <urdhva+0x4d7>
    52fe:	4c 89 d7             	mov    rdi,r10
    5301:	45 31 ff             	xor    r15d,r15d
    5304:	e9 8a fd ff ff       	jmp    5093 <urdhva+0x7a3>
    5309:	49 89 f9             	mov    r9,rdi
    530c:	45 31 f6             	xor    r14d,r14d
    530f:	e9 88 f9 ff ff       	jmp    4c9c <urdhva+0x3ac>
    5314:	62 f1 7d 48 6f 05 62 	vmovdqa32 zmm0,ZMMWORD PTR [rip+0x2262]        # 7580 <__PRETTY_FUNCTION__.0+0x40>
    531b:	22 00 00 
    531e:	31 f6                	xor    esi,esi
    5320:	e9 ac fa ff ff       	jmp    4dd1 <urdhva+0x4e1>
    5325:	45 31 c9             	xor    r9d,r9d
    5328:	31 c9                	xor    ecx,ecx
    532a:	e9 dd f9 ff ff       	jmp    4d0c <urdhva+0x41c>
    532f:	31 ff                	xor    edi,edi
    5331:	31 c9                	xor    ecx,ecx
    5333:	e9 cb fd ff ff       	jmp    5103 <urdhva+0x813>
    5338:	4c 8b 5c 24 38       	mov    r11,QWORD PTR [rsp+0x38]
    533d:	49 8b 1b             	mov    rbx,QWORD PTR [r11]
    5340:	48 85 db             	test   rbx,rbx
    5343:	75 32                	jne    5377 <urdhva+0xa87>
    5345:	83 6c 24 48 01       	sub    DWORD PTR [rsp+0x48],0x1
    534a:	44 8b 7c 24 48       	mov    r15d,DWORD PTR [rsp+0x48]
    534f:	48 83 6c 24 40 08    	sub    QWORD PTR [rsp+0x40],0x8
    5355:	48 83 6c 24 38 08    	sub    QWORD PTR [rsp+0x38],0x8
    535b:	41 83 ff ff          	cmp    r15d,0xffffffff
    535f:	0f 84 04 ff ff ff    	je     5269 <urdhva+0x979>
    5365:	48 8b 4c 24 40       	mov    rcx,QWORD PTR [rsp+0x40]
    536a:	4c 8b 4c 24 38       	mov    r9,QWORD PTR [rsp+0x38]
    536f:	45 89 fb             	mov    r11d,r15d
    5372:	e9 69 fe ff ff       	jmp    51e0 <urdhva+0x8f0>
    5377:	4c 8b 6c 24 40       	mov    r13,QWORD PTR [rsp+0x40]
    537c:	44 8b 44 24 48       	mov    r8d,DWORD PTR [rsp+0x48]
    5381:	41 03 5d 00          	add    ebx,DWORD PTR [r13+0x0]
    5385:	89 da                	mov    edx,ebx
    5387:	48 89 d0             	mov    rax,rdx
    538a:	48 0f af c6          	imul   rax,rsi
    538e:	48 c1 e8 2d          	shr    rax,0x2d
    5392:	45 85 c0             	test   r8d,r8d
    5395:	74 0c                	je     53a3 <urdhva+0xab3>
    5397:	44 69 d0 10 27 00 00 	imul   r10d,eax,0x2710
    539e:	89 da                	mov    edx,ebx
    53a0:	44 29 d2             	sub    edx,r10d
    53a3:	4c 8b 64 24 40       	mov    r12,QWORD PTR [rsp+0x40]
    53a8:	49 89 14 24          	mov    QWORD PTR [r12],rdx
    53ac:	eb 97                	jmp    5345 <urdhva+0xa55>
    53ae:	44 8b 44 24 48       	mov    r8d,DWORD PTR [rsp+0x48]
    53b3:	45 85 c0             	test   r8d,r8d
    53b6:	0f 88 ad fe ff ff    	js     5269 <urdhva+0x979>
    53bc:	e9 fd fd ff ff       	jmp    51be <urdhva+0x8ce>
    53c1:	e8 ea cf ff ff       	call   23b0 <__stack_chk_fail@plt>
    53c6:	48 8d 0d 73 21 00 00 	lea    rcx,[rip+0x2173]        # 7540 <__PRETTY_FUNCTION__.0>
    53cd:	ba 85 00 00 00       	mov    edx,0x85
    53d2:	48 8d 35 2b 1c 00 00 	lea    rsi,[rip+0x1c2b]        # 7004 <_IO_stdin_used+0x4>
    53d9:	48 8d 3d 88 1e 00 00 	lea    rdi,[rip+0x1e88]        # 7268 <_IO_stdin_used+0x268>
    53e0:	e8 0b d0 ff ff       	call   23f0 <__assert_fail@plt>
    53e5:	48 8d 0d 54 21 00 00 	lea    rcx,[rip+0x2154]        # 7540 <__PRETTY_FUNCTION__.0>
    53ec:	ba 84 00 00 00       	mov    edx,0x84
    53f1:	48 8d 35 0c 1c 00 00 	lea    rsi,[rip+0x1c0c]        # 7004 <_IO_stdin_used+0x4>
    53f8:	48 8d 3d f9 1d 00 00 	lea    rdi,[rip+0x1df9]        # 71f8 <_IO_stdin_used+0x1f8>
    53ff:	e8 ec cf ff ff       	call   23f0 <__assert_fail@plt>
    5404:	48 8d 0d 35 21 00 00 	lea    rcx,[rip+0x2135]        # 7540 <__PRETTY_FUNCTION__.0>
    540b:	ba 82 00 00 00       	mov    edx,0x82
    5410:	48 8d 35 ed 1b 00 00 	lea    rsi,[rip+0x1bed]        # 7004 <_IO_stdin_used+0x4>
    5417:	48 8d 3d 82 1d 00 00 	lea    rdi,[rip+0x1d82]        # 71a0 <_IO_stdin_used+0x1a0>
    541e:	e8 cd cf ff ff       	call   23f0 <__assert_fail@plt>
    5423:	48 8d 0d 16 21 00 00 	lea    rcx,[rip+0x2116]        # 7540 <__PRETTY_FUNCTION__.0>
    542a:	ba 80 00 00 00       	mov    edx,0x80
    542f:	48 8d 35 ce 1b 00 00 	lea    rsi,[rip+0x1bce]        # 7004 <_IO_stdin_used+0x4>
    5436:	48 8d 3d 03 1d 00 00 	lea    rdi,[rip+0x1d03]        # 7140 <_IO_stdin_used+0x140>
    543d:	e8 ae cf ff ff       	call   23f0 <__assert_fail@plt>
    5442:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    5449:	00 00 00 00 
    544d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000005450 <perf_event_open>:
    5450:	f3 0f 1e fa          	endbr64 
    5454:	48 83 ec 08          	sub    rsp,0x8
    5458:	4d 89 c1             	mov    r9,r8
    545b:	31 c0                	xor    eax,eax
    545d:	41 89 c8             	mov    r8d,ecx
    5460:	89 d1                	mov    ecx,edx
    5462:	89 f2                	mov    edx,esi
    5464:	48 89 fe             	mov    rsi,rdi
    5467:	bf 2a 01 00 00       	mov    edi,0x12a
    546c:	e8 ff cf ff ff       	call   2470 <syscall@plt>
    5471:	48 83 c4 08          	add    rsp,0x8
    5475:	48 98                	cdqe   
    5477:	c3                   	ret    
    5478:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    547f:	00 

0000000000005480 <formatUrdhvaResult>:
    5480:	f3 0f 1e fa          	endbr64 
    5484:	41 57                	push   r15
    5486:	8d 04 b6             	lea    eax,[rsi+rsi*4]
    5489:	41 56                	push   r14
    548b:	8d 14 46             	lea    edx,[rsi+rax*2]
    548e:	41 55                	push   r13
    5490:	41 54                	push   r12
    5492:	55                   	push   rbp
    5493:	53                   	push   rbx
    5494:	48 89 fb             	mov    rbx,rdi
    5497:	8d 7a 01             	lea    edi,[rdx+0x1]
    549a:	48 63 ff             	movsxd rdi,edi
    549d:	48 83 ec 18          	sub    rsp,0x18
    54a1:	89 74 24 0c          	mov    DWORD PTR [rsp+0xc],esi
    54a5:	be 01 00 00 00       	mov    esi,0x1
    54aa:	89 54 24 08          	mov    DWORD PTR [rsp+0x8],edx
    54ae:	e8 ad cf ff ff       	call   2460 <calloc@plt>
    54b3:	48 85 c0             	test   rax,rax
    54b6:	0f 84 26 02 00 00    	je     56e2 <formatUrdhvaResult+0x262>
    54bc:	4c 63 64 24 0c       	movsxd r12,DWORD PTR [rsp+0xc]
    54c1:	48 89 c5             	mov    rbp,rax
    54c4:	49 89 c6             	mov    r14,rax
    54c7:	45 31 ff             	xor    r15d,r15d
    54ca:	4c 8d 2d 41 1b 00 00 	lea    r13,[rip+0x1b41]        # 7012 <_IO_stdin_used+0x12>
    54d1:	45 85 e4             	test   r12d,r12d
    54d4:	7f 45                	jg     551b <formatUrdhvaResult+0x9b>
    54d6:	e9 b5 01 00 00       	jmp    5690 <formatUrdhvaResult+0x210>
    54db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    54e0:	4e 8b 0c fb          	mov    r9,QWORD PTR [rbx+r15*8]
    54e4:	4d 89 c8             	mov    r8,r9
    54e7:	49 81 f9 e7 03 00 00 	cmp    r9,0x3e7
    54ee:	76 40                	jbe    5530 <formatUrdhvaResult+0xb0>
    54f0:	4c 89 f7             	mov    rdi,r14
    54f3:	4c 89 e9             	mov    rcx,r13
    54f6:	48 c7 c2 ff ff ff ff 	mov    rdx,0xffffffffffffffff
    54fd:	31 c0                	xor    eax,eax
    54ff:	be 01 00 00 00       	mov    esi,0x1
    5504:	e8 87 d0 ff ff       	call   2590 <__sprintf_chk@plt>
    5509:	48 98                	cdqe   
    550b:	49 01 c6             	add    r14,rax
    550e:	49 83 c7 01          	add    r15,0x1
    5512:	4d 39 fc             	cmp    r12,r15
    5515:	0f 84 75 01 00 00    	je     5690 <formatUrdhvaResult+0x210>
    551b:	4d 85 ff             	test   r15,r15
    551e:	75 c0                	jne    54e0 <formatUrdhvaResult+0x60>
    5520:	48 83 3b 00          	cmp    QWORD PTR [rbx],0x0
    5524:	74 e8                	je     550e <formatUrdhvaResult+0x8e>
    5526:	4c 8b 03             	mov    r8,QWORD PTR [rbx]
    5529:	eb c5                	jmp    54f0 <formatUrdhvaResult+0x70>
    552b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    5530:	41 b8 09 00 00 00    	mov    r8d,0x9
    5536:	bf e8 03 00 00       	mov    edi,0x3e8
    553b:	45 39 c1             	cmp    r9d,r8d
    553e:	45 0f 4d c1          	cmovge r8d,r9d
    5542:	45 31 db             	xor    r11d,r11d
    5545:	0f 1f 00             	nop    DWORD PTR [rax]
    5548:	4c 63 d7             	movsxd r10,edi
    554b:	c1 ff 1f             	sar    edi,0x1f
    554e:	44 89 de             	mov    esi,r11d
    5551:	49 69 c2 67 66 66 66 	imul   rax,r10,0x66666667
    5558:	45 8d 5b 01          	lea    r11d,[r11+0x1]
    555c:	48 c1 f8 22          	sar    rax,0x22
    5560:	29 f8                	sub    eax,edi
    5562:	89 c7                	mov    edi,eax
    5564:	44 39 c0             	cmp    eax,r8d
    5567:	7f df                	jg     5548 <formatUrdhvaResult+0xc8>
    5569:	31 c0                	xor    eax,eax
    556b:	41 83 e3 07          	and    r11d,0x7
    556f:	0f 84 ac 00 00 00    	je     5621 <formatUrdhvaResult+0x1a1>
    5575:	41 83 fb 01          	cmp    r11d,0x1
    5579:	0f 84 89 00 00 00    	je     5608 <formatUrdhvaResult+0x188>
    557f:	41 83 fb 02          	cmp    r11d,0x2
    5583:	74 72                	je     55f7 <formatUrdhvaResult+0x177>
    5585:	41 83 fb 03          	cmp    r11d,0x3
    5589:	74 5b                	je     55e6 <formatUrdhvaResult+0x166>
    558b:	41 83 fb 04          	cmp    r11d,0x4
    558f:	74 43                	je     55d4 <formatUrdhvaResult+0x154>
    5591:	41 83 fb 05          	cmp    r11d,0x5
    5595:	74 2b                	je     55c2 <formatUrdhvaResult+0x142>
    5597:	41 83 fb 06          	cmp    r11d,0x6
    559b:	74 13                	je     55b0 <formatUrdhvaResult+0x130>
    559d:	b9 30 00 00 00       	mov    ecx,0x30
    55a2:	49 83 c6 01          	add    r14,0x1
    55a6:	b8 01 00 00 00       	mov    eax,0x1
    55ab:	66 41 89 4e ff       	mov    WORD PTR [r14-0x1],cx
    55b0:	41 b8 30 00 00 00    	mov    r8d,0x30
    55b6:	49 83 c6 01          	add    r14,0x1
    55ba:	83 c0 01             	add    eax,0x1
    55bd:	66 45 89 46 ff       	mov    WORD PTR [r14-0x1],r8w
    55c2:	41 bb 30 00 00 00    	mov    r11d,0x30
    55c8:	49 83 c6 01          	add    r14,0x1
    55cc:	83 c0 01             	add    eax,0x1
    55cf:	66 45 89 5e ff       	mov    WORD PTR [r14-0x1],r11w
    55d4:	41 ba 30 00 00 00    	mov    r10d,0x30
    55da:	49 83 c6 01          	add    r14,0x1
    55de:	83 c0 01             	add    eax,0x1
    55e1:	66 45 89 56 ff       	mov    WORD PTR [r14-0x1],r10w
    55e6:	ba 30 00 00 00       	mov    edx,0x30
    55eb:	49 83 c6 01          	add    r14,0x1
    55ef:	83 c0 01             	add    eax,0x1
    55f2:	66 41 89 56 ff       	mov    WORD PTR [r14-0x1],dx
    55f7:	bf 30 00 00 00       	mov    edi,0x30
    55fc:	49 83 c6 01          	add    r14,0x1
    5600:	83 c0 01             	add    eax,0x1
    5603:	66 41 89 7e ff       	mov    WORD PTR [r14-0x1],di
    5608:	b9 30 00 00 00       	mov    ecx,0x30
    560d:	41 89 c0             	mov    r8d,eax
    5610:	49 83 c6 01          	add    r14,0x1
    5614:	83 c0 01             	add    eax,0x1
    5617:	66 41 89 4e ff       	mov    WORD PTR [r14-0x1],cx
    561c:	41 39 f0             	cmp    r8d,esi
    561f:	74 63                	je     5684 <formatUrdhvaResult+0x204>
    5621:	41 bb 30 00 00 00    	mov    r11d,0x30
    5627:	41 ba 30 00 00 00    	mov    r10d,0x30
    562d:	ba 30 00 00 00       	mov    edx,0x30
    5632:	bf 30 00 00 00       	mov    edi,0x30
    5637:	66 45 89 1e          	mov    WORD PTR [r14],r11w
    563b:	b9 30 00 00 00       	mov    ecx,0x30
    5640:	41 b8 30 00 00 00    	mov    r8d,0x30
    5646:	49 83 c6 08          	add    r14,0x8
    564a:	66 45 89 56 f9       	mov    WORD PTR [r14-0x7],r10w
    564f:	41 bb 30 00 00 00    	mov    r11d,0x30
    5655:	44 8d 50 07          	lea    r10d,[rax+0x7]
    5659:	83 c0 08             	add    eax,0x8
    565c:	66 41 89 56 fa       	mov    WORD PTR [r14-0x6],dx
    5661:	ba 30 00 00 00       	mov    edx,0x30
    5666:	66 41 89 7e fb       	mov    WORD PTR [r14-0x5],di
    566b:	66 41 89 4e fc       	mov    WORD PTR [r14-0x4],cx
    5670:	66 45 89 46 fd       	mov    WORD PTR [r14-0x3],r8w
    5675:	66 45 89 5e fe       	mov    WORD PTR [r14-0x2],r11w
    567a:	66 41 89 56 ff       	mov    WORD PTR [r14-0x1],dx
    567f:	41 39 f2             	cmp    r10d,esi
    5682:	75 9d                	jne    5621 <formatUrdhvaResult+0x1a1>
    5684:	4d 89 c8             	mov    r8,r9
    5687:	e9 64 fe ff ff       	jmp    54f0 <formatUrdhvaResult+0x70>
    568c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    5690:	45 31 e4             	xor    r12d,r12d
    5693:	80 7d 00 30          	cmp    BYTE PTR [rbp+0x0],0x30
    5697:	48 8d 5d 01          	lea    rbx,[rbp+0x1]
    569b:	49 89 ef             	mov    r15,rbp
    569e:	49 c7 c6 ff ff ff ff 	mov    r14,0xffffffffffffffff
    56a5:	75 1d                	jne    56c4 <formatUrdhvaResult+0x244>
    56a7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    56ae:	00 00 
    56b0:	49 89 df             	mov    r15,rbx
    56b3:	48 83 c3 01          	add    rbx,0x1
    56b7:	4d 63 f4             	movsxd r14,r12d
    56ba:	41 83 c4 01          	add    r12d,0x1
    56be:	80 7b ff 30          	cmp    BYTE PTR [rbx-0x1],0x30
    56c2:	74 ec                	je     56b0 <formatUrdhvaResult+0x230>
    56c4:	4c 01 f5             	add    rbp,r14
    56c7:	4c 89 f8             	mov    rax,r15
    56ca:	44 39 64 24 08       	cmp    DWORD PTR [rsp+0x8],r12d
    56cf:	48 0f 44 c5          	cmove  rax,rbp
    56d3:	48 83 c4 18          	add    rsp,0x18
    56d7:	5b                   	pop    rbx
    56d8:	5d                   	pop    rbp
    56d9:	41 5c                	pop    r12
    56db:	41 5d                	pop    r13
    56dd:	41 5e                	pop    r14
    56df:	41 5f                	pop    r15
    56e1:	c3                   	ret    
    56e2:	48 8d 3d ef 1b 00 00 	lea    rdi,[rip+0x1bef]        # 72d8 <_IO_stdin_used+0x2d8>
    56e9:	e8 12 ce ff ff       	call   2500 <perror@plt>
    56ee:	bf 01 00 00 00       	mov    edi,0x1
    56f3:	e8 18 ce ff ff       	call   2510 <exit@plt>
    56f8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    56ff:	00 

0000000000005700 <returnLimbs>:
    5700:	f3 0f 1e fa          	endbr64 
    5704:	41 57                	push   r15
    5706:	41 56                	push   r14
    5708:	41 55                	push   r13
    570a:	41 54                	push   r12
    570c:	55                   	push   rbp
    570d:	53                   	push   rbx
    570e:	48 83 ec 48          	sub    rsp,0x48
    5712:	44 8b 3e             	mov    r15d,DWORD PTR [rsi]
    5715:	48 89 7c 24 18       	mov    QWORD PTR [rsp+0x18],rdi
    571a:	48 8d 7c 24 30       	lea    rdi,[rsp+0x30]
    571f:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
    5724:	45 8d 77 03          	lea    r14d,[r15+0x3]
    5728:	be 40 00 00 00       	mov    esi,0x40
    572d:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    5734:	00 00 
    5736:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
    573b:	31 c0                	xor    eax,eax
    573d:	45 85 ff             	test   r15d,r15d
    5740:	44 89 f8             	mov    eax,r15d
    5743:	45 0f 49 f7          	cmovns r14d,r15d
    5747:	83 e0 03             	and    eax,0x3
    574a:	41 c1 fe 02          	sar    r14d,0x2
    574e:	83 f8 01             	cmp    eax,0x1
    5751:	41 83 de ff          	sbb    r14d,0xffffffff
    5755:	49 63 d6             	movsxd rdx,r14d
    5758:	44 89 74 24 24       	mov    DWORD PTR [rsp+0x24],r14d
    575d:	48 c1 e2 02          	shl    rdx,0x2
    5761:	e8 da cd ff ff       	call   2540 <posix_memalign@plt>
    5766:	85 c0                	test   eax,eax
    5768:	74 16                	je     5780 <returnLimbs+0x80>
    576a:	48 8d 3d 97 1b 00 00 	lea    rdi,[rip+0x1b97]        # 7308 <_IO_stdin_used+0x308>
    5771:	e8 da cb ff ff       	call   2350 <puts@plt>
    5776:	bf 01 00 00 00       	mov    edi,0x1
    577b:	e8 90 cd ff ff       	call   2510 <exit@plt>
    5780:	48 8b 54 24 30       	mov    rdx,QWORD PTR [rsp+0x30]
    5785:	48 89 54 24 10       	mov    QWORD PTR [rsp+0x10],rdx
    578a:	48 85 d2             	test   rdx,rdx
    578d:	74 db                	je     576a <returnLimbs+0x6a>
    578f:	8b 4c 24 24          	mov    ecx,DWORD PTR [rsp+0x24]
    5793:	8d 69 ff             	lea    ebp,[rcx-0x1]
    5796:	41 83 ef 01          	sub    r15d,0x1
    579a:	0f 88 8b 00 00 00    	js     582b <returnLimbs+0x12b>
    57a0:	c5 e8 57 d2          	vxorps xmm2,xmm2,xmm2
    57a4:	48 63 ed             	movsxd rbp,ebp
    57a7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    57ae:	00 00 
    57b0:	48 8b 7c 24 18       	mov    rdi,QWORD PTR [rsp+0x18]
    57b5:	89 6c 24 20          	mov    DWORD PTR [rsp+0x20],ebp
    57b9:	49 63 f7             	movsxd rsi,r15d
    57bc:	41 8d 5f fd          	lea    ebx,[r15-0x3]
    57c0:	45 89 fc             	mov    r12d,r15d
    57c3:	45 31 f6             	xor    r14d,r14d
    57c6:	4c 8d 2c b7          	lea    r13,[rdi+rsi*4]
    57ca:	45 89 f8             	mov    r8d,r15d
    57cd:	62 d1 6f 08 7b 45 00 	vcvtusi2sd xmm0,xmm2,DWORD PTR [r13+0x0]
    57d4:	4c 8b 0d a5 1e 00 00 	mov    r9,QWORD PTR [rip+0x1ea5]        # 7680 <__PRETTY_FUNCTION__.0+0x140>
    57db:	45 29 e0             	sub    r8d,r12d
    57de:	41 83 ec 01          	sub    r12d,0x1
    57e2:	c4 c1 6b 2a c8       	vcvtsi2sd xmm1,xmm2,r8d
    57e7:	c5 fb 11 44 24 08    	vmovsd QWORD PTR [rsp+0x8],xmm0
    57ed:	c4 c1 f9 6e c1       	vmovq  xmm0,r9
    57f2:	e8 89 cb ff ff       	call   2380 <pow@plt>
    57f7:	c5 e8 57 d2          	vxorps xmm2,xmm2,xmm2
    57fb:	62 d1 6f 08 7b de    	vcvtusi2sd xmm3,xmm2,r14d
    5801:	c4 e2 f9 b9 5c 24 08 	vfmadd231sd xmm3,xmm0,QWORD PTR [rsp+0x8]
    5808:	62 71 7f 08 78 f3    	vcvttsd2usi r14d,xmm3
    580e:	44 39 e3             	cmp    ebx,r12d
    5811:	7f 4d                	jg     5860 <returnLimbs+0x160>
    5813:	49 83 ed 04          	sub    r13,0x4
    5817:	41 83 fc ff          	cmp    r12d,0xffffffff
    581b:	75 ad                	jne    57ca <returnLimbs+0xca>
    581d:	4c 63 5c 24 20       	movsxd r11,DWORD PTR [rsp+0x20]
    5822:	48 8b 44 24 10       	mov    rax,QWORD PTR [rsp+0x10]
    5827:	46 89 34 98          	mov    DWORD PTR [rax+r11*4],r14d
    582b:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
    5830:	8b 4c 24 24          	mov    ecx,DWORD PTR [rsp+0x24]
    5834:	89 0a                	mov    DWORD PTR [rdx],ecx
    5836:	48 8b 44 24 38       	mov    rax,QWORD PTR [rsp+0x38]
    583b:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    5842:	00 00 
    5844:	75 35                	jne    587b <returnLimbs+0x17b>
    5846:	48 8b 44 24 10       	mov    rax,QWORD PTR [rsp+0x10]
    584b:	48 83 c4 48          	add    rsp,0x48
    584f:	5b                   	pop    rbx
    5850:	5d                   	pop    rbp
    5851:	41 5c                	pop    r12
    5853:	41 5d                	pop    r13
    5855:	41 5e                	pop    r14
    5857:	41 5f                	pop    r15
    5859:	c3                   	ret    
    585a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    5860:	4c 8b 54 24 10       	mov    r10,QWORD PTR [rsp+0x10]
    5865:	45 89 34 aa          	mov    DWORD PTR [r10+rbp*4],r14d
    5869:	48 83 ed 01          	sub    rbp,0x1
    586d:	41 83 fc ff          	cmp    r12d,0xffffffff
    5871:	74 b8                	je     582b <returnLimbs+0x12b>
    5873:	45 89 e7             	mov    r15d,r12d
    5876:	e9 35 ff ff ff       	jmp    57b0 <returnLimbs+0xb0>
    587b:	e8 30 cb ff ff       	call   23b0 <__stack_chk_fail@plt>

0000000000005880 <returnDigits>:
    5880:	f3 0f 1e fa          	endbr64 
    5884:	55                   	push   rbp
    5885:	48 89 d1             	mov    rcx,rdx
    5888:	8d 56 ff             	lea    edx,[rsi-0x1]
    588b:	48 89 e5             	mov    rbp,rsp
    588e:	41 57                	push   r15
    5890:	44 8d 3c 95 00 00 00 	lea    r15d,[rdx*4+0x0]
    5897:	00 
    5898:	41 56                	push   r14
    589a:	41 89 f6             	mov    r14d,esi
    589d:	41 55                	push   r13
    589f:	49 89 fd             	mov    r13,rdi
    58a2:	41 54                	push   r12
    58a4:	53                   	push   rbx
    58a5:	48 83 e4 c0          	and    rsp,0xffffffffffffffc0
    58a9:	48 83 ec 40          	sub    rsp,0x40
    58ad:	8b 1f                	mov    ebx,DWORD PTR [rdi]
    58af:	85 db                	test   ebx,ebx
    58b1:	0f 8e 61 09 00 00    	jle    6218 <returnDigits+0x998>
    58b7:	89 d8                	mov    eax,ebx
    58b9:	45 31 e4             	xor    r12d,r12d
    58bc:	41 b8 cd cc cc cc    	mov    r8d,0xcccccccd
    58c2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    58c8:	89 c0                	mov    eax,eax
    58ca:	44 89 e6             	mov    esi,r12d
    58cd:	41 83 c4 01          	add    r12d,0x1
    58d1:	48 89 c7             	mov    rdi,rax
    58d4:	49 0f af c0          	imul   rax,r8
    58d8:	48 c1 e8 23          	shr    rax,0x23
    58dc:	83 ff 09             	cmp    edi,0x9
    58df:	7f e7                	jg     58c8 <returnDigits+0x48>
    58e1:	45 01 e7             	add    r15d,r12d
    58e4:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
    58e9:	49 63 ff             	movsxd rdi,r15d
    58ec:	89 54 24 2c          	mov    DWORD PTR [rsp+0x2c],edx
    58f0:	48 c1 e7 02          	shl    rdi,0x2
    58f4:	89 74 24 38          	mov    DWORD PTR [rsp+0x38],esi
    58f8:	e8 b3 cb ff ff       	call   24b0 <malloc@plt>
    58fd:	4c 63 54 24 38       	movsxd r10,DWORD PTR [rsp+0x38]
    5902:	48 8b 4c 24 30       	mov    rcx,QWORD PTR [rsp+0x30]
    5907:	48 85 c0             	test   rax,rax
    590a:	44 8b 5c 24 2c       	mov    r11d,DWORD PTR [rsp+0x2c]
    590f:	49 89 c1             	mov    r9,rax
    5912:	0f 84 3e 09 00 00    	je     6256 <returnDigits+0x9d6>
    5918:	4b 8d 14 91          	lea    rdx,[r9+r10*4]
    591c:	41 b8 cd cc cc cc    	mov    r8d,0xcccccccd
    5922:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    5928:	89 de                	mov    esi,ebx
    592a:	41 89 da             	mov    r10d,ebx
    592d:	48 83 ea 04          	sub    rdx,0x4
    5931:	49 0f af f0          	imul   rsi,r8
    5935:	48 c1 ee 23          	shr    rsi,0x23
    5939:	8d 04 b6             	lea    eax,[rsi+rsi*4]
    593c:	48 89 f7             	mov    rdi,rsi
    593f:	89 de                	mov    esi,ebx
    5941:	01 c0                	add    eax,eax
    5943:	89 fb                	mov    ebx,edi
    5945:	41 29 c2             	sub    r10d,eax
    5948:	44 89 52 04          	mov    DWORD PTR [rdx+0x4],r10d
    594c:	83 fe 09             	cmp    esi,0x9
    594f:	7f d7                	jg     5928 <returnDigits+0xa8>
    5951:	41 83 fe 01          	cmp    r14d,0x1
    5955:	0f 8e a8 08 00 00    	jle    6203 <returnDigits+0x983>
    595b:	41 8d 5e fe          	lea    ebx,[r14-0x2]
    595f:	83 fb 0e             	cmp    ebx,0xe
    5962:	0f 86 df 08 00 00    	jbe    6247 <returnDigits+0x9c7>
    5968:	45 89 da             	mov    r10d,r11d
    596b:	4d 63 c4             	movsxd r8,r12d
    596e:	62 f2 7d 48 58 2d 88 	vpbroadcastd zmm5,DWORD PTR [rip+0x1d88]        # 7700 <__PRETTY_FUNCTION__.0+0x1c0>
    5975:	1d 00 00 
    5978:	62 71 7d 48 6f 0d 3e 	vmovdqa32 zmm9,ZMMWORD PTR [rip+0x1c3e]        # 75c0 <__PRETTY_FUNCTION__.0+0x80>
    597f:	1c 00 00 
    5982:	41 c1 ea 04          	shr    r10d,0x4
    5986:	49 8d 55 04          	lea    rdx,[r13+0x4]
    598a:	4b 8d 04 81          	lea    rax,[r9+r8*4]
    598e:	62 71 7d 48 6f 05 68 	vmovdqa32 zmm8,ZMMWORD PTR [rip+0x1c68]        # 7600 <__PRETTY_FUNCTION__.0+0xc0>
    5995:	1c 00 00 
    5998:	62 f1 7d 48 6f 3d 9e 	vmovdqa32 zmm7,ZMMWORD PTR [rip+0x1c9e]        # 7640 <__PRETTY_FUNCTION__.0+0x100>
    599f:	1c 00 00 
    59a2:	41 83 ea 01          	sub    r10d,0x1
    59a6:	49 c1 e2 06          	shl    r10,0x6
    59aa:	4b 8d 5c 15 44       	lea    rbx,[r13+r10*1+0x44]
    59af:	90                   	nop
    59b0:	62 f2 d5 48 28 02    	vpmuldq zmm0,zmm5,ZMMWORD PTR [rdx]
    59b6:	62 71 7e 48 6f 2a    	vmovdqu32 zmm13,ZMMWORD PTR [rdx]
    59bc:	48 83 c2 40          	add    rdx,0x40
    59c0:	62 f1 f5 48 73 52 ff 	vpsrlq zmm1,ZMMWORD PTR [rdx-0x40],0x20
    59c7:	20 
    59c8:	62 f1 5d 48 72 62 ff 	vpsrad zmm4,ZMMWORD PTR [rdx-0x40],0x1f
    59cf:	1f 
    59d0:	48 05 00 01 00 00    	add    rax,0x100
    59d6:	62 f2 f5 48 28 d5    	vpmuldq zmm2,zmm1,zmm5
    59dc:	62 f2 35 48 7e c2    	vpermt2d zmm0,zmm9,zmm2
    59e2:	62 f1 65 48 72 e0 02 	vpsrad zmm3,zmm0,0x2
    59e9:	62 f1 65 48 fa f4    	vpsubd zmm6,zmm3,zmm4
    59ef:	62 f1 fd 48 73 d6 20 	vpsrlq zmm0,zmm6,0x20
    59f6:	62 72 cd 48 28 fd    	vpmuldq zmm15,zmm6,zmm5
    59fc:	62 f2 fd 48 28 cd    	vpmuldq zmm1,zmm0,zmm5
    5a02:	62 f1 6d 48 72 e6 1f 	vpsrad zmm2,zmm6,0x1f
    5a09:	62 f1 2d 48 72 f6 02 	vpslld zmm10,zmm6,0x2
    5a10:	62 71 2d 48 fe de    	vpaddd zmm11,zmm10,zmm6
    5a16:	62 d1 1d 48 72 f3 01 	vpslld zmm12,zmm11,0x1
    5a1d:	62 51 15 48 fa f4    	vpsubd zmm14,zmm13,zmm12
    5a23:	62 72 35 48 7e f9    	vpermt2d zmm15,zmm9,zmm1
    5a29:	62 d1 65 48 72 e7 02 	vpsrad zmm3,zmm15,0x2
    5a30:	62 f1 65 48 fa e2    	vpsubd zmm4,zmm3,zmm2
    5a36:	62 f1 2d 48 72 f4 02 	vpslld zmm10,zmm4,0x2
    5a3d:	62 f1 85 48 73 d4 20 	vpsrlq zmm15,zmm4,0x20
    5a44:	62 71 2d 48 fe dc    	vpaddd zmm11,zmm10,zmm4
    5a4a:	62 f2 85 48 28 c5    	vpmuldq zmm0,zmm15,zmm5
    5a50:	62 d1 1d 48 72 f3 01 	vpslld zmm12,zmm11,0x1
    5a57:	62 f1 65 48 72 e4 1f 	vpsrad zmm3,zmm4,0x1f
    5a5e:	62 51 4d 48 fa ec    	vpsubd zmm13,zmm6,zmm12
    5a64:	62 f2 dd 48 28 f5    	vpmuldq zmm6,zmm4,zmm5
    5a6a:	62 f2 35 48 7e f0    	vpermt2d zmm6,zmm9,zmm0
    5a70:	62 f1 75 48 72 e6 02 	vpsrad zmm1,zmm6,0x2
    5a77:	62 71 75 48 fa d3    	vpsubd zmm10,zmm1,zmm3
    5a7d:	62 d1 cd 48 73 d2 20 	vpsrlq zmm6,zmm10,0x20
    5a84:	62 72 ad 48 28 fd    	vpmuldq zmm15,zmm10,zmm5
    5a8a:	62 f2 cd 48 28 c5    	vpmuldq zmm0,zmm6,zmm5
    5a90:	62 d1 6d 48 72 f2 02 	vpslld zmm2,zmm10,0x2
    5a97:	62 d1 7d 48 6f f6    	vmovdqa32 zmm6,zmm14
    5a9d:	62 d1 65 48 72 e2 1f 	vpsrad zmm3,zmm10,0x1f
    5aa4:	62 51 6d 48 fe da    	vpaddd zmm11,zmm2,zmm10
    5aaa:	62 d1 1d 48 72 f3 01 	vpslld zmm12,zmm11,0x1
    5ab1:	62 d1 5d 48 fa e4    	vpsubd zmm4,zmm4,zmm12
    5ab7:	62 f2 3d 48 7e f4    	vpermt2d zmm6,zmm8,zmm4
    5abd:	62 72 45 48 7e f4    	vpermt2d zmm14,zmm7,zmm4
    5ac3:	62 d1 7d 48 6f e5    	vmovdqa32 zmm4,zmm13
    5ac9:	62 72 35 48 7e f8    	vpermt2d zmm15,zmm9,zmm0
    5acf:	62 f1 7d 48 6f c6    	vmovdqa32 zmm0,zmm6
    5ad5:	62 d1 75 48 72 e7 02 	vpsrad zmm1,zmm15,0x2
    5adc:	62 f1 75 48 fa d3    	vpsubd zmm2,zmm1,zmm3
    5ae2:	62 d1 7d 48 6f ce    	vmovdqa32 zmm1,zmm14
    5ae8:	62 f1 25 48 72 f2 02 	vpslld zmm11,zmm2,0x2
    5aef:	62 71 25 48 fe e2    	vpaddd zmm12,zmm11,zmm2
    5af5:	62 d1 05 48 72 f4 01 	vpslld zmm15,zmm12,0x1
    5afc:	62 51 2d 48 fa d7    	vpsubd zmm10,zmm10,zmm15
    5b02:	62 d2 3d 48 7e e2    	vpermt2d zmm4,zmm8,zmm10
    5b08:	62 52 45 48 7e ea    	vpermt2d zmm13,zmm7,zmm10
    5b0e:	62 f2 3d 48 7e c4    	vpermt2d zmm0,zmm8,zmm4
    5b14:	62 f2 45 48 7e f4    	vpermt2d zmm6,zmm7,zmm4
    5b1a:	62 d2 3d 48 7e cd    	vpermt2d zmm1,zmm8,zmm13
    5b20:	62 52 45 48 7e f5    	vpermt2d zmm14,zmm7,zmm13
    5b26:	62 f1 7e 48 7f 48 fe 	vmovdqu32 ZMMWORD PTR [rax-0x80],zmm1
    5b2d:	62 f1 7e 48 7f 40 fc 	vmovdqu32 ZMMWORD PTR [rax-0x100],zmm0
    5b34:	62 f1 7e 48 7f 70 fd 	vmovdqu32 ZMMWORD PTR [rax-0xc0],zmm6
    5b3b:	62 71 7e 48 7f 70 ff 	vmovdqu32 ZMMWORD PTR [rax-0x40],zmm14
    5b42:	48 39 d3             	cmp    rbx,rdx
    5b45:	0f 85 65 fe ff ff    	jne    59b0 <returnDigits+0x130>
    5b4b:	44 89 df             	mov    edi,r11d
    5b4e:	83 e7 f0             	and    edi,0xfffffff0
    5b51:	45 8d 04 bc          	lea    r8d,[r12+rdi*4]
    5b55:	8d 77 01             	lea    esi,[rdi+0x1]
    5b58:	41 39 fb             	cmp    r11d,edi
    5b5b:	0f 84 9f 06 00 00    	je     6200 <returnDigits+0x980>
    5b61:	45 89 f3             	mov    r11d,r14d
    5b64:	41 29 fb             	sub    r11d,edi
    5b67:	41 8d 53 ff          	lea    edx,[r11-0x1]
    5b6b:	41 83 eb 02          	sub    r11d,0x2
    5b6f:	41 83 fb 06          	cmp    r11d,0x6
    5b73:	0f 86 b2 01 00 00    	jbe    5d2b <returnDigits+0x4ab>
    5b79:	8d 7f 01             	lea    edi,[rdi+0x1]
    5b7c:	4d 63 e4             	movsxd r12,r12d
    5b7f:	89 d3                	mov    ebx,edx
    5b81:	c4 62 7d 58 0d 76 1b 	vpbroadcastd ymm9,DWORD PTR [rip+0x1b76]        # 7700 <__PRETTY_FUNCTION__.0+0x1c0>
    5b88:	00 00 
    5b8a:	c4 c1 7e 6f 6c bd 00 	vmovdqu ymm5,YMMWORD PTR [r13+rdi*4+0x0]
    5b91:	49 8d 44 bc fc       	lea    rax,[r12+rdi*4-0x4]
    5b96:	83 e3 f8             	and    ebx,0xfffffff8
    5b99:	c5 7d 6f 1d ff 1a 00 	vmovdqa ymm11,YMMWORD PTR [rip+0x1aff]        # 76a0 <__PRETTY_FUNCTION__.0+0x160>
    5ba0:	00 
    5ba1:	c5 7d 6f 25 17 1b 00 	vmovdqa ymm12,YMMWORD PTR [rip+0x1b17]        # 76c0 <__PRETTY_FUNCTION__.0+0x180>
    5ba8:	00 
    5ba9:	4d 8d 14 81          	lea    r10,[r9+rax*4]
    5bad:	45 8d 04 98          	lea    r8d,[r8+rbx*4]
    5bb1:	01 de                	add    esi,ebx
    5bb3:	c5 bd 73 d5 20       	vpsrlq ymm8,ymm5,0x20
    5bb8:	c4 c2 55 28 f9       	vpmuldq ymm7,ymm5,ymm9
    5bbd:	c4 c2 3d 28 d9       	vpmuldq ymm3,ymm8,ymm9
    5bc2:	c5 8d 72 e5 1f       	vpsrad ymm14,ymm5,0x1f
    5bc7:	c4 c2 45 00 d3       	vpshufb ymm2,ymm7,ymm11
    5bcc:	c4 42 65 00 fc       	vpshufb ymm15,ymm3,ymm12
    5bd1:	c4 41 6d eb d7       	vpor   ymm10,ymm2,ymm15
    5bd6:	c4 c1 4d 72 e2 02    	vpsrad ymm6,ymm10,0x2
    5bdc:	c4 41 4d fa ee       	vpsubd ymm13,ymm6,ymm14
    5be1:	c4 c1 5d 72 f5 02    	vpslld ymm4,ymm13,0x2
    5be7:	c4 c1 3d 73 d5 20    	vpsrlq ymm8,ymm13,0x20
    5bed:	c4 c2 3d 28 d9       	vpmuldq ymm3,ymm8,ymm9
    5bf2:	c4 c1 0d 72 e5 1f    	vpsrad ymm14,ymm13,0x1f
    5bf8:	c4 c1 5d fe c5       	vpaddd ymm0,ymm4,ymm13
    5bfd:	c5 f5 72 f0 01       	vpslld ymm1,ymm0,0x1
    5c02:	c5 d5 fa f9          	vpsubd ymm7,ymm5,ymm1
    5c06:	c4 c2 15 28 e9       	vpmuldq ymm5,ymm13,ymm9
    5c0b:	c4 c2 65 00 d4       	vpshufb ymm2,ymm3,ymm12
    5c10:	c4 42 55 00 fb       	vpshufb ymm15,ymm5,ymm11
    5c15:	c5 05 eb d2          	vpor   ymm10,ymm15,ymm2
    5c19:	c4 c1 4d 72 e2 02    	vpsrad ymm6,ymm10,0x2
    5c1f:	c4 c1 4d fa e6       	vpsubd ymm4,ymm6,ymm14
    5c24:	c5 e5 73 d4 20       	vpsrlq ymm3,ymm4,0x20
    5c29:	c4 42 5d 28 c1       	vpmuldq ymm8,ymm4,ymm9
    5c2e:	c4 42 65 28 f9       	vpmuldq ymm15,ymm3,ymm9
    5c33:	c5 fd 72 f4 02       	vpslld ymm0,ymm4,0x2
    5c38:	c5 fd fe cc          	vpaddd ymm1,ymm0,ymm4
    5c3c:	c5 fd 72 e4 1f       	vpsrad ymm0,ymm4,0x1f
    5c41:	c5 d5 72 f1 01       	vpslld ymm5,ymm1,0x1
    5c46:	c5 15 fa ed          	vpsubd ymm13,ymm13,ymm5
    5c4a:	c4 c2 3d 00 d3       	vpshufb ymm2,ymm8,ymm11
    5c4f:	c4 42 05 00 d4       	vpshufb ymm10,ymm15,ymm12
    5c54:	c4 c1 6d eb f2       	vpor   ymm6,ymm2,ymm10
    5c59:	c5 8d 72 e6 02       	vpsrad ymm14,ymm6,0x2
    5c5e:	c5 0d fa c0          	vpsubd ymm8,ymm14,ymm0
    5c62:	c4 c1 6d 73 d0 20    	vpsrlq ymm2,ymm8,0x20
    5c68:	c4 42 3d 28 f9       	vpmuldq ymm15,ymm8,ymm9
    5c6d:	c4 42 6d 28 c9       	vpmuldq ymm9,ymm2,ymm9
    5c72:	c4 c1 0d 72 e0 1f    	vpsrad ymm14,ymm8,0x1f
    5c78:	c4 c1 75 72 f0 02    	vpslld ymm1,ymm8,0x2
    5c7e:	c4 c1 75 fe e8       	vpaddd ymm5,ymm1,ymm8
    5c83:	c5 e5 72 f5 01       	vpslld ymm3,ymm5,0x1
    5c88:	c4 42 05 00 db       	vpshufb ymm11,ymm15,ymm11
    5c8d:	c5 dd fa e3          	vpsubd ymm4,ymm4,ymm3
    5c91:	c4 42 35 00 e4       	vpshufb ymm12,ymm9,ymm12
    5c96:	c5 45 62 fc          	vpunpckldq ymm15,ymm7,ymm4
    5c9a:	c5 c5 6a fc          	vpunpckhdq ymm7,ymm7,ymm4
    5c9e:	c4 41 25 eb d4       	vpor   ymm10,ymm11,ymm12
    5ca3:	c4 e3 05 46 e7 20    	vperm2i128 ymm4,ymm15,ymm7,0x20
    5ca9:	c4 63 05 46 cf 31    	vperm2i128 ymm9,ymm15,ymm7,0x31
    5caf:	c4 c1 4d 72 e2 02    	vpsrad ymm6,ymm10,0x2
    5cb5:	c4 c1 4d fa c6       	vpsubd ymm0,ymm6,ymm14
    5cba:	c5 f5 72 f0 02       	vpslld ymm1,ymm0,0x2
    5cbf:	c5 f5 fe e8          	vpaddd ymm5,ymm1,ymm0
    5cc3:	c5 e5 72 f5 01       	vpslld ymm3,ymm5,0x1
    5cc8:	c5 3d fa c3          	vpsubd ymm8,ymm8,ymm3
    5ccc:	c4 41 15 62 d8       	vpunpckldq ymm11,ymm13,ymm8
    5cd1:	c4 41 15 6a e8       	vpunpckhdq ymm13,ymm13,ymm8
    5cd6:	c4 c3 25 46 d5 20    	vperm2i128 ymm2,ymm11,ymm13,0x20
    5cdc:	c4 43 25 46 e5 31    	vperm2i128 ymm12,ymm11,ymm13,0x31
    5ce2:	c5 5d 62 d2          	vpunpckldq ymm10,ymm4,ymm2
    5ce6:	c5 dd 6a f2          	vpunpckhdq ymm6,ymm4,ymm2
    5cea:	c4 c1 35 62 ec       	vpunpckldq ymm5,ymm9,ymm12
    5cef:	c4 c1 35 6a dc       	vpunpckhdq ymm3,ymm9,ymm12
    5cf4:	c4 63 2d 46 f6 20    	vperm2i128 ymm14,ymm10,ymm6,0x20
    5cfa:	c4 e3 2d 46 c6 31    	vperm2i128 ymm0,ymm10,ymm6,0x31
    5d00:	c4 e3 55 46 cb 20    	vperm2i128 ymm1,ymm5,ymm3,0x20
    5d06:	c4 63 55 46 c3 31    	vperm2i128 ymm8,ymm5,ymm3,0x31
    5d0c:	c4 41 7e 7f 32       	vmovdqu YMMWORD PTR [r10],ymm14
    5d11:	c4 c1 7e 7f 42 20    	vmovdqu YMMWORD PTR [r10+0x20],ymm0
    5d17:	c4 c1 7e 7f 4a 40    	vmovdqu YMMWORD PTR [r10+0x40],ymm1
    5d1d:	c4 41 7e 7f 42 60    	vmovdqu YMMWORD PTR [r10+0x60],ymm8
    5d23:	39 da                	cmp    edx,ebx
    5d25:	0f 84 d5 04 00 00    	je     6200 <returnDigits+0x980>
    5d2b:	4c 63 de             	movsxd r11,esi
    5d2e:	49 63 d0             	movsxd rdx,r8d
    5d31:	4b 63 7c 9d 00       	movsxd rdi,DWORD PTR [r13+r11*4+0x0]
    5d36:	4e 8d 24 9d 00 00 00 	lea    r12,[r11*4+0x0]
    5d3d:	00 
    5d3e:	4c 8d 1c 95 00 00 00 	lea    r11,[rdx*4+0x0]
    5d45:	00 
    5d46:	49 89 fa             	mov    r10,rdi
    5d49:	48 69 ff 67 66 66 66 	imul   rdi,rdi,0x66666667
    5d50:	44 89 d0             	mov    eax,r10d
    5d53:	c1 f8 1f             	sar    eax,0x1f
    5d56:	48 c1 ff 22          	sar    rdi,0x22
    5d5a:	29 c7                	sub    edi,eax
    5d5c:	48 63 df             	movsxd rbx,edi
    5d5f:	41 89 f8             	mov    r8d,edi
    5d62:	48 69 c3 67 66 66 66 	imul   rax,rbx,0x66666667
    5d69:	41 c1 f8 1f          	sar    r8d,0x1f
    5d6d:	8d 1c bf             	lea    ebx,[rdi+rdi*4]
    5d70:	01 db                	add    ebx,ebx
    5d72:	41 29 da             	sub    r10d,ebx
    5d75:	48 c1 f8 22          	sar    rax,0x22
    5d79:	c4 41 79 6e fa       	vmovd  xmm15,r10d
    5d7e:	44 29 c0             	sub    eax,r8d
    5d81:	4c 63 c0             	movsxd r8,eax
    5d84:	89 c3                	mov    ebx,eax
    5d86:	44 8d 14 80          	lea    r10d,[rax+rax*4]
    5d8a:	4d 69 c0 67 66 66 66 	imul   r8,r8,0x66666667
    5d91:	c1 fb 1f             	sar    ebx,0x1f
    5d94:	45 01 d2             	add    r10d,r10d
    5d97:	44 29 d7             	sub    edi,r10d
    5d9a:	c4 63 01 22 cf 01    	vpinsrd xmm9,xmm15,edi,0x1
    5da0:	49 c1 f8 22          	sar    r8,0x22
    5da4:	41 29 d8             	sub    r8d,ebx
    5da7:	47 8d 14 80          	lea    r10d,[r8+r8*4]
    5dab:	49 63 d8             	movsxd rbx,r8d
    5dae:	45 01 d2             	add    r10d,r10d
    5db1:	44 29 d0             	sub    eax,r10d
    5db4:	4c 69 d3 67 66 66 66 	imul   r10,rbx,0x66666667
    5dbb:	44 89 c3             	mov    ebx,r8d
    5dbe:	c1 fb 1f             	sar    ebx,0x1f
    5dc1:	c5 f9 6e f8          	vmovd  xmm7,eax
    5dc5:	49 c1 fa 22          	sar    r10,0x22
    5dc9:	41 29 da             	sub    r10d,ebx
    5dcc:	47 8d 14 92          	lea    r10d,[r10+r10*4]
    5dd0:	45 01 d2             	add    r10d,r10d
    5dd3:	45 29 d0             	sub    r8d,r10d
    5dd6:	c4 c3 41 22 e0 01    	vpinsrd xmm4,xmm7,r8d,0x1
    5ddc:	c5 31 6c dc          	vpunpcklqdq xmm11,xmm9,xmm4
    5de0:	c4 41 7a 7f 1c 91    	vmovdqu XMMWORD PTR [r9+rdx*4],xmm11
    5de6:	8d 56 01             	lea    edx,[rsi+0x1]
    5de9:	41 39 d6             	cmp    r14d,edx
    5dec:	0f 8e 0e 04 00 00    	jle    6200 <returnDigits+0x980>
    5df2:	4b 63 44 25 04       	movsxd rax,DWORD PTR [r13+r12*1+0x4]
    5df7:	48 69 d8 67 66 66 66 	imul   rbx,rax,0x66666667
    5dfe:	41 89 c0             	mov    r8d,eax
    5e01:	48 89 c7             	mov    rdi,rax
    5e04:	41 c1 f8 1f          	sar    r8d,0x1f
    5e08:	48 c1 fb 22          	sar    rbx,0x22
    5e0c:	44 29 c3             	sub    ebx,r8d
    5e0f:	4c 63 d3             	movsxd r10,ebx
    5e12:	89 d8                	mov    eax,ebx
    5e14:	44 8d 04 9b          	lea    r8d,[rbx+rbx*4]
    5e18:	49 69 d2 67 66 66 66 	imul   rdx,r10,0x66666667
    5e1f:	c1 f8 1f             	sar    eax,0x1f
    5e22:	45 01 c0             	add    r8d,r8d
    5e25:	44 29 c7             	sub    edi,r8d
    5e28:	c5 79 6e ef          	vmovd  xmm13,edi
    5e2c:	48 c1 fa 22          	sar    rdx,0x22
    5e30:	29 c2                	sub    edx,eax
    5e32:	4c 63 d2             	movsxd r10,edx
    5e35:	41 89 d0             	mov    r8d,edx
    5e38:	8d 3c 92             	lea    edi,[rdx+rdx*4]
    5e3b:	49 69 c2 67 66 66 66 	imul   rax,r10,0x66666667
    5e42:	41 c1 f8 1f          	sar    r8d,0x1f
    5e46:	01 ff                	add    edi,edi
    5e48:	29 fb                	sub    ebx,edi
    5e4a:	c4 63 11 22 d3 01    	vpinsrd xmm10,xmm13,ebx,0x1
    5e50:	8d 5e 02             	lea    ebx,[rsi+0x2]
    5e53:	48 c1 f8 22          	sar    rax,0x22
    5e57:	44 29 c0             	sub    eax,r8d
    5e5a:	4c 63 d0             	movsxd r10,eax
    5e5d:	8d 3c 80             	lea    edi,[rax+rax*4]
    5e60:	4d 69 c2 67 66 66 66 	imul   r8,r10,0x66666667
    5e67:	01 ff                	add    edi,edi
    5e69:	29 fa                	sub    edx,edi
    5e6b:	89 c7                	mov    edi,eax
    5e6d:	c1 ff 1f             	sar    edi,0x1f
    5e70:	c5 f9 6e d2          	vmovd  xmm2,edx
    5e74:	49 c1 f8 22          	sar    r8,0x22
    5e78:	41 29 f8             	sub    r8d,edi
    5e7b:	47 8d 14 80          	lea    r10d,[r8+r8*4]
    5e7f:	45 01 d2             	add    r10d,r10d
    5e82:	44 29 d0             	sub    eax,r10d
    5e85:	c4 63 69 22 e0 01    	vpinsrd xmm12,xmm2,eax,0x1
    5e8b:	c4 c1 29 6c f4       	vpunpcklqdq xmm6,xmm10,xmm12
    5e90:	c4 81 7a 7f 74 19 10 	vmovdqu XMMWORD PTR [r9+r11*1+0x10],xmm6
    5e97:	41 39 de             	cmp    r14d,ebx
    5e9a:	0f 8e 60 03 00 00    	jle    6200 <returnDigits+0x980>
    5ea0:	4b 63 54 25 08       	movsxd rdx,DWORD PTR [r13+r12*1+0x8]
    5ea5:	48 69 da 67 66 66 66 	imul   rbx,rdx,0x66666667
    5eac:	89 d0                	mov    eax,edx
    5eae:	48 89 d7             	mov    rdi,rdx
    5eb1:	c1 f8 1f             	sar    eax,0x1f
    5eb4:	48 c1 fb 22          	sar    rbx,0x22
    5eb8:	29 c3                	sub    ebx,eax
    5eba:	4c 63 c3             	movsxd r8,ebx
    5ebd:	41 89 da             	mov    r10d,ebx
    5ec0:	8d 04 9b             	lea    eax,[rbx+rbx*4]
    5ec3:	49 69 d0 67 66 66 66 	imul   rdx,r8,0x66666667
    5eca:	41 c1 fa 1f          	sar    r10d,0x1f
    5ece:	01 c0                	add    eax,eax
    5ed0:	29 c7                	sub    edi,eax
    5ed2:	c5 79 6e f7          	vmovd  xmm14,edi
    5ed6:	48 c1 fa 22          	sar    rdx,0x22
    5eda:	44 29 d2             	sub    edx,r10d
    5edd:	4c 63 c2             	movsxd r8,edx
    5ee0:	41 89 d2             	mov    r10d,edx
    5ee3:	8d 3c 92             	lea    edi,[rdx+rdx*4]
    5ee6:	49 69 c0 67 66 66 66 	imul   rax,r8,0x66666667
    5eed:	41 c1 fa 1f          	sar    r10d,0x1f
    5ef1:	01 ff                	add    edi,edi
    5ef3:	29 fb                	sub    ebx,edi
    5ef5:	c4 e3 09 22 db 01    	vpinsrd xmm3,xmm14,ebx,0x1
    5efb:	8d 5e 03             	lea    ebx,[rsi+0x3]
    5efe:	48 c1 f8 22          	sar    rax,0x22
    5f02:	44 29 d0             	sub    eax,r10d
    5f05:	8d 3c 80             	lea    edi,[rax+rax*4]
    5f08:	4c 63 c0             	movsxd r8,eax
    5f0b:	41 89 c2             	mov    r10d,eax
    5f0e:	01 ff                	add    edi,edi
    5f10:	41 c1 fa 1f          	sar    r10d,0x1f
    5f14:	29 fa                	sub    edx,edi
    5f16:	49 69 f8 67 66 66 66 	imul   rdi,r8,0x66666667
    5f1d:	c5 f9 6e c2          	vmovd  xmm0,edx
    5f21:	48 c1 ff 22          	sar    rdi,0x22
    5f25:	44 29 d7             	sub    edi,r10d
    5f28:	44 8d 04 bf          	lea    r8d,[rdi+rdi*4]
    5f2c:	45 01 c0             	add    r8d,r8d
    5f2f:	44 29 c0             	sub    eax,r8d
    5f32:	c4 e3 79 22 e8 01    	vpinsrd xmm5,xmm0,eax,0x1
    5f38:	c5 e1 6c cd          	vpunpcklqdq xmm1,xmm3,xmm5
    5f3c:	c4 81 7a 7f 4c 19 20 	vmovdqu XMMWORD PTR [r9+r11*1+0x20],xmm1
    5f43:	41 39 de             	cmp    r14d,ebx
    5f46:	0f 8e b4 02 00 00    	jle    6200 <returnDigits+0x980>
    5f4c:	4b 63 54 25 0c       	movsxd rdx,DWORD PTR [r13+r12*1+0xc]
    5f51:	48 69 da 67 66 66 66 	imul   rbx,rdx,0x66666667
    5f58:	89 d0                	mov    eax,edx
    5f5a:	48 89 d7             	mov    rdi,rdx
    5f5d:	c1 f8 1f             	sar    eax,0x1f
    5f60:	48 c1 fb 22          	sar    rbx,0x22
    5f64:	29 c3                	sub    ebx,eax
    5f66:	4c 63 d3             	movsxd r10,ebx
    5f69:	41 89 d8             	mov    r8d,ebx
    5f6c:	8d 04 9b             	lea    eax,[rbx+rbx*4]
    5f6f:	49 69 d2 67 66 66 66 	imul   rdx,r10,0x66666667
    5f76:	41 c1 f8 1f          	sar    r8d,0x1f
    5f7a:	01 c0                	add    eax,eax
    5f7c:	29 c7                	sub    edi,eax
    5f7e:	c5 79 6e c7          	vmovd  xmm8,edi
    5f82:	48 c1 fa 22          	sar    rdx,0x22
    5f86:	44 29 c2             	sub    edx,r8d
    5f89:	4c 63 d2             	movsxd r10,edx
    5f8c:	41 89 d0             	mov    r8d,edx
    5f8f:	8d 3c 92             	lea    edi,[rdx+rdx*4]
    5f92:	49 69 c2 67 66 66 66 	imul   rax,r10,0x66666667
    5f99:	41 c1 f8 1f          	sar    r8d,0x1f
    5f9d:	01 ff                	add    edi,edi
    5f9f:	29 fb                	sub    ebx,edi
    5fa1:	c4 e3 39 22 e3 01    	vpinsrd xmm4,xmm8,ebx,0x1
    5fa7:	8d 5e 04             	lea    ebx,[rsi+0x4]
    5faa:	48 c1 f8 22          	sar    rax,0x22
    5fae:	44 29 c0             	sub    eax,r8d
    5fb1:	4c 63 d0             	movsxd r10,eax
    5fb4:	8d 3c 80             	lea    edi,[rax+rax*4]
    5fb7:	4d 69 c2 67 66 66 66 	imul   r8,r10,0x66666667
    5fbe:	01 ff                	add    edi,edi
    5fc0:	29 fa                	sub    edx,edi
    5fc2:	89 c7                	mov    edi,eax
    5fc4:	c1 ff 1f             	sar    edi,0x1f
    5fc7:	c5 79 6e fa          	vmovd  xmm15,edx
    5fcb:	49 c1 f8 22          	sar    r8,0x22
    5fcf:	41 29 f8             	sub    r8d,edi
    5fd2:	47 8d 14 80          	lea    r10d,[r8+r8*4]
    5fd6:	45 01 d2             	add    r10d,r10d
    5fd9:	44 29 d0             	sub    eax,r10d
    5fdc:	c4 e3 01 22 f8 01    	vpinsrd xmm7,xmm15,eax,0x1
    5fe2:	c5 59 6c cf          	vpunpcklqdq xmm9,xmm4,xmm7
    5fe6:	c4 01 7a 7f 4c 19 30 	vmovdqu XMMWORD PTR [r9+r11*1+0x30],xmm9
    5fed:	44 39 f3             	cmp    ebx,r14d
    5ff0:	0f 8d 0a 02 00 00    	jge    6200 <returnDigits+0x980>
    5ff6:	4b 63 54 25 10       	movsxd rdx,DWORD PTR [r13+r12*1+0x10]
    5ffb:	48 69 da 67 66 66 66 	imul   rbx,rdx,0x66666667
    6002:	89 d0                	mov    eax,edx
    6004:	48 89 d7             	mov    rdi,rdx
    6007:	c1 f8 1f             	sar    eax,0x1f
    600a:	48 c1 fb 22          	sar    rbx,0x22
    600e:	29 c3                	sub    ebx,eax
    6010:	4c 63 c3             	movsxd r8,ebx
    6013:	41 89 da             	mov    r10d,ebx
    6016:	8d 04 9b             	lea    eax,[rbx+rbx*4]
    6019:	49 69 d0 67 66 66 66 	imul   rdx,r8,0x66666667
    6020:	41 c1 fa 1f          	sar    r10d,0x1f
    6024:	01 c0                	add    eax,eax
    6026:	29 c7                	sub    edi,eax
    6028:	c5 79 6e df          	vmovd  xmm11,edi
    602c:	48 c1 fa 22          	sar    rdx,0x22
    6030:	44 29 d2             	sub    edx,r10d
    6033:	4c 63 c2             	movsxd r8,edx
    6036:	41 89 d2             	mov    r10d,edx
    6039:	8d 3c 92             	lea    edi,[rdx+rdx*4]
    603c:	49 69 c0 67 66 66 66 	imul   rax,r8,0x66666667
    6043:	41 c1 fa 1f          	sar    r10d,0x1f
    6047:	01 ff                	add    edi,edi
    6049:	29 fb                	sub    ebx,edi
    604b:	c4 63 21 22 e3 01    	vpinsrd xmm12,xmm11,ebx,0x1
    6051:	8d 5e 05             	lea    ebx,[rsi+0x5]
    6054:	48 c1 f8 22          	sar    rax,0x22
    6058:	44 29 d0             	sub    eax,r10d
    605b:	8d 3c 80             	lea    edi,[rax+rax*4]
    605e:	4c 63 c0             	movsxd r8,eax
    6061:	41 89 c2             	mov    r10d,eax
    6064:	01 ff                	add    edi,edi
    6066:	41 c1 fa 1f          	sar    r10d,0x1f
    606a:	29 fa                	sub    edx,edi
    606c:	49 69 f8 67 66 66 66 	imul   rdi,r8,0x66666667
    6073:	c5 79 6e ea          	vmovd  xmm13,edx
    6077:	48 c1 ff 22          	sar    rdi,0x22
    607b:	44 29 d7             	sub    edi,r10d
    607e:	44 8d 04 bf          	lea    r8d,[rdi+rdi*4]
    6082:	45 01 c0             	add    r8d,r8d
    6085:	44 29 c0             	sub    eax,r8d
    6088:	c4 e3 11 22 d0 01    	vpinsrd xmm2,xmm13,eax,0x1
    608e:	c5 19 6c d2          	vpunpcklqdq xmm10,xmm12,xmm2
    6092:	c4 01 7a 7f 54 19 40 	vmovdqu XMMWORD PTR [r9+r11*1+0x40],xmm10
    6099:	41 39 de             	cmp    r14d,ebx
    609c:	0f 8e 5e 01 00 00    	jle    6200 <returnDigits+0x980>
    60a2:	4b 63 54 25 14       	movsxd rdx,DWORD PTR [r13+r12*1+0x14]
    60a7:	83 c6 06             	add    esi,0x6
    60aa:	48 69 da 67 66 66 66 	imul   rbx,rdx,0x66666667
    60b1:	89 d0                	mov    eax,edx
    60b3:	48 89 d7             	mov    rdi,rdx
    60b6:	c1 f8 1f             	sar    eax,0x1f
    60b9:	48 c1 fb 22          	sar    rbx,0x22
    60bd:	29 c3                	sub    ebx,eax
    60bf:	4c 63 d3             	movsxd r10,ebx
    60c2:	41 89 d8             	mov    r8d,ebx
    60c5:	8d 04 9b             	lea    eax,[rbx+rbx*4]
    60c8:	49 69 d2 67 66 66 66 	imul   rdx,r10,0x66666667
    60cf:	41 c1 f8 1f          	sar    r8d,0x1f
    60d3:	01 c0                	add    eax,eax
    60d5:	29 c7                	sub    edi,eax
    60d7:	c5 f9 6e f7          	vmovd  xmm6,edi
    60db:	48 c1 fa 22          	sar    rdx,0x22
    60df:	44 29 c2             	sub    edx,r8d
    60e2:	4c 63 d2             	movsxd r10,edx
    60e5:	41 89 d0             	mov    r8d,edx
    60e8:	8d 3c 92             	lea    edi,[rdx+rdx*4]
    60eb:	49 69 c2 67 66 66 66 	imul   rax,r10,0x66666667
    60f2:	41 c1 f8 1f          	sar    r8d,0x1f
    60f6:	01 ff                	add    edi,edi
    60f8:	29 fb                	sub    ebx,edi
    60fa:	c4 e3 49 22 c3 01    	vpinsrd xmm0,xmm6,ebx,0x1
    6100:	48 c1 f8 22          	sar    rax,0x22
    6104:	44 29 c0             	sub    eax,r8d
    6107:	4c 63 d0             	movsxd r10,eax
    610a:	8d 3c 80             	lea    edi,[rax+rax*4]
    610d:	4d 69 c2 67 66 66 66 	imul   r8,r10,0x66666667
    6114:	01 ff                	add    edi,edi
    6116:	29 fa                	sub    edx,edi
    6118:	89 c7                	mov    edi,eax
    611a:	c1 ff 1f             	sar    edi,0x1f
    611d:	c5 79 6e f2          	vmovd  xmm14,edx
    6121:	49 c1 f8 22          	sar    r8,0x22
    6125:	41 29 f8             	sub    r8d,edi
    6128:	47 8d 14 80          	lea    r10d,[r8+r8*4]
    612c:	45 01 d2             	add    r10d,r10d
    612f:	44 29 d0             	sub    eax,r10d
    6132:	c4 e3 09 22 e8 01    	vpinsrd xmm5,xmm14,eax,0x1
    6138:	c5 f9 6c dd          	vpunpcklqdq xmm3,xmm0,xmm5
    613c:	c4 81 7a 7f 5c 19 50 	vmovdqu XMMWORD PTR [r9+r11*1+0x50],xmm3
    6143:	41 39 f6             	cmp    r14d,esi
    6146:	0f 8e b4 00 00 00    	jle    6200 <returnDigits+0x980>
    614c:	4f 63 6c 25 18       	movsxd r13,DWORD PTR [r13+r12*1+0x18]
    6151:	4d 69 e5 67 66 66 66 	imul   r12,r13,0x66666667
    6158:	44 89 ee             	mov    esi,r13d
    615b:	4d 89 ee             	mov    r14,r13
    615e:	c1 fe 1f             	sar    esi,0x1f
    6161:	49 c1 fc 22          	sar    r12,0x22
    6165:	41 29 f4             	sub    r12d,esi
    6168:	49 63 dc             	movsxd rbx,r12d
    616b:	44 89 e0             	mov    eax,r12d
    616e:	47 8d 04 a4          	lea    r8d,[r12+r12*4]
    6172:	48 69 d3 67 66 66 66 	imul   rdx,rbx,0x66666667
    6179:	c1 f8 1f             	sar    eax,0x1f
    617c:	45 01 c0             	add    r8d,r8d
    617f:	45 29 c6             	sub    r14d,r8d
    6182:	c4 41 79 6e c6       	vmovd  xmm8,r14d
    6187:	48 c1 fa 22          	sar    rdx,0x22
    618b:	29 c2                	sub    edx,eax
    618d:	8d 3c 92             	lea    edi,[rdx+rdx*4]
    6190:	4c 63 d2             	movsxd r10,edx
    6193:	41 89 d5             	mov    r13d,edx
    6196:	01 ff                	add    edi,edi
    6198:	41 c1 fd 1f          	sar    r13d,0x1f
    619c:	41 29 fc             	sub    r12d,edi
    619f:	49 69 fa 67 66 66 66 	imul   rdi,r10,0x66666667
    61a6:	c4 c3 39 22 fc 01    	vpinsrd xmm7,xmm8,r12d,0x1
    61ac:	48 c1 ff 22          	sar    rdi,0x22
    61b0:	44 29 ef             	sub    edi,r13d
    61b3:	48 63 df             	movsxd rbx,edi
    61b6:	41 89 f8             	mov    r8d,edi
    61b9:	8d 34 bf             	lea    esi,[rdi+rdi*4]
    61bc:	48 69 c3 67 66 66 66 	imul   rax,rbx,0x66666667
    61c3:	41 c1 f8 1f          	sar    r8d,0x1f
    61c7:	01 f6                	add    esi,esi
    61c9:	29 f2                	sub    edx,esi
    61cb:	c5 f9 6e ca          	vmovd  xmm1,edx
    61cf:	48 c1 f8 22          	sar    rax,0x22
    61d3:	44 29 c0             	sub    eax,r8d
    61d6:	44 8d 14 80          	lea    r10d,[rax+rax*4]
    61da:	45 01 d2             	add    r10d,r10d
    61dd:	44 29 d7             	sub    edi,r10d
    61e0:	c4 63 71 22 ff 01    	vpinsrd xmm15,xmm1,edi,0x1
    61e6:	c4 c1 41 6c e7       	vpunpcklqdq xmm4,xmm7,xmm15
    61eb:	c4 81 7a 7f 64 19 60 	vmovdqu XMMWORD PTR [r9+r11*1+0x60],xmm4
    61f2:	c5 f8 77             	vzeroupper 
    61f5:	eb 0c                	jmp    6203 <returnDigits+0x983>
    61f7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    61fe:	00 00 
    6200:	c5 f8 77             	vzeroupper 
    6203:	44 89 39             	mov    DWORD PTR [rcx],r15d
    6206:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
    620a:	4c 89 c8             	mov    rax,r9
    620d:	5b                   	pop    rbx
    620e:	41 5c                	pop    r12
    6210:	41 5d                	pop    r13
    6212:	41 5e                	pop    r14
    6214:	41 5f                	pop    r15
    6216:	5d                   	pop    rbp
    6217:	c3                   	ret    
    6218:	49 63 ff             	movsxd rdi,r15d
    621b:	89 54 24 30          	mov    DWORD PTR [rsp+0x30],edx
    621f:	48 c1 e7 02          	shl    rdi,0x2
    6223:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
    6228:	e8 83 c2 ff ff       	call   24b0 <malloc@plt>
    622d:	49 89 c1             	mov    r9,rax
    6230:	48 85 c0             	test   rax,rax
    6233:	74 21                	je     6256 <returnDigits+0x9d6>
    6235:	48 8b 4c 24 38       	mov    rcx,QWORD PTR [rsp+0x38]
    623a:	44 8b 5c 24 30       	mov    r11d,DWORD PTR [rsp+0x30]
    623f:	45 31 e4             	xor    r12d,r12d
    6242:	e9 0a f7 ff ff       	jmp    5951 <returnDigits+0xd1>
    6247:	45 89 e0             	mov    r8d,r12d
    624a:	31 ff                	xor    edi,edi
    624c:	be 01 00 00 00       	mov    esi,0x1
    6251:	e9 0b f9 ff ff       	jmp    5b61 <returnDigits+0x2e1>
    6256:	48 8d 3d d3 10 00 00 	lea    rdi,[rip+0x10d3]        # 7330 <_IO_stdin_used+0x330>
    625d:	e8 ee c0 ff ff       	call   2350 <puts@plt>
    6262:	bf 01 00 00 00       	mov    edi,0x1
    6267:	e8 a4 c2 ff ff       	call   2510 <exit@plt>
    626c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000006270 <make_equidistant>:
    6270:	f3 0f 1e fa          	endbr64 
    6274:	41 57                	push   r15
    6276:	41 56                	push   r14
    6278:	41 55                	push   r13
    627a:	41 54                	push   r12
    627c:	55                   	push   rbp
    627d:	53                   	push   rbx
    627e:	48 83 ec 18          	sub    rsp,0x18
    6282:	44 8b 3a             	mov    r15d,DWORD PTR [rdx]
    6285:	44 8b 31             	mov    r14d,DWORD PTR [rcx]
    6288:	45 39 f7             	cmp    r15d,r14d
    628b:	74 19                	je     62a6 <make_equidistant+0x36>
    628d:	48 8b 06             	mov    rax,QWORD PTR [rsi]
    6290:	4c 8b 07             	mov    r8,QWORD PTR [rdi]
    6293:	49 89 fd             	mov    r13,rdi
    6296:	49 89 f4             	mov    r12,rsi
    6299:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
    629e:	7f 18                	jg     62b8 <make_equidistant+0x48>
    62a0:	0f 8c ea 00 00 00    	jl     6390 <make_equidistant+0x120>
    62a6:	48 83 c4 18          	add    rsp,0x18
    62aa:	5b                   	pop    rbx
    62ab:	5d                   	pop    rbp
    62ac:	41 5c                	pop    r12
    62ae:	41 5d                	pop    r13
    62b0:	41 5e                	pop    r14
    62b2:	41 5f                	pop    r15
    62b4:	c3                   	ret    
    62b5:	0f 1f 00             	nop    DWORD PTR [rax]
    62b8:	49 63 ef             	movsxd rbp,r15d
    62bb:	be 04 00 00 00       	mov    esi,0x4
    62c0:	48 89 cb             	mov    rbx,rcx
    62c3:	48 89 ef             	mov    rdi,rbp
    62c6:	e8 95 c1 ff ff       	call   2460 <calloc@plt>
    62cb:	49 89 c5             	mov    r13,rax
    62ce:	48 85 c0             	test   rax,rax
    62d1:	0f 84 7b 01 00 00    	je     6452 <make_equidistant+0x1e2>
    62d7:	44 89 f0             	mov    eax,r14d
    62da:	83 e8 01             	sub    eax,0x1
    62dd:	78 3a                	js     6319 <make_equidistant+0xa9>
    62df:	41 89 c3             	mov    r11d,eax
    62e2:	48 98                	cdqe   
    62e4:	49 63 f6             	movsxd rsi,r14d
    62e7:	4c 89 da             	mov    rdx,r11
    62ea:	4c 8d 44 05 00       	lea    r8,[rbp+rax*1+0x0]
    62ef:	4e 8d 0c 9d 04 00 00 	lea    r9,[r11*4+0x4]
    62f6:	00 
    62f7:	48 f7 da             	neg    rdx
    62fa:	49 29 f0             	sub    r8,rsi
    62fd:	48 c1 e2 02          	shl    rdx,0x2
    6301:	4a 8d 3c 82          	lea    rdi,[rdx+r8*4]
    6305:	48 8d 34 82          	lea    rsi,[rdx+rax*4]
    6309:	4c 89 ca             	mov    rdx,r9
    630c:	48 03 74 24 08       	add    rsi,QWORD PTR [rsp+0x8]
    6311:	4c 01 ef             	add    rdi,r13
    6314:	e8 77 c1 ff ff       	call   2490 <memcpy@plt>
    6319:	44 89 f9             	mov    ecx,r15d
    631c:	31 f6                	xor    esi,esi
    631e:	4c 89 ef             	mov    rdi,r13
    6321:	44 29 f1             	sub    ecx,r14d
    6324:	4c 8d 34 ad 00 00 00 	lea    r14,[rbp*4+0x0]
    632b:	00 
    632c:	48 63 d1             	movsxd rdx,ecx
    632f:	48 c1 e2 02          	shl    rdx,0x2
    6333:	e8 c8 c0 ff ff       	call   2400 <memset@plt>
    6338:	bf 0a 00 00 00       	mov    edi,0xa
    633d:	e8 de bf ff ff       	call   2320 <putchar@plt>
    6342:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
    6347:	4c 89 f6             	mov    rsi,r14
    634a:	e8 81 c1 ff ff       	call   24d0 <realloc@plt>
    634f:	48 89 c7             	mov    rdi,rax
    6352:	48 85 c0             	test   rax,rax
    6355:	0f 84 1d 01 00 00    	je     6478 <make_equidistant+0x208>
    635b:	45 85 ff             	test   r15d,r15d
    635e:	7e 0e                	jle    636e <make_equidistant+0xfe>
    6360:	4c 89 f2             	mov    rdx,r14
    6363:	4c 89 ee             	mov    rsi,r13
    6366:	e8 25 c1 ff ff       	call   2490 <memcpy@plt>
    636b:	48 89 c7             	mov    rdi,rax
    636e:	44 89 3b             	mov    DWORD PTR [rbx],r15d
    6371:	49 89 3c 24          	mov    QWORD PTR [r12],rdi
    6375:	4c 89 ef             	mov    rdi,r13
    6378:	48 83 c4 18          	add    rsp,0x18
    637c:	5b                   	pop    rbx
    637d:	5d                   	pop    rbp
    637e:	41 5c                	pop    r12
    6380:	41 5d                	pop    r13
    6382:	41 5e                	pop    r14
    6384:	41 5f                	pop    r15
    6386:	e9 85 bf ff ff       	jmp    2310 <free@plt>
    638b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    6390:	49 63 de             	movsxd rbx,r14d
    6393:	be 04 00 00 00       	mov    esi,0x4
    6398:	4c 89 44 24 08       	mov    QWORD PTR [rsp+0x8],r8
    639d:	48 89 d5             	mov    rbp,rdx
    63a0:	48 89 df             	mov    rdi,rbx
    63a3:	e8 b8 c0 ff ff       	call   2460 <calloc@plt>
    63a8:	49 89 c4             	mov    r12,rax
    63ab:	48 85 c0             	test   rax,rax
    63ae:	0f 84 9e 00 00 00    	je     6452 <make_equidistant+0x1e2>
    63b4:	44 89 f8             	mov    eax,r15d
    63b7:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
    63bc:	83 e8 01             	sub    eax,0x1
    63bf:	78 32                	js     63f3 <make_equidistant+0x183>
    63c1:	89 c6                	mov    esi,eax
    63c3:	48 98                	cdqe   
    63c5:	48 89 f2             	mov    rdx,rsi
    63c8:	4c 8d 0c b5 04 00 00 	lea    r9,[rsi*4+0x4]
    63cf:	00 
    63d0:	48 f7 da             	neg    rdx
    63d3:	48 c1 e2 02          	shl    rdx,0x2
    63d7:	48 8d 34 82          	lea    rsi,[rdx+rax*4]
    63db:	48 8d 7c 9a fc       	lea    rdi,[rdx+rbx*4-0x4]
    63e0:	4c 89 ca             	mov    rdx,r9
    63e3:	48 01 ce             	add    rsi,rcx
    63e6:	4c 01 e7             	add    rdi,r12
    63e9:	e8 a2 c0 ff ff       	call   2490 <memcpy@plt>
    63ee:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
    63f3:	44 89 f7             	mov    edi,r14d
    63f6:	31 f6                	xor    esi,esi
    63f8:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
    63fd:	44 29 ff             	sub    edi,r15d
    6400:	4c 8d 3c 9d 00 00 00 	lea    r15,[rbx*4+0x0]
    6407:	00 
    6408:	48 63 d7             	movsxd rdx,edi
    640b:	4c 89 e7             	mov    rdi,r12
    640e:	48 c1 e2 02          	shl    rdx,0x2
    6412:	e8 e9 bf ff ff       	call   2400 <memset@plt>
    6417:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
    641c:	4c 89 fe             	mov    rsi,r15
    641f:	e8 ac c0 ff ff       	call   24d0 <realloc@plt>
    6424:	49 89 c2             	mov    r10,rax
    6427:	48 85 c0             	test   rax,rax
    642a:	74 39                	je     6465 <make_equidistant+0x1f5>
    642c:	45 85 f6             	test   r14d,r14d
    642f:	7e 11                	jle    6442 <make_equidistant+0x1d2>
    6431:	4c 89 fa             	mov    rdx,r15
    6434:	4c 89 e6             	mov    rsi,r12
    6437:	48 89 c7             	mov    rdi,rax
    643a:	e8 51 c0 ff ff       	call   2490 <memcpy@plt>
    643f:	49 89 c2             	mov    r10,rax
    6442:	44 89 75 00          	mov    DWORD PTR [rbp+0x0],r14d
    6446:	4c 89 e7             	mov    rdi,r12
    6449:	4d 89 55 00          	mov    QWORD PTR [r13+0x0],r10
    644d:	e9 26 ff ff ff       	jmp    6378 <make_equidistant+0x108>
    6452:	48 8d 3d 07 0f 00 00 	lea    rdi,[rip+0xf07]        # 7360 <_IO_stdin_used+0x360>
    6459:	e8 a2 c0 ff ff       	call   2500 <perror@plt>
    645e:	31 ff                	xor    edi,edi
    6460:	e8 ab c0 ff ff       	call   2510 <exit@plt>
    6465:	48 8d 3d 44 0f 00 00 	lea    rdi,[rip+0xf44]        # 73b0 <_IO_stdin_used+0x3b0>
    646c:	e8 8f c0 ff ff       	call   2500 <perror@plt>
    6471:	31 ff                	xor    edi,edi
    6473:	e8 98 c0 ff ff       	call   2510 <exit@plt>
    6478:	48 8d 3d 09 0f 00 00 	lea    rdi,[rip+0xf09]        # 7388 <_IO_stdin_used+0x388>
    647f:	e8 7c c0 ff ff       	call   2500 <perror@plt>
    6484:	31 ff                	xor    edi,edi
    6486:	e8 85 c0 ff ff       	call   2510 <exit@plt>
    648b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000006490 <generateRandomNumber>:
    6490:	f3 0f 1e fa          	endbr64 
    6494:	41 55                	push   r13
    6496:	41 54                	push   r12
    6498:	55                   	push   rbp
    6499:	53                   	push   rbx
    649a:	48 63 df             	movsxd rbx,edi
    649d:	48 83 ec 48          	sub    rsp,0x48
    64a1:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    64a8:	00 00 
    64aa:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
    64af:	31 c0                	xor    eax,eax
    64b1:	48 8d 6c 24 10       	lea    rbp,[rsp+0x10]
    64b6:	49 89 e4             	mov    r12,rsp
    64b9:	48 89 ef             	mov    rdi,rbp
    64bc:	e8 8f bf ff ff       	call   2450 <__gmp_randinit_default@plt>
    64c1:	31 ff                	xor    edi,edi
    64c3:	e8 d8 bf ff ff       	call   24a0 <time@plt>
    64c8:	48 89 ef             	mov    rdi,rbp
    64cb:	48 8d 34 03          	lea    rsi,[rbx+rax*1]
    64cf:	e8 1c be ff ff       	call   22f0 <__gmp_randseed_ui@plt>
    64d4:	4c 89 e7             	mov    rdi,r12
    64d7:	e8 74 c0 ff ff       	call   2550 <__gmpz_init@plt>
    64dc:	48 63 15 49 2b 00 00 	movsxd rdx,DWORD PTR [rip+0x2b49]        # 902c <NUMBER_OF_BITS>
    64e3:	48 89 ee             	mov    rsi,rbp
    64e6:	4c 89 e7             	mov    rdi,r12
    64e9:	e8 82 c0 ff ff       	call   2570 <__gmpz_urandomb@plt>
    64ee:	4c 89 e2             	mov    rdx,r12
    64f1:	31 ff                	xor    edi,edi
    64f3:	be 0a 00 00 00       	mov    esi,0xa
    64f8:	e8 a3 be ff ff       	call   23a0 <__gmpz_get_str@plt>
    64fd:	4c 89 e7             	mov    rdi,r12
    6500:	49 89 c5             	mov    r13,rax
    6503:	e8 b8 bf ff ff       	call   24c0 <__gmpz_clear@plt>
    6508:	48 89 ef             	mov    rdi,rbp
    650b:	e8 b0 be ff ff       	call   23c0 <__gmp_randclear@plt>
    6510:	48 8b 54 24 38       	mov    rdx,QWORD PTR [rsp+0x38]
    6515:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    651c:	00 00 
    651e:	75 0e                	jne    652e <generateRandomNumber+0x9e>
    6520:	48 83 c4 48          	add    rsp,0x48
    6524:	4c 89 e8             	mov    rax,r13
    6527:	5b                   	pop    rbx
    6528:	5d                   	pop    rbp
    6529:	41 5c                	pop    r12
    652b:	41 5d                	pop    r13
    652d:	c3                   	ret    
    652e:	e8 7d be ff ff       	call   23b0 <__stack_chk_fail@plt>
    6533:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    653a:	00 00 00 00 
    653e:	66 90                	xchg   ax,ax

0000000000006540 <generate_seed>:
    6540:	f3 0f 1e fa          	endbr64 
    6544:	48 83 ec 38          	sub    rsp,0x38
    6548:	31 f6                	xor    esi,esi
    654a:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    6551:	00 00 
    6553:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
    6558:	31 c0                	xor    eax,eax
    655a:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
    655f:	e8 7c be ff ff       	call   23e0 <gettimeofday@plt>
    6564:	c5 f8 57 c0          	vxorps xmm0,xmm0,xmm0
    6568:	c4 e1 fb 2a 4c 24 10 	vcvtsi2sd xmm1,xmm0,QWORD PTR [rsp+0x10]
    656f:	c4 e1 fb 2a 54 24 18 	vcvtsi2sd xmm2,xmm0,QWORD PTR [rsp+0x18]
    6576:	c4 e2 e9 99 0d 09 11 	vfmadd132sd xmm1,xmm2,QWORD PTR [rip+0x1109]        # 7688 <__PRETTY_FUNCTION__.0+0x148>
    657d:	00 00 
    657f:	c5 fb 11 4c 24 08    	vmovsd QWORD PTR [rsp+0x8],xmm1
    6585:	e8 e6 bd ff ff       	call   2370 <getpid@plt>
    658a:	62 f1 ff 08 78 54 24 	vcvttsd2usi rdx,QWORD PTR [rsp+0x8]
    6591:	01 
    6592:	31 d0                	xor    eax,edx
    6594:	89 c7                	mov    edi,eax
    6596:	e8 a5 be ff ff       	call   2440 <srand@plt>
    659b:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
    65a0:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    65a7:	00 00 
    65a9:	75 05                	jne    65b0 <generate_seed+0x70>
    65ab:	48 83 c4 38          	add    rsp,0x38
    65af:	c3                   	ret    
    65b0:	e8 fb bd ff ff       	call   23b0 <__stack_chk_fail@plt>

Disassembly of section .fini:

00000000000065b8 <_fini>:
    65b8:	f3 0f 1e fa          	endbr64 
    65bc:	48 83 ec 08          	sub    rsp,0x8
    65c0:	48 83 c4 08          	add    rsp,0x8
    65c4:	c3                   	ret    
