(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4);
       Asm.Mov {src = (Asm.Imm 15); dst = (Asm.Reg Asm.R11)};
       (Asm.Cmp ((Asm.Imm 10), (Asm.Reg Asm.R11)));
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Stack -4)};
       (Asm.SetCC (Asm.G, (Asm.Stack -4)));
       Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
