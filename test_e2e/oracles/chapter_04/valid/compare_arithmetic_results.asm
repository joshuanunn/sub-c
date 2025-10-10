(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 20);
       Asm.Mov {src = (Asm.Imm 2); dst = (Asm.Stack -4)};
       Asm.Unary {uop = Asm.BwNot; dst = (Asm.Stack -4)};
       Asm.Mov {src = (Asm.Imm 2); dst = (Asm.Stack -8)};
       Asm.Unary {uop = Asm.Neg; dst = (Asm.Stack -8)};
       Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.R10)};
       Asm.Mov {src = (Asm.Reg Asm.R10); dst = (Asm.Stack -12)};
       Asm.Mov {src = (Asm.Stack -12); dst = (Asm.Reg Asm.R11)};
       Asm.Binary {bop = Asm.Mult; src2 = (Asm.Stack -8);
         dst = (Asm.Reg Asm.R11)};
       Asm.Mov {src = (Asm.Reg Asm.R11); dst = (Asm.Stack -12)};
       Asm.Mov {src = (Asm.Imm 1); dst = (Asm.Stack -16)};
       Asm.Binary {bop = Asm.Add; src2 = (Asm.Imm 5); dst = (Asm.Stack -16)};
       Asm.Mov {src = (Asm.Stack -16); dst = (Asm.Reg Asm.R10)};
       (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Stack -20)};
       (Asm.SetCC (Asm.E, (Asm.Stack -20)));
       Asm.Mov {src = (Asm.Stack -20); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
