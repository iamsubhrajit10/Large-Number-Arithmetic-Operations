225         // measure rdtsc for second loop
226         second_loop_start_ticks = rdtsc();

227
228         for (i = 0; i < n; i += 16)
   0x00005555555576df <+2879>:  test   %r13d,%r13d
   0x00005555555576e2 <+2882>:  jle    0x555555558dd2 <run_tests+8754>
   0x000055555555771a <+2938>:  add    $0x10,%r9
   0x000055555555771e <+2942>:  cmp    %r9d,%r13d
   0x0000555555557721 <+2945>:  jle    0x555555557770 <run_tests+3024>
   0x000055555555775f <+3007>:  add    $0x10,%r9
   0x0000555555557763 <+3011>:  cmp    %r9d,%r13d
   0x0000555555557766 <+3014>:  jg     0x555555557723 <run_tests+2947>
   0x0000555555557768 <+3016>:  nopl   0x0(%rax,%rax,1)

229         {
230             __m512i borrow_vec = _mm512_loadu_si512(borrow_array + i);
231             result_vec = _mm512_loadu_si512(result + i);
232             result_vec = _mm512_sub_epi32(result_vec, borrow_vec);
233
--Type <RET> for more, q to quit, c to continue without paging--
234             // check if result_vec[j] < 0
235             __mmask16 borrow_mask = _mm512_cmplt_epi32_mask(result_vec, zeros);
236             if (unlikely(borrow_mask))
   0x000055555555773f <+2975>:  kortestw %k2,%k2
   0x0000555555557743 <+2979>:  je     0x555555557708 <run_tests+2920>

237             {
238                 last_borrow_block = i;
239             }
240
241             // generate borrow_vec
242             borrow_vec = _mm512_maskz_set1_epi32(borrow_mask, 1);
243
244             // update the borrow array
245             _mm512_storeu_si512(borrow_array + i, borrow_vec);
246
247             _mm512_storeu_si512(result + i, result_vec);
248         }
249
250         // measure rdtsc
251         second_loop_end_ticks = rdtsc();