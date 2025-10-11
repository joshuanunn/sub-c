(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8);
       Asm.Mov {src = (Asm.Imm 3); dst = (Asm.Stack -4)};
       Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.R11)};
       Asm.Binary {bop = Asm.Mult; src2 = (Asm.Imm 4);
         dst = (Asm.Reg Asm.R11)};
       Asm.Mov {src = (Asm.Reg Asm.R11); dst = (Asm.Stack -4)};
       Asm.Mov {src = (Asm.Imm 2); dst = (Asm.Stack -8)};
       Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.R10)};
       Asm.Binary {bop = Asm.Add; src2 = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -8)};
       Asm.Mov {src = (Asm.Stack -8); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
