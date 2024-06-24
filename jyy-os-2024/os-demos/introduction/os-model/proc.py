# def Process(name):
#     for _ in range(5):
#         yield "write", (name)
#
# def main():
#     yield "spawn", (Process, 'A')
#     yield "spawn", (Process, 'B')

def Process(name):
    for _ in range(5):
        sys_write(name)

def main():
    sys_spawn(Process, 'A')
    sys_spawn(Process, 'B')
