(Asm.Program
   [Asm.Function {name = "main";
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 7), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 5), (Asm.Reg Asm.R11)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.SetCC (Asm.E, (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 5), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.BwAnd; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -8)};
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 2;
        offset = -8;
        stack slots = {
          tmp.0 -> -4,
          tmp.1 -> -8,
        }}}
     ])
