/*
    Current Tasks:
    1. Fun to accumulate muls
    2. Fun to multiply the muls
*/
/*
    1. Fun to accumulate muls :-
    Algo:
      for set_idx = 0 to max_set_idx
      {
        start = max (0, set_idx - n + 1)
        end = min (set_idx, n - 1)
        scatter(num1, num2, start, end)
      }
      Fun scatter(num1, num2, start, end)
      {
        for i = start, j = end; i <= end; i++, j--
        {
          n1 = num1[i]
          n2 = num2[j]
          n1_high = (n1 >> 32) & 0xFFFFFFFF
          n1_low = n1 & 0xFFFFFFFF
          n2_high = (n2 >> 32) & 0xFFFFFFFF
          n2_low = n2 & 0xFFFFFFFF
          mul_tmp_1[idx] = n1_high;
          mul_tmp_1[idx + 1] = n1_high;
          mul_tmp_1[idx + 2] = n1_low;
          mul_tmp_1[idx + 3] = n1_low;
          mul_tmp_2[idx] = n2_high;
          mul_tmp_2[idx + 1] = n2_high;
          mul_tmp_2[idx + 2] = n2_low;
          mul_tmp_2[idx + 3] = n2_low;
      }
*/
/*
    2. Fun to multiply the muls :-
    Algo:
      for i = 0 to max_idx (++8)
      {
        multiply_AVX(mul_tmp_1, mul_tmp_2, i);
      }
      Fun multiply_AVX(mul_tmp_1, mul_tmp_2, i)
      {
        load 8 values from mul_tmp_1[i] and mul_tmp_2[i]
        multiply them using AVX
        store the result in result
      }
*/

/*
  Fun to add the results
  Algo:
    for i = 1 to 4n*n; i += 4
    {
      result[i] = result[i] + result[i + 1]
      if result[i] > 0xFFFF
      {
        result[i-1] = result[i-1] + 1
      }
    }
*/

/*  Apporach to tackle 0s after addition is done
  i. Fun to move the 0s (i = 2; +=4; start = 0, end = start + size - 1, size = 4; +=4)
  or
  ii. idx = 2;
      if i == idx
        i--
        idx += 4
*/

/*
  Fun to adjust the inner-limb multiplication results
  Algo:
    size = 4
    start = 0
    end = start + size - 1

    while end <= max_idx
    {
      second = start + 1
      p = (a[end]>>8) + (a[second]&0xFF)
      if p > 0xFF
      {
        c1 = 1
      }
      q = (a[second]>>8) + (a[start]&0xFF)
      if q > 0xFF
      {
        c2 = 1
      }
      a[second] = (a[end]&0xFF)|(p<<8)

      if c1 == 1
      {
        q++
      }
      if c2 == 1
      {
        a[start] = a[start] + (1<<8)
      }
      a[start] = (a[start]&0xFF00)|q
      start = end + 1
      end = end + size
    }

*/

/*
Algo: Remove intermediary zeros
  max_idx = 4 * n * n
  j = 0
  for i = 0 to max_idx
  {
    b[j] = a[i]
    b[j+1] = a[i+1]
    i+=4
    j+=2
  }
*/

/*
Algo: Add across limbs
  thresh = n - 1
  start = 0
  no_adds = 0
  while no_adds <= thresh {
    if no_adds == 0{
      start++
      no_adds++
    }
    end = start + no_adds
    carry = 0
    i = start
    while i < end {
      r = a[i] + a[i+1]
      i++
    }
    if r > 0xFFFFFFFF{
      carry = r >> 32
      r = r & 0xFFFFFFFF
      a[start-1] = a[start-1] + (carry << 16)
    }


  }
*/