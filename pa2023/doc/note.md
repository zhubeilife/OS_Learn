# ICS2023

![](roadmap_light.png)
![](pa-concept.png)

## PA1

###  遗留问题

+ NEMU中为什么要有nemu_trap? 为什么要有monitor? NEMU中是怎么判断到到nemu_trap的？

## PA2

### PA究竟在做什么?

PA中最重要的两个关于"程序在计算code机上运行"的视角介绍完了:

+ 微观视角: 程序是个状态机，指令的层次精确的描述程序运行的细节，如果类似yemu的系统，完全可以枚举整个状态空间
+ 宏观视角: 计算机是个抽象层，计算机把底层的功能经过层层的抽象分解成最基本的硬件操作，最后以状态机的方式来运行

下面是不同的TRM功能在不同层次上计算机是如何支持的
![](TRM_abstract_level.png)

### 不匹配的函数调用和返回

编译器将f1和f0的返回优化成了尾调用，调用的时候采用的是丢弃返回地址的jump


| 伪指令         | 实际指令                                                                   | 意义                   |
|:------------|:-----------------------------------------------------------------------|:---------------------|
| j offset    | jal x0, offset                                                         | 无条件跳转，不存返回地址         |
| jal offset  | jal x1, offset                                                         | 无条件跳转，返回地址存到 x1      |
| jr rs       | jalr x0, 0(rs)                                                         | 无条件跳转到 rs 位置，忽略返回地址  |
| jalr rs     | jalr x1, 0(rs)                                                         | 无条件跳转到 rs 位置，存返回地址   |
| ret         | jalr x0, 0(x1)                                                         | 通过返回地址 x1 返回         |
| call offset | auipc x1, offset[31 : 12] + offset[11]<br/>jalr x1, offset\[11:0](x1)  | 远调用                  |
| tail offset | auipc x6, offset[31 : 12] + offset[11]<br/>jalr x0, offset\[11:0](x6)  | 忽略返回地址远调用            |


## 参考文档

+ [ICP PA 实验纪实](https://note.tonycrane.cc/cs/system/pa/)：记录了整个PA的过程
+ [Kinfish am-kernels repo](https://github.com/Kingfish404/am-kernels)：添加了更多的testcase
+ [NOSAE nju pa2](https://www.cnblogs.com/nosae/p/17066439.html#%E5%9F%BA%E7%A1%80%E8%AE%BE%E6%96%BD2) : pa2参考

## Ref Link

+ RISC-V 非特权级 ISA : https://note.tonycrane.cc/cs/pl/riscv/unprivileged/
+ https://www.cnblogs.com/nosae/p/17066439.html#%E8%BF%90%E8%A1%8C%E7%AC%AC%E4%B8%80%E4%B8%AA%E5%AE%A2%E6%88%B7%E7%A8%8B%E5%BA%8F
+ https://blog.csdn.net/weixin_63603830/article/details/133938389
+ [Linux 上用xrdp进行远程/orbstack linux machine vnc](https://learn.microsoft.com/zh-tw/azure/virtual-machines/linux/use-remote-desktop?tabs=azure-cli)