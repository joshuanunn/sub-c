(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 20); (Asm.Mov ((Asm.Imm 80), (Asm.Stack -4)));
       (Asm.Sar ((Asm.Imm 2), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 7), (Asm.Stack -8)));
       (Asm.Shl ((Asm.Imm 1), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Imm 5), (Asm.Stack -12)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       Asm.Binary {bop = Asm.BwAnd; src2 = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -12)};
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -16)));
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
       Asm.Binary {bop = Asm.BwXor; src2 = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -16)};
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
       Asm.Binary {bop = Asm.BwOr; src2 = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -20)};
       (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.AX))); Asm.Ret]})
