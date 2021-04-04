from pwn import *

for i in range(1000):
    try:
        p = process(["./checkpass", "a" * i])
        print(i, p.recvline())
        p.close()
    except EOFError:
        pass
