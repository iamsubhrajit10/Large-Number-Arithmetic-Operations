
avx_sub:     file format elf64-x86-64


Disassembly of section .init:

0000000000002000 <_init>:
    2000:	f3 0f 1e fa          	endbr64 
    2004:	48 83 ec 08          	sub    rsp,0x8
    2008:	48 8b 05 d9 7f 00 00 	mov    rax,QWORD PTR [rip+0x7fd9]        # 9fe8 <__gmon_start__@Base>
    200f:	48 85 c0             	test   rax,rax
    2012:	74 02                	je     2016 <_init+0x16>
    2014:	ff d0                	call   rax
    2016:	48 83 c4 08          	add    rsp,0x8
    201a:	c3                   	ret    

Disassembly of section .plt:

0000000000002020 <.plt>:
    2020:	ff 35 4a 7e 00 00    	push   QWORD PTR [rip+0x7e4a]        # 9e70 <_GLOBAL_OFFSET_TABLE_+0x8>
    2026:	f2 ff 25 4b 7e 00 00 	bnd jmp QWORD PTR [rip+0x7e4b]        # 9e78 <_GLOBAL_OFFSET_TABLE_+0x10>
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
    22e4:	f2 ff 25 0d 7d 00 00 	bnd jmp QWORD PTR [rip+0x7d0d]        # 9ff8 <__cxa_finalize@GLIBC_2.2.5>
    22eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .plt.sec:

00000000000022f0 <__gmp_randseed_ui@plt>:
    22f0:	f3 0f 1e fa          	endbr64 
    22f4:	f2 ff 25 85 7b 00 00 	bnd jmp QWORD PTR [rip+0x7b85]        # 9e80 <__gmp_randseed_ui@Base>
    22fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002300 <__snprintf_chk@plt>:
    2300:	f3 0f 1e fa          	endbr64 
    2304:	f2 ff 25 7d 7b 00 00 	bnd jmp QWORD PTR [rip+0x7b7d]        # 9e88 <__snprintf_chk@GLIBC_2.3.4>
    230b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002310 <free@plt>:
    2310:	f3 0f 1e fa          	endbr64 
    2314:	f2 ff 25 75 7b 00 00 	bnd jmp QWORD PTR [rip+0x7b75]        # 9e90 <free@GLIBC_2.2.5>
    231b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002320 <putchar@plt>:
    2320:	f3 0f 1e fa          	endbr64 
    2324:	f2 ff 25 6d 7b 00 00 	bnd jmp QWORD PTR [rip+0x7b6d]        # 9e98 <putchar@GLIBC_2.2.5>
    232b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002330 <__errno_location@plt>:
    2330:	f3 0f 1e fa          	endbr64 
    2334:	f2 ff 25 65 7b 00 00 	bnd jmp QWORD PTR [rip+0x7b65]        # 9ea0 <__errno_location@GLIBC_2.2.5>
    233b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002340 <__gmpz_set_str@plt>:
    2340:	f3 0f 1e fa          	endbr64 
    2344:	f2 ff 25 5d 7b 00 00 	bnd jmp QWORD PTR [rip+0x7b5d]        # 9ea8 <__gmpz_set_str@Base>
    234b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002350 <puts@plt>:
    2350:	f3 0f 1e fa          	endbr64 
    2354:	f2 ff 25 55 7b 00 00 	bnd jmp QWORD PTR [rip+0x7b55]        # 9eb0 <puts@GLIBC_2.2.5>
    235b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002360 <clock_gettime@plt>:
    2360:	f3 0f 1e fa          	endbr64 
    2364:	f2 ff 25 4d 7b 00 00 	bnd jmp QWORD PTR [rip+0x7b4d]        # 9eb8 <clock_gettime@GLIBC_2.17>
    236b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002370 <getpid@plt>:
    2370:	f3 0f 1e fa          	endbr64 
    2374:	f2 ff 25 45 7b 00 00 	bnd jmp QWORD PTR [rip+0x7b45]        # 9ec0 <getpid@GLIBC_2.2.5>
    237b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002380 <__gmpz_sub@plt>:
    2380:	f3 0f 1e fa          	endbr64 
    2384:	f2 ff 25 3d 7b 00 00 	bnd jmp QWORD PTR [rip+0x7b3d]        # 9ec8 <__gmpz_sub@Base>
    238b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002390 <fclose@plt>:
    2390:	f3 0f 1e fa          	endbr64 
    2394:	f2 ff 25 35 7b 00 00 	bnd jmp QWORD PTR [rip+0x7b35]        # 9ed0 <fclose@GLIBC_2.2.5>
    239b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000023a0 <strlen@plt>:
    23a0:	f3 0f 1e fa          	endbr64 
    23a4:	f2 ff 25 2d 7b 00 00 	bnd jmp QWORD PTR [rip+0x7b2d]        # 9ed8 <strlen@GLIBC_2.2.5>
    23ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000023b0 <__gmpz_get_str@plt>:
    23b0:	f3 0f 1e fa          	endbr64 
    23b4:	f2 ff 25 25 7b 00 00 	bnd jmp QWORD PTR [rip+0x7b25]        # 9ee0 <__gmpz_get_str@Base>
    23bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000023c0 <__stack_chk_fail@plt>:
    23c0:	f3 0f 1e fa          	endbr64 
    23c4:	f2 ff 25 1d 7b 00 00 	bnd jmp QWORD PTR [rip+0x7b1d]        # 9ee8 <__stack_chk_fail@GLIBC_2.4>
    23cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000023d0 <__assert_fail@plt>:
    23d0:	f3 0f 1e fa          	endbr64 
    23d4:	f2 ff 25 15 7b 00 00 	bnd jmp QWORD PTR [rip+0x7b15]        # 9ef0 <__assert_fail@GLIBC_2.2.5>
    23db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000023e0 <memset@plt>:
    23e0:	f3 0f 1e fa          	endbr64 
    23e4:	f2 ff 25 0d 7b 00 00 	bnd jmp QWORD PTR [rip+0x7b0d]        # 9ef8 <memset@GLIBC_2.2.5>
    23eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000023f0 <ioctl@plt>:
    23f0:	f3 0f 1e fa          	endbr64 
    23f4:	f2 ff 25 05 7b 00 00 	bnd jmp QWORD PTR [rip+0x7b05]        # 9f00 <ioctl@GLIBC_2.2.5>
    23fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002400 <close@plt>:
    2400:	f3 0f 1e fa          	endbr64 
    2404:	f2 ff 25 fd 7a 00 00 	bnd jmp QWORD PTR [rip+0x7afd]        # 9f08 <close@GLIBC_2.2.5>
    240b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002410 <fputc@plt>:
    2410:	f3 0f 1e fa          	endbr64 
    2414:	f2 ff 25 f5 7a 00 00 	bnd jmp QWORD PTR [rip+0x7af5]        # 9f10 <fputc@GLIBC_2.2.5>
    241b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002420 <read@plt>:
    2420:	f3 0f 1e fa          	endbr64 
    2424:	f2 ff 25 ed 7a 00 00 	bnd jmp QWORD PTR [rip+0x7aed]        # 9f18 <read@GLIBC_2.2.5>
    242b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002430 <srand@plt>:
    2430:	f3 0f 1e fa          	endbr64 
    2434:	f2 ff 25 e5 7a 00 00 	bnd jmp QWORD PTR [rip+0x7ae5]        # 9f20 <srand@GLIBC_2.2.5>
    243b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002440 <__gmp_randinit_default@plt>:
    2440:	f3 0f 1e fa          	endbr64 
    2444:	f2 ff 25 dd 7a 00 00 	bnd jmp QWORD PTR [rip+0x7add]        # 9f28 <__gmp_randinit_default@Base>
    244b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002450 <calloc@plt>:
    2450:	f3 0f 1e fa          	endbr64 
    2454:	f2 ff 25 d5 7a 00 00 	bnd jmp QWORD PTR [rip+0x7ad5]        # 9f30 <calloc@GLIBC_2.2.5>
    245b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002460 <syscall@plt>:
    2460:	f3 0f 1e fa          	endbr64 
    2464:	f2 ff 25 cd 7a 00 00 	bnd jmp QWORD PTR [rip+0x7acd]        # 9f38 <syscall@GLIBC_2.2.5>
    246b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002470 <strtol@plt>:
    2470:	f3 0f 1e fa          	endbr64 
    2474:	f2 ff 25 c5 7a 00 00 	bnd jmp QWORD PTR [rip+0x7ac5]        # 9f40 <strtol@GLIBC_2.2.5>
    247b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002480 <memcpy@plt>:
    2480:	f3 0f 1e fa          	endbr64 
    2484:	f2 ff 25 bd 7a 00 00 	bnd jmp QWORD PTR [rip+0x7abd]        # 9f48 <memcpy@GLIBC_2.14>
    248b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002490 <malloc@plt>:
    2490:	f3 0f 1e fa          	endbr64 
    2494:	f2 ff 25 b5 7a 00 00 	bnd jmp QWORD PTR [rip+0x7ab5]        # 9f50 <malloc@GLIBC_2.2.5>
    249b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000024a0 <realloc@plt>:
    24a0:	f3 0f 1e fa          	endbr64 
    24a4:	f2 ff 25 ad 7a 00 00 	bnd jmp QWORD PTR [rip+0x7aad]        # 9f58 <realloc@GLIBC_2.2.5>
    24ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000024b0 <__printf_chk@plt>:
    24b0:	f3 0f 1e fa          	endbr64 
    24b4:	f2 ff 25 a5 7a 00 00 	bnd jmp QWORD PTR [rip+0x7aa5]        # 9f60 <__printf_chk@GLIBC_2.3.4>
    24bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000024c0 <open@plt>:
    24c0:	f3 0f 1e fa          	endbr64 
    24c4:	f2 ff 25 9d 7a 00 00 	bnd jmp QWORD PTR [rip+0x7a9d]        # 9f68 <open@GLIBC_2.2.5>
    24cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000024d0 <fopen@plt>:
    24d0:	f3 0f 1e fa          	endbr64 
    24d4:	f2 ff 25 95 7a 00 00 	bnd jmp QWORD PTR [rip+0x7a95]        # 9f70 <fopen@GLIBC_2.2.5>
    24db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000024e0 <perror@plt>:
    24e0:	f3 0f 1e fa          	endbr64 
    24e4:	f2 ff 25 8d 7a 00 00 	bnd jmp QWORD PTR [rip+0x7a8d]        # 9f78 <perror@GLIBC_2.2.5>
    24eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000024f0 <strcat@plt>:
    24f0:	f3 0f 1e fa          	endbr64 
    24f4:	f2 ff 25 85 7a 00 00 	bnd jmp QWORD PTR [rip+0x7a85]        # 9f80 <strcat@GLIBC_2.2.5>
    24fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002500 <exit@plt>:
    2500:	f3 0f 1e fa          	endbr64 
    2504:	f2 ff 25 7d 7a 00 00 	bnd jmp QWORD PTR [rip+0x7a7d]        # 9f88 <exit@GLIBC_2.2.5>
    250b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002510 <fwrite@plt>:
    2510:	f3 0f 1e fa          	endbr64 
    2514:	f2 ff 25 75 7a 00 00 	bnd jmp QWORD PTR [rip+0x7a75]        # 9f90 <fwrite@GLIBC_2.2.5>
    251b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002520 <__fprintf_chk@plt>:
    2520:	f3 0f 1e fa          	endbr64 
    2524:	f2 ff 25 6d 7a 00 00 	bnd jmp QWORD PTR [rip+0x7a6d]        # 9f98 <__fprintf_chk@GLIBC_2.3.4>
    252b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002530 <posix_memalign@plt>:
    2530:	f3 0f 1e fa          	endbr64 
    2534:	f2 ff 25 65 7a 00 00 	bnd jmp QWORD PTR [rip+0x7a65]        # 9fa0 <posix_memalign@GLIBC_2.2.5>
    253b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002540 <__gmpz_init@plt>:
    2540:	f3 0f 1e fa          	endbr64 
    2544:	f2 ff 25 5d 7a 00 00 	bnd jmp QWORD PTR [rip+0x7a5d]        # 9fa8 <__gmpz_init@Base>
    254b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002550 <strerror@plt>:
    2550:	f3 0f 1e fa          	endbr64 
    2554:	f2 ff 25 55 7a 00 00 	bnd jmp QWORD PTR [rip+0x7a55]        # 9fb0 <strerror@GLIBC_2.2.5>
    255b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002560 <sleep@plt>:
    2560:	f3 0f 1e fa          	endbr64 
    2564:	f2 ff 25 4d 7a 00 00 	bnd jmp QWORD PTR [rip+0x7a4d]        # 9fb8 <sleep@GLIBC_2.2.5>
    256b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002570 <__gmpz_urandomb@plt>:
    2570:	f3 0f 1e fa          	endbr64 
    2574:	f2 ff 25 45 7a 00 00 	bnd jmp QWORD PTR [rip+0x7a45]        # 9fc0 <__gmpz_urandomb@Base>
    257b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002580 <rand@plt>:
    2580:	f3 0f 1e fa          	endbr64 
    2584:	f2 ff 25 3d 7a 00 00 	bnd jmp QWORD PTR [rip+0x7a3d]        # 9fc8 <rand@GLIBC_2.2.5>
    258b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002590 <__sprintf_chk@plt>:
    2590:	f3 0f 1e fa          	endbr64 
    2594:	f2 ff 25 35 7a 00 00 	bnd jmp QWORD PTR [rip+0x7a35]        # 9fd0 <__sprintf_chk@GLIBC_2.3.4>
    259b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

00000000000025a0 <main>:
    25a0:	f3 0f 1e fa          	endbr64 
    25a4:	55                   	push   rbp
    25a5:	48 89 e5             	mov    rbp,rsp
    25a8:	53                   	push   rbx
    25a9:	48 89 f3             	mov    rbx,rsi
    25ac:	48 83 ec 08          	sub    rsp,0x8
    25b0:	83 ff 03             	cmp    edi,0x3
    25b3:	74 22                	je     25d7 <main+0x37>
    25b5:	48 8b 16             	mov    rdx,QWORD PTR [rsi]
    25b8:	bf 01 00 00 00       	mov    edi,0x1
    25bd:	31 c0                	xor    eax,eax
    25bf:	48 8d 35 7a 4d 00 00 	lea    rsi,[rip+0x4d7a]        # 7340 <_IO_stdin_used+0x340>
    25c6:	e8 e5 fe ff ff       	call   24b0 <__printf_chk@plt>
    25cb:	b8 01 00 00 00       	mov    eax,0x1
    25d0:	48 83 c4 08          	add    rsp,0x8
    25d4:	5b                   	pop    rbx
    25d5:	5d                   	pop    rbp
    25d6:	c3                   	ret    
    25d7:	48 8b 7e 08          	mov    rdi,QWORD PTR [rsi+0x8]
    25db:	ba 0a 00 00 00       	mov    edx,0xa
    25e0:	31 f6                	xor    esi,esi
    25e2:	e8 89 fe ff ff       	call   2470 <strtol@plt>
    25e7:	85 c0                	test   eax,eax
    25e9:	0f 8e b3 00 00 00    	jle    26a2 <main+0x102>
    25ef:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
    25f3:	31 f6                	xor    esi,esi
    25f5:	ba 0a 00 00 00       	mov    edx,0xa
    25fa:	e8 71 fe ff ff       	call   2470 <strtol@plt>
    25ff:	48 8b 7b 10          	mov    rdi,QWORD PTR [rbx+0x10]
    2603:	31 f6                	xor    esi,esi
    2605:	ba 0a 00 00 00       	mov    edx,0xa
    260a:	89 05 c0 7e 00 00    	mov    DWORD PTR [rip+0x7ec0],eax        # a4d0 <NUM_BITS>
    2610:	e8 5b fe ff ff       	call   2470 <strtol@plt>
    2615:	c5 e9 ef d2          	vpxor  xmm2,xmm2,xmm2
    2619:	be 01 00 00 00       	mov    esi,0x1
    261e:	62 f2 fd 48 59 05 b0 	vpbroadcastq zmm0,QWORD PTR [rip+0x50b0]        # 76d8 <__PRETTY_FUNCTION__.0+0x4b>
    2625:	50 00 00 
    2628:	62 f2 fd 48 59 0d ae 	vpbroadcastq zmm1,QWORD PTR [rip+0x50ae]        # 76e0 <__PRETTY_FUNCTION__.0+0x53>
    262f:	50 00 00 
    2632:	bf 00 00 00 40       	mov    edi,0x40000000
    2637:	89 05 97 7e 00 00    	mov    DWORD PTR [rip+0x7e97],eax        # a4d4 <CORE_NO>
    263d:	62 f1 fd 48 7f 05 39 	vmovdqa64 ZMMWORD PTR [rip+0x7e39],zmm0        # a480 <limb_digits>
    2644:	7e 00 00 
    2647:	62 f1 fd 48 7f 0d ef 	vmovdqa64 ZMMWORD PTR [rip+0x7def],zmm1        # a440 <minus_limb_digits>
    264e:	7d 00 00 
    2651:	62 f1 fd 48 7f 15 a5 	vmovdqa64 ZMMWORD PTR [rip+0x7da5],zmm2        # a400 <zeros>
    2658:	7d 00 00 
    265b:	c5 f8 77             	vzeroupper 
    265e:	e8 ed fd ff ff       	call   2450 <calloc@plt>
    2663:	be 01 00 00 00       	mov    esi,0x1
    2668:	bf 00 00 00 40       	mov    edi,0x40000000
    266d:	48 89 05 54 7e 00 00 	mov    QWORD PTR [rip+0x7e54],rax        # a4c8 <sub_space>
    2674:	e8 d7 fd ff ff       	call   2450 <calloc@plt>
    2679:	c7 05 59 7e 00 00 00 	mov    DWORD PTR [rip+0x7e59],0x0        # a4dc <sub_space_ptr>
    2680:	00 00 00 
    2683:	48 89 05 36 7e 00 00 	mov    QWORD PTR [rip+0x7e36],rax        # a4c0 <borrow_space>
    268a:	31 c0                	xor    eax,eax
    268c:	c7 05 42 7e 00 00 00 	mov    DWORD PTR [rip+0x7e42],0x0        # a4d8 <borrow_space_ptr>
    2693:	00 00 00 
    2696:	e8 95 26 00 00       	call   4d30 <run_tests>
    269b:	31 c0                	xor    eax,eax
    269d:	e9 2e ff ff ff       	jmp    25d0 <main+0x30>
    26a2:	48 8d 0d e4 4f 00 00 	lea    rcx,[rip+0x4fe4]        # 768d <__PRETTY_FUNCTION__.0>
    26a9:	ba 3a 01 00 00       	mov    edx,0x13a
    26ae:	48 8d 35 6e 4f 00 00 	lea    rsi,[rip+0x4f6e]        # 7623 <_IO_stdin_used+0x623>
    26b5:	48 8d 3d 71 4f 00 00 	lea    rdi,[rip+0x4f71]        # 762d <_IO_stdin_used+0x62d>
    26bc:	e8 0f fd ff ff       	call   23d0 <__assert_fail@plt>
    26c1:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    26c8:	00 00 00 
    26cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000026d0 <set_fast_math>:
    26d0:	f3 0f 1e fa          	endbr64 
    26d4:	0f ae 5c 24 fc       	stmxcsr DWORD PTR [rsp-0x4]
    26d9:	81 4c 24 fc 40 80 00 	or     DWORD PTR [rsp-0x4],0x8040
    26e0:	00 
    26e1:	0f ae 54 24 fc       	ldmxcsr DWORD PTR [rsp-0x4]
    26e6:	c3                   	ret    
    26e7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    26ee:	00 00 

00000000000026f0 <_start>:
    26f0:	f3 0f 1e fa          	endbr64 
    26f4:	31 ed                	xor    ebp,ebp
    26f6:	49 89 d1             	mov    r9,rdx
    26f9:	5e                   	pop    rsi
    26fa:	48 89 e2             	mov    rdx,rsp
    26fd:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    2701:	50                   	push   rax
    2702:	54                   	push   rsp
    2703:	45 31 c0             	xor    r8d,r8d
    2706:	31 c9                	xor    ecx,ecx
    2708:	48 8d 3d 91 fe ff ff 	lea    rdi,[rip+0xfffffffffffffe91]        # 25a0 <main>
    270f:	ff 15 c3 78 00 00    	call   QWORD PTR [rip+0x78c3]        # 9fd8 <__libc_start_main@GLIBC_2.34>
    2715:	f4                   	hlt    
    2716:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    271d:	00 00 00 

0000000000002720 <deregister_tm_clones>:
    2720:	48 8d 3d 29 79 00 00 	lea    rdi,[rip+0x7929]        # a050 <__TMC_END__>
    2727:	48 8d 05 22 79 00 00 	lea    rax,[rip+0x7922]        # a050 <__TMC_END__>
    272e:	48 39 f8             	cmp    rax,rdi
    2731:	74 15                	je     2748 <deregister_tm_clones+0x28>
    2733:	48 8b 05 a6 78 00 00 	mov    rax,QWORD PTR [rip+0x78a6]        # 9fe0 <_ITM_deregisterTMCloneTable@Base>
    273a:	48 85 c0             	test   rax,rax
    273d:	74 09                	je     2748 <deregister_tm_clones+0x28>
    273f:	ff e0                	jmp    rax
    2741:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    2748:	c3                   	ret    
    2749:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000002750 <register_tm_clones>:
    2750:	48 8d 3d f9 78 00 00 	lea    rdi,[rip+0x78f9]        # a050 <__TMC_END__>
    2757:	48 8d 35 f2 78 00 00 	lea    rsi,[rip+0x78f2]        # a050 <__TMC_END__>
    275e:	48 29 fe             	sub    rsi,rdi
    2761:	48 89 f0             	mov    rax,rsi
    2764:	48 c1 ee 3f          	shr    rsi,0x3f
    2768:	48 c1 f8 03          	sar    rax,0x3
    276c:	48 01 c6             	add    rsi,rax
    276f:	48 d1 fe             	sar    rsi,1
    2772:	74 14                	je     2788 <register_tm_clones+0x38>
    2774:	48 8b 05 75 78 00 00 	mov    rax,QWORD PTR [rip+0x7875]        # 9ff0 <_ITM_registerTMCloneTable@Base>
    277b:	48 85 c0             	test   rax,rax
    277e:	74 08                	je     2788 <register_tm_clones+0x38>
    2780:	ff e0                	jmp    rax
    2782:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    2788:	c3                   	ret    
    2789:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000002790 <__do_global_dtors_aux>:
    2790:	f3 0f 1e fa          	endbr64 
    2794:	80 3d ed 78 00 00 00 	cmp    BYTE PTR [rip+0x78ed],0x0        # a088 <completed.0>
    279b:	75 2b                	jne    27c8 <__do_global_dtors_aux+0x38>
    279d:	55                   	push   rbp
    279e:	48 83 3d 52 78 00 00 	cmp    QWORD PTR [rip+0x7852],0x0        # 9ff8 <__cxa_finalize@GLIBC_2.2.5>
    27a5:	00 
    27a6:	48 89 e5             	mov    rbp,rsp
    27a9:	74 0c                	je     27b7 <__do_global_dtors_aux+0x27>
    27ab:	48 8b 3d 56 78 00 00 	mov    rdi,QWORD PTR [rip+0x7856]        # a008 <__dso_handle>
    27b2:	e8 29 fb ff ff       	call   22e0 <__cxa_finalize@plt>
    27b7:	e8 64 ff ff ff       	call   2720 <deregister_tm_clones>
    27bc:	c6 05 c5 78 00 00 01 	mov    BYTE PTR [rip+0x78c5],0x1        # a088 <completed.0>
    27c3:	5d                   	pop    rbp
    27c4:	c3                   	ret    
    27c5:	0f 1f 00             	nop    DWORD PTR [rax]
    27c8:	c3                   	ret    
    27c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000027d0 <frame_dummy>:
    27d0:	f3 0f 1e fa          	endbr64 
    27d4:	e9 77 ff ff ff       	jmp    2750 <register_tm_clones>
    27d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000027e0 <open_file.part.0>:
    27e0:	50                   	push   rax
    27e1:	58                   	pop    rax
    27e2:	48 8d 3d 1f 48 00 00 	lea    rdi,[rip+0x481f]        # 7008 <_IO_stdin_used+0x8>
    27e9:	48 83 ec 08          	sub    rsp,0x8
    27ed:	e8 ee fc ff ff       	call   24e0 <perror@plt>
    27f2:	bf 01 00 00 00       	mov    edi,0x1
    27f7:	e8 04 fd ff ff       	call   2500 <exit@plt>
    27fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000002800 <perf_event_open>:
    2800:	f3 0f 1e fa          	endbr64 
    2804:	48 83 ec 08          	sub    rsp,0x8
    2808:	4d 89 c1             	mov    r9,r8
    280b:	31 c0                	xor    eax,eax
    280d:	41 89 c8             	mov    r8d,ecx
    2810:	89 d1                	mov    ecx,edx
    2812:	89 f2                	mov    edx,esi
    2814:	48 89 fe             	mov    rsi,rdi
    2817:	bf 2a 01 00 00       	mov    edi,0x12a
    281c:	e8 3f fc ff ff       	call   2460 <syscall@plt>
    2821:	48 83 c4 08          	add    rsp,0x8
    2825:	48 98                	cdqe   
    2827:	c3                   	ret    
    2828:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    282f:	00 

0000000000002830 <generate_seed>:
    2830:	f3 0f 1e fa          	endbr64 
    2834:	55                   	push   rbp
    2835:	bf 01 00 00 00       	mov    edi,0x1
    283a:	48 83 ec 40          	sub    rsp,0x40
    283e:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    2845:	00 00 
    2847:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
    284c:	31 c0                	xor    eax,eax
    284e:	48 8d 74 24 10       	lea    rsi,[rsp+0x10]
    2853:	e8 08 fb ff ff       	call   2360 <clock_gettime@plt>
    2858:	31 ff                	xor    edi,edi
    285a:	48 8d 74 24 20       	lea    rsi,[rsp+0x20]
    285f:	e8 fc fa ff ff       	call   2360 <clock_gettime@plt>
    2864:	31 f6                	xor    esi,esi
    2866:	31 c0                	xor    eax,eax
    2868:	48 8d 3d 78 4b 00 00 	lea    rdi,[rip+0x4b78]        # 73e7 <_IO_stdin_used+0x3e7>
    286f:	e8 4c fc ff ff       	call   24c0 <open@plt>
    2874:	83 f8 ff             	cmp    eax,0xffffffff
    2877:	74 67                	je     28e0 <generate_seed+0xb0>
    2879:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
    287e:	ba 04 00 00 00       	mov    edx,0x4
    2883:	89 c7                	mov    edi,eax
    2885:	89 c5                	mov    ebp,eax
    2887:	e8 94 fb ff ff       	call   2420 <read@plt>
    288c:	48 83 f8 04          	cmp    rax,0x4
    2890:	75 69                	jne    28fb <generate_seed+0xcb>
    2892:	89 ef                	mov    edi,ebp
    2894:	e8 67 fb ff ff       	call   2400 <close@plt>
    2899:	e8 d2 fa ff ff       	call   2370 <getpid@plt>
    289e:	bf ba 00 00 00       	mov    edi,0xba
    28a3:	48 63 e8             	movsxd rbp,eax
    28a6:	31 c0                	xor    eax,eax
    28a8:	e8 b3 fb ff ff       	call   2460 <syscall@plt>
    28ad:	8b 54 24 0c          	mov    edx,DWORD PTR [rsp+0xc]
    28b1:	49 89 c0             	mov    r8,rax
    28b4:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
    28b9:	48 33 44 24 28       	xor    rax,QWORD PTR [rsp+0x28]
    28be:	48 31 d0             	xor    rax,rdx
    28c1:	49 63 c8             	movsxd rcx,r8d
    28c4:	48 31 e8             	xor    rax,rbp
    28c7:	48 31 c8             	xor    rax,rcx
    28ca:	48 8b 54 24 38       	mov    rdx,QWORD PTR [rsp+0x38]
    28cf:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    28d6:	00 00 
    28d8:	75 1c                	jne    28f6 <generate_seed+0xc6>
    28da:	48 83 c4 40          	add    rsp,0x40
    28de:	5d                   	pop    rbp
    28df:	c3                   	ret    
    28e0:	48 8d 3d f2 4a 00 00 	lea    rdi,[rip+0x4af2]        # 73d9 <_IO_stdin_used+0x3d9>
    28e7:	e8 f4 fb ff ff       	call   24e0 <perror@plt>
    28ec:	bf 01 00 00 00       	mov    edi,0x1
    28f1:	e8 0a fc ff ff       	call   2500 <exit@plt>
    28f6:	e8 c5 fa ff ff       	call   23c0 <__stack_chk_fail@plt>
    28fb:	48 8d 3d 2e 47 00 00 	lea    rdi,[rip+0x472e]        # 7030 <_IO_stdin_used+0x30>
    2902:	e8 d9 fb ff ff       	call   24e0 <perror@plt>
    2907:	89 ef                	mov    edi,ebp
    2909:	e8 f2 fa ff ff       	call   2400 <close@plt>
    290e:	bf 01 00 00 00       	mov    edi,0x1
    2913:	e8 e8 fb ff ff       	call   2500 <exit@plt>
    2918:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    291f:	00 

0000000000002920 <print_mask_binary>:
    2920:	f3 0f 1e fa          	endbr64 
    2924:	41 54                	push   r12
    2926:	4c 8d 25 c7 4a 00 00 	lea    r12,[rip+0x4ac7]        # 73f4 <_IO_stdin_used+0x3f4>
    292d:	55                   	push   rbp
    292e:	0f b7 ef             	movzx  ebp,di
    2931:	53                   	push   rbx
    2932:	bb 0f 00 00 00       	mov    ebx,0xf
    2937:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    293e:	00 00 
    2940:	89 d9                	mov    ecx,ebx
    2942:	89 ea                	mov    edx,ebp
    2944:	31 c0                	xor    eax,eax
    2946:	4c 89 e6             	mov    rsi,r12
    2949:	d3 fa                	sar    edx,cl
    294b:	bf 01 00 00 00       	mov    edi,0x1
    2950:	83 e2 01             	and    edx,0x1
    2953:	e8 58 fb ff ff       	call   24b0 <__printf_chk@plt>
    2958:	83 eb 01             	sub    ebx,0x1
    295b:	73 e3                	jae    2940 <print_mask_binary+0x20>
    295d:	5b                   	pop    rbx
    295e:	bf 0a 00 00 00       	mov    edi,0xa
    2963:	5d                   	pop    rbp
    2964:	41 5c                	pop    r12
    2966:	e9 b5 f9 ff ff       	jmp    2320 <putchar@plt>
    296b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002970 <is_less_than>:
    2970:	f3 0f 1e fa          	endbr64 
    2974:	8d 42 ff             	lea    eax,[rdx-0x1]
    2977:	8b 0e                	mov    ecx,DWORD PTR [rsi]
    2979:	83 e0 07             	and    eax,0x7
    297c:	39 0f                	cmp    DWORD PTR [rdi],ecx
    297e:	0f 82 74 01 00 00    	jb     2af8 <is_less_than+0x188>
    2984:	0f 87 76 01 00 00    	ja     2b00 <is_less_than+0x190>
    298a:	b9 01 00 00 00       	mov    ecx,0x1
    298f:	83 fa 01             	cmp    edx,0x1
    2992:	77 04                	ja     2998 <is_less_than+0x28>
    2994:	c3                   	ret    
    2995:	0f 1f 00             	nop    DWORD PTR [rax]
    2998:	85 c0                	test   eax,eax
    299a:	0f 84 d4 00 00 00    	je     2a74 <is_less_than+0x104>
    29a0:	83 f8 01             	cmp    eax,0x1
    29a3:	0f 84 ab 00 00 00    	je     2a54 <is_less_than+0xe4>
    29a9:	83 f8 02             	cmp    eax,0x2
    29ac:	0f 84 8a 00 00 00    	je     2a3c <is_less_than+0xcc>
    29b2:	83 f8 03             	cmp    eax,0x3
    29b5:	74 6f                	je     2a26 <is_less_than+0xb6>
    29b7:	83 f8 04             	cmp    eax,0x4
    29ba:	74 52                	je     2a0e <is_less_than+0x9e>
    29bc:	83 f8 05             	cmp    eax,0x5
    29bf:	74 35                	je     29f6 <is_less_than+0x86>
    29c1:	83 f8 06             	cmp    eax,0x6
    29c4:	74 18                	je     29de <is_less_than+0x6e>
    29c6:	44 8b 04 8e          	mov    r8d,DWORD PTR [rsi+rcx*4]
    29ca:	44 39 04 8f          	cmp    DWORD PTR [rdi+rcx*4],r8d
    29ce:	0f 82 24 01 00 00    	jb     2af8 <is_less_than+0x188>
    29d4:	0f 87 26 01 00 00    	ja     2b00 <is_less_than+0x190>
    29da:	48 83 c1 01          	add    rcx,0x1
    29de:	44 8b 0c 8e          	mov    r9d,DWORD PTR [rsi+rcx*4]
    29e2:	44 39 0c 8f          	cmp    DWORD PTR [rdi+rcx*4],r9d
    29e6:	0f 82 0c 01 00 00    	jb     2af8 <is_less_than+0x188>
    29ec:	0f 87 0e 01 00 00    	ja     2b00 <is_less_than+0x190>
    29f2:	48 83 c1 01          	add    rcx,0x1
    29f6:	44 8b 14 8e          	mov    r10d,DWORD PTR [rsi+rcx*4]
    29fa:	44 39 14 8f          	cmp    DWORD PTR [rdi+rcx*4],r10d
    29fe:	0f 82 f4 00 00 00    	jb     2af8 <is_less_than+0x188>
    2a04:	0f 87 f6 00 00 00    	ja     2b00 <is_less_than+0x190>
    2a0a:	48 83 c1 01          	add    rcx,0x1
    2a0e:	44 8b 1c 8e          	mov    r11d,DWORD PTR [rsi+rcx*4]
    2a12:	44 39 1c 8f          	cmp    DWORD PTR [rdi+rcx*4],r11d
    2a16:	0f 82 dc 00 00 00    	jb     2af8 <is_less_than+0x188>
    2a1c:	0f 87 de 00 00 00    	ja     2b00 <is_less_than+0x190>
    2a22:	48 83 c1 01          	add    rcx,0x1
    2a26:	8b 04 8e             	mov    eax,DWORD PTR [rsi+rcx*4]
    2a29:	39 04 8f             	cmp    DWORD PTR [rdi+rcx*4],eax
    2a2c:	0f 82 c6 00 00 00    	jb     2af8 <is_less_than+0x188>
    2a32:	0f 87 c8 00 00 00    	ja     2b00 <is_less_than+0x190>
    2a38:	48 83 c1 01          	add    rcx,0x1
    2a3c:	44 8b 04 8e          	mov    r8d,DWORD PTR [rsi+rcx*4]
    2a40:	44 39 04 8f          	cmp    DWORD PTR [rdi+rcx*4],r8d
    2a44:	0f 82 ae 00 00 00    	jb     2af8 <is_less_than+0x188>
    2a4a:	0f 87 b0 00 00 00    	ja     2b00 <is_less_than+0x190>
    2a50:	48 83 c1 01          	add    rcx,0x1
    2a54:	44 8b 0c 8e          	mov    r9d,DWORD PTR [rsi+rcx*4]
    2a58:	44 39 0c 8f          	cmp    DWORD PTR [rdi+rcx*4],r9d
    2a5c:	0f 82 96 00 00 00    	jb     2af8 <is_less_than+0x188>
    2a62:	0f 87 98 00 00 00    	ja     2b00 <is_less_than+0x190>
    2a68:	48 83 c1 01          	add    rcx,0x1
    2a6c:	39 ca                	cmp    edx,ecx
    2a6e:	0f 86 20 ff ff ff    	jbe    2994 <is_less_than+0x24>
    2a74:	44 8b 14 8e          	mov    r10d,DWORD PTR [rsi+rcx*4]
    2a78:	44 39 14 8f          	cmp    DWORD PTR [rdi+rcx*4],r10d
    2a7c:	72 7a                	jb     2af8 <is_less_than+0x188>
    2a7e:	0f 87 7c 00 00 00    	ja     2b00 <is_less_than+0x190>
    2a84:	44 8b 5c 8e 04       	mov    r11d,DWORD PTR [rsi+rcx*4+0x4]
    2a89:	48 8d 41 01          	lea    rax,[rcx+0x1]
    2a8d:	44 39 5c 8f 04       	cmp    DWORD PTR [rdi+rcx*4+0x4],r11d
    2a92:	72 64                	jb     2af8 <is_less_than+0x188>
    2a94:	77 6a                	ja     2b00 <is_less_than+0x190>
    2a96:	44 8b 44 8e 08       	mov    r8d,DWORD PTR [rsi+rcx*4+0x8]
    2a9b:	44 39 44 8f 08       	cmp    DWORD PTR [rdi+rcx*4+0x8],r8d
    2aa0:	72 56                	jb     2af8 <is_less_than+0x188>
    2aa2:	77 5c                	ja     2b00 <is_less_than+0x190>
    2aa4:	44 8b 4c 8e 0c       	mov    r9d,DWORD PTR [rsi+rcx*4+0xc]
    2aa9:	44 39 4c 8f 0c       	cmp    DWORD PTR [rdi+rcx*4+0xc],r9d
    2aae:	72 48                	jb     2af8 <is_less_than+0x188>
    2ab0:	77 4e                	ja     2b00 <is_less_than+0x190>
    2ab2:	44 8b 54 8e 10       	mov    r10d,DWORD PTR [rsi+rcx*4+0x10]
    2ab7:	44 39 54 8f 10       	cmp    DWORD PTR [rdi+rcx*4+0x10],r10d
    2abc:	72 3a                	jb     2af8 <is_less_than+0x188>
    2abe:	77 40                	ja     2b00 <is_less_than+0x190>
    2ac0:	8b 4c 86 10          	mov    ecx,DWORD PTR [rsi+rax*4+0x10]
    2ac4:	39 4c 87 10          	cmp    DWORD PTR [rdi+rax*4+0x10],ecx
    2ac8:	72 2e                	jb     2af8 <is_less_than+0x188>
    2aca:	77 34                	ja     2b00 <is_less_than+0x190>
    2acc:	44 8b 5c 86 14       	mov    r11d,DWORD PTR [rsi+rax*4+0x14]
    2ad1:	44 39 5c 87 14       	cmp    DWORD PTR [rdi+rax*4+0x14],r11d
    2ad6:	72 20                	jb     2af8 <is_less_than+0x188>
    2ad8:	77 26                	ja     2b00 <is_less_than+0x190>
    2ada:	44 8b 44 86 18       	mov    r8d,DWORD PTR [rsi+rax*4+0x18]
    2adf:	44 39 44 87 18       	cmp    DWORD PTR [rdi+rax*4+0x18],r8d
    2ae4:	72 12                	jb     2af8 <is_less_than+0x188>
    2ae6:	77 18                	ja     2b00 <is_less_than+0x190>
    2ae8:	48 8d 48 07          	lea    rcx,[rax+0x7]
    2aec:	39 ca                	cmp    edx,ecx
    2aee:	77 84                	ja     2a74 <is_less_than+0x104>
    2af0:	c3                   	ret    
    2af1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    2af8:	b8 01 00 00 00       	mov    eax,0x1
    2afd:	c3                   	ret    
    2afe:	66 90                	xchg   ax,ax
    2b00:	31 c0                	xor    eax,eax
    2b02:	c3                   	ret    
    2b03:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    2b0a:	00 00 00 00 
    2b0e:	66 90                	xchg   ax,ax

