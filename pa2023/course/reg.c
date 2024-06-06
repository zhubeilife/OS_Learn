#define FORALL_REGS(_) _(X) _(Y)
#define LOGIC X1 = (!X&&Y)||(X&&!Y); \
              Y1 = !Y;
#define DEFINE(X) static int X, X##1;
#define UPDATE(X) X = X##1;
#define PRINT(X) printf(#X " = %d; ", X);

int main() {
    FORALL_REGS(DEFINE);

    while (1) { // clock
        FORALL_REGS(PRINT);
        putchar('\n');
        sleep(1);
        LOGIC;
        FORALL_REGS(UPDATE);
    }
}

// gcc -E test.c | indent - | vim -
/**
int main() {
    static int X, X1; static int Y, Y1;;

    while (1) {
        printf("X" " = %d; ", X); printf("Y" " = %d; ", Y);;
        putchar('\n');
        sleep(1);
        X1 = (!X&&Y)||(X&&!Y); Y1 = !Y;;
        X = X1; Y = Y1;;
    }
}
* */