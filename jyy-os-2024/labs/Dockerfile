FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y build-essential qemu-system time gcc-multilib gcc-multilib-x86-64-linux-gnu* strace gdb sudo python3 libsdl2-dev libreadline-dev llvm llvm-dev gcc-riscv64-linux-gnu git vim bash-completion rsync neovim ripgrep fd-find fzf
RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user