(Asm.Program
   [Asm.Function {name = "foo"; global = true;
      instructions =
      [(Asm.AllocateStack 48); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Reg Asm.CX), (Asm.Stack -24)));
        (Asm.Mov ((Asm.Reg Asm.R8), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Reg Asm.R9), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Stack 16), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Stack 24), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -40)));
        (Asm.Mov ((Asm.Stack -40), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -8)};
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 3;
        offset = -44;
        stack slots = {
          tmp.0 -> -4,
          tmp.1 -> -8,
          a.1   -> -12,
          b.2   -> -16,
          c.3   -> -20,
          d.4   -> -24,
          e.5   -> -28,
          f.6   -> -32,
          g.7   -> -36,
          h.8   -> -40,
          tmp.2 -> -44,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 48); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.SI)));
         (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.DX)));
         (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.CX)));
         (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.R8)));
         (Asm.Mov ((Asm.Imm 6), (Asm.Reg Asm.R9))); (Asm.Push (Asm.Imm 65));
         (Asm.Push (Asm.Imm 7)); (Asm.Call "foo"); (Asm.DeallocateStack 16);
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -44)));
         (Asm.Mov ((Asm.Stack -44), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 3;
         offset = -44;
         stack slots = {
           tmp.0 -> -4,
           tmp.1 -> -8,
           a.1   -> -12,
           b.2   -> -16,
           c.3   -> -20,
           d.4   -> -24,
           e.5   -> -28,
           f.6   -> -32,
           g.7   -> -36,
           h.8   -> -40,
           tmp.2 -> -44,
         }}}
     ])
