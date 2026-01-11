(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 3), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 3), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 5), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 5), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R11)));
        Asm.Binary {op = Asm.Mult; src = (Asm.Imm 5); dst = (Asm.Reg Asm.R11)};
        (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 13;
        offset = -28;
        stack slots = {
          a.0    -> -4,
          tmp.0  -> -8,
          tmp.3  -> -12,
          b.1    -> -16,
          tmp.6  -> -20,
          tmp.9  -> -24,
          tmp.12 -> -28,
        }}}
     ])