0000000000002b10 <sub_n>:
    2b10:	f3 0f 1e fa          	endbr64 
    2b14:	4c 8d 54 24 08       	lea    r10,[rsp+0x8]
    2b19:	48 83 e4 c0          	and    rsp,0xffffffffffffffc0
    2b1d:	41 ff 72 f8          	push   QWORD PTR [r10-0x8]
    2b21:	55                   	push   rbp
    2b22:	48 89 e5             	mov    rbp,rsp
    2b25:	41 57                	push   r15
    2b27:	41 56                	push   r14
    2b29:	4c 8d 9d c0 fc ff ff 	lea    r11,[rbp-0x340]
    2b30:	4c 8d b5 c0 fd ff ff 	lea    r14,[rbp-0x240]
    2b37:	41 55                	push   r13
    2b39:	49 89 f5             	mov    r13,rsi
    2b3c:	be 00 01 00 00       	mov    esi,0x100
    2b41:	4c 8d bd c0 fe ff ff 	lea    r15,[rbp-0x140]
    2b48:	41 54                	push   r12
    2b4a:	49 89 fc             	mov    r12,rdi
    2b4d:	4c 89 df             	mov    rdi,r11
    2b50:	41 52                	push   r10
    2b52:	53                   	push   rbx
    2b53:	89 cb                	mov    ebx,ecx
    2b55:	b9 00 01 00 00       	mov    ecx,0x100
    2b5a:	48 81 ec 88 03 00 00 	sub    rsp,0x388
    2b61:	48 89 95 a8 fc ff ff 	mov    QWORD PTR [rbp-0x358],rdx
    2b68:	44 8b 0d 61 79 00 00 	mov    r9d,DWORD PTR [rip+0x7961]        # a4d0 <NUM_BITS>
    2b6f:	ba 01 00 00 00       	mov    edx,0x1
    2b74:	4c 89 85 70 fc ff ff 	mov    QWORD PTR [rbp-0x390],r8
    2b7b:	4c 8d 05 75 48 00 00 	lea    r8,[rip+0x4875]        # 73f7 <_IO_stdin_used+0x3f7>
    2b82:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    2b89:	00 00 
    2b8b:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    2b8f:	31 c0                	xor    eax,eax
    2b91:	8b 05 3d 79 00 00    	mov    eax,DWORD PTR [rip+0x793d]        # a4d4 <CORE_NO>
    2b97:	4c 89 9d b8 fc ff ff 	mov    QWORD PTR [rbp-0x348],r11
    2b9e:	50                   	push   rax
    2b9f:	31 c0                	xor    eax,eax
    2ba1:	e8 5a f7 ff ff       	call   2300 <__snprintf_chk@plt>
    2ba6:	8b 15 28 79 00 00    	mov    edx,DWORD PTR [rip+0x7928]        # a4d4 <CORE_NO>
    2bac:	4c 89 f7             	mov    rdi,r14
    2baf:	31 c0                	xor    eax,eax
    2bb1:	44 8b 0d 18 79 00 00 	mov    r9d,DWORD PTR [rip+0x7918]        # a4d0 <NUM_BITS>
    2bb8:	b9 00 01 00 00       	mov    ecx,0x100
    2bbd:	be 00 01 00 00       	mov    esi,0x100
    2bc2:	4c 8d 05 43 48 00 00 	lea    r8,[rip+0x4843]        # 740c <_IO_stdin_used+0x40c>
    2bc9:	89 14 24             	mov    DWORD PTR [rsp],edx
    2bcc:	ba 01 00 00 00       	mov    edx,0x1
    2bd1:	e8 2a f7 ff ff       	call   2300 <__snprintf_chk@plt>
    2bd6:	8b 0d f8 78 00 00    	mov    ecx,DWORD PTR [rip+0x78f8]        # a4d4 <CORE_NO>
    2bdc:	4c 89 ff             	mov    rdi,r15
    2bdf:	31 c0                	xor    eax,eax
    2be1:	44 8b 0d e8 78 00 00 	mov    r9d,DWORD PTR [rip+0x78e8]        # a4d0 <NUM_BITS>
    2be8:	ba 01 00 00 00       	mov    edx,0x1
    2bed:	4c 8d 05 2e 48 00 00 	lea    r8,[rip+0x482e]        # 7422 <_IO_stdin_used+0x422>
    2bf4:	be 00 01 00 00       	mov    esi,0x100
    2bf9:	89 0c 24             	mov    DWORD PTR [rsp],ecx
    2bfc:	b9 00 01 00 00       	mov    ecx,0x100
    2c01:	4c 89 bd b0 fc ff ff 	mov    QWORD PTR [rbp-0x350],r15
    2c08:	4c 8d 3d 28 48 00 00 	lea    r15,[rip+0x4828]        # 7437 <_IO_stdin_used+0x437>
    2c0f:	e8 ec f6 ff ff       	call   2300 <__snprintf_chk@plt>
    2c14:	48 8b bd b8 fc ff ff 	mov    rdi,QWORD PTR [rbp-0x348]
    2c1b:	4c 89 fe             	mov    rsi,r15
    2c1e:	e8 ad f8 ff ff       	call   24d0 <fopen@plt>
    2c23:	4c 89 f7             	mov    rdi,r14
    2c26:	4c 89 fe             	mov    rsi,r15
    2c29:	48 89 85 b8 fc ff ff 	mov    QWORD PTR [rbp-0x348],rax
    2c30:	e8 9b f8 ff ff       	call   24d0 <fopen@plt>
    2c35:	48 8b bd b0 fc ff ff 	mov    rdi,QWORD PTR [rbp-0x350]
    2c3c:	4c 89 fe             	mov    rsi,r15
    2c3f:	49 89 c6             	mov    r14,rax
    2c42:	e8 89 f8 ff ff       	call   24d0 <fopen@plt>
    2c47:	48 83 bd b8 fc ff ff 	cmp    QWORD PTR [rbp-0x348],0x0
    2c4e:	00 
    2c4f:	40 0f 94 c6          	sete   sil
    2c53:	4d 85 f6             	test   r14,r14
    2c56:	48 89 85 b0 fc ff ff 	mov    QWORD PTR [rbp-0x350],rax
    2c5d:	58                   	pop    rax
    2c5e:	40 0f 94 c7          	sete   dil
    2c62:	5a                   	pop    rdx
    2c63:	09 fe                	or     esi,edi
    2c65:	48 83 bd b0 fc ff ff 	cmp    QWORD PTR [rbp-0x350],0x0
    2c6c:	00 
    2c6d:	41 0f 94 c0          	sete   r8b
    2c71:	44 08 c6             	or     sil,r8b
    2c74:	0f 85 ed 0c 00 00    	jne    3967 <sub_n+0xe57>
    2c7a:	0f ae e8             	lfence 
    2c7d:	0f 31                	rdtsc  
    2c7f:	48 c1 e2 20          	shl    rdx,0x20
    2c83:	41 89 c1             	mov    r9d,eax
    2c86:	44 8d 5b ff          	lea    r11d,[rbx-0x1]
    2c8a:	45 8b 7d 00          	mov    r15d,DWORD PTR [r13+0x0]
    2c8e:	4c 8b 95 a8 fc ff ff 	mov    r10,QWORD PTR [rbp-0x358]
    2c95:	4c 09 ca             	or     rdx,r9
    2c98:	41 83 e3 07          	and    r11d,0x7
    2c9c:	48 89 95 a0 fc ff ff 	mov    QWORD PTR [rbp-0x360],rdx
    2ca3:	49 8b 0a             	mov    rcx,QWORD PTR [r10]
    2ca6:	45 39 3c 24          	cmp    DWORD PTR [r12],r15d
    2caa:	0f 82 18 0c 00 00    	jb     38c8 <sub_n+0xdb8>
    2cb0:	77 0e                	ja     2cc0 <sub_n+0x1b0>
    2cb2:	ba 01 00 00 00       	mov    edx,0x1
    2cb7:	83 fb 01             	cmp    ebx,0x1
    2cba:	0f 87 20 0a 00 00    	ja     36e0 <sub_n+0xbd0>
    2cc0:	4c 63 05 11 78 00 00 	movsxd r8,DWORD PTR [rip+0x7811]        # a4d8 <borrow_space_ptr>
    2cc7:	48 8b 05 f2 77 00 00 	mov    rax,QWORD PTR [rip+0x77f2]        # a4c0 <borrow_space>
    2cce:	4e 8d 14 80          	lea    r10,[rax+r8*4]
    2cd2:	0f ae e8             	lfence 
    2cd5:	0f 31                	rdtsc  
    2cd7:	48 c1 e2 20          	shl    rdx,0x20
    2cdb:	41 89 c1             	mov    r9d,eax
    2cde:	4c 09 ca             	or     rdx,r9
    2ce1:	48 89 95 98 fc ff ff 	mov    QWORD PTR [rbp-0x368],rdx
    2ce8:	0f ae e8             	lfence 
    2ceb:	0f 31                	rdtsc  
    2ced:	48 c1 e2 20          	shl    rdx,0x20
    2cf1:	41 89 c3             	mov    r11d,eax
    2cf4:	4c 09 da             	or     rdx,r11
    2cf7:	49 89 d0             	mov    r8,rdx
    2cfa:	85 db                	test   ebx,ebx
    2cfc:	0f 8e 16 02 00 00    	jle    2f18 <sub_n+0x408>
    2d02:	62 d1 7e 48 6f 34 24 	vmovdqu32 zmm6,ZMMWORD PTR [r12]
    2d09:	62 d1 4d 48 fa 45 00 	vpsubd zmm0,zmm6,ZMMWORD PTR [r13+0x0]
    2d10:	bf 01 00 00 00       	mov    edi,0x1
    2d15:	4c 8d 3d e4 76 00 00 	lea    r15,[rip+0x76e4]        # a400 <zeros>
    2d1c:	4c 8d 0d 5d 77 00 00 	lea    r9,[rip+0x775d]        # a480 <limb_digits>
    2d23:	8d 53 ff             	lea    edx,[rbx-0x1]
    2d26:	b8 10 00 00 00       	mov    eax,0x10
    2d2b:	62 d3 7d 48 1f 0f 01 	vpcmpltd k1,zmm0,ZMMWORD PTR [r15]
    2d32:	62 f1 7d 48 6f d0    	vmovdqa32 zmm2,zmm0
    2d38:	c1 ea 04             	shr    edx,0x4
    2d3b:	62 d1 7d 49 fe 11    	vpaddd zmm2{k1},zmm0,ZMMWORD PTR [r9]
    2d41:	83 e2 03             	and    edx,0x3
    2d44:	62 f2 7d c9 7c cf    	vpbroadcastd zmm1{k1}{z},edi
    2d4a:	62 d1 fe 48 7f 0a    	vmovdqu64 ZMMWORD PTR [r10],zmm1
    2d50:	62 f1 fe 48 7f 11    	vmovdqu64 ZMMWORD PTR [rcx],zmm2
    2d56:	83 fb 10             	cmp    ebx,0x10
    2d59:	0f 8e b9 01 00 00    	jle    2f18 <sub_n+0x408>
    2d5f:	85 d2                	test   edx,edx
    2d61:	0f 84 c1 00 00 00    	je     2e28 <sub_n+0x318>
    2d67:	83 fa 01             	cmp    edx,0x1
    2d6a:	74 7a                	je     2de6 <sub_n+0x2d6>
    2d6c:	83 fa 02             	cmp    edx,0x2
    2d6f:	74 3b                	je     2dac <sub_n+0x29c>
    2d71:	62 d1 7e 48 6f 5c 24 	vmovdqu32 zmm3,ZMMWORD PTR [r12+0x40]
    2d78:	01 
    2d79:	62 d1 65 48 fa 65 01 	vpsubd zmm4,zmm3,ZMMWORD PTR [r13+0x40]
    2d80:	b8 20 00 00 00       	mov    eax,0x20
    2d85:	62 d3 5d 48 1f 17 01 	vpcmpltd k2,zmm4,ZMMWORD PTR [r15]
    2d8c:	62 f1 7d 48 6f ec    	vmovdqa32 zmm5,zmm4
    2d92:	62 d1 5d 4a fe 29    	vpaddd zmm5{k2},zmm4,ZMMWORD PTR [r9]
    2d98:	62 f2 7d ca 7c ff    	vpbroadcastd zmm7{k2}{z},edi
    2d9e:	62 d1 fe 48 7f 7a 01 	vmovdqu64 ZMMWORD PTR [r10+0x40],zmm7
    2da5:	62 f1 fe 48 7f 69 01 	vmovdqu64 ZMMWORD PTR [rcx+0x40],zmm5
    2dac:	62 51 7e 48 6f 04 84 	vmovdqu32 zmm8,ZMMWORD PTR [r12+rax*4]
    2db3:	62 51 3d 48 fa 4c 85 	vpsubd zmm9,zmm8,ZMMWORD PTR [r13+rax*4+0x0]
    2dba:	00 
    2dbb:	62 d3 35 48 1f 1f 01 	vpcmpltd k3,zmm9,ZMMWORD PTR [r15]
    2dc2:	62 51 7d 48 6f d1    	vmovdqa32 zmm10,zmm9
    2dc8:	62 51 35 4b fe 11    	vpaddd zmm10{k3},zmm9,ZMMWORD PTR [r9]
    2dce:	62 72 7d cb 7c df    	vpbroadcastd zmm11{k3}{z},edi
    2dd4:	62 51 fe 48 7f 1c 82 	vmovdqu64 ZMMWORD PTR [r10+rax*4],zmm11
    2ddb:	62 71 fe 48 7f 14 81 	vmovdqu64 ZMMWORD PTR [rcx+rax*4],zmm10
    2de2:	48 83 c0 10          	add    rax,0x10
    2de6:	62 51 7e 48 6f 24 84 	vmovdqu32 zmm12,ZMMWORD PTR [r12+rax*4]
    2ded:	62 51 1d 48 fa 6c 85 	vpsubd zmm13,zmm12,ZMMWORD PTR [r13+rax*4+0x0]
    2df4:	00 
    2df5:	62 d3 15 48 1f 27 01 	vpcmpltd k4,zmm13,ZMMWORD PTR [r15]
    2dfc:	62 51 7d 48 6f f5    	vmovdqa32 zmm14,zmm13
    2e02:	62 51 15 4c fe 31    	vpaddd zmm14{k4},zmm13,ZMMWORD PTR [r9]
    2e08:	62 72 7d cc 7c ff    	vpbroadcastd zmm15{k4}{z},edi
    2e0e:	62 51 fe 48 7f 3c 82 	vmovdqu64 ZMMWORD PTR [r10+rax*4],zmm15
    2e15:	62 71 fe 48 7f 34 81 	vmovdqu64 ZMMWORD PTR [rcx+rax*4],zmm14
    2e1c:	48 83 c0 10          	add    rax,0x10
    2e20:	39 c3                	cmp    ebx,eax
    2e22:	0f 8e f0 00 00 00    	jle    2f18 <sub_n+0x408>
    2e28:	62 d1 7e 48 6f 34 84 	vmovdqu32 zmm6,ZMMWORD PTR [r12+rax*4]
    2e2f:	4c 8d 58 10          	lea    r11,[rax+0x10]
    2e33:	48 8d 50 20          	lea    rdx,[rax+0x20]
    2e37:	62 d1 4d 48 fa 44 85 	vpsubd zmm0,zmm6,ZMMWORD PTR [r13+rax*4+0x0]
    2e3e:	00 
    2e3f:	62 d3 7d 48 1f 2f 01 	vpcmpltd k5,zmm0,ZMMWORD PTR [r15]
    2e46:	62 f1 7d 48 6f d0    	vmovdqa32 zmm2,zmm0
    2e4c:	62 d1 7d 4d fe 11    	vpaddd zmm2{k5},zmm0,ZMMWORD PTR [r9]
    2e52:	62 f2 7d cd 7c cf    	vpbroadcastd zmm1{k5}{z},edi
    2e58:	62 d1 fe 48 7f 0c 82 	vmovdqu64 ZMMWORD PTR [r10+rax*4],zmm1
    2e5f:	62 f1 fe 48 7f 14 81 	vmovdqu64 ZMMWORD PTR [rcx+rax*4],zmm2
    2e66:	62 91 7e 48 6f 1c 9c 	vmovdqu32 zmm3,ZMMWORD PTR [r12+r11*4]
    2e6d:	62 91 65 48 fa 64 9d 	vpsubd zmm4,zmm3,ZMMWORD PTR [r13+r11*4+0x0]
    2e74:	00 
    2e75:	62 d3 5d 48 1f 37 01 	vpcmpltd k6,zmm4,ZMMWORD PTR [r15]
    2e7c:	62 f1 7d 48 6f ec    	vmovdqa32 zmm5,zmm4
    2e82:	62 d1 5d 4e fe 29    	vpaddd zmm5{k6},zmm4,ZMMWORD PTR [r9]
    2e88:	62 f2 7d ce 7c ff    	vpbroadcastd zmm7{k6}{z},edi
    2e8e:	62 91 fe 48 7f 3c 9a 	vmovdqu64 ZMMWORD PTR [r10+r11*4],zmm7
    2e95:	62 b1 fe 48 7f 2c 99 	vmovdqu64 ZMMWORD PTR [rcx+r11*4],zmm5
    2e9c:	62 51 7e 48 6f 04 94 	vmovdqu32 zmm8,ZMMWORD PTR [r12+rdx*4]
    2ea3:	4c 8d 58 30          	lea    r11,[rax+0x30]
    2ea7:	62 51 3d 48 fa 4c 95 	vpsubd zmm9,zmm8,ZMMWORD PTR [r13+rdx*4+0x0]
    2eae:	00 
    2eaf:	48 83 c0 40          	add    rax,0x40
    2eb3:	62 d3 35 48 1f 3f 01 	vpcmpltd k7,zmm9,ZMMWORD PTR [r15]
    2eba:	62 51 7d 48 6f d1    	vmovdqa32 zmm10,zmm9
    2ec0:	62 51 35 4f fe 11    	vpaddd zmm10{k7},zmm9,ZMMWORD PTR [r9]
    2ec6:	62 72 7d cf 7c df    	vpbroadcastd zmm11{k7}{z},edi
    2ecc:	62 51 fe 48 7f 1c 92 	vmovdqu64 ZMMWORD PTR [r10+rdx*4],zmm11
    2ed3:	62 71 fe 48 7f 14 91 	vmovdqu64 ZMMWORD PTR [rcx+rdx*4],zmm10
    2eda:	62 11 7e 48 6f 24 9c 	vmovdqu32 zmm12,ZMMWORD PTR [r12+r11*4]
    2ee1:	62 11 1d 48 fa 6c 9d 	vpsubd zmm13,zmm12,ZMMWORD PTR [r13+r11*4+0x0]
    2ee8:	00 
    2ee9:	62 d3 15 48 1f 0f 01 	vpcmpltd k1,zmm13,ZMMWORD PTR [r15]
    2ef0:	62 51 7d 48 6f f5    	vmovdqa32 zmm14,zmm13
    2ef6:	62 51 15 49 fe 31    	vpaddd zmm14{k1},zmm13,ZMMWORD PTR [r9]
    2efc:	62 72 7d c9 7c ff    	vpbroadcastd zmm15{k1}{z},edi
    2f02:	62 11 fe 48 7f 3c 9a 	vmovdqu64 ZMMWORD PTR [r10+r11*4],zmm15
    2f09:	62 31 fe 48 7f 34 99 	vmovdqu64 ZMMWORD PTR [rcx+r11*4],zmm14
    2f10:	39 c3                	cmp    ebx,eax
    2f12:	0f 8f 10 ff ff ff    	jg     2e28 <sub_n+0x318>
    2f18:	62 f1 fd 48 6f 35 de 	vmovdqa64 zmm6,ZMMWORD PTR [rip+0x74de]        # a400 <zeros>
    2f1f:	74 00 00 
    2f22:	4c 63 e3             	movsxd r12,ebx
    2f25:	62 b1 fe 48 7f 34 a1 	vmovdqu64 ZMMWORD PTR [rcx+r12*4],zmm6
    2f2c:	62 f1 fd 48 6f 05 ca 	vmovdqa64 zmm0,ZMMWORD PTR [rip+0x74ca]        # a400 <zeros>
    2f33:	74 00 00 
    2f36:	62 91 fe 48 7f 04 a2 	vmovdqu64 ZMMWORD PTR [r10+r12*4],zmm0
    2f3d:	0f ae e8             	lfence 
    2f40:	0f 31                	rdtsc  
    2f42:	48 c1 e2 20          	shl    rdx,0x20
    2f46:	41 89 c5             	mov    r13d,eax
    2f49:	4c 09 ea             	or     rdx,r13
    2f4c:	49 89 d1             	mov    r9,rdx
    2f4f:	0f ae e8             	lfence 
    2f52:	0f 31                	rdtsc  
    2f54:	48 c1 e2 20          	shl    rdx,0x20
    2f58:	41 89 c7             	mov    r15d,eax
    2f5b:	4c 09 fa             	or     rdx,r15
    2f5e:	48 89 95 80 fc ff ff 	mov    QWORD PTR [rbp-0x380],rdx
    2f65:	0f ae e8             	lfence 
    2f68:	0f 31                	rdtsc  
    2f6a:	48 c1 e2 20          	shl    rdx,0x20
    2f6e:	89 c7                	mov    edi,eax
    2f70:	48 09 fa             	or     rdx,rdi
    2f73:	48 89 95 88 fc ff ff 	mov    QWORD PTR [rbp-0x378],rdx
    2f7a:	0f ae e8             	lfence 
    2f7d:	0f 31                	rdtsc  
    2f7f:	48 c1 e2 20          	shl    rdx,0x20
    2f83:	41 89 c3             	mov    r11d,eax
    2f86:	4c 09 da             	or     rdx,r11
    2f89:	48 89 95 90 fc ff ff 	mov    QWORD PTR [rbp-0x370],rdx
    2f90:	85 db                	test   ebx,ebx
    2f92:	0f 8e 70 02 00 00    	jle    3208 <sub_n+0x6f8>
    2f98:	45 31 ed             	xor    r13d,r13d
    2f9b:	bf ff ff ff ff       	mov    edi,0xffffffff
    2fa0:	4c 8d 3d 59 74 00 00 	lea    r15,[rip+0x7459]        # a400 <zeros>
    2fa7:	41 bc 01 00 00 00    	mov    r12d,0x1
    2fad:	c5 f1 ef c9          	vpxor  xmm1,xmm1,xmm1
    2fb1:	eb 20                	jmp    2fd3 <sub_n+0x4c3>
    2fb3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    2fb8:	62 91 fe 48 7f 8c aa 	vmovdqu64 ZMMWORD PTR [r10+r13*4+0x4],zmm1
    2fbf:	04 00 00 00 
    2fc3:	62 b1 fe 48 7f 1c a9 	vmovdqu64 ZMMWORD PTR [rcx+r13*4],zmm3
    2fca:	49 83 c5 10          	add    r13,0x10
    2fce:	44 39 eb             	cmp    ebx,r13d
    2fd1:	7e 4d                	jle    3020 <sub_n+0x510>
    2fd3:	62 b1 7e 48 6f 14 a9 	vmovdqu32 zmm2,ZMMWORD PTR [rcx+r13*4]
    2fda:	62 91 6d 48 fa 9c aa 	vpsubd zmm3,zmm2,ZMMWORD PTR [r10+r13*4+0x4]
    2fe1:	04 00 00 00 
    2fe5:	44 89 e8             	mov    eax,r13d
    2fe8:	62 d3 65 48 1f 17 01 	vpcmpltd k2,zmm3,ZMMWORD PTR [r15]
    2fef:	c5 f8 98 d2          	kortestw k2,k2
    2ff3:	74 c3                	je     2fb8 <sub_n+0x4a8>
    2ff5:	62 d2 7d ca 7c e4    	vpbroadcastd zmm4{k2}{z},r12d
    2ffb:	89 c7                	mov    edi,eax
    2ffd:	62 91 fe 48 7f a4 aa 	vmovdqu64 ZMMWORD PTR [r10+r13*4+0x4],zmm4
    3004:	04 00 00 00 
    3008:	62 b1 fe 48 7f 1c a9 	vmovdqu64 ZMMWORD PTR [rcx+r13*4],zmm3
    300f:	49 83 c5 10          	add    r13,0x10
    3013:	44 39 eb             	cmp    ebx,r13d
    3016:	7f bb                	jg     2fd3 <sub_n+0x4c3>
    3018:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    301f:	00 
    3020:	0f ae e8             	lfence 
    3023:	0f 31                	rdtsc  
    3025:	48 c1 e2 20          	shl    rdx,0x20
    3029:	41 89 c3             	mov    r11d,eax
    302c:	4c 09 da             	or     rdx,r11
    302f:	48 89 95 78 fc ff ff 	mov    QWORD PTR [rbp-0x388],rdx
    3036:	0f ae e8             	lfence 
    3039:	0f 31                	rdtsc  
    303b:	41 89 d4             	mov    r12d,edx
    303e:	41 89 c5             	mov    r13d,eax
    3041:	49 c1 e4 20          	shl    r12,0x20
    3045:	4d 09 ec             	or     r12,r13
    3048:	83 ff ff             	cmp    edi,0xffffffff
    304b:	0f 85 cf 01 00 00    	jne    3220 <sub_n+0x710>
    3051:	8b 01                	mov    eax,DWORD PTR [rcx]
    3053:	85 c0                	test   eax,eax
    3055:	0f 85 bd 01 00 00    	jne    3218 <sub_n+0x708>
    305b:	4c 8d 69 04          	lea    r13,[rcx+0x4]
    305f:	31 d2                	xor    edx,edx
    3061:	41 8b 45 00          	mov    eax,DWORD PTR [r13+0x0]
    3065:	44 8d 52 01          	lea    r10d,[rdx+0x1]
    3069:	49 8d 7d 04          	lea    rdi,[r13+0x4]
    306d:	4c 89 e9             	mov    rcx,r13
    3070:	44 89 d2             	mov    edx,r10d
    3073:	85 c0                	test   eax,eax
    3075:	0f 85 8d 00 00 00    	jne    3108 <sub_n+0x5f8>
    307b:	41 8b 45 04          	mov    eax,DWORD PTR [r13+0x4]
    307f:	83 c2 01             	add    edx,0x1
    3082:	48 89 f9             	mov    rcx,rdi
    3085:	4d 8d 5d 08          	lea    r11,[r13+0x8]
    3089:	85 c0                	test   eax,eax
    308b:	75 7b                	jne    3108 <sub_n+0x5f8>
    308d:	41 8b 45 08          	mov    eax,DWORD PTR [r13+0x8]
    3091:	41 8d 52 02          	lea    edx,[r10+0x2]
    3095:	4c 89 d9             	mov    rcx,r11
    3098:	4d 8d 7d 0c          	lea    r15,[r13+0xc]
    309c:	85 c0                	test   eax,eax
    309e:	75 68                	jne    3108 <sub_n+0x5f8>
    30a0:	41 8b 45 0c          	mov    eax,DWORD PTR [r13+0xc]
    30a4:	41 8d 52 03          	lea    edx,[r10+0x3]
    30a8:	4c 89 f9             	mov    rcx,r15
    30ab:	49 8d 5d 10          	lea    rbx,[r13+0x10]
    30af:	85 c0                	test   eax,eax
    30b1:	75 55                	jne    3108 <sub_n+0x5f8>
    30b3:	41 8b 45 10          	mov    eax,DWORD PTR [r13+0x10]
    30b7:	41 8d 52 04          	lea    edx,[r10+0x4]
    30bb:	48 89 d9             	mov    rcx,rbx
    30be:	49 8d 7d 14          	lea    rdi,[r13+0x14]
    30c2:	85 c0                	test   eax,eax
    30c4:	75 42                	jne    3108 <sub_n+0x5f8>
    30c6:	41 8b 45 14          	mov    eax,DWORD PTR [r13+0x14]
    30ca:	41 8d 52 05          	lea    edx,[r10+0x5]
    30ce:	48 89 f9             	mov    rcx,rdi
    30d1:	4d 8d 5d 18          	lea    r11,[r13+0x18]
    30d5:	85 c0                	test   eax,eax
    30d7:	75 2f                	jne    3108 <sub_n+0x5f8>
    30d9:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
    30dd:	41 8d 52 06          	lea    edx,[r10+0x6]
    30e1:	4c 89 d9             	mov    rcx,r11
    30e4:	4d 8d 7d 1c          	lea    r15,[r13+0x1c]
    30e8:	85 c0                	test   eax,eax
    30ea:	75 1c                	jne    3108 <sub_n+0x5f8>
    30ec:	41 8b 45 1c          	mov    eax,DWORD PTR [r13+0x1c]
    30f0:	49 83 c5 20          	add    r13,0x20
    30f4:	41 8d 52 07          	lea    edx,[r10+0x7]
    30f8:	4c 89 f9             	mov    rcx,r15
    30fb:	85 c0                	test   eax,eax
    30fd:	0f 84 5e ff ff ff    	je     3061 <sub_n+0x551>
    3103:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    3108:	41 89 c5             	mov    r13d,eax
    310b:	4c 8b 95 70 fc ff ff 	mov    r10,QWORD PTR [rbp-0x390]
    3112:	41 f7 dd             	neg    r13d
    3115:	40 84 f6             	test   sil,sil
    3118:	48 8b b5 a8 fc ff ff 	mov    rsi,QWORD PTR [rbp-0x358]
    311f:	44 0f 44 e8          	cmove  r13d,eax
    3123:	44 89 29             	mov    DWORD PTR [rcx],r13d
    3126:	48 89 0e             	mov    QWORD PTR [rsi],rcx
    3129:	41 29 12             	sub    DWORD PTR [r10],edx
    312c:	0f ae e8             	lfence 
    312f:	0f 31                	rdtsc  
    3131:	4c 8d 2d 10 44 00 00 	lea    r13,[rip+0x4410]        # 7548 <_IO_stdin_used+0x548>
    3138:	4c 89 c9             	mov    rcx,r9
    313b:	89 d3                	mov    ebx,edx
    313d:	41 89 c7             	mov    r15d,eax
    3140:	48 8b bd b8 fc ff ff 	mov    rdi,QWORD PTR [rbp-0x348]
    3147:	4c 29 c1             	sub    rcx,r8
    314a:	4c 89 ea             	mov    rdx,r13
    314d:	31 c0                	xor    eax,eax
    314f:	be 01 00 00 00       	mov    esi,0x1
    3154:	c5 f8 77             	vzeroupper 
    3157:	e8 c4 f3 ff ff       	call   2520 <__fprintf_chk@plt>
    315c:	4c 89 ea             	mov    rdx,r13
    315f:	4c 89 f7             	mov    rdi,r14
    3162:	48 8b 8d 78 fc ff ff 	mov    rcx,QWORD PTR [rbp-0x388]
    3169:	be 01 00 00 00       	mov    esi,0x1
    316e:	31 c0                	xor    eax,eax
    3170:	48 c1 e3 20          	shl    rbx,0x20
    3174:	48 2b 8d 90 fc ff ff 	sub    rcx,QWORD PTR [rbp-0x370]
    317b:	4c 09 fb             	or     rbx,r15
    317e:	e8 9d f3 ff ff       	call   2520 <__fprintf_chk@plt>
    3183:	4c 89 ea             	mov    rdx,r13
    3186:	be 01 00 00 00       	mov    esi,0x1
    318b:	31 c0                	xor    eax,eax
    318d:	48 8b 8d 98 fc ff ff 	mov    rcx,QWORD PTR [rbp-0x368]
    3194:	48 2b 8d a0 fc ff ff 	sub    rcx,QWORD PTR [rbp-0x360]
    319b:	48 03 8d 88 fc ff ff 	add    rcx,QWORD PTR [rbp-0x378]
    31a2:	48 2b 8d 80 fc ff ff 	sub    rcx,QWORD PTR [rbp-0x380]
    31a9:	48 8b bd b0 fc ff ff 	mov    rdi,QWORD PTR [rbp-0x350]
    31b0:	4c 29 e1             	sub    rcx,r12
    31b3:	48 01 d9             	add    rcx,rbx
    31b6:	e8 65 f3 ff ff       	call   2520 <__fprintf_chk@plt>
    31bb:	48 8b bd b8 fc ff ff 	mov    rdi,QWORD PTR [rbp-0x348]
    31c2:	e8 c9 f1 ff ff       	call   2390 <fclose@plt>
    31c7:	4c 89 f7             	mov    rdi,r14
    31ca:	e8 c1 f1 ff ff       	call   2390 <fclose@plt>
    31cf:	48 8b bd b0 fc ff ff 	mov    rdi,QWORD PTR [rbp-0x350]
    31d6:	e8 b5 f1 ff ff       	call   2390 <fclose@plt>
    31db:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    31df:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    31e6:	00 00 
    31e8:	0f 85 d0 07 00 00    	jne    39be <sub_n+0xeae>
    31ee:	48 8d 65 d0          	lea    rsp,[rbp-0x30]
    31f2:	5b                   	pop    rbx
    31f3:	41 58                	pop    r8
    31f5:	41 5c                	pop    r12
    31f7:	41 5d                	pop    r13
    31f9:	41 5e                	pop    r14
    31fb:	41 5f                	pop    r15
    31fd:	5d                   	pop    rbp
    31fe:	49 8d 60 f8          	lea    rsp,[r8-0x8]
    3202:	c3                   	ret    
    3203:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    3208:	bf ff ff ff ff       	mov    edi,0xffffffff
    320d:	e9 0e fe ff ff       	jmp    3020 <sub_n+0x510>
    3212:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    3218:	31 d2                	xor    edx,edx
    321a:	e9 e9 fe ff ff       	jmp    3108 <sub_n+0x5f8>
    321f:	90                   	nop
    3220:	83 c7 0f             	add    edi,0xf
    3223:	39 fb                	cmp    ebx,edi
    3225:	7f 0b                	jg     3232 <sub_n+0x722>
    3227:	8d 7b ff             	lea    edi,[rbx-0x1]
    322a:	85 ff                	test   edi,edi
    322c:	0f 8e 1f fe ff ff    	jle    3051 <sub_n+0x541>
    3232:	48 63 c7             	movsxd rax,edi
    3235:	44 8d 5f ff          	lea    r11d,[rdi-0x1]
    3239:	41 8b 5c 82 04       	mov    ebx,DWORD PTR [r10+rax*4+0x4]
    323e:	41 83 e3 07          	and    r11d,0x7
    3242:	85 db                	test   ebx,ebx
    3244:	0f 85 3e 06 00 00    	jne    3888 <sub_n+0xd78>
    324a:	48 83 e8 01          	sub    rax,0x1
    324e:	85 c0                	test   eax,eax
    3250:	0f 8e fb fd ff ff    	jle    3051 <sub_n+0x541>
    3256:	45 85 db             	test   r11d,r11d
    3259:	0f 84 38 02 00 00    	je     3497 <sub_n+0x987>
    325f:	41 83 fb 01          	cmp    r11d,0x1
    3263:	0f 84 de 01 00 00    	je     3447 <sub_n+0x937>
    3269:	41 83 fb 02          	cmp    r11d,0x2
    326d:	0f 84 8c 01 00 00    	je     33ff <sub_n+0x8ef>
    3273:	41 83 fb 03          	cmp    r11d,0x3
    3277:	0f 84 3a 01 00 00    	je     33b7 <sub_n+0x8a7>
    327d:	41 83 fb 04          	cmp    r11d,0x4
    3281:	0f 84 e8 00 00 00    	je     336f <sub_n+0x85f>
    3287:	41 83 fb 05          	cmp    r11d,0x5
    328b:	0f 84 96 00 00 00    	je     3327 <sub_n+0x817>
    3291:	41 83 fb 06          	cmp    r11d,0x6
    3295:	74 48                	je     32df <sub_n+0x7cf>
    3297:	41 8b 7c 82 04       	mov    edi,DWORD PTR [r10+rax*4+0x4]
    329c:	85 ff                	test   edi,edi
    329e:	74 3b                	je     32db <sub_n+0x7cb>
    32a0:	44 8b 1c 81          	mov    r11d,DWORD PTR [rcx+rax*4]
    32a4:	41 81 fb 00 ca 9a 3b 	cmp    r11d,0x3b9aca00
    32ab:	76 2e                	jbe    32db <sub_n+0x7cb>
    32ad:	8b 5c 81 fc          	mov    ebx,DWORD PTR [rcx+rax*4-0x4]
    32b1:	41 81 c3 00 ca 9a 3b 	add    r11d,0x3b9aca00
    32b8:	44 89 1c 81          	mov    DWORD PTR [rcx+rax*4],r11d
    32bc:	44 8d 7b ff          	lea    r15d,[rbx-0x1]
    32c0:	44 89 7c 81 fc       	mov    DWORD PTR [rcx+rax*4-0x4],r15d
    32c5:	41 81 ff 00 ca 9a 3b 	cmp    r15d,0x3b9aca00
    32cc:	0f 87 df 06 00 00    	ja     39b1 <sub_n+0xea1>
    32d2:	41 c7 44 82 04 00 00 	mov    DWORD PTR [r10+rax*4+0x4],0x0
    32d9:	00 00 
    32db:	48 83 e8 01          	sub    rax,0x1
    32df:	41 8b 54 82 04       	mov    edx,DWORD PTR [r10+rax*4+0x4]
    32e4:	85 d2                	test   edx,edx
    32e6:	74 3b                	je     3323 <sub_n+0x813>
    32e8:	44 8b 2c 81          	mov    r13d,DWORD PTR [rcx+rax*4]
    32ec:	41 81 fd 00 ca 9a 3b 	cmp    r13d,0x3b9aca00
    32f3:	76 2e                	jbe    3323 <sub_n+0x813>
    32f5:	8b 7c 81 fc          	mov    edi,DWORD PTR [rcx+rax*4-0x4]
    32f9:	41 81 c5 00 ca 9a 3b 	add    r13d,0x3b9aca00
    3300:	44 89 2c 81          	mov    DWORD PTR [rcx+rax*4],r13d
    3304:	44 8d 5f ff          	lea    r11d,[rdi-0x1]
    3308:	44 89 5c 81 fc       	mov    DWORD PTR [rcx+rax*4-0x4],r11d
    330d:	41 81 fb 00 ca 9a 3b 	cmp    r11d,0x3b9aca00
    3314:	0f 87 63 06 00 00    	ja     397d <sub_n+0xe6d>
    331a:	41 c7 44 82 04 00 00 	mov    DWORD PTR [r10+rax*4+0x4],0x0
    3321:	00 00 
    3323:	48 83 e8 01          	sub    rax,0x1
    3327:	41 8b 5c 82 04       	mov    ebx,DWORD PTR [r10+rax*4+0x4]
    332c:	85 db                	test   ebx,ebx
    332e:	74 3b                	je     336b <sub_n+0x85b>
    3330:	44 8b 3c 81          	mov    r15d,DWORD PTR [rcx+rax*4]
    3334:	41 81 ff 00 ca 9a 3b 	cmp    r15d,0x3b9aca00
    333b:	76 2e                	jbe    336b <sub_n+0x85b>
    333d:	8b 54 81 fc          	mov    edx,DWORD PTR [rcx+rax*4-0x4]
    3341:	41 81 c7 00 ca 9a 3b 	add    r15d,0x3b9aca00
    3348:	44 89 3c 81          	mov    DWORD PTR [rcx+rax*4],r15d
    334c:	44 8d 6a ff          	lea    r13d,[rdx-0x1]
    3350:	44 89 6c 81 fc       	mov    DWORD PTR [rcx+rax*4-0x4],r13d
    3355:	41 81 fd 00 ca 9a 3b 	cmp    r13d,0x3b9aca00
    335c:	0f 87 28 06 00 00    	ja     398a <sub_n+0xe7a>
    3362:	41 c7 44 82 04 00 00 	mov    DWORD PTR [r10+rax*4+0x4],0x0
    3369:	00 00 
    336b:	48 83 e8 01          	sub    rax,0x1
    336f:	41 8b 7c 82 04       	mov    edi,DWORD PTR [r10+rax*4+0x4]
    3374:	85 ff                	test   edi,edi
    3376:	74 3b                	je     33b3 <sub_n+0x8a3>
    3378:	44 8b 1c 81          	mov    r11d,DWORD PTR [rcx+rax*4]
    337c:	41 81 fb 00 ca 9a 3b 	cmp    r11d,0x3b9aca00
    3383:	76 2e                	jbe    33b3 <sub_n+0x8a3>
    3385:	8b 5c 81 fc          	mov    ebx,DWORD PTR [rcx+rax*4-0x4]
    3389:	41 81 c3 00 ca 9a 3b 	add    r11d,0x3b9aca00
    3390:	44 89 1c 81          	mov    DWORD PTR [rcx+rax*4],r11d
    3394:	44 8d 7b ff          	lea    r15d,[rbx-0x1]
    3398:	44 89 7c 81 fc       	mov    DWORD PTR [rcx+rax*4-0x4],r15d
    339d:	41 81 ff 00 ca 9a 3b 	cmp    r15d,0x3b9aca00
    33a4:	0f 87 ed 05 00 00    	ja     3997 <sub_n+0xe87>
    33aa:	41 c7 44 82 04 00 00 	mov    DWORD PTR [r10+rax*4+0x4],0x0
    33b1:	00 00 
    33b3:	48 83 e8 01          	sub    rax,0x1
    33b7:	41 8b 54 82 04       	mov    edx,DWORD PTR [r10+rax*4+0x4]
    33bc:	85 d2                	test   edx,edx
    33be:	74 3b                	je     33fb <sub_n+0x8eb>
    33c0:	44 8b 2c 81          	mov    r13d,DWORD PTR [rcx+rax*4]
    33c4:	41 81 fd 00 ca 9a 3b 	cmp    r13d,0x3b9aca00
    33cb:	76 2e                	jbe    33fb <sub_n+0x8eb>
    33cd:	8b 7c 81 fc          	mov    edi,DWORD PTR [rcx+rax*4-0x4]
    33d1:	41 81 c5 00 ca 9a 3b 	add    r13d,0x3b9aca00
    33d8:	44 89 2c 81          	mov    DWORD PTR [rcx+rax*4],r13d
    33dc:	44 8d 5f ff          	lea    r11d,[rdi-0x1]
    33e0:	44 89 5c 81 fc       	mov    DWORD PTR [rcx+rax*4-0x4],r11d
    33e5:	41 81 fb 00 ca 9a 3b 	cmp    r11d,0x3b9aca00
    33ec:	0f 87 b2 05 00 00    	ja     39a4 <sub_n+0xe94>
    33f2:	41 c7 44 82 04 00 00 	mov    DWORD PTR [r10+rax*4+0x4],0x0
    33f9:	00 00 
    33fb:	48 83 e8 01          	sub    rax,0x1
    33ff:	41 8b 5c 82 04       	mov    ebx,DWORD PTR [r10+rax*4+0x4]
    3404:	85 db                	test   ebx,ebx
    3406:	74 3b                	je     3443 <sub_n+0x933>
    3408:	44 8b 3c 81          	mov    r15d,DWORD PTR [rcx+rax*4]
    340c:	41 81 ff 00 ca 9a 3b 	cmp    r15d,0x3b9aca00
    3413:	76 2e                	jbe    3443 <sub_n+0x933>
    3415:	8b 54 81 fc          	mov    edx,DWORD PTR [rcx+rax*4-0x4]
    3419:	41 81 c7 00 ca 9a 3b 	add    r15d,0x3b9aca00
    3420:	44 89 3c 81          	mov    DWORD PTR [rcx+rax*4],r15d
    3424:	44 8d 6a ff          	lea    r13d,[rdx-0x1]
    3428:	44 89 6c 81 fc       	mov    DWORD PTR [rcx+rax*4-0x4],r13d
    342d:	41 81 fd 00 ca 9a 3b 	cmp    r13d,0x3b9aca00
    3434:	0f 87 a1 04 00 00    	ja     38db <sub_n+0xdcb>
    343a:	41 c7 44 82 04 00 00 	mov    DWORD PTR [r10+rax*4+0x4],0x0
    3441:	00 00 
    3443:	48 83 e8 01          	sub    rax,0x1
    3447:	41 8b 7c 82 04       	mov    edi,DWORD PTR [r10+rax*4+0x4]
    344c:	85 ff                	test   edi,edi
    344e:	74 3b                	je     348b <sub_n+0x97b>
    3450:	44 8b 1c 81          	mov    r11d,DWORD PTR [rcx+rax*4]
    3454:	41 81 fb 00 ca 9a 3b 	cmp    r11d,0x3b9aca00
    345b:	76 2e                	jbe    348b <sub_n+0x97b>
    345d:	8b 5c 81 fc          	mov    ebx,DWORD PTR [rcx+rax*4-0x4]
    3461:	41 81 c3 00 ca 9a 3b 	add    r11d,0x3b9aca00
    3468:	44 89 1c 81          	mov    DWORD PTR [rcx+rax*4],r11d
    346c:	44 8d 7b ff          	lea    r15d,[rbx-0x1]
    3470:	44 89 7c 81 fc       	mov    DWORD PTR [rcx+rax*4-0x4],r15d
    3475:	41 81 ff 00 ca 9a 3b 	cmp    r15d,0x3b9aca00
    347c:	0f 87 8a 04 00 00    	ja     390c <sub_n+0xdfc>
    3482:	41 c7 44 82 04 00 00 	mov    DWORD PTR [r10+rax*4+0x4],0x0
    3489:	00 00 
    348b:	48 83 e8 01          	sub    rax,0x1
    348f:	85 c0                	test   eax,eax
    3491:	0f 8e ba fb ff ff    	jle    3051 <sub_n+0x541>
    3497:	41 8b 54 82 04       	mov    edx,DWORD PTR [r10+rax*4+0x4]
    349c:	85 d2                	test   edx,edx
    349e:	74 3b                	je     34db <sub_n+0x9cb>
    34a0:	44 8b 2c 81          	mov    r13d,DWORD PTR [rcx+rax*4]
    34a4:	41 81 fd 00 ca 9a 3b 	cmp    r13d,0x3b9aca00
    34ab:	76 2e                	jbe    34db <sub_n+0x9cb>
    34ad:	8b 7c 81 fc          	mov    edi,DWORD PTR [rcx+rax*4-0x4]
    34b1:	41 81 c5 00 ca 9a 3b 	add    r13d,0x3b9aca00
    34b8:	44 89 2c 81          	mov    DWORD PTR [rcx+rax*4],r13d
    34bc:	44 8d 5f ff          	lea    r11d,[rdi-0x1]
    34c0:	44 89 5c 81 fc       	mov    DWORD PTR [rcx+rax*4-0x4],r11d
    34c5:	41 81 fb 00 ca 9a 3b 	cmp    r11d,0x3b9aca00
    34cc:	0f 87 7b 04 00 00    	ja     394d <sub_n+0xe3d>
    34d2:	41 c7 44 82 04 00 00 	mov    DWORD PTR [r10+rax*4+0x4],0x0
    34d9:	00 00 
    34db:	48 8d 50 ff          	lea    rdx,[rax-0x1]
    34df:	41 8b 04 82          	mov    eax,DWORD PTR [r10+rax*4]
    34e3:	85 c0                	test   eax,eax
    34e5:	74 38                	je     351f <sub_n+0xa0f>
    34e7:	8b 1c 91             	mov    ebx,DWORD PTR [rcx+rdx*4]
    34ea:	81 fb 00 ca 9a 3b    	cmp    ebx,0x3b9aca00
    34f0:	76 2d                	jbe    351f <sub_n+0xa0f>
    34f2:	44 8b 7c 91 fc       	mov    r15d,DWORD PTR [rcx+rdx*4-0x4]
    34f7:	81 c3 00 ca 9a 3b    	add    ebx,0x3b9aca00
    34fd:	89 1c 91             	mov    DWORD PTR [rcx+rdx*4],ebx
    3500:	41 83 ef 01          	sub    r15d,0x1
    3504:	44 89 7c 91 fc       	mov    DWORD PTR [rcx+rdx*4-0x4],r15d
    3509:	41 81 ff 00 ca 9a 3b 	cmp    r15d,0x3b9aca00
    3510:	0f 87 dc 03 00 00    	ja     38f2 <sub_n+0xde2>
    3516:	41 c7 44 92 04 00 00 	mov    DWORD PTR [r10+rdx*4+0x4],0x0
    351d:	00 00 
    351f:	41 8b 3c 92          	mov    edi,DWORD PTR [r10+rdx*4]
    3523:	4c 8d 6a ff          	lea    r13,[rdx-0x1]
    3527:	85 ff                	test   edi,edi
    3529:	74 3a                	je     3565 <sub_n+0xa55>
    352b:	46 8b 1c a9          	mov    r11d,DWORD PTR [rcx+r13*4]
    352f:	41 81 fb 00 ca 9a 3b 	cmp    r11d,0x3b9aca00
    3536:	76 2d                	jbe    3565 <sub_n+0xa55>
    3538:	42 8b 44 a9 fc       	mov    eax,DWORD PTR [rcx+r13*4-0x4]
    353d:	41 81 c3 00 ca 9a 3b 	add    r11d,0x3b9aca00
    3544:	46 89 1c a9          	mov    DWORD PTR [rcx+r13*4],r11d
    3548:	8d 58 ff             	lea    ebx,[rax-0x1]
    354b:	42 89 5c a9 fc       	mov    DWORD PTR [rcx+r13*4-0x4],ebx
    3550:	81 fb 00 ca 9a 3b    	cmp    ebx,0x3b9aca00
    3556:	0f 87 a3 03 00 00    	ja     38ff <sub_n+0xdef>
    355c:	43 c7 44 aa 04 00 00 	mov    DWORD PTR [r10+r13*4+0x4],0x0
    3563:	00 00 
    3565:	45 8b 7c 92 fc       	mov    r15d,DWORD PTR [r10+rdx*4-0x4]
    356a:	4c 8d 6a fe          	lea    r13,[rdx-0x2]
    356e:	45 85 ff             	test   r15d,r15d
    3571:	74 38                	je     35ab <sub_n+0xa9b>
    3573:	42 8b 3c a9          	mov    edi,DWORD PTR [rcx+r13*4]
    3577:	81 ff 00 ca 9a 3b    	cmp    edi,0x3b9aca00
    357d:	76 2c                	jbe    35ab <sub_n+0xa9b>
    357f:	46 8b 5c a9 fc       	mov    r11d,DWORD PTR [rcx+r13*4-0x4]
    3584:	81 c7 00 ca 9a 3b    	add    edi,0x3b9aca00
    358a:	42 89 3c a9          	mov    DWORD PTR [rcx+r13*4],edi
    358e:	41 8d 43 ff          	lea    eax,[r11-0x1]
    3592:	42 89 44 a9 fc       	mov    DWORD PTR [rcx+r13*4-0x4],eax
    3597:	3d 00 ca 9a 3b       	cmp    eax,0x3b9aca00
    359c:	0f 87 9e 03 00 00    	ja     3940 <sub_n+0xe30>
    35a2:	43 c7 44 aa 04 00 00 	mov    DWORD PTR [r10+r13*4+0x4],0x0
    35a9:	00 00 
    35ab:	41 8b 5c 92 f8       	mov    ebx,DWORD PTR [r10+rdx*4-0x8]
    35b0:	4c 8d 7a fd          	lea    r15,[rdx-0x3]
    35b4:	85 db                	test   ebx,ebx
    35b6:	74 3c                	je     35f4 <sub_n+0xae4>
    35b8:	46 8b 2c b9          	mov    r13d,DWORD PTR [rcx+r15*4]
    35bc:	41 81 fd 00 ca 9a 3b 	cmp    r13d,0x3b9aca00
    35c3:	76 2f                	jbe    35f4 <sub_n+0xae4>
    35c5:	42 8b 7c b9 fc       	mov    edi,DWORD PTR [rcx+r15*4-0x4]
    35ca:	41 81 c5 00 ca 9a 3b 	add    r13d,0x3b9aca00
    35d1:	46 89 2c b9          	mov    DWORD PTR [rcx+r15*4],r13d
    35d5:	44 8d 5f ff          	lea    r11d,[rdi-0x1]
    35d9:	46 89 5c b9 fc       	mov    DWORD PTR [rcx+r15*4-0x4],r11d
    35de:	41 81 fb 00 ca 9a 3b 	cmp    r11d,0x3b9aca00
    35e5:	0f 87 6f 03 00 00    	ja     395a <sub_n+0xe4a>
    35eb:	43 c7 44 ba 04 00 00 	mov    DWORD PTR [r10+r15*4+0x4],0x0
    35f2:	00 00 
    35f4:	45 8b 7c 92 f4       	mov    r15d,DWORD PTR [r10+rdx*4-0xc]
    35f9:	48 8d 42 fc          	lea    rax,[rdx-0x4]
    35fd:	45 85 ff             	test   r15d,r15d
    3600:	74 36                	je     3638 <sub_n+0xb28>
    3602:	8b 1c 81             	mov    ebx,DWORD PTR [rcx+rax*4]
    3605:	81 fb 00 ca 9a 3b    	cmp    ebx,0x3b9aca00
    360b:	76 2b                	jbe    3638 <sub_n+0xb28>
    360d:	44 8b 6c 81 fc       	mov    r13d,DWORD PTR [rcx+rax*4-0x4]
    3612:	81 c3 00 ca 9a 3b    	add    ebx,0x3b9aca00
    3618:	89 1c 81             	mov    DWORD PTR [rcx+rax*4],ebx
    361b:	41 8d 7d ff          	lea    edi,[r13-0x1]
    361f:	89 7c 81 fc          	mov    DWORD PTR [rcx+rax*4-0x4],edi
    3623:	81 ff 00 ca 9a 3b    	cmp    edi,0x3b9aca00
    3629:	0f 87 f7 02 00 00    	ja     3926 <sub_n+0xe16>
    362f:	41 c7 44 82 04 00 00 	mov    DWORD PTR [r10+rax*4+0x4],0x0
    3636:	00 00 
    3638:	45 8b 5c 92 f0       	mov    r11d,DWORD PTR [r10+rdx*4-0x10]
    363d:	48 8d 42 fb          	lea    rax,[rdx-0x5]
    3641:	45 85 db             	test   r11d,r11d
    3644:	74 3b                	je     3681 <sub_n+0xb71>
    3646:	44 8b 3c 81          	mov    r15d,DWORD PTR [rcx+rax*4]
    364a:	41 81 ff 00 ca 9a 3b 	cmp    r15d,0x3b9aca00
    3651:	76 2e                	jbe    3681 <sub_n+0xb71>
    3653:	8b 5c 81 fc          	mov    ebx,DWORD PTR [rcx+rax*4-0x4]
    3657:	41 81 c7 00 ca 9a 3b 	add    r15d,0x3b9aca00
    365e:	44 89 3c 81          	mov    DWORD PTR [rcx+rax*4],r15d
    3662:	44 8d 6b ff          	lea    r13d,[rbx-0x1]
    3666:	44 89 6c 81 fc       	mov    DWORD PTR [rcx+rax*4-0x4],r13d
    366b:	41 81 fd 00 ca 9a 3b 	cmp    r13d,0x3b9aca00
    3672:	0f 87 bb 02 00 00    	ja     3933 <sub_n+0xe23>
    3678:	41 c7 44 82 04 00 00 	mov    DWORD PTR [r10+rax*4+0x4],0x0
    367f:	00 00 
    3681:	41 8b 7c 92 ec       	mov    edi,DWORD PTR [r10+rdx*4-0x14]
    3686:	48 8d 42 fa          	lea    rax,[rdx-0x6]
    368a:	85 ff                	test   edi,edi
    368c:	74 3a                	je     36c8 <sub_n+0xbb8>
    368e:	44 8b 1c 81          	mov    r11d,DWORD PTR [rcx+rax*4]
    3692:	41 81 fb 00 ca 9a 3b 	cmp    r11d,0x3b9aca00
    3699:	76 2d                	jbe    36c8 <sub_n+0xbb8>
    369b:	44 8b 7c 81 fc       	mov    r15d,DWORD PTR [rcx+rax*4-0x4]
    36a0:	41 81 c3 00 ca 9a 3b 	add    r11d,0x3b9aca00
    36a7:	44 89 1c 81          	mov    DWORD PTR [rcx+rax*4],r11d
    36ab:	41 8d 5f ff          	lea    ebx,[r15-0x1]
    36af:	89 5c 81 fc          	mov    DWORD PTR [rcx+rax*4-0x4],ebx
    36b3:	81 fb 00 ca 9a 3b    	cmp    ebx,0x3b9aca00
    36b9:	0f 87 5a 02 00 00    	ja     3919 <sub_n+0xe09>
    36bf:	41 c7 44 82 04 00 00 	mov    DWORD PTR [r10+rax*4+0x4],0x0
    36c6:	00 00 
    36c8:	48 8d 42 f9          	lea    rax,[rdx-0x7]
    36cc:	85 c0                	test   eax,eax
    36ce:	0f 8f c3 fd ff ff    	jg     3497 <sub_n+0x987>
    36d4:	e9 78 f9 ff ff       	jmp    3051 <sub_n+0x541>
    36d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    36e0:	45 85 db             	test   r11d,r11d
    36e3:	0f 84 e3 00 00 00    	je     37cc <sub_n+0xcbc>
    36e9:	41 83 fb 01          	cmp    r11d,0x1
    36ed:	0f 84 b8 00 00 00    	je     37ab <sub_n+0xc9b>
    36f3:	41 83 fb 02          	cmp    r11d,0x2
    36f7:	0f 84 95 00 00 00    	je     3792 <sub_n+0xc82>
    36fd:	41 83 fb 03          	cmp    r11d,0x3
    3701:	74 76                	je     3779 <sub_n+0xc69>
    3703:	41 83 fb 04          	cmp    r11d,0x4
    3707:	74 57                	je     3760 <sub_n+0xc50>
    3709:	41 83 fb 05          	cmp    r11d,0x5
    370d:	74 38                	je     3747 <sub_n+0xc37>
    370f:	41 83 fb 06          	cmp    r11d,0x6
    3713:	74 19                	je     372e <sub_n+0xc1e>
    3715:	41 8b 7c 95 00       	mov    edi,DWORD PTR [r13+rdx*4+0x0]
    371a:	41 39 3c 94          	cmp    DWORD PTR [r12+rdx*4],edi
    371e:	0f 82 a4 01 00 00    	jb     38c8 <sub_n+0xdb8>
    3724:	0f 87 96 f5 ff ff    	ja     2cc0 <sub_n+0x1b0>
    372a:	48 83 c2 01          	add    rdx,0x1
    372e:	45 8b 44 95 00       	mov    r8d,DWORD PTR [r13+rdx*4+0x0]
    3733:	45 39 04 94          	cmp    DWORD PTR [r12+rdx*4],r8d
    3737:	0f 82 8b 01 00 00    	jb     38c8 <sub_n+0xdb8>
    373d:	0f 87 7d f5 ff ff    	ja     2cc0 <sub_n+0x1b0>
    3743:	48 83 c2 01          	add    rdx,0x1
    3747:	41 8b 44 95 00       	mov    eax,DWORD PTR [r13+rdx*4+0x0]
    374c:	41 39 04 94          	cmp    DWORD PTR [r12+rdx*4],eax
    3750:	0f 82 72 01 00 00    	jb     38c8 <sub_n+0xdb8>
    3756:	0f 87 64 f5 ff ff    	ja     2cc0 <sub_n+0x1b0>
    375c:	48 83 c2 01          	add    rdx,0x1
    3760:	45 8b 4c 95 00       	mov    r9d,DWORD PTR [r13+rdx*4+0x0]
    3765:	45 39 0c 94          	cmp    DWORD PTR [r12+rdx*4],r9d
    3769:	0f 82 59 01 00 00    	jb     38c8 <sub_n+0xdb8>
    376f:	0f 87 4b f5 ff ff    	ja     2cc0 <sub_n+0x1b0>
    3775:	48 83 c2 01          	add    rdx,0x1
    3779:	45 8b 54 95 00       	mov    r10d,DWORD PTR [r13+rdx*4+0x0]
    377e:	45 39 14 94          	cmp    DWORD PTR [r12+rdx*4],r10d
    3782:	0f 82 40 01 00 00    	jb     38c8 <sub_n+0xdb8>
    3788:	0f 87 32 f5 ff ff    	ja     2cc0 <sub_n+0x1b0>
    378e:	48 83 c2 01          	add    rdx,0x1
    3792:	45 8b 5c 95 00       	mov    r11d,DWORD PTR [r13+rdx*4+0x0]
    3797:	45 39 1c 94          	cmp    DWORD PTR [r12+rdx*4],r11d
    379b:	0f 82 27 01 00 00    	jb     38c8 <sub_n+0xdb8>
    37a1:	0f 87 19 f5 ff ff    	ja     2cc0 <sub_n+0x1b0>
    37a7:	48 83 c2 01          	add    rdx,0x1
    37ab:	45 8b 7c 95 00       	mov    r15d,DWORD PTR [r13+rdx*4+0x0]
    37b0:	45 39 3c 94          	cmp    DWORD PTR [r12+rdx*4],r15d
    37b4:	0f 82 0e 01 00 00    	jb     38c8 <sub_n+0xdb8>
    37ba:	0f 87 00 f5 ff ff    	ja     2cc0 <sub_n+0x1b0>
    37c0:	48 83 c2 01          	add    rdx,0x1
    37c4:	39 d3                	cmp    ebx,edx
    37c6:	0f 86 f4 f4 ff ff    	jbe    2cc0 <sub_n+0x1b0>
    37cc:	41 8b 7c 95 00       	mov    edi,DWORD PTR [r13+rdx*4+0x0]
    37d1:	41 39 3c 94          	cmp    DWORD PTR [r12+rdx*4],edi
    37d5:	0f 82 ed 00 00 00    	jb     38c8 <sub_n+0xdb8>
    37db:	0f 87 df f4 ff ff    	ja     2cc0 <sub_n+0x1b0>
    37e1:	41 8b 44 95 04       	mov    eax,DWORD PTR [r13+rdx*4+0x4]
    37e6:	4c 8d 42 01          	lea    r8,[rdx+0x1]
    37ea:	41 39 44 94 04       	cmp    DWORD PTR [r12+rdx*4+0x4],eax
    37ef:	0f 82 d3 00 00 00    	jb     38c8 <sub_n+0xdb8>
    37f5:	0f 87 c5 f4 ff ff    	ja     2cc0 <sub_n+0x1b0>
    37fb:	45 8b 4c 95 08       	mov    r9d,DWORD PTR [r13+rdx*4+0x8]
    3800:	45 39 4c 94 08       	cmp    DWORD PTR [r12+rdx*4+0x8],r9d
    3805:	0f 82 bd 00 00 00    	jb     38c8 <sub_n+0xdb8>
    380b:	0f 87 af f4 ff ff    	ja     2cc0 <sub_n+0x1b0>
    3811:	45 8b 54 95 0c       	mov    r10d,DWORD PTR [r13+rdx*4+0xc]
    3816:	45 39 54 94 0c       	cmp    DWORD PTR [r12+rdx*4+0xc],r10d
    381b:	0f 82 a7 00 00 00    	jb     38c8 <sub_n+0xdb8>
    3821:	0f 87 99 f4 ff ff    	ja     2cc0 <sub_n+0x1b0>
    3827:	45 8b 5c 95 10       	mov    r11d,DWORD PTR [r13+rdx*4+0x10]
    382c:	45 39 5c 94 10       	cmp    DWORD PTR [r12+rdx*4+0x10],r11d
    3831:	0f 82 91 00 00 00    	jb     38c8 <sub_n+0xdb8>
    3837:	0f 87 83 f4 ff ff    	ja     2cc0 <sub_n+0x1b0>
    383d:	43 8b 54 85 10       	mov    edx,DWORD PTR [r13+r8*4+0x10]
    3842:	43 39 54 84 10       	cmp    DWORD PTR [r12+r8*4+0x10],edx
    3847:	72 7f                	jb     38c8 <sub_n+0xdb8>
    3849:	0f 87 71 f4 ff ff    	ja     2cc0 <sub_n+0x1b0>
    384f:	47 8b 7c 85 14       	mov    r15d,DWORD PTR [r13+r8*4+0x14]
    3854:	47 39 7c 84 14       	cmp    DWORD PTR [r12+r8*4+0x14],r15d
    3859:	72 6d                	jb     38c8 <sub_n+0xdb8>
    385b:	0f 87 5f f4 ff ff    	ja     2cc0 <sub_n+0x1b0>
    3861:	43 8b 7c 85 18       	mov    edi,DWORD PTR [r13+r8*4+0x18]
    3866:	43 39 7c 84 18       	cmp    DWORD PTR [r12+r8*4+0x18],edi
    386b:	72 5b                	jb     38c8 <sub_n+0xdb8>
    386d:	0f 87 4d f4 ff ff    	ja     2cc0 <sub_n+0x1b0>
    3873:	49 8d 50 07          	lea    rdx,[r8+0x7]
    3877:	39 d3                	cmp    ebx,edx
    3879:	0f 86 41 f4 ff ff    	jbe    2cc0 <sub_n+0x1b0>
    387f:	e9 48 ff ff ff       	jmp    37cc <sub_n+0xcbc>
    3884:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    3888:	44 8b 3c 81          	mov    r15d,DWORD PTR [rcx+rax*4]
    388c:	41 81 ff 00 ca 9a 3b 	cmp    r15d,0x3b9aca00
    3893:	0f 86 b1 f9 ff ff    	jbe    324a <sub_n+0x73a>
    3899:	8b 54 81 fc          	mov    edx,DWORD PTR [rcx+rax*4-0x4]
    389d:	41 81 c7 00 ca 9a 3b 	add    r15d,0x3b9aca00
    38a4:	44 89 3c 81          	mov    DWORD PTR [rcx+rax*4],r15d
    38a8:	44 8d 6a ff          	lea    r13d,[rdx-0x1]
    38ac:	44 89 6c 81 fc       	mov    DWORD PTR [rcx+rax*4-0x4],r13d
    38b1:	41 81 fd 00 ca 9a 3b 	cmp    r13d,0x3b9aca00
    38b8:	77 2e                	ja     38e8 <sub_n+0xdd8>
    38ba:	41 c7 44 82 04 00 00 	mov    DWORD PTR [r10+rax*4+0x4],0x0
    38c1:	00 00 
    38c3:	e9 82 f9 ff ff       	jmp    324a <sub_n+0x73a>
    38c8:	4c 89 e6             	mov    rsi,r12
    38cb:	4d 89 ec             	mov    r12,r13
    38ce:	49 89 f5             	mov    r13,rsi
    38d1:	be 01 00 00 00       	mov    esi,0x1
    38d6:	e9 e5 f3 ff ff       	jmp    2cc0 <sub_n+0x1b0>
    38db:	41 c7 04 82 01 00 00 	mov    DWORD PTR [r10+rax*4],0x1
    38e2:	00 
    38e3:	e9 52 fb ff ff       	jmp    343a <sub_n+0x92a>
    38e8:	41 c7 04 82 01 00 00 	mov    DWORD PTR [r10+rax*4],0x1
    38ef:	00 
    38f0:	eb c8                	jmp    38ba <sub_n+0xdaa>
    38f2:	41 c7 04 92 01 00 00 	mov    DWORD PTR [r10+rdx*4],0x1
    38f9:	00 
    38fa:	e9 17 fc ff ff       	jmp    3516 <sub_n+0xa06>
    38ff:	43 c7 04 aa 01 00 00 	mov    DWORD PTR [r10+r13*4],0x1
    3906:	00 
    3907:	e9 50 fc ff ff       	jmp    355c <sub_n+0xa4c>
    390c:	41 c7 04 82 01 00 00 	mov    DWORD PTR [r10+rax*4],0x1
    3913:	00 
    3914:	e9 69 fb ff ff       	jmp    3482 <sub_n+0x972>
    3919:	41 c7 04 82 01 00 00 	mov    DWORD PTR [r10+rax*4],0x1
    3920:	00 
    3921:	e9 99 fd ff ff       	jmp    36bf <sub_n+0xbaf>
    3926:	41 c7 04 82 01 00 00 	mov    DWORD PTR [r10+rax*4],0x1
    392d:	00 
    392e:	e9 fc fc ff ff       	jmp    362f <sub_n+0xb1f>
    3933:	41 c7 04 82 01 00 00 	mov    DWORD PTR [r10+rax*4],0x1
    393a:	00 
    393b:	e9 38 fd ff ff       	jmp    3678 <sub_n+0xb68>
    3940:	43 c7 04 aa 01 00 00 	mov    DWORD PTR [r10+r13*4],0x1
    3947:	00 
    3948:	e9 55 fc ff ff       	jmp    35a2 <sub_n+0xa92>
    394d:	41 c7 04 82 01 00 00 	mov    DWORD PTR [r10+rax*4],0x1
    3954:	00 
    3955:	e9 78 fb ff ff       	jmp    34d2 <sub_n+0x9c2>
    395a:	43 c7 04 ba 01 00 00 	mov    DWORD PTR [r10+r15*4],0x1
    3961:	00 
    3962:	e9 84 fc ff ff       	jmp    35eb <sub_n+0xadb>
    3967:	48 8d 3d 9a 36 00 00 	lea    rdi,[rip+0x369a]        # 7008 <_IO_stdin_used+0x8>
    396e:	e8 6d eb ff ff       	call   24e0 <perror@plt>
    3973:	bf 01 00 00 00       	mov    edi,0x1
    3978:	e8 83 eb ff ff       	call   2500 <exit@plt>
    397d:	41 c7 04 82 01 00 00 	mov    DWORD PTR [r10+rax*4],0x1
    3984:	00 
    3985:	e9 90 f9 ff ff       	jmp    331a <sub_n+0x80a>
    398a:	41 c7 04 82 01 00 00 	mov    DWORD PTR [r10+rax*4],0x1
    3991:	00 
    3992:	e9 cb f9 ff ff       	jmp    3362 <sub_n+0x852>
    3997:	41 c7 04 82 01 00 00 	mov    DWORD PTR [r10+rax*4],0x1
    399e:	00 
    399f:	e9 06 fa ff ff       	jmp    33aa <sub_n+0x89a>
    39a4:	41 c7 04 82 01 00 00 	mov    DWORD PTR [r10+rax*4],0x1
    39ab:	00 
    39ac:	e9 41 fa ff ff       	jmp    33f2 <sub_n+0x8e2>
    39b1:	41 c7 04 82 01 00 00 	mov    DWORD PTR [r10+rax*4],0x1
    39b8:	00 
    39b9:	e9 14 f9 ff ff       	jmp    32d2 <sub_n+0x7c2>
    39be:	e8 fd e9 ff ff       	call   23c0 <__stack_chk_fail@plt>
    39c3:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    39ca:	00 00 00 00 
    39ce:	66 90                	xchg   ax,ax

