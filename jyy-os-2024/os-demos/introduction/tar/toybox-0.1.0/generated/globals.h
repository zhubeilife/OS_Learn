// toys/basename.c

// toys/bzcat.c

// toys/cat.c

// toys/catv.c

// toys/chroot.c

// toys/chvt.c

// toys/cksum.c

struct cksum_data {
	unsigned crc_table[256];
};
// toys/count.c

// toys/cp.c

struct cp_data {
	char *destname;
	int destisdir;
	int destisnew;
	int keep_symlinks;
};
// toys/df.c

struct df_data {
	struct arg_list *fstype;

	long units;
};
// toys/dirname.c

// toys/dmesg.c

struct dmesg_data {
	long level;
	long size;
};
// toys/echo.c

// toys/false.c

// toys/hello.c

struct hello_data {
	char *b_string;
	long c_number;
	struct arg_list *d_list;
	long e_count;

	int more_globals;
};
// toys/help.c

// toys/mdev.c

// toys/mke2fs.c

struct mke2fs_data {
	// Command line arguments.
	long blocksize;
	long bytes_per_inode;
	long inodes;           // Total inodes in filesystem.
	long reserved_percent; // Integer precent of space to reserve for root.
	char *gendir;          // Where to read dirtree from.

	// Internal data.
	struct dirtree *dt;    // Tree of files to copy into the new filesystem.
	unsigned treeblocks;   // Blocks used by dt
	unsigned treeinodes;   // Inodes used by dt

	unsigned blocks;       // Total blocks in the filesystem.
	unsigned freeblocks;   // Free blocks in the filesystem.
	unsigned inodespg;     // Inodes per group
	unsigned groups;       // Total number of block groups.
	unsigned blockbits;    // Bits per block.  (Also blocks per group.)

	// For gene2fs
	unsigned nextblock;    // Next data block to allocate
	unsigned nextgroup;    // Next group we'll be allocating from
	int fsfd;              // File descriptor of filesystem (to output to).

	struct ext2_superblock sb;
};
// toys/mkfifo.c

struct mkfifo_data {
	char *mode;
};
// toys/mkswap.c

// toys/netcat.c

struct netcat_data {
	char *filename;        // -f read from filename instead of network
	long quit_delay;       // -q Exit after EOF from stdin after # seconds.
	char *source_address;  // -s Bind to a specific source address.
	long port;             // -p Bind to a specific source port.
	long wait;             // -w Wait # seconds for a connection.
};
// toys/oneit.c

struct oneit_data {
	char *console;
};
// toys/patch.c

struct patch_data {
	char *infile;
	long prefix;

	struct double_list *current_hunk;
	long oldline, oldlen, newline, newlen, linenum;
	int context, state, filein, fileout, filepatch, hunknum;
	char *tempname;
};
// toys/pwd.c

// toys/readlink.c

// toys/rmdir.c

// toys/sed.c

struct sed_data {
	struct arg_list *commands;
};
// toys/seq.c

// toys/sha1sum.c

// toys/sleep.c

struct sleep_data {
	long seconds;
};
// toys/sort.c

struct sort_data {
    char *key_separator;
    struct arg_list *raw_keys;
    char *outfile;
    char *ignore1, ignore2;   // GNU compatability NOPs for -S and -T.

    void *key_list;
    int linecount;
    char **lines;
};
// toys/sync.c

// toys/tee.c

struct tee_data {
    void *outputs;
};
// toys/touch.c

struct touch_data {
	char *ref_file;
	char *time;
	long length;
};
// toys/toysh.c

struct toysh_data {
	char *command;
};
// toys/true.c

// toys/tty.c

// toys/uname.c

// toys/which.c

// toys/yes.c

extern union global_union {
	struct cksum_data cksum;
	struct cp_data cp;
	struct df_data df;
	struct dmesg_data dmesg;
	struct hello_data hello;
	struct mke2fs_data mke2fs;
	struct mkfifo_data mkfifo;
	struct netcat_data netcat;
	struct oneit_data oneit;
	struct patch_data patch;
	struct sed_data sed;
	struct sleep_data sleep;
	struct sort_data sort;
	struct tee_data tee;
	struct touch_data touch;
	struct toysh_data toysh;
} this;
