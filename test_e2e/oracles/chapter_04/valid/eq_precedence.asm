(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8);
       Asm.Mov {src = (Asm.Imm 3); dst = (Asm.Reg Asm.R11)};
       (Asm.Cmp ((Asm.Imm 1), (Asm.Reg Asm.R11)));
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Stack -4)};
       (Asm.SetCC (Asm.E, (Asm.Stack -4)));
       (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -4)));
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Stack -8)};
       (Asm.SetCC (Asm.NE, (Asm.Stack -8)));
       Asm.Mov {src = (Asm.Stack -8); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
