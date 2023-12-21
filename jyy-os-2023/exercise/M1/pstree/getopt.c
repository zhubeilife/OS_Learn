#include <unistd.h>
#include <stdlib.h>
#include <getopt.h>
#include <stdio.h>

int
main(int argc, char** argv)
{
    while (1)
    {
        int option_index = 0;
        static struct option long_options[] = {
            {"show-pids", no_argument, 0, 'p'},
            {"numeric-sort", no_argument, 0, 'n'},
            {"version", no_argument, 0, 'V'}
        };

        int c = getopt_long(argc, argv, "pnV", long_options, &option_index);
        if (c == -1)
            break;

        switch (c)
        {
        case 'p':
            printf("get p \n");
            break;

        case 'n':
            printf("get n \n");
            break;

        case 'V':
            printf("get V \n");
            break;

        case '?':
            printf("Usage: -V --version -p --show-pids -n --numeric-sort\n");
            break;

        default:
            fprintf(stderr, "?? getopt returned character code 0%o ??\n", c);
        }
    }

    exit(EXIT_SUCCESS);
}
