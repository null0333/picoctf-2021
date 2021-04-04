/* WARNING: Function: __x86.get_pc_thunk.ax replaced with injection: get_pc_thunk_ax */

void execute(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  undefined4 uStack48;
  undefined auStack44 [8];
  undefined *local_24;
  undefined *local_20;
  uint local_1c;
  uint local_18;
  int local_14;
  uint local_10;

  uStack48 = 0x8048502;
  if ((param_1 != 0) && (param_2 != 0)) {
    local_18 = param_2 * 2;
    local_1c = local_18;
    uVar3 = (local_18 + 0x10) / 0x10;
    iVar1 = uVar3 * -0x10;
    local_20 = auStack44 + iVar1;
    local_14 = 0;
    local_10 = 0;
    while (iVar2 = local_14, local_10 < local_18) {
      uVar4 = (uint)((int)local_10 >> 0x1f) >> 0x1e;
      if ((int)((local_10 + uVar4 & 3) - uVar4) < 2) {
        local_14 = local_14 + 1;
        auStack44[local_10 + iVar1] = *(undefined *)(param_1 + iVar2);
      }
      else {
        auStack44[local_10 + iVar1] = 0x90;
      }
      local_10 = local_10 + 1;
    }
    auStack44[local_18 + iVar1] = 0xc3;
    local_24 = auStack44 + iVar1;
    (&uStack48)[uVar3 * -4] = 0x80485cb;


    // jump to this address
    (*(code *)(auStack44 + iVar1))();

    return;
  }
                    /* WARNING: Subroutine does not return */
  exit(1);
}