00000000000039d0 <returnLimbs>:
    39d0:	f3 0f 1e fa          	endbr64 
    39d4:	41 56                	push   r14
    39d6:	41 55                	push   r13
    39d8:	41 54                	push   r12
    39da:	49 89 fc             	mov    r12,rdi
    39dd:	55                   	push   rbp
    39de:	48 89 f5             	mov    rbp,rsi
    39e1:	53                   	push   rbx
    39e2:	48 83 ec 10          	sub    rsp,0x10
    39e6:	48 63 1e             	movsxd rbx,DWORD PTR [rsi]
    39e9:	be 40 00 00 00       	mov    esi,0x40
    39ee:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    39f5:	00 00 
    39f7:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
    39fc:	31 c0                	xor    eax,eax
    39fe:	48 89 e7             	mov    rdi,rsp
    3a01:	49 89 dd             	mov    r13,rbx
    3a04:	48 69 db 39 8e e3 38 	imul   rbx,rbx,0x38e38e39
    3a0b:	44 89 e8             	mov    eax,r13d
    3a0e:	44 89 e9             	mov    ecx,r13d
    3a11:	c1 f8 1f             	sar    eax,0x1f
    3a14:	48 c1 fb 21          	sar    rbx,0x21
    3a18:	29 c3                	sub    ebx,eax
    3a1a:	8d 14 db             	lea    edx,[rbx+rbx*8]
    3a1d:	29 d1                	sub    ecx,edx
    3a1f:	83 f9 01             	cmp    ecx,0x1
    3a22:	83 db ff             	sbb    ebx,0xffffffff
    3a25:	4c 63 f3             	movsxd r14,ebx
    3a28:	49 c1 e6 02          	shl    r14,0x2
    3a2c:	4c 89 f2             	mov    rdx,r14
    3a2f:	e8 fc ea ff ff       	call   2530 <posix_memalign@plt>
    3a34:	85 c0                	test   eax,eax
    3a36:	74 18                	je     3a50 <returnLimbs+0x80>
    3a38:	48 8d 3d 11 36 00 00 	lea    rdi,[rip+0x3611]        # 7050 <_IO_stdin_used+0x50>
    3a3f:	e8 0c e9 ff ff       	call   2350 <puts@plt>
    3a44:	bf 01 00 00 00       	mov    edi,0x1
    3a49:	e8 b2 ea ff ff       	call   2500 <exit@plt>
    3a4e:	66 90                	xchg   ax,ax
    3a50:	4c 8b 04 24          	mov    r8,QWORD PTR [rsp]
    3a54:	4d 85 c0             	test   r8,r8
    3a57:	74 df                	je     3a38 <returnLimbs+0x68>
    3a59:	44 89 e8             	mov    eax,r13d
    3a5c:	8d 7b ff             	lea    edi,[rbx-0x1]
    3a5f:	83 e8 01             	sub    eax,0x1
    3a62:	0f 88 bc 01 00 00    	js     3c24 <returnLimbs+0x254>
    3a68:	48 63 f0             	movsxd rsi,eax
    3a6b:	c5 f8 57 c0          	vxorps xmm0,xmm0,xmm0
    3a6f:	41 8b 14 b4          	mov    edx,DWORD PTR [r12+rsi*4]
    3a73:	4c 8d 0c b5 00 00 00 	lea    r9,[rsi*4+0x0]
    3a7a:	00 
    3a7b:	62 f1 7f 08 7b da    	vcvtusi2sd xmm3,xmm0,edx
    3a81:	41 83 fd 01          	cmp    r13d,0x1
    3a85:	0f 84 c5 01 00 00    	je     3c50 <returnLimbs+0x280>
    3a8b:	62 91 7f 08 7b 4c 0c 	vcvtusi2sd xmm1,xmm0,DWORD PTR [r12+r9*1-0x4]
    3a92:	ff 
    3a93:	c5 fb 10 15 fd 3b 00 	vmovsd xmm2,QWORD PTR [rip+0x3bfd]        # 7698 <__PRETTY_FUNCTION__.0+0xb>
    3a9a:	00 
    3a9b:	c4 e2 e1 99 ca       	vfmadd132sd xmm1,xmm3,xmm2
    3aa0:	62 f1 7f 08 78 d1    	vcvttsd2usi edx,xmm1
    3aa6:	41 83 fd 02          	cmp    r13d,0x2
    3aaa:	0f 84 a0 01 00 00    	je     3c50 <returnLimbs+0x280>
    3ab0:	c5 fb 10 1d e8 3b 00 	vmovsd xmm3,QWORD PTR [rip+0x3be8]        # 76a0 <__PRETTY_FUNCTION__.0+0x13>
    3ab7:	00 
    3ab8:	4f 8d 6c 30 fc       	lea    r13,[r8+r14*1-0x4]
    3abd:	c5 fb 10 25 e3 3b 00 	vmovsd xmm4,QWORD PTR [rip+0x3be3]        # 76a8 <__PRETTY_FUNCTION__.0+0x1b>
    3ac4:	00 
    3ac5:	4f 8d 64 0c f8       	lea    r12,[r12+r9*1-0x8]
    3aca:	c5 fb 10 2d de 3b 00 	vmovsd xmm5,QWORD PTR [rip+0x3bde]        # 76b0 <__PRETTY_FUNCTION__.0+0x23>
    3ad1:	00 
    3ad2:	c5 fb 10 35 de 3b 00 	vmovsd xmm6,QWORD PTR [rip+0x3bde]        # 76b8 <__PRETTY_FUNCTION__.0+0x2b>
    3ad9:	00 
    3ada:	c5 fb 10 3d de 3b 00 	vmovsd xmm7,QWORD PTR [rip+0x3bde]        # 76c0 <__PRETTY_FUNCTION__.0+0x33>
    3ae1:	00 
    3ae2:	c5 7b 10 05 de 3b 00 	vmovsd xmm8,QWORD PTR [rip+0x3bde]        # 76c8 <__PRETTY_FUNCTION__.0+0x3b>
    3ae9:	00 
    3aea:	c5 7b 10 0d de 3b 00 	vmovsd xmm9,QWORD PTR [rip+0x3bde]        # 76d0 <__PRETTY_FUNCTION__.0+0x43>
    3af1:	00 
    3af2:	e9 06 01 00 00       	jmp    3bfd <returnLimbs+0x22d>
    3af7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    3afe:	00 00 
    3b00:	62 51 7f 08 7b ea    	vcvtusi2sd xmm13,xmm0,r10d
    3b06:	62 51 7f 08 7b 64 24 	vcvtusi2sd xmm12,xmm0,DWORD PTR [r12-0x4]
    3b0d:	ff 
    3b0e:	c4 62 91 99 e4       	vfmadd132sd xmm12,xmm13,xmm4
    3b13:	62 51 7f 08 78 d4    	vcvttsd2usi r10d,xmm12
    3b19:	83 f8 03             	cmp    eax,0x3
    3b1c:	0f 84 fe 00 00 00    	je     3c20 <returnLimbs+0x250>
    3b22:	62 51 7f 08 7b fa    	vcvtusi2sd xmm15,xmm0,r10d
    3b28:	62 51 7f 08 7b 74 24 	vcvtusi2sd xmm14,xmm0,DWORD PTR [r12-0x8]
    3b2f:	fe 
    3b30:	c4 62 81 99 f5       	vfmadd132sd xmm14,xmm15,xmm5
    3b35:	62 51 7f 08 78 d6    	vcvttsd2usi r10d,xmm14
    3b3b:	83 f8 04             	cmp    eax,0x4
    3b3e:	0f 84 dc 00 00 00    	je     3c20 <returnLimbs+0x250>
    3b44:	62 51 7f 08 7b da    	vcvtusi2sd xmm11,xmm0,r10d
    3b4a:	62 d1 7f 08 7b 4c 24 	vcvtusi2sd xmm1,xmm0,DWORD PTR [r12-0xc]
    3b51:	fd 
    3b52:	c4 e2 a1 99 ce       	vfmadd132sd xmm1,xmm11,xmm6
    3b57:	62 71 7f 08 78 d1    	vcvttsd2usi r10d,xmm1
    3b5d:	83 f8 05             	cmp    eax,0x5
    3b60:	0f 84 ba 00 00 00    	je     3c20 <returnLimbs+0x250>
    3b66:	62 51 7f 08 7b d2    	vcvtusi2sd xmm10,xmm0,r10d
    3b6c:	62 51 7f 08 7b 64 24 	vcvtusi2sd xmm12,xmm0,DWORD PTR [r12-0x10]
    3b73:	fc 
    3b74:	c4 62 a9 99 e7       	vfmadd132sd xmm12,xmm10,xmm7
    3b79:	62 51 7f 08 78 d4    	vcvttsd2usi r10d,xmm12
    3b7f:	83 f8 06             	cmp    eax,0x6
    3b82:	0f 84 98 00 00 00    	je     3c20 <returnLimbs+0x250>
    3b88:	62 51 7f 08 7b f2    	vcvtusi2sd xmm14,xmm0,r10d
    3b8e:	62 51 7f 08 7b 6c 24 	vcvtusi2sd xmm13,xmm0,DWORD PTR [r12-0x14]
    3b95:	fb 
    3b96:	c4 42 89 99 e8       	vfmadd132sd xmm13,xmm14,xmm8
    3b9b:	62 51 7f 08 78 d5    	vcvttsd2usi r10d,xmm13
    3ba1:	83 f8 07             	cmp    eax,0x7
    3ba4:	74 7a                	je     3c20 <returnLimbs+0x250>
    3ba6:	62 51 7f 08 7b 7c 24 	vcvtusi2sd xmm15,xmm0,DWORD PTR [r12-0x18]
    3bad:	fa 
    3bae:	83 e8 09             	sub    eax,0x9
    3bb1:	83 ef 01             	sub    edi,0x1
    3bb4:	62 d1 7f 08 7b ca    	vcvtusi2sd xmm1,xmm0,r10d
    3bba:	c4 42 f1 99 f9       	vfmadd132sd xmm15,xmm1,xmm9
    3bbf:	62 51 7f 08 78 df    	vcvttsd2usi r11d,xmm15
    3bc5:	45 89 5d 00          	mov    DWORD PTR [r13+0x0],r11d
    3bc9:	83 f8 ff             	cmp    eax,0xffffffff
    3bcc:	74 56                	je     3c24 <returnLimbs+0x254>
    3bce:	41 8b 54 24 e4       	mov    edx,DWORD PTR [r12-0x1c]
    3bd3:	62 71 7f 08 7b d2    	vcvtusi2sd xmm10,xmm0,edx
    3bd9:	85 c0                	test   eax,eax
    3bdb:	74 73                	je     3c50 <returnLimbs+0x280>
    3bdd:	62 51 7f 08 7b 64 24 	vcvtusi2sd xmm12,xmm0,DWORD PTR [r12-0x20]
    3be4:	f8 
    3be5:	49 83 ed 04          	sub    r13,0x4
    3be9:	49 83 ec 24          	sub    r12,0x24
    3bed:	c4 62 a9 99 e2       	vfmadd132sd xmm12,xmm10,xmm2
    3bf2:	62 d1 7f 08 78 d4    	vcvttsd2usi edx,xmm12
    3bf8:	83 f8 01             	cmp    eax,0x1
    3bfb:	74 53                	je     3c50 <returnLimbs+0x280>
    3bfd:	62 51 7f 08 7b 1c 24 	vcvtusi2sd xmm11,xmm0,DWORD PTR [r12]
    3c04:	62 71 7f 08 7b d2    	vcvtusi2sd xmm10,xmm0,edx
    3c0a:	c4 62 a9 99 db       	vfmadd132sd xmm11,xmm10,xmm3
    3c0f:	62 51 7f 08 78 d3    	vcvttsd2usi r10d,xmm11
    3c15:	83 f8 02             	cmp    eax,0x2
    3c18:	0f 85 e2 fe ff ff    	jne    3b00 <returnLimbs+0x130>
    3c1e:	66 90                	xchg   ax,ax
    3c20:	45 89 55 00          	mov    DWORD PTR [r13+0x0],r10d
    3c24:	89 5d 00             	mov    DWORD PTR [rbp+0x0],ebx
    3c27:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
    3c2c:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    3c33:	00 00 
    3c35:	75 22                	jne    3c59 <returnLimbs+0x289>
    3c37:	48 83 c4 10          	add    rsp,0x10
    3c3b:	4c 89 c0             	mov    rax,r8
    3c3e:	5b                   	pop    rbx
    3c3f:	5d                   	pop    rbp
    3c40:	41 5c                	pop    r12
    3c42:	41 5d                	pop    r13
    3c44:	41 5e                	pop    r14
    3c46:	c3                   	ret    
    3c47:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    3c4e:	00 00 
    3c50:	48 63 cf             	movsxd rcx,edi
    3c53:	41 89 14 88          	mov    DWORD PTR [r8+rcx*4],edx
    3c57:	eb cb                	jmp    3c24 <returnLimbs+0x254>
    3c59:	e8 62 e7 ff ff       	call   23c0 <__stack_chk_fail@plt>
    3c5e:	66 90                	xchg   ax,ax

