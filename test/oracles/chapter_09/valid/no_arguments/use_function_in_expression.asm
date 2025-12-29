(Asm.Program
   [Asm.Function {name = "bar"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 9), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 6;
        offset = -24;
        stack slots = {
          tmp.0 -> -4,
          tmp.1 -> -8,
          tmp.2 -> -12,
          tmp.3 -> -16,
          tmp.4 -> -20,
          tmp.5 -> -24,
        }}};
     Asm.Function {name = "foo"; global = true;
       instructions =
       [(Asm.AllocateStack 32); (Asm.Call "bar");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 2), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R11)));
         Asm.Binary {op = Asm.Mult; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.R11)};
         (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 6;
         offset = -24;
         stack slots = {
           tmp.0 -> -4,
           tmp.1 -> -8,
           tmp.2 -> -12,
           tmp.3 -> -16,
           tmp.4 -> -20,
           tmp.5 -> -24,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 32); (Asm.Call "foo");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -12))); (Asm.Call "bar");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.AX))); Asm.Cdq;
         (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.R10)));
         (Asm.Idiv (Asm.Reg Asm.R10));
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -20)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
         (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
         Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -24)};
         (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 6;
         offset = -24;
         stack slots = {
           tmp.0 -> -4,
           tmp.1 -> -8,
           tmp.2 -> -12,
           tmp.3 -> -16,
           tmp.4 -> -20,
           tmp.5 -> -24,
         }}}
     ])
