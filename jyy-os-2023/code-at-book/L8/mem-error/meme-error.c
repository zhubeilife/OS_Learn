#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int a[10], b;

int main() {
  printf("b = %d\n", b);
  for (int volatile i = 0; i <= 10; i++) {
    a[i] = 99;  // Writing to a[10] is UB
  }
  printf("b = %d\n", b);
}