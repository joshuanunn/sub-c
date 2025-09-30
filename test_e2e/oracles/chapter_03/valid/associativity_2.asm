(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8);
       Asm.Mov {src = (Asm.Imm 6); dst = (Asm.Reg Asm.AX)}; Asm.Cdq;
       Asm.Mov {src = (Asm.Imm 3); dst = (Asm.Reg Asm.R10)};
       (Asm.Idiv (Asm.Reg Asm.R10));
       Asm.Mov {src = (Asm.Reg Asm.AX); dst = (Asm.Stack -4)};
       Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.AX)}; Asm.Cdq;
       Asm.Mov {src = (Asm.Imm 2); dst = (Asm.Reg Asm.R10)};
       (Asm.Idiv (Asm.Reg Asm.R10));
       Asm.Mov {src = (Asm.Reg Asm.AX); dst = (Asm.Stack -8)};
       Asm.Mov {src = (Asm.Stack -8); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
