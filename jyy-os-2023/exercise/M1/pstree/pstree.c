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

#define MAX_PID_NUM 10000
char* PSTREE_VERSION = "0.0.2";

// STEP-3 建树和打印
/*
 * 1）自己的第一直觉也是通过树的结构，将所有的proc都用树的结构来表示，然后就是打印整个树的结构
 * 2）首先遇到的问题是，怎们建立一个树的结构，或者怎们定义这个数据结构，是在父节点中添加子节点信息，还是在子节点中添加父节点的信息。
 */

typedef struct proc
{
    pid_t pid;
    char name[128];
    pid_t ppid;
    struct proc* child;
    struct proc* next_bro;
} proc_t;


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

void PrintTree(proc_t pid_list[], proc_t* node, int depth)
{
    // print current node info
    printf("%*s", depth * 4, "|-");
    printf("%s[%d]\n", node->name, node->pid);

    if (node->child != NULL)
    {
        PrintTree(pid_list, node->child, depth + 1);
    }
    if (node->next_bro != NULL)
    {
        PrintTree(pid_list, node->next_bro, depth);
    }
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

    // Reminder me: 这里需要显示的给初值 "= {}"
    // proc_t pid_list[MAX_PID_NUM]; 如果光这样写的话，数组中变量就是不确定的
    proc_t pid_list[MAX_PID_NUM] = {};
    proc_t init_pid = {.pid = 1, .ppid = 0, .child = NULL, .next_bro = NULL};
    pid_list[0] = init_pid;

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
                int pid = atoi(de->d_name);
                int ppid = 0;
                fscanf(fp, "%*d %s %*c %d", pid_list[pid - 1].name, &ppid);

                //printf("pid: %d ppid: %d\n", pid, ppid);

                // add info to pidlist
                pid_list[pid - 1].pid = pid;
                pid_list[pid - 1].ppid = ppid;

                // find ppid and get info
                if (pid_list[ppid - 1].child == NULL)
                {
                    pid_list[ppid - 1].child = &(pid_list[pid - 1]);
                }
                else
                {
                    proc_t* next_bro = pid_list[ppid - 1].child;
                    while (next_bro->next_bro != NULL)
                    {
                        next_bro = next_bro->next_bro;
                    }
                    next_bro->next_bro = &(pid_list[pid - 1]);
                }
            }
            else
            {
                fprintf(stderr, "Could not open stat %s", fullpath);
            }
        }
    }

    // print the result
#if 0
    printf("===show the result===\n");
    for (int i = 0; i < MAX_PID_NUM; i++)
    {
        if (pid_list[i].pid != 0)
        {
            printf("%d %d\n", pid_list[i].pid, pid_list[i].ppid);
        }
    }
#endif

    printf("\n===show the tree===\n\n");
    proc_t head_proc = pid_list[0];
    int depth = 0;
    PrintTree(pid_list, &head_proc, depth);

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
