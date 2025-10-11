(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4); (Asm.Mov ((Asm.Imm 7), (Asm.Stack -4)));
       Asm.Binary {bop = Asm.BwXor; src2 = (Asm.Imm 1); dst = (Asm.Stack -4)};
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret]})
