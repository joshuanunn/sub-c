(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 20); (Asm.Mov ((Asm.Imm 5), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R11)));
       Asm.Binary {bop = Asm.Mult; src2 = (Asm.Imm 4);
         dst = (Asm.Reg Asm.R11)};
       (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Cdq;
       (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.R10)));
       (Asm.Idiv (Asm.Reg Asm.R10));
       (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Imm 2), (Asm.Stack -12)));
       Asm.Binary {bop = Asm.Add; src2 = (Asm.Imm 1); dst = (Asm.Stack -12)};
       (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.AX))); Asm.Cdq;
       (Asm.Idiv (Asm.Stack -12));
       (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -16)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
       Asm.Binary {bop = Asm.Sub; src2 = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -20)};
       (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.AX))); Asm.Ret]})
