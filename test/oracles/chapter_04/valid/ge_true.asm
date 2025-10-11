(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 16);
       Asm.Mov {src = (Asm.Imm 1); dst = (Asm.Reg Asm.R11)};
       (Asm.Cmp ((Asm.Imm 1), (Asm.Reg Asm.R11)));
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Stack -4)};
       (Asm.SetCC (Asm.GE, (Asm.Stack -4)));
       Asm.Mov {src = (Asm.Imm 4); dst = (Asm.Stack -8)};
       Asm.Unary {uop = Asm.Neg; dst = (Asm.Stack -8)};
       Asm.Mov {src = (Asm.Imm 1); dst = (Asm.Reg Asm.R11)};
       (Asm.Cmp ((Asm.Stack -8), (Asm.Reg Asm.R11)));
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Stack -12)};
       (Asm.SetCC (Asm.GE, (Asm.Stack -12)));
       Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.R10)};
       Asm.Mov {src = (Asm.Reg Asm.R10); dst = (Asm.Stack -16)};
       Asm.Mov {src = (Asm.Stack -12); dst = (Asm.Reg Asm.R10)};
       Asm.Binary {bop = Asm.Add; src2 = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -16)};
       Asm.Mov {src = (Asm.Stack -16); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
