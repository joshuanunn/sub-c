(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4);
       Asm.Mov {src = (Asm.Imm 2); dst = (Asm.Stack -4)};
       Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.R11)};
       Asm.Binary {bop = Asm.Mult; src2 = (Asm.Imm 3);
         dst = (Asm.Reg Asm.R11)};
       Asm.Mov {src = (Asm.Reg Asm.R11); dst = (Asm.Stack -4)};
       Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
