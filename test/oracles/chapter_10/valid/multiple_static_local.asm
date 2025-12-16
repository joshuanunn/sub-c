(Asm.Program
   [Asm.Function {name = "foo"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 3), (Asm.Data "a.0")));
        (Asm.Mov ((Asm.Data "a.0"), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R11)));
        Asm.Binary {op = Asm.Mult; src = (Asm.Imm 2); dst = (Asm.Reg Asm.R11)};
        (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "a.0")));
        (Asm.Mov ((Asm.Data "a.0"), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 1;
        offset = -8;
        stack slots = {
          a.0   -> -4,
          tmp.0 -> -8,
        }}};
     Asm.Function {name = "bar"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 4), (Asm.Data "a.1")));
         (Asm.Mov ((Asm.Data "a.1"), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
         Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -8)};
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "a.1")));
         (Asm.Mov ((Asm.Data "a.1"), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 1;
         offset = -8;
         stack slots = {
           a.1   -> -4,
           tmp.0 -> -8,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 32); (Asm.Call "foo");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4))); (Asm.Call "bar");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
         Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -12)};
         (Asm.Call "foo"); (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
         Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -20)};
         (Asm.Call "bar"); (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -24)));
         (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
         (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
         Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -28)};
         (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 7;
         offset = -28;
         stack slots = {
           tmp.0 -> -4,
           tmp.1 -> -8,
           tmp.2 -> -12,
           tmp.3 -> -16,
           tmp.4 -> -20,
           tmp.5 -> -24,
           tmp.6 -> -28,
         }}};
     Asm.StaticVariable {name = "a.1"; global = false; init = 4};
     Asm.StaticVariable {name = "a.0"; global = false; init = 3}])
