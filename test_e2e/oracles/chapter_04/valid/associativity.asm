(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 12);
       Asm.Mov {src = (Asm.Imm 5); dst = (Asm.Reg Asm.R11)};
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Stack -4)};
       (Asm.SetCC (Asm.GE, (Asm.Stack -4)));
       (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -4)));
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Stack -8)};
       (Asm.SetCC (Asm.G, (Asm.Stack -8)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Stack -12)};
       (Asm.SetCC (Asm.LE, (Asm.Stack -12)));
       Asm.Mov {src = (Asm.Stack -12); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
