(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4); (Asm.Mov ((Asm.Imm 12), (Asm.Stack -4)));
       Asm.Unary {uop = Asm.BwNot; dst = (Asm.Stack -4)};
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret]})
