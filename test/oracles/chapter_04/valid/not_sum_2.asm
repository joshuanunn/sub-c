(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8); (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4)));
       Asm.Binary {bop = Asm.Sub; src2 = (Asm.Imm 44); dst = (Asm.Stack -4)};
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.SetCC (Asm.E, (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret]})
