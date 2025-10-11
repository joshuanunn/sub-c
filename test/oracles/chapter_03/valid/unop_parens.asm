(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       Asm.Binary {bop = Asm.Add; src2 = (Asm.Imm 1); dst = (Asm.Stack -4)};
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
       Asm.Unary {uop = Asm.BwNot; dst = (Asm.Stack -8)};
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret]})
