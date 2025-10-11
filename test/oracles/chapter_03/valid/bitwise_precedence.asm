(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 20);
       Asm.Mov {src = (Asm.Imm 80); dst = (Asm.Stack -4)};
       (Asm.Sar ((Asm.Imm 2), (Asm.Stack -4)));
       Asm.Mov {src = (Asm.Imm 7); dst = (Asm.Stack -8)};
       (Asm.Shl ((Asm.Imm 1), (Asm.Stack -8)));
       Asm.Mov {src = (Asm.Imm 5); dst = (Asm.Stack -12)};
       Asm.Mov {src = (Asm.Stack -8); dst = (Asm.Reg Asm.R10)};
       Asm.Binary {bop = Asm.BwAnd; src2 = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -12)};
       Asm.Mov {src = (Asm.Imm 1); dst = (Asm.Stack -16)};
       Asm.Mov {src = (Asm.Stack -12); dst = (Asm.Reg Asm.R10)};
       Asm.Binary {bop = Asm.BwXor; src2 = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -16)};
       Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.R10)};
       Asm.Mov {src = (Asm.Reg Asm.R10); dst = (Asm.Stack -20)};
       Asm.Mov {src = (Asm.Stack -16); dst = (Asm.Reg Asm.R10)};
       Asm.Binary {bop = Asm.BwOr; src2 = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -20)};
       Asm.Mov {src = (Asm.Stack -20); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
