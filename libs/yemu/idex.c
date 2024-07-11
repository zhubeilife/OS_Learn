#include <assert.h>
#include <stdio.h>
#include "yemu.h"

typedef union inst {
  struct { u8 rs  : 2, rt: 2, op: 4; } rtype;
  struct { u8 addr: 4,        op: 4; } mtype;
} inst_t;

#define RTYPE(i) u8 rt = (i)->rtype.rt, rs = (i)->rtype.rs;
#define MTYPE(i) u8 addr = (i)->mtype.addr;

void idex() {
  inst_t *cur = (inst_t *)&M[pc];   // 取指
  switch (cur->rtype.op) {
    // 操作码译码    操作数译码         执行
    case 0b0000: { RTYPE(cur); R[rt]   = R[rs];   pc++; break; }
    case 0b0001: { RTYPE(cur); R[rt]  += R[rs];   pc++; break; }
    case 0b1110: { MTYPE(cur); R[RA]   = M[addr]; pc++; break; }
    case 0b1111: { MTYPE(cur); M[addr] = R[RA];   pc++; break; }
    default: assert(0);
  }
}
