(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.DI))); (Asm.Call "f");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 2;
        offset = -16;
        stack slots = {
          a.0   -> -4,
          tmp.0 -> -8,
          tmp.1 -> -12,
          a.2   -> -16,
        }}};
     Asm.Function {name = "f"; global = true;
       instructions =
       [(Asm.AllocateStack 16);
         (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R11)));
         Asm.Binary {op = Asm.Mult; src = (Asm.Imm 2);
           dst = (Asm.Reg Asm.R11)};
         (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 2;
         offset = -16;
         stack slots = {
           a.0   -> -4,
           tmp.0 -> -8,
           tmp.1 -> -12,
           a.2   -> -16,
         }}}
     ])
