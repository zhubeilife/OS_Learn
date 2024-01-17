cmake_minimum_required(VERSION 3.10)

project(OSLearn)

set(SOURCE_FILES
        jyy-os-2023/exercise/L0/kernel/kernel.c
        jyy-os-2023/exercise/L1/kernel/kernel.c
        jyy-os-2023/exercise/L2/kernel/kernel.c
)

include_directories(
        jyy-os-2023/abstract-machine/am/include
        jyy-os-2023/abstract-machine/klib/include
)

add_executable(13-sum jyy-os-2023/code-at-book/13-sum/sum.c)
add_executable(16-peterson jyy-os-2023/code-at-book/16-peterson/peterson.c)

add_executable(L0 jyy-os-2023/exercise/L0/kernel/kernel.c)
add_executable(L1 jyy-os-2023/exercise/L1/kernel/kernel.c)
add_executable(L2 jyy-os-2023/exercise/L2/kernel/kernel.c)
add_executable(M0 jyy-os-2023/exercise/M1-pstree/pstree/pstree.c)