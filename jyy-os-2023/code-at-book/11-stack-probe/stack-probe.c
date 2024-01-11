#include "thread.h"
#include <stdint.h>

//  最多64个线程，定义在thread.h中的
void * volatile low[64];
void * volatile high[64];

void update_range(int T, void *ptr) {
    if (ptr < low[T]) low[T] = ptr;
    if (ptr > high[T]) high[T] = ptr;
}

void probe(int T, int n) {
  update_range(T, &n);
  long sz = (uintptr_t)high[T] - (uintptr_t)low[T];
  if (sz % 1024 < 32) {
    printf("Stack(T%d) >= %ld KB high:%ld low:%ld\n",
        T, sz / 1024, (uintptr_t)high[T], (uintptr_t)low[T]);
  }
  probe(T, n + 1);  // Infinite recursion
}

void Tprobe(int T) {
  low[T] = (void *)-1;
  high[T] = (void *)0;
  update_range(T, &T);
  probe(T, 0);
}

int main() {
  setbuf(stdout, NULL);  // 关掉缓冲区，能让每个输出都输出
  for (int i = 0; i < 4; i++) {
    create(Tprobe);
  }
}

/* result:

大概是8192KB， high的地址是不变的，说明stack是向下的

Stack(T2) >= 4220 KB high:281473369303308 low:281473364982008
Stack(T2) >= 4221 KB high:281473369303308 low:281473364981000
Stack(T2) >= 4223 KB high:281473369303308 low:281473364978936
Stack(T2) >= 4224 KB high:281473369303308 low:281473364977928
Stack(T2) >= 4226 KB high:281473369303308 low:281473364975864
Stack(T2) >= 4227 KB high:281473369303308 low:281473364974856
Stack(T2) >= 4229 KB high:281473369303308 low:281473364972792
Stack(T2) >= 4230 KB high:281473369303308 low:281473364971784
Stack(T3) >= 8166 KB high:281473360849164 low:281473352487176
Stack(T3) >= 8168 KB high:281473360849164 low:281473352485112
Stack(T3) >= 8169 KB high:281473360849164 low:281473352484104
Stack(T3) >= 8171 KB high:281473360849164 low:281473352482040
Stack(T3) >= 8172 KB high:281473360849164 low:281473352481032
Stack(T3) >= 8174 KB high:281473360849164 low:281473352478968
Segmentation fault
*/