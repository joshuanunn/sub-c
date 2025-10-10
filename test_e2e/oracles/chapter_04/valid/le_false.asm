(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8);
       Asm.Mov {src = (Asm.Imm 1); dst = (Asm.Stack -4)};
       Asm.Unary {uop = Asm.Neg; dst = (Asm.Stack -4)};
       Asm.Mov {src = (Asm.Imm 1); dst = (Asm.Reg Asm.R11)};
       (Asm.Cmp ((Asm.Stack -4), (Asm.Reg Asm.R11)));
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Stack -8)};
       (Asm.SetCC (Asm.LE, (Asm.Stack -8)));
       Asm.Mov {src = (Asm.Stack -8); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
