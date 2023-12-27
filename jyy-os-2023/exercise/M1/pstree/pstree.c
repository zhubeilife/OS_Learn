#include <stdio.h>
#include <assert.h>
#include <dirent.h>
#include <sys/stat.h>
#include <regex.h>
#include <unistd.h>
#include <getopt.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

char* PSTREE_VERSION = "0.0.1";

// STEP-3 建树和打印
/*
 * 1）自己的第一直觉也是通过树的结构，将所有的proc都用树的结构来表示，然后就是打印整个树的结构
 * 2）首先遇到的问题是，怎们建立一个树的结构，或者怎们定义这个数据结构，是在父节点中添加子节点信息，还是在子节点中添加父节点的信息。
 */

typedef struct proc
{
    pid_t pid;
    pid_t ppid;
} proc;

bool CheckNameAllNumber(char* name)
{
    // Variable to store initial regex()
    regex_t reegex;
    // Creation of regEx
    if (0 != regcomp(&reegex, "^[0-9]+$", REG_EXTENDED))
    {
        fprintf(stderr, "RegEX compilation error.");
        return false;
    }

    // string in reg
    int exec_status = regexec(&reegex, name, 0, NULL, 0);
    // clean up regex memory
    regfree(&reegex);
    return (exec_status == 0) ? true : false;
}

void ListAll()
{
    struct dirent* de; // Pointer for directory entry
    struct stat filestat;
    // opendir() returns a pointer of DIR type.
    DIR* dr = opendir("/proc");

    if (dr == NULL) // opendir returns NULL if couldn't open directory
    {
        fprintf(stderr, "Could not open current directory");
        return;
    }

    // Refer http://pubs.opengroup.org/onlinepubs/7990989775/xsh/readdir.html
    // for readdir()
    while ((de = readdir(dr)) != NULL)
    {
        stat(de->d_name, &filestat);
        if (S_ISDIR(filestat.st_mode) && CheckNameAllNumber(de->d_name))
        {
            char fullpath[PATH_MAX] = "/proc/";
            strcat(fullpath, de->d_name);
            strcat(fullpath, "/stat");

            FILE* fp = fopen(fullpath, "r");
            if (fp)
            {
                int ppid = 0;
                fscanf(fp, "%*d %*s %*c %d", &ppid);
                printf("pid: %s ppid: %d\n", de->d_name ,ppid);
            }
            else
            {
                fprintf(stderr, "Could not open stat %s", fullpath);
            }
        }
    }

    closedir(dr);
}

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

    ListAll();

    exit(EXIT_SUCCESS);
}
