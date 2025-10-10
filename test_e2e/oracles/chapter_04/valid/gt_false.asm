(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 12);
       Asm.Mov {src = (Asm.Imm 1); dst = (Asm.Reg Asm.R11)};
       (Asm.Cmp ((Asm.Imm 2), (Asm.Reg Asm.R11)));
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Stack -4)};
       (Asm.SetCC (Asm.G, (Asm.Stack -4)));
       Asm.Mov {src = (Asm.Imm 1); dst = (Asm.Reg Asm.R11)};
       (Asm.Cmp ((Asm.Imm 1), (Asm.Reg Asm.R11)));
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Stack -8)};
       (Asm.SetCC (Asm.G, (Asm.Stack -8)));
       Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.R10)};
       Asm.Mov {src = (Asm.Reg Asm.R10); dst = (Asm.Stack -12)};
       Asm.Mov {src = (Asm.Stack -8); dst = (Asm.Reg Asm.R10)};
       Asm.Binary {bop = Asm.Add; src2 = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -12)};
       Asm.Mov {src = (Asm.Stack -12); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
