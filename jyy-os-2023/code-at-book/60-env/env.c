#include

int main() {
    extern char **environ;
    for (char **env = environ; *env; env++) {
        printf("%s\n", *env);
    }
}