(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 12);
       Asm.Mov {src = (Asm.Imm 4); dst = (Asm.Stack -4)};
       Asm.Binary {bop = Asm.Add; src2 = (Asm.Imm 12); dst = (Asm.Stack -4)};
       Asm.Mov {src = (Asm.Imm 40); dst = (Asm.Stack -8)};
       Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.CX)};
       Asm.Shl {src = (Asm.Reg Asm.CL); dst = (Asm.Stack -8)};
       Asm.Mov {src = (Asm.Stack -8); dst = (Asm.Reg Asm.R10)};
       Asm.Mov {src = (Asm.Reg Asm.R10); dst = (Asm.Stack -12)};
       Asm.Sar {src = (Asm.Imm 1); dst = (Asm.Stack -12)};
       Asm.Mov {src = (Asm.Stack -12); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
