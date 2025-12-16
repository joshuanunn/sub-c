(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.Jmp "_main.0"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Label "_main.0");
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame = Env.lenv {
                counter = 0;
                offset = 0;
                stack slots = {
                }}}
     ])
