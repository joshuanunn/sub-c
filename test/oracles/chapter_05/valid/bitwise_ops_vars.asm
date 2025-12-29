(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 5), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 8), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.BwAnd; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -16)};
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.BwOr; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -20)};
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 2;
        offset = -20;
        stack slots = {
          a.0   -> -4,
          b.1   -> -8,
          c.2   -> -12,
          tmp.0 -> -16,
          tmp.1 -> -20,
        }}}
     ])