0000000000003c60 <formatResult>:
    3c60:	f3 0f 1e fa          	endbr64 
    3c64:	41 57                	push   r15
    3c66:	41 56                	push   r14
    3c68:	49 89 fe             	mov    r14,rdi
    3c6b:	41 55                	push   r13
    3c6d:	49 89 f5             	mov    r13,rsi
    3c70:	41 54                	push   r12
    3c72:	55                   	push   rbp
    3c73:	53                   	push   rbx
    3c74:	48 83 ec 28          	sub    rsp,0x28
    3c78:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    3c7f:	00 00 
    3c81:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
    3c86:	8b 06                	mov    eax,DWORD PTR [rsi]
    3c88:	be 01 00 00 00       	mov    esi,0x1
    3c8d:	89 c7                	mov    edi,eax
    3c8f:	c1 e7 04             	shl    edi,0x4
    3c92:	29 c7                	sub    edi,eax
    3c94:	83 c7 01             	add    edi,0x1
    3c97:	48 63 ff             	movsxd rdi,edi
    3c9a:	e8 b1 e7 ff ff       	call   2450 <calloc@plt>
    3c9f:	48 85 c0             	test   rax,rax
    3ca2:	0f 84 56 03 00 00    	je     3ffe <formatResult+0x39e>
    3ca8:	45 8b 06             	mov    r8d,DWORD PTR [r14]
    3cab:	48 89 c7             	mov    rdi,rax
    3cae:	48 89 c5             	mov    rbp,rax
    3cb1:	48 8d 0d 3c 37 00 00 	lea    rcx,[rip+0x373c]        # 73f4 <_IO_stdin_used+0x3f4>
    3cb8:	31 c0                	xor    eax,eax
    3cba:	be 01 00 00 00       	mov    esi,0x1
    3cbf:	48 8d 5c 24 09       	lea    rbx,[rsp+0x9]
    3cc4:	48 c7 c2 ff ff ff ff 	mov    rdx,0xffffffffffffffff
    3ccb:	e8 c0 e8 ff ff       	call   2590 <__sprintf_chk@plt>
    3cd0:	41 83 7d 00 01       	cmp    DWORD PTR [r13+0x0],0x1
    3cd5:	41 bc 01 00 00 00    	mov    r12d,0x1
    3cdb:	4c 8d 3d 57 37 00 00 	lea    r15,[rip+0x3757]        # 7439 <_IO_stdin_used+0x439>
    3ce2:	0f 8e d0 00 00 00    	jle    3db8 <formatResult+0x158>
    3ce8:	47 8b 04 a6          	mov    r8d,DWORD PTR [r14+r12*4]
    3cec:	ba 0f 00 00 00       	mov    edx,0xf
    3cf1:	4c 89 f9             	mov    rcx,r15
    3cf4:	48 89 df             	mov    rdi,rbx
    3cf7:	be 01 00 00 00       	mov    esi,0x1
    3cfc:	31 c0                	xor    eax,eax
    3cfe:	e8 8d e8 ff ff       	call   2590 <__sprintf_chk@plt>
    3d03:	48 89 de             	mov    rsi,rbx
    3d06:	48 89 ef             	mov    rdi,rbp
    3d09:	e8 e2 e7 ff ff       	call   24f0 <strcat@plt>
    3d0e:	49 8d 54 24 01       	lea    rdx,[r12+0x1]
    3d13:	41 39 55 00          	cmp    DWORD PTR [r13+0x0],edx
    3d17:	0f 8e 9b 00 00 00    	jle    3db8 <formatResult+0x158>
    3d1d:	45 8b 04 96          	mov    r8d,DWORD PTR [r14+rdx*4]
    3d21:	4c 89 f9             	mov    rcx,r15
    3d24:	ba 0f 00 00 00       	mov    edx,0xf
    3d29:	48 89 df             	mov    rdi,rbx
    3d2c:	be 01 00 00 00       	mov    esi,0x1
    3d31:	31 c0                	xor    eax,eax
    3d33:	e8 58 e8 ff ff       	call   2590 <__sprintf_chk@plt>
    3d38:	48 89 de             	mov    rsi,rbx
    3d3b:	48 89 ef             	mov    rdi,rbp
    3d3e:	e8 ad e7 ff ff       	call   24f0 <strcat@plt>
    3d43:	49 8d 4c 24 02       	lea    rcx,[r12+0x2]
    3d48:	41 39 4d 00          	cmp    DWORD PTR [r13+0x0],ecx
    3d4c:	7e 6a                	jle    3db8 <formatResult+0x158>
    3d4e:	45 8b 04 8e          	mov    r8d,DWORD PTR [r14+rcx*4]
    3d52:	ba 0f 00 00 00       	mov    edx,0xf
    3d57:	4c 89 f9             	mov    rcx,r15
    3d5a:	48 89 df             	mov    rdi,rbx
    3d5d:	be 01 00 00 00       	mov    esi,0x1
    3d62:	31 c0                	xor    eax,eax
    3d64:	e8 27 e8 ff ff       	call   2590 <__sprintf_chk@plt>
    3d69:	48 89 de             	mov    rsi,rbx
    3d6c:	48 89 ef             	mov    rdi,rbp
    3d6f:	e8 7c e7 ff ff       	call   24f0 <strcat@plt>
    3d74:	49 8d 74 24 03       	lea    rsi,[r12+0x3]
    3d79:	41 39 75 00          	cmp    DWORD PTR [r13+0x0],esi
    3d7d:	7e 39                	jle    3db8 <formatResult+0x158>
    3d7f:	45 8b 04 b6          	mov    r8d,DWORD PTR [r14+rsi*4]
    3d83:	4c 89 f9             	mov    rcx,r15
    3d86:	ba 0f 00 00 00       	mov    edx,0xf
    3d8b:	48 89 df             	mov    rdi,rbx
    3d8e:	be 01 00 00 00       	mov    esi,0x1
    3d93:	31 c0                	xor    eax,eax
    3d95:	49 83 c4 04          	add    r12,0x4
    3d99:	e8 f2 e7 ff ff       	call   2590 <__sprintf_chk@plt>
    3d9e:	48 89 de             	mov    rsi,rbx
    3da1:	48 89 ef             	mov    rdi,rbp
    3da4:	e8 47 e7 ff ff       	call   24f0 <strcat@plt>
    3da9:	45 39 65 00          	cmp    DWORD PTR [r13+0x0],r12d
    3dad:	0f 8f 35 ff ff ff    	jg     3ce8 <formatResult+0x88>
    3db3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    3db8:	45 31 e4             	xor    r12d,r12d
    3dbb:	31 db                	xor    ebx,ebx
    3dbd:	80 7d 00 30          	cmp    BYTE PTR [rbp+0x0],0x30
    3dc1:	41 b8 01 00 00 00    	mov    r8d,0x1
    3dc7:	49 89 ee             	mov    r14,rbp
    3dca:	0f 85 c8 00 00 00    	jne    3e98 <formatResult+0x238>
    3dd0:	42 80 7c 05 00 30    	cmp    BYTE PTR [rbp+r8*1+0x0],0x30
    3dd6:	49 63 d8             	movsxd rbx,r8d
    3dd9:	4d 8d 48 01          	lea    r9,[r8+0x1]
    3ddd:	4d 89 c4             	mov    r12,r8
    3de0:	4e 8d 74 05 00       	lea    r14,[rbp+r8*1+0x0]
    3de5:	0f 85 ad 00 00 00    	jne    3e98 <formatResult+0x238>
    3deb:	42 80 7c 05 01 30    	cmp    BYTE PTR [rbp+r8*1+0x1],0x30
    3df1:	49 63 d9             	movsxd rbx,r9d
    3df4:	4d 8d 50 02          	lea    r10,[r8+0x2]
    3df8:	4d 89 cc             	mov    r12,r9
    3dfb:	4e 8d 74 0d 00       	lea    r14,[rbp+r9*1+0x0]
    3e00:	0f 85 92 00 00 00    	jne    3e98 <formatResult+0x238>
    3e06:	42 80 7c 05 02 30    	cmp    BYTE PTR [rbp+r8*1+0x2],0x30
    3e0c:	49 63 da             	movsxd rbx,r10d
    3e0f:	4d 8d 58 03          	lea    r11,[r8+0x3]
    3e13:	4d 89 d4             	mov    r12,r10
    3e16:	4e 8d 74 15 00       	lea    r14,[rbp+r10*1+0x0]
    3e1b:	75 7b                	jne    3e98 <formatResult+0x238>
    3e1d:	42 80 7c 05 03 30    	cmp    BYTE PTR [rbp+r8*1+0x3],0x30
    3e23:	49 63 db             	movsxd rbx,r11d
    3e26:	49 8d 40 04          	lea    rax,[r8+0x4]
    3e2a:	4d 89 dc             	mov    r12,r11
    3e2d:	4e 8d 74 1d 00       	lea    r14,[rbp+r11*1+0x0]
    3e32:	75 64                	jne    3e98 <formatResult+0x238>
    3e34:	42 80 7c 05 04 30    	cmp    BYTE PTR [rbp+r8*1+0x4],0x30
    3e3a:	48 63 d8             	movsxd rbx,eax
    3e3d:	49 8d 78 05          	lea    rdi,[r8+0x5]
    3e41:	49 89 c4             	mov    r12,rax
    3e44:	4c 8d 74 05 00       	lea    r14,[rbp+rax*1+0x0]
    3e49:	75 4d                	jne    3e98 <formatResult+0x238>
    3e4b:	42 80 7c 05 05 30    	cmp    BYTE PTR [rbp+r8*1+0x5],0x30
    3e51:	48 63 df             	movsxd rbx,edi
    3e54:	4d 8d 78 06          	lea    r15,[r8+0x6]
    3e58:	49 89 fc             	mov    r12,rdi
    3e5b:	4c 8d 74 3d 00       	lea    r14,[rbp+rdi*1+0x0]
    3e60:	75 36                	jne    3e98 <formatResult+0x238>
    3e62:	42 80 7c 05 06 30    	cmp    BYTE PTR [rbp+r8*1+0x6],0x30
    3e68:	49 63 df             	movsxd rbx,r15d
    3e6b:	49 8d 50 07          	lea    rdx,[r8+0x7]
    3e6f:	4d 89 fc             	mov    r12,r15
    3e72:	4e 8d 74 3d 00       	lea    r14,[rbp+r15*1+0x0]
    3e77:	75 1f                	jne    3e98 <formatResult+0x238>
    3e79:	49 83 c0 08          	add    r8,0x8
    3e7d:	48 63 da             	movsxd rbx,edx
    3e80:	4c 8d 74 15 00       	lea    r14,[rbp+rdx*1+0x0]
    3e85:	49 89 d4             	mov    r12,rdx
    3e88:	42 80 7c 05 ff 30    	cmp    BYTE PTR [rbp+r8*1-0x1],0x30
    3e8e:	0f 84 3c ff ff ff    	je     3dd0 <formatResult+0x170>
    3e94:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    3e98:	48 89 ef             	mov    rdi,rbp
    3e9b:	e8 00 e5 ff ff       	call   23a0 <strlen@plt>
    3ea0:	4c 39 e0             	cmp    rax,r12
    3ea3:	0f 84 37 01 00 00    	je     3fe0 <formatResult+0x380>
    3ea9:	48 8d 78 01          	lea    rdi,[rax+0x1]
    3ead:	be 01 00 00 00       	mov    esi,0x1
    3eb2:	4c 29 e7             	sub    rdi,r12
    3eb5:	e8 96 e5 ff ff       	call   2450 <calloc@plt>
    3eba:	49 89 c7             	mov    r15,rax
    3ebd:	48 85 c0             	test   rax,rax
    3ec0:	0f 84 50 01 00 00    	je     4016 <formatResult+0x3b6>
    3ec6:	41 0f b6 06          	movzx  eax,BYTE PTR [r14]
    3eca:	41 b8 01 00 00 00    	mov    r8d,0x1
    3ed0:	48 01 eb             	add    rbx,rbp
    3ed3:	4c 89 fa             	mov    rdx,r15
    3ed6:	84 c0                	test   al,al
    3ed8:	0f 84 c5 00 00 00    	je     3fa3 <formatResult+0x343>
    3ede:	49 8d 48 01          	lea    rcx,[r8+0x1]
    3ee2:	43 88 44 07 ff       	mov    BYTE PTR [r15+r8*1-0x1],al
    3ee7:	49 63 d0             	movsxd rdx,r8d
    3eea:	0f b6 74 0b ff       	movzx  esi,BYTE PTR [rbx+rcx*1-0x1]
    3eef:	40 84 f6             	test   sil,sil
    3ef2:	0f 84 a8 00 00 00    	je     3fa0 <formatResult+0x340>
    3ef8:	45 0f b6 54 18 01    	movzx  r10d,BYTE PTR [r8+rbx*1+0x1]
    3efe:	41 88 74 0f ff       	mov    BYTE PTR [r15+rcx*1-0x1],sil
    3f03:	48 63 d1             	movsxd rdx,ecx
    3f06:	4d 8d 48 02          	lea    r9,[r8+0x2]
    3f0a:	45 84 d2             	test   r10b,r10b
    3f0d:	0f 84 8d 00 00 00    	je     3fa0 <formatResult+0x340>
    3f13:	41 0f b6 44 18 02    	movzx  eax,BYTE PTR [r8+rbx*1+0x2]
    3f19:	47 88 54 07 01       	mov    BYTE PTR [r15+r8*1+0x1],r10b
    3f1e:	49 63 d1             	movsxd rdx,r9d
    3f21:	4d 8d 58 03          	lea    r11,[r8+0x3]
    3f25:	84 c0                	test   al,al
    3f27:	74 77                	je     3fa0 <formatResult+0x340>
    3f29:	45 0f b6 74 18 03    	movzx  r14d,BYTE PTR [r8+rbx*1+0x3]
    3f2f:	43 88 44 07 02       	mov    BYTE PTR [r15+r8*1+0x2],al
    3f34:	49 63 d3             	movsxd rdx,r11d
    3f37:	49 8d 78 04          	lea    rdi,[r8+0x4]
    3f3b:	45 84 f6             	test   r14b,r14b
    3f3e:	74 60                	je     3fa0 <formatResult+0x340>
    3f40:	41 0f b6 4c 18 04    	movzx  ecx,BYTE PTR [r8+rbx*1+0x4]
    3f46:	47 88 74 07 03       	mov    BYTE PTR [r15+r8*1+0x3],r14b
    3f4b:	48 63 d7             	movsxd rdx,edi
    3f4e:	4d 8d 60 05          	lea    r12,[r8+0x5]
    3f52:	84 c9                	test   cl,cl
    3f54:	74 4a                	je     3fa0 <formatResult+0x340>
    3f56:	41 0f b6 74 18 05    	movzx  esi,BYTE PTR [r8+rbx*1+0x5]
    3f5c:	43 88 4c 07 04       	mov    BYTE PTR [r15+r8*1+0x4],cl
    3f61:	49 63 d4             	movsxd rdx,r12d
    3f64:	4d 8d 48 06          	lea    r9,[r8+0x6]
    3f68:	40 84 f6             	test   sil,sil
    3f6b:	74 33                	je     3fa0 <formatResult+0x340>
    3f6d:	45 0f b6 5c 18 06    	movzx  r11d,BYTE PTR [r8+rbx*1+0x6]
    3f73:	43 88 74 07 05       	mov    BYTE PTR [r15+r8*1+0x5],sil
    3f78:	49 63 d1             	movsxd rdx,r9d
    3f7b:	4d 8d 50 07          	lea    r10,[r8+0x7]
    3f7f:	45 84 db             	test   r11b,r11b
    3f82:	74 1c                	je     3fa0 <formatResult+0x340>
    3f84:	47 88 5c 07 06       	mov    BYTE PTR [r15+r8*1+0x6],r11b
    3f89:	49 83 c0 08          	add    r8,0x8
    3f8d:	49 63 d2             	movsxd rdx,r10d
    3f90:	42 0f b6 44 03 ff    	movzx  eax,BYTE PTR [rbx+r8*1-0x1]
    3f96:	84 c0                	test   al,al
    3f98:	0f 85 40 ff ff ff    	jne    3ede <formatResult+0x27e>
    3f9e:	66 90                	xchg   ax,ax
    3fa0:	4c 01 fa             	add    rdx,r15
    3fa3:	c6 02 00             	mov    BYTE PTR [rdx],0x0
    3fa6:	48 89 ef             	mov    rdi,rbp
    3fa9:	e8 62 e3 ff ff       	call   2310 <free@plt>
    3fae:	4c 89 ff             	mov    rdi,r15
    3fb1:	e8 ea e3 ff ff       	call   23a0 <strlen@plt>
    3fb6:	41 89 45 00          	mov    DWORD PTR [r13+0x0],eax
    3fba:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
    3fbf:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    3fc6:	00 00 
    3fc8:	75 47                	jne    4011 <formatResult+0x3b1>
    3fca:	48 83 c4 28          	add    rsp,0x28
    3fce:	4c 89 f8             	mov    rax,r15
    3fd1:	5b                   	pop    rbx
    3fd2:	5d                   	pop    rbp
    3fd3:	41 5c                	pop    r12
    3fd5:	41 5d                	pop    r13
    3fd7:	41 5e                	pop    r14
    3fd9:	41 5f                	pop    r15
    3fdb:	c3                   	ret    
    3fdc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    3fe0:	be 01 00 00 00       	mov    esi,0x1
    3fe5:	bf 02 00 00 00       	mov    edi,0x2
    3fea:	41 bd 30 00 00 00    	mov    r13d,0x30
    3ff0:	e8 5b e4 ff ff       	call   2450 <calloc@plt>
    3ff5:	66 44 89 28          	mov    WORD PTR [rax],r13w
    3ff9:	49 89 c7             	mov    r15,rax
    3ffc:	eb bc                	jmp    3fba <formatResult+0x35a>
    3ffe:	48 8d 3d 73 30 00 00 	lea    rdi,[rip+0x3073]        # 7078 <_IO_stdin_used+0x78>
    4005:	e8 d6 e4 ff ff       	call   24e0 <perror@plt>
    400a:	31 ff                	xor    edi,edi
    400c:	e8 ef e4 ff ff       	call   2500 <exit@plt>
    4011:	e8 aa e3 ff ff       	call   23c0 <__stack_chk_fail@plt>
    4016:	48 8d 3d 8b 30 00 00 	lea    rdi,[rip+0x308b]        # 70a8 <_IO_stdin_used+0xa8>
    401d:	e8 be e4 ff ff       	call   24e0 <perror@plt>
    4022:	31 ff                	xor    edi,edi
    4024:	e8 d7 e4 ff ff       	call   2500 <exit@plt>
    4029:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000004030 <make_equidistant>:
    4030:	f3 0f 1e fa          	endbr64 
    4034:	41 57                	push   r15
    4036:	41 56                	push   r14
    4038:	41 55                	push   r13
    403a:	41 54                	push   r12
    403c:	55                   	push   rbp
    403d:	53                   	push   rbx
    403e:	48 83 ec 18          	sub    rsp,0x18
    4042:	44 8b 3a             	mov    r15d,DWORD PTR [rdx]
    4045:	44 8b 31             	mov    r14d,DWORD PTR [rcx]
    4048:	45 39 f7             	cmp    r15d,r14d
    404b:	74 19                	je     4066 <make_equidistant+0x36>
    404d:	48 8b 06             	mov    rax,QWORD PTR [rsi]
    4050:	4c 8b 07             	mov    r8,QWORD PTR [rdi]
    4053:	49 89 fd             	mov    r13,rdi
    4056:	49 89 f4             	mov    r12,rsi
    4059:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
    405e:	7f 18                	jg     4078 <make_equidistant+0x48>
    4060:	0f 8c e2 00 00 00    	jl     4148 <make_equidistant+0x118>
    4066:	48 83 c4 18          	add    rsp,0x18
    406a:	5b                   	pop    rbx
    406b:	5d                   	pop    rbp
    406c:	41 5c                	pop    r12
    406e:	41 5d                	pop    r13
    4070:	41 5e                	pop    r14
    4072:	41 5f                	pop    r15
    4074:	c3                   	ret    
    4075:	0f 1f 00             	nop    DWORD PTR [rax]
    4078:	49 63 ef             	movsxd rbp,r15d
    407b:	be 04 00 00 00       	mov    esi,0x4
    4080:	48 89 cb             	mov    rbx,rcx
    4083:	48 89 ef             	mov    rdi,rbp
    4086:	e8 c5 e3 ff ff       	call   2450 <calloc@plt>
    408b:	49 89 c5             	mov    r13,rax
    408e:	48 85 c0             	test   rax,rax
    4091:	0f 84 73 01 00 00    	je     420a <make_equidistant+0x1da>
    4097:	44 89 f0             	mov    eax,r14d
    409a:	83 e8 01             	sub    eax,0x1
    409d:	78 3a                	js     40d9 <make_equidistant+0xa9>
    409f:	41 89 c3             	mov    r11d,eax
    40a2:	48 98                	cdqe   
    40a4:	49 63 f6             	movsxd rsi,r14d
    40a7:	4c 89 da             	mov    rdx,r11
    40aa:	4c 8d 44 05 00       	lea    r8,[rbp+rax*1+0x0]
    40af:	4e 8d 0c 9d 04 00 00 	lea    r9,[r11*4+0x4]
    40b6:	00 
    40b7:	48 f7 da             	neg    rdx
    40ba:	49 29 f0             	sub    r8,rsi
    40bd:	48 c1 e2 02          	shl    rdx,0x2
    40c1:	4a 8d 3c 82          	lea    rdi,[rdx+r8*4]
    40c5:	48 8d 34 82          	lea    rsi,[rdx+rax*4]
    40c9:	4c 89 ca             	mov    rdx,r9
    40cc:	48 03 74 24 08       	add    rsi,QWORD PTR [rsp+0x8]
    40d1:	4c 01 ef             	add    rdi,r13
    40d4:	e8 a7 e3 ff ff       	call   2480 <memcpy@plt>
    40d9:	44 89 f9             	mov    ecx,r15d
    40dc:	31 f6                	xor    esi,esi
    40de:	4c 89 ef             	mov    rdi,r13
    40e1:	44 29 f1             	sub    ecx,r14d
    40e4:	4c 8d 34 ad 00 00 00 	lea    r14,[rbp*4+0x0]
    40eb:	00 
    40ec:	48 63 d1             	movsxd rdx,ecx
    40ef:	48 c1 e2 02          	shl    rdx,0x2
    40f3:	e8 e8 e2 ff ff       	call   23e0 <memset@plt>
    40f8:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
    40fd:	4c 89 f6             	mov    rsi,r14
    4100:	e8 9b e3 ff ff       	call   24a0 <realloc@plt>
    4105:	48 89 c7             	mov    rdi,rax
    4108:	48 85 c0             	test   rax,rax
    410b:	0f 84 1f 01 00 00    	je     4230 <make_equidistant+0x200>
    4111:	45 85 ff             	test   r15d,r15d
    4114:	7e 0e                	jle    4124 <make_equidistant+0xf4>
    4116:	4c 89 f2             	mov    rdx,r14
    4119:	4c 89 ee             	mov    rsi,r13
    411c:	e8 5f e3 ff ff       	call   2480 <memcpy@plt>
    4121:	48 89 c7             	mov    rdi,rax
    4124:	44 89 3b             	mov    DWORD PTR [rbx],r15d
    4127:	49 89 3c 24          	mov    QWORD PTR [r12],rdi
    412b:	4c 89 ef             	mov    rdi,r13
    412e:	48 83 c4 18          	add    rsp,0x18
    4132:	5b                   	pop    rbx
    4133:	5d                   	pop    rbp
    4134:	41 5c                	pop    r12
    4136:	41 5d                	pop    r13
    4138:	41 5e                	pop    r14
    413a:	41 5f                	pop    r15
    413c:	e9 cf e1 ff ff       	jmp    2310 <free@plt>
    4141:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    4148:	49 63 de             	movsxd rbx,r14d
    414b:	be 04 00 00 00       	mov    esi,0x4
    4150:	4c 89 44 24 08       	mov    QWORD PTR [rsp+0x8],r8
    4155:	48 89 d5             	mov    rbp,rdx
    4158:	48 89 df             	mov    rdi,rbx
    415b:	e8 f0 e2 ff ff       	call   2450 <calloc@plt>
    4160:	49 89 c4             	mov    r12,rax
    4163:	48 85 c0             	test   rax,rax
    4166:	0f 84 9e 00 00 00    	je     420a <make_equidistant+0x1da>
    416c:	44 89 f8             	mov    eax,r15d
    416f:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
    4174:	83 e8 01             	sub    eax,0x1
    4177:	78 32                	js     41ab <make_equidistant+0x17b>
    4179:	89 c6                	mov    esi,eax
    417b:	48 98                	cdqe   
    417d:	48 89 f2             	mov    rdx,rsi
    4180:	4c 8d 0c b5 04 00 00 	lea    r9,[rsi*4+0x4]
    4187:	00 
    4188:	48 f7 da             	neg    rdx
    418b:	48 c1 e2 02          	shl    rdx,0x2
    418f:	48 8d 34 82          	lea    rsi,[rdx+rax*4]
    4193:	48 8d 7c 9a fc       	lea    rdi,[rdx+rbx*4-0x4]
    4198:	4c 89 ca             	mov    rdx,r9
    419b:	48 01 ce             	add    rsi,rcx
    419e:	4c 01 e7             	add    rdi,r12
    41a1:	e8 da e2 ff ff       	call   2480 <memcpy@plt>
    41a6:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
    41ab:	44 89 f7             	mov    edi,r14d
    41ae:	31 f6                	xor    esi,esi
    41b0:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
    41b5:	44 29 ff             	sub    edi,r15d
    41b8:	4c 8d 3c 9d 00 00 00 	lea    r15,[rbx*4+0x0]
    41bf:	00 
    41c0:	48 63 d7             	movsxd rdx,edi
    41c3:	4c 89 e7             	mov    rdi,r12
    41c6:	48 c1 e2 02          	shl    rdx,0x2
    41ca:	e8 11 e2 ff ff       	call   23e0 <memset@plt>
    41cf:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
    41d4:	4c 89 fe             	mov    rsi,r15
    41d7:	e8 c4 e2 ff ff       	call   24a0 <realloc@plt>
    41dc:	49 89 c2             	mov    r10,rax
    41df:	48 85 c0             	test   rax,rax
    41e2:	74 39                	je     421d <make_equidistant+0x1ed>
    41e4:	45 85 f6             	test   r14d,r14d
    41e7:	7e 11                	jle    41fa <make_equidistant+0x1ca>
    41e9:	4c 89 fa             	mov    rdx,r15
    41ec:	4c 89 e6             	mov    rsi,r12
    41ef:	48 89 c7             	mov    rdi,rax
    41f2:	e8 89 e2 ff ff       	call   2480 <memcpy@plt>
    41f7:	49 89 c2             	mov    r10,rax
    41fa:	44 89 75 00          	mov    DWORD PTR [rbp+0x0],r14d
    41fe:	4c 89 e7             	mov    rdi,r12
    4201:	4d 89 55 00          	mov    QWORD PTR [r13+0x0],r10
    4205:	e9 24 ff ff ff       	jmp    412e <make_equidistant+0xfe>
    420a:	48 8d 3d c7 2e 00 00 	lea    rdi,[rip+0x2ec7]        # 70d8 <_IO_stdin_used+0xd8>
    4211:	e8 ca e2 ff ff       	call   24e0 <perror@plt>
    4216:	31 ff                	xor    edi,edi
    4218:	e8 e3 e2 ff ff       	call   2500 <exit@plt>
    421d:	48 8d 3d 04 2f 00 00 	lea    rdi,[rip+0x2f04]        # 7128 <_IO_stdin_used+0x128>
    4224:	e8 b7 e2 ff ff       	call   24e0 <perror@plt>
    4229:	31 ff                	xor    edi,edi
    422b:	e8 d0 e2 ff ff       	call   2500 <exit@plt>
    4230:	48 8d 3d c9 2e 00 00 	lea    rdi,[rip+0x2ec9]        # 7100 <_IO_stdin_used+0x100>
    4237:	e8 a4 e2 ff ff       	call   24e0 <perror@plt>
    423c:	31 ff                	xor    edi,edi
    423e:	e8 bd e2 ff ff       	call   2500 <exit@plt>
    4243:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    424a:	00 00 00 00 
    424e:	66 90                	xchg   ax,ax

