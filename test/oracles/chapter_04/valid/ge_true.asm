(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 1), (Asm.Reg Asm.R11)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.SetCC (Asm.GE, (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 4), (Asm.Stack -8)));
       Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -8)};
       (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Stack -8), (Asm.Reg Asm.R11)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
       (Asm.SetCC (Asm.GE, (Asm.Stack -12)));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
       Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -16)};
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.AX))); Asm.Ret]})
