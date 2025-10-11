(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 20);
       Asm.Mov {src = (Asm.Imm 2); dst = (Asm.Stack -4)};
       Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.R11)};
       Asm.Binary {bop = Asm.Mult; src2 = (Asm.Imm 2);
         dst = (Asm.Reg Asm.R11)};
       Asm.Mov {src = (Asm.Reg Asm.R11); dst = (Asm.Stack -4)};
       Asm.Mov {src = (Asm.Imm 4); dst = (Asm.Stack -8)};
       Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.CX)};
       (Asm.Shl ((Asm.Reg Asm.CL), (Asm.Stack -8)));
       Asm.Mov {src = (Asm.Imm 1); dst = (Asm.Stack -12)};
       Asm.Binary {bop = Asm.Add; src2 = (Asm.Imm 2); dst = (Asm.Stack -12)};
       Asm.Mov {src = (Asm.Imm 100); dst = (Asm.Stack -16)};
       Asm.Mov {src = (Asm.Stack -12); dst = (Asm.Reg Asm.CX)};
       (Asm.Sar ((Asm.Reg Asm.CL), (Asm.Stack -16)));
       Asm.Mov {src = (Asm.Stack -8); dst = (Asm.Reg Asm.R10)};
       Asm.Mov {src = (Asm.Reg Asm.R10); dst = (Asm.Stack -20)};
       Asm.Mov {src = (Asm.Stack -16); dst = (Asm.Reg Asm.R10)};
       Asm.Binary {bop = Asm.Add; src2 = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -20)};
       Asm.Mov {src = (Asm.Stack -20); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
