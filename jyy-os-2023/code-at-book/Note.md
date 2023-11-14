# Issue

## 1

```bash
In file included from /usr/lib/gcc/x86_64-linux-gnu/7/include/stdint.h:9:0,
                 from main.c:1:
/usr/include/stdint.h:26:10: fatal error: bits/libc-header-start.h: No such file or directory
 #include <bits/libc-header-start.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~~~
```

```bash
  sudo apt install gcc-multilib
```
