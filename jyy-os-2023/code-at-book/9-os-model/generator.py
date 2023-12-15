def numbers():
    i = 0
    while True:
        ret = yield f'{i:b}'   # “封存” 状态机状态
        i += ret


# usage
# n = numbers()  # 封存状态机初始状态
# n.send(None)  # 恢复封存的状态
# n.send(0)  # 恢复封存的状态 (并传入返回值)
