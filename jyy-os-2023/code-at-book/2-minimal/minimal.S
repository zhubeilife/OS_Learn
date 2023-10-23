#include <sys/syscall.h>

.global _start
_start:
    movq $SYS_write, %rax   //write(
    movq $1,         %rdi   //  fd=1,
    movq $st,        %rsi   //  buf=st
    movq $(ed - st), %rdx   //  count=ed-st
    syscall                 //)

    movq $SYS_exit,  %rax   //exit(
    movq $1,         %rdi   //status=1
    syscall                 //)

st:
    .ascii "\033[01;31mHello, OS Workd\33[0m\n"
ed:
