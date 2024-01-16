#include
#include
#include
#include
#include
#include

#define NPROC 1000
#define SIZE (128 * (1 << 20))

int main() {
    char *data = malloc(SIZE); // 128MB shared memory
    memset(data, '_', SIZE);

    for (int i = 0; i < NPROC - 1; i++) {
        if (fork() == 0) break;
    }

    // 1000 processes go here

    unsigned int idx = 0;
    int fd = open("/dev/urandom", O_RDONLY); assert(fd > 0);
    read(fd, &idx, sizeof(idx));
    close(fd);
    idx %= SIZE;

    data[idx] = '.';
    printf("pid = %d, write data[%u]\n", getpid(), idx);

    while (1) {
        sleep(1); // not terminate
    }
}