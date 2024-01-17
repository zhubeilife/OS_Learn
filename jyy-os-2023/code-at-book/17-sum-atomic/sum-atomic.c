#include "thread.h"

#define N 100000000

long sum = 0;

//只有软件和硬件 “协同工作”，才能正确实现多处理器上的并发：我们使用了带有 lock prefix 的 x86 指令，保证单条指令 (可以有一次 load 和一次 store) 不被其他处理器打断。此外，我们还额外声明了 clobber memory，使得逻辑上位于这行语句之前的所有代码访问的内存都被正确写入。我们的 atomic_inc 实现同时包含 compiler 和 memory barrier。

void atomic_inc(long *ptr) {
  asm volatile(
    "lock incq %0"  // Atomic + memory fence
    : "+m"(*ptr)
    :
    : "memory"
  );
}

void Tsum() {
  for (int i = 0; i < N; i++) {
    atomic_inc(&sum);
  }
}

int main() {
  create(Tsum);
  create(Tsum);
  join();
  printf("sum = %ld\n", sum);
}