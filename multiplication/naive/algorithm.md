# Algorithm: multiply_urdhva_tiryagbhyam
(All the below algorithms are in-sync with 16-bit limbs; the actual implementation uses 64-bit limbs)
## Input
- `n1`, `n2`: Two numbers in hex
- `len`: The length of the numbers

## Output
- `result`: The product of the two numbers, in hex; of `2*len` length

## Steps
```pseudo
1. max_idx = 4 * len * len
2. accumulate_muls(n1, n2, len, mul_tmp_1, mul_tmp_2)   // mul_tmp_1 and mul_tmp_2 are arrays of length max_idx
3. multiply_muls(max_idx, mul_tmp_1, mul_tmp_2, result) // result is an array of length max_idx
4. add_within_limbs(max_idx, result)
5. adjust_inner_limbs(max_idx, result)
6. remove_intermediary_zeros(max_idx, result)
7. add_limbs(len, max_idx, result)
8. final_result = adjust_limbs(2 * (2 * len - 1) - 1, result)
9. return final_result
```



## Algorithm: accumulate_muls

### Description
This algorithm accumulates the sub-limbs to be multiplied using the Urdhva-Tiraybhyam algorithm. It uses the utility function `scatter` to scatter the high and low 2-bytes of the numbers to be multiplied according to the Urdhva order.

#### Reason for dividing the limbs into two parts:
- The product of two numbers of length `n` is of length `2n`
- To accommodate into length `n`, we divide the limbs into two parts

### Example
```
n1: f548 8543
n2: 6b0d 9410

mul_tmp_1: f5 f5 48 48 f5 f5 48 48 85 85 43 43 85 85 43 43
mul_tmp_2: 6b 0d 6b 0d 94 10 94 10 6b 0d 6b 0d 94 10 94 10
```
### Input
- `n1`, `n2`, `len`, `mul_tmp_1`, `mul_tmp_2`

### Output
- `mul_tmp_1`, `mul_tmp_2`

### Steps
```algorithm
1. idx = 0, max_idx = 2 * len - 1, threshold = len - 1
2. For set_idx = 0 to max_idx - 1 do:
   a. start = (set_idx >= threshold) ? (set_idx - threshold) : 0
   b. end = (set_idx < len) ? set_idx : threshold
   c. scatter(n1, n2, start, end, mul_tmp_1, mul_tmp_2, idx)
```

## Algorithm: scatter (utility of accumulate_muls)
### Input
- `n1`, `n2`, `start`, `end`, `mul_tmp_1`, `mul_tmp_2`, `idx`

### Output
- `mul_tmp_1`, `mul_tmp_2`, `idx`

### Steps
```algorithm
1. For i = start to end; i++, j-- do:
   a. num1 = n1[i], num2 = n2[j]
   b. Extract the high and low 2-bytes of the numbers
     i.   num1_high = num1 >> 8, num1_low = num1 & 0xFF
     ii.  num2_high = num2 >> 8, num2_low = num2 & 0xFF
   c. Store the high and low 2-bytes of the numbers in the temporary arrays
     i.   mul_tmp_1[idx] = num1_high, mul_tmp_1[idx+1] = num1_high
     ii.  mul_tmp_1[idx+2] = num1_low, mul_tmp_1[idx+3] = num1_low
     iii. mul_tmp_2[idx] = num2_high, mul_tmp_2[idx+1] = num2_high
     iv.  mul_tmp_2[idx+2] = num2_low, mul_tmp_2[idx+3] = num2_low
2. idx += (4 * (end - start + 1))
```

## Algorithm: multiply_muls

### Description
This algorithm simply performs c[i] = a[i] * b[i] for all i
```text
    mul_tmp_1: f5 f5 48 48 f5 f5 48 48 85 85 43 43 85 85 43 43
    mul_tmp_2: 6b 0d 6b 0d 94 10 94 10 6b 0d 6b 0d 94 10 94 10

    result: 6667 c71 1e18 3a8 8da4 f50 29a0 480 3797 6c1 1c01 367 4ce4 850 26bc 430
``` 
*/
### Input
- `n`, `mul_tmp_1`, `mul_tmp_2`, `result`

