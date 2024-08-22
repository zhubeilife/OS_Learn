.text                        # 指示符：进入代码节
.align 2                     # 指示符：对齐到4(2^2)字节
.globl main                  # 指示符：声明全局符号main
main:
    addi sp, sp, -16         # 为栈帧分配16字节的空间
    sw ra, 12(sp)            # 将返回地址保存到栈中
    lui a0, %hi(string1)     # 将string1的高20位加载到a0寄存器
                             # 由于一条 32 位 指令难以容纳一个 32 位地址，链接器通常
                             # 需要为每个符号调整两条 RV32I 指令。数据地址需要调整 lui 和 addi，
                             # 代码地址需要调整 auipc 和 jalr。
    addi a0, a0, %lo(string1)# 将string1的低12位加到a0寄存器中，a0现在指向string1
    lui a1, %hi(string2)     # 将string2的高20位加载到a1寄存器
    addi a1, a1, %lo(string2)# 将string2的低12位加到a1寄存器中，a1现在指向string2
    call printf              # 调用printf函数，输出"Hello, world!"
    lw ra, 12(sp)            # 从栈中恢复返回地址
    addi sp, sp, 16          # 回收栈帧空间
    li a0, 0                 # 将a0设置为0，表示程序正常结束
    ret                      # 返回调用者

.section .rodata             # 指示符：进入只读数据节
.balign 4                    # 指示符：将数据按 4 字节对齐
string1:
    .string "Hello, %s!\n"   # 定义字符串"Hello, %s!\n"
string2:
    .string "world"          # 定义字符串"world"