
# def main():
#     x = 0
#     for _ in range(10):
#         b = yield "read", ()
#         x = x * 2 + b
#     yield "write", (f'x = {x:010b}b')

def main():
    x = 0
    for _ in range(10):
        b = sys_read()
        x = x * 2 + b

    sys_write(f'x = {x:010b}b')
