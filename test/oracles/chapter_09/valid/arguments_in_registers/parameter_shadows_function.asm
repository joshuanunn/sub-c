(Asm.Program
   [Asm.Function {name = "a";
      instructions =
      [(Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame = Env.lenv {
                counter = 0;
                offset = 0;
                stack slots = {
                }}};
     Asm.Function {name = "b";
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 0;
         offset = -4;
         stack slots = {
           a.0 -> -4,
         }}};
     Asm.Function {name = "main";
       instructions =
       [(Asm.AllocateStack 16); (Asm.Call "a");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.DI))); (Asm.Call "b");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
         Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -12)};
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
