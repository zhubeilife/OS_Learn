#include <stdio.h>
#include <assert.h>
#include <unistd.h>
#include <getopt.h>
#include <stdbool.h>
#include <stdlib.h>

char* PSTREE_VERSION = "0.0.1";

int main(int argc, char* argv[])
{
    // Step-1 parse the params
    bool show_pids = false;
    bool numeric_sort = false;
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
            show_pids = true;
            break;
        case 'n':
            numeric_sort = true;
            break;
        case 'V':
            printf("Current version is %s.\n", PSTREE_VERSION);
            exit(EXIT_SUCCESS);
            break;
        case '?':
            printf("Usage: -V --version -p --show-pids -n --numeric-sort\n");
            break;
        default:
            fprintf(stderr, "?? getopt returned character code 0%o ??\n", c);
        }
    }
    // show debug info
    printf("debug: show-pids:%d numeric-sort:%d\n", show_pids, numeric_sort);

    exit(EXIT_SUCCESS);
}
