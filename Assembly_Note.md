# Note

## 各种知识点

### 汇编语法

### X86-64

汇编语法现在的主流也有两大阵营：Intel语法与GAS语法。其最显著的区别就在于，Intel语法的组成是「指令+目的+源」，而GAS语法的组成是「指令+源+目的」。就比如说，同样的意思，Intel语法是“给小明一个粉笔”，而GAS语法则是“把一个粉笔给小明”。这两种语法并没有优劣，在这一系列文章中，我主要介绍的是AS语法。

Intel语法是在Windows上进行汇编语言编程时主要使用的，而GAS语法，又称为AT&T语法，则主要是在Linux和类Unix上进行汇编语言时会用到。这里并不是说在不同操作系统上必须用不同的语法，在类Unix的macOS上也能用Intel语法，只不过是大家都偏好这么用罢了。

The following are some of the major differences summarized from the GAS manual:
+ AT&T and Intel syntax use the opposite order for source and destination operands. For example:

```asm
# Intel: 
    mov eax, 4
# AT&T: 
    movl $4, %eax
```

+ In AT&T syntax, immediate operands are preceded by $; in Intel syntax, immediate operands are not. For example:

```asm
# Intel:
    push 4
# AT&T: 
    pushl $4
```

+ In AT&T syntax, register operands are preceded by %; in Intel syntax, they are not.

+ In AT&T syntax, the size of memory operands is determined from the last character of the opcode name. Opcode suffixes of b, w, and l specify byte (8-bit), word (16-bit), and long (32-bit) memory references. Intel syntax accomplishes this by prefixing memory operands (not the opcodes themselves) with byte ptr, word ptr, and dword ptr. Thus:

```asm
# Intel: 
    mov al, byte ptr foo
# AT&T: 
    movb foo, %al
```

+ Immediate form long jumps and calls are lcall/ljmp $section, $offset in AT&T syntax; the Intel syntax is call/jmp far section:offset. The far return instruction is lret $stack-adjust in AT&T syntax, whereas Intel uses ret far stack-adjust.


### AArch64

汇编语言是机器码的human-readable版本。虽说如此，汇编语法之间也会有细微的区别。AArch64的汇编器主要有两种语法：armasm的和GNU的。这两种语法有细微的区别。我这篇文章中主要用的是GNU语法，这也是用的最广泛的语法。

```armasm
; Simple armasm syntax example
;
; Iterate round a loop 10 times, adding 1 to a register each time.

        AREA ||.text||, CODE, READONLY, ALIGN=2

main PROC
        MOV      w5,#0x64      ; W5 = 100
        MOV      w4,#0         ; W4 = 0
        B        test_loop     ; branch to test_loop
loop
        ADD      w5,w5,#1      ; Add 1 to W5
        ADD      w4,w4,#1      ; Add 1 to W4
test_loop
        CMP      w4,#0xa       ; if W4 < 10, branch back to loop
        BLT      loop
        ENDP

        END
```

```asm
// Simple GNU syntax example                          
// 
// Iterate round a loop 10 times, adding 1 to a register each time.

        .section .text,"ax"                          
        .balign 4                               

main:                                        
        MOV      w5,#0x64      // W5 = 100                  
        MOV      w4,#0         // W4 = 0
        B        test_loop     // branch to test_loop 
loop:
        ADD      w5,w5,#1      // Add 1 to W5
        ADD      w4,w4,#1      // Add 1 to W4
test_loop:
        CMP      w4,#0xa       // if W4 < 10, branch back to loop
        BLT      loop
        .end  
```