0000000000004250 <initialize_perf>:
    4250:	f3 0f 1e fa          	endbr64 
    4254:	41 56                	push   r14
    4256:	b9 60 00 00 00       	mov    ecx,0x60
    425b:	31 c0                	xor    eax,eax
    425d:	48 ba 01 00 00 00 80 	movabs rdx,0x8000000001
    4264:	00 00 00 
    4267:	41 55                	push   r13
    4269:	44 8b 2d 64 62 00 00 	mov    r13d,DWORD PTR [rip+0x6264]        # a4d4 <CORE_NO>
    4270:	41 54                	push   r12
    4272:	4c 8d 25 57 5e 00 00 	lea    r12,[rip+0x5e57]        # a0d0 <fd>
    4279:	55                   	push   rbp
    427a:	48 8d 2d 7f 5e 00 00 	lea    rbp,[rip+0x5e7f]        # a100 <pe>
    4281:	48 89 ef             	mov    rdi,rbp
    4284:	53                   	push   rbx
    4285:	31 db                	xor    ebx,ebx
    4287:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
    428a:	48 89 15 ef 5f 00 00 	mov    QWORD PTR [rip+0x5fef],rdx        # a280 <pe+0x180>
    4291:	48 83 c2 02          	add    rdx,0x2
    4295:	c7 05 65 5e 00 00 80 	mov    DWORD PTR [rip+0x5e65],0x80        # a104 <pe+0x4>
    429c:	00 00 00 
    429f:	c6 05 82 5e 00 00 c5 	mov    BYTE PTR [rip+0x5e82],0xc5        # a128 <pe+0x28>
    42a6:	c7 05 d4 5e 00 00 80 	mov    DWORD PTR [rip+0x5ed4],0x80        # a184 <pe+0x84>
    42ad:	00 00 00 
    42b0:	c7 05 4a 5f 00 00 80 	mov    DWORD PTR [rip+0x5f4a],0x80        # a204 <pe+0x104>
    42b7:	00 00 00 
    42ba:	c6 05 e7 5f 00 00 c5 	mov    BYTE PTR [rip+0x5fe7],0xc5        # a2a8 <pe+0x1a8>
    42c1:	c6 05 60 60 00 00 c5 	mov    BYTE PTR [rip+0x6060],0xc5        # a328 <pe+0x228>
    42c8:	c6 05 d9 60 00 00 c5 	mov    BYTE PTR [rip+0x60d9],0xc5        # a3a8 <pe+0x2a8>
    42cf:	48 c7 05 ae 5e 00 00 	mov    QWORD PTR [rip+0x5eae],0x1        # a188 <pe+0x88>
    42d6:	01 00 00 00 
    42da:	c6 05 c7 5e 00 00 e5 	mov    BYTE PTR [rip+0x5ec7],0xe5        # a1a8 <pe+0xa8>
    42e1:	48 c7 05 1c 5f 00 00 	mov    QWORD PTR [rip+0x5f1c],0x1        # a208 <pe+0x108>
    42e8:	01 00 00 00 
    42ec:	c6 05 35 5f 00 00 d5 	mov    BYTE PTR [rip+0x5f35],0xd5        # a228 <pe+0x128>
    42f3:	48 c7 05 8a 5f 00 00 	mov    QWORD PTR [rip+0x5f8a],0x2        # a288 <pe+0x188>
    42fa:	02 00 00 00 
    42fe:	48 89 15 fb 5f 00 00 	mov    QWORD PTR [rip+0x5ffb],rdx        # a300 <pe+0x200>
    4305:	48 89 15 74 60 00 00 	mov    QWORD PTR [rip+0x6074],rdx        # a380 <pe+0x280>
    430c:	48 c7 05 71 60 00 00 	mov    QWORD PTR [rip+0x6071],0x10000        # a388 <pe+0x288>
    4313:	00 00 01 00 
    4317:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    431e:	00 00 
    4320:	48 89 de             	mov    rsi,rbx
    4323:	45 31 c9             	xor    r9d,r9d
    4326:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
    432c:	44 89 e9             	mov    ecx,r13d
    432f:	48 c1 e6 07          	shl    rsi,0x7
    4333:	31 d2                	xor    edx,edx
    4335:	bf 2a 01 00 00       	mov    edi,0x12a
    433a:	31 c0                	xor    eax,eax
    433c:	48 01 ee             	add    rsi,rbp
    433f:	e8 1c e1 ff ff       	call   2460 <syscall@plt>
    4344:	41 89 04 9c          	mov    DWORD PTR [r12+rbx*4],eax
    4348:	83 f8 ff             	cmp    eax,0xffffffff
    434b:	74 13                	je     4360 <initialize_perf+0x110>
    434d:	48 83 c3 01          	add    rbx,0x1
    4351:	48 83 fb 06          	cmp    rbx,0x6
    4355:	75 c9                	jne    4320 <initialize_perf+0xd0>
    4357:	5b                   	pop    rbx
    4358:	5d                   	pop    rbp
    4359:	41 5c                	pop    r12
    435b:	41 5d                	pop    r13
    435d:	41 5e                	pop    r14
    435f:	c3                   	ret    
    4360:	e8 cb df ff ff       	call   2330 <__errno_location@plt>
    4365:	8b 38                	mov    edi,DWORD PTR [rax]
    4367:	e8 e4 e1 ff ff       	call   2550 <strerror@plt>
    436c:	48 8b 3d 0d 5d 00 00 	mov    rdi,QWORD PTR [rip+0x5d0d]        # a080 <stderr@GLIBC_2.2.5>
    4373:	89 d9                	mov    ecx,ebx
    4375:	48 8d 15 c2 30 00 00 	lea    rdx,[rip+0x30c2]        # 743e <_IO_stdin_used+0x43e>
    437c:	49 89 c0             	mov    r8,rax
    437f:	be 01 00 00 00       	mov    esi,0x1
    4384:	31 c0                	xor    eax,eax
    4386:	e8 95 e1 ff ff       	call   2520 <__fprintf_chk@plt>
    438b:	bf 01 00 00 00       	mov    edi,0x1
    4390:	e8 6b e1 ff ff       	call   2500 <exit@plt>
    4395:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    439c:	00 00 00 00 

00000000000043a0 <open_file>:
    43a0:	f3 0f 1e fa          	endbr64 
    43a4:	41 55                	push   r13
    43a6:	48 8d 35 ad 30 00 00 	lea    rsi,[rip+0x30ad]        # 745a <_IO_stdin_used+0x45a>
    43ad:	41 54                	push   r12
    43af:	55                   	push   rbp
    43b0:	53                   	push   rbx
    43b1:	48 83 ec 08          	sub    rsp,0x8
    43b5:	e8 16 e1 ff ff       	call   24d0 <fopen@plt>
    43ba:	48 85 c0             	test   rax,rax
    43bd:	74 52                	je     4411 <open_file+0x71>
    43bf:	48 8d 1d 5a 5c 00 00 	lea    rbx,[rip+0x5c5a]        # a020 <event_names>
    43c6:	49 89 c4             	mov    r12,rax
    43c9:	48 8d 2d 8c 30 00 00 	lea    rbp,[rip+0x308c]        # 745c <_IO_stdin_used+0x45c>
    43d0:	4c 8d 6b 30          	lea    r13,[rbx+0x30]
    43d4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    43d8:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
    43db:	48 89 ea             	mov    rdx,rbp
    43de:	be 01 00 00 00       	mov    esi,0x1
    43e3:	4c 89 e7             	mov    rdi,r12
    43e6:	31 c0                	xor    eax,eax
    43e8:	48 83 c3 08          	add    rbx,0x8
    43ec:	e8 2f e1 ff ff       	call   2520 <__fprintf_chk@plt>
    43f1:	4c 39 eb             	cmp    rbx,r13
    43f4:	75 e2                	jne    43d8 <open_file+0x38>
    43f6:	4c 89 e6             	mov    rsi,r12
    43f9:	bf 0a 00 00 00       	mov    edi,0xa
    43fe:	e8 0d e0 ff ff       	call   2410 <fputc@plt>
    4403:	48 83 c4 08          	add    rsp,0x8
    4407:	4c 89 e0             	mov    rax,r12
    440a:	5b                   	pop    rbx
    440b:	5d                   	pop    rbp
    440c:	41 5c                	pop    r12
    440e:	41 5d                	pop    r13
    4410:	c3                   	ret    
    4411:	e8 ca e3 ff ff       	call   27e0 <open_file.part.0>
    4416:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    441d:	00 00 00 

0000000000004420 <read_perf>:
    4420:	f3 0f 1e fa          	endbr64 
    4424:	41 54                	push   r12
    4426:	55                   	push   rbp
    4427:	48 89 fd             	mov    rbp,rdi
    442a:	53                   	push   rbx
    442b:	48 8d 1d 9e 5c 00 00 	lea    rbx,[rip+0x5c9e]        # a0d0 <fd>
    4432:	4c 8d 63 18          	lea    r12,[rbx+0x18]
    4436:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    443d:	00 00 00 
    4440:	8b 3b                	mov    edi,DWORD PTR [rbx]
    4442:	ba 08 00 00 00       	mov    edx,0x8
    4447:	48 89 ee             	mov    rsi,rbp
    444a:	e8 d1 df ff ff       	call   2420 <read@plt>
    444f:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
    4453:	74 12                	je     4467 <read_perf+0x47>
    4455:	48 83 c3 04          	add    rbx,0x4
    4459:	48 83 c5 08          	add    rbp,0x8
    445d:	4c 39 e3             	cmp    rbx,r12
    4460:	75 de                	jne    4440 <read_perf+0x20>
    4462:	5b                   	pop    rbx
    4463:	5d                   	pop    rbp
    4464:	41 5c                	pop    r12
    4466:	c3                   	ret    
    4467:	48 8d 3d f2 2f 00 00 	lea    rdi,[rip+0x2ff2]        # 7460 <_IO_stdin_used+0x460>
    446e:	e8 6d e0 ff ff       	call   24e0 <perror@plt>
    4473:	bf 01 00 00 00       	mov    edi,0x1
    4478:	e8 83 e0 ff ff       	call   2500 <exit@plt>
    447d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000004480 <write_perf>:
    4480:	f3 0f 1e fa          	endbr64 
    4484:	41 55                	push   r13
    4486:	4c 8d 6e 30          	lea    r13,[rsi+0x30]
    448a:	41 54                	push   r12
    448c:	4c 8d 25 e9 2f 00 00 	lea    r12,[rip+0x2fe9]        # 747c <_IO_stdin_used+0x47c>
    4493:	55                   	push   rbp
    4494:	48 89 fd             	mov    rbp,rdi
    4497:	53                   	push   rbx
    4498:	48 89 f3             	mov    rbx,rsi
    449b:	48 83 ec 08          	sub    rsp,0x8
    449f:	90                   	nop
    44a0:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
    44a3:	4c 89 e2             	mov    rdx,r12
    44a6:	be 01 00 00 00       	mov    esi,0x1
    44ab:	48 89 ef             	mov    rdi,rbp
    44ae:	31 c0                	xor    eax,eax
    44b0:	48 83 c3 08          	add    rbx,0x8
    44b4:	e8 67 e0 ff ff       	call   2520 <__fprintf_chk@plt>
    44b9:	4c 39 eb             	cmp    rbx,r13
    44bc:	75 e2                	jne    44a0 <write_perf+0x20>
    44be:	48 83 c4 08          	add    rsp,0x8
    44c2:	48 89 ee             	mov    rsi,rbp
    44c5:	bf 0a 00 00 00       	mov    edi,0xa
    44ca:	5b                   	pop    rbx
    44cb:	5d                   	pop    rbp
    44cc:	41 5c                	pop    r12
    44ce:	41 5d                	pop    r13
    44d0:	e9 3b df ff ff       	jmp    2410 <fputc@plt>
    44d5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    44dc:	00 00 00 00 

00000000000044e0 <start_perf>:
    44e0:	f3 0f 1e fa          	endbr64 
    44e4:	55                   	push   rbp
    44e5:	53                   	push   rbx
    44e6:	48 8d 1d e3 5b 00 00 	lea    rbx,[rip+0x5be3]        # a0d0 <fd>
    44ed:	48 8d 6b 18          	lea    rbp,[rbx+0x18]
    44f1:	48 83 ec 08          	sub    rsp,0x8
    44f5:	0f 1f 00             	nop    DWORD PTR [rax]
    44f8:	8b 3b                	mov    edi,DWORD PTR [rbx]
    44fa:	31 d2                	xor    edx,edx
    44fc:	be 03 24 00 00       	mov    esi,0x2403
    4501:	31 c0                	xor    eax,eax
    4503:	48 83 c3 04          	add    rbx,0x4
    4507:	e8 e4 de ff ff       	call   23f0 <ioctl@plt>
    450c:	8b 7b fc             	mov    edi,DWORD PTR [rbx-0x4]
    450f:	31 d2                	xor    edx,edx
    4511:	be 00 24 00 00       	mov    esi,0x2400
    4516:	31 c0                	xor    eax,eax
    4518:	e8 d3 de ff ff       	call   23f0 <ioctl@plt>
    451d:	48 39 eb             	cmp    rbx,rbp
    4520:	75 d6                	jne    44f8 <start_perf+0x18>
    4522:	48 83 c4 08          	add    rsp,0x8
    4526:	5b                   	pop    rbx
    4527:	5d                   	pop    rbp
    4528:	c3                   	ret    
    4529:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000004530 <stop_perf>:
    4530:	f3 0f 1e fa          	endbr64 
    4534:	55                   	push   rbp
    4535:	53                   	push   rbx
    4536:	48 8d 1d 93 5b 00 00 	lea    rbx,[rip+0x5b93]        # a0d0 <fd>
    453d:	48 8d 6b 18          	lea    rbp,[rbx+0x18]
    4541:	48 83 ec 08          	sub    rsp,0x8
    4545:	0f 1f 00             	nop    DWORD PTR [rax]
    4548:	8b 3b                	mov    edi,DWORD PTR [rbx]
    454a:	31 d2                	xor    edx,edx
    454c:	31 c0                	xor    eax,eax
    454e:	be 01 24 00 00       	mov    esi,0x2401
    4553:	e8 98 de ff ff       	call   23f0 <ioctl@plt>
    4558:	83 f8 ff             	cmp    eax,0xffffffff
    455b:	74 10                	je     456d <stop_perf+0x3d>
    455d:	48 83 c3 04          	add    rbx,0x4
    4561:	48 39 eb             	cmp    rbx,rbp
    4564:	75 e2                	jne    4548 <stop_perf+0x18>
    4566:	48 83 c4 08          	add    rsp,0x8
    456a:	5b                   	pop    rbx
    456b:	5d                   	pop    rbp
    456c:	c3                   	ret    
    456d:	48 8d 3d 0e 2f 00 00 	lea    rdi,[rip+0x2f0e]        # 7482 <_IO_stdin_used+0x482>
    4574:	e8 67 df ff ff       	call   24e0 <perror@plt>
    4579:	bf 01 00 00 00       	mov    edi,0x1
    457e:	e8 7d df ff ff       	call   2500 <exit@plt>
    4583:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    458a:	00 00 00 00 
    458e:	66 90                	xchg   ax,ax

0000000000004590 <start_timespec>:
    4590:	f3 0f 1e fa          	endbr64 
    4594:	c5 f9 ef c0          	vpxor  xmm0,xmm0,xmm0
    4598:	48 83 ec 08          	sub    rsp,0x8
    459c:	48 89 fe             	mov    rsi,rdi
    459f:	c5 fa 7f 07          	vmovdqu XMMWORD PTR [rdi],xmm0
    45a3:	bf 04 00 00 00       	mov    edi,0x4
    45a8:	e8 b3 dd ff ff       	call   2360 <clock_gettime@plt>
    45ad:	83 f8 ff             	cmp    eax,0xffffffff
    45b0:	74 05                	je     45b7 <start_timespec+0x27>
    45b2:	48 83 c4 08          	add    rsp,0x8
    45b6:	c3                   	ret    
    45b7:	48 8d 3d dc 2e 00 00 	lea    rdi,[rip+0x2edc]        # 749a <_IO_stdin_used+0x49a>
    45be:	e8 1d df ff ff       	call   24e0 <perror@plt>
    45c3:	bf 01 00 00 00       	mov    edi,0x1
    45c8:	e8 33 df ff ff       	call   2500 <exit@plt>
    45cd:	0f 1f 00             	nop    DWORD PTR [rax]

00000000000045d0 <stop_timespec>:
    45d0:	f3 0f 1e fa          	endbr64 
    45d4:	c5 f9 ef c0          	vpxor  xmm0,xmm0,xmm0
    45d8:	48 83 ec 08          	sub    rsp,0x8
    45dc:	48 89 fe             	mov    rsi,rdi
    45df:	c5 fa 7f 07          	vmovdqu XMMWORD PTR [rdi],xmm0
    45e3:	bf 04 00 00 00       	mov    edi,0x4
    45e8:	e8 73 dd ff ff       	call   2360 <clock_gettime@plt>
    45ed:	83 f8 ff             	cmp    eax,0xffffffff
    45f0:	74 05                	je     45f7 <stop_timespec+0x27>
    45f2:	48 83 c4 08          	add    rsp,0x8
    45f6:	c3                   	ret    
    45f7:	48 8d 3d b5 2e 00 00 	lea    rdi,[rip+0x2eb5]        # 74b3 <_IO_stdin_used+0x4b3>
    45fe:	e8 dd de ff ff       	call   24e0 <perror@plt>
    4603:	bf 01 00 00 00       	mov    edi,0x1
    4608:	e8 f3 de ff ff       	call   2500 <exit@plt>
    460d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000004610 <calculate_time>:
    4610:	f3 0f 1e fa          	endbr64 
    4614:	48 29 fa             	sub    rdx,rdi
    4617:	48 29 f1             	sub    rcx,rsi
    461a:	79 0b                	jns    4627 <calculate_time+0x17>
    461c:	48 83 ea 01          	sub    rdx,0x1
    4620:	48 81 c1 00 ca 9a 3b 	add    rcx,0x3b9aca00
    4627:	48 69 d2 00 ca 9a 3b 	imul   rdx,rdx,0x3b9aca00
    462e:	c5 f8 57 c0          	vxorps xmm0,xmm0,xmm0
    4632:	48 01 ca             	add    rdx,rcx
    4635:	c4 e1 fb 2a c2       	vcvtsi2sd xmm0,xmm0,rdx
    463a:	c3                   	ret    
    463b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000004640 <check_result>:
    4640:	f3 0f 1e fa          	endbr64 
    4644:	41 57                	push   r15
    4646:	41 56                	push   r14
    4648:	41 89 d6             	mov    r14d,edx
    464b:	41 55                	push   r13
    464d:	49 89 fd             	mov    r13,rdi
    4650:	41 54                	push   r12
    4652:	49 89 f4             	mov    r12,rsi
    4655:	55                   	push   rbp
    4656:	53                   	push   rbx
    4657:	48 83 ec 08          	sub    rsp,0x8
    465b:	e8 40 dd ff ff       	call   23a0 <strlen@plt>
    4660:	4c 89 e7             	mov    rdi,r12
    4663:	48 89 c3             	mov    rbx,rax
    4666:	e8 35 dd ff ff       	call   23a0 <strlen@plt>
    466b:	48 39 c3             	cmp    rbx,rax
    466e:	0f 85 bc 02 00 00    	jne    4930 <check_result+0x2f0>
    4674:	49 63 d6             	movsxd rdx,r14d
    4677:	31 db                	xor    ebx,ebx
    4679:	45 85 f6             	test   r14d,r14d
    467c:	0f 8e 23 02 00 00    	jle    48a5 <check_result+0x265>
    4682:	48 89 d0             	mov    rax,rdx
    4685:	83 e0 07             	and    eax,0x7
    4688:	0f 84 16 01 00 00    	je     47a4 <check_result+0x164>
    468e:	48 83 f8 01          	cmp    rax,0x1
    4692:	0f 84 e3 00 00 00    	je     477b <check_result+0x13b>
    4698:	48 83 f8 02          	cmp    rax,0x2
    469c:	0f 84 b9 00 00 00    	je     475b <check_result+0x11b>
    46a2:	48 83 f8 03          	cmp    rax,0x3
    46a6:	0f 84 8f 00 00 00    	je     473b <check_result+0xfb>
    46ac:	48 83 f8 04          	cmp    rax,0x4
    46b0:	74 69                	je     471b <check_result+0xdb>
    46b2:	48 83 f8 05          	cmp    rax,0x5
    46b6:	74 43                	je     46fb <check_result+0xbb>
    46b8:	48 83 f8 06          	cmp    rax,0x6
    46bc:	74 1d                	je     46db <check_result+0x9b>
    46be:	41 0f b6 0c 24       	movzx  ecx,BYTE PTR [r12]
    46c3:	45 31 f6             	xor    r14d,r14d
    46c6:	4d 89 ef             	mov    r15,r13
    46c9:	4c 89 e5             	mov    rbp,r12
    46cc:	41 38 4d 00          	cmp    BYTE PTR [r13+0x0],cl
    46d0:	0f 85 ea 01 00 00    	jne    48c0 <check_result+0x280>
    46d6:	bb 01 00 00 00       	mov    ebx,0x1
    46db:	41 0f b6 34 1c       	movzx  esi,BYTE PTR [r12+rbx*1]
    46e0:	41 89 de             	mov    r14d,ebx
    46e3:	4d 8d 7c 1d 00       	lea    r15,[r13+rbx*1+0x0]
    46e8:	49 8d 2c 1c          	lea    rbp,[r12+rbx*1]
    46ec:	41 38 74 1d 00       	cmp    BYTE PTR [r13+rbx*1+0x0],sil
    46f1:	0f 85 c9 01 00 00    	jne    48c0 <check_result+0x280>
    46f7:	48 83 c3 01          	add    rbx,0x1
    46fb:	41 0f b6 3c 1c       	movzx  edi,BYTE PTR [r12+rbx*1]
    4700:	41 89 de             	mov    r14d,ebx
    4703:	4d 8d 7c 1d 00       	lea    r15,[r13+rbx*1+0x0]
    4708:	49 8d 2c 1c          	lea    rbp,[r12+rbx*1]
    470c:	41 38 7c 1d 00       	cmp    BYTE PTR [r13+rbx*1+0x0],dil
    4711:	0f 85 a9 01 00 00    	jne    48c0 <check_result+0x280>
    4717:	48 83 c3 01          	add    rbx,0x1
    471b:	45 0f b6 04 1c       	movzx  r8d,BYTE PTR [r12+rbx*1]
    4720:	41 89 de             	mov    r14d,ebx
    4723:	4d 8d 7c 1d 00       	lea    r15,[r13+rbx*1+0x0]
    4728:	49 8d 2c 1c          	lea    rbp,[r12+rbx*1]
    472c:	45 38 44 1d 00       	cmp    BYTE PTR [r13+rbx*1+0x0],r8b
    4731:	0f 85 89 01 00 00    	jne    48c0 <check_result+0x280>
    4737:	48 83 c3 01          	add    rbx,0x1
    473b:	45 0f b6 0c 1c       	movzx  r9d,BYTE PTR [r12+rbx*1]
    4740:	41 89 de             	mov    r14d,ebx
    4743:	4d 8d 7c 1d 00       	lea    r15,[r13+rbx*1+0x0]
    4748:	49 8d 2c 1c          	lea    rbp,[r12+rbx*1]
    474c:	45 38 4c 1d 00       	cmp    BYTE PTR [r13+rbx*1+0x0],r9b
    4751:	0f 85 69 01 00 00    	jne    48c0 <check_result+0x280>
    4757:	48 83 c3 01          	add    rbx,0x1
    475b:	45 0f b6 14 1c       	movzx  r10d,BYTE PTR [r12+rbx*1]
    4760:	41 89 de             	mov    r14d,ebx
    4763:	4d 8d 7c 1d 00       	lea    r15,[r13+rbx*1+0x0]
    4768:	49 8d 2c 1c          	lea    rbp,[r12+rbx*1]
    476c:	45 38 54 1d 00       	cmp    BYTE PTR [r13+rbx*1+0x0],r10b
    4771:	0f 85 49 01 00 00    	jne    48c0 <check_result+0x280>
    4777:	48 83 c3 01          	add    rbx,0x1
    477b:	45 0f b6 1c 1c       	movzx  r11d,BYTE PTR [r12+rbx*1]
    4780:	41 89 de             	mov    r14d,ebx
    4783:	4d 8d 7c 1d 00       	lea    r15,[r13+rbx*1+0x0]
    4788:	49 8d 2c 1c          	lea    rbp,[r12+rbx*1]
    478c:	45 38 5c 1d 00       	cmp    BYTE PTR [r13+rbx*1+0x0],r11b
    4791:	0f 85 29 01 00 00    	jne    48c0 <check_result+0x280>
    4797:	48 83 c3 01          	add    rbx,0x1
    479b:	48 39 d3             	cmp    rbx,rdx
    479e:	0f 84 01 01 00 00    	je     48a5 <check_result+0x265>
    47a4:	41 0f b6 04 1c       	movzx  eax,BYTE PTR [r12+rbx*1]
    47a9:	41 89 de             	mov    r14d,ebx
    47ac:	4d 8d 7c 1d 00       	lea    r15,[r13+rbx*1+0x0]
    47b1:	49 8d 2c 1c          	lea    rbp,[r12+rbx*1]
    47b5:	41 38 44 1d 00       	cmp    BYTE PTR [r13+rbx*1+0x0],al
    47ba:	0f 85 00 01 00 00    	jne    48c0 <check_result+0x280>
    47c0:	48 8d 7b 01          	lea    rdi,[rbx+0x1]
    47c4:	41 0f b6 0c 3c       	movzx  ecx,BYTE PTR [r12+rdi*1]
    47c9:	48 89 fb             	mov    rbx,rdi
    47cc:	41 89 fe             	mov    r14d,edi
    47cf:	4d 8d 7c 3d 00       	lea    r15,[r13+rdi*1+0x0]
    47d4:	49 8d 2c 3c          	lea    rbp,[r12+rdi*1]
    47d8:	41 38 4c 3d 00       	cmp    BYTE PTR [r13+rdi*1+0x0],cl
    47dd:	0f 85 dd 00 00 00    	jne    48c0 <check_result+0x280>
    47e3:	48 83 c3 01          	add    rbx,0x1
    47e7:	41 0f b6 34 1c       	movzx  esi,BYTE PTR [r12+rbx*1]
    47ec:	41 89 de             	mov    r14d,ebx
    47ef:	4d 8d 7c 1d 00       	lea    r15,[r13+rbx*1+0x0]
    47f4:	49 8d 2c 1c          	lea    rbp,[r12+rbx*1]
    47f8:	41 38 74 1d 00       	cmp    BYTE PTR [r13+rbx*1+0x0],sil
    47fd:	0f 85 bd 00 00 00    	jne    48c0 <check_result+0x280>
    4803:	48 8d 5f 02          	lea    rbx,[rdi+0x2]
    4807:	45 0f b6 44 3c 02    	movzx  r8d,BYTE PTR [r12+rdi*1+0x2]
    480d:	41 89 de             	mov    r14d,ebx
    4810:	4d 8d 7c 1d 00       	lea    r15,[r13+rbx*1+0x0]
    4815:	49 8d 2c 1c          	lea    rbp,[r12+rbx*1]
    4819:	45 38 44 3d 02       	cmp    BYTE PTR [r13+rdi*1+0x2],r8b
    481e:	0f 85 9c 00 00 00    	jne    48c0 <check_result+0x280>
    4824:	48 8d 5f 03          	lea    rbx,[rdi+0x3]
    4828:	45 0f b6 4c 3c 03    	movzx  r9d,BYTE PTR [r12+rdi*1+0x3]
    482e:	41 89 de             	mov    r14d,ebx
    4831:	4d 8d 7c 1d 00       	lea    r15,[r13+rbx*1+0x0]
    4836:	49 8d 2c 1c          	lea    rbp,[r12+rbx*1]
    483a:	45 38 4c 3d 03       	cmp    BYTE PTR [r13+rdi*1+0x3],r9b
    483f:	75 7f                	jne    48c0 <check_result+0x280>
    4841:	48 8d 5f 04          	lea    rbx,[rdi+0x4]
    4845:	45 0f b6 54 3c 04    	movzx  r10d,BYTE PTR [r12+rdi*1+0x4]
    484b:	41 89 de             	mov    r14d,ebx
    484e:	4d 8d 7c 1d 00       	lea    r15,[r13+rbx*1+0x0]
    4853:	49 8d 2c 1c          	lea    rbp,[r12+rbx*1]
    4857:	45 38 54 3d 04       	cmp    BYTE PTR [r13+rdi*1+0x4],r10b
    485c:	75 62                	jne    48c0 <check_result+0x280>
    485e:	48 8d 5f 05          	lea    rbx,[rdi+0x5]
    4862:	45 0f b6 5c 3c 05    	movzx  r11d,BYTE PTR [r12+rdi*1+0x5]
    4868:	41 89 de             	mov    r14d,ebx
    486b:	4d 8d 7c 1d 00       	lea    r15,[r13+rbx*1+0x0]
    4870:	49 8d 2c 1c          	lea    rbp,[r12+rbx*1]
    4874:	45 38 5c 3d 05       	cmp    BYTE PTR [r13+rdi*1+0x5],r11b
    4879:	75 45                	jne    48c0 <check_result+0x280>
    487b:	48 8d 5f 06          	lea    rbx,[rdi+0x6]
    487f:	41 0f b6 44 3c 06    	movzx  eax,BYTE PTR [r12+rdi*1+0x6]
    4885:	41 89 de             	mov    r14d,ebx
    4888:	4d 8d 7c 1d 00       	lea    r15,[r13+rbx*1+0x0]
    488d:	49 8d 2c 1c          	lea    rbp,[r12+rbx*1]
    4891:	41 38 44 3d 06       	cmp    BYTE PTR [r13+rdi*1+0x6],al
    4896:	75 28                	jne    48c0 <check_result+0x280>
    4898:	48 8d 5f 07          	lea    rbx,[rdi+0x7]
    489c:	48 39 d3             	cmp    rbx,rdx
    489f:	0f 85 ff fe ff ff    	jne    47a4 <check_result+0x164>
    48a5:	48 83 c4 08          	add    rsp,0x8
    48a9:	b8 01 00 00 00       	mov    eax,0x1
    48ae:	5b                   	pop    rbx
    48af:	5d                   	pop    rbp
    48b0:	41 5c                	pop    r12
    48b2:	41 5d                	pop    r13
    48b4:	41 5e                	pop    r14
    48b6:	41 5f                	pop    r15
    48b8:	c3                   	ret    
    48b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    48c0:	48 8d 3d 21 2c 00 00 	lea    rdi,[rip+0x2c21]        # 74e8 <_IO_stdin_used+0x4e8>
    48c7:	e8 84 da ff ff       	call   2350 <puts@plt>
    48cc:	44 89 f2             	mov    edx,r14d
    48cf:	bf 01 00 00 00       	mov    edi,0x1
    48d4:	31 c0                	xor    eax,eax
    48d6:	48 8d 35 26 2c 00 00 	lea    rsi,[rip+0x2c26]        # 7503 <_IO_stdin_used+0x503>
    48dd:	e8 ce db ff ff       	call   24b0 <__printf_chk@plt>
    48e2:	41 0f be 0f          	movsx  ecx,BYTE PTR [r15]
    48e6:	44 0f be 4d 00       	movsx  r9d,BYTE PTR [rbp+0x0]
    48eb:	31 c0                	xor    eax,eax
    48ed:	41 89 d8             	mov    r8d,ebx
    48f0:	44 89 f2             	mov    edx,r14d
    48f3:	bf 01 00 00 00       	mov    edi,0x1
    48f8:	48 8d 35 c1 28 00 00 	lea    rsi,[rip+0x28c1]        # 71c0 <_IO_stdin_used+0x1c0>
    48ff:	e8 ac db ff ff       	call   24b0 <__printf_chk@plt>
    4904:	4c 89 e1             	mov    rcx,r12
    4907:	4c 89 ea             	mov    rdx,r13
    490a:	bf 01 00 00 00       	mov    edi,0x1
    490f:	48 8d 35 03 2c 00 00 	lea    rsi,[rip+0x2c03]        # 7519 <_IO_stdin_used+0x519>
    4916:	31 c0                	xor    eax,eax
    4918:	e8 93 db ff ff       	call   24b0 <__printf_chk@plt>
    491d:	48 83 c4 08          	add    rsp,0x8
    4921:	31 c0                	xor    eax,eax
    4923:	5b                   	pop    rbx
    4924:	5d                   	pop    rbp
    4925:	41 5c                	pop    r12
    4927:	41 5d                	pop    r13
    4929:	41 5e                	pop    r14
    492b:	41 5f                	pop    r15
    492d:	c3                   	ret    
    492e:	66 90                	xchg   ax,ax
    4930:	48 8d 3d 19 28 00 00 	lea    rdi,[rip+0x2819]        # 7150 <_IO_stdin_used+0x150>
    4937:	e8 14 da ff ff       	call   2350 <puts@plt>
    493c:	4c 89 e7             	mov    rdi,r12
    493f:	e8 5c da ff ff       	call   23a0 <strlen@plt>
    4944:	44 89 f2             	mov    edx,r14d
    4947:	bf 01 00 00 00       	mov    edi,0x1
    494c:	48 8d 35 35 28 00 00 	lea    rsi,[rip+0x2835]        # 7188 <_IO_stdin_used+0x188>
    4953:	48 89 c1             	mov    rcx,rax
    4956:	31 c0                	xor    eax,eax
    4958:	e8 53 db ff ff       	call   24b0 <__printf_chk@plt>
    495d:	4c 89 e1             	mov    rcx,r12
    4960:	4c 89 ea             	mov    rdx,r13
    4963:	bf 01 00 00 00       	mov    edi,0x1
    4968:	48 8d 35 5b 2b 00 00 	lea    rsi,[rip+0x2b5b]        # 74ca <_IO_stdin_used+0x4ca>
    496f:	31 c0                	xor    eax,eax
    4971:	e8 3a db ff ff       	call   24b0 <__printf_chk@plt>
    4976:	48 83 c4 08          	add    rsp,0x8
    497a:	31 c0                	xor    eax,eax
    497c:	5b                   	pop    rbx
    497d:	5d                   	pop    rbp
    497e:	41 5c                	pop    r12
    4980:	41 5d                	pop    r13
    4982:	41 5e                	pop    r14
    4984:	41 5f                	pop    r15
    4986:	c3                   	ret    
    4987:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    498e:	00 00 

