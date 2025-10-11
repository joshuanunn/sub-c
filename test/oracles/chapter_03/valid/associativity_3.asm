(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 20); (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.AX)));
       Asm.Cdq; (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.R10)));
       (Asm.Idiv (Asm.Reg Asm.R10));
       (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R11)));
       Asm.Binary {op = Asm.Mult; src = (Asm.Imm 4); dst = (Asm.Reg Asm.R11)};
       (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Imm 5), (Asm.Stack -12)));
       Asm.Binary {op = Asm.Sub; src = (Asm.Imm 4); dst = (Asm.Stack -12)};
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 3); dst = (Asm.Stack -16)};
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
       Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -20)};
       (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.AX))); Asm.Ret]})
