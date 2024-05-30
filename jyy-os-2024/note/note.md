# jyy os 2024

## 1.操作系统概述

操作系统是一个典型的 “system”——它完成对计算机硬件系统的抽象，为应用程序提供运行的支。我们的课程从三个视角观察操作系统：
+ 从应用程序的视角看，操作系统定义了一系列的对象 (进程/线程、地址空间、文件、设备……) 和操纵它们的 API (系统调用)。
+ 从硬件的视角看，操作系统是一个拥有访问全部硬件功能的程序 (操作系统就是个 C 程序，不用怕)。
+ 从数学的视角看，一切计算机系统都是如同 “1 + 1 = 2” 一样 “well-defined” 的数学对象，这包括机器、程序，当然也包括操作系统。

课程里反复强调程序就是一个状态机，比如这里CPU的寄存器和内存就是一个状态，rv32ima_step函数根据当前的CPUState计算执行了一个指令之后的CPU状态

```c++
struct CPUState {
    // Processor internal state
    uint32_t regs[32], csrs[CSR_COUNT];

    // Memory state
    uint8_t *mem;
    uint32_t mem_offset, mem_size;
};

static inline int32_t rv32ima_step(struct CPUState *state, uint32_t elapsedUs) {
    #define CSR(x) (state->csrs[x])
    #define REG(x) (state->regs[x])
    #define MEM(x) (&state->mem[x])
```