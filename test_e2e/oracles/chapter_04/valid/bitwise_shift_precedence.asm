(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 12);
       Asm.Mov {src = (Asm.Imm 20); dst = (Asm.Stack -4)};
       (Asm.Sar ((Asm.Imm 4), (Asm.Stack -4)));
       Asm.Mov {src = (Asm.Imm 3); dst = (Asm.Stack -8)};
       (Asm.Shl ((Asm.Imm 1), (Asm.Stack -8)));
       Asm.Mov {src = (Asm.Stack -8); dst = (Asm.Reg Asm.R10)};
       (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -4)));
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Stack -12)};
       (Asm.SetCC (Asm.LE, (Asm.Stack -12)));
       Asm.Mov {src = (Asm.Stack -12); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
