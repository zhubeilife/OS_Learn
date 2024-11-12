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

## 2. 应用视角的操作系统

> 状态机（Finite State Machine，FSM）是一种数学模型，用于设计计算机程序和数字逻辑电路。它由有限数量的状态、状态之间的转换以及响应输入的动作组成。状态机在许多领域都有广泛的应用，比如控制系统、通信协议、图形用户界面、游戏开发等。
状态机的基本概念包括：
状态（State）：系统在某一时刻所处的状态。
转换（Transition）：从一个状态到另一个状态的改变，通常由某些事件或条件触发。
事件（Event）：引起状态转换的外部或内部输入。
动作（Action）：在状态转换过程中或在某一状态下执行的操作。

**程序是状态机**

任何程序 = minimal.S = 状态机 ： 都是被操作系统加载，设置成初始状态，然后经历（计算+syscall），最后退出

Everything (C 程序) = 状态机
状态 = 变量数值 + 栈 
初始状态 = main 的第⼀条语句 
状态迁移 = 执⾏⼀条语句中的⼀⼩步

**编译器**

编译器的输⼊
+ ⾼级语⾔ (C) 代码 = 状态机

编译器的输出
+ 汇编代码 (指令序列) = 状态机

编译器 = 状态机之间的翻译器

### Take-away Messages
Everything (高级语言代码、机器代码) 都是状态机；而编译器实现了两种状态机之间的翻译。无论何种状态机，在没有操作系统时，它们只能做纯粹的计算，甚至都不能把结果传递到程序之外——而程序与操作系统沟通的唯一桥梁是系统调用 (例如 x86-64 的 syscall 指令)。

## 3. 硬件视角的操作系统

计算机系统是严格的数学对象：没有魔法；计算机系统的一切行为都是可观测、可理解的。

+ 处理器是无情的执行指令的机器。
+ 处理器会规定好 Reset 后的行为。
+ Reset 后 Firmware 开始运行，再加载操作系统。
+ 厂商逐渐形成了达成共识的 Firmware Specification (IBM PC “兼容机”、UEFI、……)。

## 4. 数学视角的操作系统

## others

### qemu

+ ctrl + a，然后再按x键，就可以退出qemu的环境

### mac m1 运行os-labs程序

+ 首先mac m1缺少 x86_64-linux-gnu-* 的编译环境，所以采用OrbStack的Linux Machine安装arm64版本的linux，然后后用这个来进行编译
+ OrbStack的没有桌面环境，如果只是为了显示字符界面的话，可以在makefile中添加如下脚本，运行qemu的时候用nographic选项
```makefile
ifeq ($(strip $(shell uname -s)), Linux) # Darwin, Linux
  ifeq ($(shell [ ! $(DISPLAY) ] && echo true || echo false), true)
    $(info no display)
    QEMU_FLAGS += -nographic
  else
    $(info has one ${DISPLAY})
  endif
endif
```
+ 对于需要图形界面的场景，其实可以先用linux来编译出来image，在mac的terminal中运行，因为image已经生成了

## 5. 多处理器编程：从入门到放弃

+ “世界上只有一个状态机” 的假设在共享内存并发模型下被打破了。进而，每一次内存 load 都可能会读到其他线程覆盖写入的值——这给并发编程带来了很大的麻烦。
    - 没有其他任何人能 “干涉” 程序的状态
    - 课堂上常用的简化方法
      + 假设一段程序执行没有系统调用
      + 可以直接简化为一个原子的状态迁移 “计算”
    - 编译器会试图优化状态迁移，改变执行流
    ```c
    void T_sum() {
      for (int i = 0; i < 3; i++) {
        int t = load(sum);
        t += 1;
        store(sum, t);
      }
    }
    ```
  
+ 放弃程序按顺序执行的假设,共享内存推翻了编译器的假设,但编译器依然会按照顺序执行优化代码
,否则几乎任何涉及共享内存的代码都变得 “不可优化”.
+ 处理器也是个编译器，即便我们能控制编译器生成的指令，处理器内部还隐藏了一个动态编译器，并且和缓存一起最用，导致系统的并发行为很难预测。并发程序执行的结果，甚至可以不是所有执行过指令的某个排列顺序运行的结果！

### Take-away Messages

在简化多线程的模型中，并发程序就是 “状态机的集合”，每一步选一个状态机执行一步。然而，真实的系统却因为 “编译器” 的无处不在，使共享内存并发的行为十分复杂。