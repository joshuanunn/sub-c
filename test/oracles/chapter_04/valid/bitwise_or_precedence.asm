(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8);
       Asm.Mov {src = (Asm.Imm 7); dst = (Asm.Reg Asm.R11)};
       (Asm.Cmp ((Asm.Imm 5), (Asm.Reg Asm.R11)));
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Stack -4)};
       (Asm.SetCC (Asm.NE, (Asm.Stack -4)));
       Asm.Mov {src = (Asm.Imm 5); dst = (Asm.Stack -8)};
       Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.R10)};
       Asm.Binary {bop = Asm.BwOr; src2 = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -8)};
       Asm.Mov {src = (Asm.Stack -8); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
