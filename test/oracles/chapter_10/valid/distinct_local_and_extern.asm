(Asm.Program
   [Asm.Function {name = "return_a"; global = true;
      instructions =
      [(Asm.Mov ((Asm.Data "a"), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame = Env.lenv {
                counter = 0;
                offset = 0;
                stack slots = {
                }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 5), (Asm.Data "a")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -12)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.JmpCC (Asm.E, "if.en.1"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "if.en.1"); (Asm.Mov ((Asm.Imm 4), (Asm.Data "a")));
         (Asm.Call "return_a");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
         Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -20)};
         (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 4;
         offset = -20;
         stack slots = {
           a.0   -> -4,
           a     -> -8,
           tmp.0 -> -12,
           tmp.2 -> -16,
           tmp.3 -> -20,
         }}};
     Asm.StaticVariable {name = "a"; global = true; init = 5}])
