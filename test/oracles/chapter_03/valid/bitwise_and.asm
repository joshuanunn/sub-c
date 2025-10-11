(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4);
       Asm.Mov {src = (Asm.Imm 3); dst = (Asm.Stack -4)};
       Asm.Binary {bop = Asm.BwAnd; src2 = (Asm.Imm 5); dst = (Asm.Stack -4)};
       Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
