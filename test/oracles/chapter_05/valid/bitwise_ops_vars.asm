(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 3), (Asm.Stack -16)));
       (Asm.Mov ((Asm.Imm 5), (Asm.Stack -20)));
       (Asm.Mov ((Asm.Imm 8), (Asm.Stack -28)));
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
       (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
       Asm.Binary {op = Asm.BwAnd; src = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -24)};
       (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -32)));
       (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
       Asm.Binary {op = Asm.BwOr; src = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -32)};
       (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
