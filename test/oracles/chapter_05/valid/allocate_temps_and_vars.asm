(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 52);
       (Asm.Mov ((Asm.Imm 2147483646), (Asm.Stack -44)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
       (Asm.Mov ((Asm.Stack -44), (Asm.Reg Asm.AX))); Asm.Cdq;
       (Asm.Mov ((Asm.Imm 6), (Asm.Reg Asm.R10)));
       (Asm.Idiv (Asm.Reg Asm.R10));
       (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -16)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
       (Asm.SetCC (Asm.E, (Asm.Stack -24)));
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
       (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
       Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -28)};
       (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -36)));
       (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -40)));
       (Asm.Mov ((Asm.Stack -40), (Asm.Reg Asm.R11)));
       Asm.Binary {op = Asm.Mult; src = (Asm.Imm 2); dst = (Asm.Reg Asm.R11)};
       (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -40)));
       (Asm.Mov ((Asm.Stack -44), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -48)));
       Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1431655762);
         dst = (Asm.Stack -48)};
       (Asm.Mov ((Asm.Stack -48), (Asm.Reg Asm.R10)));
       (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -40)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -52)));
       (Asm.SetCC (Asm.E, (Asm.Stack -52)));
       (Asm.Mov ((Asm.Stack -52), (Asm.Reg Asm.AX))); Asm.Ret]})
