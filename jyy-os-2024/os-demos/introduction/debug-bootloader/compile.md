# log
## am-x86-qemu.a
### start32.S
x86_64-linux-gnu-gcc
    -MMD
    -IAM/am/src
    -Iabstract-machine/am/include
    -IAM/am/include/
    -IAM/klib/include/
    -fno-pic
    -c -o abstract-machine/am/build/x86-qemu/src/x86/qemu/start32.o
    abstract-machine/am/src/x86/qemu/start32.S
### trap32.S
x86_64-linux-gnu-gcc
    -MMD
    -IAM/am/src
    -Iabstract-machine/am/include
    -IAM/am/include/
    -IAM/klib/include/
    -m32
    -fno-pic
    -c -o abstract-machine/am/build/x86-qemu/src/x86/qemu/trap32.o
    abstract-machine/am/src/x86/qemu/trap32.S
### trm.c
x86_64-linux-gnu-gcc
    -std=gnu11
    -O2
    -MMD
    -Wall
    -Werror
    -IAM/am/src
    -Iabstract-machine/am/include
    -IAM/am/include/
    -IAM/klib/include/
    -D__ISA__=\"x86\"
    -D__ISA_X86__
    -D__ARCH__=x86-qemu
    -D__ARCH_X86_QEMU
    -D__PLATFORM__=qemu
    -D__PLATFORM_QEMU
    -DARCH_H=\"arch/x86-qemu.h\"
    -fno-asynchronous-unwind-tables
    -fno-builtin
    -fno-stack-protector
    -Wno-main
    -U_FORTIFY_SOURCE
    -fvisibility=hidden
    --param=min-pagesize=0
    -m32
    -fno-pic
    -fno-omit-frame-pointer
    -march=i386
    -fcf-protection=none
    -c -o abstract-machine/am/build/x86-qemu/src/x86/qemu/trm.o
    abstract-machine/am/src/x86/qemu/trm.c
### cte.c
x86_64-linux-gnu-gcc
    -std=gnu11
    -MMD
    -IAM/am/src
    -Iabstract-machine/am/include
    -IAM/am/include/
    -IAM/klib/include/
    -D__ISA__=\"x86\"
    -D__ISA_X86__
    -D__ARCH__=x86-qemu
    -D__ARCH_X86_QEMU
    -D__PLATFORM__=qemu
    -D__PLATFORM_QEMU
    -DARCH_H=\"arch/x86-qemu.h\"
    -fno-asynchronous-unwind-tables
    -fno-builtin
    -fno-stack-protector
    -Wno-main
    -U_FORTIFY_SOURCE
    -fvisibility=hidden
    --param=min-pagesize=0
    -m32
    -fno-pic
    -fno-omit-frame-pointer
    -march=i386
    -fcf-protection=none
    -c -o abstract-machine/am/build/x86-qemu/src/x86/qemu/cte.o
    abstract-machine/am/src/x86/qemu/cte.c
### io.c
x86_64-linux-gnu-gcc
    -MMD
    -IAM/am/src
    -Iabstract-machine/am/include
    -IAM/am/include/
    -IAM/klib/include/
    -D__ISA__=\"x86\"
    -D__ISA_X86__
    -D__ARCH__=x86-qemu
    -D__ARCH_X86_QEMU
    -D__PLATFORM__=qemu
    -D__PLATFORM_QEMU
    -DARCH_H=\"arch/x86-qemu.h\"
    -fno-asynchronous-unwind-tables
    -fno-builtin
    -fno-stack-protector
    -Wno-main
    -U_FORTIFY_SOURCE
    -fvisibility=hidden
    --param=min-pagesize=0
    -m32
    -fno-pic
    -fno-omit-frame-pointer
    -march=i386
    -fcf-protection=none
    -c -o abstract-machine/am/build/x86-qemu/src/x86/qemu/ioe.o
    abstract-machine/am/src/x86/qemu/ioe.c
### vme.c
x86_64-linux-gnu-gcc
    -IAM/am/src
    -Iabstract-machine/am/include
    -IAM/am/include/
    -IAM/klib/include/
    -D__ISA__=\"x86\"
    -D__ISA_X86__
    -D__ARCH__=x86-qemu
    -D__ARCH_X86_QEMU
    -D__PLATFORM__=qemu
    -D__PLATFORM_QEMU
    -DARCH_H=\"arch/x86-qemu.h\"
    -fno-asynchronous-unwind-tables
    -fno-builtin
    -fno-stack-protector
    -Wno-main
    -U_FORTIFY_SOURCE
    -fvisibility=hidden
    --param=min-pagesize=0
    -fno-pic
    -fno-omit-frame-pointer
    -march=i386
    -fcf-protection=none
    -c -o abstract-machine/am/build/x86-qemu/src/x86/qemu/vme.o
    abstract-machine/am/src/x86/qemu/vme.c
