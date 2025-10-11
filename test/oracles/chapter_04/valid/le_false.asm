(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       Asm.Unary {uop = Asm.Neg; dst = (Asm.Stack -4)};
       (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Stack -4), (Asm.Reg Asm.R11)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.SetCC (Asm.LE, (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret]})
