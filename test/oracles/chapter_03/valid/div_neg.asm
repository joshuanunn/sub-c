(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8);
       Asm.Mov {src = (Asm.Imm 12); dst = (Asm.Stack -4)};
       Asm.Unary {uop = Asm.Neg; dst = (Asm.Stack -4)};
       Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.AX)}; Asm.Cdq;
       Asm.Mov {src = (Asm.Imm 5); dst = (Asm.Reg Asm.R10)};
       (Asm.Idiv (Asm.Reg Asm.R10));
       Asm.Mov {src = (Asm.Reg Asm.AX); dst = (Asm.Stack -8)};
       Asm.Mov {src = (Asm.Stack -8); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
