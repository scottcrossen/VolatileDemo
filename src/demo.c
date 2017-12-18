
#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>

volatile int i = 0;

void* routine(void* args) {
  i++;
  return NULL;
}

void testFunc(int j) {
  pthread_t children[2];
  pthread_create(&children[0], NULL, routine, NULL);
  pthread_create(&children[1], NULL, routine, NULL);
  pthread_join(children[0], NULL);
  pthread_join(children[1], NULL);
  if (i != 2) printf("Output of trial %i: %i\r\n", j, i); fflush(stdout);
}

int main() {
  for (int j = 0; j <= 100000; j++) {
    i = 0;
    testFunc(j);
  }
  return 0;
}
