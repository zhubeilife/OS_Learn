.section .data
msg:
    .asciz "Hello, World\n"

.section .text
.global _start

_start:
    // Write "Hello, World" to stdout
    ldr r0, =1          // File descriptor: stdout (1)
    ldr r1, =msg        // Message to write
    ldr r2, =13         // Message length (including newline)
    ldr r7, =4          // Syscall number for sys_write
    svc 0               // Make syscall

    // Exit the program
    ldr r0, =0          // Exit status
    ldr r7, =1          // Syscall number for sys_exit
    svc 0               // Make syscall