0000000000004990 <generate_no_borrow_propagation>:
    4990:	f3 0f 1e fa          	endbr64 
    4994:	55                   	push   rbp
    4995:	48 89 e5             	mov    rbp,rsp
    4998:	41 57                	push   r15
    499a:	41 56                	push   r14
    499c:	49 89 fe             	mov    r14,rdi
    499f:	41 55                	push   r13
    49a1:	41 54                	push   r12
    49a3:	4c 63 e2             	movsxd r12,edx
    49a6:	53                   	push   rbx
    49a7:	4d 89 e7             	mov    r15,r12
    49aa:	49 c1 e4 02          	shl    r12,0x2
    49ae:	4c 89 e7             	mov    rdi,r12
    49b1:	48 83 e4 e0          	and    rsp,0xffffffffffffffe0
    49b5:	48 83 ec 40          	sub    rsp,0x40
    49b9:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
    49be:	e8 cd da ff ff       	call   2490 <malloc@plt>
    49c3:	4c 89 e7             	mov    rdi,r12
    49c6:	49 89 06             	mov    QWORD PTR [r14],rax
    49c9:	e8 c2 da ff ff       	call   2490 <malloc@plt>
    49ce:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
    49d3:	48 89 06             	mov    QWORD PTR [rsi],rax
    49d6:	49 83 3e 00          	cmp    QWORD PTR [r14],0x0
    49da:	0f 84 c0 02 00 00    	je     4ca0 <generate_no_borrow_propagation+0x310>
    49e0:	48 85 c0             	test   rax,rax
    49e3:	0f 84 b7 02 00 00    	je     4ca0 <generate_no_borrow_propagation+0x310>
    49e9:	31 c0                	xor    eax,eax
    49eb:	e8 40 de ff ff       	call   2830 <generate_seed>
    49f0:	89 c7                	mov    edi,eax
    49f2:	e8 39 da ff ff       	call   2430 <srand@plt>
    49f7:	41 83 ef 01          	sub    r15d,0x1
    49fb:	0f 88 59 01 00 00    	js     4b5a <generate_no_borrow_propagation+0x1ca>
    4a01:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    4a08:	bb 08 00 00 00       	mov    ebx,0x8
    4a0d:	44 89 7c 24 38       	mov    DWORD PTR [rsp+0x38],r15d
    4a12:	41 39 df             	cmp    r15d,ebx
    4a15:	41 0f 4e df          	cmovle ebx,r15d
    4a19:	8d 43 01             	lea    eax,[rbx+0x1]
    4a1c:	89 5c 24 3c          	mov    DWORD PTR [rsp+0x3c],ebx
    4a20:	83 c3 02             	add    ebx,0x2
    4a23:	41 29 c7             	sub    r15d,eax
    4a26:	89 44 24 30          	mov    DWORD PTR [rsp+0x30],eax
    4a2a:	48 63 db             	movsxd rbx,ebx
    4a2d:	45 8d 67 01          	lea    r12d,[r15+0x1]
    4a31:	44 89 64 24 34       	mov    DWORD PTR [rsp+0x34],r12d
    4a36:	e8 45 db ff ff       	call   2580 <rand@plt>
    4a3b:	4d 63 cc             	movsxd r9,r12d
    4a3e:	4d 63 d7             	movsxd r10,r15d
    4a41:	48 63 d0             	movsxd rdx,eax
    4a44:	4e 8d 24 8d 00 00 00 	lea    r12,[r9*4+0x0]
    4a4b:	00 
    4a4c:	4c 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],r9
    4a51:	4c 01 d3             	add    rbx,r10
    4a54:	48 69 ca 67 66 66 66 	imul   rcx,rdx,0x66666667
    4a5b:	89 d7                	mov    edi,edx
    4a5d:	49 89 d5             	mov    r13,rdx
    4a60:	48 c1 e3 02          	shl    rbx,0x2
    4a64:	c1 ff 1f             	sar    edi,0x1f
    4a67:	4c 89 64 24 18       	mov    QWORD PTR [rsp+0x18],r12
    4a6c:	48 c1 f9 22          	sar    rcx,0x22
    4a70:	29 f9                	sub    ecx,edi
    4a72:	44 8d 04 89          	lea    r8d,[rcx+rcx*4]
    4a76:	45 01 c0             	add    r8d,r8d
    4a79:	45 29 c5             	sub    r13d,r8d
    4a7c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    4a80:	4d 8b 1e             	mov    r11,QWORD PTR [r14]
    4a83:	47 89 2c 23          	mov    DWORD PTR [r11+r12*1],r13d
    4a87:	e8 f4 da ff ff       	call   2580 <rand@plt>
    4a8c:	a8 01                	test   al,0x1
    4a8e:	75 08                	jne    4a98 <generate_no_borrow_propagation+0x108>
    4a90:	41 83 fd 01          	cmp    r13d,0x1
    4a94:	41 83 d5 ff          	adc    r13d,0xffffffff
    4a98:	49 83 c4 04          	add    r12,0x4
    4a9c:	4c 39 e3             	cmp    rbx,r12
    4a9f:	75 df                	jne    4a80 <generate_no_borrow_propagation+0xf0>
    4aa1:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
    4aa6:	44 8b 64 24 30       	mov    r12d,DWORD PTR [rsp+0x30]
    4aab:	48 63 7c 24 3c       	movsxd rdi,DWORD PTR [rsp+0x3c]
    4ab0:	48 63 4c 24 38       	movsxd rcx,DWORD PTR [rsp+0x38]
    4ab5:	48 8b 16             	mov    rdx,QWORD PTR [rsi]
    4ab8:	44 89 e6             	mov    esi,r12d
    4abb:	49 8b 06             	mov    rax,QWORD PTR [r14]
    4abe:	49 89 f0             	mov    r8,rsi
    4ac1:	4c 8d 14 8d 04 00 00 	lea    r10,[rcx*4+0x4]
    4ac8:	00 
    4ac9:	48 29 f9             	sub    rcx,rdi
    4acc:	44 8b 6c 24 34       	mov    r13d,DWORD PTR [rsp+0x34]
    4ad1:	49 f7 d8             	neg    r8
    4ad4:	48 01 ce             	add    rsi,rcx
    4ad7:	4c 8d 0c 8a          	lea    r9,[rdx+rcx*4]
    4adb:	49 89 fb             	mov    r11,rdi
    4ade:	4f 8d 04 82          	lea    r8,[r10+r8*4]
    4ae2:	48 8d 3c b2          	lea    rdi,[rdx+rsi*4]
    4ae6:	45 01 e5             	add    r13d,r12d
    4ae9:	49 01 c0             	add    r8,rax
    4aec:	41 8d 5d ff          	lea    ebx,[r13-0x1]
    4af0:	49 39 f8             	cmp    r8,rdi
    4af3:	4e 8d 04 10          	lea    r8,[rax+r10*1]
    4af7:	40 0f 93 c6          	setae  sil
    4afb:	4d 39 c1             	cmp    r9,r8
    4afe:	40 0f 93 c7          	setae  dil
    4b02:	40 08 f7             	or     dil,sil
    4b05:	0f 84 c5 00 00 00    	je     4bd0 <generate_no_borrow_propagation+0x240>
    4b0b:	41 83 fb 02          	cmp    r11d,0x2
    4b0f:	0f 86 bb 00 00 00    	jbe    4bd0 <generate_no_borrow_propagation+0x240>
    4b15:	41 83 fb 06          	cmp    r11d,0x6
    4b19:	76 4e                	jbe    4b69 <generate_no_borrow_propagation+0x1d9>
    4b1b:	c5 fd 6f 0d dd 2b 00 	vmovdqa ymm1,YMMWORD PTR [rip+0x2bdd]        # 7700 <__PRETTY_FUNCTION__.0+0x73>
    4b22:	00 
    4b23:	c4 a2 75 36 54 10 e0 	vpermd ymm2,ymm1,YMMWORD PTR [rax+r10*1-0x20]
    4b2a:	c4 c1 7e 7f 11       	vmovdqu YMMWORD PTR [r9],ymm2
    4b2f:	41 83 fc 08          	cmp    r12d,0x8
    4b33:	0f 84 5f 01 00 00    	je     4c98 <generate_no_borrow_propagation+0x308>
    4b39:	41 83 ed 09          	sub    r13d,0x9
    4b3d:	49 63 cd             	movsxd rcx,r13d
    4b40:	44 8b 1c 88          	mov    r11d,DWORD PTR [rax+rcx*4]
    4b44:	41 8d 47 09          	lea    eax,[r15+0x9]
    4b48:	48 98                	cdqe   
    4b4a:	44 89 1c 82          	mov    DWORD PTR [rdx+rax*4],r11d
    4b4e:	c5 f8 77             	vzeroupper 
    4b51:	45 85 ff             	test   r15d,r15d
    4b54:	0f 89 ae fe ff ff    	jns    4a08 <generate_no_borrow_propagation+0x78>
    4b5a:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
    4b5e:	5b                   	pop    rbx
    4b5f:	41 5c                	pop    r12
    4b61:	41 5d                	pop    r13
    4b63:	41 5e                	pop    r14
    4b65:	41 5f                	pop    r15
    4b67:	5d                   	pop    rbp
    4b68:	c3                   	ret    
    4b69:	c4 a1 79 70 44 10 f0 	vpshufd xmm0,XMMWORD PTR [rax+r10*1-0x10],0x1b
    4b70:	1b 
    4b71:	83 7c 24 3c 03       	cmp    DWORD PTR [rsp+0x3c],0x3
    4b76:	c5 fa 7f 04 8a       	vmovdqu XMMWORD PTR [rdx+rcx*4],xmm0
    4b7b:	74 d4                	je     4b51 <generate_no_borrow_propagation+0x1c1>
    4b7d:	45 8d 65 fb          	lea    r12d,[r13-0x5]
    4b81:	41 8d 4f 05          	lea    ecx,[r15+0x5]
    4b85:	44 8b 4c 24 38       	mov    r9d,DWORD PTR [rsp+0x38]
    4b8a:	49 63 dc             	movsxd rbx,r12d
    4b8d:	4c 63 d9             	movsxd r11,ecx
    4b90:	44 8b 14 98          	mov    r10d,DWORD PTR [rax+rbx*4]
    4b94:	46 89 14 9a          	mov    DWORD PTR [rdx+r11*4],r10d
    4b98:	41 83 f9 04          	cmp    r9d,0x4
    4b9c:	7e b3                	jle    4b51 <generate_no_borrow_propagation+0x1c1>
    4b9e:	41 8d 75 fa          	lea    esi,[r13-0x6]
    4ba2:	45 8d 67 06          	lea    r12d,[r15+0x6]
    4ba6:	4c 63 c6             	movsxd r8,esi
    4ba9:	49 63 dc             	movsxd rbx,r12d
    4bac:	42 8b 3c 80          	mov    edi,DWORD PTR [rax+r8*4]
    4bb0:	89 3c 9a             	mov    DWORD PTR [rdx+rbx*4],edi
    4bb3:	41 83 f9 05          	cmp    r9d,0x5
    4bb7:	7e 98                	jle    4b51 <generate_no_borrow_propagation+0x1c1>
    4bb9:	41 83 ed 07          	sub    r13d,0x7
    4bbd:	4d 63 ed             	movsxd r13,r13d
    4bc0:	46 8b 14 a8          	mov    r10d,DWORD PTR [rax+r13*4]
    4bc4:	41 8d 47 07          	lea    eax,[r15+0x7]
    4bc8:	48 98                	cdqe   
    4bca:	44 89 14 82          	mov    DWORD PTR [rdx+rax*4],r10d
    4bce:	eb 81                	jmp    4b51 <generate_no_borrow_propagation+0x1c1>
    4bd0:	4c 63 cb             	movsxd r9,ebx
    4bd3:	48 8b 7c 24 20       	mov    rdi,QWORD PTR [rsp+0x20]
    4bd8:	44 8b 64 24 38       	mov    r12d,DWORD PTR [rsp+0x38]
    4bdd:	42 8b 34 88          	mov    esi,DWORD PTR [rax+r9*4]
    4be1:	4e 8d 04 8d 00 00 00 	lea    r8,[r9*4+0x0]
    4be8:	00 
    4be9:	89 34 ba             	mov    DWORD PTR [rdx+rdi*4],esi
    4bec:	45 85 e4             	test   r12d,r12d
    4bef:	0f 84 5c ff ff ff    	je     4b51 <generate_no_borrow_propagation+0x1c1>
    4bf5:	46 8b 6c 00 fc       	mov    r13d,DWORD PTR [rax+r8*1-0x4]
    4bfa:	48 8b 5c 24 18       	mov    rbx,QWORD PTR [rsp+0x18]
    4bff:	44 89 6c 1a 04       	mov    DWORD PTR [rdx+rbx*1+0x4],r13d
    4c04:	41 83 fc 01          	cmp    r12d,0x1
    4c08:	0f 84 43 ff ff ff    	je     4b51 <generate_no_borrow_propagation+0x1c1>
    4c0e:	46 8b 54 00 f8       	mov    r10d,DWORD PTR [rax+r8*1-0x8]
    4c13:	44 89 54 1a 08       	mov    DWORD PTR [rdx+rbx*1+0x8],r10d
    4c18:	41 83 fc 02          	cmp    r12d,0x2
    4c1c:	0f 84 2f ff ff ff    	je     4b51 <generate_no_borrow_propagation+0x1c1>
    4c22:	42 8b 4c 00 f4       	mov    ecx,DWORD PTR [rax+r8*1-0xc]
    4c27:	89 4c 1a 0c          	mov    DWORD PTR [rdx+rbx*1+0xc],ecx
    4c2b:	41 83 fc 03          	cmp    r12d,0x3
    4c2f:	0f 84 1c ff ff ff    	je     4b51 <generate_no_borrow_propagation+0x1c1>
    4c35:	46 8b 5c 00 f0       	mov    r11d,DWORD PTR [rax+r8*1-0x10]
    4c3a:	44 89 5c 1a 10       	mov    DWORD PTR [rdx+rbx*1+0x10],r11d
    4c3f:	41 83 fc 04          	cmp    r12d,0x4
    4c43:	0f 84 08 ff ff ff    	je     4b51 <generate_no_borrow_propagation+0x1c1>
    4c49:	46 8b 4c 00 ec       	mov    r9d,DWORD PTR [rax+r8*1-0x14]
    4c4e:	44 89 4c 1a 14       	mov    DWORD PTR [rdx+rbx*1+0x14],r9d
    4c53:	41 83 fc 05          	cmp    r12d,0x5
    4c57:	0f 84 f4 fe ff ff    	je     4b51 <generate_no_borrow_propagation+0x1c1>
    4c5d:	42 8b 74 00 e8       	mov    esi,DWORD PTR [rax+r8*1-0x18]
    4c62:	89 74 1a 18          	mov    DWORD PTR [rdx+rbx*1+0x18],esi
    4c66:	41 83 fc 06          	cmp    r12d,0x6
    4c6a:	0f 84 e1 fe ff ff    	je     4b51 <generate_no_borrow_propagation+0x1c1>
    4c70:	42 8b 7c 00 e4       	mov    edi,DWORD PTR [rax+r8*1-0x1c]
    4c75:	89 7c 1a 1c          	mov    DWORD PTR [rdx+rbx*1+0x1c],edi
    4c79:	41 83 fc 07          	cmp    r12d,0x7
    4c7d:	0f 8e ce fe ff ff    	jle    4b51 <generate_no_borrow_propagation+0x1c1>
    4c83:	42 8b 44 00 e0       	mov    eax,DWORD PTR [rax+r8*1-0x20]
    4c88:	89 44 1a 20          	mov    DWORD PTR [rdx+rbx*1+0x20],eax
    4c8c:	e9 c0 fe ff ff       	jmp    4b51 <generate_no_borrow_propagation+0x1c1>
    4c91:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    4c98:	c5 f8 77             	vzeroupper 
    4c9b:	e9 b1 fe ff ff       	jmp    4b51 <generate_no_borrow_propagation+0x1c1>
    4ca0:	48 8d 3d 41 25 00 00 	lea    rdi,[rip+0x2541]        # 71e8 <_IO_stdin_used+0x1e8>
    4ca7:	e8 34 d8 ff ff       	call   24e0 <perror@plt>
    4cac:	bf 01 00 00 00       	mov    edi,0x1
    4cb1:	e8 4a d8 ff ff       	call   2500 <exit@plt>
    4cb6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    4cbd:	00 00 00 

