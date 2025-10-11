(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8); (Asm.Mov ((Asm.Imm 7), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 5), (Asm.Reg Asm.R11)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.SetCC (Asm.NE, (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 5), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       Asm.Binary {bop = Asm.BwOr; src2 = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -8)};
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret]})
