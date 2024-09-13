Dump of assembler code for function __gmpz_sub:
   0x00007ffff7f4dac0 <+0>:     endbr64 
   0x00007ffff7f4dac4 <+4>:     push   %r15
   0x00007ffff7f4dac6 <+6>:     push   %r14
   0x00007ffff7f4dac8 <+8>:     mov    %rdi,%r14
   0x00007ffff7f4dacb <+11>:    push   %r13
   0x00007ffff7f4dacd <+13>:    mov    %rsi,%r13
   0x00007ffff7f4dad0 <+16>:    push   %r12
   0x00007ffff7f4dad2 <+18>:    push   %rbp
   0x00007ffff7f4dad3 <+19>:    push   %rbx
   0x00007ffff7f4dad4 <+20>:    sub    $0x18,%rsp
   0x00007ffff7f4dad8 <+24>:    mov    0x4(%rdx),%eax
   0x00007ffff7f4dadb <+27>:    movslq 0x4(%rsi),%r8
   0x00007ffff7f4dadf <+31>:    mov    %eax,%r15d
   0x00007ffff7f4dae2 <+34>:    mov    %r8d,%ebx
   0x00007ffff7f4dae5 <+37>:    mov    %eax,%ebp
   0x00007ffff7f4dae7 <+39>:    neg    %r15d
   0x00007ffff7f4daea <+42>:    neg    %ebx
   0x00007ffff7f4daec <+44>:    cmovs  %r8d,%ebx
   0x00007ffff7f4daf0 <+48>:    neg    %ebp
   0x00007ffff7f4daf2 <+50>:    movslq %r15d,%r15
   0x00007ffff7f4daf5 <+53>:    cmovs  %eax,%ebp
   0x00007ffff7f4daf8 <+56>:    mov    %ebx,%ebx
   0x00007ffff7f4dafa <+58>:    mov    %ebp,%ebp
   0x00007ffff7f4dafc <+60>:    cmp    %rbp,%rbx
   0x00007ffff7f4daff <+63>:    jge    0x7ffff7f4db19 <__gmpz_sub+89>
   0x00007ffff7f4db01 <+65>:    mov    %rbx,%rax
   0x00007ffff7f4db04 <+68>:    mov    %rbp,%rbx
   0x00007ffff7f4db07 <+71>:    mov    %rdx,%r13
   0x00007ffff7f4db0a <+74>:    mov    %rsi,%rdx
   0x00007ffff7f4db0d <+77>:    mov    %rax,%rbp
   0x00007ffff7f4db10 <+80>:    mov    %r8,%rax
   0x00007ffff7f4db13 <+83>:    mov    %r15,%r8
   0x00007ffff7f4db16 <+86>:    mov    %rax,%r15
   0x00007ffff7f4db19 <+89>:    movslq (%r14),%rax
   0x00007ffff7f4db1c <+92>:    lea    0x1(%rbx),%rsi
   0x00007ffff7f4db20 <+96>:    cmp    %rsi,%rax
   0x00007ffff7f4db23 <+99>:    jl     0x7ffff7f4ddd0 <__gmpz_sub+784>
   0x00007ffff7f4db29 <+105>:   mov    0x8(%r14),%r12
   0x00007ffff7f4db2d <+109>:   xor    %r8,%r15
   0x00007ffff7f4db30 <+112>:   mov    0x8(%r13),%r13
   0x00007ffff7f4db34 <+116>:   mov    0x8(%rdx),%r9
   0x00007ffff7f4db38 <+120>:   js     0x7ffff7f4dc00 <__gmpz_sub+320>
   0x00007ffff7f4db3e <+126>:   test   %rbp,%rbp
   0x00007ffff7f4db41 <+129>:   jne    0x7ffff7f4dcb0 <__gmpz_sub+496>
   0x00007ffff7f4db47 <+135>:   cmp    %r13,%r12
   0x00007ffff7f4db4a <+138>:   je     0x7ffff7f4dbba <__gmpz_sub+250>
   0x00007ffff7f4db4c <+140>:   cmp    %rbp,%rbx
   0x00007ffff7f4db4f <+143>:   jle    0x7ffff7f4dbba <__gmpz_sub+250>
   0x00007ffff7f4db51 <+145>:   lea    0x0(,%rbp,8),%rdx
   0x00007ffff7f4db59 <+153>:   mov    %rbx,%rdi
   0x00007ffff7f4db5c <+156>:   lea    (%r12,%rdx,1),%rsi
   0x00007ffff7f4db60 <+160>:   lea    0x8(%r13,%rdx,1),%rax
   0x00007ffff7f4db65 <+165>:   sub    %rbp,%rdi
   0x00007ffff7f4db68 <+168>:   cmp    %rax,%rsi
   0x00007ffff7f4db6b <+171>:   je     0x7ffff7f4dbe8 <__gmpz_sub+296>
   0x00007ffff7f4db6d <+173>:   lea    -0x1(%rdi),%rax
   0x00007ffff7f4db71 <+177>:   cmp    $0x2,%rax
   0x00007ffff7f4db75 <+181>:   jbe    0x7ffff7f4dbe8 <__gmpz_sub+296>
   0x00007ffff7f4db77 <+183>:   mov    %rdi,%rcx
   0x00007ffff7f4db7a <+186>:   add    %r13,%rdx
   0x00007ffff7f4db7d <+189>:   xor    %eax,%eax
   0x00007ffff7f4db7f <+191>:   shr    %rcx
   0x00007ffff7f4db82 <+194>:   shl    $0x4,%rcx
   0x00007ffff7f4db86 <+198>:   cs nopw 0x0(%rax,%rax,1)
   0x00007ffff7f4db90 <+208>:   movdqu (%rdx,%rax,1),%xmm0
   0x00007ffff7f4db95 <+213>:   movups %xmm0,(%rsi,%rax,1)
   0x00007ffff7f4db99 <+217>:   add    $0x10,%rax
   0x00007ffff7f4db9d <+221>:   cmp    %rax,%rcx
   0x00007ffff7f4dba0 <+224>:   jne    0x7ffff7f4db90 <__gmpz_sub+208>
   0x00007ffff7f4dba2 <+226>:   mov    %rdi,%rax
   0x00007ffff7f4dba5 <+229>:   and    $0xfffffffffffffffe,%rax
   0x00007ffff7f4dba9 <+233>:   add    %rax,%rbp
   0x00007ffff7f4dbac <+236>:   cmp    %rax,%rdi
   0x00007ffff7f4dbaf <+239>:   je     0x7ffff7f4dbba <__gmpz_sub+250>
   0x00007ffff7f4dbb1 <+241>:   mov    0x0(%r13,%rbp,8),%rax
   0x00007ffff7f4dbb6 <+246>:   mov    %rax,(%r12,%rbp,8)
   0x00007ffff7f4dbba <+250>:   xor    %eax,%eax
   0x00007ffff7f4dbbc <+252>:   mov    %rax,(%r12,%rbx,8)
   0x00007ffff7f4dbc0 <+256>:   add    %rax,%rbx
   0x00007ffff7f4dbc3 <+259>:   mov    %rbx,%rax
   0x00007ffff7f4dbc6 <+262>:   neg    %rax
   0x00007ffff7f4dbc9 <+265>:   test   %r8,%r8
   0x00007ffff7f4dbcc <+268>:   cmovs  %rax,%rbx
   0x00007ffff7f4dbd0 <+272>:   mov    %ebx,0x4(%r14)
   0x00007ffff7f4dbd4 <+276>:   add    $0x18,%rsp
   0x00007ffff7f4dbd8 <+280>:   pop    %rbx
   0x00007ffff7f4dbd9 <+281>:   pop    %rbp
   0x00007ffff7f4dbda <+282>:   pop    %r12
   0x00007ffff7f4dbdc <+284>:   pop    %r13
   0x00007ffff7f4dbde <+286>:   pop    %r14
   0x00007ffff7f4dbe0 <+288>:   pop    %r15
   0x00007ffff7f4dbe2 <+290>:   ret    
   0x00007ffff7f4dbe3 <+291>:   nopl   0x0(%rax,%rax,1)
   0x00007ffff7f4dbe8 <+296>:   mov    0x0(%r13,%rbp,8),%rax
   0x00007ffff7f4dbed <+301>:   mov    %rax,(%r12,%rbp,8)
   0x00007ffff7f4dbf1 <+305>:   add    $0x1,%rbp
   0x00007ffff7f4dbf5 <+309>:   cmp    %rbp,%rbx
   0x00007ffff7f4dbf8 <+312>:   jne    0x7ffff7f4dbe8 <__gmpz_sub+296>
   0x00007ffff7f4dbfa <+314>:   jmp    0x7ffff7f4dbba <__gmpz_sub+250>
   0x00007ffff7f4dbfc <+316>:   nopl   0x0(%rax)
   0x00007ffff7f4dc00 <+320>:   cmp    %rbp,%rbx
   0x00007ffff7f4dc03 <+323>:   je     0x7ffff7f4dd70 <__gmpz_sub+688>
   0x00007ffff7f4dc09 <+329>:   test   %rbp,%rbp
   0x00007ffff7f4dc0c <+332>:   jne    0x7ffff7f4dd20 <__gmpz_sub+608>
   0x00007ffff7f4dc12 <+338>:   cmp    %r13,%r12
   0x00007ffff7f4dc15 <+341>:   je     0x7ffff7f4dc8a <__gmpz_sub+458>
   0x00007ffff7f4dc17 <+343>:   cmp    %rbp,%rbx
   0x00007ffff7f4dc1a <+346>:   jle    0x7ffff7f4dc8a <__gmpz_sub+458>
   0x00007ffff7f4dc1c <+348>:   lea    0x0(,%rbp,8),%rdx
   0x00007ffff7f4dc24 <+356>:   mov    %rbx,%rdi
   0x00007ffff7f4dc27 <+359>:   lea    (%r12,%rdx,1),%rsi
   0x00007ffff7f4dc2b <+363>:   lea    0x8(%r13,%rdx,1),%rax
   0x00007ffff7f4dc30 <+368>:   sub    %rbp,%rdi
   0x00007ffff7f4dc33 <+371>:   cmp    %rax,%rsi
   0x00007ffff7f4dc36 <+374>:   je     0x7ffff7f4dd00 <__gmpz_sub+576>
   0x00007ffff7f4dc3c <+380>:   lea    -0x1(%rdi),%rax
   0x00007ffff7f4dc40 <+384>:   cmp    $0x2,%rax
   0x00007ffff7f4dc44 <+388>:   jbe    0x7ffff7f4dd00 <__gmpz_sub+576>
   0x00007ffff7f4dc4a <+394>:   mov    %rdi,%rcx
   0x00007ffff7f4dc4d <+397>:   add    %r13,%rdx
   0x00007ffff7f4dc50 <+400>:   xor    %eax,%eax
   0x00007ffff7f4dc52 <+402>:   shr    %rcx
   0x00007ffff7f4dc55 <+405>:   shl    $0x4,%rcx
   0x00007ffff7f4dc59 <+409>:   nopl   0x0(%rax)
   0x00007ffff7f4dc60 <+416>:   movdqu (%rdx,%rax,1),%xmm1
   0x00007ffff7f4dc65 <+421>:   movups %xmm1,(%rsi,%rax,1)
   0x00007ffff7f4dc69 <+425>:   add    $0x10,%rax
   0x00007ffff7f4dc6d <+429>:   cmp    %rcx,%rax
   0x00007ffff7f4dc70 <+432>:   jne    0x7ffff7f4dc60 <__gmpz_sub+416>
   0x00007ffff7f4dc72 <+434>:   mov    %rdi,%rax
   0x00007ffff7f4dc75 <+437>:   and    $0xfffffffffffffffe,%rax
   0x00007ffff7f4dc79 <+441>:   add    %rax,%rbp
   0x00007ffff7f4dc7c <+444>:   cmp    %rdi,%rax
   0x00007ffff7f4dc7f <+447>:   je     0x7ffff7f4dc8a <__gmpz_sub+458>
   0x00007ffff7f4dc81 <+449>:   mov    0x0(%r13,%rbp,8),%rax
   0x00007ffff7f4dc86 <+454>:   mov    %rax,(%r12,%rbp,8)
   0x00007ffff7f4dc8a <+458>:   test   %rbx,%rbx
   0x00007ffff7f4dc8d <+461>:   jne    0x7ffff7f4dca2 <__gmpz_sub+482>
   0x00007ffff7f4dc8f <+463>:   jmp    0x7ffff7f4dbc3 <__gmpz_sub+259>
   0x00007ffff7f4dc94 <+468>:   nopl   0x0(%rax)
   0x00007ffff7f4dc98 <+472>:   sub    $0x1,%rbx
   0x00007ffff7f4dc9c <+476>:   je     0x7ffff7f4dbc3 <__gmpz_sub+259>
   0x00007ffff7f4dca2 <+482>:   cmpq   $0x0,-0x8(%r12,%rbx,8)
   0x00007ffff7f4dca8 <+488>:   je     0x7ffff7f4dc98 <__gmpz_sub+472>
   0x00007ffff7f4dcaa <+490>:   jmp    0x7ffff7f4dbc3 <__gmpz_sub+259>
   0x00007ffff7f4dcaf <+495>:   nop
   0x00007ffff7f4dcb0 <+496>:   mov    %rbp,%rcx
   0x00007ffff7f4dcb3 <+499>:   mov    %r9,%rdx
   0x00007ffff7f4dcb6 <+502>:   mov    %r13,%rsi
   0x00007ffff7f4dcb9 <+505>:   mov    %r12,%rdi
   0x00007ffff7f4dcbc <+508>:   mov    %r8,(%rsp)
   0x00007ffff7f4dcc0 <+512>:   call   0x7ffff7f95700 <__gmpn_add_n>
   0x00007ffff7f4dcc5 <+517>:   mov    (%rsp),%r8
   0x00007ffff7f4dcc9 <+521>:   test   %rax,%rax
   0x00007ffff7f4dccc <+524>:   je     0x7ffff7f4db47 <__gmpz_sub+135>
   0x00007ffff7f4dcd2 <+530>:   jmp    0x7ffff7f4dcf0 <__gmpz_sub+560>
   0x00007ffff7f4dcd4 <+532>:   nopl   0x0(%rax)
   0x00007ffff7f4dcd8 <+536>:   mov    0x0(%r13,%rbp,8),%rax
   0x00007ffff7f4dcdd <+541>:   add    $0x1,%rbp
   0x00007ffff7f4dce1 <+545>:   add    $0x1,%rax
   0x00007ffff7f4dce5 <+549>:   mov    %rax,-0x8(%r12,%rbp,8)
   0x00007ffff7f4dcea <+554>:   jne    0x7ffff7f4db47 <__gmpz_sub+135>
   0x00007ffff7f4dcf0 <+560>:   cmp    %rbp,%rbx
   0x00007ffff7f4dcf3 <+563>:   jg     0x7ffff7f4dcd8 <__gmpz_sub+536>
   0x00007ffff7f4dcf5 <+565>:   mov    $0x1,%eax
   0x00007ffff7f4dcfa <+570>:   jmp    0x7ffff7f4dbbc <__gmpz_sub+252>
   0x00007ffff7f4dcff <+575>:   nop
   0x00007ffff7f4dd00 <+576>:   mov    0x0(%r13,%rbp,8),%rax
   0x00007ffff7f4dd05 <+581>:   mov    %rax,(%r12,%rbp,8)
   0x00007ffff7f4dd09 <+585>:   add    $0x1,%rbp
   0x00007ffff7f4dd0d <+589>:   cmp    %rbp,%rbx
   0x00007ffff7f4dd10 <+592>:   jne    0x7ffff7f4dd00 <__gmpz_sub+576>
   0x00007ffff7f4dd12 <+594>:   jmp    0x7ffff7f4dc8a <__gmpz_sub+458>
   0x00007ffff7f4dd17 <+599>:   nopw   0x0(%rax,%rax,1)
   0x00007ffff7f4dd20 <+608>:   mov    %rbp,%rcx
   0x00007ffff7f4dd23 <+611>:   mov    %r9,%rdx
   0x00007ffff7f4dd26 <+614>:   mov    %r13,%rsi
   0x00007ffff7f4dd29 <+617>:   mov    %r12,%rdi
   0x00007ffff7f4dd2c <+620>:   mov    %r8,(%rsp)
   0x00007ffff7f4dd30 <+624>:   call   0x7ffff7f95820 <__gmpn_sub_n>
   0x00007ffff7f4dd35 <+629>:   mov    (%rsp),%r8
   0x00007ffff7f4dd39 <+633>:   test   %rax,%rax
   0x00007ffff7f4dd3c <+636>:   je     0x7ffff7f4dc12 <__gmpz_sub+338>
   0x00007ffff7f4dd42 <+642>:   jmp    0x7ffff7f4dd63 <__gmpz_sub+675>
   0x00007ffff7f4dd44 <+644>:   nopl   0x0(%rax)
   0x00007ffff7f4dd48 <+648>:   mov    0x0(%r13,%rbp,8),%rax
   0x00007ffff7f4dd4d <+653>:   add    $0x1,%rbp
   0x00007ffff7f4dd51 <+657>:   lea    -0x1(%rax),%rdx
   0x00007ffff7f4dd55 <+661>:   mov    %rdx,-0x8(%r12,%rbp,8)
   0x00007ffff7f4dd5a <+666>:   test   %rax,%rax
   0x00007ffff7f4dd5d <+669>:   jne    0x7ffff7f4dc12 <__gmpz_sub+338>
   0x00007ffff7f4dd63 <+675>:   cmp    %rbp,%rbx
   0x00007ffff7f4dd66 <+678>:   jg     0x7ffff7f4dd48 <__gmpz_sub+648>
   0x00007ffff7f4dd68 <+680>:   jmp    0x7ffff7f4dc8a <__gmpz_sub+458>
   0x00007ffff7f4dd6d <+685>:   nopl   (%rax)
   0x00007ffff7f4dd70 <+688>:   mov    %rbx,%rax
   0x00007ffff7f4dd73 <+691>:   jmp    0x7ffff7f4dd83 <__gmpz_sub+707>
   0x00007ffff7f4dd75 <+693>:   nopl   (%rax)
   0x00007ffff7f4dd78 <+696>:   mov    (%r9,%rax,8),%rdi
   0x00007ffff7f4dd7c <+700>:   cmp    %rdi,0x0(%r13,%rax,8)
   0x00007ffff7f4dd81 <+705>:   jne    0x7ffff7f4ddf8 <__gmpz_sub+824>
   0x00007ffff7f4dd83 <+707>:   sub    $0x1,%rax
   0x00007ffff7f4dd87 <+711>:   jae    0x7ffff7f4dd78 <__gmpz_sub+696>
   0x00007ffff7f4dd89 <+713>:   mov    %rbx,%rcx
   0x00007ffff7f4dd8c <+716>:   mov    %r9,%rdx
   0x00007ffff7f4dd8f <+719>:   mov    %r13,%rsi
   0x00007ffff7f4dd92 <+722>:   mov    %r12,%rdi
   0x00007ffff7f4dd95 <+725>:   mov    %r8,(%rsp)
   0x00007ffff7f4dd99 <+729>:   call   0x7ffff7f95820 <__gmpn_sub_n>
   0x00007ffff7f4dd9e <+734>:   test   %rbx,%rbx
   0x00007ffff7f4dda1 <+737>:   mov    (%rsp),%r8
   0x00007ffff7f4dda5 <+741>:   jne    0x7ffff7f4ddba <__gmpz_sub+762>
   0x00007ffff7f4dda7 <+743>:   jmp    0x7ffff7f4dbc3 <__gmpz_sub+259>
   0x00007ffff7f4ddac <+748>:   nopl   0x0(%rax)
   0x00007ffff7f4ddb0 <+752>:   sub    $0x1,%rbx
   0x00007ffff7f4ddb4 <+756>:   je     0x7ffff7f4dbc3 <__gmpz_sub+259>
   0x00007ffff7f4ddba <+762>:   cmpq   $0x0,-0x8(%r12,%rbx,8)
   0x00007ffff7f4ddc0 <+768>:   je     0x7ffff7f4ddb0 <__gmpz_sub+752>
   0x00007ffff7f4ddc2 <+770>:   jmp    0x7ffff7f4dbc3 <__gmpz_sub+259>
   0x00007ffff7f4ddc7 <+775>:   nopw   0x0(%rax,%rax,1)
   0x00007ffff7f4ddd0 <+784>:   mov    %r14,%rdi
   0x00007ffff7f4ddd3 <+787>:   mov    %rdx,0x8(%rsp)
   0x00007ffff7f4ddd8 <+792>:   mov    %r8,(%rsp)
   0x00007ffff7f4dddc <+796>:   call   0x7ffff7f4d120 <__gmpz_realloc>
   0x00007ffff7f4dde1 <+801>:   mov    (%rsp),%r8
   0x00007ffff7f4dde5 <+805>:   mov    0x8(%rsp),%rdx
   0x00007ffff7f4ddea <+810>:   mov    %rax,%r12
   0x00007ffff7f4dded <+813>:   jmp    0x7ffff7f4db2d <__gmpz_sub+109>
   0x00007ffff7f4ddf2 <+818>:   nopw   0x0(%rax,%rax,1)
   0x00007ffff7f4ddf8 <+824>:   ja     0x7ffff7f4dd89 <__gmpz_sub+713>
   0x00007ffff7f4ddfa <+826>:   mov    %rbx,%rcx
   0x00007ffff7f4ddfd <+829>:   mov    %r13,%rdx
   0x00007ffff7f4de00 <+832>:   mov    %r9,%rsi
   0x00007ffff7f4de03 <+835>:   mov    %r12,%rdi
   0x00007ffff7f4de06 <+838>:   mov    %r8,(%rsp)
   0x00007ffff7f4de0a <+842>:   call   0x7ffff7f95820 <__gmpn_sub_n>
   0x00007ffff7f4de0f <+847>:   test   %rbx,%rbx
   0x00007ffff7f4de12 <+850>:   mov    (%rsp),%r8
   0x00007ffff7f4de16 <+854>:   jne    0x7ffff7f4de26 <__gmpz_sub+870>
   0x00007ffff7f4de18 <+856>:   jmp    0x7ffff7f4de2e <__gmpz_sub+878>
   0x00007ffff7f4de1a <+858>:   nopw   0x0(%rax,%rax,1)
   0x00007ffff7f4de20 <+864>:   sub    $0x1,%rbx
   0x00007ffff7f4de24 <+868>:   je     0x7ffff7f4de2e <__gmpz_sub+878>
   0x00007ffff7f4de26 <+870>:   cmpq   $0x0,-0x8(%r12,%rbx,8)
   0x00007ffff7f4de2c <+876>:   je     0x7ffff7f4de20 <__gmpz_sub+864>
   0x00007ffff7f4de2e <+878>:   mov    %rbx,%rax
   0x00007ffff7f4de31 <+881>:   neg    %rax
   0x00007ffff7f4de34 <+884>:   test   %r8,%r8
   0x00007ffff7f4de37 <+887>:   cmovns %rax,%rbx
   0x00007ffff7f4de3b <+891>:   jmp    0x7ffff7f4dbd0 <__gmpz_sub+272>