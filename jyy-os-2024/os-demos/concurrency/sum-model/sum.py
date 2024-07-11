
# 每个线程都至少执行了一次+1的操作，从sum=0开始，+1，成为1然后写回sum，覆盖其他线程的结果
# 然后最后一个执行的线程会再次执行+1操作，变成2，然后写回sum
# void T_sum() {
#   for (int i = 0; i < 3; i++) {
#     int t = load(sum);
#     t += 1;
#     store(sum, t);
#   }
# }

def T_sum():
    for _ in range(3):
        t = heap.sum
        sys_sched()
        t = t + 1
        heap.sum = t
        sys_sched()
    sys_write(f'sum = {heap.sum}\n')

def main():
    heap.sum = 0
    sys_spawn(T_sum)
    sys_spawn(T_sum)
    sys_spawn(T_sum)
