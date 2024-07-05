import gdb
import os


# Register the quit hook
def on_quit(event):
    gdb.execute('kill')


gdb.events.exited.connect(on_quit)

gdb.execute('set architecture i386')

# Load the debug symbols
## TODO:
## it seems i can't get the gdb show the right or whole symbols?
am_home = os.environ['AM_HOME']
path = f'{am_home}/am/src/x86/qemu/boot/boot.o'
gdb.execute(f'file {path}')

# Connect to the remote target
gdb.execute('target remote localhost:1234')

gdb.execute('layout asm')

# This is the 0x7c00
gdb.Breakpoint('_start')

# This is where 32-bit code starts
gdb.Breakpoint('start32')

# Continue execution
gdb.execute('continue')