0000000000004cc0 <open_time_file>:
    4cc0:	f3 0f 1e fa          	endbr64 
    4cc4:	53                   	push   rbx
    4cc5:	48 89 f3             	mov    rbx,rsi
    4cc8:	48 8d 35 8b 27 00 00 	lea    rsi,[rip+0x278b]        # 745a <_IO_stdin_used+0x45a>
    4ccf:	e8 fc d7 ff ff       	call   24d0 <fopen@plt>
    4cd4:	48 89 03             	mov    QWORD PTR [rbx],rax
    4cd7:	48 85 c0             	test   rax,rax
    4cda:	74 1a                	je     4cf6 <open_time_file+0x36>
    4cdc:	48 89 c1             	mov    rcx,rax
    4cdf:	ba 0c 00 00 00       	mov    edx,0xc
    4ce4:	be 01 00 00 00       	mov    esi,0x1
    4ce9:	5b                   	pop    rbx
    4cea:	48 8d 3d 45 28 00 00 	lea    rdi,[rip+0x2845]        # 7536 <_IO_stdin_used+0x536>
    4cf1:	e9 1a d8 ff ff       	jmp    2510 <fwrite@plt>
    4cf6:	48 8d 3d 0b 23 00 00 	lea    rdi,[rip+0x230b]        # 7008 <_IO_stdin_used+0x8>
    4cfd:	e8 de d7 ff ff       	call   24e0 <perror@plt>
    4d02:	bf 01 00 00 00       	mov    edi,0x1
    4d07:	e8 f4 d7 ff ff       	call   2500 <exit@plt>
    4d0c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000004d10 <write_time>:
    4d10:	f3 0f 1e fa          	endbr64 
    4d14:	48 89 f1             	mov    rcx,rsi
    4d17:	48 8d 15 25 28 00 00 	lea    rdx,[rip+0x2825]        # 7543 <_IO_stdin_used+0x543>
    4d1e:	be 01 00 00 00       	mov    esi,0x1
    4d23:	b8 01 00 00 00       	mov    eax,0x1
    4d28:	e9 f3 d7 ff ff       	jmp    2520 <__fprintf_chk@plt>
    4d2d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000004d30 <run_tests>:
    4d30:	f3 0f 1e fa          	endbr64 
    4d34:	4c 8d 54 24 08       	lea    r10,[rsp+0x8]
    4d39:	48 83 e4 e0          	and    rsp,0xffffffffffffffe0
    4d3d:	41 ff 72 f8          	push   QWORD PTR [r10-0x8]
    4d41:	55                   	push   rbp
    4d42:	48 89 e5             	mov    rbp,rsp
    4d45:	41 57                	push   r15
    4d47:	41 56                	push   r14
    4d49:	4c 8d 35 0a 27 00 00 	lea    r14,[rip+0x270a]        # 745a <_IO_stdin_used+0x45a>
    4d50:	41 55                	push   r13
    4d52:	41 54                	push   r12
    4d54:	41 52                	push   r10
    4d56:	53                   	push   rbx
    4d57:	48 8d 9d c0 fb ff ff 	lea    rbx,[rbp-0x440]
    4d5e:	48 81 ec c0 05 00 00 	sub    rsp,0x5c0
    4d65:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    4d6c:	00 00 
    4d6e:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    4d72:	31 c0                	xor    eax,eax
    4d74:	e8 d7 f4 ff ff       	call   4250 <initialize_perf>
    4d79:	8b 05 55 57 00 00    	mov    eax,DWORD PTR [rip+0x5755]        # a4d4 <CORE_NO>
    4d7f:	48 83 ec 08          	sub    rsp,0x8
    4d83:	44 8b 0d 46 57 00 00 	mov    r9d,DWORD PTR [rip+0x5746]        # a4d0 <NUM_BITS>
    4d8a:	4c 8d 05 7f 24 00 00 	lea    r8,[rip+0x247f]        # 7210 <_IO_stdin_used+0x210>
    4d91:	b9 00 01 00 00       	mov    ecx,0x100
    4d96:	ba 01 00 00 00       	mov    edx,0x1
    4d9b:	48 89 df             	mov    rdi,rbx
    4d9e:	50                   	push   rax
    4d9f:	be 00 01 00 00       	mov    esi,0x100
    4da4:	31 c0                	xor    eax,eax
    4da6:	48 89 9d 88 fa ff ff 	mov    QWORD PTR [rbp-0x578],rbx
    4dad:	e8 4e d5 ff ff       	call   2300 <__snprintf_chk@plt>
    4db2:	8b 0d 1c 57 00 00    	mov    ecx,DWORD PTR [rip+0x571c]        # a4d4 <CORE_NO>
    4db8:	31 c0                	xor    eax,eax
    4dba:	48 8d 95 c0 fc ff ff 	lea    rdx,[rbp-0x340]
    4dc1:	44 8b 0d 08 57 00 00 	mov    r9d,DWORD PTR [rip+0x5708]        # a4d0 <NUM_BITS>
    4dc8:	48 89 d7             	mov    rdi,rdx
    4dcb:	48 89 95 c0 fa ff ff 	mov    QWORD PTR [rbp-0x540],rdx
    4dd2:	4c 8d 05 75 27 00 00 	lea    r8,[rip+0x2775]        # 754e <_IO_stdin_used+0x54e>
    4dd9:	89 0c 24             	mov    DWORD PTR [rsp],ecx
    4ddc:	ba 01 00 00 00       	mov    edx,0x1
    4de1:	b9 00 01 00 00       	mov    ecx,0x100
    4de6:	be 00 01 00 00       	mov    esi,0x100
    4deb:	e8 10 d5 ff ff       	call   2300 <__snprintf_chk@plt>
    4df0:	44 8b 05 dd 56 00 00 	mov    r8d,DWORD PTR [rip+0x56dd]        # a4d4 <CORE_NO>
    4df7:	b9 00 01 00 00       	mov    ecx,0x100
    4dfc:	31 c0                	xor    eax,eax
    4dfe:	48 8d b5 c0 fd ff ff 	lea    rsi,[rbp-0x240]
    4e05:	44 8b 0d c4 56 00 00 	mov    r9d,DWORD PTR [rip+0x56c4]        # a4d0 <NUM_BITS>
    4e0c:	ba 01 00 00 00       	mov    edx,0x1
    4e11:	44 89 04 24          	mov    DWORD PTR [rsp],r8d
    4e15:	48 89 f7             	mov    rdi,rsi
    4e18:	4c 8d 05 49 27 00 00 	lea    r8,[rip+0x2749]        # 7568 <_IO_stdin_used+0x568>
    4e1f:	48 89 b5 d0 fa ff ff 	mov    QWORD PTR [rbp-0x530],rsi
    4e26:	be 00 01 00 00       	mov    esi,0x100
    4e2b:	e8 d0 d4 ff ff       	call   2300 <__snprintf_chk@plt>
    4e30:	4c 8d 8d c0 fe ff ff 	lea    r9,[rbp-0x140]
    4e37:	b9 00 01 00 00       	mov    ecx,0x100
    4e3c:	31 c0                	xor    eax,eax
    4e3e:	44 8b 1d 8f 56 00 00 	mov    r11d,DWORD PTR [rip+0x568f]        # a4d4 <CORE_NO>
    4e45:	4c 89 cf             	mov    rdi,r9
    4e48:	4c 89 8d d8 fa ff ff 	mov    QWORD PTR [rbp-0x528],r9
    4e4f:	ba 01 00 00 00       	mov    edx,0x1
    4e54:	44 8b 0d 75 56 00 00 	mov    r9d,DWORD PTR [rip+0x5675]        # a4d0 <NUM_BITS>
    4e5b:	4c 8d 05 d6 23 00 00 	lea    r8,[rip+0x23d6]        # 7238 <_IO_stdin_used+0x238>
    4e62:	be 00 01 00 00       	mov    esi,0x100
    4e67:	44 89 1c 24          	mov    DWORD PTR [rsp],r11d
    4e6b:	e8 90 d4 ff ff       	call   2300 <__snprintf_chk@plt>
    4e70:	4c 89 f6             	mov    rsi,r14
    4e73:	48 89 df             	mov    rdi,rbx
    4e76:	e8 55 d6 ff ff       	call   24d0 <fopen@plt>
    4e7b:	5a                   	pop    rdx
    4e7c:	59                   	pop    rcx
    4e7d:	48 89 85 c8 fa ff ff 	mov    QWORD PTR [rbp-0x538],rax
    4e84:	48 85 c0             	test   rax,rax
    4e87:	0f 84 59 14 00 00    	je     62e6 <run_tests+0x15b6>
    4e8d:	48 8d 1d 8c 51 00 00 	lea    rbx,[rip+0x518c]        # a020 <event_names>
    4e94:	4c 8b bd c8 fa ff ff 	mov    r15,QWORD PTR [rbp-0x538]
    4e9b:	4c 8d 2d ba 25 00 00 	lea    r13,[rip+0x25ba]        # 745c <_IO_stdin_used+0x45c>
    4ea2:	48 89 9d b8 fa ff ff 	mov    QWORD PTR [rbp-0x548],rbx
    4ea9:	4c 8d 63 30          	lea    r12,[rbx+0x30]
    4ead:	0f 1f 00             	nop    DWORD PTR [rax]
    4eb0:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
    4eb3:	4c 89 ea             	mov    rdx,r13
    4eb6:	be 01 00 00 00       	mov    esi,0x1
    4ebb:	4c 89 ff             	mov    rdi,r15
    4ebe:	31 c0                	xor    eax,eax
    4ec0:	48 83 c3 08          	add    rbx,0x8
    4ec4:	e8 57 d6 ff ff       	call   2520 <__fprintf_chk@plt>
    4ec9:	4c 39 e3             	cmp    rbx,r12
    4ecc:	75 e2                	jne    4eb0 <run_tests+0x180>
    4ece:	48 8b b5 c8 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x538]
    4ed5:	bf 0a 00 00 00       	mov    edi,0xa
    4eda:	48 8b 9d b8 fa ff ff 	mov    rbx,QWORD PTR [rbp-0x548]
    4ee1:	e8 2a d5 ff ff       	call   2410 <fputc@plt>
    4ee6:	48 8b bd c0 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x540]
    4eed:	4c 89 f6             	mov    rsi,r14
    4ef0:	e8 db d5 ff ff       	call   24d0 <fopen@plt>
    4ef5:	48 89 85 c0 fa ff ff 	mov    QWORD PTR [rbp-0x540],rax
    4efc:	48 85 c0             	test   rax,rax
    4eff:	0f 84 e1 13 00 00    	je     62e6 <run_tests+0x15b6>
    4f05:	49 89 c7             	mov    r15,rax
    4f08:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    4f0f:	00 
    4f10:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
    4f13:	4c 89 ea             	mov    rdx,r13
    4f16:	be 01 00 00 00       	mov    esi,0x1
    4f1b:	4c 89 ff             	mov    rdi,r15
    4f1e:	31 c0                	xor    eax,eax
    4f20:	48 83 c3 08          	add    rbx,0x8
    4f24:	e8 f7 d5 ff ff       	call   2520 <__fprintf_chk@plt>
    4f29:	4c 39 e3             	cmp    rbx,r12
    4f2c:	75 e2                	jne    4f10 <run_tests+0x1e0>
    4f2e:	48 8b b5 c0 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x540]
    4f35:	bf 0a 00 00 00       	mov    edi,0xa
    4f3a:	4c 8d a5 30 fb ff ff 	lea    r12,[rbp-0x4d0]
    4f41:	4c 8d ad 70 fb ff ff 	lea    r13,[rbp-0x490]
    4f48:	e8 c3 d4 ff ff       	call   2410 <fputc@plt>
    4f4d:	48 8b bd d0 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x530]
    4f54:	4c 89 f6             	mov    rsi,r14
    4f57:	e8 74 d5 ff ff       	call   24d0 <fopen@plt>
    4f5c:	48 8b bd d8 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x528]
    4f63:	4c 89 f6             	mov    rsi,r14
    4f66:	48 89 85 40 fa ff ff 	mov    QWORD PTR [rbp-0x5c0],rax
    4f6d:	e8 5e d5 ff ff       	call   24d0 <fopen@plt>
    4f72:	4c 89 e7             	mov    rdi,r12
    4f75:	48 89 85 20 fa ff ff 	mov    QWORD PTR [rbp-0x5e0],rax
    4f7c:	e8 bf d5 ff ff       	call   2540 <__gmpz_init@plt>
    4f81:	31 c0                	xor    eax,eax
    4f83:	e8 a8 d8 ff ff       	call   2830 <generate_seed>
    4f88:	4c 89 ef             	mov    rdi,r13
    4f8b:	49 89 c6             	mov    r14,rax
    4f8e:	e8 ad d4 ff ff       	call   2440 <__gmp_randinit_default@plt>
    4f93:	4c 89 f6             	mov    rsi,r14
    4f96:	4c 89 ef             	mov    rdi,r13
    4f99:	4c 8d 35 48 51 00 00 	lea    r14,[rip+0x5148]        # a0e8 <fd+0x18>
    4fa0:	e8 4b d3 ff ff       	call   22f0 <__gmp_randseed_ui@plt>
    4fa5:	48 63 15 24 55 00 00 	movsxd rdx,DWORD PTR [rip+0x5524]        # a4d0 <NUM_BITS>
    4fac:	4c 89 ee             	mov    rsi,r13
    4faf:	4c 89 e7             	mov    rdi,r12
    4fb2:	e8 b9 d5 ff ff       	call   2570 <__gmpz_urandomb@plt>
    4fb7:	4c 89 e2             	mov    rdx,r12
    4fba:	be 0a 00 00 00       	mov    esi,0xa
    4fbf:	31 ff                	xor    edi,edi
    4fc1:	e8 ea d3 ff ff       	call   23b0 <__gmpz_get_str@plt>
    4fc6:	48 89 c7             	mov    rdi,rax
    4fc9:	e8 d2 d3 ff ff       	call   23a0 <strlen@plt>
    4fce:	8b 15 fc 54 00 00    	mov    edx,DWORD PTR [rip+0x54fc]        # a4d0 <NUM_BITS>
    4fd4:	bf 01 00 00 00       	mov    edi,0x1
    4fd9:	48 8d 35 a6 25 00 00 	lea    rsi,[rip+0x25a6]        # 7586 <_IO_stdin_used+0x586>
    4fe0:	89 c3                	mov    ebx,eax
    4fe2:	89 85 e8 fa ff ff    	mov    DWORD PTR [rbp-0x518],eax
    4fe8:	31 c0                	xor    eax,eax
    4fea:	e8 c1 d4 ff ff       	call   24b0 <__printf_chk@plt>
    4fef:	89 da                	mov    edx,ebx
    4ff1:	48 8d 35 a3 25 00 00 	lea    rsi,[rip+0x25a3]        # 759b <_IO_stdin_used+0x59b>
    4ff8:	31 c0                	xor    eax,eax
    4ffa:	bf 01 00 00 00       	mov    edi,0x1
    4fff:	e8 ac d4 ff ff       	call   24b0 <__printf_chk@plt>
    5004:	48 8d 3d a7 25 00 00 	lea    rdi,[rip+0x25a7]        # 75b2 <_IO_stdin_used+0x5b2>
    500b:	e8 40 d3 ff ff       	call   2350 <puts@plt>
    5010:	48 8b 3d b1 54 00 00 	mov    rdi,QWORD PTR [rip+0x54b1]        # a4c8 <sub_space>
    5017:	ba 00 00 00 40       	mov    edx,0x40000000
    501c:	31 f6                	xor    esi,esi
    501e:	e8 bd d3 ff ff       	call   23e0 <memset@plt>
    5023:	48 8b 3d 96 54 00 00 	mov    rdi,QWORD PTR [rip+0x5496]        # a4c0 <borrow_space>
    502a:	ba 00 00 00 40       	mov    edx,0x40000000
    502f:	31 f6                	xor    esi,esi
    5031:	c7 05 a1 54 00 00 00 	mov    DWORD PTR [rip+0x54a1],0x0        # a4dc <sub_space_ptr>
    5038:	00 00 00 
    503b:	e8 a0 d3 ff ff       	call   23e0 <memset@plt>
    5040:	48 8d 3d 79 25 00 00 	lea    rdi,[rip+0x2579]        # 75c0 <_IO_stdin_used+0x5c0>
    5047:	c7 05 87 54 00 00 00 	mov    DWORD PTR [rip+0x5487],0x0        # a4d8 <borrow_space_ptr>
    504e:	00 00 00 
    5051:	e8 fa d2 ff ff       	call   2350 <puts@plt>
    5056:	ba 50 c3 00 00       	mov    edx,0xc350
    505b:	48 8d 35 f6 21 00 00 	lea    rsi,[rip+0x21f6]        # 7258 <_IO_stdin_used+0x258>
    5062:	31 c0                	xor    eax,eax
    5064:	bf 01 00 00 00       	mov    edi,0x1
    5069:	e8 42 d4 ff ff       	call   24b0 <__printf_chk@plt>
    506e:	48 8d bd 00 fb ff ff 	lea    rdi,[rbp-0x500]
    5075:	4c 8d 95 f8 fa ff ff 	lea    r10,[rbp-0x508]
    507c:	c7 85 6c fa ff ff 00 	mov    DWORD PTR [rbp-0x594],0x0
    5083:	00 00 00 
    5086:	48 8d 85 e8 fa ff ff 	lea    rax,[rbp-0x518]
    508d:	48 8d 8d f0 fa ff ff 	lea    rcx,[rbp-0x510]
    5094:	48 c7 85 38 fa ff ff 	mov    QWORD PTR [rbp-0x5c8],0x0
    509b:	00 00 00 00 
    509f:	c5 d1 57 ed          	vxorpd xmm5,xmm5,xmm5
    50a3:	48 8d b5 10 fb ff ff 	lea    rsi,[rbp-0x4f0]
    50aa:	48 89 bd a0 fa ff ff 	mov    QWORD PTR [rbp-0x560],rdi
    50b1:	48 8d 95 ec fa ff ff 	lea    rdx,[rbp-0x514]
    50b8:	48 c7 85 48 fa ff ff 	mov    QWORD PTR [rbp-0x5b8],0x0
    50bf:	00 00 00 00 
    50c3:	4c 89 95 a8 fa ff ff 	mov    QWORD PTR [rbp-0x558],r10
    50ca:	48 89 85 90 fa ff ff 	mov    QWORD PTR [rbp-0x570],rax
    50d1:	48 89 8d 28 fa ff ff 	mov    QWORD PTR [rbp-0x5d8],rcx
    50d8:	48 89 b5 98 fa ff ff 	mov    QWORD PTR [rbp-0x568],rsi
    50df:	48 89 95 30 fa ff ff 	mov    QWORD PTR [rbp-0x5d0],rdx
    50e6:	89 da                	mov    edx,ebx
    50e8:	c5 fb 11 ad b0 fa ff 	vmovsd QWORD PTR [rbp-0x550],xmm5
    50ef:	ff 
    50f0:	c5 fb 11 ad b8 fa ff 	vmovsd QWORD PTR [rbp-0x548],xmm5
    50f7:	ff 
    50f8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    50ff:	00 
    5100:	48 8b b5 a0 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x560]
    5107:	48 8b bd a8 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x558]
    510e:	e8 7d f8 ff ff       	call   4990 <generate_no_borrow_propagation>
    5113:	48 8b 8d 90 fa ff ff 	mov    rcx,QWORD PTR [rbp-0x570]
    511a:	48 8b b5 a0 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x560]
    5121:	48 8b bd a8 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x558]
    5128:	48 89 ca             	mov    rdx,rcx
    512b:	e8 00 ef ff ff       	call   4030 <make_equidistant>
    5130:	44 8b 85 e8 fa ff ff 	mov    r8d,DWORD PTR [rbp-0x518]
    5137:	48 8b b5 30 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x5d0]
    513e:	48 8b bd f8 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x508]
    5145:	44 89 85 ec fa ff ff 	mov    DWORD PTR [rbp-0x514],r8d
    514c:	44 89 85 f0 fa ff ff 	mov    DWORD PTR [rbp-0x510],r8d
    5153:	e8 78 e8 ff ff       	call   39d0 <returnLimbs>
    5158:	48 8b bd 00 fb ff ff 	mov    rdi,QWORD PTR [rbp-0x500]
    515f:	48 8b b5 28 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x5d8]
    5166:	49 89 c5             	mov    r13,rax
    5169:	e8 62 e8 ff ff       	call   39d0 <returnLimbs>
    516e:	8b bd ec fa ff ff    	mov    edi,DWORD PTR [rbp-0x514]
    5174:	4c 63 0d 61 53 00 00 	movsxd r9,DWORD PTR [rip+0x5361]        # a4dc <sub_space_ptr>
    517b:	4c 8b 3d 46 53 00 00 	mov    r15,QWORD PTR [rip+0x5346]        # a4c8 <sub_space>
    5182:	49 89 c4             	mov    r12,rax
    5185:	89 bd f4 fa ff ff    	mov    DWORD PTR [rbp-0x50c],edi
    518b:	83 c7 1f             	add    edi,0x1f
    518e:	4d 89 cb             	mov    r11,r9
    5191:	83 e7 e0             	and    edi,0xffffffe0
    5194:	01 3d 3e 53 00 00    	add    DWORD PTR [rip+0x533e],edi        # a4d8 <borrow_space_ptr>
    519a:	4b 8d 1c 8f          	lea    rbx,[r15+r9*4]
    519e:	41 01 fb             	add    r11d,edi
    51a1:	4c 8d 3d 28 4f 00 00 	lea    r15,[rip+0x4f28]        # a0d0 <fd>
    51a8:	48 89 9d 08 fb ff ff 	mov    QWORD PTR [rbp-0x4f8],rbx
    51af:	44 89 1d 26 53 00 00 	mov    DWORD PTR [rip+0x5326],r11d        # a4dc <sub_space_ptr>
    51b6:	4c 89 fb             	mov    rbx,r15
    51b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    51c0:	8b 3b                	mov    edi,DWORD PTR [rbx]
    51c2:	31 d2                	xor    edx,edx
    51c4:	be 03 24 00 00       	mov    esi,0x2403
    51c9:	31 c0                	xor    eax,eax
    51cb:	48 83 c3 04          	add    rbx,0x4
    51cf:	e8 1c d2 ff ff       	call   23f0 <ioctl@plt>
    51d4:	8b 7b fc             	mov    edi,DWORD PTR [rbx-0x4]
    51d7:	31 d2                	xor    edx,edx
    51d9:	be 00 24 00 00       	mov    esi,0x2400
    51de:	31 c0                	xor    eax,eax
    51e0:	e8 0b d2 ff ff       	call   23f0 <ioctl@plt>
    51e5:	4c 39 f3             	cmp    rbx,r14
    51e8:	75 d6                	jne    51c0 <run_tests+0x490>
    51ea:	48 8b b5 98 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x568]
    51f1:	c5 f9 ef c0          	vpxor  xmm0,xmm0,xmm0
    51f5:	bf 04 00 00 00       	mov    edi,0x4
    51fa:	c5 f9 7f 85 10 fb ff 	vmovdqa XMMWORD PTR [rbp-0x4f0],xmm0
    5201:	ff 
    5202:	e8 59 d1 ff ff       	call   2360 <clock_gettime@plt>
    5207:	83 f8 ff             	cmp    eax,0xffffffff
    520a:	0f 84 c0 10 00 00    	je     62d0 <run_tests+0x15a0>
    5210:	0f ae e8             	lfence 
    5213:	0f 31                	rdtsc  
    5215:	41 89 c2             	mov    r10d,eax
    5218:	48 c1 e2 20          	shl    rdx,0x20
    521c:	8b 8d ec fa ff ff    	mov    ecx,DWORD PTR [rbp-0x514]
    5222:	4c 89 e6             	mov    rsi,r12
    5225:	4c 09 d2             	or     rdx,r10
    5228:	4c 8d 85 f4 fa ff ff 	lea    r8,[rbp-0x50c]
    522f:	4c 89 ef             	mov    rdi,r13
    5232:	48 89 95 d8 fa ff ff 	mov    QWORD PTR [rbp-0x528],rdx
    5239:	48 8d 95 08 fb ff ff 	lea    rdx,[rbp-0x4f8]
    5240:	4c 89 85 58 fa ff ff 	mov    QWORD PTR [rbp-0x5a8],r8
    5247:	e8 c4 d8 ff ff       	call   2b10 <sub_n>
    524c:	0f ae e8             	lfence 
    524f:	0f 31                	rdtsc  
    5251:	48 c1 e2 20          	shl    rdx,0x20
    5255:	89 c1                	mov    ecx,eax
    5257:	c5 c9 ef f6          	vpxor  xmm6,xmm6,xmm6
    525b:	bf 04 00 00 00       	mov    edi,0x4
    5260:	48 89 d3             	mov    rbx,rdx
    5263:	48 8d b5 20 fb ff ff 	lea    rsi,[rbp-0x4e0]
    526a:	c5 f9 7f b5 20 fb ff 	vmovdqa XMMWORD PTR [rbp-0x4e0],xmm6
    5271:	ff 
    5272:	48 09 cb             	or     rbx,rcx
    5275:	48 89 b5 80 fa ff ff 	mov    QWORD PTR [rbp-0x580],rsi
    527c:	e8 df d0 ff ff       	call   2360 <clock_gettime@plt>
    5281:	83 f8 ff             	cmp    eax,0xffffffff
    5284:	0f 84 30 10 00 00    	je     62ba <run_tests+0x158a>
    528a:	4c 8d 2d 3f 4e 00 00 	lea    r13,[rip+0x4e3f]        # a0d0 <fd>
    5291:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    5298:	41 8b 7d 00          	mov    edi,DWORD PTR [r13+0x0]
    529c:	31 d2                	xor    edx,edx
    529e:	31 c0                	xor    eax,eax
    52a0:	be 01 24 00 00       	mov    esi,0x2401
    52a5:	e8 46 d1 ff ff       	call   23f0 <ioctl@plt>
    52aa:	83 f8 ff             	cmp    eax,0xffffffff
    52ad:	0f 84 f1 0f 00 00    	je     62a4 <run_tests+0x1574>
    52b3:	49 83 c5 04          	add    r13,0x4
    52b7:	4d 39 f5             	cmp    r13,r14
    52ba:	75 dc                	jne    5298 <run_tests+0x568>
    52bc:	4c 8d ad 90 fb ff ff 	lea    r13,[rbp-0x470]
    52c3:	4d 89 ec             	mov    r12,r13
    52c6:	4c 89 ef             	mov    rdi,r13
    52c9:	4c 89 ad 60 fa ff ff 	mov    QWORD PTR [rbp-0x5a0],r13
    52d0:	e8 4b f1 ff ff       	call   4420 <read_perf>
    52d5:	48 89 9d d0 fa ff ff 	mov    QWORD PTR [rbp-0x530],rbx
    52dc:	4c 89 eb             	mov    rbx,r13
    52df:	4c 8b ad c8 fa ff ff 	mov    r13,QWORD PTR [rbp-0x538]
    52e6:	4c 89 a5 78 fa ff ff 	mov    QWORD PTR [rbp-0x588],r12
    52ed:	4c 8b a5 88 fa ff ff 	mov    r12,QWORD PTR [rbp-0x578]
    52f4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    52f8:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
    52fb:	48 8d 15 7a 21 00 00 	lea    rdx,[rip+0x217a]        # 747c <_IO_stdin_used+0x47c>
    5302:	4c 89 ef             	mov    rdi,r13
    5305:	31 c0                	xor    eax,eax
    5307:	be 01 00 00 00       	mov    esi,0x1
    530c:	48 83 c3 08          	add    rbx,0x8
    5310:	e8 0b d2 ff ff       	call   2520 <__fprintf_chk@plt>
    5315:	4c 39 e3             	cmp    rbx,r12
    5318:	75 de                	jne    52f8 <run_tests+0x5c8>
    531a:	48 8b b5 c8 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x538]
    5321:	bf 0a 00 00 00       	mov    edi,0xa
    5326:	48 8b 9d d0 fa ff ff 	mov    rbx,QWORD PTR [rbp-0x530]
    532d:	4c 8b a5 78 fa ff ff 	mov    r12,QWORD PTR [rbp-0x588]
    5334:	e8 d7 d0 ff ff       	call   2410 <fputc@plt>
    5339:	4c 8b 8d 20 fb ff ff 	mov    r9,QWORD PTR [rbp-0x4e0]
    5340:	4c 8b 9d 28 fb ff ff 	mov    r11,QWORD PTR [rbp-0x4d8]
    5347:	48 2b 9d d8 fa ff ff 	sub    rbx,QWORD PTR [rbp-0x528]
    534e:	4c 2b 8d 10 fb ff ff 	sub    r9,QWORD PTR [rbp-0x4f0]
    5355:	4c 2b 9d 18 fb ff ff 	sub    r11,QWORD PTR [rbp-0x4e8]
    535c:	79 0b                	jns    5369 <run_tests+0x639>
    535e:	49 83 e9 01          	sub    r9,0x1
    5362:	49 81 c3 00 ca 9a 3b 	add    r11,0x3b9aca00
    5369:	49 69 f9 00 ca 9a 3b 	imul   rdi,r9,0x3b9aca00
    5370:	c5 c1 57 ff          	vxorpd xmm7,xmm7,xmm7
    5374:	48 89 d9             	mov    rcx,rbx
    5377:	be 01 00 00 00       	mov    esi,0x1
    537c:	48 8d 15 c0 21 00 00 	lea    rdx,[rip+0x21c0]        # 7543 <_IO_stdin_used+0x543>
    5383:	b8 01 00 00 00       	mov    eax,0x1
    5388:	4c 01 df             	add    rdi,r11
    538b:	c4 e1 c3 2a c7       	vcvtsi2sd xmm0,xmm7,rdi
    5390:	48 8b bd 40 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x5c0]
    5397:	e8 84 d1 ff ff       	call   2520 <__fprintf_chk@plt>
    539c:	4c 8b 95 20 fb ff ff 	mov    r10,QWORD PTR [rbp-0x4e0]
    53a3:	4c 8b 85 28 fb ff ff 	mov    r8,QWORD PTR [rbp-0x4d8]
    53aa:	4c 2b 95 10 fb ff ff 	sub    r10,QWORD PTR [rbp-0x4f0]
    53b1:	4c 2b 85 18 fb ff ff 	sub    r8,QWORD PTR [rbp-0x4e8]
    53b8:	79 0b                	jns    53c5 <run_tests+0x695>
    53ba:	49 83 ea 01          	sub    r10,0x1
    53be:	49 81 c0 00 ca 9a 3b 	add    r8,0x3b9aca00
    53c5:	49 69 c2 00 ca 9a 3b 	imul   rax,r10,0x3b9aca00
    53cc:	c5 e1 57 db          	vxorpd xmm3,xmm3,xmm3
    53d0:	be 01 00 00 00       	mov    esi,0x1
    53d5:	48 01 9d 48 fa ff ff 	add    QWORD PTR [rbp-0x5b8],rbx
    53dc:	8b 9d e8 fa ff ff    	mov    ebx,DWORD PTR [rbp-0x518]
    53e2:	4c 01 c0             	add    rax,r8
    53e5:	c4 e1 e3 2a c8       	vcvtsi2sd xmm1,xmm3,rax
    53ea:	8d 43 01             	lea    eax,[rbx+0x1]
    53ed:	c5 f3 58 95 b8 fa ff 	vaddsd xmm2,xmm1,QWORD PTR [rbp-0x548]
    53f4:	ff 
    53f5:	48 98                	cdqe   
    53f7:	48 89 c7             	mov    rdi,rax
    53fa:	48 89 85 78 fa ff ff 	mov    QWORD PTR [rbp-0x588],rax
    5401:	c5 fb 11 95 b8 fa ff 	vmovsd QWORD PTR [rbp-0x548],xmm2
    5408:	ff 
    5409:	e8 42 d0 ff ff       	call   2450 <calloc@plt>
    540e:	4c 63 cb             	movsxd r9,ebx
    5411:	4c 89 8d d8 fa ff ff 	mov    QWORD PTR [rbp-0x528],r9
    5418:	49 89 c0             	mov    r8,rax
    541b:	85 db                	test   ebx,ebx
    541d:	0f 8e 15 0d 00 00    	jle    6138 <run_tests+0x1408>
    5423:	48 8b 95 f8 fa ff ff 	mov    rdx,QWORD PTR [rbp-0x508]
    542a:	4e 8d 1c 8d 00 00 00 	lea    r11,[r9*4+0x0]
    5431:	00 
    5432:	44 8d 53 ff          	lea    r10d,[rbx-0x1]
    5436:	41 89 dd             	mov    r13d,ebx
    5439:	41 83 fa 0e          	cmp    r10d,0xe
    543d:	4a 8d 0c 1a          	lea    rcx,[rdx+r11*1]
    5441:	0f 97 85 d0 fa ff ff 	seta   BYTE PTR [rbp-0x530]
    5448:	0f b6 b5 d0 fa ff ff 	movzx  esi,BYTE PTR [rbp-0x530]
    544f:	48 39 c8             	cmp    rax,rcx
    5452:	4a 8d 04 08          	lea    rax,[rax+r9*1]
    5456:	40 0f 93 c7          	setae  dil
    545a:	48 39 c2             	cmp    rdx,rax
    545d:	41 0f 93 c1          	setae  r9b
    5461:	41 08 f9             	or     r9b,dil
    5464:	0f 84 ae 0b 00 00    	je     6018 <run_tests+0x12e8>
    546a:	40 84 f6             	test   sil,sil
    546d:	0f 84 a5 0b 00 00    	je     6018 <run_tests+0x12e8>
    5473:	41 83 fa 1e          	cmp    r10d,0x1e
    5477:	0f 86 e7 0c 00 00    	jbe    6164 <run_tests+0x1434>
    547d:	89 de                	mov    esi,ebx
    547f:	48 8d ba 80 00 00 00 	lea    rdi,[rdx+0x80]
    5486:	48 89 d0             	mov    rax,rdx
    5489:	4c 89 c1             	mov    rcx,r8
    548c:	c1 ee 05             	shr    esi,0x5
    548f:	83 ee 01             	sub    esi,0x1
    5492:	48 c1 e6 07          	shl    rsi,0x7
    5496:	48 01 fe             	add    rsi,rdi
    5499:	49 89 f1             	mov    r9,rsi
    549c:	49 29 d1             	sub    r9,rdx
    549f:	41 81 e1 80 00 00 00 	and    r9d,0x80
    54a6:	74 68                	je     5510 <run_tests+0x7e0>
    54a8:	c5 fd 6f 35 70 22 00 	vmovdqa ymm6,YMMWORD PTR [rip+0x2270]        # 7720 <__PRETTY_FUNCTION__.0+0x93>
    54af:	00 
    54b0:	c5 cd db 22          	vpand  ymm4,ymm6,YMMWORD PTR [rdx]
    54b4:	48 89 f8             	mov    rax,rdi
    54b7:	49 8d 48 20          	lea    rcx,[r8+0x20]
    54bb:	c5 4d db 42 20       	vpand  ymm8,ymm6,YMMWORD PTR [rdx+0x20]
    54c0:	c5 4d db 5a 40       	vpand  ymm11,ymm6,YMMWORD PTR [rdx+0x40]
    54c5:	c5 4d db 6a 60       	vpand  ymm13,ymm6,YMMWORD PTR [rdx+0x60]
    54ca:	c4 42 5d 2b c8       	vpackusdw ymm9,ymm4,ymm8
    54cf:	c4 42 25 2b f5       	vpackusdw ymm14,ymm11,ymm13
    54d4:	c4 43 fd 00 d1 d8    	vpermq ymm10,ymm9,0xd8
    54da:	c5 ad db 2d 5e 22 00 	vpand  ymm5,ymm10,YMMWORD PTR [rip+0x225e]        # 7740 <__PRETTY_FUNCTION__.0+0xb3>
    54e1:	00 
    54e2:	c4 43 fd 00 fe d8    	vpermq ymm15,ymm14,0xd8
    54e8:	c5 85 db 05 50 22 00 	vpand  ymm0,ymm15,YMMWORD PTR [rip+0x2250]        # 7740 <__PRETTY_FUNCTION__.0+0xb3>
    54ef:	00 
    54f0:	c5 d5 67 c8          	vpackuswb ymm1,ymm5,ymm0
    54f4:	c4 e3 fd 00 d1 d8    	vpermq ymm2,ymm1,0xd8
    54fa:	c5 ed fc 35 5e 22 00 	vpaddb ymm6,ymm2,YMMWORD PTR [rip+0x225e]        # 7760 <__PRETTY_FUNCTION__.0+0xd3>
    5501:	00 
    5502:	c4 c1 7e 7f 30       	vmovdqu YMMWORD PTR [r8],ymm6
    5507:	48 39 fe             	cmp    rsi,rdi
    550a:	0f 84 cf 00 00 00    	je     55df <run_tests+0x8af>
    5510:	c5 7d 6f 05 08 22 00 	vmovdqa ymm8,YMMWORD PTR [rip+0x2208]        # 7720 <__PRETTY_FUNCTION__.0+0x93>
    5517:	00 
    5518:	c5 bd db 38          	vpand  ymm7,ymm8,YMMWORD PTR [rax]
    551c:	48 05 00 01 00 00    	add    rax,0x100
    5522:	48 83 c1 40          	add    rcx,0x40
    5526:	c5 3d db a0 40 ff ff 	vpand  ymm12,ymm8,YMMWORD PTR [rax-0xc0]
    552d:	ff 
    552e:	c5 3d db a8 60 ff ff 	vpand  ymm13,ymm8,YMMWORD PTR [rax-0xa0]
    5535:	ff 
    5536:	c5 3d db 88 20 ff ff 	vpand  ymm9,ymm8,YMMWORD PTR [rax-0xe0]
    553d:	ff 
    553e:	c5 7d 7f c4          	vmovdqa ymm4,ymm8
    5542:	c4 41 7d 6f d8       	vmovdqa ymm11,ymm8
    5547:	c4 42 1d 2b f5       	vpackusdw ymm14,ymm12,ymm13
    554c:	c4 42 45 2b d1       	vpackusdw ymm10,ymm7,ymm9
    5551:	c4 43 fd 00 fe d8    	vpermq ymm15,ymm14,0xd8
    5557:	c5 85 db 05 e1 21 00 	vpand  ymm0,ymm15,YMMWORD PTR [rip+0x21e1]        # 7740 <__PRETTY_FUNCTION__.0+0xb3>
    555e:	00 
    555f:	c4 c3 fd 00 da d8    	vpermq ymm3,ymm10,0xd8
    5565:	c5 e5 db 2d d3 21 00 	vpand  ymm5,ymm3,YMMWORD PTR [rip+0x21d3]        # 7740 <__PRETTY_FUNCTION__.0+0xb3>
    556c:	00 
    556d:	c5 d5 67 c8          	vpackuswb ymm1,ymm5,ymm0
    5571:	c4 e3 fd 00 d1 d8    	vpermq ymm2,ymm1,0xd8
    5577:	c5 ed fc 35 e1 21 00 	vpaddb ymm6,ymm2,YMMWORD PTR [rip+0x21e1]        # 7760 <__PRETTY_FUNCTION__.0+0xd3>
    557e:	00 
    557f:	c5 fe 7f 71 c0       	vmovdqu YMMWORD PTR [rcx-0x40],ymm6
    5584:	c5 3d db 50 80       	vpand  ymm10,ymm8,YMMWORD PTR [rax-0x80]
    5589:	c5 dd db 60 c0       	vpand  ymm4,ymm4,YMMWORD PTR [rax-0x40]
    558e:	c5 3d db 40 a0       	vpand  ymm8,ymm8,YMMWORD PTR [rax-0x60]
    5593:	c5 25 db 58 e0       	vpand  ymm11,ymm11,YMMWORD PTR [rax-0x20]
    5598:	c4 c2 2d 2b d8       	vpackusdw ymm3,ymm10,ymm8
    559d:	c4 c2 5d 2b fb       	vpackusdw ymm7,ymm4,ymm11
    55a2:	c4 63 fd 00 e3 d8    	vpermq ymm12,ymm3,0xd8
    55a8:	c4 63 fd 00 ef d8    	vpermq ymm13,ymm7,0xd8
    55ae:	c5 1d db 35 8a 21 00 	vpand  ymm14,ymm12,YMMWORD PTR [rip+0x218a]        # 7740 <__PRETTY_FUNCTION__.0+0xb3>
    55b5:	00 
    55b6:	c5 15 db 3d 82 21 00 	vpand  ymm15,ymm13,YMMWORD PTR [rip+0x2182]        # 7740 <__PRETTY_FUNCTION__.0+0xb3>
    55bd:	00 
    55be:	c4 c1 0d 67 ef       	vpackuswb ymm5,ymm14,ymm15
    55c3:	c4 e3 fd 00 c5 d8    	vpermq ymm0,ymm5,0xd8
    55c9:	c5 fd fc 0d 8f 21 00 	vpaddb ymm1,ymm0,YMMWORD PTR [rip+0x218f]        # 7760 <__PRETTY_FUNCTION__.0+0xd3>
    55d0:	00 
    55d1:	c5 fe 7f 49 e0       	vmovdqu YMMWORD PTR [rcx-0x20],ymm1
    55d6:	48 39 c6             	cmp    rsi,rax
    55d9:	0f 85 31 ff ff ff    	jne    5510 <run_tests+0x7e0>
    55df:	41 89 d9             	mov    r9d,ebx
    55e2:	41 83 e1 e0          	and    r9d,0xffffffe0
    55e6:	44 89 c8             	mov    eax,r9d
    55e9:	44 39 cb             	cmp    ebx,r9d
    55ec:	0f 84 03 0c 00 00    	je     61f5 <run_tests+0x14c5>
    55f2:	89 de                	mov    esi,ebx
    55f4:	44 29 ce             	sub    esi,r9d
    55f7:	8d 7e ff             	lea    edi,[rsi-0x1]
    55fa:	83 ff 0e             	cmp    edi,0xe
    55fd:	0f 86 76 0b 00 00    	jbe    6179 <run_tests+0x1449>
    5603:	c5 f8 77             	vzeroupper 
    5606:	c5 f9 6f 2d 12 21 00 	vmovdqa xmm5,XMMWORD PTR [rip+0x2112]        # 7720 <__PRETTY_FUNCTION__.0+0x93>
    560d:	00 
    560e:	4a 8d 0c 8a          	lea    rcx,[rdx+r9*4]
    5612:	c5 d1 db 11          	vpand  xmm2,xmm5,XMMWORD PTR [rcx]
    5616:	c5 51 db 49 10       	vpand  xmm9,xmm5,XMMWORD PTR [rcx+0x10]
    561b:	c5 51 db 41 20       	vpand  xmm8,xmm5,XMMWORD PTR [rcx+0x20]
    5620:	c5 51 db 61 30       	vpand  xmm12,xmm5,XMMWORD PTR [rcx+0x30]
    5625:	c4 42 69 2b d1       	vpackusdw xmm10,xmm2,xmm9
    562a:	c5 29 db 1d 0e 21 00 	vpand  xmm11,xmm10,XMMWORD PTR [rip+0x210e]        # 7740 <__PRETTY_FUNCTION__.0+0xb3>
    5631:	00 
    5632:	c4 c2 39 2b e4       	vpackusdw xmm4,xmm8,xmm12
    5637:	c5 59 db 2d 01 21 00 	vpand  xmm13,xmm4,XMMWORD PTR [rip+0x2101]        # 7740 <__PRETTY_FUNCTION__.0+0xb3>
    563e:	00 
    563f:	c4 41 21 67 f5       	vpackuswb xmm14,xmm11,xmm13
    5644:	c5 09 fc 3d 14 21 00 	vpaddb xmm15,xmm14,XMMWORD PTR [rip+0x2114]        # 7760 <__PRETTY_FUNCTION__.0+0xd3>
    564b:	00 
    564c:	c4 01 7a 7f 3c 08    	vmovdqu XMMWORD PTR [r8+r9*1],xmm15
    5652:	41 89 f1             	mov    r9d,esi
    5655:	41 83 e1 f0          	and    r9d,0xfffffff0
    5659:	44 01 c8             	add    eax,r9d
    565c:	41 39 f1             	cmp    r9d,esi
    565f:	0f 84 8b 01 00 00    	je     57f0 <run_tests+0xac0>
    5665:	48 63 c8             	movsxd rcx,eax
    5668:	44 8d 48 01          	lea    r9d,[rax+0x1]
    566c:	0f b6 3c 8a          	movzx  edi,BYTE PTR [rdx+rcx*4]
    5670:	48 8d 34 8d 00 00 00 	lea    rsi,[rcx*4+0x0]
    5677:	00 
    5678:	83 c7 30             	add    edi,0x30
    567b:	41 88 3c 08          	mov    BYTE PTR [r8+rcx*1],dil
    567f:	44 39 cb             	cmp    ebx,r9d
    5682:	0f 8e 68 01 00 00    	jle    57f0 <run_tests+0xac0>
    5688:	0f b6 7c 32 04       	movzx  edi,BYTE PTR [rdx+rsi*1+0x4]
    568d:	49 63 c9             	movsxd rcx,r9d
    5690:	44 8d 48 02          	lea    r9d,[rax+0x2]
    5694:	83 c7 30             	add    edi,0x30
    5697:	41 88 3c 08          	mov    BYTE PTR [r8+rcx*1],dil
    569b:	44 39 cb             	cmp    ebx,r9d
    569e:	0f 8e 4c 01 00 00    	jle    57f0 <run_tests+0xac0>
    56a4:	0f b6 7c 32 08       	movzx  edi,BYTE PTR [rdx+rsi*1+0x8]
    56a9:	49 63 c9             	movsxd rcx,r9d
    56ac:	44 8d 48 03          	lea    r9d,[rax+0x3]
    56b0:	83 c7 30             	add    edi,0x30
    56b3:	41 88 3c 08          	mov    BYTE PTR [r8+rcx*1],dil
    56b7:	44 39 cb             	cmp    ebx,r9d
    56ba:	0f 8e 30 01 00 00    	jle    57f0 <run_tests+0xac0>
    56c0:	0f b6 7c 32 0c       	movzx  edi,BYTE PTR [rdx+rsi*1+0xc]
    56c5:	49 63 c9             	movsxd rcx,r9d
    56c8:	44 8d 48 04          	lea    r9d,[rax+0x4]
    56cc:	83 c7 30             	add    edi,0x30
    56cf:	41 88 3c 08          	mov    BYTE PTR [r8+rcx*1],dil
    56d3:	44 39 cb             	cmp    ebx,r9d
    56d6:	0f 8e 14 01 00 00    	jle    57f0 <run_tests+0xac0>
    56dc:	0f b6 7c 32 10       	movzx  edi,BYTE PTR [rdx+rsi*1+0x10]
    56e1:	49 63 c9             	movsxd rcx,r9d
    56e4:	44 8d 48 05          	lea    r9d,[rax+0x5]
    56e8:	83 c7 30             	add    edi,0x30
    56eb:	41 88 3c 08          	mov    BYTE PTR [r8+rcx*1],dil
    56ef:	44 39 cb             	cmp    ebx,r9d
    56f2:	0f 8e f8 00 00 00    	jle    57f0 <run_tests+0xac0>
    56f8:	0f b6 7c 32 14       	movzx  edi,BYTE PTR [rdx+rsi*1+0x14]
    56fd:	49 63 c9             	movsxd rcx,r9d
    5700:	44 8d 48 06          	lea    r9d,[rax+0x6]
    5704:	83 c7 30             	add    edi,0x30
    5707:	41 88 3c 08          	mov    BYTE PTR [r8+rcx*1],dil
    570b:	44 39 cb             	cmp    ebx,r9d
    570e:	0f 8e dc 00 00 00    	jle    57f0 <run_tests+0xac0>
    5714:	0f b6 7c 32 18       	movzx  edi,BYTE PTR [rdx+rsi*1+0x18]
    5719:	49 63 c9             	movsxd rcx,r9d
    571c:	44 8d 48 07          	lea    r9d,[rax+0x7]
    5720:	83 c7 30             	add    edi,0x30
    5723:	41 88 3c 08          	mov    BYTE PTR [r8+rcx*1],dil
    5727:	44 39 cb             	cmp    ebx,r9d
    572a:	0f 8e c0 00 00 00    	jle    57f0 <run_tests+0xac0>
    5730:	0f b6 7c 32 1c       	movzx  edi,BYTE PTR [rdx+rsi*1+0x1c]
    5735:	49 63 c9             	movsxd rcx,r9d
    5738:	44 8d 48 08          	lea    r9d,[rax+0x8]
    573c:	83 c7 30             	add    edi,0x30
    573f:	41 88 3c 08          	mov    BYTE PTR [r8+rcx*1],dil
    5743:	44 39 cb             	cmp    ebx,r9d
    5746:	0f 8e a4 00 00 00    	jle    57f0 <run_tests+0xac0>
    574c:	0f b6 7c 32 20       	movzx  edi,BYTE PTR [rdx+rsi*1+0x20]
    5751:	49 63 c9             	movsxd rcx,r9d
    5754:	44 8d 48 09          	lea    r9d,[rax+0x9]
    5758:	83 c7 30             	add    edi,0x30
    575b:	41 88 3c 08          	mov    BYTE PTR [r8+rcx*1],dil
    575f:	44 39 cb             	cmp    ebx,r9d
    5762:	0f 8e 88 00 00 00    	jle    57f0 <run_tests+0xac0>
    5768:	0f b6 7c 32 24       	movzx  edi,BYTE PTR [rdx+rsi*1+0x24]
    576d:	49 63 c9             	movsxd rcx,r9d
    5770:	44 8d 48 0a          	lea    r9d,[rax+0xa]
    5774:	83 c7 30             	add    edi,0x30
    5777:	41 88 3c 08          	mov    BYTE PTR [r8+rcx*1],dil
    577b:	44 39 cb             	cmp    ebx,r9d
    577e:	7e 70                	jle    57f0 <run_tests+0xac0>
    5780:	0f b6 7c 32 28       	movzx  edi,BYTE PTR [rdx+rsi*1+0x28]
    5785:	49 63 c9             	movsxd rcx,r9d
    5788:	44 8d 48 0b          	lea    r9d,[rax+0xb]
    578c:	83 c7 30             	add    edi,0x30
    578f:	41 88 3c 08          	mov    BYTE PTR [r8+rcx*1],dil
    5793:	44 39 cb             	cmp    ebx,r9d
    5796:	7e 58                	jle    57f0 <run_tests+0xac0>
    5798:	0f b6 7c 32 2c       	movzx  edi,BYTE PTR [rdx+rsi*1+0x2c]
    579d:	49 63 c9             	movsxd rcx,r9d
    57a0:	44 8d 48 0c          	lea    r9d,[rax+0xc]
    57a4:	83 c7 30             	add    edi,0x30
    57a7:	41 88 3c 08          	mov    BYTE PTR [r8+rcx*1],dil
    57ab:	44 39 cb             	cmp    ebx,r9d
    57ae:	7e 40                	jle    57f0 <run_tests+0xac0>
    57b0:	0f b6 7c 32 30       	movzx  edi,BYTE PTR [rdx+rsi*1+0x30]
    57b5:	49 63 c9             	movsxd rcx,r9d
    57b8:	44 8d 48 0d          	lea    r9d,[rax+0xd]
    57bc:	83 c7 30             	add    edi,0x30
    57bf:	41 88 3c 08          	mov    BYTE PTR [r8+rcx*1],dil
    57c3:	44 39 cb             	cmp    ebx,r9d
    57c6:	7e 28                	jle    57f0 <run_tests+0xac0>
    57c8:	0f b6 7c 32 34       	movzx  edi,BYTE PTR [rdx+rsi*1+0x34]
    57cd:	49 63 c9             	movsxd rcx,r9d
    57d0:	83 c0 0e             	add    eax,0xe
    57d3:	83 c7 30             	add    edi,0x30
    57d6:	41 88 3c 08          	mov    BYTE PTR [r8+rcx*1],dil
    57da:	39 c3                	cmp    ebx,eax
    57dc:	7e 12                	jle    57f0 <run_tests+0xac0>
    57de:	8b 54 32 38          	mov    edx,DWORD PTR [rdx+rsi*1+0x38]
    57e2:	48 98                	cdqe   
    57e4:	83 c2 30             	add    edx,0x30
    57e7:	41 88 14 00          	mov    BYTE PTR [r8+rax*1],dl
    57eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    57f0:	44 89 95 68 fa ff ff 	mov    DWORD PTR [rbp-0x598],r10d
    57f7:	4c 8b 95 d8 fa ff ff 	mov    r10,QWORD PTR [rbp-0x528]
    57fe:	be 01 00 00 00       	mov    esi,0x1
    5803:	48 8b bd 78 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x588]
    580a:	4c 89 9d 50 fa ff ff 	mov    QWORD PTR [rbp-0x5b0],r11
    5811:	43 c6 04 10 00       	mov    BYTE PTR [r8+r10*1],0x0
    5816:	4c 89 85 70 fa ff ff 	mov    QWORD PTR [rbp-0x590],r8
    581d:	e8 2e cc ff ff       	call   2450 <calloc@plt>
    5822:	4c 8b 85 d8 fa ff ff 	mov    r8,QWORD PTR [rbp-0x528]
    5829:	48 8b 95 50 fa ff ff 	mov    rdx,QWORD PTR [rbp-0x5b0]
    5830:	49 89 c1             	mov    r9,rax
    5833:	48 8b 85 00 fb ff ff 	mov    rax,QWORD PTR [rbp-0x500]
    583a:	4f 8d 1c 01          	lea    r11,[r9+r8*1]
    583e:	4c 8b 85 70 fa ff ff 	mov    r8,QWORD PTR [rbp-0x590]
    5845:	4c 39 d8             	cmp    rax,r11
    5848:	48 8d 3c 10          	lea    rdi,[rax+rdx*1]
    584c:	40 0f 93 c6          	setae  sil
    5850:	49 39 f9             	cmp    r9,rdi
    5853:	0f 93 c1             	setae  cl
    5856:	40 08 f1             	or     cl,sil
    5859:	0f 84 99 06 00 00    	je     5ef8 <run_tests+0x11c8>
    585f:	80 bd d0 fa ff ff 00 	cmp    BYTE PTR [rbp-0x530],0x0
    5866:	44 8b 95 68 fa ff ff 	mov    r10d,DWORD PTR [rbp-0x598]
    586d:	0f 84 85 06 00 00    	je     5ef8 <run_tests+0x11c8>
    5873:	41 83 fa 1e          	cmp    r10d,0x1e
    5877:	0f 86 f3 08 00 00    	jbe    6170 <run_tests+0x1440>
    587d:	41 89 dd             	mov    r13d,ebx
    5880:	31 f6                	xor    esi,esi
    5882:	41 c1 ed 05          	shr    r13d,0x5
    5886:	4d 89 eb             	mov    r11,r13
    5889:	49 c1 e3 05          	shl    r11,0x5
    588d:	41 83 e5 01          	and    r13d,0x1
    5891:	74 6d                	je     5900 <run_tests+0xbd0>
    5893:	c5 fd 6f 25 85 1e 00 	vmovdqa ymm4,YMMWORD PTR [rip+0x1e85]        # 7720 <__PRETTY_FUNCTION__.0+0x93>
    589a:	00 
    589b:	c5 dd db 00          	vpand  ymm0,ymm4,YMMWORD PTR [rax]
    589f:	be 20 00 00 00       	mov    esi,0x20
    58a4:	c5 dd db 48 20       	vpand  ymm1,ymm4,YMMWORD PTR [rax+0x20]
    58a9:	c5 5d db 48 40       	vpand  ymm9,ymm4,YMMWORD PTR [rax+0x40]
    58ae:	c5 5d db 50 60       	vpand  ymm10,ymm4,YMMWORD PTR [rax+0x60]
    58b3:	c4 e2 7d 2b e9       	vpackusdw ymm5,ymm0,ymm1
    58b8:	c4 c2 35 2b fa       	vpackusdw ymm7,ymm9,ymm10
    58bd:	c4 e3 fd 00 f5 d8    	vpermq ymm6,ymm5,0xd8
    58c3:	c5 cd db 1d 75 1e 00 	vpand  ymm3,ymm6,YMMWORD PTR [rip+0x1e75]        # 7740 <__PRETTY_FUNCTION__.0+0xb3>
    58ca:	00 
    58cb:	c4 63 fd 00 c7 d8    	vpermq ymm8,ymm7,0xd8
    58d1:	c5 3d db 25 67 1e 00 	vpand  ymm12,ymm8,YMMWORD PTR [rip+0x1e67]        # 7740 <__PRETTY_FUNCTION__.0+0xb3>
    58d8:	00 
    58d9:	c4 41 65 67 dc       	vpackuswb ymm11,ymm3,ymm12
    58de:	c4 43 fd 00 eb d8    	vpermq ymm13,ymm11,0xd8
    58e4:	c5 15 fc 35 74 1e 00 	vpaddb ymm14,ymm13,YMMWORD PTR [rip+0x1e74]        # 7760 <__PRETTY_FUNCTION__.0+0xd3>
    58eb:	00 
    58ec:	c4 41 7e 7f 31       	vmovdqu YMMWORD PTR [r9],ymm14
    58f1:	4c 39 de             	cmp    rsi,r11
    58f4:	0f 84 dd 00 00 00    	je     59d7 <run_tests+0xca7>
    58fa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    5900:	c5 7d 6f 3d 18 1e 00 	vmovdqa ymm15,YMMWORD PTR [rip+0x1e18]        # 7720 <__PRETTY_FUNCTION__.0+0x93>
    5907:	00 
    5908:	c5 85 db 24 b0       	vpand  ymm4,ymm15,YMMWORD PTR [rax+rsi*4]
    590d:	c5 05 db 54 b0 40    	vpand  ymm10,ymm15,YMMWORD PTR [rax+rsi*4+0x40]
    5913:	c5 85 db 54 b0 60    	vpand  ymm2,ymm15,YMMWORD PTR [rax+rsi*4+0x60]
    5919:	c5 85 db 44 b0 20    	vpand  ymm0,ymm15,YMMWORD PTR [rax+rsi*4+0x20]
    591f:	c5 7d 7f fe          	vmovdqa ymm6,ymm15
    5923:	c4 41 7d 6f cf       	vmovdqa ymm9,ymm15
    5928:	c4 62 2d 2b c2       	vpackusdw ymm8,ymm10,ymm2
    592d:	c4 e2 5d 2b c8       	vpackusdw ymm1,ymm4,ymm0
    5932:	c4 c3 fd 00 d8 d8    	vpermq ymm3,ymm8,0xd8
    5938:	c5 65 db 1d 00 1e 00 	vpand  ymm11,ymm3,YMMWORD PTR [rip+0x1e00]        # 7740 <__PRETTY_FUNCTION__.0+0xb3>
    593f:	00 
    5940:	c4 e3 fd 00 e9 d8    	vpermq ymm5,ymm1,0xd8
    5946:	c5 55 db 25 f2 1d 00 	vpand  ymm12,ymm5,YMMWORD PTR [rip+0x1df2]        # 7740 <__PRETTY_FUNCTION__.0+0xb3>
    594d:	00 
    594e:	c4 41 1d 67 eb       	vpackuswb ymm13,ymm12,ymm11
    5953:	c4 43 fd 00 f5 d8    	vpermq ymm14,ymm13,0xd8
    5959:	c5 8d fc 25 ff 1d 00 	vpaddb ymm4,ymm14,YMMWORD PTR [rip+0x1dff]        # 7760 <__PRETTY_FUNCTION__.0+0xd3>
    5960:	00 
    5961:	c4 c1 7e 7f 24 31    	vmovdqu YMMWORD PTR [r9+rsi*1],ymm4
    5967:	c5 85 db ac b0 80 00 	vpand  ymm5,ymm15,YMMWORD PTR [rax+rsi*4+0x80]
    596e:	00 00 
    5970:	c5 cd db b4 b0 c0 00 	vpand  ymm6,ymm6,YMMWORD PTR [rax+rsi*4+0xc0]
    5977:	00 00 
    5979:	c5 05 db bc b0 a0 00 	vpand  ymm15,ymm15,YMMWORD PTR [rax+rsi*4+0xa0]
    5980:	00 00 
    5982:	c5 35 db 8c b0 e0 00 	vpand  ymm9,ymm9,YMMWORD PTR [rax+rsi*4+0xe0]
    5989:	00 00 
    598b:	c4 c2 55 2b cf       	vpackusdw ymm1,ymm5,ymm15
    5990:	c4 c2 4d 2b f9       	vpackusdw ymm7,ymm6,ymm9
    5995:	c4 63 fd 00 d1 d8    	vpermq ymm10,ymm1,0xd8
    599b:	c4 e3 fd 00 d7 d8    	vpermq ymm2,ymm7,0xd8
    59a1:	c5 2d db 05 97 1d 00 	vpand  ymm8,ymm10,YMMWORD PTR [rip+0x1d97]        # 7740 <__PRETTY_FUNCTION__.0+0xb3>
    59a8:	00 
    59a9:	c5 ed db 1d 8f 1d 00 	vpand  ymm3,ymm2,YMMWORD PTR [rip+0x1d8f]        # 7740 <__PRETTY_FUNCTION__.0+0xb3>
    59b0:	00 
    59b1:	c5 3d 67 e3          	vpackuswb ymm12,ymm8,ymm3
    59b5:	c4 43 fd 00 dc d8    	vpermq ymm11,ymm12,0xd8
    59bb:	c5 25 fc 2d 9d 1d 00 	vpaddb ymm13,ymm11,YMMWORD PTR [rip+0x1d9d]        # 7760 <__PRETTY_FUNCTION__.0+0xd3>
    59c2:	00 
    59c3:	c4 41 7e 7f 6c 31 20 	vmovdqu YMMWORD PTR [r9+rsi*1+0x20],ymm13
    59ca:	48 83 c6 40          	add    rsi,0x40
    59ce:	4c 39 de             	cmp    rsi,r11
    59d1:	0f 85 29 ff ff ff    	jne    5900 <run_tests+0xbd0>
    59d7:	89 df                	mov    edi,ebx
    59d9:	83 e7 e0             	and    edi,0xffffffe0
    59dc:	89 fa                	mov    edx,edi
    59de:	39 df                	cmp    edi,ebx
    59e0:	0f 84 07 08 00 00    	je     61ed <run_tests+0x14bd>
    59e6:	41 89 dd             	mov    r13d,ebx
    59e9:	41 29 fd             	sub    r13d,edi
    59ec:	41 8d 4d ff          	lea    ecx,[r13-0x1]
    59f0:	83 f9 0e             	cmp    ecx,0xe
    59f3:	0f 86 88 07 00 00    	jbe    6181 <run_tests+0x1451>
    59f9:	c5 f8 77             	vzeroupper 
    59fc:	4c 8d 14 b8          	lea    r10,[rax+rdi*4]
    5a00:	45 89 eb             	mov    r11d,r13d
    5a03:	c5 f9 6f 2d 15 1d 00 	vmovdqa xmm5,XMMWORD PTR [rip+0x1d15]        # 7720 <__PRETTY_FUNCTION__.0+0x93>
    5a0a:	00 
    5a0b:	c4 41 51 db 32       	vpand  xmm14,xmm5,XMMWORD PTR [r10]
    5a10:	c4 c1 51 db 62 10    	vpand  xmm4,xmm5,XMMWORD PTR [r10+0x10]
    5a16:	41 83 e3 f0          	and    r11d,0xfffffff0
    5a1a:	c4 41 51 db 7a 20    	vpand  xmm15,xmm5,XMMWORD PTR [r10+0x20]
    5a20:	c4 41 51 db 52 30    	vpand  xmm10,xmm5,XMMWORD PTR [r10+0x30]
    5a26:	44 01 da             	add    edx,r11d
    5a29:	c4 e2 09 2b c4       	vpackusdw xmm0,xmm14,xmm4
    5a2e:	c5 f9 db 15 0a 1d 00 	vpand  xmm2,xmm0,XMMWORD PTR [rip+0x1d0a]        # 7740 <__PRETTY_FUNCTION__.0+0xb3>
    5a35:	00 
    5a36:	c4 42 01 2b ca       	vpackusdw xmm9,xmm15,xmm10
    5a3b:	c5 31 db 05 fd 1c 00 	vpand  xmm8,xmm9,XMMWORD PTR [rip+0x1cfd]        # 7740 <__PRETTY_FUNCTION__.0+0xb3>
    5a42:	00 
    5a43:	c4 c1 69 67 d8       	vpackuswb xmm3,xmm2,xmm8
    5a48:	c5 61 fc 25 10 1d 00 	vpaddb xmm12,xmm3,XMMWORD PTR [rip+0x1d10]        # 7760 <__PRETTY_FUNCTION__.0+0xd3>
    5a4f:	00 
    5a50:	c4 41 7a 7f 24 39    	vmovdqu XMMWORD PTR [r9+rdi*1],xmm12
    5a56:	45 39 dd             	cmp    r13d,r11d
    5a59:	0f 84 91 01 00 00    	je     5bf0 <run_tests+0xec0>
    5a5f:	4c 63 ea             	movsxd r13,edx
    5a62:	8d 7a 01             	lea    edi,[rdx+0x1]
    5a65:	42 0f b6 34 a8       	movzx  esi,BYTE PTR [rax+r13*4]
    5a6a:	4a 8d 0c ad 00 00 00 	lea    rcx,[r13*4+0x0]
    5a71:	00 
    5a72:	83 c6 30             	add    esi,0x30
    5a75:	43 88 34 29          	mov    BYTE PTR [r9+r13*1],sil
    5a79:	39 fb                	cmp    ebx,edi
    5a7b:	0f 8e 6f 01 00 00    	jle    5bf0 <run_tests+0xec0>
    5a81:	44 0f b6 5c 08 04    	movzx  r11d,BYTE PTR [rax+rcx*1+0x4]
    5a87:	4c 63 d7             	movsxd r10,edi
    5a8a:	44 8d 6a 02          	lea    r13d,[rdx+0x2]
    5a8e:	41 83 c3 30          	add    r11d,0x30
    5a92:	47 88 1c 11          	mov    BYTE PTR [r9+r10*1],r11b
    5a96:	44 39 eb             	cmp    ebx,r13d
    5a99:	0f 8e 51 01 00 00    	jle    5bf0 <run_tests+0xec0>
    5a9f:	0f b6 7c 08 08       	movzx  edi,BYTE PTR [rax+rcx*1+0x8]
    5aa4:	49 63 f5             	movsxd rsi,r13d
    5aa7:	44 8d 52 03          	lea    r10d,[rdx+0x3]
    5aab:	83 c7 30             	add    edi,0x30
    5aae:	41 88 3c 31          	mov    BYTE PTR [r9+rsi*1],dil
    5ab2:	44 39 d3             	cmp    ebx,r10d
    5ab5:	0f 8e 35 01 00 00    	jle    5bf0 <run_tests+0xec0>
    5abb:	44 0f b6 6c 08 0c    	movzx  r13d,BYTE PTR [rax+rcx*1+0xc]
    5ac1:	4d 63 da             	movsxd r11,r10d
    5ac4:	8d 72 04             	lea    esi,[rdx+0x4]
    5ac7:	41 83 c5 30          	add    r13d,0x30
    5acb:	47 88 2c 19          	mov    BYTE PTR [r9+r11*1],r13b
    5acf:	39 f3                	cmp    ebx,esi
    5ad1:	0f 8e 19 01 00 00    	jle    5bf0 <run_tests+0xec0>
    5ad7:	0f b6 7c 08 10       	movzx  edi,BYTE PTR [rax+rcx*1+0x10]
    5adc:	4c 63 d6             	movsxd r10,esi
    5adf:	44 8d 5a 05          	lea    r11d,[rdx+0x5]
    5ae3:	83 c7 30             	add    edi,0x30
    5ae6:	43 88 3c 11          	mov    BYTE PTR [r9+r10*1],dil
    5aea:	44 39 db             	cmp    ebx,r11d
    5aed:	0f 8e fd 00 00 00    	jle    5bf0 <run_tests+0xec0>
    5af3:	0f b6 74 08 14       	movzx  esi,BYTE PTR [rax+rcx*1+0x14]
    5af8:	4d 63 eb             	movsxd r13,r11d
    5afb:	44 8d 52 06          	lea    r10d,[rdx+0x6]
    5aff:	83 c6 30             	add    esi,0x30
    5b02:	43 88 34 29          	mov    BYTE PTR [r9+r13*1],sil
    5b06:	44 39 d3             	cmp    ebx,r10d
    5b09:	0f 8e e1 00 00 00    	jle    5bf0 <run_tests+0xec0>
    5b0f:	0f b6 7c 08 18       	movzx  edi,BYTE PTR [rax+rcx*1+0x18]
    5b14:	4d 63 da             	movsxd r11,r10d
    5b17:	44 8d 6a 07          	lea    r13d,[rdx+0x7]
    5b1b:	83 c7 30             	add    edi,0x30
    5b1e:	43 88 3c 19          	mov    BYTE PTR [r9+r11*1],dil
    5b22:	44 39 eb             	cmp    ebx,r13d
    5b25:	0f 8e c5 00 00 00    	jle    5bf0 <run_tests+0xec0>
    5b2b:	44 0f b6 54 08 1c    	movzx  r10d,BYTE PTR [rax+rcx*1+0x1c]
    5b31:	49 63 f5             	movsxd rsi,r13d
    5b34:	44 8d 5a 08          	lea    r11d,[rdx+0x8]
    5b38:	41 83 c2 30          	add    r10d,0x30
    5b3c:	45 88 14 31          	mov    BYTE PTR [r9+rsi*1],r10b
    5b40:	44 39 db             	cmp    ebx,r11d
    5b43:	0f 8e a7 00 00 00    	jle    5bf0 <run_tests+0xec0>
    5b49:	0f b6 7c 08 20       	movzx  edi,BYTE PTR [rax+rcx*1+0x20]
    5b4e:	4d 63 eb             	movsxd r13,r11d
    5b51:	8d 72 09             	lea    esi,[rdx+0x9]
    5b54:	83 c7 30             	add    edi,0x30
    5b57:	43 88 3c 29          	mov    BYTE PTR [r9+r13*1],dil
    5b5b:	39 f3                	cmp    ebx,esi
    5b5d:	0f 8e 8d 00 00 00    	jle    5bf0 <run_tests+0xec0>
    5b63:	44 0f b6 5c 08 24    	movzx  r11d,BYTE PTR [rax+rcx*1+0x24]
    5b69:	4c 63 d6             	movsxd r10,esi
    5b6c:	44 8d 6a 0a          	lea    r13d,[rdx+0xa]
    5b70:	41 83 c3 30          	add    r11d,0x30
    5b74:	47 88 1c 11          	mov    BYTE PTR [r9+r10*1],r11b
    5b78:	44 39 eb             	cmp    ebx,r13d
    5b7b:	7e 73                	jle    5bf0 <run_tests+0xec0>
    5b7d:	0f b6 7c 08 28       	movzx  edi,BYTE PTR [rax+rcx*1+0x28]
    5b82:	49 63 f5             	movsxd rsi,r13d
    5b85:	44 8d 52 0b          	lea    r10d,[rdx+0xb]
    5b89:	83 c7 30             	add    edi,0x30
    5b8c:	41 88 3c 31          	mov    BYTE PTR [r9+rsi*1],dil
    5b90:	44 39 d3             	cmp    ebx,r10d
    5b93:	7e 5b                	jle    5bf0 <run_tests+0xec0>
    5b95:	44 0f b6 6c 08 2c    	movzx  r13d,BYTE PTR [rax+rcx*1+0x2c]
    5b9b:	4d 63 da             	movsxd r11,r10d
    5b9e:	8d 72 0c             	lea    esi,[rdx+0xc]
    5ba1:	41 83 c5 30          	add    r13d,0x30
    5ba5:	47 88 2c 19          	mov    BYTE PTR [r9+r11*1],r13b
    5ba9:	39 f3                	cmp    ebx,esi
    5bab:	7e 43                	jle    5bf0 <run_tests+0xec0>
    5bad:	0f b6 7c 08 30       	movzx  edi,BYTE PTR [rax+rcx*1+0x30]
    5bb2:	4c 63 d6             	movsxd r10,esi
    5bb5:	44 8d 5a 0d          	lea    r11d,[rdx+0xd]
    5bb9:	83 c7 30             	add    edi,0x30
    5bbc:	43 88 3c 11          	mov    BYTE PTR [r9+r10*1],dil
    5bc0:	44 39 db             	cmp    ebx,r11d
    5bc3:	7e 2b                	jle    5bf0 <run_tests+0xec0>
    5bc5:	0f b6 74 08 34       	movzx  esi,BYTE PTR [rax+rcx*1+0x34]
    5bca:	4d 63 eb             	movsxd r13,r11d
    5bcd:	83 c2 0e             	add    edx,0xe
    5bd0:	83 c6 30             	add    esi,0x30
    5bd3:	43 88 34 29          	mov    BYTE PTR [r9+r13*1],sil
    5bd7:	39 d3                	cmp    ebx,edx
    5bd9:	7e 15                	jle    5bf0 <run_tests+0xec0>
    5bdb:	8b 44 08 38          	mov    eax,DWORD PTR [rax+rcx*1+0x38]
    5bdf:	48 63 da             	movsxd rbx,edx
    5be2:	83 c0 30             	add    eax,0x30
    5be5:	41 88 04 19          	mov    BYTE PTR [r9+rbx*1],al
    5be9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    5bf0:	4c 89 85 70 fa ff ff 	mov    QWORD PTR [rbp-0x590],r8
    5bf7:	4c 8b 85 d8 fa ff ff 	mov    r8,QWORD PTR [rbp-0x528]
    5bfe:	48 8d 9d 40 fb ff ff 	lea    rbx,[rbp-0x4c0]
    5c05:	4c 8d ad 50 fb ff ff 	lea    r13,[rbp-0x4b0]
    5c0c:	48 89 df             	mov    rdi,rbx
    5c0f:	4c 89 8d 78 fa ff ff 	mov    QWORD PTR [rbp-0x588],r9
    5c16:	43 c6 04 01 00       	mov    BYTE PTR [r9+r8*1],0x0
    5c1b:	48 89 9d d0 fa ff ff 	mov    QWORD PTR [rbp-0x530],rbx
    5c22:	e8 19 c9 ff ff       	call   2540 <__gmpz_init@plt>
    5c27:	4c 89 ef             	mov    rdi,r13
    5c2a:	e8 11 c9 ff ff       	call   2540 <__gmpz_init@plt>
    5c2f:	48 8d bd 60 fb ff ff 	lea    rdi,[rbp-0x4a0]
    5c36:	48 89 bd d8 fa ff ff 	mov    QWORD PTR [rbp-0x528],rdi
    5c3d:	e8 fe c8 ff ff       	call   2540 <__gmpz_init@plt>
    5c42:	48 8b b5 70 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x590]
    5c49:	48 89 df             	mov    rdi,rbx
    5c4c:	ba 0a 00 00 00       	mov    edx,0xa
    5c51:	48 8d 1d 78 44 00 00 	lea    rbx,[rip+0x4478]        # a0d0 <fd>
    5c58:	e8 e3 c6 ff ff       	call   2340 <__gmpz_set_str@plt>
    5c5d:	48 8b b5 78 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x588]
    5c64:	ba 0a 00 00 00       	mov    edx,0xa
    5c69:	4c 89 ef             	mov    rdi,r13
    5c6c:	e8 cf c6 ff ff       	call   2340 <__gmpz_set_str@plt>
    5c71:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    5c78:	8b 3b                	mov    edi,DWORD PTR [rbx]
    5c7a:	31 d2                	xor    edx,edx
    5c7c:	be 03 24 00 00       	mov    esi,0x2403
    5c81:	31 c0                	xor    eax,eax
    5c83:	48 83 c3 04          	add    rbx,0x4
    5c87:	e8 64 c7 ff ff       	call   23f0 <ioctl@plt>
    5c8c:	8b 7b fc             	mov    edi,DWORD PTR [rbx-0x4]
    5c8f:	31 d2                	xor    edx,edx
    5c91:	be 00 24 00 00       	mov    esi,0x2400
    5c96:	31 c0                	xor    eax,eax
    5c98:	e8 53 c7 ff ff       	call   23f0 <ioctl@plt>
    5c9d:	4c 39 f3             	cmp    rbx,r14
    5ca0:	75 d6                	jne    5c78 <run_tests+0xf48>
    5ca2:	48 8b b5 98 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x568]
    5ca9:	c4 41 21 ef db       	vpxor  xmm11,xmm11,xmm11
    5cae:	bf 04 00 00 00       	mov    edi,0x4
    5cb3:	c5 79 7f 9d 10 fb ff 	vmovdqa XMMWORD PTR [rbp-0x4f0],xmm11
    5cba:	ff 
    5cbb:	e8 a0 c6 ff ff       	call   2360 <clock_gettime@plt>
    5cc0:	83 f8 ff             	cmp    eax,0xffffffff
    5cc3:	0f 84 07 06 00 00    	je     62d0 <run_tests+0x15a0>
    5cc9:	0f ae e8             	lfence 
    5ccc:	0f 31                	rdtsc  
    5cce:	48 c1 e2 20          	shl    rdx,0x20
    5cd2:	48 8b b5 d0 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x530]
    5cd9:	48 8b bd d8 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x528]
    5ce0:	41 89 c1             	mov    r9d,eax
    5ce3:	48 89 d3             	mov    rbx,rdx
    5ce6:	4c 89 ea             	mov    rdx,r13
    5ce9:	4c 09 cb             	or     rbx,r9
    5cec:	e8 8f c6 ff ff       	call   2380 <__gmpz_sub@plt>
    5cf1:	0f ae e8             	lfence 
    5cf4:	0f 31                	rdtsc  
    5cf6:	48 c1 e2 20          	shl    rdx,0x20
    5cfa:	41 89 c2             	mov    r10d,eax
    5cfd:	bf 04 00 00 00       	mov    edi,0x4
    5d02:	48 8b b5 80 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x580]
    5d09:	4c 09 d2             	or     rdx,r10
    5d0c:	c4 41 11 ef ed       	vpxor  xmm13,xmm13,xmm13
    5d11:	c5 79 7f ad 20 fb ff 	vmovdqa XMMWORD PTR [rbp-0x4e0],xmm13
    5d18:	ff 
    5d19:	49 89 d5             	mov    r13,rdx
    5d1c:	e8 3f c6 ff ff       	call   2360 <clock_gettime@plt>
    5d21:	83 f8 ff             	cmp    eax,0xffffffff
    5d24:	0f 84 90 05 00 00    	je     62ba <run_tests+0x158a>
    5d2a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    5d30:	41 8b 3f             	mov    edi,DWORD PTR [r15]
    5d33:	31 d2                	xor    edx,edx
    5d35:	31 c0                	xor    eax,eax
    5d37:	be 01 24 00 00       	mov    esi,0x2401
    5d3c:	e8 af c6 ff ff       	call   23f0 <ioctl@plt>
    5d41:	83 f8 ff             	cmp    eax,0xffffffff
    5d44:	0f 84 5a 05 00 00    	je     62a4 <run_tests+0x1574>
    5d4a:	49 83 c7 04          	add    r15,0x4
    5d4e:	4d 39 f7             	cmp    r15,r14
    5d51:	75 dd                	jne    5d30 <run_tests+0x1000>
    5d53:	48 8b bd 60 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x5a0]
    5d5a:	e8 c1 e6 ff ff       	call   4420 <read_perf>
    5d5f:	48 89 9d d0 fa ff ff 	mov    QWORD PTR [rbp-0x530],rbx
    5d66:	4c 89 e3             	mov    rbx,r12
    5d69:	4c 8b bd c0 fa ff ff 	mov    r15,QWORD PTR [rbp-0x540]
    5d70:	4c 8b a5 88 fa ff ff 	mov    r12,QWORD PTR [rbp-0x578]
    5d77:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    5d7e:	00 00 
    5d80:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
    5d83:	48 8d 15 f2 16 00 00 	lea    rdx,[rip+0x16f2]        # 747c <_IO_stdin_used+0x47c>
    5d8a:	4c 89 ff             	mov    rdi,r15
    5d8d:	31 c0                	xor    eax,eax
    5d8f:	be 01 00 00 00       	mov    esi,0x1
    5d94:	48 83 c3 08          	add    rbx,0x8
    5d98:	e8 83 c7 ff ff       	call   2520 <__fprintf_chk@plt>
    5d9d:	49 39 dc             	cmp    r12,rbx
    5da0:	75 de                	jne    5d80 <run_tests+0x1050>
    5da2:	4c 8b bd d0 fa ff ff 	mov    r15,QWORD PTR [rbp-0x530]
    5da9:	48 8b b5 c0 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x540]
    5db0:	bf 0a 00 00 00       	mov    edi,0xa
    5db5:	e8 56 c6 ff ff       	call   2410 <fputc@plt>
    5dba:	4d 29 fd             	sub    r13,r15
    5dbd:	48 8b b5 20 fb ff ff 	mov    rsi,QWORD PTR [rbp-0x4e0]
    5dc4:	48 8b 8d 28 fb ff ff 	mov    rcx,QWORD PTR [rbp-0x4d8]
    5dcb:	48 2b b5 10 fb ff ff 	sub    rsi,QWORD PTR [rbp-0x4f0]
    5dd2:	48 2b 8d 18 fb ff ff 	sub    rcx,QWORD PTR [rbp-0x4e8]
    5dd9:	79 0b                	jns    5de6 <run_tests+0x10b6>
    5ddb:	48 83 ee 01          	sub    rsi,0x1
    5ddf:	48 81 c1 00 ca 9a 3b 	add    rcx,0x3b9aca00
    5de6:	4c 69 de 00 ca 9a 3b 	imul   r11,rsi,0x3b9aca00
    5ded:	c5 d1 57 ed          	vxorpd xmm5,xmm5,xmm5
    5df1:	48 8b bd 20 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x5e0]
    5df8:	48 8d 15 44 17 00 00 	lea    rdx,[rip+0x1744]        # 7543 <_IO_stdin_used+0x543>
    5dff:	be 01 00 00 00       	mov    esi,0x1
    5e04:	b8 01 00 00 00       	mov    eax,0x1
    5e09:	49 01 cb             	add    r11,rcx
    5e0c:	4c 89 e9             	mov    rcx,r13
    5e0f:	c4 c1 d3 2a c3       	vcvtsi2sd xmm0,xmm5,r11
    5e14:	e8 07 c7 ff ff       	call   2520 <__fprintf_chk@plt>
    5e19:	4c 8b 85 20 fb ff ff 	mov    r8,QWORD PTR [rbp-0x4e0]
    5e20:	48 8b bd 28 fb ff ff 	mov    rdi,QWORD PTR [rbp-0x4d8]
    5e27:	4c 2b 85 10 fb ff ff 	sub    r8,QWORD PTR [rbp-0x4f0]
    5e2e:	48 2b bd 18 fb ff ff 	sub    rdi,QWORD PTR [rbp-0x4e8]
    5e35:	79 0b                	jns    5e42 <run_tests+0x1112>
    5e37:	49 83 e8 01          	sub    r8,0x1
    5e3b:	48 81 c7 00 ca 9a 3b 	add    rdi,0x3b9aca00
    5e42:	4d 69 c8 00 ca 9a 3b 	imul   r9,r8,0x3b9aca00
    5e49:	c4 41 09 57 f6       	vxorpd xmm14,xmm14,xmm14
    5e4e:	48 8b b5 58 fa ff ff 	mov    rsi,QWORD PTR [rbp-0x5a8]
    5e55:	4c 01 ad 38 fa ff ff 	add    QWORD PTR [rbp-0x5c8],r13
    5e5c:	49 01 f9             	add    r9,rdi
    5e5f:	48 8b bd 08 fb ff ff 	mov    rdi,QWORD PTR [rbp-0x4f8]
    5e66:	c4 c1 8b 2a f1       	vcvtsi2sd xmm6,xmm14,r9
    5e6b:	c5 cb 58 a5 b0 fa ff 	vaddsd xmm4,xmm6,QWORD PTR [rbp-0x550]
    5e72:	ff 
    5e73:	c5 fb 11 a5 b0 fa ff 	vmovsd QWORD PTR [rbp-0x550],xmm4
    5e7a:	ff 
    5e7b:	e8 e0 dd ff ff       	call   3c60 <formatResult>
    5e80:	48 8b 95 d8 fa ff ff 	mov    rdx,QWORD PTR [rbp-0x528]
    5e87:	31 ff                	xor    edi,edi
    5e89:	be 0a 00 00 00       	mov    esi,0xa
    5e8e:	48 89 c3             	mov    rbx,rax
    5e91:	e8 1a c5 ff ff       	call   23b0 <__gmpz_get_str@plt>
    5e96:	8b 95 f4 fa ff ff    	mov    edx,DWORD PTR [rbp-0x50c]
    5e9c:	48 89 df             	mov    rdi,rbx
    5e9f:	48 89 c6             	mov    rsi,rax
    5ea2:	e8 99 e7 ff ff       	call   4640 <check_result>
    5ea7:	84 c0                	test   al,al
    5ea9:	0f 84 da 02 00 00    	je     6189 <run_tests+0x1459>
    5eaf:	44 8b a5 6c fa ff ff 	mov    r12d,DWORD PTR [rbp-0x594]
    5eb6:	48 8d 35 21 17 00 00 	lea    rsi,[rip+0x1721]        # 75de <_IO_stdin_used+0x5de>
    5ebd:	bf 01 00 00 00       	mov    edi,0x1
    5ec2:	31 c0                	xor    eax,eax
    5ec4:	44 89 e2             	mov    edx,r12d
    5ec7:	e8 e4 c5 ff ff       	call   24b0 <__printf_chk@plt>
    5ecc:	31 ff                	xor    edi,edi
    5ece:	e8 8d c6 ff ff       	call   2560 <sleep@plt>
    5ed3:	44 89 e0             	mov    eax,r12d
    5ed6:	83 c0 01             	add    eax,0x1
    5ed9:	89 85 6c fa ff ff    	mov    DWORD PTR [rbp-0x594],eax
    5edf:	3d 50 c3 00 00       	cmp    eax,0xc350
    5ee4:	0f 84 13 03 00 00    	je     61fd <run_tests+0x14cd>
    5eea:	8b 95 e8 fa ff ff    	mov    edx,DWORD PTR [rbp-0x518]
    5ef0:	e9 0b f2 ff ff       	jmp    5100 <run_tests+0x3d0>
    5ef5:	0f 1f 00             	nop    DWORD PTR [rax]
    5ef8:	41 89 da             	mov    r10d,ebx
    5efb:	31 ff                	xor    edi,edi
    5efd:	83 e3 07             	and    ebx,0x7
    5f00:	0f 84 8f 00 00 00    	je     5f95 <run_tests+0x1265>
    5f06:	48 83 fb 01          	cmp    rbx,0x1
    5f0a:	74 71                	je     5f7d <run_tests+0x124d>
    5f0c:	48 83 fb 02          	cmp    rbx,0x2
    5f10:	74 5c                	je     5f6e <run_tests+0x123e>
    5f12:	48 83 fb 03          	cmp    rbx,0x3
    5f16:	74 47                	je     5f5f <run_tests+0x122f>
    5f18:	48 83 fb 04          	cmp    rbx,0x4
    5f1c:	74 32                	je     5f50 <run_tests+0x1220>
    5f1e:	48 83 fb 05          	cmp    rbx,0x5
    5f22:	74 1b                	je     5f3f <run_tests+0x120f>
    5f24:	48 83 fb 06          	cmp    rbx,0x6
    5f28:	0f 85 ac 02 00 00    	jne    61da <run_tests+0x14aa>
    5f2e:	44 0f b6 1c b8       	movzx  r11d,BYTE PTR [rax+rdi*4]
    5f33:	41 83 c3 30          	add    r11d,0x30
    5f37:	45 88 1c 39          	mov    BYTE PTR [r9+rdi*1],r11b
    5f3b:	48 83 c7 01          	add    rdi,0x1
    5f3f:	44 0f b6 2c b8       	movzx  r13d,BYTE PTR [rax+rdi*4]
    5f44:	41 83 c5 30          	add    r13d,0x30
    5f48:	45 88 2c 39          	mov    BYTE PTR [r9+rdi*1],r13b
    5f4c:	48 83 c7 01          	add    rdi,0x1
    5f50:	0f b6 34 b8          	movzx  esi,BYTE PTR [rax+rdi*4]
    5f54:	83 c6 30             	add    esi,0x30
    5f57:	41 88 34 39          	mov    BYTE PTR [r9+rdi*1],sil
    5f5b:	48 83 c7 01          	add    rdi,0x1
    5f5f:	0f b6 1c b8          	movzx  ebx,BYTE PTR [rax+rdi*4]
    5f63:	83 c3 30             	add    ebx,0x30
    5f66:	41 88 1c 39          	mov    BYTE PTR [r9+rdi*1],bl
    5f6a:	48 83 c7 01          	add    rdi,0x1
    5f6e:	0f b6 14 b8          	movzx  edx,BYTE PTR [rax+rdi*4]
    5f72:	83 c2 30             	add    edx,0x30
    5f75:	41 88 14 39          	mov    BYTE PTR [r9+rdi*1],dl
    5f79:	48 83 c7 01          	add    rdi,0x1
    5f7d:	0f b6 0c b8          	movzx  ecx,BYTE PTR [rax+rdi*4]
    5f81:	83 c1 30             	add    ecx,0x30
    5f84:	41 88 0c 39          	mov    BYTE PTR [r9+rdi*1],cl
    5f88:	48 83 c7 01          	add    rdi,0x1
    5f8c:	4c 39 d7             	cmp    rdi,r10
    5f8f:	0f 84 5b fc ff ff    	je     5bf0 <run_tests+0xec0>
    5f95:	44 0f b6 1c b8       	movzx  r11d,BYTE PTR [rax+rdi*4]
    5f9a:	41 83 c3 30          	add    r11d,0x30
    5f9e:	45 88 1c 39          	mov    BYTE PTR [r9+rdi*1],r11b
    5fa2:	44 0f b6 6c b8 04    	movzx  r13d,BYTE PTR [rax+rdi*4+0x4]
    5fa8:	41 83 c5 30          	add    r13d,0x30
    5fac:	45 88 6c 39 01       	mov    BYTE PTR [r9+rdi*1+0x1],r13b
    5fb1:	0f b6 74 b8 08       	movzx  esi,BYTE PTR [rax+rdi*4+0x8]
    5fb6:	83 c6 30             	add    esi,0x30
    5fb9:	41 88 74 39 02       	mov    BYTE PTR [r9+rdi*1+0x2],sil
    5fbe:	0f b6 5c b8 0c       	movzx  ebx,BYTE PTR [rax+rdi*4+0xc]
    5fc3:	83 c3 30             	add    ebx,0x30
    5fc6:	41 88 5c 39 03       	mov    BYTE PTR [r9+rdi*1+0x3],bl
    5fcb:	0f b6 54 b8 10       	movzx  edx,BYTE PTR [rax+rdi*4+0x10]
    5fd0:	83 c2 30             	add    edx,0x30
    5fd3:	41 88 54 39 04       	mov    BYTE PTR [r9+rdi*1+0x4],dl
    5fd8:	0f b6 4c b8 14       	movzx  ecx,BYTE PTR [rax+rdi*4+0x14]
    5fdd:	83 c1 30             	add    ecx,0x30
    5fe0:	41 88 4c 39 05       	mov    BYTE PTR [r9+rdi*1+0x5],cl
    5fe5:	44 0f b6 5c b8 18    	movzx  r11d,BYTE PTR [rax+rdi*4+0x18]
    5feb:	41 83 c3 30          	add    r11d,0x30
    5fef:	45 88 5c 39 06       	mov    BYTE PTR [r9+rdi*1+0x6],r11b
    5ff4:	44 0f b6 6c b8 1c    	movzx  r13d,BYTE PTR [rax+rdi*4+0x1c]
    5ffa:	41 83 c5 30          	add    r13d,0x30
    5ffe:	45 88 6c 39 07       	mov    BYTE PTR [r9+rdi*1+0x7],r13b
    6003:	48 83 c7 08          	add    rdi,0x8
    6007:	4c 39 d7             	cmp    rdi,r10
    600a:	75 89                	jne    5f95 <run_tests+0x1265>
    600c:	e9 df fb ff ff       	jmp    5bf0 <run_tests+0xec0>
    6011:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    6018:	49 89 d9             	mov    r9,rbx
    601b:	89 de                	mov    esi,ebx
    601d:	31 ff                	xor    edi,edi
    601f:	41 83 e1 07          	and    r9d,0x7
    6023:	0f 84 8f 00 00 00    	je     60b8 <run_tests+0x1388>
    6029:	49 83 f9 01          	cmp    r9,0x1
    602d:	74 71                	je     60a0 <run_tests+0x1370>
    602f:	49 83 f9 02          	cmp    r9,0x2
    6033:	74 5a                	je     608f <run_tests+0x135f>
    6035:	49 83 f9 03          	cmp    r9,0x3
    6039:	74 45                	je     6080 <run_tests+0x1350>
    603b:	49 83 f9 04          	cmp    r9,0x4
    603f:	74 30                	je     6071 <run_tests+0x1341>
    6041:	49 83 f9 05          	cmp    r9,0x5
    6045:	74 19                	je     6060 <run_tests+0x1330>
    6047:	49 83 f9 06          	cmp    r9,0x6
    604b:	0f 85 76 01 00 00    	jne    61c7 <run_tests+0x1497>
    6051:	0f b6 0c ba          	movzx  ecx,BYTE PTR [rdx+rdi*4]
    6055:	83 c1 30             	add    ecx,0x30
    6058:	41 88 0c 38          	mov    BYTE PTR [r8+rdi*1],cl
    605c:	48 83 c7 01          	add    rdi,0x1
    6060:	44 0f b6 0c ba       	movzx  r9d,BYTE PTR [rdx+rdi*4]
    6065:	41 83 c1 30          	add    r9d,0x30
    6069:	45 88 0c 38          	mov    BYTE PTR [r8+rdi*1],r9b
    606d:	48 83 c7 01          	add    rdi,0x1
    6071:	0f b6 04 ba          	movzx  eax,BYTE PTR [rdx+rdi*4]
    6075:	83 c0 30             	add    eax,0x30
    6078:	41 88 04 38          	mov    BYTE PTR [r8+rdi*1],al
    607c:	48 83 c7 01          	add    rdi,0x1
    6080:	0f b6 0c ba          	movzx  ecx,BYTE PTR [rdx+rdi*4]
    6084:	83 c1 30             	add    ecx,0x30
    6087:	41 88 0c 38          	mov    BYTE PTR [r8+rdi*1],cl
    608b:	48 83 c7 01          	add    rdi,0x1
    608f:	44 0f b6 0c ba       	movzx  r9d,BYTE PTR [rdx+rdi*4]
    6094:	41 83 c1 30          	add    r9d,0x30
    6098:	45 88 0c 38          	mov    BYTE PTR [r8+rdi*1],r9b
    609c:	48 83 c7 01          	add    rdi,0x1
    60a0:	0f b6 04 ba          	movzx  eax,BYTE PTR [rdx+rdi*4]
    60a4:	83 c0 30             	add    eax,0x30
    60a7:	41 88 04 38          	mov    BYTE PTR [r8+rdi*1],al
    60ab:	48 83 c7 01          	add    rdi,0x1
    60af:	48 39 f7             	cmp    rdi,rsi
    60b2:	0f 84 38 f7 ff ff    	je     57f0 <run_tests+0xac0>
    60b8:	0f b6 0c ba          	movzx  ecx,BYTE PTR [rdx+rdi*4]
    60bc:	83 c1 30             	add    ecx,0x30
    60bf:	41 88 0c 38          	mov    BYTE PTR [r8+rdi*1],cl
    60c3:	44 0f b6 4c ba 04    	movzx  r9d,BYTE PTR [rdx+rdi*4+0x4]
    60c9:	41 83 c1 30          	add    r9d,0x30
    60cd:	45 88 4c 38 01       	mov    BYTE PTR [r8+rdi*1+0x1],r9b
    60d2:	0f b6 44 ba 08       	movzx  eax,BYTE PTR [rdx+rdi*4+0x8]
    60d7:	83 c0 30             	add    eax,0x30
    60da:	41 88 44 38 02       	mov    BYTE PTR [r8+rdi*1+0x2],al
    60df:	0f b6 4c ba 0c       	movzx  ecx,BYTE PTR [rdx+rdi*4+0xc]
    60e4:	83 c1 30             	add    ecx,0x30
    60e7:	41 88 4c 38 03       	mov    BYTE PTR [r8+rdi*1+0x3],cl
    60ec:	44 0f b6 4c ba 10    	movzx  r9d,BYTE PTR [rdx+rdi*4+0x10]
    60f2:	41 83 c1 30          	add    r9d,0x30
    60f6:	45 88 4c 38 04       	mov    BYTE PTR [r8+rdi*1+0x4],r9b
    60fb:	0f b6 44 ba 14       	movzx  eax,BYTE PTR [rdx+rdi*4+0x14]
    6100:	83 c0 30             	add    eax,0x30
    6103:	41 88 44 38 05       	mov    BYTE PTR [r8+rdi*1+0x5],al
    6108:	0f b6 4c ba 18       	movzx  ecx,BYTE PTR [rdx+rdi*4+0x18]
    610d:	83 c1 30             	add    ecx,0x30
    6110:	41 88 4c 38 06       	mov    BYTE PTR [r8+rdi*1+0x6],cl
    6115:	44 0f b6 4c ba 1c    	movzx  r9d,BYTE PTR [rdx+rdi*4+0x1c]
    611b:	41 83 c1 30          	add    r9d,0x30
    611f:	45 88 4c 38 07       	mov    BYTE PTR [r8+rdi*1+0x7],r9b
    6124:	48 83 c7 08          	add    rdi,0x8
    6128:	48 39 f7             	cmp    rdi,rsi
    612b:	75 8b                	jne    60b8 <run_tests+0x1388>
    612d:	e9 be f6 ff ff       	jmp    57f0 <run_tests+0xac0>
    6132:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    6138:	42 c6 04 08 00       	mov    BYTE PTR [rax+r9*1],0x0
    613d:	48 8b bd 78 fa ff ff 	mov    rdi,QWORD PTR [rbp-0x588]
    6144:	be 01 00 00 00       	mov    esi,0x1
    6149:	48 89 85 d0 fa ff ff 	mov    QWORD PTR [rbp-0x530],rax
    6150:	e8 fb c2 ff ff       	call   2450 <calloc@plt>
    6155:	4c 8b 85 d0 fa ff ff 	mov    r8,QWORD PTR [rbp-0x530]
    615c:	49 89 c1             	mov    r9,rax
    615f:	e9 8c fa ff ff       	jmp    5bf0 <run_tests+0xec0>
    6164:	89 de                	mov    esi,ebx
    6166:	45 31 c9             	xor    r9d,r9d
    6169:	31 c0                	xor    eax,eax
    616b:	e9 96 f4 ff ff       	jmp    5606 <run_tests+0x8d6>
    6170:	31 ff                	xor    edi,edi
    6172:	31 d2                	xor    edx,edx
    6174:	e9 83 f8 ff ff       	jmp    59fc <run_tests+0xccc>
    6179:	c5 f8 77             	vzeroupper 
    617c:	e9 e4 f4 ff ff       	jmp    5665 <run_tests+0x935>
    6181:	c5 f8 77             	vzeroupper 
    6184:	e9 d6 f8 ff ff       	jmp    5a5f <run_tests+0xd2f>
    6189:	8b 95 6c fa ff ff    	mov    edx,DWORD PTR [rbp-0x594]
    618f:	48 8d 35 ea 10 00 00 	lea    rsi,[rip+0x10ea]        # 7280 <_IO_stdin_used+0x280>
    6196:	bf 01 00 00 00       	mov    edi,0x1
    619b:	e8 10 c3 ff ff       	call   24b0 <__printf_chk@plt>
    61a0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    61a4:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    61ab:	00 00 
    61ad:	0f 85 38 01 00 00    	jne    62eb <run_tests+0x15bb>
    61b3:	48 8d 65 d0          	lea    rsp,[rbp-0x30]
    61b7:	5b                   	pop    rbx
    61b8:	5a                   	pop    rdx
    61b9:	41 5c                	pop    r12
    61bb:	41 5d                	pop    r13
    61bd:	41 5e                	pop    r14
    61bf:	41 5f                	pop    r15
    61c1:	5d                   	pop    rbp
    61c2:	48 8d 62 f8          	lea    rsp,[rdx-0x8]
    61c6:	c3                   	ret    
    61c7:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
    61ca:	bf 01 00 00 00       	mov    edi,0x1
    61cf:	83 c0 30             	add    eax,0x30
    61d2:	41 88 00             	mov    BYTE PTR [r8],al
    61d5:	e9 77 fe ff ff       	jmp    6051 <run_tests+0x1321>
    61da:	0f b6 10             	movzx  edx,BYTE PTR [rax]
    61dd:	bf 01 00 00 00       	mov    edi,0x1
    61e2:	8d 4a 30             	lea    ecx,[rdx+0x30]
    61e5:	41 88 09             	mov    BYTE PTR [r9],cl
    61e8:	e9 41 fd ff ff       	jmp    5f2e <run_tests+0x11fe>
    61ed:	c5 f8 77             	vzeroupper 
    61f0:	e9 fb f9 ff ff       	jmp    5bf0 <run_tests+0xec0>
    61f5:	c5 f8 77             	vzeroupper 
    61f8:	e9 f3 f5 ff ff       	jmp    57f0 <run_tests+0xac0>
    61fd:	ba 50 c3 00 00       	mov    edx,0xc350
    6202:	48 8d 35 97 10 00 00 	lea    rsi,[rip+0x1097]        # 72a0 <_IO_stdin_used+0x2a0>
    6209:	c5 fb 10 8d b0 fa ff 	vmovsd xmm1,QWORD PTR [rbp-0x550]
    6210:	ff 
    6211:	c5 fb 10 85 b8 fa ff 	vmovsd xmm0,QWORD PTR [rbp-0x548]
    6218:	ff 
    6219:	bf 01 00 00 00       	mov    edi,0x1
    621e:	b8 02 00 00 00       	mov    eax,0x2
    6223:	e8 88 c2 ff ff       	call   24b0 <__printf_chk@plt>
    6228:	4c 8b bd 38 fa ff ff 	mov    r15,QWORD PTR [rbp-0x5c8]
    622f:	bf 01 00 00 00       	mov    edi,0x1
    6234:	31 c0                	xor    eax,eax
    6236:	4c 8b b5 48 fa ff ff 	mov    r14,QWORD PTR [rbp-0x5b8]
    623d:	48 8d 35 c4 10 00 00 	lea    rsi,[rip+0x10c4]        # 7308 <_IO_stdin_used+0x308>
    6244:	4c 89 f9             	mov    rcx,r15
    6247:	4c 89 f2             	mov    rdx,r14
    624a:	e8 61 c2 ff ff       	call   24b0 <__printf_chk@plt>
    624f:	bf 01 00 00 00       	mov    edi,0x1
    6254:	b8 01 00 00 00       	mov    eax,0x1
    6259:	48 8d 35 9a 13 00 00 	lea    rsi,[rip+0x139a]        # 75fa <_IO_stdin_used+0x5fa>
    6260:	c5 fb 10 85 b0 fa ff 	vmovsd xmm0,QWORD PTR [rbp-0x550]
    6267:	ff 
    6268:	c5 fb 5e 85 b8 fa ff 	vdivsd xmm0,xmm0,QWORD PTR [rbp-0x548]
    626f:	ff 
    6270:	e8 3b c2 ff ff       	call   24b0 <__printf_chk@plt>
    6275:	c5 c1 57 ff          	vxorpd xmm7,xmm7,xmm7
    6279:	bf 01 00 00 00       	mov    edi,0x1
    627e:	48 8d 35 8b 13 00 00 	lea    rsi,[rip+0x138b]        # 7610 <_IO_stdin_used+0x610>
    6285:	62 51 c7 08 7b ff    	vcvtusi2sd xmm15,xmm7,r15
    628b:	b8 01 00 00 00       	mov    eax,0x1
    6290:	62 d1 c7 08 7b ce    	vcvtusi2sd xmm1,xmm7,r14
    6296:	c5 83 5e c1          	vdivsd xmm0,xmm15,xmm1
    629a:	e8 11 c2 ff ff       	call   24b0 <__printf_chk@plt>
    629f:	e9 fc fe ff ff       	jmp    61a0 <run_tests+0x1470>
    62a4:	48 8d 3d d7 11 00 00 	lea    rdi,[rip+0x11d7]        # 7482 <_IO_stdin_used+0x482>
    62ab:	e8 30 c2 ff ff       	call   24e0 <perror@plt>
    62b0:	bf 01 00 00 00       	mov    edi,0x1
    62b5:	e8 46 c2 ff ff       	call   2500 <exit@plt>
    62ba:	48 8d 3d f2 11 00 00 	lea    rdi,[rip+0x11f2]        # 74b3 <_IO_stdin_used+0x4b3>
    62c1:	e8 1a c2 ff ff       	call   24e0 <perror@plt>
    62c6:	bf 01 00 00 00       	mov    edi,0x1
    62cb:	e8 30 c2 ff ff       	call   2500 <exit@plt>
    62d0:	48 8d 3d c3 11 00 00 	lea    rdi,[rip+0x11c3]        # 749a <_IO_stdin_used+0x49a>
    62d7:	e8 04 c2 ff ff       	call   24e0 <perror@plt>
    62dc:	bf 01 00 00 00       	mov    edi,0x1
    62e1:	e8 1a c2 ff ff       	call   2500 <exit@plt>
    62e6:	e8 f5 c4 ff ff       	call   27e0 <open_file.part.0>
    62eb:	e8 d0 c0 ff ff       	call   23c0 <__stack_chk_fail@plt>

Disassembly of section .fini:

00000000000062f0 <_fini>:
    62f0:	f3 0f 1e fa          	endbr64 
    62f4:	48 83 ec 08          	sub    rsp,0x8
    62f8:	48 83 c4 08          	add    rsp,0x8
    62fc:	c3                   	ret    
