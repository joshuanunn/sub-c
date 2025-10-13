(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 36); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -28)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
       (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -32)));
       (Asm.Mov ((Asm.Imm 3), (Asm.Stack -20)));
       (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R11)));
       Asm.Binary {op = Asm.Mult; src = (Asm.Stack -32);
         dst = (Asm.Reg Asm.R11)};
       (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -20)));
       (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
       (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -36)));
       (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.R10)));
       Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -36)};
       (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
