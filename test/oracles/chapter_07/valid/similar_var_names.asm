(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 72); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
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
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
