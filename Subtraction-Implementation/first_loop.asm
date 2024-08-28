180         // measure rdtsc for first loop
181         first_loop_start_ticks = rdtsc();

182
183         for (i = 0; i < n; i += 16)
   0x000055555555745f <+2239>:  test   %r13d,%r13d
   0x0000555555557462 <+2242>:  jle    0x55555555767d <run_tests+2781>
   0x0000555555557487 <+2279>:  mov    $0x10,%eax
   0x00005555555574be <+2334>:  cmp    $0x10,%r13d
   0x00005555555574c2 <+2338>:  jle    0x55555555767d <run_tests+2781>
   0x00005555555574c8 <+2344>:  test   %edx,%edx
   0x00005555555574ca <+2346>:  je     0x555555557590 <run_tests+2544>
   0x00005555555574d0 <+2352>:  cmp    $0x1,%edx
   0x00005555555574d3 <+2355>:  je     0x55555555754e <run_tests+2478>
   0x00005555555574d5 <+2357>:  cmp    $0x2,%edx
   0x00005555555574d8 <+2360>:  je     0x555555557515 <run_tests+2421>
   0x00005555555574e9 <+2377>:  mov    $0x20,%eax
   0x000055555555754a <+2474>:  add    $0x10,%rax
   0x0000555555557583 <+2531>:  add    $0x10,%rax
   0x0000555555557587 <+2535>:  cmp    %eax,%r13d
   0x000055555555758a <+2538>:  jle    0x55555555767d <run_tests+2781>
--Type <RET> for more, q to quit, c to continue without paging--
   0x0000555555557597 <+2551>:  lea    0x10(%rax),%rcx
   0x000055555555759b <+2555>:  lea    0x20(%rax),%rdx
   0x0000555555557609 <+2665>:  lea    0x30(%rax),%rcx
   0x0000555555557614 <+2676>:  add    $0x40,%rax
   0x0000555555557674 <+2772>:  cmp    %eax,%r13d
   0x0000555555557677 <+2775>:  jg     0x555555557590 <run_tests+2544>

184         {
185             // load 16 elements from a and b
186             a_vec = _mm512_loadu_si512(a + i);
187             b_vec = _mm512_loadu_si512(b + i);
188
189             // subtract a and b
190             result_vec = _mm512_sub_epi32(a_vec, b_vec);
191
192             // if result_vec[j] < 0, set borrow mask to 1
193             __mmask16 borrow_mask = _mm512_cmplt_epi32_mask(result_vec, zeros);
   0x0000555555557448 <+2216>:  lea    0x4f71(%rip),%r9        # 0x55555555c3c0 <zeros>
   0x000055555555744f <+2223>:  vmovdqa64 0x4f67(%rip),%zmm4        # 0x55555555c3c0 <zeros>

194
195             // based on borrow mask, result_vec[j] = limb_digits + result_vec[j]
196             result_vec = _mm512_mask_add_epi32(result_vec, borrow_mask, result_vec, limb_digits);
197
198             __m512i borrow = _mm512_maskz_set1_epi32(borrow_mask, 1);
199
200             // store the borrow
201             _mm512_storeu_si512(borrow_array + i, borrow);
--Type <RET> for more, q to quit, c to continue without paging--
202
203             // store the result
204             _mm512_storeu_si512(result + i, result_vec);
205         }
206         _mm512_storeu_si512(result + n, zeros);
   0x000055555555767d <+2781>:  movslq %r13d,%r14

207         _mm512_storeu_si512(borrow_array + n, zeros);
208         // measure rdtsc
209         first_loop_end_ticks = rdtsc();