def numbers():
    i = 0
    while True:
        ret = yield f'{i:b}'
        i += ret
