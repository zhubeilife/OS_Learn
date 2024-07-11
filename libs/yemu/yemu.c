#include <stdio.h>
#include "yemu.h"


/*
Hit GOOD trap @ pc = 5.
M[00] = 0xe7 (231)
M[01] = 0x04 (4)
M[02] = 0xe6 (230)
M[03] = 0x11 (17)
M[04] = 0xf8 (248)
M[05] = 0x00 (0)
M[06] = 0x10 (16)
M[07] = 0x21 (33)
M[08] = 0x31 (49)
M[09] = 0x00 (0)
M[10] = 0x00 (0)
M[11] = 0x00 (0)
M[12] = 0x00 (0)
M[13] = 0x00 (0)
M[14] = 0x00 (0)
M[15] = 0x00 (0)
*/

int main() {
  while (1) {
    if (M[pc] == 0) {
      printf("Hit GOOD trap @ pc = %d.\n", pc);
      for (int i = 0; i < NMEM; i++) {
        printf("M[%02d] = 0x%02x (%d)\n", i, M[i], M[i]);
      }
      break;
    }
    idex();
  }
  return 0;
}

u8 R[NREG] = {};    // 寄存器
u8 M[NMEM] = {      // 内存, 其中包含一个计算z = x + y的程序
  0b11100111,       // load  6#     | R[0] <- M[y]
  0b00000100,       // mov   r1, r0 | R[1] <- R[0]
  0b11100110,       // load  5#     | R[0] <- M[x]
  0b00010001,       // add   r0, r1 | R[0] <- R[0] + R[1]
  0b11111000,       // store 7#     | M[z] <- R[0]
  0b00000000,
  0b00010000,       // x = 16
  0b00100001,       // y = 33
  0b00000000,       // z = 0
};
