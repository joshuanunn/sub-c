(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4);
       Asm.Mov {src = (Asm.Imm 35); dst = (Asm.Stack -4)};
       (Asm.Shl ((Asm.Imm 2), (Asm.Stack -4)));
       Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
