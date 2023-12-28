# L0: 为计算机硬件编程

> #### ⏰ 截止日期
>
> **Soft Deadline: 2022 年 3 月 19 日 23:59:59。**
>
> 你需要首先阅读[实验须知](https://jyywiki.cn/OS/2023/labs/Labs.html)。
>
> 在命令行中 `git pull origin L0` 下载框架代码。

OS2023-L0 提交结果

## 1. 背景

曾经，“写操作系统” 是一件很神秘的工作，因为操作系统有点小众，又涉及很多底层的硬件细节。如果想自己摸爬滚打 (不利用他人的代码)，即便是加载一个小 kernel 也是一件很繁琐的事情。很多 Tutorial 把硬件的细节 (例如 x86 的 GDT, IDT, TSS, ...) 和操作系统实现捆绑在一起，就显得更难上手了。

但实际上， **操作系统和硬件之间的关系被夸大了** 。硬件的确提供了必要的机制使我们能实现诸如进程/线程切换，但并不意味着除非我们知道有关硬件指令的一切才能编写操作系统。只要能做出适当的抽象，编程的难度就会大大降低。这门课程为大家建立的观念是：操作系统 **在 99.99% 的时候都是普通的 C 程序** ，只是偶尔会干一些 “出格” 的事情。我们当然会在适当的时候引入这些骚 (黑) 操 (科) 作 (技)，以及它们是如何借助硬件指令和机制实现的。但我们首先要使你相信，经过适当的配置，你完全可以用你熟悉的方式编写操作系统，就像我们在课堂上展示的那样：

```c++
#include<am.h>

#define ESC "\033["
#define RED ESC "01;31m"
#define CLR ESC "0m"

constchar*MESSAGE=RED"Hello, OS World\n"CLR;

int main(){
    for(const char*s=MESSAGE; *s; s++){
        putch(*s);// Prints to platform-dependent debug console
    }
}
```

借助 putch，我们就得到了一个 “操作系统内核”。

## 2. 实验描述

### 2.1. 阅读 AbstractMachine 文档

想知道为什么能用你熟悉的方式编写操作系统？[阅读 AbstractMachine 的文档](https://jyywiki.cn/AbstractMachine/index.html)。当然，文档很多，你不必一次看完，建立了一些基本概念后，就可以试着从样例代码出发开始编程了。另一个好消息是我们的实验框架中直接包含了 AbstractMachine 的代码并在 Makefile 中完成了配置 (RTFSC)，从而你无需额外配置/下载。

### 2.1.实现 AbstractMachine 中 klib 中缺失的函数

> #### ⚠️ 本项目为选做
>
> 如果你对编程感到很苦恼，不妨只实现一些简化版本的库，无需全部实现；随着实验的进展后续补齐。

虽然我们已经为大家搭建好了 C 语言代码在 bare-metal 上执行的环境，但你一定不想只用 `putch` 打印吧！这会使你连打印一个整数都麻烦到怀疑人生。实际上，AbstractMachine 框架代码中包含一个基础运行库的框架 klib，其中包含了方便你编写 “bare-metal” 程序的系列库函数，例如 `assert`, `printf`, `memcpy` 等。我们不强制你实现所有 klib 函数，但随着操作系统实验的进展，你会体会到不实现库函数的苦头。

如果你在《计算机系统基础》中已经完成了实现，你可以直接复制你的实现 (但要小心！你的库实现可能有 bug，或是不能在**多处理器**的情况下工作)。这部分代码非常重要——会一直使用到这学期的最后，因此也请你非常小心地编写代码，例如编写相当多的 assertions；klib 中的 bug 会使原本就已很困难的操作系统内核调试更加令人沮丧。

> #### ❓ Assertions?
>
> 库函数里还能给什么 assertions？这里的学问可大了。实际上，C 语言里的每一个变量都有它的 “含义”，例如都是指针，甚至是 `void *` 类型的指针，有些可能是指向对象的，有些则是指向代码的。在 “不该发生” (例如一个本应该为正数的值给成了负数，或是 `memcpy` 复制了超过 16 MB 的数据等) 的事情上给出警告或 assert 错误，能极大地帮助你尽早发现问题。
>
> 当然，这件事早已被学术界注意到，例如 [refinement type](https://arxiv.org/abs/2010.07763) 和 [Daikon invariant detector](http://plse.cs.washington.edu/daikon/)。虽然你未必会用这些研究工具，但其中的思想会极大地影响你的编程方式。

### 2.2. 在 AbstractMachine 中显示一张图片

你需要编写一个直接运行在 AbstractMachine 上 (仅仅启用 IOE 扩展，不使用其他硬件机制如中断/异常/虚拟存储/多处理器) 的程序，显示一张图片；满足：

1. 显示一张任何图片，但能适配不同的屏幕大小。确保你的图片在 320×200、640×480、800×600 等分辨率下均可以正常显示；
2. 图片中包含不少于 10 种颜色。
3. 程序使用的内存 (代码、静态数据总和不超过 4 MiB、堆区 `heap` 使用不超过 4 MiB)；
4. 按 ESC 键后调用 `halt()` 退出；除此之外，按任何键程序都不应退出。

你的代码应当有一定的可移植性：

* 同 minilabs 一样，你的程序可能运行在 32/64-bit 平台，因此你应当使用 `intptr_t` 或 `uintptr_t` 来保存指针数值；
* 兼容大/小端，因此禁止把不同大小的指针类型强制转换；

我们会在 x86_64-qemu (64-bit) 和 x86-qemu (32-bit) 两个环境下运行，你的程序必须在两个环境下都能正确编译并运行良好。此外，AbstractMachine 假设 bare-metal 不支持浮点数指令。在 x86_64 的编译选项中，我们添加了 `-mno-sse`。尽管有浮点数的程序在 `ARCH=native` 下可以正确编译运行，但可能在其他架构下失效。这么做的目的是使 AbstractMachine 程序能运行在各种 (简化) 的处理器上。

## 3. 正确性标准

Online Judge 会严格按照上面的要求来评测：

1. 通过 qemu 的 `-m` 选项限制内存的大小；使用超过规定的内存可能导致程序 crash；
2. 在不同的环境下 (x86-qemu 或 x86_64-qemu, native) 运行你的程序，并且可能修改屏幕的分辨率；
3. 随机发送一定的键盘事件。

Online Judge 会作出如下正确性检查：

1. 除非按 ESC 键，我们假设程序不结束；如果检测到 `halt()` 的调用 (包括 assert 失败，我们可能会增加一些额外的合法性检查)，将判定为错 (Runtime Error 或 Wrong Answer)；
2. 如果按 ESC 键后程序不结束，将判定为错；
3. 如果虚拟机或进程发生崩溃、非预期的重启等 (由 undefined behavior 导致，例如访问某非法内存可能导致异常或 CPU Reset)，则被判定为错；
4. 其他违反 specifications 的问题，如在 `ioe_init()` 之前调用 `io_read`/`io_write`，将被判定为错。

此外，我们会链接我们 klib 的参考实现，因此你不必担心你的 klib 有些许问题；但你要保持 klib 库函数的行为与 libc 一致。注意 native 会链接系统本地的 glibc (而非 klib)。

## 4. 实验指南

### 4.1. 实现库函数

实现库函数是普通的 C 语言练习题；互联网上也有很多代码可以参考，但 “照抄” 会使你失去训练的机会：如果你独立编写，很可能会遇到各种 bugs，而调试的过程恰恰就是长进的过程。

另外，我们在编写可移植代码时，应当尽量使用 C 标准提供的机制，而不是做一些对硬件的假设，例如在 i386 平台上的 printf 有以下 “高明” (其实并不高明) 的实现方法 (请你花时间理解一下)：

```c++
int printf(const char* fmt, ...){
int *args = (int*)&fmt+1;
//          (int *)(&fmt + 1) also works; why?
// args[0], args[1], ... 分别是第 1, 2, ... 个可变参数
}
```

上述代码其实做了一些 i386 特定的假设：

1. 所有参数构成一个 (堆栈上的) “数组”，因此可以用 `&fmt + 1` 得到剩余参数的起始地址；
2. `int` 类型的长度与指针的长度相同。

但在 x86-64 上，上述两个假设都不再成立，前 6 个参数用寄存器传递，且 `sizeof(int)` 通常是 `4`。可移植的方式是使用 `stdarg.h` 中的 `va_list`, `va_start`, `va_arg`。机器相关的假设、数据类型大小的假设 (`(int *)ptr` 在 64-bit 平台上将会报错) 等都可能引起移植性问题。

注意你可以在本地通过修改 Makefile 绕过某些 warnings，使你的程序看起来正确地在多个平台上运行；但 Online Judge 会使用我们的 Makefile 和 AbstractMachine 实现，并且可能经过一定的修改 (例如设置为不同的屏幕分辨率)。

### 4.2. 访问 I/O 设备

没有库函数的 C 语言程序类似于状态机，只能完成纯粹的 “计算”。TRM 中唯一能够和外界交互的手段是 `putch()` 在调试终端上打印字符和 `halt()` 终止程序。我们的硬件提供了若干 I/O 设备，AbstractMachine 可以通过 IOE 访问它们。在调用 I/O 设备之前，需要调用 `ioe_init()` 初始化，然后就可以用

```c++
void ioe_read(int reg, void *buf);
void ioe_write(int reg, void *buf);
```

两个函数访问 AbstractMachine 中的 I/O “寄存器” 了。详情请参考 AbstractMachine 文档和框架代码。在 `klib-macros.h` 中包含了更简化的 I/O 寄存器访问方法 `io_read` 和 `io_write`，请大家查看。用这组 API 你就可以省去手工定义变量的麻烦，例如直接

```c++
int width = io_read(AM_GPU_CONFIG).width;
```

到这里，大家可能会产生的一个疑问是：运行在 “裸机” 上的程序可以用哪些标准库？我们知道，libc 中相当一部分函数都调用操作系统，例如 `printf`, `malloc` 等，即便引用了 `stdio.h` 这样的头文件，它们的实现依然是缺失的；另一方面，我们引用了一些库的头文件，例如 `stdint.h` (包含诸如 `int32_t` 这些类型的定义)、`stdarg.h` 等，却可以正常工作。这是为什么？

事实上，AbstractMachine 的程序运行在 [freestanding 的环境下](https://wiki.osdev.org/C_Library) (操作系统上的 C 程序运行在 hosted 环境下)：The `__STDC_HOSTED__` macro expands to `1` on hosted implementations, or 0 on freestanding ones. The freestanding headers are: `float.h`, `iso646.h`, `limits.h`, `stdalign.h`, `stdarg.h`, `stdbool.h`, `stddef.h`, `stdint.h`, and `stdnoreturn.h`. You should be familiar with these headers as they contain useful declarations you shouldn't do yourself. GCC also comes with additional freestanding headers for CPUID, SSE and such.

这些头文件中包含了 freestanding 程序也可使用的声明。有兴趣的同学可以发现，可变参数经过预编译后生成了类似 `__builtin_va_arg` 的 builtin 调用，由编译器翻译成了特定的汇编代码。

## 4.3. 绘制一个图片

“绘制一个图片” 似乎是一个很奇怪的需求。然而，你很快也反应过来：“图片不过是计算机中保存的 01 数据”。那么我们是如何在 C 语言中保存程序运行前的数据的？答案是定义带初值的全局变量：

```c++
const char *names={
    "Tom",
    "Jerry",
    "Spike",
    ...
};
```

我们只要把图片的 RGB 数值写在代码里，不就可以显示图片了吗！没错。甚至我们的 xxd 工具都帮助大家实现了这一点：

```c++
// Generated by: xxd -i /bin/ls
unsigned char_bin_ls[]={
    0x7f,0x45,0x4c,0x46,0x02,0x01,0x01,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x03,0x00,0x3e,0x00,0x01,0x00,0x00,0x00,
    ...
    0x00,0x00,0x00,0x00
};
unsigned int _bin_ls_len=142144;
```

xxd 可以将任何二进制文件转换成 C/C++ 可以接受的常量数组，而且把数组的长度也固定好。因此你可以在 “kernel” 的外部准备好任何的图片数据。至于同一个图片如何 “拉伸/缩放” 到不同分辨率，这就是你需要考虑的问题了——不过这也不难，说白了你是希望将一个 n*m 的矩形网格 “投影” 到一个 n′*m′ 的矩形网格上——因此最简单的方法就是在新网格上找到旧网格 “最靠近” 的那个位置对应的像素即可。
