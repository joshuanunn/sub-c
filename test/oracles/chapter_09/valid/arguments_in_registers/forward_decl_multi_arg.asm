(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.DI)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.SI))); (Asm.Call "foo");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 2;
        offset = -16;
        stack slots = {
          tmp.0 -> -4,
          tmp.1 -> -8,
          x.2   -> -12,
          y.3   -> -16,
        }}};
     Asm.Function {name = "foo"; global = true;
       instructions =
       [(Asm.AllocateStack 16);
         (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
         Asm.Binary {op = Asm.Sub; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -8)};
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 2;
         offset = -16;
         stack slots = {
           tmp.0 -> -4,
           tmp.1 -> -8,
           x.2   -> -12,
           y.3   -> -16,
         }}}
     ])
