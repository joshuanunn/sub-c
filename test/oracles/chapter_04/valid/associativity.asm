(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.G, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.SetCC (Asm.LE, (Asm.Stack -12)));
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 3;
        offset = -12;
        stack slots = {
          tmp.0 -> -4,
          tmp.1 -> -8,
          tmp.2 -> -12,
        }}}
     ])
