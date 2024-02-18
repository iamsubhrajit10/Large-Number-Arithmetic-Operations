 #include <stdio.h>
 
 void vulnerable(const char *input)
 {
  volatile int value = 0x45454546;
  printf(input);
 }
 int main(int ac, char **av)
 {
  volatile int value = 42;
  char buffer[64];
  fgets(buffer, sizeof(buffer), stdin);
  vulnerable(buffer);
  return 0;
 }
