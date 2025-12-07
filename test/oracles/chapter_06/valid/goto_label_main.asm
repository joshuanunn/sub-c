(Asm.Program
   [Asm.Function {name = "main";
      instructions =
      [(Asm.Jmp "main.0"); (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Label "main.0");
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame = Env.lenv {
                counter = 0;
                offset = 0;
                stack slots = {
                }}}
     ])
