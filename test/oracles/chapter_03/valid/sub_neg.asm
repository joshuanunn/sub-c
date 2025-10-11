(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       Asm.Unary {uop = Asm.Neg; dst = (Asm.Stack -4)};
       (Asm.Mov ((Asm.Imm 2), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       Asm.Binary {bop = Asm.Sub; src2 = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -8)};
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret]})