### mpe.c
x86_64-linux-gnu-gcc
    -IAM/am/src
    -Iabstract-machine/am/include
    -IAM/am/include/
    -IAM/klib/include/
    -D__ISA__=\"x86\"
    -D__ISA_X86__
    -D__ARCH__=x86-qemu
    -D__ARCH_X86_QEMU
    -D__PLATFORM__=qemu
    -D__PLATFORM_QEMU
    -DARCH_H=\"arch/x86-qemu.h\"
    -fno-asynchronous-unwind-tables
    -fno-builtin
    -fno-stack-protector
    -Wno-main
    -U_FORTIFY_SOURCE
    -fvisibility=hidden
    --param=min-pagesize=0
    -fno-pic
    -fno-omit-frame-pointer
    -march=i386
    -fcf-protection=none
    -c -o abstract-machine/am/build/x86-qemu/src/x86/qemu/mpe.o
    abstract-machine/am/src/x86/qemu/mpe.c
### am-x86-qemu.a
x86_64-linux-gnu-ar
    abstract-machine/am/build/am-x86-qemu.a
    abstract-machine/am/build/x86-qemu/src/x86/qemu/start32.o
    abstract-machine/am/build/x86-qemu/src/x86/qemu/trap32.o
    abstract-machine/am/build/x86-qemu/src/x86/qemu/trm.o
    abstract-machine/am/build/x86-qemu/src/x86/qemu/cte.o
    abstract-machine/am/build/x86-qemu/src/x86/qemu/ioe.o
    abstract-machine/am/build/x86-qemu/src/x86/qemu/vme.o
    abstract-machine/am/build/x86-qemu/src/x86/qemu/mpe.o
## klib-x86-qemu.a 
### stdio.c
x86_64-linux-gnu-gcc
    -Iabstract-machine/klib/include
    -IAM/am/include/
    -IAM/klib/include/
    -D__ISA__=\"x86\"
    -D__ISA_X86__
    -D__ARCH__=x86-qemu
    -D__ARCH_X86_QEMU
    -D__PLATFORM__=qemu
    -D__PLATFORM_QEMU
    -DARCH_H=\"arch/x86-qemu.h\"
    -fno-asynchronous-unwind-tables
    -fno-builtin
    -fno-stack-protector
    -Wno-main
    -U_FORTIFY_SOURCE
    -fvisibility=hidden
    --param=min-pagesize=0
    -fno-pic
    -fno-omit-frame-pointer
    -march=i386
    -fcf-protection=none
    -c -o abstract-machine/klib/build/x86-qemu/src/stdio.o
    abstract-machine/klib/src/stdio.c
### string.c
x86_64-linux-gnu-gcc
    -Iabstract-machine/klib/include
    -IAM/am/include/
    -IAM/klib/include/
    -D__ISA__=\"x86\"
    -D__ISA_X86__
    -D__ARCH__=x86-qemu
    -D__ARCH_X86_QEMU
    -D__PLATFORM__=qemu
    -D__PLATFORM_QEMU
    -DARCH_H=\"arch/x86-qemu.h\"
    -fno-asynchronous-unwind-tables
    -fno-builtin
    -fno-stack-protector
    -Wno-main
    -U_FORTIFY_SOURCE
    -fvisibility=hidden
    --param=min-pagesize=0
    -fno-pic
    -fno-omit-frame-pointer
    -march=i386
    -fcf-protection=none
    -c -o abstract-machine/klib/build/x86-qemu/src/string.o
    abstract-machine/klib/src/string.c
### stdlib.c
x86_64-linux-gnu-gcc
    -Iabstract-machine/klib/include
    -IAM/am/include/
    -IAM/klib/include/
    -D__ISA__=\"x86\"
    -D__ISA_X86__
    -D__ARCH__=x86-qemu
    -D__ARCH_X86_QEMU
    -D__PLATFORM__=qemu
    -D__PLATFORM_QEMU
    -DARCH_H=\"arch/x86-qemu.h\"
    -fno-asynchronous-unwind-tables
    -fno-builtin
    -fno-stack-protector
    -Wno-main
    -U_FORTIFY_SOURCE
    -fvisibility=hidden
    --param=min-pagesize=0
    -fno-pic
    -fno-omit-frame-pointer
    -march=i386
    -fcf-protection=none
    -c -o abstract-machine/klib/build/x86-qemu/src/stdlib.o
    abstract-machine/klib/src/stdlib.c