### Output
- `result`

### Steps
```algorithm
1. For i = 0 to n-1 do:
   a. result[i] = mul_tmp_1[i] * mul_tmp_2[i]
2. Return result
```

## Algorithm: add_within_limbs

### Description: 
This algorithm tries to add the second and third 2-bytes of a limb-product-group. If carry occurs, it is added to the first sub-limb of the first limb of the group. Also, the third 2-bytes of the limb-product-group is set to 0.   
### Example
```text
    result: 6667 c71 1e18 3a8 8da4 f50 29a0 480 3797 6c1 1c01 367 4ce4 850 26bc 430 
    
    result: 6667 2a89 0000 3a8 8da4 38f0 0000 480 3797 22c2 0000 367 4ce4 2f0c 0000 430
```
### Input
- `n`, `result`

### Output
- `result`

### Steps
```algorithm
1. For i = 1 to n-1; i+=4 do:
   a. r = result[i] + result[i+1]
   b. If r > 0xFFFF then:
     i. result[i-1] = result[i-1] + 0x100
   c. result[i] = r & 0xFFFF
   d. result[i+1] = 0
2. Return result
```

## Algorithm: adjust_inner_limbs
#### Description

This algorithm tries to adjust the sub-limbs within a limb group as per the Urdhva-Tiryagbhyam algorithm.

#### Example
```text
        result: 6667 2a89 0000 3a8 8da4 38f0 0000 480 3797 22c2 0000 367 4ce4 2f0c 0000 430
        result: 6691 8ca8 00 00 8ddc f480 00 00 37b9 c567 00 00 4d13 1030 00 00
```
### Input
- `n`, `result`

### Output
- `result`

### Steps
```pseudo
1. size = 4
2. start = 0
3. end = start + size - 1
4. While end < n do:
   a. second = start + 1
   b. carry_1 = 0
   c. carry_2 = 0

   // Example:
   // 37c8    5b2d    0    1001
   // |       |            |
   // start  second        end
   // XXXX    XX2d    0    10XX
   // p = 10 + 2d
   // XXc8    5bXX    0    XXXX
   // q = c8 + 5b

   d. p = (result[end] >> 8) + (result[second] & 0xFF)
   e. If p > 0xFF then:
      i. carry_1 = 1
      ii. p = p & 0xFF

   f. q = (result[second] >> 8) + (result[start] & 0xFF)
   g. If q > 0xFF then:
      i. carry_2 = 1
      ii. q = q & 0xFF

   // Example:
   // 37c8    5b2d    0    1001
   // |       |            |
   // start  second        end
   // XXXX    XX2d    0    10XX
   // p = 10 + 2d = 3d; carry_1 = 0
   // XXc8    5bXX    0    XXXX
   // q = c8 + 5b = 123; carry_2 = 1
   // q = 23
   // result[second] = (1001 & 0xFF) | (3d << 8) = 3d01
   // 37c8    3d01    0    1001
   // |       |              |
   // start   second        end

   h. result[second] = (result[end] & 0xFF) | (p << 8)

   // Adding p's carry to q, while if q overflows, adding it to the first limb's first sub-limb
   i. If carry_1 == 1 then:
      i.  q = (q + 1) & 0xFF
      ii. If q == 0 then:
         1. result[start] = result[start] + 0x100

   // Example:
   // 37c8    3d01    0    1001
   // |       |            |
   // start   second        end
   // After adding carry_2 (note: we are simulating 38c8+13d01) so, 1 should be added to 38
   // 38c8    3d01    0    1001
   // |       |            |
   // start   second        end

   j. If carry_2 == 1 then:
      i. result[start] = result[start] + 0x100

   // Example:
   // 38c8     3d01    0    1001
   // |       |            |
   // start   second        end
   // result[start] = (38c8 & 0xFF00) | q
   // result[start] = 3800 | 23 = 3823
   // 3823     3d01    0     0
   // |       |            |
   // start   second        end

   k. result[start] = (result[start] & 0xFF00) | q
   l. result[end] = 0
   m. start += size
   n. end += size
5. Return result
```

