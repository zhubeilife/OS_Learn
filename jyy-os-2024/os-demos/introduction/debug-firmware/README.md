**调试固件**：课程和互联网上的文档都声称是 Firmware 代码将具有 55 aa Magic Number 磁盘的前 512 字节载入内存。经过一些尝试 (例如修改 Magic Number)，我们确认了这一行为；更进一步地，我们能否调试固件的代码，看看到底是什么指令实现了磁盘到内存的搬运？这就用到了《计算机系统基础》实验中的 Watch Point。

在这里，我们还用到了 init.gdb，它可以帮我们省去每次运行时的重复输入命令，也可以设置 hook (钩子)，每当程序暂停时显示一些我们关心的信息——我们**定制和扩展**了 gdb，使它在调试专属于我们的任务时更加强大。

> EIP（Extended Instruction Pointer）寄存器是x86架构中的一个重要寄存器，它的主要功能是存储当前正在执行的指令的地址。EIP寄存器在32位x86处理器中使用，在64位架构中对应的寄存器是RIP（Instruction Pointer）。


## qemu的boot载入image

The instruction `rep insl (%dx), %es:(%edi)` is an assembly language instruction used in x86 architecture. Here's a breakdown of what it does:

- `rep`: This is a repeat prefix. It tells the processor to repeat the following instruction a number of times specified by the `ecx` register.
- `insl`: This stands for "input string long". It reads a double word (4 bytes) from an I/O port.
- `(%dx)`: This specifies the I/O port from which the data will be read. The port number is stored in the `dx` register.
- `%es:(%edi)`: This specifies the destination in memory where the data will be stored. The segment is specified by the `es` register and the offset by the `edi` register.

In summary, the instruction `rep insl (%dx), %es:(%edi)` will read data from the I/O port specified by `dx` and store it in memory at the address specified by `es:edi`. This process will be repeated `ecx` times.

## EB FE --> jump 0x7c00
The opcode `EB FE` in x86 assembly language is an instruction represented as a short jump or a relative jump to itself, effectively creating an infinite loop. Specifically:

- `EB` is the opcode for a short jump, which always uses a single byte relative offset.
- `FE` is the signed relative offset. In this context, `FE` represents -2 in two's complement representation.

Therefore, when combined (`EB FE`), the instruction causes the processor to jump back to its own address, i.e., to repeatedly execute this jump instruction indefinitely, thereby forming an infinite loop functionally akin to `while(1){}` in higher-level programming languages. This is sometimes used in systems programming, such as in bootloaders or embedded systems, as a placeholder or for error handling to halt the system safely.