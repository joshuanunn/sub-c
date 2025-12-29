(Asm.Program
   [Asm.Function {name = "sub"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -4)};
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 3;
        offset = -24;
        stack slots = {
          tmp.0 -> -4,
          a.0   -> -8,
          b.1   -> -12,
          sum.2 -> -16,
          tmp.1 -> -20,
          tmp.2 -> -24,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 3), (Asm.Stack -20)));
         (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.SI))); (Asm.Call "sub");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -24)));
         (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 3;
         offset = -24;
         stack slots = {
           tmp.0 -> -4,
           a.0   -> -8,
           b.1   -> -12,
           sum.2 -> -16,
           tmp.1 -> -20,
           tmp.2 -> -24,
         }}}
     ])