## Algorithm: remove_intermediary_zeros

### Description: 
This algorithm tries to remove the intermediary zeros in the result

### Example
```text
    result:6691 8ca8 00 00 8ddc f480 00 00 37b9 c567 00 00 4d13 1030 00 00 
    result:6691 8ca8 8ddc f480 37b9 c567 4d13 1030
```

### Input
- `n`, `result`

### Output
- `result`

### Steps
```algorithm
1. j = 0
2. For i = 0 to n-1; i+=4 do:
   a. result[j] = result[i]
   b. result[j+1] = result[i+1]
   c. j += 2
3. Return result
```

## Algorithm: add_limbs

### Description
This algorithm tries to add the limbs of the result; as we're assuming limbs of size 2 bytes, we add the limbs in pairs. Also, number of limbs to be added is varied in each iteration as per the size of sets in Urdhva-Tiryagbhyam algorithm.

### Example
```text
    result:(6691 8ca8) (8ddc f480 + 37b9 c567) (4d13 1030)
    result:6691 8ca8 c596 b9e7 4d13 1030
```
### Input
- `n`, `max_idx`, `result`

### Output
- `result`

### Steps
```algorithm
1. add_count = 1, adds = 1, thresh = n - 1, start = 2, end = 4, k = 2
2. While end + 2 < max_idx do:
   a. r = (result[start] << 16) | result[start+1]
   b. i = start + 2
   c. While m < adds do:
        i.   a_high = r >> 16
        ii.  a_low = r & 0xFFFF
        iii. carry = 0
        iv.  r = custom_add(a_high, a_low, result[i], result[i+1], carry)
        v.   If carry == 1 then:
                1. result[k - 2]++
        vi.  If result[k - 2] == 0 then:
                1. result[k - 4]++
        vii.  i += 2
        viii. m++
   d. result[k] = r >> 16
   e. result[k+1] = r & 0xFFFF
   f. k += 2
   g. start = i
   h. add_count++
   i. If add_count > thresh then:
         i.   adds--
   j. Else:
         i.   adds++
   k. end = start + (adds << 1)
3. result[k] = result[end]
4. result[k+1] = result[end+1]
5. Return result
```

## Algorithm: adjust_limbs

### Description: 
This algorithm tries to adjust the limbs of the result; as we're assuming limbs of size 2 bytes, we adjust the limbs in pairs
```text
    result:6691 8ca8 c596 b9e7 4d13 1030 4d13
    result:6692 523f 6fa 1030
```

### Input
- `n`, `result`

### Output
- `result`

### Steps
```algorithm
1. first = n - 2, second = n - 1, ptr = n - 1
2. While first > 0 do:
    a. r = result[first] + result[second]
    b. If r > 0xFFFF then:
        i.  result[first - 1]++
        ii. If result[first - 1] == 0 then:
        1. result[first - 3]++
    c. result[first] = r & 0xFFFF
    d. result[ptr] = r & 0xFFFF
    e. first -= 2, second -= 2, ptr--
3. If first < 0 then:
    a. result[ptr] = result[second]
4. Modify the result to point to result[ptr] while returning
5. result = result + ptr
6. Return result
```


# Note
While I was migrating from 16-bits to 64-bits; some of the carry propagation was not happening as expected; Reason: not explicitly type converting addition results to 128-bits as well as while adding two 64-bit numbers I also forgot the type convert the source. This was causing the carry to be lost. I fixed this by type converting the source to 128-bits and then adding the two 64-bit numbers. This fixed the issue.