### int64.c
x86_64-linux-gnu-gcc
    -Iabstract-machine/klib/include
    -IAM/am/include/
    -IAM/klib/include/
    -D__ISA__=\"x86\"
    -D__ISA_X86__
    -D__ARCH__=x86-qemu
    -D__ARCH_X86_QEMU
    -D__PLATFORM__=qemu
    -D__PLATFORM_QEMU
    -DARCH_H=\"arch/x86-qemu.h\"
    -fno-asynchronous-unwind-tables
    -fno-builtin
    -fno-stack-protector
    -Wno-main
    -U_FORTIFY_SOURCE
    -fvisibility=hidden
    --param=min-pagesize=0
    -fno-pic
    -fno-omit-frame-pointer
    -march=i386
    -fcf-protection=none
    -c -o abstract-machine/klib/build/x86-qemu/src/int64.o
    abstract-machine/klib/src/int64.c
### cpp.c
x86_64-linux-gnu-gcc
    -Iabstract-machine/klib/include
    -IAM/am/include/
    -IAM/klib/include/
    -D__ISA__=\"x86\"
    -D__ISA_X86__
    -D__ARCH__=x86-qemu
    -D__ARCH_X86_QEMU
    -D__PLATFORM__=qemu
    -D__PLATFORM_QEMU
    -DARCH_H=\"arch/x86-qemu.h\"
    -fno-asynchronous-unwind-tables
    -fno-builtin
    -fno-stack-protector
    -Wno-main
    -U_FORTIFY_SOURCE
    -fvisibility=hidden
    --param=min-pagesize=0
    -m32
    -fno-pic
    -fno-omit-frame-pointer
    -march=i386
    -fcf-protection=none
    -c -o abstract-machine/klib/build/x86-qemu/src/cpp.o
    abstract-machine/klib/src/cpp.c
### klib-x86-qemu.a
x86_64-linux-gnu-ar
    abstract-machine/klib/build/klib-x86-qemu.a
    abstract-machine/klib/build/x86-qemu/src/stdio.o
    abstract-machine/klib/build/x86-qemu/src/string.o
    abstract-machine/klib/build/x86-qemu/src/stdlib.o
    abstract-machine/klib/build/x86-qemu/src/int64.o
    abstract-machine/klib/build/x86-qemu/src/cpp.o
## hello-x86-qemu.elf -Ttext-segment=0x00100000 
### hello.c
x86_64-linux-gnu-gcc
    -I./include
    -IAM/am/include/
    -IAM/klib/include/
    -D__ISA__=\"x86\"
    -D__ISA_X86__
    -D__ARCH__=x86-qemu
    -D__ARCH_X86_QEMU
    -D__PLATFORM__=qemu
    -D__PLATFORM_QEMU
    -DARCH_H=\"arch/x86-qemu.h\"
    -fno-asynchronous-unwind-tables
    -fno-builtin
    -fno-stack-protector
    -Wno-main
    -U_FORTIFY_SOURCE
    -fvisibility=hidden
    --param=min-pagesize=0
    -fno-pic
    -fno-omit-frame-pointer
    -march=i386
    -fcf-protection=none
    -c -o ./build/x86-qemu/hello.o
    ./hello.c
### hello-x86-qemu.elf
x86_64-linux-gnu-ld
    -z
    noexecstack
    -melf_i386
    -N
    -Ttext-segment=0x00100000
    -o ./build/hello-x86-qemu.elf
    --start-group
    ./build/x86-qemu/hello.o
    AM/am/build/am-x86-qemu.a
    AM/klib/build/klib-x86-qemu.a
    --end-group
## bootblock.o -Ttext=0x7c00
x86_64-linux-gnu-gcc
    -static
    -fno-pic
    -Os
    -nostdlib
    -Ttext
    0x7c00
    -IAM/am/src
    -o bootblock.o
    start.S
    main.c

cp bootblock.o boot.o

python3 genboot.py bootblock.o

## hello-x86-qemu

( cat abstract-machine/am/src/x86/qemu/boot/bootblock.o; head -c 1024 /dev/zero; cat debug-bootloader/build/hello-x86-qemu.elf ) > debug-bootloader/build/hello-x86-qemu