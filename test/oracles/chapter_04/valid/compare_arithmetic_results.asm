(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 20); (Asm.Mov ((Asm.Imm 2), (Asm.Stack -4)));
       Asm.Unary {uop = Asm.BwNot; dst = (Asm.Stack -4)};
       (Asm.Mov ((Asm.Imm 2), (Asm.Stack -8)));
       Asm.Unary {uop = Asm.Neg; dst = (Asm.Stack -8)};
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R11)));
       Asm.Binary {bop = Asm.Mult; src2 = (Asm.Stack -8);
         dst = (Asm.Reg Asm.R11)};
       (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -12)));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -16)));
       Asm.Binary {bop = Asm.Add; src2 = (Asm.Imm 5); dst = (Asm.Stack -16)};
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
       (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
       (Asm.SetCC (Asm.E, (Asm.Stack -20)));
       (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.AX))); Asm.Ret]})
