#include <stdio.h>

int main() {
  long int a = 783;
  long int b = 325;
  
  int fa = 16807;
  int fb = 48271;
  int p = 2147483647;

  int count = 0;
  for (int i = 0; i < 5000000; ++i) {
    do {
	a = (a * fa) % p;
    } while (a % 4 != 0);
    do {
	b = (b * fb) % p;
    } while (b % 8 != 0);
    /* printf("%ld\t%ld\n", a, b); */
    if ((a & 0xFFFF) == (b & 0xFFFF)) {
      ++count;
    }
  }
  printf("%d\n", count);
}
