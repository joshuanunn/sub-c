(Asm.Program
   [Asm.Function {name = "main";
      instructions =
      [(Asm.AllocateStack 80); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 2), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 2), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 20), (Asm.Stack -56)));
        (Asm.Mov ((Asm.Stack -56), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 5), (Asm.Stack -60)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -64)));
        (Asm.Mov ((Asm.Stack -60), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -64)};
        (Asm.Mov ((Asm.Stack -64), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -68)));
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -68)};
        (Asm.Mov ((Asm.Stack -68), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -72)));
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -72)};
        (Asm.Mov ((Asm.Stack -72), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 3;
        offset = -72;
        stack slots = {
          a.0      -> -4,
          result.1 -> -8,
          a1.2     -> -12,
          a.3      -> -16,
          a1.4     -> -20,
          a.5      -> -24,
          a.6      -> -28,
          a.7      -> -32,
          a.8      -> -36,
          a.9      -> -40,
          a.10     -> -44,
          a.11     -> -48,
          a.12     -> -52,
          a.13     -> -56,
          a.14     -> -60,
          tmp.0    -> -64,
          tmp.1    -> -68,
          tmp.2    -> -72,
        }}}
     ])
