cmake_minimum_required(VERSION 3.10)

project(OSLearn)

FILE(GLOB_RECURSE os-demos jyy-os-2024/os-demos *.c)

set(SOURCE_FILES
        jyy-os-2023/exercise/L0/kernel/kernel.c
        jyy-os-2023/exercise/L1/kernel/kernel.c
        jyy-os-2023/exercise/L2/kernel/kernel.c
        ${os-demoes}
)

include_directories(
        jyy-os-2023/abstract-machine/am/include
        jyy-os-2023/abstract-machine/klib/include
)

add_executable(13-sum jyy-os-2023/code-at-book/13-sum/sum.c
        jyy-os-2024/labs/pstree/pstree.c)
add_executable(16-peterson jyy-os-2023/code-at-book/16-peterson/peterson.c)

add_executable(L0 jyy-os-2023/exercise/L0/kernel/kernel.c)
add_executable(L1 jyy-os-2023/exercise/L1/kernel/kernel.c)
add_executable(L2 jyy-os-2023/exercise/L2/kernel/kernel.c)
add_executable(M1 jyy-os-2023/exercise/M1-pstree/pstree/pstree.c)
add_executable(M2 jyy-os-2023/exercise/M2-plcs/plcs/plcs.c)

add_executable(lab_pstree jyy-os-2024/labs/pstree/pstree.c)
add_executable(lab_crepl jyy-os-2024/labs/crepl/crepl.c)
add_executable(lab_fsrecov jyy-os-2024/labs/fsrecov/fsrecov.c jyy-os-2024/labs/fsrecov/fat32.h)
add_executable(lab_gpt jyy-os-2024/labs/gpt/gpt.c jyy-os-2024/labs/gpt/thread-sync.h jyy-os-2024/labs/gpt/thread.h)
add_executable(lab_kernel_hello jyy-os-2024/labs/kernel_hello/kernel.c)
add_executable(lab_libco jyy-os-2024/labs/libco/co.c jyy-os-2024/labs/libco/co.h)
add_executable(lab_sperf jyy-os-2024/labs/sperf/sperf.c)

add_executable(introduction-minimal jyy-os-2024/os-demos/introduction/minimal/hello.c)
add_executable(intro_hanoi_r jyy-os-2024/os-demos/introduction/hanoi/hanoi-main.c
        jyy-os-2024/os-demos/introduction/hanoi/hanoi-r.c)
add_executable(intro_hanoi_nr jyy-os-2024/os-demos/introduction/hanoi/hanoi-main.c
        jyy-os-2024/os-demos/introduction/hanoi/hanoi-nr.c)
add_executable(yemy libs/yemu/idex.c libs/yemu/yemu.c libs/yemu/yemu.h)
