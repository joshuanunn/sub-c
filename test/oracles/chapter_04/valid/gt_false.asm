(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 12); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 2), (Asm.Reg Asm.R11)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.SetCC (Asm.G, (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 1), (Asm.Reg Asm.R11)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.SetCC (Asm.G, (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       Asm.Binary {bop = Asm.Add; src2 = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -12)};
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.AX))); Asm.Ret]})
