(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 2), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 3), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 11;
        offset = -20;
        stack slots = {
          tmp.0  -> -4,
          tmp.3  -> -8,
          tmp.6  -> -12,
          tmp.7  -> -16,
          tmp.10 -> -20,
        }}}
     ])
