#include
#include

int main() {
    int *ptr = malloc(sizeof(int));
    *ptr = 1;
    free(ptr);
    *ptr = 1;
}