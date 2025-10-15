(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 24); (Asm.Mov ((Asm.Imm 15), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       Asm.Binary {op = Asm.BwXor; src = (Asm.Imm 5); dst = (Asm.Stack -12)};
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -24)));
       (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
       Asm.Binary {op = Asm.BwOr; src = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -24)};
       (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
