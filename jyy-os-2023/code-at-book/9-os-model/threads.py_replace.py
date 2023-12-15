count = 0

def Tprint(name):
    global count
    for i in range(3):
        count += 1
        yield "write", (f'#{count:02} Hello from {name}{i+1}\n')
        yield "sched", ()

def main():
    n = yield "choose", ([3, 4, 5])
    yield "write", (f'#Thread = {n}\n')
    for name in 'ABCDE'[:n]:
        yield "spawn", (Tprint, name)
    yield "sched", ()