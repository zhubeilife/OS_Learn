**最小可执行文件**：为了理解操作系统上的程序，我们的目标是构造一个能直接被操作系统加载且打印 Hello World 的指令序列。如果你能想到写一段汇编代码实现一个功能，那么大语言模型就能帮你做到：

> 如何仅用 x86-64 汇编调用 Linux 系统调用，输出 Hello World 并退出？

AI 不仅能给出代码，而且还能帮助你解决遇到的疑惑和困难。在你熟悉这些概念之后，syscall(2) 和 syscalls(2) 就成为了非常棒 (而且真正 friendly) 的参考。


gcc --verbose hello.c -static
readelf -a a.out > a.out.assembly